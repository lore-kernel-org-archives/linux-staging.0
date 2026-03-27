Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF263CBE62
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 09:43:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774604621; cv=none; b=oaStU6EPlULN/B93k57XeNj+57kzyTNdLrKWTqMuN59n7fl4zWQuN/o4etK1300xavF/hkwzzhPOD7rNJjV/JD7jrFhsb837xJh7NjWMqqA9/MKbtYr/4m1osqwu+rqoTVUmmVbwE2W2GuLpgWkIQHRuuOL2HJ6fxZSJPBdKx6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774604621; c=relaxed/simple;
	bh=bamylWmR1vZQv59hRve1pmEGjn26j2CB5bErqvtB8Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnWQMKnz/PSqlvV3ozjvuP6bn2xPu6AGZmynylfAN9BWOObSLXyezrU6MIHc/nTzmUvzkaBCY6yJIoYqqMnZ8GtgeqJjWYQndaO4+kVfLm1B0X+mKXZmsn1l1Nhk9hM+4a22ZSmKZL3A/tofsaNWYE1pvP+vRQJrGzlw/Yny9G4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bqMgOzzm; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bqMgOzzm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774604619; x=1806140619;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bamylWmR1vZQv59hRve1pmEGjn26j2CB5bErqvtB8Qg=;
  b=bqMgOzzmuBA/1W2+xaRLy0SNkwuCHnMNyVRGTNvZqqshQJTd2FGXXSpP
   Q6fXq8lyKMzQ+rS6vGKZom1Zt2LwdP1HxW5bHuacCteuWUMqf8Et97+6z
   ziFJch7/Uun2UDoae8Vxt2YFXtFrUQ/g5n/ZVn56LnQF25X0NATJiDdya
   71SsXemvALxSe1urjHsKZFgg3UjJ7nZOxz9bjXA/SuBSNFjCltd8M9+V0
   FXfSdOlohXnratP3CCotKCHHJL/YbQJldlIndLsEIp8p9U7wBSkW0KkKA
   cmMeCkyq1KuZafzsyFtdJYMXdppV4CSebzJqKdxpoWwdPImFMZRkhoi+u
   w==;
X-CSE-ConnectionGUID: an9J+TmySnilmfMmm3ombA==
X-CSE-MsgGUID: H8IU/ZO5RBqhkYAixMsBbQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11741"; a="75874418"
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="75874418"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:43:38 -0700
X-CSE-ConnectionGUID: yHth6d7qQe2fetxs3XPzqg==
X-CSE-MsgGUID: IwziyWdCTkeiB3hJCQoLjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,143,1770624000"; 
   d="scan'208";a="224313057"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.127])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 02:43:36 -0700
Date: Fri, 27 Mar 2026 11:43:33 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Anushka Badhe <anushkabadhe@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, hansg@kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, mchehab@kernel.org,
	sakari.ailus@linux.intel.com
Subject: Re: [PATCH v6] staging: media: atomisp: fix GP_TIMER_BASE scope in
 gp_timer.c
Message-ID: <acZRRXXBoflHV0rt@ashevche-desk.local>
References: <20260327031106.10386-1-anushkabadhe@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260327031106.10386-1-anushkabadhe@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Fri, Mar 27, 2026 at 08:41:06AM +0530, Anushka Badhe wrote:
> GP_TIMER_BASE is only used in gp_timer.c and it does not need to be
> globally visible.
> 
> Move its declaration from system_local.c to gp_timer.c and make it file
> local by marking it static. Remove external declaration from system_local.h
> and its usage in gp_timer.h
> 
> This fixes a sparse warning about global visibility and cleans up
> unnecessary global exposure.

...

> ---
> Changes in v6:
> - Mark scope of GP_TIMER_BASE static

Good catch, but read my comment against v5. And slow down with new versions,
no new version within 24h, please!

-- 
With Best Regards,
Andy Shevchenko


