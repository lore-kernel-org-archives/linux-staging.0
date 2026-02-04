Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F313277CB8
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770211477; cv=none; b=jtJWg8hswUJnCDQJkoR46o4iIsRJZCB6X5kDz7QzyFd64ZYQThNafQ9Ptgp4EIcsnmA7bQ3EcyIFwNClVkwPjpdexPeCbFqAABqpL+9YEMPpUOJOv8YAqbLp/JofnKsP92CH795ZuP2nD666f8+Fgb2/N4R71Mk+qpehZxCm22Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770211477; c=relaxed/simple;
	bh=5Druc1ZTsr7gcpKsI35cAA8eQv720L10IH6Om8dy3K0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBjV19g4BqZyzW5P8Kbt4rz0RyENBecnLO6ccPl6DGVL6oo5XYSo6Mr9N+mRp6lLJiUgHrGQoIy1YJE6A4JOWoudEsPCiY8BpAeVRQU5wenxhF40xa505GQmO+9m4o3QQ8tLcFlwjXQ2GGDG43HIuY1hipTJSSCvh0MlYKZOCb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfWNzsN1; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfWNzsN1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770211476; x=1801747476;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=5Druc1ZTsr7gcpKsI35cAA8eQv720L10IH6Om8dy3K0=;
  b=NfWNzsN1280JWdq9Sk6NyYwQh56SJZekFsz3YYWvohY8bPkO4/mfim7V
   kk/3v05ZC3zpoyHKLYN5+680kQYrtDIiELElGeZ81GALICrWEJ47kjOLR
   RilgwfjymKyRzTLTytvYTJILShvdScyFqI1AA4E/mhkGBty7LlaKLySpS
   lLz5xBqw800ou3aPBLLCKl0vKajF3ZN5ujRsdTRjKAjhKfy4Pszt9L301
   TWnOj0cZeVD9bpfp9MGDcwIY7eN/nvdI2AyFQF9D4eVwD9m8dX5csJDT6
   0ICTxpboakKDSh+q+ySXM2gCbWUeehhJcAOl8CNjAlZ4CQVzxytSyKSPB
   A==;
X-CSE-ConnectionGUID: WuJEG00MThKbhTaq/8vICQ==
X-CSE-MsgGUID: tgIw2wntQraxjRvcPJs6vA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71488743"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71488743"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:24:35 -0800
X-CSE-ConnectionGUID: C+4XbOodSxOO07BEXypMdw==
X-CSE-MsgGUID: RA+2TGT1RNiC5jnh7ZhXnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="209753015"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.188])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 05:24:33 -0800
Date: Wed, 4 Feb 2026 15:24:31 +0200
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Minu Jin <s9430939@naver.com>
Cc: gregkh@linuxfoundation.org, andy@kernel.org, dan.carpenter@linaro.org,
	trohan2000@gmail.com, straube.linux@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 1/5] staging: rtl8723bs: introduce kmemdup() where
 applicable
Message-ID: <aYNIjwkVbDOeTo2y@smile.fi.intel.com>
References: <20260204131347.3515949-1-s9430939@naver.com>
 <20260204131347.3515949-2-s9430939@naver.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260204131347.3515949-2-s9430939@naver.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Wed, Feb 04, 2026 at 10:13:43PM +0900, Minu Jin wrote:
> Replace memory allocation followed by memcpy() with kmemdup() to simplify
> the code and improve readability.
> 
> About GFP Flags:
> - GFP_ATOMIC is used for allocations in atomic contexts such as
>   spinlock-protected sections, tasklets, and timer handlers.
> - GFP_KERNEL is used for process contexts where sleeping is allowed.
> 
> Specifically, in OnAssocReq(), GFP_ATOMIC is used because
> the allocation is performed while holding a spin lock.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


