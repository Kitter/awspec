require 'spec_helper'
Awspec::Stub.load 'route_table'

describe route_table('my-route-table') do
  it { should exist }
  it { should belong_to_vpc('my-vpc') }
  its(:route_table_id) { should eq 'rtb-a12bcd34' }
  it { should have_route('10.0.0.0/16').target(gateway: 'local') }
  it { should have_route('0.0.0.0/0').target(gateway: 'my-igw') }
end
