Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C38235C6AF
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 07:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786521101; cv=none; b=IPEWWorKWPOMtRibG0FSBCx50iGNiqY+syrs+cOsysjkkDmnXxEHOG/rycaa8TQntDMxAeeHOMVav5eswnifzBSsX9qU9n30LwSiDjGWXV15aE6NT83Xa0VFZMb3C2FsnR1dxxZCJLglvMbEIqOrOwjUF5PJwHgwYyqCZIfXNUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786521101; c=relaxed/simple;
	bh=WWbJfwqBJPLhcQUBEV0MGZG1yewqtJEq/l8Co0nWarU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BRoPsSctM187yiZ9toVGloNa7bq5pCqLrEAKc19PmArM2QSgucAS1y4A48UilkrJr3fVMDZnJvgcmWDObmhdzbd2CnQGs436OlGXIFmON4jqxo708/YP2uhKsMFR/9t0qpKRbFyos4GbmgBOFEiDADd8KjmEJk4vTU6VIgF7Iog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GbWGjSwz; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GbWGjSwz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786521101; x=1818057101;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=WWbJfwqBJPLhcQUBEV0MGZG1yewqtJEq/l8Co0nWarU=;
  b=GbWGjSwzgMOcKA5U9TER3lZuaPD42P/cJjJCkpXkCx9887ThvuRqwFu7
   EsLV4jYB5pJJbwxV7dtwuO5mRIW4XUgQ/yHxWo6FlQrzgFNhHXGtBK4IQ
   z8KCXjwd9jP0FXllnCQIKwXauTGs6M0lEqc60XlziawkKtrwytah2o4L5
   qe7aNNPjaLe2c1hnffD5AvohUBt9038Q9VEJMPd6AeGaJwvc81wc8zhf3
   Y9eN0vBPSY3PsBQCOhTMYznpjFdVJH0nZRzRz1QwVxHC/3P7L6rwaRwd6
   JsDK0gT0MnkN/uULDUmsd0JNNjVB9jDSEpXwfkUOrN1KnpBRpIJWzxiRR
   A==;
X-CSE-ConnectionGUID: paqKKCUsSYyXp3S47mA2wg==
X-CSE-MsgGUID: 4dri1RwFQ6iZbAJ/2RzUhQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11872"; a="90743063"
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="90743063"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:51:40 -0700
X-CSE-ConnectionGUID: lppatnRdQtKNBSqo51WIWg==
X-CSE-MsgGUID: Gdvs2FJATEmy4EG09a3Xdw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,219,1779174000"; 
   d="scan'208";a="259319488"
Received: from rvuia-mobl.ger.corp.intel.com (HELO localhost) ([10.245.245.92])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 00:51:37 -0700
Date: Wed, 12 Aug 2026 10:51:35 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Nikolay Kulikov <nikolayof23@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] staging: media: atomisp: inline the
 check_bo_status_*() macros
Message-ID: <anwmB7RTwAQ6UI6p@ashevche-desk.local>
References: <20260723185217.317981-1-nikolayof23@gmail.com>
 <20260723185217.317981-4-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723185217.317981-4-nikolayof23@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Thu, Jul 23, 2026 at 09:51:20PM +0300, Nikolay Kulikov wrote:
> These macros check a bit in the bo->status field. Replace them with
> conditional expressions to make the code clearer.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>

-- 
With Best Regards,
Andy Shevchenko


