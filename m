Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24E182107;
	Sun, 15 Oct 2023 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z1dNk9ki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697358257; x=1728894257;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UCl1SBB4cAuFZdCAf7wLUcAPW3DezCTL2qwAVti9xak=;
  b=Z1dNk9kiTn28Nr+qRLVhfYNakhJN4f7WvyaN6Ax+zR8rfYXdeEhsAOmJ
   3tOGBMkfg/6drYfQdHZRI58eDvjvrYBuhR+Di2TlT3ovYxP7qcWySEGBV
   gE+xuLNoTM8GqG/X8KJsLJwzRGrZk1rAv3sKJlBYvNS1CljV3UF6G5bhg
   zMwut9eT8nuQdpPnEqdsVzPm0kJj1x/HM1owzkCm1KRebqAN3kqq1bT83
   yLQMLJFNAy0mduYQv8x+nXyG555nAHSFOW/3FcG7E3lc/K+Yq564DkiPC
   pggMd1n4RXXIRFOibCZ5LkpPgsERWUQaZYcV5K+7LdNjCCskwse1A7Rw8
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="384247396"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="384247396"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:24:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="825617109"
X-IronPort-AV: E=Sophos;i="6.03,226,1694761200"; 
   d="scan'208";a="825617109"
Received: from ingmingt-mobl1.gar.corp.intel.com (HELO intel.com) ([10.214.164.147])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Oct 2023 01:24:12 -0700
Date: Sun, 15 Oct 2023 10:24:06 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8192u: Align descendant arguments
Message-ID: <ZSuhpu97lW45BEeS@ashyti-mobl2.lan>
References: <ZSuYUmX5P5M0Ok/I@gilbert-PC>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSuYUmX5P5M0Ok/I@gilbert-PC>

Hi Gilbert,

On Sun, Oct 15, 2023 at 08:44:18AM +0100, Gilbert Adikankwu wrote:
> Adhere to Linux kernel coding style.
> 
> "...A very commonly used style is to align descendants to a function
> open parenthesis" - (Excerpted from Linux kernel coding style (#2))
> 
> Reported by checkpatch:
> 
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
> ---
>  drivers/staging/rtl8192u/r8180_93cx6.c     |  4 ++--
>  drivers/staging/rtl8192u/r8190_rtl8256.c   | 16 +++++++--------
>  drivers/staging/rtl8192u/r8192U_core.c     | 20 +++++++++---------
>  drivers/staging/rtl8192u/r8192U_dm.c       | 24 +++++++++++-----------
>  drivers/staging/rtl8192u/r819xU_firmware.c |  4 ++--
>  drivers/staging/rtl8192u/r819xU_phy.c      |  2 +-
>  6 files changed, 35 insertions(+), 35 deletions(-)

Do you mind splitting one patch per file? It's not really
necessary, but normally easier to review.

As you are here, if you then run checkpatch on your patch you
will gather ideas for your next patches.

Andi
