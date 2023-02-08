Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E85633FF
	for <linux-staging@lists.linux.dev>; Wed,  8 Feb 2023 15:41:50 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi [213.243.189.158])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id F2D50E79;
	Wed,  8 Feb 2023 16:41:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1675870908;
	bh=i51ERP0xrqN7mXHtKDcAXZg79/tk6kkoX8flGdEGcMA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NHFhLeYgXA6hgyLBE8zZQor8DODz1awmM797PLJEeG7HMlZ2QvfXo5T8BVH8rvU1M
	 qZPuKlpx11IOkArD49JKDbrl9/mpJB2icHZPJqzIIm5NUo3UwZNfeENXqicGcnPDCi
	 YIDLTg/TVNuN/Nkrimcce1vBfSqlisADRkcckfz0=
Date: Wed, 8 Feb 2023 17:41:46 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Andy Shevchenko <andy@kernel.org>,
	Yury Luneff <yury.lunev@gmail.com>,
	Nable <nable.maininbox@googlemail.com>, andrey.i.trufanov@gmail.com,
	Fabio Aiuto <fabioaiuto83@gmail.com>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 28/57] media: Add ovxxxx_16bit_addr_reg_helpers.h
Message-ID: <Y+PCulPVN7GGz2T7@pendragon.ideasonboard.com>
References: <20230123125205.622152-1-hdegoede@redhat.com>
 <20230123125205.622152-29-hdegoede@redhat.com>
 <Y+Nw32EZUZtq3esL@pendragon.ideasonboard.com>
 <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAHp75VcyvON1-yoBsTsZDmjsA-527xyvF+weEXWcXjO3Y2hBrA@mail.gmail.com>

On Wed, Feb 08, 2023 at 01:27:37PM +0200, Andy Shevchenko wrote:
> On Wed, Feb 8, 2023 at 11:52 AM Laurent Pinchart wrote:
> > On Mon, Jan 23, 2023 at 01:51:36PM +0100, Hans de Goede wrote:
> 
> ...
> 
> > > Add a new ovxxxx_16bit_addr_reg_helpers.h header file with static inline
> > > versions of these register access helpers, so that this code duplication
> > > can be removed.
> >
> > Any reason to hand-roll those instead of using regmap ? Also, may I
> > suggest to have a look at drivers/media/i2c/imx290.c
> 
> While this is a bit error prone example, a patch is on its way, ...

The two cleanups are nice, but they're cleanup, not error fixes :-)

> > for an example of
> > how registers of different sizes can be handled in a less error-prone
> > way, using single read/write functions that adapt to the size
> > automatically ?
> 
> ...with regmap fields I believe you can avoid even that and use proper
> regmap accessors directly.

I haven't looked at regmap fields so I don't know if they're the right
tool for the job. If we can use the regmap API as-is without any
wrapper, even better. Otherwise, new regmap helpers and/or I2C helpers
may also be an option. This is a very common use case, not limited to OV
camera sensors, or even camera sensors in general.

-- 
Regards,

Laurent Pinchart
