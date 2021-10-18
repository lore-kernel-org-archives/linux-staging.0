Received: from metis.ext.pengutronix.de (metis.ext.pengutronix.de [85.220.165.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D09922C81
	for <linux-staging@lists.linux.dev>; Mon, 18 Oct 2021 10:20:51 +0000 (UTC)
Received: from lupine.hi.pengutronix.de ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPl9-0000HJ-96; Mon, 18 Oct 2021 12:20:47 +0200
Received: from pza by lupine with local (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1mcPl8-0005IX-SF; Mon, 18 Oct 2021 12:20:46 +0200
Message-ID: <f2011a5434a7c3fc8809c3cbde59891af6b13689.camel@pengutronix.de>
Subject: Re: [PATCHv2 2/4] media: imx: Store the type of hardware
 implementation
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>, Steve Longerbeam
 <slongerbeam@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>,  Fabio Estevam <festevam@gmail.com>,
 NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, kernel@puri.sm, phone-devel@vger.kernel.org
Date: Mon, 18 Oct 2021 12:20:46 +0200
In-Reply-To: <20211017102904.756408-2-dorota.czaplejewicz@puri.sm>
References: <20211017102904.756408-1-dorota.czaplejewicz@puri.sm>
	 <20211017102904.756408-2-dorota.czaplejewicz@puri.sm>
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

On Sun, 2021-10-17 at 13:08 +0200, Dorota Czaplejewicz wrote:
> The driver covers i.MX5/6, as well as i.MX7/8 hardware.
> Those implementations differ, e.g. in the sizes of buffers they accept.
>=20
> Some functionality should be abstracted, and storing type achieves that.
>=20
> Signed-off-by: Dorota Czaplejewicz <dorota.czaplejewicz@puri.sm>

I'd call the enum imx_media_device_type, but that's just a slight
preference:

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
