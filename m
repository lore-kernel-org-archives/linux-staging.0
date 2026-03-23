Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E2388E5D;
	Mon, 23 Mar 2026 09:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774257588; cv=none; b=OAGjUap5GWk81xJysgx5QqVsPkYj7j2i8vtqJWszijdU+y/WMIFRxiGwIHRHfHKlaX+908T9+OPxKh4kV521etdngPJS/EpkXmczxklgPaMPosB4oa9AZUx3LwWHR4x6F9IbqXhkLxm7oLcEPCuOi1rZ0YtjOxAKhtfDtp0BFb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774257588; c=relaxed/simple;
	bh=0M7JRG+XaQTRNXMUdGUhSfgUJoe1o8XBRFII1rVv3yk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qkr3KdmYJtR3zO9PA7t3avTvXY+qD6x4YNKQ7/apluX3R7YriRfLYM9m+hPpRXlfWIdzfEA5a2d/1OWgRUvnmvyG4F0aOFqHgvzmqnz2QRFapfsYvYok7fVIauIhgvASpb1dMZE8G6+5GEkP2V0NsG0E6U0+bYiGsi9UFaaeXGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uz+lw4RF; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uz+lw4RF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774257587; x=1805793587;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0M7JRG+XaQTRNXMUdGUhSfgUJoe1o8XBRFII1rVv3yk=;
  b=Uz+lw4RFG6xWkRCaW+3+MWEhAb0VIQfOu9mCCtI02neTNBKMwKok9vhS
   DoY6efKniJteHZJB7xvcoG0vwFWGIM5YTGGEdODOJfRu6CMFzRgjAHzSX
   AmTtTWPEfSB5BKdh3dbC5TPJStoGBz+/iozIdGhn+PkujVvOK8E1OeR5x
   yZPfzmbqdKX7Dg3BcxhDFd1ERt5WYXyUe+RVJ4rVq+gHxXnUTvbu5TMtw
   5deU5IKEZo0Z8JirXV8wng3FS0bgKqXv8uEFAOtVL/LzGQWN6GsbNA8PO
   mE0WcIIbkJuHkbPUiTG2dOfFXvaAFCCdW++9H0NhSuTdcGgy8rnIJTrWy
   g==;
X-CSE-ConnectionGUID: qQASMUB3Q0a1C1gh25cRng==
X-CSE-MsgGUID: eOdE2cb6Sx6V34KFhmD5KQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11737"; a="100702218"
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="100702218"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:19:46 -0700
X-CSE-ConnectionGUID: ym3dy4xLQa6S/x/8q3+nXw==
X-CSE-MsgGUID: Q+5OqCxNTICkK+vFSbKBpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,137,1770624000"; 
   d="scan'208";a="223166579"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.22])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Mar 2026 02:19:43 -0700
Date: Mon, 23 Mar 2026 11:19:40 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Prithvi Tambewagh <activprithvi@gmail.com>
Cc: gregkh@linuxfoundation.org, straube.linux@gmail.com,
	ethantidmore06@gmail.com, dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: place constant on right side of
 equality operator
Message-ID: <acEFrIIYaS3ZW8j6@ashevche-desk.local>
References: <20260321092536.138499-1-activprithvi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321092536.138499-1-activprithvi@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Mar 21, 2026 at 02:55:36PM +0530, Prithvi Tambewagh wrote:
> Place constant 0xFF on right side of equality operator when checking
> value of hw_channel_plan to fix checkpatch.pl warning and conform with
> the Linux Kernel coding style.

First of all, in the very same function there are more of a such.
And hence the Q: have you checked the entire driver? Please do.

-- 
With Best Regards,
Andy Shevchenko


