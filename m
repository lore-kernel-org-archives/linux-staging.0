Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8B042EBB90
	for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 14:32:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766068349; cv=none; b=jngqru5hRbNtM2/aLF19+UAQ3BfcG5WMOA1ttKgy8NwLBVBVz6LRgs/yQfY6B9BbbDbc6ZUwNRRxjANzLKKVmeYJdxswL0O6xgRI4zt6A8uJdPdxuYfLRYUnAi1iwYPRs4DQFfnVSz3r7NC1XxNrdNonKexVziqyd7T9IQqo+1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766068349; c=relaxed/simple;
	bh=Cb/71YS+zrQfEMvosFYVR7Y9Zej5gzKcHCRwliPZjuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GpciE1XYr4il2xnEU78Q/r3HZj/VYZ3wwCx45gioQ5DFVmXjM781d9nXRB2BrhbbcYlvotftS9+00V1scAn/zbt7CskYE4vhtinhrNwmoc2j7HKCKxOnOfLEEdQG7Lta1mccB91dpHobYSQCIHpBaa3WaeiDtKjxZLW/KbLzM0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A4/2rJ/Y; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A4/2rJ/Y"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-11beb0a7bd6so2464353c88.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Dec 2025 06:32:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766068346; x=1766673146; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UvDcrFjKqx1o4PXZRW4U7Cuz0Pc+gSxTVB1ooliuvtg=;
        b=A4/2rJ/Yl3zRG9G/eCWhkYrD+I52I1PC5XC89HYoe0hQ1hqCfBe6OugJZNAcmr+DX3
         FeyHA9OtZJBhc7MMu50Y9uJQe69tORw+gjmNZkt9pmlBgcVRzi5JPYP7EID84b8aEv+k
         5JGtdGyut2YnAJ1ua4yC3XbcbFyYOwuiiq21tUVQAYOMRSYyzk6UxI45fseX/b/HY5Ir
         EXblytzyJeCpZ1GgAqElD4hRIFpYRBF9XXsg2FNga4J5YZW+OKEDKKW5A6af1rgVMzz2
         8xGD1t0TiucuRo3+aCDKp0Ua0YkxYi7/XUc1Z+ioLVqX7cIIr3UeXztKIZp0BhzNh4Nt
         up+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766068346; x=1766673146;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UvDcrFjKqx1o4PXZRW4U7Cuz0Pc+gSxTVB1ooliuvtg=;
        b=insd1DBLEmZzRxg6i2EFEzHEdr6JLAto1pekaIsksUP1b3UawE6JCe0IHrXqdEhjum
         mQSHrqyNh6VgxYr9WdF5OIY6Ex1+fBbkJB0JtbYmo030PLSXlj19Y0Q/US6YodM4PMcj
         CTK0zHZFUpH/VHa2oFXYkGcQJSIdt5Xuhek6t2On76BJTby/cJ6xB3SAvVAQwhYSqK8s
         fu8+C2c9PBpijMo6WaiPth0zHmmJcRhfc6yWm2j/tSKDkDtBeWe6llXm5eH7KP3DE+c+
         rnC15WJsj8tzi969AqwQlv2896ETyUHxAOIwi40hdU3tu5i8inEwhioqqNW71DgDK/zW
         vUuA==
X-Forwarded-Encrypted: i=1; AJvYcCVVg1F6dPhjBAnDEPxx0HLP195oU2DLZUSgdkOA7teM5TN+/f0vI/4vpKR/auDt4tHFIYXEuGGSf2M1QMlG@lists.linux.dev
X-Gm-Message-State: AOJu0YyasFO5Ja2pxmm/IqfpTbsvphr+ReJEjzcJykvvWmiIZlGEIrfu
	AuulhBgqAzDbKcKPvbroYYrKqxMJ6pSWBkO+Jqgjm3us56qckdy6lQYs
X-Gm-Gg: AY/fxX4nOJVMqZkBtInQr7jQYprsFvPc6xeKdcUJE6mpXY1ONptKZpHmUiilbvBBfnG
	4jNNXQFH+Z49vxS9QtFlSheJK7YhmbX0Agk7rbDcYv9UKO+CXgiDF7nJAhR8As2ombxWRg7Bn8J
	DSL9GF1CXzXXAF6XvwIZMMARkQUm502dBgtzkf0pk3r52uYtoFjH4YRTsN9jAKfkrxADO9hNwvR
	JDcuA9OAf8PCPORr4f2/TnefvIHc0SQ6kODthbEwVNE7rkgk2i36Lk5oDXcKQERG3QKe1/WRc61
	M2fkTJMRQlyJj+HFHKqAvUVkTFEtwTKaZn0nvXCfkmWtsNQcATQ8e7KTQGdmv5Wlbl2Q9ps1W6h
	vya7F9lJ8sCWIDmg1GCPk1jPE5BkQIqOKI23oAOOA+lKVgNU2B7zemCln3UBiDCfwYE9NQZKqCw
	4omdFxm0OGb5LLG2HydKI=
X-Google-Smtp-Source: AGHT+IEGiOxHUxgqdOuBq8/4oIw+szluf8LA+aSM9huLM9xPzII7hyKBR3G2CZLyEFFsfc2z9Pli5g==
X-Received: by 2002:a05:7022:4091:b0:119:e569:f850 with SMTP id a92af1059eb24-12061939389mr2133231c88.7.1766068345623;
        Thu, 18 Dec 2025 06:32:25 -0800 (PST)
Received: from localhost ([2804:30c:165b:7000:d59:b973:da75:f845])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fc5613sm7890150c88.11.2025.12.18.06.32.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 06:32:24 -0800 (PST)
Date: Thu, 18 Dec 2025 11:34:05 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Borquez <tomasborquez13@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/5] staging: iio: ad9832: convert to guard(mutex)
Message-ID: <aUQQ3YnaZau2RO2d@debian-BULLSEYE-live-builder-AMD64>
References: <20251215190806.11003-1-tomasborquez13@gmail.com>
 <20251215190806.11003-3-tomasborquez13@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251215190806.11003-3-tomasborquez13@gmail.com>

On 12/15, Tomas Borquez wrote:
> Use guard(mutex) for cleaner lock handling and simpler error paths.
> 
> Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 28 +++++++++++---------------
>  1 file changed, 12 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 00813dab7c..f9ef3aede4 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -9,6 +9,7 @@
>  
...
> -	mutex_lock(&st->lock);
> +	guard(mutex)(&st->lock);
>  	switch ((u32)this_attr->address) {
>  	case AD9832_FREQ0HM:
>  	case AD9832_FREQ1HM:
> @@ -203,22 +205,18 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
>  	case AD9832_FREQ_SYM:
> -		if (val == 1 || val == 0) {
> -			st->ctrl_fp &= ~AD9832_FREQ;
> -			st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
> -		} else {
> -			ret = -EINVAL;
> -			break;
> -		}
> +		if (val != 1 && val != 0)
> +			return -EINVAL;
> +
> +		st->ctrl_fp &= ~AD9832_FREQ;
> +		st->ctrl_fp |= FIELD_PREP(AD9832_FREQ, val ? 1 : 0);
>  		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  						  st->ctrl_fp);
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
Since we now have the mutex unlock handled by guard, why not returning directly
from each case?
E.g.
	case AD9832_FREQ1HM:
-		ret = ad9832_write_frequency(st, this_attr->address, val);
-		break;
+		return ad9832_write_frequency(st, this_attr->address, val);
I think the last return (outside the default clause) won't be needed anymore.


And, since you are touching the lock, you may also update to use
devm_mutex_init() (that would probably be best appreciated as a separate patch).

>  	case AD9832_PHASE_SYM:
> -		if (val > 3) {
> -			ret = -EINVAL;
> -			break;
> -		}
> +		if (val > 3)
> +			return -EINVAL;
