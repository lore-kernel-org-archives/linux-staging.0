Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.19
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170245;
	b=jv8h23WMOcovyEfOWIFQDJsn+XntjoiTWRIzyrwq90mR039Xv1nH0dA1Vlw9l0Ljc3lH
	 67e/NCwfnf6itIQtVPA/Xxp9Ztf/h49M6r7zJUR5HN/b0kuhstrEdPrF7F8dMBbX5zCG7
	 px5h2gqonDjl9UbwFDDQAVsq3y2PU6AusCQJSbE97ov6SWGD8DIvsLSkPZzeU0jRx8OBr
	 kWrelUcNqjjItd850tQgPsH28TivlEJVvC7xU9nFEpQGrw6uaWOk0/nGI1Nej4yAZ7SZd
	 YMOihcHOerW0orNJfAqu9valNcEEmQv+JrVktpHz6u8b/zKNlDWkv+cV6CDSeJz9vIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170245;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:
	 Organization:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=h6r3Ix1xwC9XchGuTQiH8mjQfK7hpJKLEMuo4rJ/E3A=;
	b=gmZwIVZLVJSjAxFb/12DCm+lqMEkIsu5b9LHbs01Yv6vlR1M6jNEu5PinBCOKM0cPYJU
	 eMl1MKUiZpkJ0hgLLRQzhw4k95Xfj0beeM6S9j97gpAPMY2p1PuKKGPtlFYPtCMXajCjN
	 zAifRuBmdXRfGYIL+TJ5azjoJwUggnenWB3C6FOdS3sJD0bPqThpRAV84RJFGlqd56WJL
	 LiGgqLc6OEGqC20h62ldMj4tPQQLDbF9y9k7hteXMUiULe+/2UoQEbxXw23ogI7JALMlS
	 jIq1SWqA0GtaSQs1d5ejhlAIOsRAMVISCjuf6LDANQBvAiOQtN9Rnbg7UotPWnvvptQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKVhaMIt;
	arc=none smtp.remote-ip=198.175.65.19
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C9160A260A
	for <linux-staging@lists.linux.dev>; Fri, 20 Nov 2026 10:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79C9160A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mKVhaMIt
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795170245; x=1826706245;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5AE1nAjcNJJU2gyRZqdIvf+1tgh3aoinnWqjDwIMxtc=;
  b=mKVhaMItGT4Egy9ekVKEvtO/c4tlR1ahSvTD7iZqTHGrqD1/+uKkt3sh
   EjbRpWLccNYyLX1+ejQSNkQenJBk9+pNoQFTuungUpOr5kKIk3Tfztcsl
   PF6j3qpL2mt8kMd1qFgEcVnxuQ8x6ZPob6PppYBWkBrSZOUSyqFmQzrz9
   kTql10AE/VVxZG28yM0XdANvoFbFoX3uCEIskOA2iataPgSpkxxGEyvTc
   UqD9sjfbqm0HkOCWxE5bepmOtie7BE/Esh61NktmJeJbqVIZZBDsLkjrE
   5QnTvY/SscTMhrVFJ2J39OplbI0cPYJZ7Qq0FikYmcifZpaU3+fIO5IKt
   Q==;
X-CSE-ConnectionGUID: FACu1D5PRdWSUpYZi6ZC6w==
X-CSE-MsgGUID: W60132MnTP2j3COqmaJTkQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11971"; a="4090282"
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="4090282"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 02:24:05 -0800
X-CSE-ConnectionGUID: 3EQSMVKRQL2pukqWbfAhzA==
X-CSE-MsgGUID: 09jZu8IhSkmZ7Zy8sYdLzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,222,1787036400"; 
   d="scan'208";a="12375021"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.253])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 02:24:03 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id E079E121B79;
	Fri, 20 Nov 2026 12:24:01 +0200 (EET)
Date: Fri, 20 Nov 2026 12:24:01 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: ipu7: Remove unused struct
 ia_gofo_secondary_boot_config
Message-ID: <awAfwSVfYQTB_FCC@kekkonen.localdomain>
References: <20260507151446.153614-1-nguyenhaiphu06@gmail.com>
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
In-Reply-To: <20260507151446.153614-1-nguyenhaiphu06@gmail.com>

Hi Nguyen,

On Thu, May 07, 2026 at 10:14:27PM +0700, Nguyen Hai Phu wrote:
> The struct ia_gofo_secondary_boot_config in abi/ipu7_fw_boot_abi.h is
> not used in the driver. Remove it to cleanup the ABI headers.
> 
> Signed-off-by: Nguyen Hai Phu <nguyenhaiphu06@gmail.com>

The patch is fine but we're about to remove the whole driver so I'm taking
fixes only at this point.

-- 
Kind regards,

Sakari Ailus
