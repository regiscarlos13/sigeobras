# frozen_string_literal: true

module ChartGraph
  extend ActiveSupport::Concern

  def chart_data(labels)
    @chart_data = {
      labels:,
      datasets: chart_data_set
    }

    chart_options
  end

  def chart_options
    @chart_options = {
      scales: {
        yAxes: [{
          ticks: {
            beginAtZero: true
          }
        }]
      }
    }
  end
end
