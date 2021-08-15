Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B2652FAD
	for <linux-staging@lists.linux.dev>; Sun, 15 Aug 2021 06:25:55 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id EFA716103A;
	Sun, 15 Aug 2021 06:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1629008754;
	bh=8WgvM8M26oXRN4vw+Mt7hS5lSyYMjCSVo0s4LtoabEM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pq5hMcRQjpEiOkegtUosI+prQg3jdqGJ3o+6wh3SJ7FOvtWgbGrGnUGMLjkWMlV7d
	 7UbYtLGv5+PCeOXE8od97iS9Hw5BNkVPimXmtmPnAD7IZXEtbZaay0eBigfeFInE5w
	 yRKWYFcBZZ+3qP6KZMdAWR8QO47lcAZd+iRWytUI=
Date: Sun, 15 Aug 2021 08:25:51 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: daniel watson <ozzloy@challenge-bot.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging:iio:ade7854 surround complex defines in
 parentheses
Message-ID: <YRizb/FGfYpGbpJy@kroah.com>
References: <20210815023115.13016-1-ozzloy@challenge-bot.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210815023115.13016-1-ozzloy@challenge-bot.com>

On Sat, Aug 14, 2021 at 07:31:15PM -0700, daniel watson wrote:
> Error found by checkpatch.pl

What error?

> 
> Signed-off-by: daniel watson <ozzloy@challenge-bot.com>

Capitalize your name?

> ---
>  drivers/staging/iio/meter/ade7854.h | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/meter/ade7854.h b/drivers/staging/iio/meter/ade7854.h
> index a51e6e3183d38..afb13e21002e1 100644
> --- a/drivers/staging/iio/meter/ade7854.h
> +++ b/drivers/staging/iio/meter/ade7854.h
> @@ -139,9 +139,9 @@
>  #define ADE7854_MAX_RX    7
>  #define ADE7854_STARTUP_DELAY 1000
>  
> -#define ADE7854_SPI_SLOW	(u32)(300 * 1000)
> -#define ADE7854_SPI_BURST	(u32)(1000 * 1000)
> -#define ADE7854_SPI_FAST	(u32)(2000 * 1000)
> +#define ADE7854_SPI_SLOW	((u32)(300 * 1000))
> +#define ADE7854_SPI_BURST	((u32)(1000 * 1000))
> +#define ADE7854_SPI_FAST	((u32)(2000 * 1000))

This is not a real change that is needed, just look at the code to
verify that.

thanks,

greg k-h
