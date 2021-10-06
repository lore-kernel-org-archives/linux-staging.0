Received: from ni.piap.pl (ni.piap.pl [195.187.100.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED6B02C80
	for <linux-staging@lists.linux.dev>; Wed,  6 Oct 2021 10:52:59 +0000 (UTC)
From: =?utf-8?Q?Krzysztof_Ha=C5=82asa?= <khalasa@piap.pl>
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Steve Longerbeam <slongerbeam@gmail.com>,  Mauro Carvalho Chehab
 <mchehab@kernel.org>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
  Shawn Guo <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  NXP Linux Team <linux-imx@nxp.com>,
  linux-kernel@vger.kernel.org,  linux-media@vger.kernel.org,
  linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] i.MX6: Support 16-bit BT.1120 video input
References: <m3o882n0ir.fsf@t19.piap.pl>
	<568f79774cc148c58b9045da7b94b4e9e500810b.camel@pengutronix.de>
Date: Wed, 06 Oct 2021 12:52:57 +0200
In-Reply-To: <568f79774cc148c58b9045da7b94b4e9e500810b.camel@pengutronix.de>
	(Philipp Zabel's message of "Wed, 06 Oct 2021 11:36:47 +0200")
Message-ID: <m37deqmnli.fsf@t19.piap.pl>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Philipp,

Philipp Zabel <p.zabel@pengutronix.de> writes:

>> + * - BT.656 and BT.1120 (8/10-bit YUV422) data can always be processed
>> + *   on-the-fly (converted to YUV420)
>
> This comment seems misleading. The CSI converts to YUV 4:4:4 internally.

Well... this is surprising. You mean "on the internal bus", don't you?

Please correct me if the following is wrong:

I always though that the "on-the-fly processing", in case of YUV422,
means in practice I can get YUV420 out of the IPU, without a need to do
e.g. NEON conversion. I know I can get the original YUV422 as well,
using the "generic data" mode, but it's incompatible with the CODA H.264
encoder.

Ok, the DQRM (37.4.3.2.1) states that for parallel YUV the output from
CSI is always YUV444.



Then 37.4.3.9 says that the only YUV422 way is to use 16-bit "generic
data". This doesn't seem to be very true, however I'm not exactly sure
about the "on-the-fly" thing.
The fact is the patch works.
Also, the CSIx_SENS_DATA_FORMAT field in IPUx_CSIx_SENS_CONF register
shows YUV422 YUYV and UYVY input data formats, clearly separate from
"Bayer of Generic data".

DQIEC, 4.12.10.1, isn't very clear either:
8) YCbCr 20-bit (10-bit Y + 10-bit U/V) is supported with BT.1120 only
7) YCbCr 16-bit is supported under the same conditions as 8)
6) YCbCr 16-bit (=3D YUV422) is also supported as "generic-data"
   (no on-the-fly processing). This seems to imply 8) and 7) are
   supported WITH o-t-f-p (and obviously I have tested it, 16-bit only).

I think I will just remove the comment :-)
--=20
Krzysztof "Chris" Ha=C5=82asa

Sie=C4=87 Badawcza =C5=81ukasiewicz
Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
Al. Jerozolimskie 202, 02-486 Warszawa
