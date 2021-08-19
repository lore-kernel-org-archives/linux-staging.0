Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81BFB72;
	Thu, 19 Aug 2021 17:55:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	(Authenticated sender: nicolas)
	with ESMTPSA id 27D711F43F4F
Message-ID: <4b67e381c3c6819d5888f4ca713db5236b58d951.camel@collabora.com>
Subject: Re: [PATCH] media: cedrus: Fix SUNXI tile size calculation
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Jernej =?UTF-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>, Maxime
 Ripard <mripard@kernel.org>
Cc: Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev,  linux-kernel@vger.kernel.org
Date: Thu, 19 Aug 2021 13:54:59 -0400
In-Reply-To: <3519986.qLKfoAsNv3@jernej-laptop>
References: <20210819140009.158156-1-nicolas.dufresne@collabora.com>
	 <3519986.qLKfoAsNv3@jernej-laptop>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le jeudi 19 août 2021 à 18:30 +0200, Jernej Škrabec a écrit :
> Hi Nicolas!
> 
> Dne četrtek, 19. avgust 2021 ob 16:00:09 CEST je Nicolas Dufresne napisal(a):
> > Tiled formats requires full rows being allocated (even for Chroma
> > planes). When the number of Luma tiles is odd, we need to round up
> > to twice the tile width in order to roundup the number of Chroma
> > tiles.
> > 
> > This was notice with a crash running BA1_FT_C compliance test using
> > sunxi tiles using GStreamer. Cedrus driver would allocate 9 rows for
> > Luma, but only 4.5 rows for Chroma, causing userspace to crash.
> > 
> > Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> 
> Fixes tag would be nice so it would be picked up for stable branches. 
> Otherwise it looks good. It also aligns logic with libvdpau-sunxi.

Sure, I'd say can be merged adding (it was broken since when cedrus was added):

Fixes: 50e761516f2b8 ("media: platform: Add Cedrus VPU decoder driver")

> 
> Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> 
> Best regards,
> Jernej
> 
> 


