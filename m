Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85513CEB8F
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 10:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774521903; cv=none; b=sWTb5wSb0K1t/Kl/Wvx8sJsZnmj988yPKtDEgE0tdJY2NnkC8O19BhX01itMSd1oPXSExz42R2r2jRJbfTap4CLlJ0PKsV25xbu/3vjiqThT3rf3oM3eluOQtZ0V6E5or5BWERBRBCT3gl0SXHHxU9pV7ikTsRYaSrty8dpyb0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774521903; c=relaxed/simple;
	bh=urkfsvRVNuNPRb0KbV6AfNZhvpmcoRAOHhMuNd/WDmc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CQzmcKt4Zf2mnJyIbS9sNPWx1zOU1icQFrKnVRpc5BCR2ws4iShaRbxUH65zcRhg+/VmXU2T/n5CHIh8fH+GEA61sJjZslpFCcGEBPbcmJVnuCJUJTN5awHJLwTQh9l4GSMOFxO6m5IFB8qkHYe15OPLeAPMMMqPE2cwZQgH/Ng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c0cDsPbd; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c0cDsPbd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774521902; x=1806057902;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=urkfsvRVNuNPRb0KbV6AfNZhvpmcoRAOHhMuNd/WDmc=;
  b=c0cDsPbdXd4cWnubjBI645zO09SS60feNSH0OKS8EGrZUD4VBBS5uHqA
   3F6KgCH6VjIXXre5nCNA7CyHbvIc4FA/FV+ACbkVdRw1ocDQBhecWCLhW
   8RNQG8qlUgOAYZ0uJ9Sa4liBPadfFP4/n2zdR3J1zAkylMa4Yuj4HQ4Eb
   UZqPT2QnBlUNKqy5DNbmslloeDHm3X6gkTpa/lwdwRSgve2Rj9JZmqngg
   uLlxoLdhY98E67kZjZvR7OFZ78/RbjLlbEOorQdDb6bHbDFPIh3vvaKoW
   A/UEbE6ImjW1FaMVoiXRPEHnytd+EQDnlCKseUg4/HB7pYHkMilate2+t
   g==;
X-CSE-ConnectionGUID: pFhRE47PSd6PuP5EGaki2w==
X-CSE-MsgGUID: WYQJ0DFTTteaTAJa+bbz1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="75771160"
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="75771160"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:45:01 -0700
X-CSE-ConnectionGUID: eUchKPV+RaKYGXRHf8kjpg==
X-CSE-MsgGUID: N1u7WfFkQCu1AFJOuIUA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,142,1770624000"; 
   d="scan'208";a="262880688"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.216])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Mar 2026 03:44:59 -0700
Date: Thu, 26 Mar 2026 12:44:56 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Alan Cox <alan@linux.intel.com>, Arnd Bergmann <arnd@arndb.de>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Kees Cook <kees@kernel.org>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging/atomisp: reduce load_primary_binaries() stack
 usage
Message-ID: <acUOKIf3avxEPglo@ashevche-desk.local>
References: <20260325125948.1385064-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325125948.1385064-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Mar 25, 2026 at 01:59:43PM +0100, Arnd Bergmann wrote:

> The load_primary_binaries() function is overly complex and has som large

some

> variables on the stack, which can cause warnings depending on CONFIG_FRAME_WARN
> setting:
> 
> drivers/staging/media/atomisp/pci/sh_css.c: In function 'load_primary_binaries':
> drivers/staging/media/atomisp/pci/sh_css.c:5260:1: error: the frame size of 1560 bytes is larger than 1536 bytes [-Werror=frame-larger-than=]
> 
> Half of the stack usage is for the prim_descr[] array, but only one
> member of the array is used at any given time.
> 
> Reduce the stack usage by turning the array into a single structure.

Makes sense,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

*I think the original idea was to construct some chains out of the firmware
blobs and provide run-time combinations of them, but IIRC that was never
implemented.

-- 
With Best Regards,
Andy Shevchenko


