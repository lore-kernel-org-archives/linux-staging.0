Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A32C80
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 15:39:51 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 98266E79;
	Wed,  8 Feb 2023 16:39:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1675870789;
	bh=VkvUeZ2AOI2dDeGwvWBcFO0P+Yx6u2S+8ln8zSKdpyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GANi+rPakyejK17KP5vWWtOGoJ1avbuxwVTx7wqBvmAbD/J6nPq+5Sv7HcCEFjLC0
	 oonT3yoz6yxi/aOI1t9CnosmtYqyXqdgrqhfvsSPK3Ga2+Y/7t2F9XPp2JOYryr1oe
	 kd05TI3kLIZNUm0zV9m+ox4IgUO37hDU1+lpkNaI=
Date: Wed, 8 Feb 2023 17:39:48 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+PCRIRuOAiV+zC8@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+OIBefssxY3bbmK@kekkonen.localdomain>
 <20230208153329.6dccd807@coco.lan>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230208153329.6dccd807@coco.lan>

On Wed, Feb 08, 2023 at 03:33:29PM +0100, Mauro Carvalho Chehab wrote:
> Em Wed, 8 Feb 2023 13:31:17 +0200
> Sakari Ailus <sakari.ailus@linux.intel.com> escreveu:
> 
> > Hi Hans,
> > 
> > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> > > The following drivers under drivers/media/i2c: ov08x40.c, ov13858.c,
> > > ov13b10.c, ov2680.c, ov2685.c, ov2740.c, ov4689.c, ov5670.c,
> > > ov5675.c, ov5695.c, ov8856.c, ov9282.c and ov9734.c,
> > > 
> > > as well as various "atomisp" sensor drivers in drivers/staging, *all*
> > > use register access helpers with the following function prototypes:
> > > 
> > > int ovxxxx_read_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >                     unsigned int len, u32 *val);
> > > 
> > > int ovxxxx_write_reg(struct ovxxxx_dev *sensor, u16 reg,
> > >                      unsigned int len, u32 val);
> > > 
> > > To read/write registers on Omnivision OVxxxx image sensors wich expect
> > > a 16 bit register address in big-endian format and which have 1-3 byte
> > > wide registers, in big-endian format (for the higher width registers).
> > > 
> > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > versions of these register access helpers, so that this code duplication
> > > can be removed.  
> > 
> > Ideally we'd have helpers for CCI, of which this is a subset. And on top of
> > regmap. I don't object adding these either though.
> 
> Well, ideally, when the atomisp-specific sensor ioctls go away, we can
> merge the atomisp-specific sensor drivers for not-yet-uptreamed sensors
> or modify the existing sensor drivers to accept the atomisp resolutions [1].

Please don't, that's not the right way to handle that. If the ISP needs
extra lines or columns, then the corresponding sensor drivers should be
converted to implement the selection API correctly, instead of adding
"modes".

> So, for now, I wouldn't convert those to use regmap. This can be done
> later with the remaining drivers.
> 
> [1] atomisp usually requires 16 extra lines/columns for it to work, so
> the current sensor drivers there allow setting resolutions like
> 1616x1216 at the sensor, while offering 1600x1200 resolution to
> userspace.

-- 
Regards,

Laurent Pinchart
