Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 625F037D13F
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773051669; cv=none; b=QvMWEvRSvOlfTcfLL42oZzUos9GCLfCqiOr3tNH0OhPUpNRYW5UXW6fHGHddCwp+aA1IHMQopQcj8/vwwcssCfdoDFAOVKQoCYNNhJ0zP6QVZEfJ5OGjA49XqC+Ra4zHnD3knCzDMmxvBTXPT9cbBOXGtBxi0a5cEcIA5vJNF9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773051669; c=relaxed/simple;
	bh=muH3iAGBUeDVCjZsMnj7SFIrN7mdSOrHQr189CuCpcM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c6jgp1+EsshhIMqcCaLSqw+Bjny03acs2z8syM8ZfO+XKcfOyuu+3B7EhPolDw+CflbIWOLs0y/I4N8jECefV65I27Dp+B9UMcI7N8q5AVHGX3Pm9bAetBJNBxv4ejuFCTXSLwYcWvsTXjFXl0tujCvY7QFOdQ+ruoi6/cS1B5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAph2PJE; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAph2PJE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773051669; x=1804587669;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=muH3iAGBUeDVCjZsMnj7SFIrN7mdSOrHQr189CuCpcM=;
  b=iAph2PJEqoBAzwEdrR04STtolDI98QzATWYxnrWux3HiNBFLbPhBUQRF
   hkQR++/nwBtFiYcA1QobuLQXVZpD+7a5xQsD6cQagaQ4BAipJvByXXcYd
   B8ABQPSgqGgZ8tDnM51tf8IMJuetA+Lcuxn81AskObekC20928IUE8G7n
   piKFJC/pglMQZbN25oD2JNp/miv86txRAX30mDMxg30B143IQG7rWBMCl
   Zpy8fbCx0oYVt7kSnkwwxUoJj9OatYhJQlIlvQWgZtx0gJI1A0LbpElVJ
   YV9RVFNnYwrCyX271KEIY83n6UG4rNBobGIQmVz8SnUOv455DRukv4TiG
   Q==;
X-CSE-ConnectionGUID: Zbyjn5xoRrKF9hew7Ikmzw==
X-CSE-MsgGUID: 2jq/kWKfT/GOGt8VqbPFJQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11723"; a="85543724"
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="85543724"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:21:08 -0700
X-CSE-ConnectionGUID: 88zw65zBQOuyK61leBoLgQ==
X-CSE-MsgGUID: JLigujz1S7SKs+B15bOK5A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,109,1770624000"; 
   d="scan'208";a="216656825"
Received: from vpanait-mobl.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.148])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Mar 2026 03:21:06 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 6A6C3121D1D;
	Mon, 09 Mar 2026 12:21:37 +0200 (EET)
Date: Mon, 9 Mar 2026 12:21:37 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laur <laurentiutopai2004@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: comprehensive coding style
 cleanup
Message-ID: <aa6fMZaAvMK-CyzL@kekkonen.localdomain>
References: <20260308215840.31197-1-laurentiutopai2004@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260308215840.31197-1-laurentiutopai2004@gmail.com>

Hi,

On Sun, Mar 08, 2026 at 11:58:40PM +0200, Laur wrote:
> @@ -2032,7 +2032,7 @@ static unsigned int long copy_from_compatible(void *to, const void *from,
>  {
>  	if (from_user)
>  		return copy_from_user(to, (void __user *)from, n);
> -	else
> +
>  		memcpy(to, from, n);

The indentation is wrong here after the change.

>  	return 0;
>  }

-- 
Regards,

Sakari Ailus
