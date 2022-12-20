# frozen_string_literal: true

json.array! @engineers, partial: 'engineers/engineer', as: :engineer
