Received: from alln-iport-4.cisco.com (alln-iport-4.cisco.com [173.37.142.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34468284898
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 18:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=173.37.142.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763492082; cv=fail; b=K5mcc8qzRNmQljVbZlYklFxPTac07CUDWBkLRMe3jWsyId0999fVeDz07CXS+exBdOGKze7kGo/VuW5t7Yj7Ztv5XmKfQMtz2MnbQDJuGh901u4AVDjfgROPEbWH3M7/y3CvcTG7yRJh7yK3Gb4AJfsxUNFFMx3LH4i9T9hb7Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763492082; c=relaxed/simple;
	bh=aF5vkLEAIHqJ9xH6JosqW7Y9Sf3asLlHWrOCvgpE7GY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jBpssi5bZIKeVoEUX7nogjHW2r84TCUoiYMv2m+flGJLcyOXmSarZj6iTmEnBLVzy7owUl6gP/tXzt8Zn1RBi1D+A0RSQMdmL9h4dvQoDmcfXSPHpBuKcFjTA/W91mmvN8eFWObrj21VjMzJVCwrIGpdZVz2128cHMYuUAwnWQs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com; spf=pass smtp.mailfrom=cisco.com; dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b=hcXO2muo; arc=fail smtp.client-ip=173.37.142.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cisco.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cisco.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cisco.com header.i=@cisco.com header.b="hcXO2muo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=cisco.com; i=@cisco.com; l=818; q=dns/txt;
  s=iport01; t=1763492081; x=1764701681;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=aF5vkLEAIHqJ9xH6JosqW7Y9Sf3asLlHWrOCvgpE7GY=;
  b=hcXO2muov2U8hmXqUknnRxyIn42oSuBUUSianRJhWlRDO1iC48o+4kjk
   P9tTUxT2diN2PQI13bjm2BhyPW+NGwda0gQMHeuf8yu9+QCB7nFRED6h8
   CNMeOY9w5DksJbb2vm3s0mtqnmMEZEqesQ7/ndHNZyY98Xp9xaP9FL/e1
   Sfx98UdKmC97wvTWrh5lIXGG4aD+GPh6+goQ2pDIVUNNwDbU19dYxTGi2
   uAZpkNT90rl0q0JbNyznloJm0ikWgv7WsgEP/1yVVuGiW1nchjcCZ5MU2
   zvKhd4Rrkoa8/x/abffewPTHYd+iaJeVWvFsojnsyPdDlryDrrI82scyK
   w==;
X-CSE-ConnectionGUID: H85h9D4WSLSGMBeNJm1Wuw==
X-CSE-MsgGUID: ZNvTRs5KRQyp26PHu5gxQg==
X-IPAS-Result: =?us-ascii?q?A0AuAAAdwBxp/5AQJK1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEXBwEBCwGBbVIHghtJiCADhE1fhliCJJ4agX8PAQEBDQJRBAEBhQcCjFoCJ?=
 =?us-ascii?q?jQJDgECBAEBAQEDAgMBAQEBAQEBAQEBAQsBAQUBAQECAQcFgQ4ThlyGWgEBA?=
 =?us-ascii?q?QEDEig/EAIBCA4KHhAxJQIEDgUIGoVUAwECo2UBgUACiit4gTSBAeAmgUoBi?=
 =?us-ascii?q?FIBhW6EeCcbgg2BV4JoPoRFhBOCLwSBDoEUgQ6GJ4wmTIY8UngcA1ksAVUTF?=
 =?us-ascii?q?wsHBYEgQwOBCyNLBS0dgSQiHxgRYFRAg0kQDAZoDwaBEhlJAgICBQJAOoFoB?=
 =?us-ascii?q?hwGHBICAwECAjpVDYF3AgIEghx+ggoPiGGBCQVHAwttPTcUGwUEgTUFlAxRg?=
 =?us-ascii?q?UNpmkqbCJUXCoQcog0XhASNE5lUmQapFgIEAgQFAhABAQaBaDyBWXAVgyJSG?=
 =?us-ascii?q?Q/VEHgCOgIHCwEBAwmGSI0fAQE?=
IronPort-PHdr: A9a23:ar5VmRG/r8W8xvfoYBR+Q51GfhMY04WdBeZdwpMjj7QLdbys4NG4e
 kfe/v5qylTOWNaT5/FFjr/Ourv7ESwb4JmHuWwfapEESRIfiMsXkgBhSM6IAEH2NrjrOgQxH
 d9JUxlu+HTTDA==
IronPort-Data: A9a23:HqGWZa0AozWv333Su/bD5YRwkn2cJEfYwER7XKvMYLTBsI5bp2BTn
 GcWWTuDOv7eMTamf9x0b4/loRhVscCAytIyTFdv3Hw8FHgiRegpqji6wuYcGwvIc6UvmWo+t
 512huHodZ5yFjmH4E/xbtANlFEkvYmQXL3wFeXYDS54QA5gWU8JhAlq8wIDqtYAbeORXUXU6
 Lsen+WFYAX4gmctYjpNg06+gEoHUMra6WtwUmMWPZinjHeG/1EJAZQWI72GLneQauF8Au6gS
 u/f+6qy92Xf8g1FIovNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ajs7XAMEhhXJ/0F1lqTzeJ
 OJl7vRcQS9xVkHFdX90vxNwS0mSNoUekFPLzOTWXcG7lyX7n3XQL/pGLBFrPdw0ptlMJVph0
 NYVDhIINy+emLfjqF67YrEEasULJc3vOsYb/3pn1zycValgSpHYSKKM7thdtNsyrpkRRrCFO
 YxAN3w2MEiojx5nYj/7DLo9lf20h332cBVTqUmeouw85G27IAlZjuG9bIGOJITQLSlTtnS+u
 F785DnaOCgLLIbB8RqYr328v+CayEsXX6pXTtVU7MVChFyV23xWEwEfWlq9rtG9i1WiQJRbK
 koJ6mwioLZayaCwZtD5Wxv9pDuPuQQRHoIPVeY78wqKjKHT5m51G1Q5c9KIU/R/3OceTj0x3
 VjPlNTsbQGDepXPIZ5B3t94dQ+PBBU=
IronPort-HdrOrdr: A9a23:W8hhe6GefZB22s6apLqFp5LXdLJyesId70hD6qkvc203TiXIra
 CTdaogtCMc0AxhJk3I+ertBEGBKUmsk6KdkrNhTItKOzOW91dATbsSobcKrAeQYREWmtQtsZ
 uINpIOd+EYbmIKw/oSgjPIburIqePvmMvH9IWuqkuFDzsaF52IhD0JczpzZ3cGPzWucqBJbK
 Z0iPA3wAaISDA8VOj+LH8DWOTIut3Mk7zbQTNuPXQawTjLpwmFrJrhHTal/jp2aV5yKLEZnl
 Ttokjc3OGOovu7whjT2yv49JJNgubszdNFGYilltUVAi+EsHfpWK1RH5m5+BwlquCm71gn1P
 PWpQ07Ash143TNOkmovBrW3RX62jpG0Q6g9bbYuwqgnSXKfkN/NyNzv/MfTvIf0TtngDhI6t
 MP44tejesPMfqPplWk2zGCbWAbqqP9mwtQrQdUtQ0fbWPbA4Uh97D2OyhuYcw9NTO/54Y9HO
 Z0CsbAoP5QbFOBdnjc+nJi2dq2Qx0Ib1y7q2U5y4WoOgJt7ThE5lpdwNZakmYL9Zo7RZUB7+
 PYMr5wnLULSsMNd6pyCOoIXMPyUwX2MF/xGXPXJU6iGLAMOnrLpZKy6LIp5PuycJhNyJcpgp
 zOXF5RqGZ3cUPzDs+F2oFN73n2MS+AdCWoztsb64lyu7X6SrauOSqfSEo2m8/luPkbCt2zYY
 fEBHuXOY6VEYLDI/c84+SlYeghFZA3arxhhuoG
X-Talos-CUID: 9a23:vIqpdWzGojSvGSsXwMIOBgU0Sp0lI1GB80z0GGCdI2tParjMdkKPrfY=
X-Talos-MUID: 9a23:y4TNagX4c0egkdHq/A3Kmg1YL5pL2Z2/EBpTqbUb5saUDCMlbg==
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-l-core-07.cisco.com ([173.36.16.144])
  by alln-iport-4.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2025 18:53:31 +0000
Received: from alln-opgw-2.cisco.com (alln-opgw-2.cisco.com [173.37.147.250])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by alln-l-core-07.cisco.com (Postfix) with ESMTPS id 9EF8F18000344
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 18:53:31 +0000 (GMT)
X-CSE-ConnectionGUID: M9leBRaDSNerl8581u8RUQ==
X-CSE-MsgGUID: VHYB3SmNQcuTRetKu2wrtA==
Authentication-Results: alln-opgw-2.cisco.com; dkim=pass (signature verified) header.i=@cisco.com
X-IronPort-AV: E=Sophos;i="6.19,314,1754956800"; 
   d="scan'208";a="32832790"
Received: from mail-bl0pr07cu00105.outbound.protection.outlook.com (HELO BL0PR07CU001.outbound.protection.outlook.com) ([40.93.4.5])
  by alln-opgw-2.cisco.com with ESMTP/TLS/TLS_AES_256_GCM_SHA384; 18 Nov 2025 18:53:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N40gpzt9wav64InpGlstHYx4ivYccTosBkbwgti54vj+iexpoJpuGz3KqG/iO9zdzJ+6kspKCYQPduBL8vuNXCORzM4H2Ti/IgA31BaJ9NiiZMJFdeLsH98ZaUn/q7VsgQMMkaxqbWMp9Nmxh9rmFcXf7Lr5BgKf8r0Uvh+7ZPmYflXjXurRQ2792H04mbJFinCfxvvPETPsCwwM7HdVmVW4ZPp4hKYG1D+G7NMoteRveacSABqY46tITcBp3melPTqW+0klxQsyBdejq1ihC1O6UlcMaY4b4oTP7E86usqU37UTbpC2e1EDpZCriRnVG83nTl34ACwraklChwqaKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aF5vkLEAIHqJ9xH6JosqW7Y9Sf3asLlHWrOCvgpE7GY=;
 b=nexeg8FPBe5uAeHVOB656ZkueAwdhfLbP79zqx/eEyLCppj5MQPbXN2dr2UbzOjDwMTOVeL8PlZlhORBzgOIF8gMuvE/M9SSH2hnEgaTGWuhmeVbJrrdMZI4GOV1TQQ7dwNgdAIdYDgJe52OLlkOoCTawD4zc6AFVF/KK95bFS/w4EySAi+osDhAsX/8aq1++UeQQWGPR+1nX+ZXFFgBGw1imKimLevn853AF1DgFRdR50uABFU7r0GDHN3/EWhed+KXcW+rujXA1YicGKcdLfVybQ3UkOnG683WtqbpN4obEVnUrRlkfm2EbltfXDoGMWFUR26k5Vm3nDHembVN/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com (2603:10b6:a03:42c::19)
 by SJ0PR11MB7701.namprd11.prod.outlook.com (2603:10b6:a03:4e4::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Tue, 18 Nov
 2025 18:53:26 +0000
Received: from SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::2081:bcd4:cb3e:e2dd]) by SJ0PR11MB5896.namprd11.prod.outlook.com
 ([fe80::2081:bcd4:cb3e:e2dd%4]) with mapi id 15.20.9343.009; Tue, 18 Nov 2025
 18:53:26 +0000
From: "Karan Tilak Kumar (kartilak)" <kartilak@cisco.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Steven Rostedt <rostedt@goodmis.org>, Petr Mladek <pmladek@suse.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"openipmi-developer@lists.sourceforge.net"
	<openipmi-developer@lists.sourceforge.net>, "linux-media@vger.kernel.org"
	<linux-media@vger.kernel.org>, "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>, "linaro-mm-sig@lists.linaro.org"
	<linaro-mm-sig@lists.linaro.org>, "amd-gfx@lists.freedesktop.org"
	<amd-gfx@lists.freedesktop.org>, "linux-arm-msm@vger.kernel.org"
	<linux-arm-msm@vger.kernel.org>, "freedreno@lists.freedesktop.org"
	<freedreno@lists.freedesktop.org>, "intel-xe@lists.freedesktop.org"
	<intel-xe@lists.freedesktop.org>, "linux-mmc@vger.kernel.org"
	<linux-mmc@vger.kernel.org>, "netdev@vger.kernel.org"
	<netdev@vger.kernel.org>, "intel-wired-lan@lists.osuosl.org"
	<intel-wired-lan@lists.osuosl.org>, "linux-pci@vger.kernel.org"
	<linux-pci@vger.kernel.org>, "linux-s390@vger.kernel.org"
	<linux-s390@vger.kernel.org>, "linux-scsi@vger.kernel.org"
	<linux-scsi@vger.kernel.org>, "linux-staging@lists.linux.dev"
	<linux-staging@lists.linux.dev>, "ceph-devel@vger.kernel.org"
	<ceph-devel@vger.kernel.org>, "linux-trace-kernel@vger.kernel.org"
	<linux-trace-kernel@vger.kernel.org>, Rasmus Villemoes
	<linux@rasmusvillemoes.dk>, Sergey Senozhatsky <senozhatsky@chromium.org>,
	"Satish Kharat (satishkh)" <satishkh@cisco.com>, "Sesidhar Baddela
 (sebaddel)" <sebaddel@cisco.com>, "James E.J. Bottomley"
	<James.Bottomley@hansenpartnership.com>, Andrew Morton
	<akpm@linux-foundation.org>
Subject: RE: [PATCH v3 19/21] scsi: fnic: Switch to use %ptSp
Thread-Topic: [PATCH v3 19/21] scsi: fnic: Switch to use %ptSp
Thread-Index: AQHcVK6ozanKNwbcFU2LSi/oClNkW7TxMIPggACrXQCABvPI0A==
Date: Tue, 18 Nov 2025 18:53:25 +0000
Message-ID:
 <SJ0PR11MB58966843A2F7413517F25822C3D6A@SJ0PR11MB5896.namprd11.prod.outlook.com>
References: <20251113150217.3030010-1-andriy.shevchenko@linux.intel.com>
 <20251113150217.3030010-20-andriy.shevchenko@linux.intel.com>
 <SJ0PR11MB5896D2F9DAC35FF8ADB29087C3CDA@SJ0PR11MB5896.namprd11.prod.outlook.com>
 <aRbreoKzashQcEne@smile.fi.intel.com>
In-Reply-To: <aRbreoKzashQcEne@smile.fi.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB5896:EE_|SJ0PR11MB7701:EE_
x-ms-office365-filtering-correlation-id: a5ad9d9c-fec6-41c1-2267-08de26d3c18f
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|1800799024|376014|7416014|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?GUMa+XOyswf2U2DZtEJX5ixyVbnqEMu6+P/cmDXtAOmacozf9sTeRAPDoRo9?=
 =?us-ascii?Q?qR2z8k5QXeT9mLfPAY+A7GPyEoVeX+C/hxWS5l60LIcfeKC7KCCFM3NsyfDu?=
 =?us-ascii?Q?XRvf+ZUAdMp7LpE3/t/oqHvY0sSKto68drpWLCKm3UfWXjQJxaVeY5YFZD10?=
 =?us-ascii?Q?Ykeozb0BKyaUWqBo+5ksmQMisXGfg4Y0eflj/ooM5RboHswkIVYLwnZY9nzm?=
 =?us-ascii?Q?yI0AmWRzPPGjM1mN3VLxZP50NYARrg1x1B0A4XPj7wOb82OIiKC8xPAQEyIa?=
 =?us-ascii?Q?c/cMVe4R6/889JUofDr0fyOHxTWaBZy7L1HDcsIXPhUpi2m/VtEs+y7zVO3X?=
 =?us-ascii?Q?JN4o3/Jc/pMfyXvJdmVtr+VjdhJrfU+dtXNo7OKXNd0BTatCgyP+6W4Wh0ig?=
 =?us-ascii?Q?wE48OBu/s+ENCm0eryKnHyDrKjVG0hhzzSIJ7yMznnSWsQ8torqxOQdmtAiS?=
 =?us-ascii?Q?fQxvttI8k/8Vtlh+sDaVfD59s2NtqVm1aBvTPrvK99ej6qavEOdKi103mbOl?=
 =?us-ascii?Q?A9btywOofvoBFJGRZKsNPI82gpFJFIFZol9Tk86ZVIIDt8tBazyY6sxN1LCr?=
 =?us-ascii?Q?TZ+OiJedxLf9m3q1P9LUkgISHunZNE1vRLxo7kV186DvpkZqfSDp5/F5dtqR?=
 =?us-ascii?Q?VLb8a0n79/C/CHR6cE5cZvwFIuQbfCuvy8ZghQWoVB4qjHh2ShC7tWY/Yhp0?=
 =?us-ascii?Q?YoembG3qsq92We+EyMzJpbPLH02jv7s3Xgq89R8z1YWsoaEj0u9/QBqS98CG?=
 =?us-ascii?Q?E+ujhRMWMHrYsb56TbAvnQnShBvwyqxOc5ejXyez0+yjE13lCqHqoJ3AjUh6?=
 =?us-ascii?Q?rPb1yxWqoMrKhLwgsMbEy6sEOhPM9qYivqFoAyD1awquylfskD+XiYLIJeDY?=
 =?us-ascii?Q?HRXqJxEFN5p96UvZxUduu0XWeyXRyW+TU/7uvtaGRwu2klGjVeaW9bUevAOA?=
 =?us-ascii?Q?Yq+rJvNg0wxJafGNurhlHFv5inOJlSyc7pR9xB5mqB4bAQ/nXfRqQ3Cr8wyG?=
 =?us-ascii?Q?drPti2nq/5O7BOlcQ/ckPyVu2pd4LB9kJIHDzfwF/If2xOOJFX5tdUf9P4y5?=
 =?us-ascii?Q?A+PgQqwCFcHkg+lDCYDUiEDWWrFWmSHfLPR7/wISbMhOapBcxsWrDaDH8bAX?=
 =?us-ascii?Q?YCDa7DvxdkppsKJMNfFxu0+TXi+CL+zFNhawd8FLlnoBiuruj/H6vUoGpYu4?=
 =?us-ascii?Q?p8mT5Oc51Wmq7vxhrgmtoP9DUW9cym7+HBrw+at7j085OVrcgc/6wd/LVwv+?=
 =?us-ascii?Q?YaYSx8u/FZFXoxUEMjy9CbjkdDmo4qgTxANijYef5ngmO7BFGFnZ+4jiiJpD?=
 =?us-ascii?Q?u1xPwquutK5Ir7jU1DEu35zR6Gask+iBEVpVzffqMpw1+MD2XueXMc0eU4BW?=
 =?us-ascii?Q?r6CALNEr0gwe83nf2B2xYZYit1lxnDV434Qfh/nOHtaX9QbpQGDI/C/mr5xs?=
 =?us-ascii?Q?cS5/dgufeEKq2mR+lQXEGXOrjmjHzg4wAOr7EMWRbTtdPg8w26/rkrgKf0S/?=
 =?us-ascii?Q?Kk26pg5OvuuJQYdxheC0ZPQTOIupS0HpgvbC?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB5896.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?4g49PWLq4LnszL+DPUrVw0Z7BDQjRmBANGMTzIKXkbkHa7COXiVWygzlSygC?=
 =?us-ascii?Q?+nb6PB2Xd4khvp858iobsixHJecUd/4YHN/PZUQy+/1WSXD27l+43WfYMgCC?=
 =?us-ascii?Q?LR7eaPRDh7FRFGZ5D0/btclpOpIYReYqEBUnktcVzjozDgYqWm4UnejrFfXc?=
 =?us-ascii?Q?Rb6Sc4Ih87OjMK9ZuVGuCGvBtUttKkbZQSEpHLH8FA/+3c5QGFf4u02PT2ez?=
 =?us-ascii?Q?a78QzpaImmCxx4QoCcqaq9t4ocVv+T5fWLZ5iBeb1H5o4ZlWAsn/rec9R5Wq?=
 =?us-ascii?Q?JTALIiE/h1gJ3hvajhsqKzCvZhASmfDRuUE8Ll96efoMG/9Mv49/rCDqx38l?=
 =?us-ascii?Q?AsiZzX2Ng3wSUPs3pARBgf7enrJbwaF6tvf7w3nRGbgYe7CzDZ3Ho+yrkQ47?=
 =?us-ascii?Q?AASTZE4+Jk61cy9X8wrrElvkA4BQ+pQqfvc26pL32X3DzATMdD+n71h4tRyG?=
 =?us-ascii?Q?5M/Ilfs93s9BJi9aa+WvCEnPjdYWPzWhs4WfLaIG9W2eaDeYvwIR6317wS8i?=
 =?us-ascii?Q?nloa7xlzahUJ3qKEuOLIR/OvCr6DnHyvZNvuNAp9YWwz6WHLwfDHGoGoc6Mc?=
 =?us-ascii?Q?YLp9BXp1twFg/eogDMzsWgTerYBtPbM7Y/WfWaQHY42OOxPQYZkgRT4Ewc7r?=
 =?us-ascii?Q?QCj/EFu90lrEi7t2XWUu1O0p7z9x/vG6cE0MLfMhTXG2YsjPuDpkI3KeFLpr?=
 =?us-ascii?Q?9ro/SW+ywENYsS0fadcxk+SY7d1ctb7QfmuNWqZN9gyNvFsVBeSBc2FGO0a8?=
 =?us-ascii?Q?j8p4aeKWdR0iT1J3dOk+rPgEUCdfIeZJ1vsfZCnjUEf10c6Z6SWPC2GaPIHc?=
 =?us-ascii?Q?sPZP8UT18E8zUee4/il3Ry9+NHTw6gmBPmEftL1kns4ZvuoSmTdTpOKIpj5q?=
 =?us-ascii?Q?FOamVJ7c4XwL0umzSZFTFADpStj/Mnjt3D6CjxSyqj48Y38stZcnOaXtXo4Z?=
 =?us-ascii?Q?2iKJ7vTMhyezmZV6Ogsio5S2Png+Hr25OGunbheGFvwg4+3d8C7hLD0Uxfa8?=
 =?us-ascii?Q?VvGic6BhVdlzMp7vhjkH4bw/Vl5Y9kkneS27wo59pOXam7oASDueEHJcaYD3?=
 =?us-ascii?Q?6FvfdhFTOOvYnAadbvQBHx3BFNTBpMbtImw/wOzdlSXdpG0dIKFTeUaeMc4S?=
 =?us-ascii?Q?hRsQ7eC1mX4ytKtQllHlWiHwHnUkDGcwtwqCoC2+OADdM6838YpHV9rkn88d?=
 =?us-ascii?Q?5XV+7ncpQjUc7SrP7po1ytI2jQ9QBCK2ZW/e76Cb2OW1yrwJjh4cc2RB13Dx?=
 =?us-ascii?Q?eLHSMowtXBHzcRQQBXK9FQRcut0VwkJ2w/BSoIG4MnkXJvXfJ8wr5cfCggB4?=
 =?us-ascii?Q?Su3cBFP/Fyvg6GVQXmIc/8i9a0EdvhtjarM7zNQ+aue6pIhdDtkSQKvI6ZCp?=
 =?us-ascii?Q?sujh9K82JUkylQ/12yzeNXqk5nWy2Q5kavriDPhOPfTQ9RZClXpyJOiRglsH?=
 =?us-ascii?Q?OTHbQ2HoJ+ojQjfb2zGtJSldHACjTWb3Nu3oaNkObAw0XsPVVKb8WQil8yY3?=
 =?us-ascii?Q?UIL8SrClUK7KzbmOWYZqJe76kOo7z554Hk7NFBl75kDq7q2UPM0ngQ5JYgTF?=
 =?us-ascii?Q?af7AZBJ7ceEnDM2oWAdVNhBi2cFlDJaNrrFzcJyE?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB5896.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5ad9d9c-fec6-41c1-2267-08de26d3c18f
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 18:53:26.0249
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4oM0CPuVrjk8BArkEZqVmX25kgwilVgpoUtzL7jXnPF5Wqo8A12k/Bv+wSykoN9Ag42nrO1qlkYSH02XL2axqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB7701
X-Outbound-SMTP-Client: 173.37.147.250, alln-opgw-2.cisco.com
X-Outbound-Node: alln-l-core-07.cisco.com

On Friday, November 14, 2025 12:43 AM, Andy Shevchenko <andriy.shevchenko@l=
inux.intel.com> wrote:
>
> On Thu, Nov 13, 2025 at 10:34:36PM +0000, Karan Tilak Kumar (kartilak) wr=
ote:
> > On Thursday, November 13, 2025 6:33 AM, Andy Shevchenko <andriy.shevche=
nko@linux.intel.com> wrote:
>
> ...
>
> > Can you please advise how I can compile test this change?
>
> I have added the following to my x86_64_defconfig
>
> CONFIG_SCSI_FC_ATTRS=3Dm
> CONFIG_LIBFC=3Dm
> CONFIG_LIBFCOE=3Dm
> CONFIG_FCOE_FNIC=3Dm
>
> You can always add the just a one (last) line to a configuration stanza t=
hat
> can be merged to the .config with help of merge_config tool. It will take=
 care
> of all needed dependencies.
>
> --
> With Best Regards,
> Andy Shevchenko
>

Thank you Andy.

Regards,
Karan
