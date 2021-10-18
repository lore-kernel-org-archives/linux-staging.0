Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519092C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:21:20 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPlb-0000YE-Kn; Mon, 18 Oct 2021 12:21:15 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPlb-0005J3-76; Mon, 18 Oct 2021 12:21:15 +0200
Message-ID: <b99705233d4a79c22d99c41568477491a51f48c6.camel@pengutronix.de>
Subject: Re: [PATCH] media: imx: Round line size to 4 bytes
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@puri.sm, phone-devel@vger.kernel.org
Date: Mon, 18 Oct 2021 12:21:15 +0200
In-Reply-To: <20211017130713.4668c616.dorota.czaplejewicz@puri.sm>
References: <20211006110207.256325-1-dorota.czaplejewicz@puri.sm>
	 <7d61fdbd161fce40874766bde5f95c3b73f1a96d.camel@pengutronix.de>
	 <20211013112636.6963344d.dorota.czaplejewicz@puri.sm>
	 <1d8878e86b862ae8d551b6796e86c4fb1eb5d671.camel@pengutronix.de>
	 <20211017130713.4668c616.dorota.czaplejewicz@puri.sm>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.30.5-1.1 
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

On Sun, 2021-10-17 at 13:07 +0200, Dorota Czaplejewicz wrote:
> Hello,
>=20
> On Thu, 14 Oct 2021 13:26:26 +0200
> Philipp Zabel <p.zabel@pengutronix.de> wrote:
>=20
> > Hi Dorota,
> >=20
> > On Wed, 2021-10-13 at 11:26 +0200, Dorota Czaplejewicz wrote:
> > > On Fri, 08 Oct 2021 14:19:41 +0200 Philipp Zabel <p.zabel@pengutronix=
.de> wrote: =20
> > [...]
> > > > I wonder: if you use 4-byte aligned width and odd height, does the =
CSI
> > > > write over the end of the buffer? =20
> > >=20
> > > I tested this case, and found a glitch which suggests the last 4 byte=
s are ignored:
> > >=20
> > > https://source.puri.sm/Librem5/linux-next/uploads/cfb59e3832431aaa3a6=
9549455502568/image.png =20
> >=20
> > Thank you for testing, so it appears that at least without FBUF_STRIDE
> > the only requirement is that the whole image size must be a multiple of
> > 8 bytes.
> >=20
> > > That would be taken care of rounding up towards a number decided at r=
untime, like:
> > >=20
> > > divisor =3D 8 >> (mbus->height % 2); =20
> >=20
> > Which would then cause the CSI to write past the end of the buffer?
> >=20
> I'm not sure if you point out the mistake here (should be "4 <<"), or
> the fact that rounding is happening. If it's the latter, then it's of
> no concern: the values derived here are used to calculate buffer size.
>=20
> I'm submitting a new series where this is fixed.

Thanks, I just didn't understand your intention. The name "divisor"
threw me off, see the comment in the new series.

regards
Philipp
