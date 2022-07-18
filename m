Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B2AEA6;
	Mon, 18 Jul 2022 10:12:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD49FC341C0;
	Mon, 18 Jul 2022 10:12:49 +0000 (UTC)
Message-ID: <f3162b4e-a2ab-326b-f905-360dc63bc143@xs4all.nl>
Date: Mon, 18 Jul 2022 12:12:47 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 0/7] Enable 10bits bitstream for Hantro/G2 HEVC codec
Content-Language: en-US
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>, mchehab@kernel.org,
 ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de,
 gregkh@linuxfoundation.org, mripard@kernel.org,
 paul.kocialkowski@bootlin.com, wens@csie.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, nicolas.dufresne@collabora.com, andrzej.p@collabora.com
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 kernel@collabora.com
References: <20220718083945.200845-1-benjamin.gaignard@collabora.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220718083945.200845-1-benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/18/22 10:39, Benjamin Gaignard wrote:
> Since v1 Jernej patches to support 10 bits decoding have been merged.
> This v2 rebase the previously send patches and add Ezequiel reviewed-by
> tag.
> This series add 10bits support for newer hardware blocks (i.e without
> legacy regs) and for HEVC codec.
> 
> It based tested on IMX8MQ with HEVC conformance tests.
> The results are that all 10bits bitstreams are OK.
> 
> The problematic point raise by this series is the question of where 
> to put HEVC validation function. Does it have to be only hantro_try_ctrl()
> or shall it be done also in .run().
> This series doesn't change that behavoir so I will argue in farvor to
> merge it and to work on this validation time problem when unstaging 
> the driver.
> Hans, Ezequiel may that sound acceptable for you ? 

Hmm, the hantro driver will be unstaged either this week or (hopefully)
very early on in the next cycle. So I think you should no longer consider
hantro as a staging driver but as a regular mainline driver.

This series definitely won't make the 5.20 cut, so I think it makes more
sense to get this right before merging it.

Regards,

	Hans

> 
> Regards,
> Benjamin
> 
> Benjamin Gaignard (7):
>   media: hantro: Store HEVC bit depth in context
>   media: hantro: HEVC: Fix auxilary buffer size calculation
>   media: hantro: HEVC: Fix chroma offset computation
>   media: hantro: postproc: Configure output regs to support 10bit
>   media: Hantro: HEVC: Allows 10-bit bitstream
>   media: hantro: imx8m: Enable 10bit decoding
>   media: hantro: Allows luma and chroma depth to be different
> 
>  .../staging/media/hantro/hantro_g2_hevc_dec.c |  4 +--
>  drivers/staging/media/hantro/hantro_hevc.c    | 13 +++++----
>  .../staging/media/hantro/hantro_postproc.c    |  7 ++++-
>  drivers/staging/media/hantro/imx8m_vpu_hw.c   | 27 +++++++++++++++++++
>  4 files changed, 40 insertions(+), 11 deletions(-)
> 

