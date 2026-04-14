Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 554E537DE8B
	for <linux-staging@lists.linux.dev>; Tue, 14 Apr 2026 07:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776151632; cv=none; b=CSmVcHFj3TCRJg6DRmO/N75kLv0hfrzWw/BvWhhVdhTJWhHCmxGbK1gqyyKAfPmyiSgUSYGVPCUvIj2ToUFnWPH0Q9g2uF2DqO1p9/9Q184HdfjKIms/mjkvBMH3FybpskGQCMVPJOgY6CO1MgcgFuaR/bbDtW+ZtmUoLuL2I9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776151632; c=relaxed/simple;
	bh=Oe+TtEwpRFaOkHjTtAOqdelV0eYQ4FpvKfbUPQBB7M8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mPgTQ6I2g1+XImgQ4iB7xQ6lY6wksC7qWdq1yyChKKaJD9lSUUneHehv2uWUypvhfosO0muBI0MxwPiyQqrR0Fvk6DlkOwAPpmET8bB1hw3fuHeeNEc9nCh4O85Gp4TbY4xertMXHIYuwrQveuhFp70aAgIkkYxiaPihTZMkCc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VDdsizUI; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VDdsizUI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776151631; x=1807687631;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Oe+TtEwpRFaOkHjTtAOqdelV0eYQ4FpvKfbUPQBB7M8=;
  b=VDdsizUIXng3CzPA1YHeBhXWxtf5UofHDfJr4sfIbJkYLppXZXxrkFF2
   NMjr5F3IjqZ1BuqgIPFc7DLgBdXQ1qCzJxl8YU47eHPuWbN++8ELIe+YY
   iMwXbJlLbNCz1+7bPg8KoDO33C8J+NSLTGHnYpbK2K1Twa5hYGlEJnLpA
   9dm4PIVbFW8UeV8gLCrujpoHIO5IblZ0EIiSVdzzSdIBryE8VGAnKU4QM
   feQzIkeQKBrXxWSajuUSNdgKvUUzmcq61l4mBtn68qvpYTlDSN/VbMOWF
   6B2LD4/fbLVf3dFgDVd5ir2eRZaeFcMSXXIBy4EbBjCKLTFeECZkXWu95
   Q==;
X-CSE-ConnectionGUID: hOE6QRw5TH62AZ2KBoJhaw==
X-CSE-MsgGUID: x729Ai/fTsGw0lWyL4ReXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="94499394"
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="94499394"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:26:48 -0700
X-CSE-ConnectionGUID: gK25cA0ySdOoGKMUz+QyHA==
X-CSE-MsgGUID: wIpM/MtZRGCo/VzSBumZcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,179,1770624000"; 
   d="scan'208";a="234050763"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.106])
  by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Apr 2026 00:26:45 -0700
Date: Tue, 14 Apr 2026 10:26:42 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Joshua Crofts <joshua.crofts1@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, dlechner@baylibre.com,
	nuno.sa@analog.com, andy@kernel.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 0/2] iio: frequency: ad9832: cleanups
Message-ID: <ad3sMnV0djhoyndj@ashevche-desk.local>
References: <20260411085848.75381-1-joshua.crofts1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260411085848.75381-1-joshua.crofts1@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Sat, Apr 11, 2026 at 10:58:46AM +0200, Joshua Crofts wrote:
> This series cleans up issues in the AD9832 driver,
> including proxy header removal and bit math
> simplification.
> 
> Resent because of typo in linux-staging list
> email.

Seems Nuno already gave a tag that's missing here...

-- 
With Best Regards,
Andy Shevchenko


