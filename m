Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793706831;
	b=PtH8JVGcUaT3JNFWEfce2zwQ6UV87/OJExbfaqHGyW8ozVhg6ap91XrssDkV8yNhIUAp
	 xyPzR+QHa6jLWZifczbK/3vLLnpPhCb0aljoph3nsA1AuZE/1d7mwZvhPSyhXXlft25PI
	 kBFPvsUxJZy4TnQRUOwPqYSc/2jH/TinQX/JBNJFcWtT/GGz3Z5O5RHT/W/Enxx2l8tOl
	 6g7fIlV3dv6pdVafJYbfNxOvsznFq6hnGcgZh7y3sono9XTIFaLHm0XbLb4IymrgsNhPn
	 DhXandpri24W6A7ygOExdoOSJBIsFrdTD6oAYhEOdp001vsN4t4N8Sg5zoXPi24CLQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793706831;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=RllDWIKtBnZGWzJv6L6Y2irHmhyGV0d/oUU3v4XZDuQ=;
	b=Rnb4nXzFCX9EeHKVc0CpEE+wgj6GCgVsRRBv+BXXx9fjVAHqMq767/QPhLDXpdPUF/oK
	 NmiGQx63ntXZh4jjdDsEj0mSyLaNAK36UnvZt5wCC/GHVF9COwvUzOzQFXFY3eTM2NT2K
	 wHOM/qB9jWLDj0JTWaE+mTz2KmC85TSJU/F22umwzA4HLa6GS0nMNn9sLLzcLwthKv96Q
	 D3rzVbYguvwssv35asli8uXqMwQRRazjm7/DUNn2shtTq++nV1/Cpwd4B3OAS+4WGeYIj
	 zlS3WQ5hSf8XxWHvBKxZsRrFoGAyCLBJ4mvHU0gO3AC+ZEXaipuvUrlPDCfT5qdQaAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WgtTr2XU;
	arc=none smtp.remote-ip=192.198.163.12
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB568606A32C
	for <linux-staging@lists.linux.dev>; Tue,  3 Nov 2026 11:53:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB568606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=WgtTr2XU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793706830; x=1825242830;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=E/bb+RaCzD9TUBzETNHN6mhOmTvpe0fusV4NGUlFins=;
  b=WgtTr2XUfrkdgwKdkspizAkUNpeCiHg/8hDyPlGmAr2eNseeTeJOc25F
   Noy5yFeTV+7pX8kVuF859zxlbLQ4Q1mHnAiXaro59b3zG2PmxpaTW68j3
   uCTqXi5kx/pz8cwB7WwwDuL3+zs8cU6a3iD+vVf/cEAfRIwu/VpG7PECb
   NTp5hpFCNGxFq+TuqkohKZVPVv6ahflG39dfdcRaSaF6KFrwyk6vCUV7Q
   CM9yZRqgWsw2NxqhmIBg+L+aRxIWBp2Jarxol8O8gp17nCUgN6zgd8Liw
   UcAhbAtMksfdtfJXVRG78+pzSmpjrrx1gR+pVHCyei0HskEIv5AxoKMif
   w==;
X-CSE-ConnectionGUID: YRmxStUYT9CU8pHOKvaUXg==
X-CSE-MsgGUID: HdIK/iCeRJm1M1RNv1AaHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2316695"
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="2316695"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:53:50 -0800
X-CSE-ConnectionGUID: /KnJXmWqSWWiqTNtxQs9vQ==
X-CSE-MsgGUID: E6NN+KmHSOeB/tZ6Q5EIWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,193,1787036400"; 
   d="scan'208";a="6735312"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.108])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2026 03:53:47 -0800
Date: Tue, 3 Nov 2026 13:53:44 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Kang Chen <k.chen@smail.nju.edu.cn>
Cc: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Raushan Kumar <mitramaurya80@gmail.com>,
	Chelsy Ratnawat <chelsyratnawat2001@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] media: atomisp: reject short _DSM packages
Message-ID: <aunLSDomvfnT7d6A@ashevche-desk.local>
References: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103114121.74901-1-k.chen@smail.nju.edu.cn>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Nov 03, 2026 at 07:41:21PM +0800, Kang Chen wrote:
> gmin_get_config_dsm_var() walks the package returned by the atomisp
> _DSM function, but it does not reject packages with fewer than two
> elements.  count is unsigned, so an empty package makes count - 1
> evaluate to UINT_MAX and the loop walks far past the end of the
> elements array, reading unrelated memory.
> 
> Require at least two elements before scanning the key/value pairs.

Stop being a meat proxy to AI. Read the code.
NAK.

-- 
With Best Regards,
Andy Shevchenko


