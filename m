Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2319D3932EE
	for <linux-staging@lists.linux.dev>; Tue, 17 Mar 2026 07:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773734369; cv=none; b=kTDrWEBF36wMAkfAKIoqp+PxIMZ9HZ1dA8TKNyzdKdbrV56QzEKiV0pdowQk1pO5LUyNGw92uP7sZ0VldamPbDoSSh/HA3LXxXT14g+AA0sPY91IxakY/NR1Rh0cFBKbaEKBrvmyPAVyqJFnWROxZfkdC6YzRdQ4xFMnYxZwlZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773734369; c=relaxed/simple;
	bh=VWGOPoksrMSn5oBCkAunLAP4hMB6yCyCpYGsLk3EnbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=deCZCxL9wErl3iKPSEPiT4qYVjZlW8C2nCvzH/JkYIwwn05+wkNr9BmSYi/ZT0wGbc6bYDKvkYQTWKDTJOca9tA9dpiEEe9sJpjksp4IAZjuuxWibd0rJl5LohzRFa+XIviFAE+JP6GDdVFkXTkAYWVM+1EtwWWSu6E7Z/cc3ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BAMiwihN; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BAMiwihN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773734368; x=1805270368;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VWGOPoksrMSn5oBCkAunLAP4hMB6yCyCpYGsLk3EnbE=;
  b=BAMiwihNGV2nl6DdJHBNdwCJrBKUBiVKSxUU+XNM+1/wh1SpuIQYY/Df
   cGAZU+U36MmMDFkX8WWRab/lHMJp1rfvk/GKkksnUUiaQCufuVCJX53gL
   ozTWZeCurxYpzO01AJBruIoXiIlX/U5ceVygw3f0wF6EIbGlqVBhhDhx3
   lXGHI141VeBWOATgxpHQYil8cGv7um1O6i80WlFeUfBNTgvsyCbTwRFWJ
   0dzNnudqDfpnHeo1SLiU5XH9NO5pn3BqOCb7SGkjIK3gHqpPKy8PX6CF2
   cSaqOK/GZOHcYRLd2p1aLO8wy2AtbvQEx8zUZQaQHK47SF9uN7cV9+klk
   w==;
X-CSE-ConnectionGUID: xXjA0zKKQe2zs7/Tx5uXeA==
X-CSE-MsgGUID: WfXFl14uSGm9hgPVGY/03A==
X-IronPort-AV: E=McAfee;i="6800,10657,11731"; a="77368692"
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="77368692"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:59:27 -0700
X-CSE-ConnectionGUID: gfvreg6HT6G85mE4nMeNMg==
X-CSE-MsgGUID: rK8Cfpu+RpuT6bc4Cmsqkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,124,1770624000"; 
   d="scan'208";a="217919411"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.106])
  by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Mar 2026 00:59:15 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 80377121D18;
	Tue, 17 Mar 2026 09:59:13 +0200 (EET)
Date: Tue, 17 Mar 2026 09:59:13 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Cc: hansg@kernel.org, mchehab@kernel.org, andy@kernel.org,
	gregkh@linuxfoundation.org, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] staging: media: atomisp: remove unnecessary braces in
 single statement blocks
Message-ID: <abkJ0TOrtMR4sTjd@kekkonen.localdomain>
References: <20260310203646.8869-1-rayfraytech@gmail.com>
 <20260311170423.13157-1-rayfraytech@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260311170423.13157-1-rayfraytech@gmail.com>

Hi Oskar,

On Wed, Mar 11, 2026 at 06:04:23PM +0100, Oskar Ray-Frayssinet wrote:
> Remove unnecessary braces around single statement blocks throughout
> the atomisp driver to comply with kernel coding style.

Did you write this manually or generate it with e.g. Coccinelle?

-- 
Regards,

Sakari Ailus
