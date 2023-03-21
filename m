Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0F4C1FA0;
	Tue, 21 Mar 2023 06:11:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 271B9C433EF;
	Tue, 21 Mar 2023 06:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1679379085;
	bh=e4KeP0Jj7jEFEhtwLwBd8yfk3eg3gh5xp+hcXYcRwSM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eoUwQhhZKlSolub/ogaCXgnXRBYiwRRznkjZeFV+CMShgY434FPdOLIJL30DEZGS9
	 h9FMmZDHa/l/vyxc4u+VSzWDfORy3nZCwEJ8e7T+Cr8b0o6HNMHRfpHLWbm5pC8PSG
	 a+IsN7Qvt8ugJc+B7PAWGDw/v/Bx19omvTsKXLf4=
Date: Tue, 21 Mar 2023 07:11:22 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Khadija Kamran <kamrankhadijadj@gmail.com>
Cc: outreachy@lists.linux.dev, Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: remove camel case
Message-ID: <ZBlKijo6zLsE8jUx@kroah.com>
References: <ZBiPlhkqHUegMRAb@khadija-virtual-machine>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZBiPlhkqHUegMRAb@khadija-virtual-machine>

On Mon, Mar 20, 2023 at 09:53:42PM +0500, Khadija Kamran wrote:
> Several variables and functions were named Camel Case. This resulted in
> checks pointed by checkpatch.pl
> 
> Avoid camel case by changing names.
> 
> Signed-off-by: Khadija Kamran <kamrankhadijadj@gmail.com>
> ---
>  drivers/staging/iio/addac/adt7316.c | 64 ++++++++++++++---------------

This has nothing to do with "greybus" :(

>  1 file changed, 32 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/staging/iio/addac/adt7316.c b/drivers/staging/iio/addac/adt7316.c
> index 79467f056a05..49702beeac30 100644
> --- a/drivers/staging/iio/addac/adt7316.c
> +++ b/drivers/staging/iio/addac/adt7316.c
> @@ -672,7 +672,7 @@ static IIO_DEVICE_ATTR(da_high_resolution, 0644,
>  		adt7316_store_da_high_resolution,
>  		0);
> 
> -static ssize_t adt7316_show_AIN_internal_Vref(struct device *dev,
> +static ssize_t adt7316_show_AIN_internal_vref(struct device *dev,

"Vref" is correct, please keep it as is.

thanks,

greg k-h
