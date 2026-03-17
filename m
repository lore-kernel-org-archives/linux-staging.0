Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B16737B40E
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 17:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773769042; cv=none; b=ptqFEv1XsVk5cctOnKG8U2rg0eRo6+xiBTrGNLBi2HKUY9v6lVXiFh1rtww7KWdwlUI12q/ioFFHzPognATCRR/47bSzxZSym6KLdsX2iEP4fpPawJTpK3zr7qdAyo8tJptaPdghfXlFz57DOpfM4JJIlvg7cIzhq/SFlUqnX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773769042; c=relaxed/simple;
	bh=Iq89bCyqqIJOt+t9nCqSXFwNRlxBW77PVxK8GXYW92Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fwB0LCUcx6+gBInqPba0hIxz//2ytXXAZAiT1yQKe93tr4ya5wnTQgtZJ2q9gQJS7ugxyAWgqJXqM3HvvSz/YTrk77afrq9pxmIwxc+mEByMBZp707TUEfA4i7W3Xd3d8Z6m0MXGztfNEoMCE9y7p2uoM8vcp6uKCCOPNGSggdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=L/wuhjP8; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="L/wuhjP8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773769041; x=1805305041;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Iq89bCyqqIJOt+t9nCqSXFwNRlxBW77PVxK8GXYW92Y=;
  b=L/wuhjP8lrAcBuXH9ULjbd/z3RSssv38Zlsb++tkRtAi/KCVSr3YFk03
   Cv2M9uLid8gIhCLDJ5YUoizERyQq/HN9+q+OKgsE3ERoNHnLhPu4NecKP
   VfujK12ZDIV02AYCFI1zWqHNiEti2kMeWRvLb6wHLE3HOkSuX3dFrxSKo
   qMdITopGmBQ6zP6oB99tZiFSaVK86tg/RcsMNIh80g2Oxu9tdMwkSnbz3
   nckilYhgtvV0/FwwF7CycgMirEfQR3iJvMyhgsokATXRPrY3rNmCU5baS
   B/0UIXmMQAbk2V3CRFDYKJnzz8WxLl3f4iCi3alKdzEgYzZYT7CJrrpSh
   g==;
X-CSE-ConnectionGUID: 2r82Nr7uSFmfjl0bHLzVaQ==
X-CSE-MsgGUID: D/pFmFFHT6aXZllS2GPs3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11732"; a="85439229"
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="85439229"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:37:12 -0700
X-CSE-ConnectionGUID: 6VQopoz4TTCbC9OcT1N4GQ==
X-CSE-MsgGUID: qwLSbtazS9mXmAyG6Wn7JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,126,1770624000"; 
   d="scan'208";a="221576753"
Received: from abityuts-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.97])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 10:37:10 -0700
Date: Tue, 17 Mar 2026 19:37:06 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Andrea Poldi <andrea@riposetti.com>
Cc: gregkh@linuxfoundation.org, daniel.baluta@nxp.com, simona.toaca@nxp.com,
	d-gole@ti.com, m-chawdhry@ti.com,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Minu Jin <s9430939@naver.com>,
	Archit Anant <architanant5@gmail.com>, Kees Cook <kees@kernel.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix line length warning
Message-ID: <abmRQl7pwvxcIXXQ@ashevche-desk.local>
References: <20260317165845.12594-1-andrea@riposetti.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317165845.12594-1-andrea@riposetti.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Mar 17, 2026 at 04:59:40PM +0000, Andrea Poldi wrote:
> Break a long function call across two lines in order to make code
> easier to read and also comply with the Linux coding style.
> 
> Problem was found using checkpatch.pl tool.

I can't believe there is only a single place in this entire driver like this.
Personally I consider this kind of changes useless unless they are coupled
with something real. But since it's staging, I'm not NAKing it. Up to Greg
and others on what to do with this patch.

-- 
With Best Regards,
Andy Shevchenko


