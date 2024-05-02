Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E43286BD;
	Thu,  2 May 2024 16:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714667060; cv=none; b=KbwoknCGocAJH0rujOOOhudv0LPbzmaGDlBmW7ZY9R6Pg39Ep1vteisg60xbc0i06B1rk3Ey4b9x1FWZulYWqINl8ECZ5NJb/TWBYnym3KTBtbcCzuvx9dpT1lPOGiTN+v47+W5dMI2DA68cml8zrwHafZKRmwpHbCdhOUQ0SEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714667060; c=relaxed/simple;
	bh=8bnm0Mp6aA159OPgwtTWCVCezNkfmBxywIMR3Q9y61E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qmh05pM87BBfyidppggjpVA+QDnDE20t5zCWIosNzXm+iRpm32k/tnxbuc7o3PnAcVatjx4H4Xp0fj54tR7c6I+6O8LUgAD9PxZbVk8ZVERVa/RyndvhXppqh+E5EvZ3HB8YuCpvd9aKNk9sW7w/N5qThKinCaLv0qTUlm3h6Ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J/MCLWtq; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J/MCLWtq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714667058; x=1746203058;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=8bnm0Mp6aA159OPgwtTWCVCezNkfmBxywIMR3Q9y61E=;
  b=J/MCLWtqNTgCepDNWTg24ALIDZe8/oJLTH0chaBkJeo8gtzu3sfHydHy
   hgQu2UVpCfINfdCwYF4bnnqNKIEKddwVWGNKK9dTKjXElm1z1igjRB9OF
   pU5OzWeJxgDxrQ14fabPHOYJ7mgMsywroqkJBfP52rUZmxZmdbjpazOU1
   xP2lFgRCzX1lskE/CbUbuFyd6d8u/5XDkr59cKcy7H/y437pA8wjZ70zV
   OjNYJ6hsdLPS5A0uUzyfDnyuUuPnNt5GIeAnn3h4G2N1hpolBa1rCvFet
   yaoVojzFXJ3QOP3Rkzv1LMYtqyBjkbPWez3SgwKhQzj4LFHmA8I+933zW
   Q==;
X-CSE-ConnectionGUID: W2+Rd4UuTUiFqqxIpbbTbQ==
X-CSE-MsgGUID: cycKHvjHToGRb65SawtDKQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11062"; a="10378815"
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="10378815"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 09:24:17 -0700
X-CSE-ConnectionGUID: KOLNAtX6T7KZpywrZQlLxA==
X-CSE-MsgGUID: gR0+wEiZTceieBxBxgLpiQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,247,1708416000"; 
   d="scan'208";a="31662316"
Received: from turnipsi.fi.intel.com (HELO kekkonen.fi.intel.com) ([10.237.72.44])
  by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2024 09:24:07 -0700
Received: from kekkonen.localdomain (localhost [127.0.0.1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 8C03A11FA94;
	Thu,  2 May 2024 19:24:04 +0300 (EEST)
Date: Thu, 2 May 2024 16:24:04 +0000
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Julien Massot <julien.massot@collabora.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Yong Zhi <yong.zhi@intel.com>, Bingbu Cao <bingbu.cao@intel.com>,
	Dan Scally <djrscally@gmail.com>,
	Tianshu Qiu <tian.shu.qiu@intel.com>,
	Eugen Hristev <eugen.hristev@collabora.com>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Maxime Ripard <mripard@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Robert Foss <rfoss@kernel.org>,
	Todor Tomov <todor.too@gmail.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Dafna Hirschfeld <dafna@fastmail.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Hugues Fruchet <hugues.fruchet@foss.st.com>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Yong Deng <yong.deng@magewell.com>,
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>,
	Benoit Parrot <bparrot@ti.com>, Jai Luthra <j-luthra@ti.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michal Simek <michal.simek@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-staging@lists.linux.dev,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH 0/2] Introduce v4l2_async_nf_unregister_cleanup
Message-ID: <ZjO-JDBdHXVLbz5H@kekkonen.localdomain>
References: <20240502-master-v1-0-8bd109c6a3ba@collabora.com>
 <20240502155626.GD15807@pendragon.ideasonboard.com>
 <ZjO46Uo_tVcRTdA0@kekkonen.localdomain>
 <20240502160830.GB11443@pendragon.ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240502160830.GB11443@pendragon.ideasonboard.com>

Hi Laurent,

On Thu, May 02, 2024 at 07:08:30PM +0300, Laurent Pinchart wrote:
> On Thu, May 02, 2024 at 04:01:45PM +0000, Sakari Ailus wrote:
> > On Thu, May 02, 2024 at 06:56:26PM +0300, Laurent Pinchart wrote:
> > > On Thu, May 02, 2024 at 05:22:20PM +0200, Julien Massot wrote:
> > > > Many drivers has
> > > >   v4l2_async_nf_unregister(&notifier);
> > > >   v4l2_async_nf_cleanup(&notifier);
> > > > 
> > > > Introduce a helper function to call both functions in one line.
> > > 
> > > Does this really go in the right direction ? For other objects (video
> > > devices, media devices, ...), the unregistration should be done at
> > > .remove() time, and the cleanup at .release() time (the operation called
> > > when the last reference to the object is released). This is needed to
> > > ensure proper lifetime management of the objects, and avoid a
> > > use-after-free for objects that can be reached from userspace.
> > > 
> > > It could be argued that the notifier isn't exposed to userspace, but can
> > > we guarantee that no driver will have a need to access the notifier in a
> > > code path triggered by a userspace operation ? I think it would be safer
> > > to adopt the same split for the nofifier unregistration and cleanup. In
> > > my opinion using the same rule across different APIs also make it easier
> > > for driver authors and for reviewers to get it right.
> > > 
> > > As shown by your series, lots of drivers call v4l2_async_nf_cleanup()
> > > and .remove() time instead of .release(). That's because most drivers
> > > get lifetime management wrong and don't even implement .release().
> > > That's something Sakari is addressing with ongoing work. This patch
> > > series seems to go in the opposite direction.
> > 
> > This still avoids the driver authors feeling they need to implement wrapper
> > functions for v4l2_async_nf_{unregister,cleanup}. I'd be in favour merging
> > this.
> > 
> > I don't see this getting in the way of adding use counts as the code will
> > need to be changed in any case.
> 
> Fixing the lifetime issues would essentially revert 2/2 and move the
> v4l2_async_nf_cleanup() call to .remove(). I don't think providing a
> helper that forces the cleanup at .remove() time is a good idea, it
> gives a false sense of doing things right to drivers. This is the same
> reason why devm_kzalloc() is so harmful, it gave the wrong message, and
> created (or participated in) all those lifetime issues.

I still prefer having devm_*alloc() functions than having the drivers open
coding the same -- with the same result. The frameworks won't enable doing
this right at the moment and I don't think drivers (or us!) should be
penalised for that. The driver authors will only change what they do, with
these patches or without, when told so. But we don't really have an
alternative today.

A similar situation exists with clk_unprepare() and clk_disable().

-- 
Kind regards,

Sakari Ailus
