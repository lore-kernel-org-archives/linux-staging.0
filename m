Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7131F10EA;
	Mon, 17 Oct 2022 07:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=VzQrMMvzjPHT9RHQrUI87UWNSeZiKrWFFhJbruuzBRU=;
  b=isnKd3o5Oec+fN+nd4RCeiAMAC4g2e8wgL3ryaYwPEd5IBJjYoHuLcYz
   TMi9yHjFz558ZU32ZV3yXZ/r7ozIAuO6WtTnvDA+UA6A6k0m3Nkl4YM3L
   wA9+uzxeBMLLi8UkruoRPiC6l9tcCd61gqsBk5JNZd3qt6kjng2wLM806
   U=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="5.95,190,1661810400"; 
   d="scan'208";a="65427058"
Received: from 51.123.68.85.rev.sfr.net (HELO hadrien) ([85.68.123.51])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2022 09:10:16 +0200
Date: Mon, 17 Oct 2022 09:10:15 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Deepak R Varma <drv@mailo.com>
cc: outreachy@lists.linux.dev, lars@metafoo.de, Michael.Hennerich@analog.com, 
    jic23@kernel.org, gregkh@linuxfoundation.org, linux-iio@vger.kernel.org, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
    kumarpraveen@linux.microsoft.com, saurabh.truth@gmail.com
Subject: Re: [PATCH] staging: iio: frequency: ad9834: merge unnecessary split
 lines
In-Reply-To: <Y0z2/qFe3kW96MTs@debian-BULLSEYE-live-builder-AMD64>
Message-ID: <alpine.DEB.2.22.394.2210170909430.2965@hadrien>
References: <Y0z2/qFe3kW96MTs@debian-BULLSEYE-live-builder-AMD64>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Mon, 17 Oct 2022, Deepak R Varma wrote:

> Improve code readability by merging unnecessary split lines that are
> well within the code-style guidelines post merge.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>

Acked-by: Julia Lawall <julia.lawall@inria.fr>

> ---
>  drivers/staging/iio/frequency/ad9834.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/iio/frequency/ad9834.c b/drivers/staging/iio/frequency/ad9834.c
> index 2b4267a87e65..285df0e489a6 100644
> --- a/drivers/staging/iio/frequency/ad9834.c
> +++ b/drivers/staging/iio/frequency/ad9834.c
> @@ -331,11 +331,9 @@ static IIO_DEV_ATTR_PHASE(0, 1, 0200, NULL, ad9834_write, AD9834_REG_PHASE1);
>  static IIO_DEV_ATTR_PHASESYMBOL(0, 0200, NULL, ad9834_write, AD9834_PSEL);
>  static IIO_CONST_ATTR_PHASE_SCALE(0, "0.0015339808"); /* 2PI/2^12 rad*/
>
> -static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL,
> -	ad9834_write, AD9834_PIN_SW);
> +static IIO_DEV_ATTR_PINCONTROL_EN(0, 0200, NULL, ad9834_write, AD9834_PIN_SW);
>  static IIO_DEV_ATTR_OUT_ENABLE(0, 0200, NULL, ad9834_write, AD9834_RESET);
> -static IIO_DEV_ATTR_OUTY_ENABLE(0, 1, 0200, NULL,
> -	ad9834_write, AD9834_OPBITEN);
> +static IIO_DEV_ATTR_OUTY_ENABLE(0, 1, 0200, NULL, ad9834_write, AD9834_OPBITEN);
>  static IIO_DEV_ATTR_OUT_WAVETYPE(0, 0, ad9834_store_wavetype, 0);
>  static IIO_DEV_ATTR_OUT_WAVETYPE(0, 1, ad9834_store_wavetype, 1);
>
> --
> 2.30.2
>
>
>
>
>
