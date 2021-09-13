Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82C643FD6;
	Mon, 13 Sep 2021 08:56:55 +0000 (UTC)
Received: from relay2-d.mail.gandi.net (unknown [217.70.183.194])
	by mslow1.mail.gandi.net (Postfix) with ESMTP id 0B32ECDED2;
	Mon, 13 Sep 2021 08:54:02 +0000 (UTC)
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by relay2-d.mail.gandi.net (Postfix) with ESMTPSA id 5001B40003;
	Mon, 13 Sep 2021 08:53:52 +0000 (UTC)
Date: Mon, 13 Sep 2021 10:53:51 +0200
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Maxime Ripard <maxime@cerno.tech>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-staging@lists.linux.dev,
	Yong Deng <yong.deng@magewell.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hans.verkuil@cisco.com>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Helen Koike <helen.koike@collabora.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH 01/22] clk: sunxi-ng: v3s: Make the ISP PLL clock public
Message-ID: <YT8RnzVqLebtPMD+@aptenodytes>
References: <20210910184147.336618-1-paul.kocialkowski@bootlin.com>
 <20210910184147.336618-2-paul.kocialkowski@bootlin.com>
 <20210913075417.ampb2jt4quftpqzj@gilmour>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jDKl5hLx33khB+zy"
Content-Disposition: inline
In-Reply-To: <20210913075417.ampb2jt4quftpqzj@gilmour>


--jDKl5hLx33khB+zy
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon 13 Sep 21, 09:54, Maxime Ripard wrote:
> On Fri, Sep 10, 2021 at 08:41:26PM +0200, Paul Kocialkowski wrote:
> > In order to reparent the CSI module clock to the ISP PLL via
> > device-tree, export the ISP PLL clock declaration in the public
> > device-tree header.
>=20
> You use clk_set_rate_exclusive in the ISP driver on the module clock so
> it should prevent what you're mentioning from happening.

It does, but then it breaks display support entirely (because the DRM
driver doesn't use clk_set_rate_exclusive).

The bottomline is that using the same PLL for both display and camera
easily results in conflicts.

> If it doesn't, then clk_set_rate_exclusive has a bug and should be
> fixed.
>=20
> Either way, using assigned-clock-parents is not a good solution here
> either, it only makes sure that this is the case when probe is run.

I'm not sure what could provide better guarantees. There is a clock
parenting API (in the clock framework) which may, but this implies
providing the parent clock to the driver which seems way out of line
since this is a platform-specific matter that should certainly not
be handled by the driver.

I also tried hardcoding the reparenting bit in the CCU driver, but
this felt less clean than doing it in device-tree.

What do you think?

> > Details regarding why the CSI module clock is best parented to the ISP
> > PLL are provided in the related commit.
>=20
> This is relevant to this commit too and "the related commit" is far too
> blurry when you consider the entire Linux git history.

Fair enough!

Cheers,

Paul

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--jDKl5hLx33khB+zy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmE/EZ8ACgkQ3cLmz3+f
v9GAXgf/WonaK8RTTtsz/x2Qh5N5DUQf8yAr5T68Jmx1Vo0uTy0bCi81Er1mcels
4i6fI+7VeDZT5eopMWHisHVtgCj0u9mACqHgNnH6izOCei7WU1I9NANeIqDDZeow
QVK16HSwIMpe5Be5UTu/tloyf8WGxcmEXTLyAhYSW3wynlegWFx7qe0GpSby7SCW
moBvtsHEQ9k3FlvvRtwnZEuUWuBFf5eWN/o0dHy69BL92MYCA0D4lDg0phCrZzru
ru41/xE+7fKLDTcOUCoVoKQX4Sh23iymP7dzk+YDbXjN8httuTe0HjZiC89sMDX/
NMsXWS3qM/Owy4KyJP7K4dfSLylwQQ==
=Rhfu
-----END PGP SIGNATURE-----

--jDKl5hLx33khB+zy--
