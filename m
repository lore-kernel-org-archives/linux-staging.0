Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E14B1586DC
	for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 17:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709141613; cv=none; b=sy0KvejT8hL/izKNtVRmxphnUWGNZ7d9JBx0QcccKzL5S0JlACJS0Tsc1fYN+35+BJnDQqqO4GzZ9gm9Tp9wX6uNcSH6KGfswV2Hq6NYvG0po1vsj5eJoTRPnTP7f3+24r7TeVjYNbBcSwbY2xUCPWfBdOrYH708QQkb/DjO9f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709141613; c=relaxed/simple;
	bh=rqnPGPHelN/v2OFh//pjXKa7moKmEKkSgoJmULvhJWk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qj0urbNkSkE/1J5P2G3ZypHIINlG3+KLYyoEJ+XjUyeQfZNjw/zLCaNg02QgEQCiJG6OwIZK0ehdDcaeTrzjy228HF/eHWKo1epcbnu2NBleZGR8borTNucbEj4gRFvdxZKsZmJ4L5TJQ2YJSwn6+IxmbH9ekfnkiQ5gDxT0upw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UiHaPkbF; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UiHaPkbF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709141610; x=1740677610;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rqnPGPHelN/v2OFh//pjXKa7moKmEKkSgoJmULvhJWk=;
  b=UiHaPkbFuycoaQBjPzw4o+uQMM0aNTUXtO9Q7iYHVGXyHT1PnIhCj+/c
   SrSczXrKaMWyTA3GZ4+QwRJhr4BuddApuU6u4ddFaXrefp3U9p2J0NGvz
   3OlsM3IruT1FUAQr6ufXDM/q+gxfOO/zi3IkBYvGf4H64JwgcwkcmCDFI
   tV4h2vAzjL4f/xjxc9wcjAOv1AdrNhyKurWhRcB4qh8ar7zNTri+D1z3W
   bYGVhIeaJBgFL9vjrOwyxznaAPWGgaIw04FqJOMMt+L+hy3twnpSyKADx
   MsXYmCRU1Cnm7h2nUGi7UK7GMm8EoWQNCnl7+3zGq+CN1DZtQHXgQ1A2/
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="14996071"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="14996071"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 09:32:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10998"; a="913956334"
X-IronPort-AV: E=Sophos;i="6.06,190,1705392000"; 
   d="scan'208";a="913956334"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2024 09:32:40 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.97)
	(envelope-from <andriy.shevchenko@linux.intel.com>)
	id 1rfNnK-00000008Hg8-043c;
	Wed, 28 Feb 2024 19:32:38 +0200
Date: Wed, 28 Feb 2024 19:32:37 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Shahar Avidar <ikobh7@gmail.com>
Cc: gregkh@linuxfoundation.org, luca.ceresoli@bootlin.com,
	benjamin.tissoires@redhat.com, elder@linaro.org, robh@kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/5] Fix defines in rf69.h
Message-ID: <Zd9uNZ4AijishLyI@smile.fi.intel.com>
References: <20240227221204.534131-1-ikobh7@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240227221204.534131-1-ikobh7@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo

On Wed, Feb 28, 2024 at 12:11:59AM +0200, Shahar Avidar wrote:
> This patchset fixes several misuses of the define statement in rf69.h.
> Duplicted defines.
> Define in header instead of source file.
> Unused define.
> Using units.h macro to define frequency.

Good enough (esp. for staging),
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

-- 
With Best Regards,
Andy Shevchenko


