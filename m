Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875B335BDA7
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 15:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775574395; cv=none; b=qbBAIdc82dRLUgBThxnKD9CQ6B14xAuHL9DexGOi5FEcAKPAKTmDN9lIjXR1YxxLFu6rb+sJZT6BIfaIETQiz9UuTBlfCY0Z4y3PGHSyvAE+2t1ngW3OdZgmRLOV8Dl+BkqZmS/CeDA+DBBHEErNs/saHqxxj8/uyW9I+hg6sW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775574395; c=relaxed/simple;
	bh=xP86zjvYSIpQI8ZG5mdMmk5DvC1axNphzSqM+YKlXBE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gv0PzuxFa2IUM2ShaO1j0uzfPOWEl27Ji8OOteFNP3Rrehwzd11o20lRGNtderKxCWFjtC1SDl0rIHThwBm6pJAigQ2x32I5QrZFxSGsrrralvPlJxh0Y4EDcib01KHe6F/n9CrDklDSWs8S9xjCmTiIp8gkApg30LtZz0mnWBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AdimICD5; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AdimICD5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775574394; x=1807110394;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=xP86zjvYSIpQI8ZG5mdMmk5DvC1axNphzSqM+YKlXBE=;
  b=AdimICD5E5HZGkMVtBWugQRJUKOs0liTkUHGQ2gv6uZkx/GuLjEXqiL1
   2DkRCi5Qh01HHOTlWPf0pi7VN3R1vAV8a+FADMBEFITSepF/J03UI6x6S
   InZ/AtstJuuk5Bpvs13FzShctlzZyu3ocPlPEweSpMx26dRrQR/hngk+l
   dzo9TAmMnjByXmKzXWc41VQTrF4gHLCM8mYxjBR/bJMW6AP9hX1HOOBnO
   bAB1zTepGSeWko/sdnCMnqwFcwRJ9CLkktDJBGAUBW4GrOp8foBl6lc8W
   XGefCVR486GBF3UuBAqdMfioylh0Pf2F8qMVKqT6dqwANl8LNrtxc2s8I
   w==;
X-CSE-ConnectionGUID: 2mETiMicSfiyxzmlrtdoUw==
X-CSE-MsgGUID: p53lnG3PR+S4YmS9csne7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11752"; a="80132827"
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="80132827"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:06:34 -0700
X-CSE-ConnectionGUID: l7NhUxXRQGyMuteNNQZg3A==
X-CSE-MsgGUID: Z5vouaf3Rq2RPSVMy28rVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,165,1770624000"; 
   d="scan'208";a="227358172"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.182])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2026 08:06:32 -0700
Date: Tue, 7 Apr 2026 18:06:29 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: linux-staging@lists.linux.dev, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC] staging: media: atomisp: change copy_from_compatible to
 iov_iter
Message-ID: <adUddSgsIhsZ9WP3@ashevche-desk.local>
References: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CALoEA-wrnqUM_5hDGUL1xJi3crf64ApE7fUrb2_47xVzhBT35Q@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 07, 2026 at 04:46:49PM +0200, Joshua Crofts wrote:

> I've had some spare time and looked at the copy_from_compatible function
> in pci/atomisp_cmd.c. You've recommended checking out the korg1212 driver
> and patch for adding iov_iter support. What I find strange is that the korg1212
> driver already expects to receive the userspace data in the form of iov_iter,
> meanwhile atomisp expects a from and to pointer along with a boolean
> whether it's coming from the kernel or userspace. My question is whether
> you meant this as a local fix where I'd use an iov_iter in the atomisp_cmd.c
> file (maybe separating the functions to user/kernel, since I don't
> really like the
> passing of the from_user boolean)

iov_iter has a type that implies the user or kernel buffer.

> or if you were hinting to a ground-up
> rebuild of the underlying atomisp architecture (which is definitely a tedious
> task, looking at the source code).

I believe the second (latter) option. The code has to be revisited to convert
using iov_iter and drop the custom code.

> Thanks for your time.

Thanks for looking into that!

-- 
With Best Regards,
Andy Shevchenko


