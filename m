Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938C42770A;
	Mon, 16 Oct 2023 21:28:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ds2OINMF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697491690; x=1729027690;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YuEvxvbRQHuoGsy33W3UvZxxg9UVkl9Dv986sm//sCM=;
  b=ds2OINMFMeWIHD4A1qfeqtv+fxxi+zRXvKiFsuWFC1Pd6E+NOKtbXj4U
   Tzzdyrj56tysa/BPiK/GCQ/faSJqcAu2PIleVoTjzMDtikDaFSy8xCKgU
   QzzwGGQi371PE+ZX4xwPTD0oSEwJTq70ZPUm+BBLFYjgPD3U8x7kL2Zw2
   t1hI9c1US32gapxiWOEbElmzdYqkDXm2L7gwJTJH2XQL/A2K5d6a6TmyJ
   a0vwuiLihvfI+dkUUBd1ozmiDegIaTbgxs7bJ8iqsQhyhi6EyS0Yfwq4R
   lmuLOPU+VuiMJVSvFEAiiMGYjLgIG639nsFNFQueGlYwVpxKjml9XRx2s
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="449865291"
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="449865291"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:27:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,230,1694761200"; 
   d="scan'208";a="3797840"
Received: from yckhoo-mobl2.gar.corp.intel.com (HELO intel.com) ([10.215.157.119])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Oct 2023 14:27:16 -0700
Date: Mon, 16 Oct 2023 23:27:03 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Gilbert Adikankwu <gilbertadikankwu@gmail.com>,
	outreachy@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: emxx_udc: Remove unnecessary parentheses around
 condition tests
Message-ID: <ZS2qpwnfCxsbvOld@ashyti-mobl2.lan>
References: <ZS0f+xaaLmLpKv2a@gilbert-PC>
 <2023101658-unmoral-survival-25cf@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2023101658-unmoral-survival-25cf@gregkh>

> > Fix 47 warnings detected by checkpatch.pl about unnecessary parenthesis
> > around condition tests.
> 
> And as I have stated numerous times in the past, they are not
> "unnecessary" at all, and provide a valuable hint to the developer as to
> what is the ordering involved.
> 
> So you can ignore this checkpatch warning please, it's not valid as far
> as I'm concerned for the subsystems that I maintain in the kernel.

I find this very confusing, though:

   if (((ep->epnum == 0) || (data & (1 << ep->epnum)) == 0))

Andi
