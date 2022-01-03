Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F071173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 13:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4672C36AED;
	Mon,  3 Jan 2022 13:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1641216433;
	bh=PpQx6eti7nVwiIomqk4nOnFMIbkqlsG04q9WYy3lGSE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TIQklZ4hsToWvVR1jeBVLxJv7XBBtjMqZ++hbjwPD/ozNNqfdA6xO553/7B7LJNAH
	 3UyHGvv3g5+cm9qsPNOe5dRtUpAeo/mUur7pvEyn2VkFG5dB70DHx94wPV8PuCKI7q
	 /btiXPxc4xIZ34oYtk7LjUm6K4QrJkSdbkO7pKgM=
Date: Mon, 3 Jan 2022 14:27:10 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
Cc: realwakka@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: pi433: fix frequency deviation check
Message-ID: <YdL5rtWw2PTXdsRM@kroah.com>
References: <20220103081135.GA11642@mail.google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220103081135.GA11642@mail.google.com>

On Mon, Jan 03, 2022 at 09:11:35PM +1300, Paulo Miguel Almeida wrote:
> rf69 datasheet states that frequency deviation must exceed 600 Hz but
> also that frequency deviation + (bitrate / 2) should be less than equal
> to 500 kHz to ensure proper modulation.
> 
> This patch validates that both conditions are met so RF intersymbol
> interference is "avoided" where possible.
> 
> Signed-off-by: Paulo Miguel Almeida <paulo.miguel.almeida.rodenas@gmail.com>
> ---
>  drivers/staging/pi433/rf69.c | 20 ++++++++++++++++----
>  1 file changed, 16 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/pi433/rf69.c b/drivers/staging/pi433/rf69.c
> index e62e61ef4d27..cc22915fd489 100644
> --- a/drivers/staging/pi433/rf69.c
> +++ b/drivers/staging/pi433/rf69.c
> @@ -255,17 +255,29 @@ int rf69_set_deviation(struct spi_device *spi, u32 deviation)
>  	int retval;
>  	u64 f_reg;
>  	u64 f_step;
> +	u32 bit_rate_reg;
> +	u32 bit_rate;
>  	u8 msb;
>  	u8 lsb;
>  	u64 factor = 1000000; // to improve precision of calculation
>  
> -	// TODO: Dependency to bitrate
> -	if (deviation < 600 || deviation > 500000) {
> -		dev_dbg(&spi->dev, "set_deviation: illegal input param");
> +	// calculate bit rate
> +	bit_rate_reg = rf69_read_reg(spi, REG_BITRATE_MSB) << 8;
> +	bit_rate_reg |= rf69_read_reg(spi, REG_BITRATE_LSB);
> +	bit_rate = F_OSC / bit_rate_reg;
> +
> +	/*
> +	 * frequency deviation must exceed 600 Hz and but not exceed
> +	 * 500kHz when taking bitrate dependency into consideration
> +	 * to ensure proper modulation
> +	 */
> +	if (deviation < 600 || (deviation + (bit_rate / 2)) > 500000) {
> +		dev_dbg(&spi->dev,
> +			"set_deviation: illegal input param: %u", deviation);
>  		return -EINVAL;
>  	}
>  
> -	// calculat f step
> +	// calculate f step

This change should be a separate patch.

thanks,

greg k-h
