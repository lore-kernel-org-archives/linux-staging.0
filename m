Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6904322DDA
	for <linux-staging@lists.linux.dev>; Wed, 10 Sep 2025 14:43:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515402; cv=none; b=ELugViCmzL3Z2yYfL5mBohggLxibNVDk5Lz+vn1s11dDM8mUUjMYVv0oV2+3SL+yI+Y884Lwc9yfLNfdNjVXTI7PS1/Ci2Kyx7hKmgxC08IMQH0+foPkLhRW4VerIUrn4rDKIJTOrzYsxa6tMxqP9hSohOJ/Y7qNrhfhRziQAVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515402; c=relaxed/simple;
	bh=ZbY2B6yVl12t9+vakyT6Odcj14A3coWtEtGibMgyy5g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CsBAfdhcYuw8Eyg27ZtQIy8+r58JYa87rlr0ufEhrFVP3JCIpSqFIv2PcWkcLJDNcf2HfkIvwXSu3Ak/Ei8Q5vYeQE1WXY+2Lg2+sohPnTclPtxk14ciUcCzXnf9CAaAHxTUjyacVxsxgecfPiPe5W/t2wAOULZU6TQaIpOikww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Nsu5RZn5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Nsu5RZn5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757515401; x=1789051401;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=ZbY2B6yVl12t9+vakyT6Odcj14A3coWtEtGibMgyy5g=;
  b=Nsu5RZn5hHjOBNld2cgU2q+C2uJm0GlxMYLAHRM+jYW7Re70pow0RhLy
   bdibm1LTMgfz8Fx6TfD88N8DxLRTvnT07HZmLbop50jCYr0SMVMKrfDuY
   0mQQl2cf/yE8p+Yr9wUTeswxdIJjjA7oMVFR9R34i+Z+3h7jpot0xc2Hx
   wUiLBOhgK/c0/d7ZVYeBr67QpXiKQvFr8OZBA69jsTuc7m0vQU6BJFFZe
   TlDNFDwpOQi2Z5G8B7b+FhvrMb6Qy2GL5JygwO/Eh1ycyvMr4tp8Nb4mP
   aMMwn0rC2vx8ui7ZiWu+/wl6EzapVc3w7nDZC+8w3f4j9GHL7xReEyu5u
   Q==;
X-CSE-ConnectionGUID: 4s/1t/0mStm1PI74GPJPPg==
X-CSE-MsgGUID: aThdj2phQQKisbGSBn5nIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="71248274"
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="71248274"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:21 -0700
X-CSE-ConnectionGUID: 8xOG4fZsS/Wlx1q+FywMXA==
X-CSE-MsgGUID: uILFlauiRmePsJvk6TcztA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,254,1751266800"; 
   d="scan'208";a="177742939"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.108])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Sep 2025 07:43:16 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id F09371201B4;
	Wed, 10 Sep 2025 17:43:12 +0300 (EEST)
Date: Wed, 10 Sep 2025 17:43:12 +0300
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
Message-ID: <aMGOgHzwig8NvxT-@kekkonen.localdomain>
References: <20250718152500.2656391-1-demonsingur@gmail.com>
 <aLBqxQQsnY3ZK4eT@kekkonen.localdomain>
 <d558ede0-5838-4a69-b25d-cafaa3b6cc97@gmail.com>
 <aMEgNtjcy1-NuBds@kekkonen.localdomain>
 <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b79e467-1d39-457f-a488-0f3eb9e14efc@gmail.com>

Hi Cosmin,

On Wed, Sep 10, 2025 at 01:48:29PM +0300, Cosmin Tanislav wrote:
> 
> 
> On 9/10/25 9:52 AM, Sakari Ailus wrote:
> > Hi Cosmin,
> > 
> > On Thu, Sep 04, 2025 at 10:52:09AM +0300, Cosmin Tanislav wrote:
> > > Hi Sakari.
> > > 
> > > I recently left Analog Devices but I will continue to try upstreaming
> > > this driver. After the upstreaming is done we can switch the
> > > maintainer status to someone else.
> > 
> > Ack, thank you.
> > 
> > > 
> > > Here's the output for the commands you asked, provided by my
> > > ex-coworker. It's for MAX96716 + 2xMAX96717 + 2x IMX219.
> > > 
> > > Do we need to fix anything based on the compliance tests?
> > 
> > Looking at the errors, it looks like some fixing is needed, possibly also
> > on v4l2-compliance side.
> > 
> 
> I'll take a closer look at the failures whenever I get the time.
> 
> > Regarding GMSL, are the image width, height or mbus code used for anything
> > by the serialiser or deserialiser drivers?
> > 
> 
> No, not really. All the information needed by the GMSL drivers is
> provided through get_frame_desc() ops, and there's no fallback for the
> data type, so the stream format is not involved at all, but as far as I
> remember it's necessary to be set properly for the media pipeline to
> pass validation.

In earlier iterations of multi-stream support we've had link validation dig
this information up from the closest sub-device that supported get_fmt pad
op but that also made the assumption there would be no stream branching
taking place, which is not the case anymore.

I guess the most simple way to address this indeed would be to add the
formats to the streams, even if the driver doesn't need them. Also for
backwards compatiblity related reasons they are probably necessary -- the
older max9671* drivers did support them, too.

This would also address (most of?) the v4l2-compliance issues.

-- 
Kind regards,

Sakari Ailus
