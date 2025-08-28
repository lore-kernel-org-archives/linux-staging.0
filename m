Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A69FD313E1F
	for <linux-staging@lists.linux.dev>; Thu, 28 Aug 2025 14:42:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756392143; cv=none; b=gxr8pwTMe1C2Y0NJgzDg/9ktFoAtGatNdqfboDVWWeuGKDBwQHyr5lQIiOYkLv0xZ8drfSz41KCYCCmWZG4cKgkLDPwWn2dWCUQmSWvguVxs4Hoot3HMf95QTY38gEymqJGjSZbW0hLQHECxUD1KYWFg8oQuDH/StaOj6mj9+3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756392143; c=relaxed/simple;
	bh=SMW3xNgf1e4fN0in0pQWb5Ft82SGZRFlvkKOyugEm/k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lQVgwqF9kQfMSKcCVy+ZgnVpITtqj2lc5ytFNyAws3WkhihJGfuAAniH6nJZEyrGyGMj1JRmkzii1UtBFLH5mOXCuY3Q7Flrz2R+vRIJsrSYwiYbxUtf1ba47yN/2DGTcLMOt6vhfwQTcD5Tk8/A1DCQA11gDO9KIim+Ywyw4Z0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LNP4d2cJ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LNP4d2cJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756392141; x=1787928141;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SMW3xNgf1e4fN0in0pQWb5Ft82SGZRFlvkKOyugEm/k=;
  b=LNP4d2cJ+qC2kuwwNeQfKZ+EuEobZHOEZHUOYMD7G8lV3qxcQjrHPkEO
   WzR/a6GFlSToKsq7hFc/GQCVviFm65xLPKMUVSU4Kcr8UaNb6vTEaDqMN
   3TyfEFENfRMaIFhOfI0rTU9U+n9Lxf+R5Rm2FR4TNk+PCdsjRdYNOASi5
   E7OC8x4SmlX2L84P8gOxwB3OlSqWtV8qBvFmwt5p03A8WeZDio3o18nxP
   lDkmbd4HVBuAjCaBIXDGXjrweZ2tM3Z97HFWGpaLUqnqrwXMveUmtkLyW
   TplNGrUv2E0SRiB5RzJExylpJeto1B1nK29ra7zJmUCCOp5GsKNcfAvCg
   w==;
X-CSE-ConnectionGUID: NZhW//qgT/yM804DYO4OiQ==
X-CSE-MsgGUID: 3IWNKTzATYe0odyGW8UzuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11536"; a="69256237"
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="69256237"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:21 -0700
X-CSE-ConnectionGUID: n5t3Q6rNRFaBlTLBg9DLDA==
X-CSE-MsgGUID: RwZH5Jm1Rhi4vAmq71xDzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,217,1751266800"; 
   d="scan'208";a="170028872"
Received: from fpallare-mobl4.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.135])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Aug 2025 07:42:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 66BF811F9D4;
	Thu, 28 Aug 2025 17:42:13 +0300 (EEST)
Date: Thu, 28 Aug 2025 17:42:13 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Cosmin Tanislav <demonsingur@gmail.com>
Cc: Cosmin Tanislav <cosmin.tanislav@analog.com>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Julien Massot <julien.massot@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v7 00/24] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250718152500.2656391-1-demonsingur@gmail.com>

Hi Cosmin,

On Fri, Jul 18, 2025 at 06:24:36PM +0300, Cosmin Tanislav wrote:
> This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> replacing the few GMSL2 drivers already in upstream, and introducing a
> common framework that can be used to implement such GMSL chips, which
> avoids code duplication while also adding support for previously
> unsupported features.
> 
> While the normally acceptable and polite way would be to extend the
> current mainline drivers, the choice was made here to add a totally new
> set of drivers. The current drivers support only a small subset of the
> possible features, and only a few devices, so the end result after
> extending them would in any case be essentially fully rewritten, new
> drivers.
> 
> This series depends on support for internal pads, for which a patch has
> been added.

Could you provide v4l2-compliance -m, media-ctl -p as well as media-ctl
--print-dot output on this device, please?

-- 
Kind regards,

Sakari Ailus
