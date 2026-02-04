Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5069C3D4124
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200919; cv=none; b=epvhD1li1xqSSgWWCzMf/3+epGoprv2js3hBws4C9VD2KlmRM+VCqEcGOQLH+1hFtdZy8N8WO0ea3xlgZmzFXGCXTxN2sOhQWabNdJQmS59ClZOrTPAg1duTzCxhtL1nMPRfT7iJr7YQrf7QlEdcVoSCG//5wDB6FlWZ4E56LZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200919; c=relaxed/simple;
	bh=QXMEtl91EgNuQzcim1t6NyEJkWvP3FLVD56aYTDnfMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VDq6wZEa8CkurDK8WaHhhsSBS2+xX1+pIKQCnaZv3Pj13Wi5EOpP1gY0bGFNl9FvP3vud3elfCp1dzjN2QpN7Pl98lW/5b5DU95rVT1eJbI8hGBtMWltKwUySBsGvEuO+fZThnigfDMYwDc63WUoUMwE5NscHkd5i7D4iVjmUcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f10VvI3t; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f10VvI3t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200919; x=1801736919;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QXMEtl91EgNuQzcim1t6NyEJkWvP3FLVD56aYTDnfMU=;
  b=f10VvI3t/F5c17vG/Z9LPa/y1SLRIlNNHlr4Yu/GBiivzO5tb8RkLM5i
   A98USwK1cDfYvMgV0ySg+rfZWQH45BARO8RGLBdeX71CA83VIHFkauhCo
   1E3/adOk35x8gJI+JJV9DdQGOrdoEd9S1EssM1bkxsOm/v0AdJ3nu0/TQ
   V1/GNmfS9HltRLouIrPg3SbVfXCqoTiWWPiXoa9pJ0KMQMGsV+uuR05Nk
   T7gce0/M7haUY1OiKYJ0Uu+zwzXYiFbol44jh3xcf739qkRqvqvXWk7q6
   rEPgl+zR5n5iZ8AzetHMKmLN9SSuNP+745t2XB/Hdlu9F5DMp1rj5NKMp
   w==;
X-CSE-ConnectionGUID: RSk9TBYWRU+gMdWUkkHPrQ==
X-CSE-MsgGUID: crIRMtf9RmWge5aRgf6EGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71444482"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71444482"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:28:39 -0800
X-CSE-ConnectionGUID: yv6gxf+0Rq+5xDsAt6CnBw==
X-CSE-MsgGUID: WLj6LvHATf2BrswC8IoFsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209223428"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:28:37 -0800
Date: Wed, 4 Feb 2026 12:28:34 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 4/5] staging: rtl8723bs: use standard skb allocation
 APIs
Message-ID: <aYMfUlsYxnb6vKfc@smile.fi.intel.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
 <20260204064455.1379342-5-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064455.1379342-5-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 03:44:53PM +0900, Minu Jin wrote:
> Replace custom wrappers rtw_skb_alloc() and rtw_skb_copy() with
> standard kernel APIs __dev_alloc_skb() and skb_copy().

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


