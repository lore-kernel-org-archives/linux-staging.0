Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006599;
	b=FUq1xTzos41bJrrWEkh3TlVLJxKF77+z3XbkHv/Aj+igfiRE77uv/V/FSgnjFd+wNSgC
	 hR3mVSAjAnhDRfPW83SNP6vNQAj7Yp0/YBjnoeZ5NstDSBRNCFoB3I4MWoqlXK2QIsNBS
	 aiDIUGuZ4sLU4H5fT2aCnymsWZgnLf3FUJVgvMwZJiUXwY3F5HKwcIdJ27CxD2PjoZwVh
	 giFUUvAC+IZv3NNS/PlFhT3WfdwiwDAaXslIHpeHh/vqxBBWlEEM4cYNP/9WaKAsH/nVW
	 HDA8qSezOZ3uU6DpXQzBkrWoia+oJbWeMir4e+Q6pkChaQbwR/mJZoKAco/aqZgs93Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006599;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:Organization;
	bh=9VDRmMuQ5dSrHl8KcWe2A3th4bGKKhbN9IY80G3C7/I=;
	b=5WBrpHer4Im5bJiQq8sOs6+0NFnxrvJ9xtcMSr7dhwhsmef9667DOgu7Jy+IYnfQLkK1
	 Bf0UqBwkxKevKxuFsuxPodXmezk63SrczWZnQuhZhqyHmu4q3++gSqNrnON1V3XiPC/zr
	 hbC/HkPW4SNVsPvDxun8mjDUO3k97l2HNkaX5UYOAABVo2Qt43wIeKLk2975uFXxB56/e
	 Ebm+2vxAaZqDXfMxOEBMfNJcl5cQw1EbKbnoKA8paSZmaMdh5oMdREZGvlS8FK3dc7qRY
	 szZtBkGqEkMwYV36Lu/xGNKcPMJwqJiBLDO4kXYru74O3v0yjuTmQ7Q/ErJNci62MuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ddU5GUeq;
	arc=none smtp.remote-ip=192.198.163.10
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A2FF606A31B
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:23:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3A2FF606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ddU5GUeq
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793006598; x=1824542598;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ALfXT6p+x9/XFdJ+2jlIdBOHagihEU97rKVJ21I5/o4=;
  b=ddU5GUeqjNpW36ea1Ne2kiQuxTw0ce0UbPwOUXSxnrxJpD1dJH1/JXNr
   0JWXifo2MB2y3Tnoctvgx3ewWYhiVDtvxV1ID17NOuPVos7+a+/bpQpr/
   y92gXIMuKyLRvrBq2B6/R68VxcHJ1UsFcPvyXDw3TG1d4AyzsUHqw2/gc
   5DJmxScLt2T83/NEDjtoSN3FSVfL+5mXNOtuhQ9ZsMZf6EN4/mvoegfc1
   07hydsokyBAwmGMwkUrtwpXOEbxjQhNfmRsEqGMEM7TtTraJ5MeD1BiHc
   jqVQf+SsKegCAQxqBNykl0qrAx1RbDl5N2OETkxghlCMpOpu5BQh7iyeZ
   w==;
X-CSE-ConnectionGUID: e/j8BcnDS8eDd2xvfAhT1w==
X-CSE-MsgGUID: +ltdtW0JQuCTdPzF2buhhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11946"; a="1567463"
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="1567463"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:23:17 -0700
X-CSE-ConnectionGUID: lGKcouszRSCw3Nn7lI1Gxw==
X-CSE-MsgGUID: PAVjpMrQSGeEQKIGwuH/3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,179,1787036400"; 
   d="scan'208";a="4269885"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.93])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Oct 2026 02:23:15 -0700
Date: Mon, 26 Oct 2026 11:23:12 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: himanshu bakshi <himanshu.bakshi478@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, dan.carpenter@linaro.org
Subject: Re: [PATCH] staging: fbtft: Remove unused macro
Message-ID: <at8cAMm6psyWsqbe@ashevche-desk.local>
References: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
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
In-Reply-To: <20261026081832.60570-1-himanshu.bakshi478@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Oct 26, 2026 at 01:48:32PM +0530, himanshu bakshi wrote:
> From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> 
> fbtft_init_dbg is not used in drivers/staging/fbtft directory and

We refer to the functions and semantically similar macros as
func() or macro() in the text and comments.

> since dev_dbg messages are good enough, fbtft_init_dbg should be

Ditto for both dev_dbg() and fbtft_init_dbg().

> removed. After compiling the driver, there are no undefined macro
> issues.

> Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
> ---

It doesn't say how you tested this, though.

...

Code wise LGTM.

-- 
With Best Regards,
Andy Shevchenko


