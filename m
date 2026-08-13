Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC7C542FCBA
	for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 09:11:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786612269; cv=none; b=LM9IcyhH9LX3ludeRtjZISUu/idtxIwa41DExdhnpg4riEyixcldVUIjmfKEXp/O+7/b/KB8xO50jggiqOcoQZfZmw5bRc2hl9b5DOmDCOtCIrn/m0uMzVbZ43RH2x1N+Bpv/OJchimy9m4UzPt3Ipnzhk6xlgRTtO8Yx1FvKLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786612269; c=relaxed/simple;
	bh=jeLg2x+8sBbdtoCu8ko0pF+yQmHUDbiaIzhymVtE4q0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pvLGCAUioci0W6/DTjEm0vQ7bROIlUw/su4xpX2r4UCSYnBk7f4w+DJbTrSQ21sAGYN0Vh1j9YeNIMH6hhKyvve9CLKC74ixAMBZE7kRojBiYSIIvjcJN3buFQzzWi91FHu+CSptmIvkrjfSF8wHK6JFUhN5O3xnyToL/MNqx04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQE2rp18; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQE2rp18"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786612267; x=1818148267;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jeLg2x+8sBbdtoCu8ko0pF+yQmHUDbiaIzhymVtE4q0=;
  b=HQE2rp18seuOgnRLv5IhpVttp7UG215KwbY6x2wVe/Ch4OoEQmHb3ad0
   U9pw9pYoJtFAovNpP7JCS0UK35j+YGKxUsZEAHFkPTjzhaA6e2QUbWVX7
   Upn2HW8CloeQmjvQdVdTE1FkoqW3lD+khoAkPyC8k3hWGBVdq91qwCxZ+
   Dv/4Orlhnx9si6PLIOcblXE2Xb7QeWv8HKv9xRhMAeV36oav4xAWVoZd/
   DgR974nn9RH4UtOBsSog06xzE4DALJKkDPnrFcgpYy0lUD3A9bYml58oC
   cvk+IiH01XWmv++M96aC1amj6puwXp4meTcORxTl+Fyf4gGU6KNwg6cJ5
   g==;
X-CSE-ConnectionGUID: 1QUtJ9zUQw+EMySaaI8hKQ==
X-CSE-MsgGUID: KtQookX+RK2vda059FNr+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87398113"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87398113"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:11:04 -0700
X-CSE-ConnectionGUID: mvixmRQZQYebQuvnguHJOg==
X-CSE-MsgGUID: se61xbA2REqURB3YhZWrTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="261266548"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost) ([10.245.245.250])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 02:11:01 -0700
Date: Thu, 13 Aug 2026 12:10:59 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Message-ID: <an2KI4rsL9tkA_4M@ashevche-desk.local>
References: <20260812205429.39181-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260812205429.39181-1-nikolayof23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Aug 12, 2026 at 11:51:33PM +0300, Nikolay Kulikov wrote:
> This series removes unused functions and replaces obscure
> variable-checking macros with clear conditional statements.

I believe I gave tags to some patches in v2. I don't see either.
What's going on?

> Changes in v3:
> 	- Split the last patch into two (inlining macros and removing
> 	  the file).
> 	- Replace variable initialization with assignment, followed
> 	  immediately by a check.
> Changes in v2:
> 	- Squashed the function removals in pci/hmm/hmm.c and
> 	  pci/hmm/hmm_bo.c into a single commit.
> 	- Add commits to cleanup macros from include/hmm/hmm_common.h,
> 	  as suggested by Andy Shevchenko.

Also two process hints:
- add --base when prepare patches
- add links (URLs to lore.kernel.org) for the previous versions.

-- 
With Best Regards,
Andy Shevchenko


