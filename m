Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F0F32264AB
	for <linux-staging@lists.linux.dev>; Thu,  3 Sep 2026 04:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788410327; cv=none; b=LhtFcagGJJmh1TcyiSVdoj+jby/4kkDlt2DejlBJOD84V+pwyBd+qLLhzockZ6I5RjeYV3qR+h0VAVhUwWArBlpQ7bQ9lEy8Eq7p7M0fl1ZIO3pHOUqE0iGECG9mflMssstjg0Vt2it0rB4RbLF37bafMRi+a8jDwVnJwSP1944=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788410327; c=relaxed/simple;
	bh=5HcDPVvfU/QGdKBl23/4a6+keo0j28eZUB+Jw9j5WWM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P6JXs0LoLGTlNimtrQWUj2BwWjdFvvMJUprCI4mOHLzeRT1RAhDN2ffmorl/x9EjRPg3gv5Izc2rCe8nPTLzevJ/0mYa28htYOers78HgXOCGkAQBI1SGwJvOnKwIG3ZtrSiXH8giSE98+PXuO/QXVfODcnXcupBp6NPueHIMW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TekYyxJ5; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TekYyxJ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788410325; x=1819946325;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5HcDPVvfU/QGdKBl23/4a6+keo0j28eZUB+Jw9j5WWM=;
  b=TekYyxJ5cB6JFllMyfv93U5+Qu3fsYgGzAFClUo0lpBN+BB6zyqt/yNT
   qyHPY4/mcuBLJlqSgM1VJEsCdGYeZMVdTlDsC34cQ7iKBxY3gSubuXgGu
   hnL/hjD3X1wKZl0uYcgw3ZymMG8bQ7jLIB7YOht7FihGvW8BGGADHSKzj
   8Q+4lVpntOGWNFGyMZfw+pCxtNM7fTXP/dQK4e38ywnyLtE13dA/NFATA
   rcgha4fsS2jPSmNmazVe3kVTYSLsJWjbFVdzDGrumwQzaVbCL9ccpXH4A
   9HA/PYX1jHbxddJGgXXA94mLf8XnVeXGnxKcSyOUTtaxfxu+u1rYFrV56
   Q==;
X-CSE-ConnectionGUID: +vapYJUlQfy59yIZrHfeog==
X-CSE-MsgGUID: MRumeJObRReuiYGNOPFDtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11894"; a="100236633"
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="100236633"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:38:45 -0700
X-CSE-ConnectionGUID: on50LPqaTlWvRvH42F2lxg==
X-CSE-MsgGUID: TGzr+IolSGWZxWN/iANwOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,258,1779174000"; 
   d="scan'208";a="273103789"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.28])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Sep 2026 21:38:41 -0700
Date: Thu, 3 Sep 2026 07:38:39 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Maurizio Casciano <mauriziocasciano7@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org,
	sakari.ailus@linux.intel.com, bingbu.cao@amd.com,
	jacopo.mondi@ideasonboard.com, nicholas@rothemail.net,
	andy@kernel.org, hansg@kernel.org, gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 14/16] media: atomisp: Use struct v4l2_area for padding
Message-ID: <apj5z0HtoNaqMoFn@ashevche-desk.local>
References: <cover.1788286339.git.mauriziocasciano7@gmail.com>
 <d1367eb59cf00cd1b41af2d85d4d33eb58e91b5e.1788286339.git.mauriziocasciano7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d1367eb59cf00cd1b41af2d85d4d33eb58e91b5e.1788286339.git.mauriziocasciano7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Sep 01, 2026 at 09:04:36PM +0200, Maurizio Casciano wrote:
> The padding helper passes width and height as four separate scalar
> arguments even though they form two logical dimensions.
> 
> Pass the requested size and returned padding as struct v4l2_area values.
> This makes the dimensions explicit and simplifies all three callers.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

...

>  	dev_dbg(isp->dev, "s_mbus_fmt: ask %ux%u (padding %ux%u, dvs %ux%u)\n",
> -		ffmt.width, ffmt.height, asd->sink_pad_padding_w, asd->sink_pad_padding_h,

> +		ffmt.width, ffmt.height, asd->sink_pad_padding.width,
> +		asd->sink_pad_padding.height,

Split logically

		ffmt.width, ffmt.height,
		asd->sink_pad_padding.width, asd->sink_pad_padding.height,

>  		dvs_env_w, dvs_env_h);

-- 
With Best Regards,
Andy Shevchenko


