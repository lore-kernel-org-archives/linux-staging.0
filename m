Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 347DD2C88
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 11:31:28 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mYo5q-000748-B3; Fri, 08 Oct 2021 13:31:14 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mYo5p-0005OO-7j; Fri, 08 Oct 2021 13:31:13 +0200
Message-ID: <07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
Subject: Re: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Krzysztof =?UTF-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>, Steve Longerbeam
	 <slongerbeam@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Date: Fri, 08 Oct 2021 13:31:13 +0200
In-Reply-To: <m34k9uml6s.fsf@t19.piap.pl>
References: <m34k9uml6s.fsf@t19.piap.pl>
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

On Wed, 2021-10-06 at 08:13 +0200, Krzysztof Ha=C5=82asa wrote:
> Confirmed to work with ADV7610 HDMI receiver.
>=20
> Signed-off-by: Krzysztof Ha=C5=82asa <khalasa@piap.pl>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
