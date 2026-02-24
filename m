Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957ED18DB2A;
	Tue, 24 Feb 2026 00:16:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771892196; cv=none; b=lwrkJiCIhKdPJF59amR3mxIKT50KC8B0rV+hrHKbQA24ZqqEdD2SnlqSN9n9ftS0zd0gJerK3vy9JvO4JQ5XwETXOMLbsmc7Zr7EFE4XkgVurUSLicwSlTVLe45/E/XD65lTyP1XZ49qWSGRsPm0m0KJoI1Nm7U97u/EMbisAzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771892196; c=relaxed/simple;
	bh=8UWLoqyjHuXt8wGgCY1fdj/lYq0SauhVKjIDWzdCcZ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OAZPalz2Bs5BnEsnp/TnZCJj2K+CJuV32TZMl+JV5Suxi4jPnMeKXpTNPcxcl0ifR4CDIzG1HYdea2A22ZGboXFVsqMaSar3afHn0w7RX/RuySWZUeWd4uyTThxldeYFoAEQb6nVBZRlVMEFXJrEbY73WygmkViOMbqy0ofoXcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gZkQbsf6; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gZkQbsf6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771892195; x=1803428195;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8UWLoqyjHuXt8wGgCY1fdj/lYq0SauhVKjIDWzdCcZ4=;
  b=gZkQbsf6UJMw4MMdl58EN0vT1//WlzX50hA5ykSwRlWoWn+4ksMIRAE8
   r3EpRpHq3Y3vq7pk0/dJ8n5RWCylNlHVtaVOQRFElghssQKLd6Scx4c90
   tY4Cb5nTohW2y0e/c/NQ+g5OeQdLsL/5bqp/42H1u4EiGwif/poUC5kbF
   C1FWLmXTcMG1DxQGo0z+RHrS+X2/V7YDYKcPSUCOEIesDUXTSnMqfbtAX
   yL4RFOXZ+zApRei6Z3yGEZnQBznVEJ0trY8OU47Iatwj8AN9aFqpOnrMn
   6bNUPiVr0i7OvBqeOlJ64WjPSfXDcMjJ7ySrj+e/RboC283eV6KDuuGAX
   Q==;
X-CSE-ConnectionGUID: yF7Xr9KOSOa4UnXdl9X2jw==
X-CSE-MsgGUID: OdqFXtz2TZqjfLoc9irVQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="83223203"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="83223203"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 16:15:16 -0800
X-CSE-ConnectionGUID: qfMljPzVRcSrWMFejors+A==
X-CSE-MsgGUID: nb65xh1qRvGoaI9ASLGNvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215879038"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 23 Feb 2026 16:15:13 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vug51-00000000117-073y;
	Tue, 24 Feb 2026 00:15:11 +0000
Date: Tue, 24 Feb 2026 08:14:50 +0800
From: kernel test robot <lkp@intel.com>
To: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>, vaibhav.sr@gmail.com,
	mgreer@animalcreek.com
Cc: oe-kbuild-all@lists.linux.dev, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: move topology allocation to codec probe
Message-ID: <202602240844.4eT24iVh-lkp@intel.com>
References: <20260223195939.71151-1-azpijr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223195939.71151-1-azpijr@gmail.com>

Hi Jose,

kernel test robot noticed the following build errors:

[auto build test ERROR on staging/staging-testing]

url:    https://github.com/intel-lab-lkp/linux/commits/Jose-A-Perez-de-Azpillaga/staging-greybus-move-topology-allocation-to-codec-probe/20260224-040440
base:   staging/staging-testing
patch link:    https://lore.kernel.org/r/20260223195939.71151-1-azpijr%40gmail.com
patch subject: [PATCH] staging: greybus: move topology allocation to codec probe
config: parisc-randconfig-001-20260224 (https://download.01.org/0day-ci/archive/20260224/202602240844.4eT24iVh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260224/202602240844.4eT24iVh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602240844.4eT24iVh-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/staging/greybus/audio_module.c: In function 'gb_audio_probe':
>> drivers/staging/greybus/audio_module.c:327:10: error: 'struct gb_audio_topology' has no member named 'size'
     327 |  topology->size = cpu_to_le16(size);
         |          ^~
>> drivers/staging/greybus/audio_module.c:329:60: error: passing argument 2 of 'gb_audio_gb_get_topology' from incompatible pointer type [-Werror=incompatible-pointer-types]
     329 |  ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
         |                                                            ^~~~~~~~
         |                                                            |
         |                                                            struct gb_audio_topology *
   In file included from drivers/staging/greybus/audio_module.c:12:
   drivers/staging/greybus/audio_codec.h:182:36: note: expected 'struct gb_audio_topology **' but argument is of type 'struct gb_audio_topology *'
     182 |         struct gb_audio_topology **topology);
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~
   cc1: some warnings being treated as errors
--
>> drivers/staging/greybus/audio_gb.c:11:5: error: conflicting types for 'gb_audio_gb_get_topology'
      11 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' was here
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:14,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/parisc/include/uapi/asm/byteorder.h:5,
                    from arch/parisc/include/asm/bitops.h:11,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:105:31: note: in definition of macro '__swab16'
     105 |  (__u16)(__builtin_constant_p(x) ? \
         |                               ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:106:2: note: in expansion of macro '___constant_swab16'
     106 |  ___constant_swab16(x) :   \
         |  ^~~~~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:16:12: note: in definition of macro '___constant_swab16'
      16 |  (((__u16)(x) & (__u16)0xff00U) >> 8)))
         |            ^
   include/uapi/linux/byteorder/big_endian.h:37:26: note: in expansion of macro '__swab16'
      37 | #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
         |                          ^~~~~~~~
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
>> drivers/staging/greybus/audio_gb.c:15:43: error: 'struct gb_audio_topology' has no member named 'size'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                                           ^~
   include/uapi/linux/swab.h:107:12: note: in definition of macro '__swab16'
     107 |  __fswab16(x))
         |            ^
   include/linux/byteorder/generic.h:91:21: note: in expansion of macro '__le16_to_cpu'
      91 | #define le16_to_cpu __le16_to_cpu
         |                     ^~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:15:23: note: in expansion of macro 'le16_to_cpu'
      15 |    NULL, 0, topology, le16_to_cpu(topology->size));
         |                       ^~~~~~~~~~~
   In file included from include/linux/linkage.h:7,
                    from include/linux/kernel.h:18,
                    from include/linux/greybus.h:14,
                    from drivers/staging/greybus/audio_gb.c:8:
   drivers/staging/greybus/audio_gb.c: At top level:
   drivers/staging/greybus/audio_gb.c:17:19: error: conflicting types for 'gb_audio_gb_get_topology'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         |                   ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/export.h:76:21: note: in definition of macro '__EXPORT_SYMBOL'
      76 |  extern typeof(sym) sym;     \
         |                     ^~~
   include/linux/export.h:90:33: note: in expansion of macro '_EXPORT_SYMBOL'
      90 | #define EXPORT_SYMBOL_GPL(sym)  _EXPORT_SYMBOL(sym, "GPL")
         |                                 ^~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c:17:1: note: in expansion of macro 'EXPORT_SYMBOL_GPL'
      17 | EXPORT_SYMBOL_GPL(gb_audio_gb_get_topology);
         | ^~~~~~~~~~~~~~~~~
   In file included from drivers/staging/greybus/audio_gb.c:9:
   drivers/staging/greybus/audio_codec.h:181:5: note: previous declaration of 'gb_audio_gb_get_topology' was here
     181 | int gb_audio_gb_get_topology(struct gb_connection *connection,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/staging/greybus/audio_gb.c: In function 'gb_audio_gb_get_topology':
>> drivers/staging/greybus/audio_gb.c:16:1: warning: control reaches end of non-void function [-Wreturn-type]
      16 | }
         | ^


vim +327 drivers/staging/greybus/audio_module.c

   228	
   229	/*
   230	 * This is the basic hook get things initialized and registered w/ gb
   231	 */
   232	
   233	static int gb_audio_probe(struct gb_bundle *bundle,
   234				  const struct greybus_bundle_id *id)
   235	{
   236		struct device *dev = &bundle->dev;
   237		struct gbaudio_module_info *gbmodule;
   238		struct greybus_descriptor_cport *cport_desc;
   239		struct gb_audio_manager_module_descriptor desc;
   240		struct gbaudio_data_connection *dai, *_dai;
   241		int ret, i;
   242		struct gb_audio_topology *topology;
   243		struct gb_audio_get_topology_size_response size_resp;
   244		u16 size;
   245	
   246		/* There should be at least one Management and one Data cport */
   247		if (bundle->num_cports < 2)
   248			return -ENODEV;
   249	
   250		/*
   251		 * There can be only one Management connection and any number of data
   252		 * connections.
   253		 */
   254		gbmodule = devm_kzalloc(dev, sizeof(*gbmodule), GFP_KERNEL);
   255		if (!gbmodule)
   256			return -ENOMEM;
   257	
   258		gbmodule->num_data_connections = bundle->num_cports - 1;
   259		INIT_LIST_HEAD(&gbmodule->data_list);
   260		INIT_LIST_HEAD(&gbmodule->widget_list);
   261		INIT_LIST_HEAD(&gbmodule->ctl_list);
   262		INIT_LIST_HEAD(&gbmodule->widget_ctl_list);
   263		INIT_LIST_HEAD(&gbmodule->jack_list);
   264		gbmodule->dev = dev;
   265		snprintf(gbmodule->name, sizeof(gbmodule->name), "%s.%s", dev->driver->name,
   266			 dev_name(dev));
   267		greybus_set_drvdata(bundle, gbmodule);
   268	
   269		/* Create all connections */
   270		for (i = 0; i < bundle->num_cports; i++) {
   271			cport_desc = &bundle->cport_desc[i];
   272	
   273			switch (cport_desc->protocol_id) {
   274			case GREYBUS_PROTOCOL_AUDIO_MGMT:
   275				ret = gb_audio_add_mgmt_connection(gbmodule, cport_desc,
   276								   bundle);
   277				if (ret)
   278					goto destroy_connections;
   279				break;
   280			case GREYBUS_PROTOCOL_AUDIO_DATA:
   281				ret = gb_audio_add_data_connection(gbmodule, cport_desc,
   282								   bundle);
   283				if (ret)
   284					goto destroy_connections;
   285				break;
   286			default:
   287				dev_err(dev, "Unsupported protocol: 0x%02x\n",
   288					cport_desc->protocol_id);
   289				ret = -ENODEV;
   290				goto destroy_connections;
   291			}
   292		}
   293	
   294		/* There must be a management cport */
   295		if (!gbmodule->mgmt_connection) {
   296			ret = -EINVAL;
   297			dev_err(dev, "Missing management connection\n");
   298			goto destroy_connections;
   299		}
   300	
   301		/* Initialize management connection */
   302		ret = gb_connection_enable(gbmodule->mgmt_connection);
   303		if (ret) {
   304			dev_err(dev, "%d: Error while enabling mgmt connection\n", ret);
   305			goto destroy_connections;
   306		}
   307		gbmodule->dev_id = gbmodule->mgmt_connection->intf->interface_id;
   308	
   309		ret = gb_operation_sync(gbmodule->mgmt_connection,
   310					GB_AUDIO_TYPE_GET_TOPOLOGY_SIZE, NULL, 0,
   311				&size_resp, sizeof(size_resp));
   312		if (ret)
   313			goto disable_connection;
   314	
   315		size = le16_to_cpu(size_resp.size);
   316		if (size < sizeof(*topology)) {
   317			ret = -ENODATA;
   318			goto disable_connection;
   319		}
   320	
   321		topology = kzalloc(size, GFP_KERNEL);
   322		if (!topology) {
   323			ret = -ENOMEM;
   324			goto disable_connection;
   325		}
   326	
 > 327		topology->size = cpu_to_le16(size);
   328	
 > 329		ret = gb_audio_gb_get_topology(gbmodule->mgmt_connection, topology);
   330		if (ret) {
   331			dev_err(dev, "%d:Error while fetching topology\n", ret);
   332			kfree(topology);
   333			goto disable_connection;
   334		}
   335	
   336		/* process topology data */
   337		ret = gbaudio_tplg_parse_data(gbmodule, topology);
   338		if (ret) {
   339			dev_err(dev, "%d:Error while parsing topology data\n",
   340				ret);
   341			goto free_topology;
   342		}
   343		gbmodule->topology = topology;
   344	
   345		/* Initialize data connections */
   346		list_for_each_entry(dai, &gbmodule->data_list, list) {
   347			ret = gb_connection_enable(dai->connection);
   348			if (ret) {
   349				dev_err(dev,
   350					"%d:Error while enabling %d:data connection\n",
   351					ret, le16_to_cpu(dai->data_cport));
   352				goto disable_data_connection;
   353			}
   354		}
   355	
   356		/* register module with gbcodec */
   357		ret = gbaudio_register_module(gbmodule);
   358		if (ret)
   359			goto disable_data_connection;
   360	
   361		/* inform above layer for uevent */
   362		dev_dbg(dev, "Inform set_event:%d to above layer\n", 1);
   363		/* prepare for the audio manager */
   364		strscpy(desc.name, gbmodule->name, sizeof(desc.name));
   365		desc.vid = 2; /* todo */
   366		desc.pid = 3; /* todo */
   367		desc.intf_id = gbmodule->dev_id;
   368		desc.op_devices = gbmodule->op_devices;
   369		desc.ip_devices = gbmodule->ip_devices;
   370		gbmodule->manager_id = gb_audio_manager_add(&desc);
   371	
   372		dev_dbg(dev, "Add GB Audio device:%s\n", gbmodule->name);
   373	
   374		gb_pm_runtime_put_autosuspend(bundle);
   375	
   376		return 0;
   377	
   378	disable_data_connection:
   379		list_for_each_entry_safe(dai, _dai, &gbmodule->data_list, list)
   380			gb_connection_disable(dai->connection);
   381		gbaudio_tplg_release(gbmodule);
   382		gbmodule->topology = NULL;
   383	
   384	free_topology:
   385		kfree(topology);
   386	
   387	disable_connection:
   388		gb_connection_disable(gbmodule->mgmt_connection);
   389	
   390	destroy_connections:
   391		list_for_each_entry_safe(dai, _dai, &gbmodule->data_list, list) {
   392			gb_connection_destroy(dai->connection);
   393			list_del(&dai->list);
   394			devm_kfree(dev, dai);
   395		}
   396	
   397		if (gbmodule->mgmt_connection)
   398			gb_connection_destroy(gbmodule->mgmt_connection);
   399	
   400		devm_kfree(dev, gbmodule);
   401	
   402		return ret;
   403	}
   404	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
