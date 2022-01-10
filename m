Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3477A29CA
	for <linux-staging@lists.linux.dev>; Mon, 10 Jan 2022 10:23:36 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6rpu-0005kw-Eo; Mon, 10 Jan 2022 11:23:34 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1n6rpt-0007w9-86; Mon, 10 Jan 2022 11:23:33 +0100
Message-ID: <12b7e367e8323f6da7bb548dbbae0d342608e52b.camel@pengutronix.de>
Subject: Re: [PATCH v6 3/4] clk: ralink: make system controller node a reset
 provider
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: "open list:COMMON CLK FRAMEWORK" <linux-clk@vger.kernel.org>, John
 Crispin <john@phrozen.org>, linux-staging@lists.linux.dev, Greg KH
 <gregkh@linuxfoundation.org>,  NeilBrown <neil@brown.name>, linux-kernel
 <linux-kernel@vger.kernel.org>, Stephen Boyd <sboyd@kernel.org>
Date: Mon, 10 Jan 2022 11:23:33 +0100
In-Reply-To: <CAMhs-H_gjW_6p6yBWf+k2PBym4N+k+rBEXR9S8c13NU-UWD4VQ@mail.gmail.com>
References: <20220110083910.1351020-1-sergio.paracuellos@gmail.com>
	 <20220110083910.1351020-4-sergio.paracuellos@gmail.com>
	 <5368e89c391e1329ed2be6496655f1bb50acfd19.camel@pengutronix.de>
	 <CAMhs-H_gjW_6p6yBWf+k2PBym4N+k+rBEXR9S8c13NU-UWD4VQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Mon, 2022-01-10 at 10:39 +0100, Sergio Paracuellos wrote:
[...]
> > Is this known to work for all possible users, without delay between
> > assert and deassert?
>=20
> It seems it is. This is based on the original reset implementation for
> ralink. See:
>=20
> https://elixir.bootlin.com/linux/v5.16/source/arch/mips/ralink/reset.c#L5=
5
>
> > Are there any users of the reset_control_reset() API at all? This API
> > was added for self-clearing reset bits, so if there are no users that
> > need to pretend this is a reset pulse at the hardware level (there may
> > be), I'd prefer if this was just left out.
>=20
> I am not following you here. What do you mean?

Looking at drivers/staging/mt7621-dts/mt7621.dtsi, it appears the
current reset users are:
  mediatek,mt7621-i2c
  ralink,mt7621-spi
  ralink,rt3883-gdma
  mediatek,mt7621-hsdma
  mediatek,mt7621-eth
  mediatek,mt7621
  mediatek,mt7621-pci

Many of the corresponding drivers use device_reset(), which is a
shorthand for requesting a reset control and calling
reset_control_reset() on it. That will call mt7621_reset_device, so it
is indeed used.

regards
Philipp
