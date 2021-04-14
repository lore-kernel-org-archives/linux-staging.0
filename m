Received: from userp2130.oracle.com (userp2130.oracle.com [156.151.31.86])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD216D14
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 10:09:20 +0000 (UTC)
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
	by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EA3rL1161706;
	Wed, 14 Apr 2021 10:09:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2020-01-29;
 bh=AZ5NvD9SV3OGSufytERmjMjgnq/N8RR0Pmgvfa6b7DQ=;
 b=za+a2EalpPH8a77o27MDrYB/Q0e8asDd0HewSUI+uGTY10AWqMTddIvzXfKufEjVmsgP
 BdLhLcS11Fn/cqbt0t83l5wf9mMurAQRMtV8mFdoxykAi6o+ZWbVvUUMngKcv6hOFYvK
 eaFzu0Ft9KfCzFw7AW3gPsl64SkzmJhKjkPdKVpE8WBRjoGJOrPCk52gIDY7BgFYjj/B
 fdf6UdeE4C4M3Bg9j1BeVWqAfdOne3d82D/HXZYCLzwUN0Ln+4+aeOARbEmkkUkWOiWz
 bUjB8B8R+ja22MBR2/QnHxSZOXn8gStROvun8YcDrQfBYCaBejfwGsiyU8etAlfH1nD5 xA== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
	by userp2130.oracle.com with ESMTP id 37u3erhw6a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 10:09:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
	by aserp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 13EA5iOs160822;
	Wed, 14 Apr 2021 10:09:16 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
	by aserp3020.oracle.com with ESMTP id 37unx13njg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 14 Apr 2021 10:09:16 +0000
Received: from abhmp0008.oracle.com (abhmp0008.oracle.com [141.146.116.14])
	by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 13EA9Cv5002679;
	Wed, 14 Apr 2021 10:09:13 GMT
Received: from kadam (/102.36.221.92)
	by default (Oracle Beehive Gateway v4.0)
	with ESMTP ; Wed, 14 Apr 2021 03:09:11 -0700
Date: Wed, 14 Apr 2021 13:09:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ian Abbott <abbotti@mev.co.uk>, linux-staging@lists.linux.dev,
        H Hartley Sweeten <hsweeten@visionengravers.com>,
        "Spencer E . Olson" <olsonse@umich.edu>
Subject: Re: [PATCH 0/5] staging: comedi: tests: Fix various issues
Message-ID: <20210414100905.GD6048@kadam>
References: <20210407140142.447250-1-abbotti@mev.co.uk>
 <YG3LY0hhDhzeXa1V@kroah.com>
 <3d70fc39-3c3f-16af-d4bb-e4dc2c9ffc26@mev.co.uk>
 <YG3rUN0fvyA6HCpf@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YG3rUN0fvyA6HCpf@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-IMR: 1
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 suspectscore=0
 mlxscore=0 malwarescore=0 adultscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104140070
X-Proofpoint-ORIG-GUID: -fSigChngOm3D6RSmAlszi-bQwt6EfZy
X-Proofpoint-GUID: -fSigChngOm3D6RSmAlszi-bQwt6EfZy
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9953 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 clxscore=1011
 adultscore=0 mlxlogscore=999 bulkscore=0 malwarescore=0 spamscore=0
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2104140070

I've been saying we should move this code out of staging for years now.

Normally I like to do a final static analysis check before drivers move
out of staging.

This driver is doing a bunch of DMA on stack which doesn't work on
all architectures.  You have to use kmalloc() (or vmalloc() I suppose)
memory for DMA.

drivers/staging/comedi/drivers/dt9812.c:249 dt9812_read_info() error: doing dma on the stack (&cmd)
drivers/staging/comedi/drivers/dt9812.c:273 dt9812_read_multiple_registers() error: doing dma on the stack (&cmd)
drivers/staging/comedi/drivers/dt9812.c:299 dt9812_write_multiple_registers() error: doing dma on the stack (&cmd)
drivers/staging/comedi/drivers/dt9812.c:318 dt9812_rmw_multiple_registers() error: doing dma on the stack (&cmd)
drivers/staging/comedi/drivers/dt9812.c:330 dt9812_digital_in() error: doing dma on the stack (value)
drivers/staging/comedi/drivers/dt9812.c:456 dt9812_analog_in() error: doing dma on the stack (val)
drivers/staging/comedi/drivers/dt9812.c:692 dt9812_reset_device() error: doing dma on the stack (&tmp8)
drivers/staging/comedi/drivers/dt9812.c:700 dt9812_reset_device() error: doing dma on the stack (&tmp8)
drivers/staging/comedi/drivers/dt9812.c:711 dt9812_reset_device() error: doing dma on the stack (&tmp16)
drivers/staging/comedi/drivers/dt9812.c:718 dt9812_reset_device() error: doing dma on the stack (&tmp16)
drivers/staging/comedi/drivers/dt9812.c:725 dt9812_reset_device() error: doing dma on the stack (&tmp16)
drivers/staging/comedi/drivers/dt9812.c:732 dt9812_reset_device() error: doing dma on the stack (&tmp32)

The test_ni_get_reg_value() function calls
	unittest(ni_get_reg_value_roffs(-1, O(0), T, 1) == -1,
		 "check bad direct trigger arg for first reg->dest w/offs\n");
The -1 is type promoted to a high positive value so src is greater than
NI_NAMES_BASE.  It's not clear that that was intentional.
drivers/staging/comedi/drivers/tests/../ni_routes.h:269 ni_get_reg_value_roffs() warn: 'src' possible negative type promoted to high

drivers/staging/comedi/drivers/ni_routes.c:61 ni_find_route_values() warn: 'device_family' sometimes too small '8,11' size = 30
    59          for (i = 0; ni_all_route_values[i]; ++i) {
    60                  if (memcmp(ni_all_route_values[i]->family, device_family,
                            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
    61                             strnlen(device_family, 30)) == 0) {
                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^
This whole memcmp() is very strange.  Why not just use:

	if (strncmp(ni_all_route_values[i]->family, device_family, 30) == 0)

    62                          rv = &ni_all_route_values[i]->register_values[0][0];
    63                          break;
    64                  }
    65          }

There are a couple places where conditions could probably be deleted.
drivers/staging/comedi/drivers/ni_mio_common.c:2363 ni_ai_cmd() warn: we tested 'dev->irq' before and it was 'true'
drivers/staging/comedi/drivers/usbdux.c:1192 usbduxsub_pwm_irq() warn: we tested 'devpriv->pwm_cmd_running' before and it was 'true'

There is some commented out code that might be worth reviewing.
drivers/staging/comedi/drivers/ni_mio_common.c:6306 ni_E_init() warn: odd binop '0x2 & 0x0'
drivers/staging/comedi/drivers/cb_pcidas64.c:2229 use_hw_sample_counter() warn: ignoring unreachable code.

These places are using char for bitwise operations and there is some
sign extension going on.
drivers/staging/comedi/drivers/icp_multi.c:120 icp_multi_ai_insn_read() warn: using signed char for bitops
drivers/staging/comedi/drivers/usbdux.c:1290 usbdux_pwm_pattern() warn: using signed char for bitops
drivers/staging/comedi/drivers/usbdux.c:1292 usbdux_pwm_pattern() warn: using signed char for bitops

Small resource leaks:
drivers/staging/comedi/drivers/ii_pci20kc.c:503 ii20k_attach() warn: 'dev->mmio' not released on lines: 452,457,465,474,483.
drivers/staging/comedi/drivers/ii_pci20kc.c:503 ii20k_attach() warn: 'membase' not released on lines: 441,452,457,465,474,483.
drivers/staging/comedi/drivers/gsc_hpdi.c:672 gsc_hpdi_auto_attach() warn: 'pcidev->irq' not released on lines: 629,641,646,651,655.
drivers/staging/comedi/drivers/addi_apci_2032.c:289 apci2032_auto_attach() warn: 'pcidev->irq' not released on lines: 279.
drivers/staging/comedi/drivers/cb_pcidas.c:1446 cb_pcidas_auto_attach() warn: 'pcidev->irq' not released on lines: 1295,1301,1305,1340,1358,1378,1409,1427.
drivers/staging/comedi/drivers/cb_pcidas64.c:4046 auto_attach() warn: 'pcidev->irq' not released on lines: 4044.

regards,
dan carpenter
