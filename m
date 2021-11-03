Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B742C96
	for <linux-staging@lists.linux.dev>; Wed,  3 Nov 2021 12:32:37 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1miFRK-0004xc-Ei; Wed, 03 Nov 2021 13:32:26 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1miFRH-000BSG-Oo; Wed, 03 Nov 2021 13:32:23 +0100
Message-ID: <092d8c2ba808a25efab579a6d7cc32846c482206.camel@pengutronix.de>
Subject: Re: [PATCHv3 4/4] media: imx: Use dedicated format handler for
 i.MX7/8
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, Steve Longerbeam
 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, phone-devel@vger.kernel.org
Cc: Rui Miguel Silva <rmfrfs@gmail.com>, Laurent Pinchart
	 <laurent.pinchart@ideasonboard.com>
Date: Wed, 03 Nov 2021 13:32:23 +0100
In-Reply-To: <20211019120047.827915-4-dorota.czaplejewicz@puri.sm>
References: <20211019120047.827915-1-dorota.czaplejewicz@puri.sm>
	 <20211019120047.827915-4-dorota.czaplejewicz@puri.sm>
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

On Tue, 2021-10-19 at 14:14 +0200, Dorota Czaplejewicz wrote:
> This splits out a format handler which takes into account
> the capabilities of the i.MX7/8 video device,
> as opposed to the default handler compatible with both i.MX5/6 and i.MX7/=
8.
>=20
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

Cc: Rui & Laurent

Looks sane to me, but I'd like someone with i.MX7/8 media experience to
have a look at this.

Thread at
https://lore.kernel.org/linux-media/20211019120047.827915-1-dorota.czapleje=
wicz@puri.sm/

regards
Philipp
