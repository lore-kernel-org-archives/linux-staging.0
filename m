Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C18A3D3CF4
	for <linux-staging@lists.linux.dev>; Mon, 20 Jul 2026 10:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784545198; cv=none; b=CgpHQOpmJebarQHVbddxxbCY5W0KOMz+Tjv5BTZYtsKXiFKJq3Ein08BeFJiSJRN0W+mmrM1q6+wtC3WFfjy0mmQrAMOz4fLuyPCl1fRm7Ub6kjIBGj9GHOxAb5IQt4QPN5yTdAojrRpY6TRmfeXiB1YBJjafEvIVUnE5nh7uZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784545198; c=relaxed/simple;
	bh=NTFhq/yufijKcIKl84Z9jouRC/TaQQ5nfeR118/XL+c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eDh8/T1/iDqI9xf1GKKPouT6R98RBLDvDdz4l77ZuJfDaVLj6ro53TMGfBEj1igLD8Up0jjLiOjkYe/ZbGxCRrnhXNOEShv52EXcxOKBrKgOot7MDOq9OCwrc3CTfL+NBVxKCwJ8Q+ZHUiSKdqow0NLqA6K1v6mPe4AIcKTXK/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cElkoBSw; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cElkoBSw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784545197; x=1816081197;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=NTFhq/yufijKcIKl84Z9jouRC/TaQQ5nfeR118/XL+c=;
  b=cElkoBSw+7i/vsdXvDXL8rHTsBEyfPht+jhkXEVqGyAPpbz1/8RYTzhM
   vC4Ee1Un1sZYPu9sJKFu/Jes+4X6Ao0TX75QxTIOPyNpwJGEvNDCiAynn
   PutaD4n8wnCuuZqBfs/6oUyWLY3J8nFU82bYQBHqa7TUzWQKIWnykpPYI
   JIT6aSW+RjQdnBfz1cURuQf5SwvF0jKusox+HNNxfnM0l0cIXI9rXbMop
   66DGmFLcMBSRzExtuyNi/n7cC3TO24nRHvmCqnogCxMTESiP2xxBPDHHX
   Zc6O1hEI/9gCQd7a4ya9tRsevbYYp7VxpXa+Xf0Ccvs932h/afCO6mrUa
   Q==;
X-CSE-ConnectionGUID: 6vuBZBFKQNOkmXFizdfDTQ==
X-CSE-MsgGUID: GIzyUQjcS0aH+B1n4CAALg==
X-IronPort-AV: E=McAfee;i="6800,10657,11851"; a="95482720"
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="95482720"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:59:56 -0700
X-CSE-ConnectionGUID: 3otJ76eyRdmMTnAA0xRHpw==
X-CSE-MsgGUID: lp2A21W7QImARduCbAoSqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,174,1779174000"; 
   d="scan'208";a="257492246"
Received: from conormcd-mobl2.ger.corp.intel.com (HELO localhost) ([10.245.244.175])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2026 03:59:54 -0700
Date: Mon, 20 Jul 2026 13:59:51 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Dan Carpenter <error27@gmail.com>
Cc: Prajval Chaudhary <prajvalchaudhari733@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andy@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: media: atomisp: Remove unused and unwanted
 debug module parameters
Message-ID: <al3_p1WyX5FXa-pR@ashevche-desk.local>
References: <20260719140350.8266-1-prajvalchaudhari733@gmail.com>
 <20260719140350.8266-2-prajvalchaudhari733@gmail.com>
 <al36id6uaqTB404p@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <al36id6uaqTB404p@stanley.mountain>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Jul 20, 2026 at 01:38:01PM +0300, Dan Carpenter wrote:
> On Sun, Jul 19, 2026 at 07:33:49PM +0530, Prajval Chaudhary wrote:
> > Remove the unused module parameters 'dbg_level' and 'dbg_func'.
> > Additionally, remove the 'pad_w' and 'pad_h' module parameters
> > to prevent userspace from overriding internal ISP hardware padding
> > boundaries, leaving them as internal driver constants.
> > 
> > This addresses the 'Remove unnecessary/unwanted module parameters'
> > task in the driver's TODO file.

> It's weird that the driver still has lots of references to these varaibles
> but the build didn't break for me...

Yeah, but still the debug facility should be updated to use what we have
in the kernel.

-- 
With Best Regards,
Andy Shevchenko


