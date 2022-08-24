Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4031110
	for <linux-staging@lists.linux.dev>; Wed, 24 Aug 2022 09:48:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D732C433B5;
	Wed, 24 Aug 2022 09:48:55 +0000 (UTC)
Message-ID: <cf992081-eb0c-009d-f283-1602b74a9293@xs4all.nl>
Date: Wed, 24 Aug 2022 11:48:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] media: staging: media: zoran: Removed braces for single
 statement block
Content-Language: en-US
To: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
Cc: Corentin Labbe <clabbe@baylibre.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 mjpeg-users@lists.sourceforge.net, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20220721150055.52096-1-abhijeet.srivastava2308@gmail.com>
From: Hans Verkuil <hverkuil@xs4all.nl>
In-Reply-To: <20220721150055.52096-1-abhijeet.srivastava2308@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Abhijeet,

Thank you for the zoran patches, unfortunately these are a duplicate of

https://patchwork.linuxtv.org/project/linux-media/patch/20220810115445.2302477-2-hverkuil-cisco@xs4all.nl/

I wish I'd noticed your patches earlier, it would have saved me some work :-(

I'm marking your patches Obsoleted in patchwork.

Regards,

	Hans

On 21/07/2022 17:00, Abhijeet Srivastava wrote:
> Warning found by checkpatch.pl script.
> 
> Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
> ---
>  drivers/staging/media/zoran/zoran_card.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/zoran/zoran_card.c b/drivers/staging/media/zoran/zoran_card.c
> index 26f978a1cc72..0c138d47d0c3 100644
> --- a/drivers/staging/media/zoran/zoran_card.c
> +++ b/drivers/staging/media/zoran/zoran_card.c
> @@ -1038,9 +1038,9 @@ static int zr36057_init(struct zoran *zr)
>  	zr->stat_com = dma_alloc_coherent(&zr->pci_dev->dev,
>  					  BUZ_NUM_STAT_COM * sizeof(u32),
>  					  &zr->p_sc, GFP_KERNEL);
> -	if (!zr->stat_com) {
> +	if (!zr->stat_com) 
>  		return -ENOMEM;
> -	}
> +
>  	for (j = 0; j < BUZ_NUM_STAT_COM; j++)
>  		zr->stat_com[j] = cpu_to_le32(1); /* mark as unavailable to zr36057 */
>  
