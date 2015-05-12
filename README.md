# gocd

This is a cookbook for provisioning a [Go CD](www.go.cd) server and agents.

## Supported Platforms

Currently the only tested platform is CentOS7 but there is some code supporting Debian/Ubuntu systems that could be expanded on.

## Attributes

The following are the attributes available for tweaking the configuration of a Go server.

<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['gocd']['autoregister']['key']</tt></td>
    <td>String</td>
    <td>Key to use for autoregistration of agents</td>
    <td><tt>EzBiaW3q9EiBtmz2KWztQRWxiLXtyYa3mBAgYzBRKtZMrryeo7 (change this in your own installation)</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['host']</tt></td>
    <td>String</td>
    <td>Hostname for the Go server</td>
    <td><tt>localhost</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['http_port']</tt></td>
    <td>String</td>
    <td>HTTP port used to serve the Go server</td>
    <td><tt>8153</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['https_port']</tt></td>
    <td>String</td>
    <td>HTTPS port used to serve the Go server</td>
    <td><tt>8154</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['min_mem']</tt></td>
    <td>String</td>
    <td>Startup memory size for Go server</td>
    <td><tt>512m</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['max_mem']</tt></td>
    <td>String</td>
    <td>Max memory size for Go server</td>
    <td><tt>1024m</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['min_perm_gen']</tt></td>
    <td>String</td>
    <td>Startup PermGen size for Go server</td>
    <td><tt>128m</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['server']['max_perm_gen']</tt></td>
    <td>String</td>
    <td>Max PermGen size for Go server</td>
    <td><tt>256m</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['agent']['resources']</tt></td>
    <td>String Array</td>
    <td>The resources that should be attached to this agent e.g. WINDOWS, HIGH_MEM</td>
    <td><tt>[]</tt></td>
  </tr>
  <tr>
    <td><tt>['gocd']['agent']['environments']</tt></td>
    <td>String Array</td>
    <td>The environments that this agent belongs to e.g. Production, UAT</td>
    <td><tt>[]</tt></td>
  </tr>
</table>

This cookbook makes use of the [Java](https://supermarket.chef.io/cookbooks/java/versions/1.31.0) cookbook so configure your Java version as per the attributes there. Because of [this](http://www.go.cd/2014/11/14/Go_14_3_issue_with_uploading_compressed_artifacts.html) error it's recommended you use the Oracle JDK.

## Usage

### gocd::server
This is responsible for installing a Go Server only. By default this will use the OpenJDK version 7.

### gocd:agent
This is responsible for installing a Go Agent only. By default this will use the OpenJDK version 7. It may make sense to wrap this with your own recipes to provide extra functionality required by your build agents.

Include `gocd` in your node's `run_list`:

## License and Authors

Author:: Nathan Jones (thenathanjones@gmail.com)
