Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C193EA6
	for <linux-staging@lists.linux.dev>; Thu, 28 Apr 2022 07:31:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 390FAC385A9;
	Thu, 28 Apr 2022 07:31:17 +0000 (UTC)
Message-ID: <e46146ad-7aa8-8b39-536b-0525de9140cc@xs4all.nl>
Date: Thu, 28 Apr 2022 09:31:15 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 34/49] media: tegra-video: replace bitmap_weight with
 bitmap_weight_le
Content-Language: en-US
To: Yury Norov <yury.norov@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Andrew Morton <akpm@linux-foundation.org>,
 =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Zijlstra <peterz@infradead.org>, David Laight
 <David.Laight@aculab.com>, Joe Perches <joe@perches.com>,
 Dennis Zhou <dennis@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Nicholas Piggin <npiggin@gmail.com>,
 Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
 Alexey Klimov <aklimov@redhat.com>, linux-kernel@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Sowjanya Komatineni <skomatineni@nvidia.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-staging@lists.linux.dev
References: <20220210224933.379149-1-yury.norov@gmail.com>
 <20220210224933.379149-35-yury.norov@gmail.com>
From: Hans Verkuil <hverkuil-cisco@xs4all.nl>
In-Reply-To: <20220210224933.379149-35-yury.norov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/02/2022 23:49, Yury Norov wrote:
> tegra_channel_enum_format() calls bitmap_weight() to compare the weight
> of bitmap with a given number. We can do it more efficiently with
> bitmap_weight_le() because conditional bitmap_weight may stop traversing
> the bitmap earlier, as soon as condition is (or can't be) met.
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/staging/media/tegra-video/vi.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/tegra-video/vi.c b/drivers/staging/media/tegra-video/vi.c
> index d1f43f465c22..4e79a80e9307 100644
> --- a/drivers/staging/media/tegra-video/vi.c
> +++ b/drivers/staging/media/tegra-video/vi.c
> @@ -436,7 +436,7 @@ static int tegra_channel_enum_format(struct file *file, void *fh,
>  	if (!IS_ENABLED(CONFIG_VIDEO_TEGRA_TPG))
>  		fmts_bitmap = chan->fmts_bitmap;
>  
> -	if (f->index >= bitmap_weight(fmts_bitmap, MAX_FORMAT_NUM))
> +	if (bitmap_weight_le(fmts_bitmap, MAX_FORMAT_NUM, f->index))
>  		return -EINVAL;
>  
>  	for (i = 0; i < f->index + 1; i++, index++)

