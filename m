Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B119028504D
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 13:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137813; cv=none; b=hvwu8uvdpzgYkypRVAkYC7alrQJXrtuxJYyF2B6MPR81kNEeV/mr3z4Nk8rXpt1s1QF/4KZba4QmxD0gEhzDIwip+lQ3mckDwZ8Svvnw+XpAVpSlNwYIq2XwCdbhmh/GV0pou6E5qu3YnlMia8bexyFvwiO52/pL2eax661yjBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137813; c=relaxed/simple;
	bh=Dmndvs2MFjQ3SAIaC7g32e7CcDen/0rO3NkMInu/JRo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A772FwafezVdlfCE4rqbwWkYCXPHU2jpbpsR+Le73mM1ycb8G9kdtGCOdijwpextUbf44Gg16UPX4uQDOY4jM+ow50OKOb2pIW9EaP3xWicrGCV3GUWqUQ35bHe9AdBRiERhxeE3EVzRi1hU5OKOWz4AQvMSua7FmICRHpwwkbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mg6xYm9t; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mg6xYm9t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775137811; x=1806673811;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Dmndvs2MFjQ3SAIaC7g32e7CcDen/0rO3NkMInu/JRo=;
  b=mg6xYm9tuKyynAhyhMQZA0iKAt1VDERbElFZKhAB+hvTuBYZe5GxNX+G
   8XSLZdXm5WH4DYpJVG0R64Orf/gJVnRF9QRYZHn9qzFMy0M/KISGR82Bq
   tTrFdlpRDjYB7V2yw3vNKpWi4Dy47s1mK/a8XdjwzGVo5GFoWKAXch+F0
   bCltJxy8ohwEQ3iRAZ59uUm3k39beBtrtOfUzOVLkuWb5L8mYAXP9azYi
   F9RmLVs/OC+RpXUu1SXDvqbuWC0js9JKO9ij24dyW6yJUSShqdcAAvU9F
   YQtuz1z4wc7fmgQPyfTKYMwW2MM7sAEh9fJTobLHLqSBdwYpUpkbHen0o
   w==;
X-CSE-ConnectionGUID: wsOq45vJQ0udGmxkCH6QWA==
X-CSE-MsgGUID: QbIGrXFgRJSz44zePILlSw==
X-IronPort-AV: E=McAfee;i="6800,10657,11746"; a="93779409"
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="93779409"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:50:11 -0700
X-CSE-ConnectionGUID: m4gb3qwKShi9Vy26gS3Xsw==
X-CSE-MsgGUID: b2kTs0IFRR61XDk7VjzMSA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,155,1770624000"; 
   d="scan'208";a="223707598"
Received: from amilburn-desk.amilburn-desk (HELO localhost) ([10.245.245.31])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Apr 2026 06:50:09 -0700
Date: Thu, 2 Apr 2026 16:50:07 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Daniil Bulgar <bulgardaniil18@gmail.com>
Cc: gregkh@linuxfoundation.org, hansg@kernel.org, mchehab@kernel.org,
	sakari.ailus@linux.intel.com, andy@kernel.org,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: media: atomisp: fix indentation and spacing in
 sh_css.c
Message-ID: <ac50D2dnXceZqtV8@ashevche-desk.local>
References: <20260402133005.288643-1-bulgardaniil18@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260402133005.288643-1-bulgardaniil18@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Apr 02, 2026 at 03:30:05PM +0200, Daniil Bulgar wrote:
> Fix several coding style errors reported by checkpatch.pl.
> Use tabs for indentation instead of spaces.
> Fix alignment of function arguments to match the opening parenthesis.
> Remove trailing whitespaces and fix blank lines.

Split to the fix per type of the issues.

...

> -/**
> +/*

Huh?!

...

Also, if you are doing that, do it on the set of files or against the entire
driver. No need to have 1000+ patches like this.

-- 
With Best Regards,
Andy Shevchenko


