Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E8B08BE1
	for <linux-staging@lists.linux.dev>; Tue,  8 Nov 2022 15:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F0A4C433D6;
	Tue,  8 Nov 2022 15:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1667920341;
	bh=dY6YcVEKd8/kTJ0bxrcHw4OlBXje9C80yhXhEcnFW7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nv6VmbiwMcOdoVuhP5Uf/6AWhaG3U/FMGv3WOoIuv6kXMukzQzotu69aIFPIfDI1L
	 Xry70c5bCNViipvtbaOA4VIhYGHxEXhROppgaswjmi2BZY4+KOnb0gMvL+pamUQZa6
	 FgDJu6Tj16AWP6EJKDz6R9cQgpRC3Bmh8iK6zwXs=
Date: Tue, 8 Nov 2022 16:12:17 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Deepak R Varma <drv@mailo.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
Message-ID: <Y2px0THYSMaU4gyZ@kroah.com>
References: <Y2iFGA3A1w+XMlYU@qemulion>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y2iFGA3A1w+XMlYU@qemulion>

On Mon, Nov 07, 2022 at 09:40:00AM +0530, Deepak R Varma wrote:
> Simplify code by using recommended min helper macro for logical
> evaluation and value assignment. This issue is identified by
> coccicheck using the minmax.cocci file.
> 
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/iio/meter/ade7854-i2c.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/iio/meter/ade7854-i2c.c b/drivers/staging/iio/meter/ade7854-i2c.c
> index a9a06e8dda51..a6ce7b24cc8f 100644
> --- a/drivers/staging/iio/meter/ade7854-i2c.c
> +++ b/drivers/staging/iio/meter/ade7854-i2c.c
> @@ -61,7 +61,7 @@ static int ade7854_i2c_write_reg(struct device *dev,
>  unlock:
>  	mutex_unlock(&st->buf_lock);
> 
> -	return ret < 0 ? ret : 0;
> +	return min(ret, 0);

As others have said, this isn't ok, and I hate ? : usage, so if you
want, spell that out please.

thanks,

greg k-h
