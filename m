Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C55238889C
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 19:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778613957; cv=none; b=EOQCs3z9L/QI6Xc5soeFnMKm0mGAjK9lw6kZAHzU6iBNSfBiG6wPeeWW6+g+1ElHMUkXddJgvaz6l7vQDheJ6bE3a9LOHo/DQsHETNpohBlWZJ5DvL1tLj1Wodgh3lY5pGII1heXapN6Df63BfQHNCaiQ8wlH16GYlL4ABr2JKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778613957; c=relaxed/simple;
	bh=2M0rNh8lEVUZOT6LcT/HK0VvW9rDoSXE7U4w2m1Qguo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YxK6VGwhgMJ8bQGRFMGhdwZ7vsZNK7nIHNfDy+lJbNITNmiBzuyn5mPOHQsbF4s96qVNGLvrw69j1tV8LUOrAVFsoPQ5Iw8R/dI/G0MlJtajvuGf5LF9kiftaLJZ+rqeGgqKPJdnLSCZQrRiyi+9vE0VmGFtwPDj8glS3bmyHtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XW1h9zBa; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XW1h9zBa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778613954; x=1810149954;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2M0rNh8lEVUZOT6LcT/HK0VvW9rDoSXE7U4w2m1Qguo=;
  b=XW1h9zBa6yWsury9LTLzrH86K66LVAGjfhf/jwKSC7aZHprcr8bybkCM
   Ak2PcSPYX5Kc0NSntrF4X9d574Ln4N/szkmVNtcz0aQdXzYJ2RZJj07eP
   Qp2Tc4IyUE3ByKzW8RVe2r+VSmzEBAYxLNlAzD24D62Bdrh7qADbuwUke
   TUhU28K84vddTIYSYRZwcCU6ewfiApwopF0kjG75kuKRGEi+Uwn3KmcgP
   nNOMWaEafHt1Yn701Wo0JLAAc9+QCuc7DCuhj1C7zJdVdB+75Rlihr73J
   BF4pFi6TElYZzdoC8OKtAGg9Jb9sHslNL+cKqwflOLFH+f8mVe/gS0iz9
   A==;
X-CSE-ConnectionGUID: r/g91AZDTAuZgv3EM7dYyg==
X-CSE-MsgGUID: 0zOgFbGWTdCsFfB/151U7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11784"; a="79714038"
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="79714038"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:25:54 -0700
X-CSE-ConnectionGUID: GAr/dsSwTMChEN1AVQzTLg==
X-CSE-MsgGUID: OZorbDGtQA2c4kaOTccF2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,231,1770624000"; 
   d="scan'208";a="235196022"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.244])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 May 2026 12:25:51 -0700
Date: Tue, 12 May 2026 22:25:49 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Tomasz Unger <tomasz.unger@yahoo.pl>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev, Dan Carpenter <error27@gmail.com>
Subject: Re: [PATCH v3] staging: media: atomisp: remove stale "Generated
 code" comments
Message-ID: <agN-vQrNGty8pIEE@ashevche-desk.local>
References: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8.ref@yahoo.pl>
 <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512-atomisp-remove-generated-comment-v3-1-97930e4e1ca8@yahoo.pl>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, May 12, 2026 at 08:10:52PM +0200, Tomasz Unger wrote:
> Remove the "Generated code: do not edit or commmit." comments and
> the resulting double blank lines from five files. This code is coupled
> with legacy firmware and will never be re-generated, so the comment
> is misleading and should be dropped entirely rather than having its
> typo fixed.

> Suggested-by: Dan Carpenter <error27@gmail.com>

Seems like a flashing tag. I dunno what Dan suggested here, but please, double
check that tags reflect the reality.

Code wise LGTM,
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


