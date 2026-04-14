Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B5723E0224
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 11:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167114; cv=none; b=nVPb4N61pTOERXrUETa6mEog9MqQZVQoWRRx+518A/YZyOEZ9dPxfpm7Bhy3vbAlZShbM29zDOwPKOq2zVglbyTGmVFWyjo9l54OlPXDTc4MX+lEcG6SN3EYJFh5qelj0uG2LlMjevz4qyJ2Jikbj5ReAeYTWV7oLn31FrqYewA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167114; c=relaxed/simple;
	bh=L08yeBng+29dPh7tsgQQ+ZDrZGepWqR/x7F8+8L88Xs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=koqb+X+QGWBim5lb21RZ93g0yDeOWAEipka/YXPf+dgyyB7U4TpSPw7ZTW2HPfp9e2L/raEwY0I9CeNT0RzcruIoUR1mxksfXJDd5ksHL1ElOYZX92PWP6LskdJAXScJOLsm1T+FUI6/8OvHHjskghOkUgGSl01sh+ExzocgLUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FwEpF6QH; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FwEpF6QH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776167112; x=1807703112;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=L08yeBng+29dPh7tsgQQ+ZDrZGepWqR/x7F8+8L88Xs=;
  b=FwEpF6QHFQOuA4YkNWZ++q86C6hWbwntL7J2rDqMZbzllVZQvHnZm5+7
   R4wSV2I1iGlHJrTAkOHJcpC2Rfr4WFrvWNSyEI3X+r+t44k0x/ny0W1Xu
   uhtH3Rq1azNTZQ4OUg/3Qg8O3tyNGUEgy/0U1G3VfqW1pHFI2553zwzS8
   LurG0XWK+e3wVQehEuB+P0bNkrhNeQbPvuESYbjnqHa1+svxpFm7XDWZk
   8tyJgCB9kG627e/n011f5NKIdJazip4s1dTD7Z5vRXj0oqrXv/pyL/pCC
   CgL9yfyUW8QcVI+RPMsdGUKIDRk9lGOD/cXCqcxYVnQEjFTEWcUoixSq4
   Q==;
X-CSE-ConnectionGUID: MPlVlSAiTRG91CVPu+4GMg==
X-CSE-MsgGUID: mbvVCe0rRkuVgZPrP+JhzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="81005351"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="81005351"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:45:12 -0700
X-CSE-ConnectionGUID: 6PBNKJNhRqWuC8/vYEpUww==
X-CSE-MsgGUID: Vf8W3KKzRICuFEXvKiIYWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="253293734"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:45:09 -0700
Date: Tue, 14 Apr 2026 14:45:07 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] staging: rtl8723bs: remove extra blank lines
Message-ID: <ad4ow2yU9N6U0BWt@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-2-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-2-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:25PM +0300, Marc Finkelbaum wrote:
> Remove double blank lines between function definitions and between a
> function end and the following macro definition. Also remove spurious
> blank lines at the start of an if/else body and trailing blank lines
> before a closing brace in _TwoOutPipeMapping, _ThreeOutPipeMapping,
> Hal_MappingOutPipe, and the HalSetBrateCfg rate loop.
> 
> No functional change.

...

> @@ -394,7 +388,6 @@ static void _TwoOutPipeMapping(struct adapter *padapter, bool bWIFICfg)
>  		pdvobjpriv->Queue2Pipe[7] = pdvobjpriv->RtOutPipe[0];/* TXCMD */

>  

Haven't you missed to remove this one as well? Or even more if there are other
similar cases...

>  	}
> -
>  }
>  
>  static void _ThreeOutPipeMapping(struct adapter *padapter, bool bWIFICfg)

-- 
With Best Regards,
Andy Shevchenko


