Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56A101C3F;
	Fri,  4 Nov 2022 15:31:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8C8BC433D7;
	Fri,  4 Nov 2022 15:31:10 +0000 (UTC)
Message-ID: <74f2c9cc-4856-4985-5b37-13ee20411b32@xs4all.nl>
Date: Fri, 4 Nov 2022 16:31:09 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 00/11] media: cedrus: Format handling improvements and
 10-bit HEVC support
Content-Language: en-US
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org,
 paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org, gregkh@linuxfoundation.org, wens@csie.org,
 samuel@sholland.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20221102180810.267252-1-jernej.skrabec@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20221102180810.267252-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jernej,

On 02/11/2022 19:07, Jernej Skrabec wrote:
> While my first intention was to just add 10-bit HEVC handling, I noticed
> a few format handling issues and a bit of redundancy in some cases. Final
> result is that driver now sticks to stateless decoder rules better.
> 
> Format handling improvements:
> 1. Default format selection is now based on HW capabilities. Before, MPEG2
>    was hardcoded but some Cedrus variants don't actually support it.
> 2. Controls are registered only if related codec is supported by HW.
> 3. Untiled output format is preferred, if supported, over tiled one. All
>    display engine cores support untiled format, but only first generation
>    supports tiled one.
> 
> I hope this makes Cedrus eligible for destaging.
> 
> Best regards,
> Jernej
> 
> Changes from v1:
> - collected acks, except for patch 5, which was changed
> - use cedrus_is_capable() for cedrus_find_format() too (patch 4)
> - tightly pack control pointers in ctx->ctrls[] (patch 5)
> 
> Jernej Skrabec (11):
>   media: cedrus: remove superfluous call
>   media: cedrus: Add format reset helpers
>   media: cedrus: use helper to set default formats
>   media: cedrus: Add helper for checking capabilities
>   media: cedrus: Filter controls based on capability
>   media: cedrus: set codec ops immediately
>   media: cedrus: Remove cedrus_codec enum
>   media: cedrus: prefer untiled capture format
>   media: cedrus: initialize controls a bit later

I'm going to merge the first 9 patches, but leave out the last
two. It's weird what happens there, and I think those two need a
bit more work.

Regards,

	Hans

>   media: cedrus: Adjust buffer size based on control values
>   media: cedrus: h265: Support decoding 10-bit frames
> 
>  drivers/staging/media/sunxi/cedrus/cedrus.c   | 102 +++++----
>  drivers/staging/media/sunxi/cedrus/cedrus.h   |  22 +-
>  .../staging/media/sunxi/cedrus/cedrus_dec.c   |   4 +-
>  .../staging/media/sunxi/cedrus/cedrus_h264.c  |   2 +-
>  .../staging/media/sunxi/cedrus/cedrus_h265.c  |  37 +++-
>  .../staging/media/sunxi/cedrus/cedrus_hw.c    |  18 +-
>  .../staging/media/sunxi/cedrus/cedrus_hw.h    |   2 +-
>  .../staging/media/sunxi/cedrus/cedrus_mpeg2.c |   2 +-
>  .../staging/media/sunxi/cedrus/cedrus_regs.h  |  16 ++
>  .../staging/media/sunxi/cedrus/cedrus_video.c | 200 ++++++++++--------
>  .../staging/media/sunxi/cedrus/cedrus_video.h |   2 +
>  .../staging/media/sunxi/cedrus/cedrus_vp8.c   |   2 +-
>  12 files changed, 244 insertions(+), 165 deletions(-)
> 
> --
> 2.38.1
> 

