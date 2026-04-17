Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D414B35F161
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776448217; cv=none; b=uN3FaiuW+ane4+xvAdBYp0zKcgDpx2hKkTn7c+TkRRD9LpDdA2S4N4WZuLZC4XeHBU8FUrtS2MUbqB+n6wujr3bZlQl3YO9PKGkszTssXUEO+hwTqQBoyQ4IFJaKmOZMu3ZMxQ4PnDpY87tTyxnl7sMLPHi/xEUpyXrOwzThhtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776448217; c=relaxed/simple;
	bh=HvEZi8Qo817rkQnGSXRBdMdoK0w4KRukDFQcJo1ZueQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DXtEdIs8mXC1VcO6ruVq9EAnYaLLRDQOfSmV7T09cLe3wOpG1b2n+gMHFXQz82CHGghq1xpdet2uGb+0lZtwqImBWAvA79ZuFfrKr0vCIflS6bWu/RDSRrIpaPmmtQ2vsTaGenSVVE6pfzXpMc1y5K2x7p09tn+XjakneIW4wvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QCTgg+5k; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QCTgg+5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776448213; x=1807984213;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=HvEZi8Qo817rkQnGSXRBdMdoK0w4KRukDFQcJo1ZueQ=;
  b=QCTgg+5kLtviFb/cTie1OGAUdJ7dMHtRVl6n6swdfl+WJNErQtR6J0ru
   KHe+ZuHJwFU7v3iBpshzyyK7ZUqkMc1pQ+P5MDuzLfMBU0720IFnMB5na
   sz+PYArNl7pxMTOHyAuc4S8FVALM4j/0euQeSUE0+KyTO0sUbYAOBOdcU
   GBOcxLDNlwYF2NsumvGUpSMwhCTK+QoQTg/ui84608e3blLAMYcG2BtPb
   MN3FeQtoEoQ+RENZWNFLPEYEs6qPAB/b0hAZWOndcEUJEnDcnKrVQNypT
   JIl9K8hXxfJdU0KeJ1WXKkARnFCCd3k2Na5HCahU3p70cou65DNCNupKm
   Q==;
X-CSE-ConnectionGUID: Xujm7z1YTlqWWuQ5i4pl5Q==
X-CSE-MsgGUID: +PwIUNAgTe+Tjt6fCP9CHw==
X-IronPort-AV: E=McAfee;i="6800,10657,11762"; a="81067212"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="81067212"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:50:11 -0700
X-CSE-ConnectionGUID: UvXL30zFRLGMFzm+5uB2xw==
X-CSE-MsgGUID: x1fnnLMRSRaA3ZjcvsH5Lg==
X-ExtLoop1: 1
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.78])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 10:50:08 -0700
Date: Fri, 17 Apr 2026 20:50:05 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/2] iio: frequency: ad9832: remove kernel.h proxy
 header
Message-ID: <aeJyzXXX-2zOgU3A@ashevche-desk.local>
References: <20260417101623.1281-1-joshua.crofts1@gmail.com>
 <20260417101623.1281-2-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260417101623.1281-2-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Apr 17, 2026 at 10:16:22AM +0000, Joshua Crofts wrote:
> Remove kernel.h proxy header and add replacement headers (array_size,
> dev_printk.h, kstrtox, mod_devicetable, mutex, types, asm/byteorder) to

I guess it's better to add .h to all of them.
No need to resend for that. Perhaps Jonathan tweaks it.

> maintain atomicity. Moved asm/div64.h header below generic <linux/*>
> headers. Additionally, add bitops.h for BIT_ULL() macro.
> 
> Audited using the include-what-you-use tool.


-- 
With Best Regards,
Andy Shevchenko


