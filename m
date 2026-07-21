Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C24A235201C
	for <linux-staging@lists.linux.dev>; Tue, 21 Jul 2026 20:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667419; cv=none; b=mVuByRIyeDfr86LynSpC3gyktlbJdVhZhKJlNPv4KhTwNoo5bhPM3mvKn0GmKMH8gwQP5p3OKXZzJDcGbe99NzuOcPx4DcwIIvOxdLae1gMVPJCq2pbjUMa3QGvbzxybA/05PKJvf+2Zm5AwXe+wh73wdgCv4kXj2bBbVTOBBj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667419; c=relaxed/simple;
	bh=QV1TL5ylGBDv83me4OjzvNkUFj3Nkzr7Ij3id9GbAqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lw7ZUm4RIR65HqDgc6XAcwoB46LCk8TKjS/Dv6Wjx9NGCtg6NAciOwouyqabZAOWC5v4wdUNl151lTecyUvx+6BnwomEVC7jpaOZ64vVoRZGxGLCY1dM/+jhnMays4Yw1Xi1Szysi+4EUCnUeHrtii8iWdNFsmdm0dZY+ppuaCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=V6Mx7iMl; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="V6Mx7iMl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1784667419; x=1816203419;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=QV1TL5ylGBDv83me4OjzvNkUFj3Nkzr7Ij3id9GbAqU=;
  b=V6Mx7iMlMgwV+Z+z65YTFJ6Q719UrGzJJz+KvPrwgQFQLS59uUuiV6/t
   Gya1B/k7dV+4l8uauVO8HIEM8ZBa95HT+EBaCHgWIexiv09XW32rZIKgN
   qa1c+aN5qIpmFITk4aTxKfpdcDXX7bICNmQo2EL45iSj+g70IwVn+5ADk
   jwpuBFK8c7bNdZBuDgSmTqK58dk66Fpm1/uTOIVU6hsH7KqjAePyMRJrS
   EEXeqdnY7yaWpoBFJpDFA9bUeMVUlF5fYas6QecmlqsDmzI8AlvuVz8Wa
   jy07WjczYRXGZLBp4WOGEKAai8IqPbcGyiYmhM7Nk//h3b16m2zAOGvM/
   w==;
X-CSE-ConnectionGUID: Za8pHjIRTomF/vET/5kA7Q==
X-CSE-MsgGUID: OsKF82rKQJ6DODnwxtlp8Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11853"; a="85301736"
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="85301736"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:56:59 -0700
X-CSE-ConnectionGUID: xx5Ayi/LQPKpxC8JrwfsRw==
X-CSE-MsgGUID: eIb7sebzT8uNf4mxFEWcAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,177,1779174000"; 
   d="scan'208";a="261652157"
Received: from ncintean-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.67])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2026 13:56:56 -0700
Date: Tue, 21 Jul 2026 23:56:53 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Prajval Chaudhary <prajvalchaudhari733@gmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4 0/2] staging: media: atomisp: Cleanup unused module
 parameters
Message-ID: <al_dFbMRoe__5-EP@ashevche-desk.local>
References: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721163533.15888-1-prajvalchaudhari733@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Tue, Jul 21, 2026 at 10:05:30PM +0530, Prajval Chaudhary wrote:
> This series cleans up unused module parameters from the atomisp driver.
> 
> Patch 1 removes unused 'pad_w' and 'pad_h' module parameters.
> Patch 2 removes unused 'dbg_level' and 'dbg_func' module parameters, 
> and updates ia_css_debug_vdtrace() to filter trace logging to WARNING 
> level or below to avoid potential kernel log flooding.

Have you run (or simulate behaviour of) this driver? Can you show the difference
in the debug output before and after these patches?

-- 
With Best Regards,
Andy Shevchenko


