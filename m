Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 045962C83
	for <linux-staging@lists.linux.dev>; Tue, 12 Oct 2021 11:30:33 +0000 (UTC)
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Hans Verkuil <hverkuil@xs4all.nl>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,  Steve Longerbeam
 <slongerbeam@gmail.com>,  Mauro Carvalho Chehab <mchehab@kernel.org>,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  NXP Linux Team <linux-imx@nxp.com>,
  linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
  linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] i.MX6: Support 16-bit BT.1120 video input
References: <m34k9uml6s.fsf@t19.piap.pl>
	<07f22ee105dd8d3eaa47cbb27428032f5b9e3043.camel@pengutronix.de>
	<3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl>
Date: Tue, 12 Oct 2021 13:30:23 +0200
In-Reply-To: <3a638276-8a1b-835e-1728-669bbd49a1ac@xs4all.nl> (Hans Verkuil's
	message of "Tue, 12 Oct 2021 09:51:20 +0200")
Message-ID: <m3bl3ulbu8.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Hans,

Hans Verkuil <hverkuil@xs4all.nl> writes:

> I can take this patch and merge it, right? Even though it mostly changes
> drivers/gpu/ipu-v3/ipu-csi.c, it is still something for the media tree to=
 pick
> up, I think. Just checking to avoid this patch going in via two subsystem=
s...

Aah, sorry about that, didn't want to produce too much patch-noise.
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
