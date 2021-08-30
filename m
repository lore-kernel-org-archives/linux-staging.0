Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87623FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 11:27:01 +0000 (UTC)
Received: from jic23-huawei (cpc108967-cmbg20-2-0-cust86.5-4.cable.virginm.net [81.101.6.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8890A6112F;
	Mon, 30 Aug 2021 11:26:58 +0000 (UTC)
Date: Mon, 30 Aug 2021 12:30:10 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Alexander Vorwerk <alec@vc-celle.de>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com,
 gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: cdc: remove braces from single line if
 blocks
Message-ID: <20210830123010.682d59f5@jic23-huawei>
In-Reply-To: <20210820224914.1260-1-alec@vc-celle.de>
References: <20210820224914.1260-1-alec@vc-celle.de>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.30; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Aug 2021 00:49:14 +0200
Alexander Vorwerk <alec@vc-celle.de> wrote:

> Remove braces from single line if blocks to clear checkpatch warnings.
> WARNING: braces {} are not necessary for single statement blocks
> 
> Signed-off-by: Alexander Vorwerk <alec@vc-celle.de>
Applied. Thanks
> ---
>  drivers/staging/iio/cdc/ad7746.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> index 78ac720266e6..71c709771676 100644
> --- a/drivers/staging/iio/cdc/ad7746.c
> +++ b/drivers/staging/iio/cdc/ad7746.c
> @@ -241,10 +241,8 @@ static int ad7746_select_channel(struct iio_dev *indio_dev,
>  		if (ret < 0)
>  			return ret;
>  
> -		if (chip->capdac_set != chan->channel) {
> -
> +		if (chip->capdac_set != chan->channel)
>  			chip->capdac_set = chan->channel;
> -		}
>  		break;
>  	case IIO_VOLTAGE:
>  	case IIO_TEMP:

