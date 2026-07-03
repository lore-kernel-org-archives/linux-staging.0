Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DBC3C5552
	for <linux-staging@lists.linux.dev>; Fri,  3 Jul 2026 13:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783086947; cv=none; b=qFG5D0/axvn7AYd7ntCHcSFq/rWc4UyQXnryWu/jHkWd1StDGlhxZFxOKDk06OOPIEYp6STd8+Ee3yF+g7h3YW03bJjF9FEPFpjoKzN+6ovEhp6NkWZes+c20wgqf5cF/eNmAtyZ9tpgDYbt1xCb+5rUHTxtPbRTFrJ0y20uZKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783086947; c=relaxed/simple;
	bh=oWaLTBZdyoTLGMWuohEPtMDh9m6IyuSmsXxx/BcMqxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ia+Xq8tZrBCoj1j/Fyu1y/QyxlhrRcz9bHSzqX4TeqhGoraD9Lnv6sRtQYWzdRcmAKLlXZO4pqmtRGFyMAQpB8tCPFedYFyy99jBRzA5PPGTYYeZYfqEADVqwNb8Vw6xChkcnzVK5xMBd1+JnQ9kgjWg7J4kIaplEKitInoMTls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E9xHi1PQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E9xHi1PQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783086947; x=1814622947;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oWaLTBZdyoTLGMWuohEPtMDh9m6IyuSmsXxx/BcMqxI=;
  b=E9xHi1PQUgFPZNxkg52lwQloXLT0rVZ+L7rlVc3wWyKnnMJ32UjBzbUt
   MqS9fbwQ34ts64jv/SOoPHMCuZUVYjLOkS74MQ10o/IORmOqleLaUQ0Mu
   g8BloXG9lBiaA1DP6eTfZtxzITEiMvbEVwt2ItRx4SEOWppfbIXEwOF5v
   qqE8CQ3XbQ2Y7Vc/IlsxTNtut74ScA/P/yYMkGql7JD//E0fB0OCYbgRp
   vnxCkFBORkTfwJQviIqSamPZUh2GODaE3iHcX59iYwyHrJ+CWVlAIMKA4
   gSRLaFUCF37/o3wzq6Ofj3I2LP6kJw43Z8SlNoMKatUli0XAhSr1RRVzM
   Q==;
X-CSE-ConnectionGUID: 8RHXr60tQOS7WO6UuWV1Zg==
X-CSE-MsgGUID: VJaWDQLMSQKI9x51YMZWpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="101261426"
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="101261426"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:55:46 -0700
X-CSE-ConnectionGUID: 353lQIrwRn+GMLHWXvb5wg==
X-CSE-MsgGUID: NNJDSQJETGWHE4GfJjYHZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,145,1779174000"; 
   d="scan'208";a="248670621"
Received: from carterle-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.80])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 06:55:44 -0700
Date: Fri, 3 Jul 2026 16:55:42 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] media: atomisp: clean up block comment formatting
Message-ID: <ake_XiGhzQNMQx3S@ashevche-desk.local>
References: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702135230.19030-1-bohdandmarcus@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 02, 2026 at 04:52:27PM +0300, Bohdan D. Marcus wrote:
> This patch series addresses the block comment formatting issues across
> several header files in the atomisp driver, as suggested in previous
> reviews. The comments have been reformatted to comply with the Linux
> kernel coding style guidelines.

Just no.

There are still issues after your series.
Become familiar with what has been already send in the past half a year
to linux-media@ mailing list regarding to atomisp driver and what comments
were given. lore.kernel.org will help you with that.

-- 
With Best Regards,
Andy Shevchenko


