Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B65B2C1595
	for <linux-staging@lists.linux.dev>; Mon,  6 Apr 2026 19:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775504473; cv=none; b=Pj1/JaGG2Ba5973s3dDHEAumcttnFd3W+u/D2ZySAOk74k+fvy67rcatjAMioWurmJsQ35mPRFlxL9RoOCCIzX9yXsiqdTP3bOmgKjQXt2hu7AUJSv11o3rr5vur75qWQqmIwzZkhhJ35lblPUZZ3Ff/tgUH/C1jtEuwM3MMGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775504473; c=relaxed/simple;
	bh=3lJBnLxzR7G3aaNBk+UKUX0z5q0mlgImN+twMV56KXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2As9WT/txXVT0sSq00/vsYVzUTLG2/YKxEH8WRf/T/HHPXORwxO9IN1pe3W80fEGaLuD0NPDmbI2iHQ58i6YtxLoSoMliQCFkndithKqlk0ddU/Rm5r4Cl1JfwoqBDM1QU4IjhOUm4RkoKOXB+hDvgVkAz88XNbaHmavf1U2Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mXltIKOA; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mXltIKOA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775504472; x=1807040472;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=3lJBnLxzR7G3aaNBk+UKUX0z5q0mlgImN+twMV56KXw=;
  b=mXltIKOAbxVXHxaU24reHbOGQ6X2BoHzbCszy0lDy2OE3cJ6blYYo4WI
   gk28hdSPWWhEWEwaz7AdwitUcOoix0g2k2gEpj54eoADh/oCTvn+tl/Rt
   Z6DPcaEJV5Ss4swqrdfnAynac/Z+vcmapUMng9sGoOFqKu9E25qHsxec2
   Tx6bKYqxiyfRIR8VGS6M7S+ifzfQsyUE+rfazuex8H8XjiddpVzuM9RgS
   YqDll2TdoJKrvaMGuw8Aj3zqGf5LT5fEqMSLDtgiRnAml00nA/Hpz4xeD
   ZrmZTAM20yPViv4EppAZqsw7G1SIs4zfNYKJHiP6uhk5K8qDbRjyQsrtp
   w==;
X-CSE-ConnectionGUID: Mg8Bj3vBS1WFxt4jd+7qEw==
X-CSE-MsgGUID: FoOoAtHMQ7+dd2m+37WmDw==
X-IronPort-AV: E=McAfee;i="6800,10657,11751"; a="76174771"
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="76174771"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:41:12 -0700
X-CSE-ConnectionGUID: amulHOPjSY609DBAlEXqtQ==
X-CSE-MsgGUID: zYtkB5vxQaiyksTOw5Kjtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,164,1770624000"; 
   d="scan'208";a="232354734"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.73])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2026 12:41:09 -0700
Date: Mon, 6 Apr 2026 22:41:06 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	grondon@gmail.com, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: cleanup parenthesis
 alignment in pci.
Message-ID: <adQMUrq7LlR2qAdF@ashevche-desk.local>
References: <adFrJmqSfx7dEJWt@ashevche-desk.local>
 <20260405143910.10517-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260405143910.10517-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, Apr 05, 2026 at 04:39:11PM +0200, Joshua Crofts wrote:
> Cleanup parenthesis alignment as per checkpatch.pl in the
> pci/ directory.

Thanks for doing this. However, the proper fix should be the getting rid of
copy_from_compatible() in favour of using iov_iter. You can consult with
this example:
49aa6ed94c5e ("ALSA: korg1212: Convert to generic PCM copy ops")


The current patch in its form is quite low priority and not guaranteed to be
ever applied. Sorry, we consider real patches to be done first, see above.

(Note, the rest of the patch is okay, but again, quite low priority.)

-- 
With Best Regards,
Andy Shevchenko


