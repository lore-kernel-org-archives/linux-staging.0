Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B09DE1C03
	for <linux-staging@lists.linux.dev>; Tue, 22 Nov 2022 12:22:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF703C433C1;
	Tue, 22 Nov 2022 12:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1669119762;
	bh=1RsX6ENFcjBr8IB+4mVrBxY3lKXrZ7Oluu3EWhp/OTY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xekBgBAyNYNYAbCEwTr7Omvw1WA3yMh74q4QqUkO72G+lL3dMLrqZtdSA7TBVdBBv
	 cTRB2IDnvqSew/Gn2vNdnTSwrxhckZN/aNWq7wjZ7OnzQrHpsQU9L1TazIE0AUiXjf
	 HmXarVwyDfAO+hOIydeGMpekwLeHF3x6lvgrJeQI=
Date: Tue, 22 Nov 2022 13:22:39 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <uwe@kleine-koenig.org>
Cc: Angel Iglesias <ang.iglesiasg@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Grant Likely <grant.likely@linaro.org>,
	Wolfram Sang <wsa@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-i2c@vger.kernel.org,
	kernel@pengutronix.de,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 567/606] staging: iio: ad5933: Convert to i2c's
 .probe_new()
Message-ID: <Y3y/DxNp+cYu7GTH@kroah.com>
References: <20221118224540.619276-1-uwe@kleine-koenig.org>
 <20221118224540.619276-568-uwe@kleine-koenig.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221118224540.619276-568-uwe@kleine-koenig.org>

On Fri, Nov 18, 2022 at 11:45:01PM +0100, Uwe Kleine-König wrote:
> From: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> .probe_new() doesn't get the i2c_device_id * parameter, so determine
> that explicitly in the probe function.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/staging/iio/impedance-analyzer/ad5933.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/iio/impedance-analyzer/ad5933.c b/drivers/staging/iio/impedance-analyzer/ad5933.c
> index f177b20f0f2d..b3152f7153fb 100644
> --- a/drivers/staging/iio/impedance-analyzer/ad5933.c
> +++ b/drivers/staging/iio/impedance-analyzer/ad5933.c
> @@ -674,9 +674,9 @@ static void ad5933_clk_disable(void *data)
>  	clk_disable_unprepare(st->mclk);
>  }
>  
> -static int ad5933_probe(struct i2c_client *client,
> -			const struct i2c_device_id *id)
> +static int ad5933_probe(struct i2c_client *client)
>  {
> +	const struct i2c_device_id *id = i2c_client_get_device_id(client);

Breaks the build in my tree as this function is not in Linus's tree yet
:(

