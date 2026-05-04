Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3697135A3AD
	for <linux-staging@lists.linux.dev>; Mon,  4 May 2026 14:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777904361; cv=none; b=aWh05NXzg4nkXyvbkKQOUWgks2xvBHvdSCnu10x91s47DkSNe0LTareseBywVKtlLUDSsuy5g9YkPjq3/6Jr7w181bibA9Ov5rubxkkFpqN6MY5kYC23wmQHlj1TzRoHgHVXvJN99FacFQhVLxFFgG32nh6uj0NLuX9reXnfzSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777904361; c=relaxed/simple;
	bh=ve2+6uy3tfhEbqBKOTdfZIY1nkAqD8oVN2/BMbHEqNc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O/deAcxHtB9zjNBXgyckGz1btlHDYhluVzSc4eWut47US74ufNQ7OC6TwDkWDX4od/yxZzypg3rdVl8VhpJ90aQJ0hlStX+woV+FrmLKotlPmaInPHdgN9myMy9cVLCroiT24OIPO9g9vFOiI5blc7ODvRE5hud/FK4hrxn4Jjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DbLehRun; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DbLehRun"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777904360; x=1809440360;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ve2+6uy3tfhEbqBKOTdfZIY1nkAqD8oVN2/BMbHEqNc=;
  b=DbLehRun/r4Fxikl35RNIe+483eyU6ZzBzLVJOa9Vobh7MO6tbzH284V
   +N9yvvgMbAyn145c7R3LNxP1+aoXPzpYLHD/s0ivU0a2abaX+yxYlKbXf
   UENlaXgi/1lSkDSekSfH9yNZfrswCMGzZfpHHQu6an6lguwJy+brZPEf7
   P9ngL4eZ29ePqofCzzKY3e1gg919jMx2na4k0WRQ6ahWetLxqus/wiCS8
   XtT+ijmduTJ+YaKK2zFORM3WTuGh5hs6sCglru4OqgiA+UCmNLl6zNAbc
   usD3bQIMeG5m6Lh603xiV6EvcaqGgmx8A9p2XxHsvGoS/WYjXcVQhOfTP
   A==;
X-CSE-ConnectionGUID: QvrgIYD1R4eBKPFENeOr+A==
X-CSE-MsgGUID: fYSW3Lx2T5u429k03JJAjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11776"; a="90220005"
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="90220005"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:19:19 -0700
X-CSE-ConnectionGUID: hAMz4Bx5SGyK6cwwBb7Lvg==
X-CSE-MsgGUID: txtLm08ZSLSR1wGZLwpQPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,215,1770624000"; 
   d="scan'208";a="232867222"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.245.198])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 May 2026 07:19:17 -0700
Date: Mon, 4 May 2026 17:19:15 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Cc: andy@kernel.org, hansg@kernel.org, mchehab@kernel.org,
	gregkh@linuxfoundation.org, sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH] staging: media: atomisp: consolidate function
 declarations
Message-ID: <afiq4wU6j3GbQvOl@ashevche-desk.local>
References: <20260503173846.108790-1-shyamsunderreddypadira@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260503173846.108790-1-shyamsunderreddypadira@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sun, May 03, 2026 at 11:08:46PM +0530, Shyam Sunder Reddy Padira wrote:
> Consolidate split function declarations into a single
> lines to fix checkpatch.pl warnings and improve code
> readability.This change aligns with the kernel coding
> style.

Too condensed text. We have room for ~72 character per line.

> No functional changes.

...

> -const struct
> -atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
> +const struct atomisp_format_bridge *atomisp_get_format_bridge(unsigned int pixelformat);
>  
> -const struct
> -atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);
> +const struct atomisp_format_bridge *atomisp_get_format_bridge_from_mbus(u32 mbus_code);

It breaks V4L2 coding style expectations.

NAK.

Also other problems mentioned many times in the mailing list. Please, start
reviewing others' patches and learn from other reviews before doing your
changes.

-- 
With Best Regards,
Andy Shevchenko


