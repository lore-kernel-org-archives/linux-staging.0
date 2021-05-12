Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDDE470
	for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 07:45:13 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id c22so25894911edn.7
        for <linux-staging@lists.linux.dev>; Wed, 12 May 2021 00:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=WqKbFi1zcT06ocFbBAnAZcAvyy09Fxb57wc82froFIk=;
        b=t6VE6y+eXUA0deIf7OOmOlR9KMXybIqSnMCv9l6s/HwvHP1i6v5lRKB9NW8QZZFPPY
         zPYAIAGOaEoQIwRPlB861nJ8EmP+Vqyn55U49PPVYDSzDfoFW5bNibMSQ0UTo8eyVlbz
         GGchffGgDQKXQr7tOma+86+kMFiRVIG7HNc5DBD5woNdZ71DR7eHPyh4JaqT7wVlTzZq
         7apDiU8VgC3OxX3Lqwv30GcpqAtnNGXHbGzdiOO0Nu/TTEpbgfWl67gHVpWTu1sr2/YR
         F6RvSynr3ce6pN40lgdN3oKse0Dw0+V0h+gcBAmm/sObkJZdaUEn1k2q4hYPC+ut9uLb
         FV9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WqKbFi1zcT06ocFbBAnAZcAvyy09Fxb57wc82froFIk=;
        b=Op0WFHHXZcdpmDS3hMGCGAS9d2yJY0upIX9wX0KltepvHuSEdsFtZL7UG99+EQgMGo
         Hu+aaGiTWFooqFZ7cmImgJrk1yvFwov8joIsbkqRZiqPViyQzIVpSaQuVxgpVZMX7Eo2
         is38WIR6fCz1BLyf5/wict0NRmdRjvviPxW06Xl8M93qvY7wa5hY7AvpM20CRJyfbw5L
         NyOgw66EUC0vVLs0AvJa8X8mabEQ601UQ1Lr6eAs9mn1EGBsnUx6dmuwyWte/R9KBH5+
         CR4Fap9+t6S1MdYHUGJqvxGZXF1ESoi3H6B99dDSAD2ZWjwkFbajAyUdv+iNNuIdst2P
         bQ5g==
X-Gm-Message-State: AOAM532uUXyYAX+1OFPjhNYRnq1uCipvNIQ+iuBzugqkeAMvc9ds5xn9
	oUqBPChnGzC5l5RTW37QBuI=
X-Google-Smtp-Source: ABdhPJxR8SXu0XSUhDZsOCyAn0XAtiue+uZX2UQBu9BohSYTysGTeFAPxIsKoOX3+a4KV5/je/odEg==
X-Received: by 2002:aa7:d3c2:: with SMTP id o2mr41640429edr.111.1620805512335;
        Wed, 12 May 2021 00:45:12 -0700 (PDT)
Received: from agape.jhs ([5.171.80.141])
        by smtp.gmail.com with ESMTPSA id y8sm4729219edo.90.2021.05.12.00.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 May 2021 00:45:12 -0700 (PDT)
Date: Wed, 12 May 2021 09:45:09 +0200
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: Lucas Stankus <lucas.p.stankus@gmail.com>
Cc: lars@metafoo.de, Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: iio: cdc: ad7746: clean up driver comments
 and probe return
Message-ID: <20210512074508.GB1413@agape.jhs>
References: <cover.1620766020.git.lucas.p.stankus@gmail.com>
 <687a1923add71303da13e3a838e97a6ffc7dcda7.1620766020.git.lucas.p.stankus@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <687a1923add71303da13e3a838e97a6ffc7dcda7.1620766020.git.lucas.p.stankus@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

Hi Lucas,

On Tue, May 11, 2021 at 05:54:01PM -0300, Lucas Stankus wrote:
> Remove vague comments, align temperature comment with indent block and
> simplify probe return on device register.
> 
> Also fix the following checkpatch warning:
> CHECK: Alignment should match open parenthesis
> 
> Signed-off-by: Lucas Stankus <lucas.p.stankus@gmail.com>
> ---
>  drivers/staging/iio/cdc/ad7746.c | 31 ++++++++++---------------------
>  1 file changed, 10 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/staging/iio/cdc/ad7746.c b/drivers/staging/iio/cdc/ad7746.c
> index dfd71e99e872..e03d010b2f4c 100644
> --- a/drivers/staging/iio/cdc/ad7746.c
> +++ b/drivers/staging/iio/cdc/ad7746.c
> @@ -84,10 +84,6 @@
>  #define AD7746_CAPDAC_DACEN		BIT(7)
>  #define AD7746_CAPDAC_DACP(x)		((x) & 0x7F)
>  
> -/*
> - * struct ad7746_chip_info - chip specific information
> - */
> -

Comment deletions should go in a separate patch


>  struct ad7746_chip_info {
>  	struct i2c_client *client;
>  	struct mutex lock; /* protect sensor state */
> @@ -232,13 +228,14 @@ static int ad7746_select_channel(struct iio_dev *indio_dev,
>  
>  		if (chip->capdac_set != chan->channel) {
>  			ret = i2c_smbus_write_byte_data(chip->client,
> -				AD7746_REG_CAPDACA,
> -				chip->capdac[chan->channel][0]);
> +							AD7746_REG_CAPDACA,
> +							chip->capdac[chan->channel][0]);
>  			if (ret < 0)
>  				return ret;
> +
>  			ret = i2c_smbus_write_byte_data(chip->client,
> -				AD7746_REG_CAPDACB,
> -				chip->capdac[chan->channel][1]);
> +							AD7746_REG_CAPDACB,
> +							chip->capdac[chan->channel][1]);
>  			if (ret < 0)
>  				return ret;

Alignments of function argument form a different logical change
and should go on a separate patch...
 
>  
> @@ -564,10 +561,10 @@ static int ad7746_read_raw(struct iio_dev *indio_dev,
>  
>  		switch (chan->type) {
>  		case IIO_TEMP:
> -		/*
> -		 * temperature in milli degrees Celsius
> -		 * T = ((*val / 2048) - 4096) * 1000
> -		 */
> +			/*
> +			 * temperature in milli degrees Celsius
> +			 * T = ((*val / 2048) - 4096) * 1000
> +			 */
>  			*val = (*val * 125) / 256;
>  			break;
>  		case IIO_VOLTAGE:
> @@ -669,10 +666,6 @@ static const struct iio_info ad7746_info = {
>  	.write_raw = ad7746_write_raw,
>  };
>  
> -/*
> - * device probe and remove
> - */
> -
>  static int ad7746_probe(struct i2c_client *client,
>  			const struct i2c_device_id *id)
>  {
> @@ -730,11 +723,7 @@ static int ad7746_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> -	ret = devm_iio_device_register(indio_dev->dev.parent, indio_dev);
> -	if (ret)
> -		return ret;
> -
> -	return 0;
> +	return devm_iio_device_register(indio_dev->dev.parent, indio_dev);
>  }

this return value fix should go in a separate patch

>  
>  static const struct i2c_device_id ad7746_id[] = {
> -- 
> 2.31.1
> 
> 

so, in my opinion, this patch could be split
in three different patches.

Thank you,

fabio
