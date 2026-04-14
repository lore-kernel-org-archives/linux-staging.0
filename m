Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51CD43D34AC
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 11:51:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776167487; cv=none; b=FFFbv6DEniIj986KoWnwqafKPPoUePBTSIbXeRNUa1i4gPjGX5rDlr5S9AXNTaep8UEPYhu3pyfDjAFU8LNhJKingZ1Ctm41rS5eNqCSn1oq+fcjFxv3d2ugoSN7aMnhk9wBjs8IigoiurJq588u4q9kMbDgvhRMrJPALGLfSE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776167487; c=relaxed/simple;
	bh=MSxERkNrA9al6FLTm5bYrhH4uE/Npz6rYux/UsZqUWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Pz2Bahj/B+Em6EkMohzZ0SlaWyND+5fKDtaua1ZpzauZwWAwHlRESotV6tiH2tp6AVzxyEjr99OY7bzQiQtvxSQRWR4Js/W2EIYGNset2A/d6QxSDqPzMvPhmjgVn9O+prZAuVvZUjO4e+0sOUMcMY7RByA2/ap5G7h/3ss9O7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qd0Pya5y; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qd0Pya5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776167486; x=1807703486;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=MSxERkNrA9al6FLTm5bYrhH4uE/Npz6rYux/UsZqUWE=;
  b=Qd0Pya5y6C84c7gC7qRj02XobYS0m97/C9UBKTW9mRoXpMw7/U7B7hxE
   5bA9SEfm9+OSir2KnIxM1ekl0v7x1WiJGxSQC0T49+g0t5MVWTbNieTd/
   TqlZkPOSxTEo8yt1ZK8o5cxSaI6MYVPm0gwVdb/YtHdMTE/05Qq4zB16A
   1DC6TUSqippOREIlOVOu42T37xOrU4odVuZCDPFGYZZ6PXgabkP+cQNQa
   GhSoA+u83b6UEpiPoeSW6q5rHgMrbu3GQU8XVVxzAJeQFJvoISf43R19/
   RWtNMCcOrbA9sQ0xEnTqb6yieFI7gkoj5B8Yvg4G0jSZlYAW3uSKC7/kq
   Q==;
X-CSE-ConnectionGUID: qsTNFsufSCGU1yJ15/JVpw==
X-CSE-MsgGUID: XtaKcU2DQqi2vFLwSfAuJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="87743839"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="87743839"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:51:25 -0700
X-CSE-ConnectionGUID: 2oFGgUd6SEy/9VlEauJCTw==
X-CSE-MsgGUID: 0ww2m/XET6W9ucbBHDulYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="260509131"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 04:51:23 -0700
Date: Tue, 14 Apr 2026 14:51:21 +0300
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Marc Finkelbaum <regpacy@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/9] staging: rtl8723bs: fix block comment alignment
Message-ID: <ad4qOTrlJcGZVntd@ashevche-desk.local>
References: <20260414095833.76480-1-regpacy@gmail.com>
 <20260414095833.76480-4-regpacy@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260414095833.76480-4-regpacy@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Apr 14, 2026 at 12:58:27PM +0300, Marc Finkelbaum wrote:
> Add the required space after the opening '/*' on continuation lines in
> four block comments: the two C2H event format header tables, the
> clear_evt inline comment, and the HW_VAR_DM_FUNC_CLR comment in
> SetHwReg.
> 
> No functional change.

...

>  /*
> -* C2H event format:
> -* Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
> -* BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
> -*/
> + * C2H event format:
> + * Field	 TRIGGER		CONTENT	   CMD_SEQ	CMD_LEN		 CMD_ID
> + * BITS	 [127:120]	[119:16]      [15:8]		  [7:4]		   [3:0]
> + */

These tables (here and below) are formatted with mixing tab and spaces...

You need to fix that properly to use either tab-based or space-based one,
not the mixed (current) one.

...

>  		/*
> -		* input is already a mask to clear function
> -		* don't invert it again! George, Lucas@20130513
> -		*/
> +		 * input is already a mask to clear function
> +		 * don't invert it again! George, Lucas@20130513
> +		 */

While at it, fix also English grammar and punctuation.

		/*
		 * Input is already a mask to clear function,
		 * don't invert it again! George, Lucas@20130513
		 */

-- 
With Best Regards,
Andy Shevchenko


