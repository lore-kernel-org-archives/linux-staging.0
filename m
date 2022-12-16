Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5D90258D
	for <linux-staging@lists.linux.dev>; Fri, 16 Dec 2022 17:23:16 +0000 (UTC)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p6EQJ-0000Hx-PA; Fri, 16 Dec 2022 18:23:03 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p6EQH-004yGT-OC; Fri, 16 Dec 2022 18:23:02 +0100
Received: from pza by lupine with local (Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1p6EQG-000CO8-Tw; Fri, 16 Dec 2022 18:23:00 +0100
Message-ID: <545454630ff9f769ef61178bdd623621fafed4e2.camel@pengutronix.de>
Subject: Re: [PATCH v2] media: imx: remove code for non-existing config
 IMX_GPT_ICAP
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Lukas Bulwahn <lukas.bulwahn@gmail.com>, Tommaso Merciai
 <tommaso.merciai@amarulasolutions.com>, Steve Longerbeam
 <slongerbeam@gmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Fri, 16 Dec 2022 18:23:00 +0100
In-Reply-To: <20221123075216.28193-1-lukas.bulwahn@gmail.com>
References: <20221123075216.28193-1-lukas.bulwahn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.38.3-1 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-staging@lists.linux.dev

On Mi, 2022-11-23 at 08:52 +0100, Lukas Bulwahn wrote:
> There never was a config IMX_GPT_ICAP in the repository. So remove the co=
de
> conditional on this config and simplify the callers that just called empt=
y
> functions.
>=20
> Signed-off-by: Lukas Bulwahn <lukas.bulwahn@gmail.com>

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
