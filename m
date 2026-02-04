Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EF0B38B9B5
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 10:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770200193; cv=none; b=b0nGXSj5NFFGYphZBwz16tw9uEyT5W5iafJVc1fltGdFWoqTpfcAbi+u8V4zrXi4bCywHiCPav+fxeqjHpT0uCMyQYd5kdmUZ5SK5LOK7B4dljMHrPYS5fTC11P4sCnA2AXvU3ImVTIb0sH/Rg5yMFitJ0Id58SthyYo4BtmvXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770200193; c=relaxed/simple;
	bh=aF5c1ZEURSml07w/Juok+HWFymsjTtJUjW25U3h9JBA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vaa0IeRKN4H6crG2qjdNWrR7GvwmcHoCICIzjdGA7q+XfPqF/m+wktdDNoNJzPlE+B0oFbCUiFZGypU936T5HZloGZ68oXhwQH7t9By1DuixBKEeW42OjvF19I94adfLb9QXE2yRBaUgWLZNxOltZklS7qVvOtETqfMq/ZuMJjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c1U4CrNJ; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c1U4CrNJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770200192; x=1801736192;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=aF5c1ZEURSml07w/Juok+HWFymsjTtJUjW25U3h9JBA=;
  b=c1U4CrNJXlueLgYcjX9CCnRlhIiOfDTXV9yC1xP4VHcHkOcQXa98eS/S
   2ScgawDMnxT4uyQjuPFfhPt1pRS3LkbeI2OuKxz5NToP8xwtvzP/gRt+Z
   1bMW6hJn2921LeX/O/BtgBawMxKfeW5d9wKbQCvOk8wSn+aAVHCRYMrG6
   ytMW/jpDb7o+DsLo3N7cN+0WLZA2b8cIveswvQkw3d6KGeP0PbJtn0i6F
   HkQb7+48J4K/jnArPM7oZNEqhInOxEjq7fH3oMECes2K9I/fG6tdHjuX6
   yNJp6xhXq32CEp6p4GfyiZNBKmSOI2yOBeyQmAXs5ExGNX7t2FLAgZHRL
   g==;
X-CSE-ConnectionGUID: jC4UVeTwS5SMkvJu0Jp4ng==
X-CSE-MsgGUID: SzZI27TKTU+6bt82Oho1fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71366082"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71366082"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:16:32 -0800
X-CSE-ConnectionGUID: m6/+5BuTQy+Bx4P6CGKu5g==
X-CSE-MsgGUID: Rz549o/8TcWfv+jD0TQKrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="215103881"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:16:29 -0800
Date: Wed, 4 Feb 2026 12:16:27 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] staging: rtl8723bs: introduce kmemdup() where
 applicable
Message-ID: <aYMce65kLITLyoq5@smile.fi.intel.com>
References: <20260204064455.1379342-1-s9430939@naver.com>
 <20260204064455.1379342-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204064455.1379342-2-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 03:44:50PM +0900, Minu Jin wrote:
> Replace memory allocation followed by memcpy() with kmemdup() to simplify
> the code and improve readability.

Right, thanks for this change!

My comments below.

First of all, you also need to add a note why GFP_ATOMIC.

...

> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)

>  		spin_lock_bh(&pstat->lock);
>  		kfree(pstat->passoc_req);
>  		pstat->assoc_req_len = 0;
> -		pstat->passoc_req =  rtw_zmalloc(pkt_len);
> +		pstat->passoc_req = kmemdup(pframe, pkt_len, GFP_ATOMIC);
>  		if (pstat->passoc_req) {
> -			memcpy(pstat->passoc_req, pframe, pkt_len);
>  			pstat->assoc_req_len = pkt_len;
>  		}

Now {} should be also removed.

...

The rest LGTM.

-- 
With Best Regards,
Andy Shevchenko


