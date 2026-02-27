Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A95220F2D
	for <linux-staging@lists.linux.dev>; Fri, 27 Feb 2026 23:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772236426; cv=none; b=tRaHZwygTkAX4Q+yHxjahA3E+6+XNPL51zBB3pOK5cZsDJpbdddWoRSj8mhScIbD9LMOrHRbGfbjeMuaH/3FbekzILisFrlJjLzVeksm3Zs/fesk3DLefrN2fMwf7sQRQOtZjdCPrpX9YFvj+tkq6GIcvJl4bTc4uevJVHuLb+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772236426; c=relaxed/simple;
	bh=gA2MKG1iTJHXz3CRORci8www8lxPSfk5IKJ1yGC+Mf0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ost+M7Q/g1dhbMJN8ZDnVgJE28NCsX1mTsMDQfw4TYsNo8OjjZ3LjnlharZvwlfy7msMY3LHDn3HYk5Wc54S44she6ibIHAqwJ4ctmLSQOjhbdqbnXrNL6Vj8+V2mq5cEmJ03pnaOBiMNyx4MHrnAg05rqXeJ2tHwFQXrVu18oo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CwNrCM6l; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CwNrCM6l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772236424; x=1803772424;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=gA2MKG1iTJHXz3CRORci8www8lxPSfk5IKJ1yGC+Mf0=;
  b=CwNrCM6lnO4Ia8o68MUh5IwvTUUKonkJss7jYOxmAXtexPvI4tUfFytc
   i22QmY9M8iT1/Ah0nHyIoWvuHkreI0KAunSoNIMsSpOFQXXs4RRa3rGeV
   Y0W2UUsjgB1olgjj8ki+20ZA5iG/nBwT+mZlPDOHOt+CpfaZ6QwrqHnY9
   3bhkmmPg9Or9QHQO7dskynPGhJKkyAj3D8ISQslVVSqWfSxXO0IcKBhLe
   gIaocO2+EA+0IIfvQHZnRQXDuL1amg56liAewoWDpp39NdaGWa00jfY0s
   pAx6gcI4m5DxN4bMAaQhUjNBtpYlh+Gli5VBPKVl/+c4fv8fg4jYO9vaP
   A==;
X-CSE-ConnectionGUID: tBBWxkqXRoag433C8XrLFA==
X-CSE-MsgGUID: SdXX91l9ScasjWFDyjJRvg==
X-IronPort-AV: E=McAfee;i="6800,10657,11714"; a="84676075"
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="84676075"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:53:44 -0800
X-CSE-ConnectionGUID: cMU7HguIQy6V5DhH6M82+Q==
X-CSE-MsgGUID: /TTA0KesQoSEu9A6Lwl++w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,315,1763452800"; 
   d="scan'208";a="247544482"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.205])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 15:53:42 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 7183211FA45;
	Sat, 28 Feb 2026 01:54:09 +0200 (EET)
Date: Sat, 28 Feb 2026 01:54:09 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Ethan Lam <ethanlxkernel@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, gregkh@linuxfoundation.org,
	andy@kernel.org, hverkuil@kernel.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] staging: media: atomisp: fix block comment style
Message-ID: <aaIuocYuOMc-yOin@kekkonen.localdomain>
References: <20260210113557.71677-1-ethanlxkernel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260210113557.71677-1-ethanlxkernel@gmail.com>

Hi Ethan,

On Tue, Feb 10, 2026 at 07:35:57PM +0800, Ethan Lam wrote:
> Fixed all block comment style warnings by checkpatch.pl.
> Kept original indentation in comments (requested by Andy Shevchenko)

This can still be improved.

Please see section "Describe your changes" in
Documentation/process/submitting-patches.rst . In particular:

	Describe your changes in imperative mood, e.g. "make xyzzy do
	frotz" instead of "[This patch] makes xyzzy do frotz" or "[I]
	changed xyzzy to do frotz", as if you are giving orders to the
	codebase to change its behaviour.

No need to mention original indentation is kept as it is correct.

Is atomisp_cmd.c the only file in the atomisp driver with checkpatch.pl
comment warnings?

> 
> Signed-off-by: Ethan Lam <ethanlxkernel@gmail.com>

-- 
Regards,

Sakari Ailus
