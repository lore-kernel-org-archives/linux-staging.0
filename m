Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FB757A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:44:11 +0000 (UTC)
Received: from relay6-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::226])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 7FA55CE71A
	for <linux-staging@lists.linux.dev>; Thu, 16 Jun 2022 10:36:45 +0000 (UTC)
Received: (Authenticated sender: jacopo@jmondi.org)
	by mail.gandi.net (Postfix) with ESMTPSA id 02CD8C0005;
	Thu, 16 Jun 2022 10:36:35 +0000 (UTC)
Date: Thu, 16 Jun 2022 12:36:34 +0200
From: Jacopo Mondi <jacopo@jmondi.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Andrea Merello <andrea.merello@gmail.com>,
	Magnus Damm <magnus.damm@gmail.com>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/2] staging: iio: imu: Add CEVA BNO08x driver
Message-ID: <20220616103634.vkb7nkn555a5evlw@uno.localdomain>
References: <20220616100006.22045-1-jacopo+renesas@jmondi.org>
 <20220616100006.22045-3-jacopo+renesas@jmondi.org>
 <YqsFSrg+Q+jdsId/@kroah.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <YqsFSrg+Q+jdsId/@kroah.com>

Hi Greg

On Thu, Jun 16, 2022 at 12:26:18PM +0200, Greg Kroah-Hartman wrote:
> On Thu, Jun 16, 2022 at 12:00:06PM +0200, Jacopo Mondi wrote:
> > From: Jacopo Mondi <jacopo@jmondi.org>
> >
> > Add support for CEVA BNO08x Sensor Hub.
> >
> > The BNO08X family (BNO080/85/86) is a System in Package (SiP) that
> > integrates a triaxial accelerometer, triaxial gyroscope, magnetometer
> > and a 32-bit ARM Cortex-M0+ microcontroller running CEVA's SH-2
> > firmware.
> >
> > Datasheet:
> > https://www.ceva-dsp.com/wp-content/uploads/2019/10/BNO080_085-Datasheet.pdf
> >
> > Signed-off-by: Jacopo Mondi <jacopo@jmondi.org>
> > ---
> >  MAINTAINERS                             |   7 +
> >  drivers/staging/iio/Kconfig             |   1 +
> >  drivers/staging/iio/Makefile            |   1 +
> >  drivers/staging/iio/imu/bno08x/Kconfig  |  11 +
> >  drivers/staging/iio/imu/bno08x/Makefile |   3 +
> >  drivers/staging/iio/imu/bno08x/bno08x.c | 618 ++++++++++++++++++++++++
>
> Why are you adding a new driver to staging/iio/ and not to the real part
> of the kernel?  What needs to be done to it to get it out of here?

Mostly because I don't have access to the hw development platform
anymore, and the one I had was not reliable enough for any further
development anyway.

I went for staging as I cannot guarantee I can test any requested
change on the series.

I'm afraid this is a "take it or leave it" series, and as the driver
does anyway work (even if for a single feature) I thought it was worth
sending it upstream anyway.

>
> I'd prefer that we not add any new iio drivers if at all possible,
> please fix them up properly and merge them to the correct location.
>
> thanks,
>
> greg k-h
