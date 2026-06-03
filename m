Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A004248873
	for <linux-staging@lists.linux.dev>; Wed,  3 Jun 2026 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780445763; cv=none; b=EizDf8QyWpMzc3Lhy0wpx52WHWwXpz7GrEJCNkkEdM6sQBWRDXIT+8ONOVgNJcvgSYGUctHwbRG9u41uOhLwWL4NaDVyJIR8ObtqQcZVOgd6p6lSk32BkExDV9iMwj20WK+BLTUGFmrWg5t8sXapb9UApuuu+70sBbxViogYlOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780445763; c=relaxed/simple;
	bh=i80dTdE1+UXOUl3jXzP1ige0CoxkMSHRQiTBLC17I0s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KUtCS610huJ+NUaRzCObDD6F9j5by5TW6t1klHXSEib8NJbF5Gzqh/G+zxuSfnWi8Pgc24szWE9h33cRSccW58QJzZQKdKLEb5DdbiZdSr0S48vpRysfcFeaJyrZq+fHT2RGqVF2nICWGhD6DzfhkEA2uy8yyA01+sGAUw/8ISQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gz6oBn14; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gz6oBn14"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780445762; x=1811981762;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=i80dTdE1+UXOUl3jXzP1ige0CoxkMSHRQiTBLC17I0s=;
  b=gz6oBn145cNUHzdu4lVoMFmMUmYdtekzxRFdl8C4reJ/bYvObxCr8/tE
   dZtPOIx3MGXBDH8pnnPxI+MOzePEM4U7xHjkzn4f2qLMcC7ookYvcoSoR
   bHb8bt8g3T3hOOovKGXt/ILDVY48L4eaF9JNfH+IBbxCBjBojevO2Jz3G
   bK+3QXMMp6W2XJN+8unvySxukXyZVEjgbN2FIB4uas1xV1CMH+4LalUqQ
   BBIxy8KU0IpUrgAlE+i47ySuKEL2DDSOJH4SkEMh2lCqNIt6DEXsTJxlx
   k+wkfwlkeEkyPgu4sE03YbDCFfGBeIkp/fWCJbqvcbi/ZQ3Q8vrcWVnJC
   Q==;
X-CSE-ConnectionGUID: Rf6NI2ylQjS2pRuy059lFQ==
X-CSE-MsgGUID: n/P0r296ThiQkCs/FlmUzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="98808445"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="98808445"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:16:02 -0700
X-CSE-ConnectionGUID: XZrZX62nQSColqR5hunWSQ==
X-CSE-MsgGUID: PJTSYiUlSEeeBq0Ctxtpfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="245874369"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 17:16:00 -0700
Date: Wed, 3 Jun 2026 03:15:57 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Krzysztof =?utf-8?Q?Wo=C5=9B?= <krzysztofina2022@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	khushalchitturi@gmail.com, architanant5@gmail.com,
	s9430939@naver.com, kees@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: fix coding style in rtw_cmd.c
Message-ID: <ah9yPVVEwiBF_BAo@ashevche-desk.local>
References: <20260525201001.14852-1-krzysztofina2022@gmail.com>
 <ah9nar_KAw49VKfO@ashevche-desk.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ah9nar_KAw49VKfO@ashevche-desk.local>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Jun 03, 2026 at 02:29:50AM +0300, Andy Shevchenko wrote:
> On Mon, May 25, 2026 at 10:10:01PM +0200, Krzysztof Woś wrote:

...

> > -	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 - ((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> > +	pcmdpriv->rsp_buf = pcmdpriv->rsp_allocated_buf + 4 -
> > +		((SIZE_PTR)(pcmdpriv->rsp_allocated_buf) & 3);
> 
> Is this the only single issue of the type in the entire driver?
> 
> Also, now it's harder to read. What this code does is as simple as
> 
> 	pcmdpriv->rsp_buf = ALIGN(pcmdpriv->rsp_allocated_buf, 4);

Actually it is off-by-one kinda case, so, please double check the result for
last two bits being 0. If the rsp_allocated_buf is byte type (or void *), the
proper one most likely will be

	pcmdpriv->rsp_buf = ALIGN(pcmdpriv->rsp_allocated_buf + 1, 4);

> (need linux/align.h to be included).

-- 
With Best Regards,
Andy Shevchenko


