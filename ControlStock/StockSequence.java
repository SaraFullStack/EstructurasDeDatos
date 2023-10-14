package ejemplo;

import ejemplo.IteratorIF;
import ejemplo.List;
import ejemplo.SequenceIF;

public class StockSequence implements StockIF {

    protected SequenceIF<StockPair> stock;

    public StockSequence() {
        stock = new List<>();
    }

    @Override
    public int retrieveStock(String p) {
        IteratorIF<StockPair> it = stock.iterator();
        while (it.hasNext()) {
            StockPair currentPair = it.getNext();
            if (currentPair.getProducto().equals(p)) {
                return currentPair.getUnidades();
            }
        }
        return -1;
    }

    @Override
    public void updateStock(String p, int u) {
        IteratorIF<StockPair> it = stock.iterator();
        while (it.hasNext()) {
            StockPair currentPair = it.getNext();
            if (currentPair.getProducto().equals(p)) {
                currentPair.setUnidades(u);
                return;
            }
        }
        ((List<StockPair>) stock).insert(stock.size() + 1, new StockPair(p, u));
    }

    @Override
    public SequenceIF<StockPair> listStock(String prefix) {
        List<StockPair> stockList = new List<>();
        IteratorIF<StockPair> it = stock.iterator();
        while (it.hasNext()) {
            StockPair currentPair = it.getNext();
            if (currentPair.getProducto().startsWith(prefix)) {
                stockList.insert(stockList.size() + 1, currentPair);
            }
        }
        return mergeSort(stockList, new StockPairComparator());
    }

	private List<StockPair> mergeSort(List<StockPair> stockList, StockPairComparator comparator) {
		if (stockList.size() <= 1) {
			return stockList;
		}

		int middle = stockList.size() / 2;
		List<StockPair> left = new List<>();
		List<StockPair> right = new List<>();

		for (int i = 1; i <= middle; i++) {
			left.insert(i, stockList.get(i));
		}

		for (int i = middle + 1; i <= stockList.size(); i++) {
			right.insert(i - middle, stockList.get(i));
		}

		left = mergeSort(left, comparator);
		right = mergeSort(right, comparator);

		return merge(left, right, comparator);
	}

	private List<StockPair> merge(List<StockPair> left, List<StockPair> right, StockPairComparator comparator) {
		List<StockPair> result = new List<>();

		int indexLeft = 1;
		int indexRight = 1;

		while (indexLeft <= left.size() && indexRight <= right.size()) {
			if (comparator.compare(left.get(indexLeft), right.get(indexRight)) <= 0) {
				result.insert(result.size() + 1, left.get(indexLeft));
				indexLeft++;
			} else {
				result.insert(result.size() + 1, right.get(indexRight));
				indexRight++;
			}
		}

		while (indexLeft <= left.size()) {
			result.insert(result.size() + 1, left.get(indexLeft));
			indexLeft++;
		}

		while (indexRight <= right.size()) {
			result.insert(result.size() + 1, right.get(indexRight));
			indexRight++;
		}

		return result;
	}

	private class StockPairComparator {
		public int compare(StockPair a, StockPair b) {
			return a.getProducto().compareTo(b.getProducto());
		}
	}
}
