Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C233ACA60
	for <linux-staging@lists.linux.dev>; Sun,  2 Aug 2026 15:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785684695; cv=none; b=VT1gYUX0dD8+XHL8tuhVU0NanP0Xdo8Kn7VLCVewLy1nNiPep75fMgEhDaS+HD3AyKye65F2gn/CVSRzj8Rs/fPrygbgwj29Qv12Hi6hv7LqDxa253FhFGbdAi5c8ZX+Pg1VG4IAzh3Pw93M4d73gXsTd/Uoy6nUDhX7OImBNkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785684695; c=relaxed/simple;
	bh=px8dE3bxwRZq5Tg8BoYdcga/Yvyq8YGWjYTGt0qUMgE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/g174VVQ4AYN9nSdntyunQr5vwyBtIWquNxjcW1OJz5ChJo4mpPFjnvc8MvhFBJ1R9eFDRB46eLEPnN0BsGJqcUvjS8DXAW3o0wf6SXtnkRaadFCj6mK+vUViG2oyKvmpDy7ZPnZ2Jd78upN0b6vwwhhq6r6Ef1Z0HhxmL2TEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=mytKVaqp; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="mytKVaqp"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-456395f4e7bso1841166fac.0
        for <linux-staging@lists.linux.dev>; Sun, 02 Aug 2026 08:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785684692; x=1786289492; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCFVPQGLGHHPRubIvlqdNztK/91BUJyCsT+AEegVq4Q=;
        b=mytKVaqpUv4zt7VJRKNVJdB25UbXfyUyyGZO5gMUAqpVtHNuVAXKZKOm7gx02KhpCN
         fST0tljT11e/pZfjAvMq3odcgVL+FKKJlO1VJT9vIyWRs+gL+7hfCZ9WDL7MsVcVoCy5
         oq1+adJKgjJikgUw9oGwczjkrY2Z7MvuCjM9KkkieF6H0Xm/HLPenZjKXTUeDYDuPUCi
         GV7YiELcwKSYG0NNkMyK6mOXtWtBFaej6+ADnL/yvlDGI/4KXF+pt/y6r4sp1XysObFV
         d8OHc+0iZjB26RJSVeq77FGBDdPm9tRpu4Ekr2eQ1Gedb1ckzG8l7zmj48NbPl7y2/Ib
         RtMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785684692; x=1786289492;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dCFVPQGLGHHPRubIvlqdNztK/91BUJyCsT+AEegVq4Q=;
        b=h96N7HrSX9tOlx+HeuSwPyTfUewfrYasTVMeGGCNpBUIfRA/D8k0dNJA2aPmtVpdqH
         4z5I3pmwU1DzptKjXhTtPE51xOOlU/BQ9qiGjFaNPqH63ueXBU136RIxJnRYF5QoUE98
         Cqsm8pvYQKPALHBOUU0DiWEHEOwpTJRl3m8SDUKRKTLa08N7KOP0jO3lRExCtPKVAArW
         IXjW1PU9i/tY3tK0Sbiome8OW/tIxWw08ziTjGZjBnNG5shRWzVe4J6dXIkTexCTTUmd
         CQk1M43fdxEswFcp13X4t1PhxF3P3/54QN1yuzhw/dWPXypkVA3M86Q3cbpKk4aWqsQF
         rxXg==
X-Forwarded-Encrypted: i=1; AHgh+Rpa1uBJB8T26Mr4XZMMoB0ESxBCc6Dpj0C83V24XoWihapJsKlBT+bvrPbhNVvbm3F7D56XEDRaGoVWpry/@lists.linux.dev
X-Gm-Message-State: AOJu0YxizQn1fPP1TRdYZtZkw9JK4Di34cxSHT9uUJKO1hOl0Sy38JAb
	GwjwS+LlOKrGL7b3cJUQnqbHasCMo0lg8ERyg+DlhkWqkXIvzn7SZh3kLK7aNKymm70=
X-Gm-Gg: AR+sD11HkRuZYruuX0Uvt3LTeBS08+K/fNjhGiIn+Q0HpifS71d2BGPALKvM4WnfqRV
	+CrY9LyewVYgWwnoS5sREy4QfvagPlFC8mh1as50cHfuk0HRko7z4+vk3acKojixX8dzYi3cPqo
	UskG+HCDr5KX2NrUwQVKvGoZIflHzAuRavX7G0818d8tiBMIL0TFPlOqFEqB0HlGUy2+7iijF0+
	/3+AZQcerVgDG8pFeRA5IBVEVYSxU99x4dNwTTIt3TLXiE85EcNnUCGkckdLUjWb+twoSLvgBXx
	dbYIAJg0gf+efAAItHc7cECoCjtMah1lmngwi6x1xACG0HSFPVEncm8EXr+Cr/wLwBPGct2iw0R
	r+xQf0SJhQd7dvIJmlFQhqBi9rinNyRAF7hHHne+8469/+c4mSgKO+6QJIk0KsXx/Mrhb6f2tXA
	YunElq2Qa4cv2oyhSmPQtDun4plV+DkEvlreUeQw72/PxttAi2R6yEN33Jy11JQgD/joSkCprHy
	kEnBB2MOFRT3+NKC7c7LtW0wkC+26KN8XmhbSk=
X-Received: by 2002:a05:6870:1256:b0:459:88c:12d0 with SMTP id 586e51a60fabf-459088c199dmr8364418fac.2.1785684692137;
        Sun, 02 Aug 2026 08:31:32 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:500:5487:2b6e:1057:d3d3? ([2600:8803:e7e4:500:5487:2b6e:1057:d3d3])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-458f66c1d89sm6362690fac.13.2026.08.02.08.31.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Aug 2026 08:31:31 -0700 (PDT)
Message-ID: <0bde2343-8a70-44d4-9b27-8ce42c099309@baylibre.com>
Date: Sun, 2 Aug 2026 10:31:29 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: iio: ad7816: avoid DMA from stack in spi_read
To: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>, nuno.sa@analog.com,
 Michael.Hennerich@analog.com, jic23@kernel.org, gregkh@linuxfoundation.org
Cc: andy@kernel.org, linux@analog.com, linux-iio@vger.kernel.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20260802113840.17730-1-abdelnasserhussein11@gmail.com>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <20260802113840.17730-1-abdelnasserhussein11@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 8/2/26 6:38 AM, Abdelnasser Hussein wrote:
> The SPI core may use DMA for transfers. Using a stack-allocated
> buffer for DMA is unsafe and can trigger faults when VMAP_STACK is
> enabled, since the stack is not guaranteed to be DMA-accessible.
> 
> Move the transfer buffer from the stack into the ad7816_chip_info
> structure so it has a stable lifetime suitable for DMA transfers.
> Mark the buffer with ____cacheline_aligned to ensure proper alignment
> for DMA operations.

Should also mention fixing the "wrong" sizeof() use in the spi_read()
call. It was the correct size, but the wrong variable was referenced.

> 

Probably deserves a Fixes: tag.

> Signed-off-by: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
> ---
>  drivers/staging/iio/adc/ad7816.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/iio/adc/ad7816.c b/drivers/staging/iio/adc/ad7816.c
> index 0e32a2295990..fcaadebff0f4 100644
> --- a/drivers/staging/iio/adc/ad7816.c
> +++ b/drivers/staging/iio/adc/ad7816.c
> @@ -50,6 +50,7 @@ struct ad7816_chip_info {
>  	u8  oti_data[AD7816_CS_MAX + 1];
>  	u8  channel_id;	/* 0 always be temperature */
>  	u8  mode;
> +	__be16 rx_buf ____cacheline_aligned;

In IIO, we have a special macro for this instead of `____cacheline_aligned`. 

__aligned(IIO_DMA_MINALIGN);

>  };
>  
>  enum ad7816_type {
> @@ -65,7 +66,6 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  {
>  	struct spi_device *spi_dev = chip->spi_dev;
>  	int ret;
> -	__be16 buf;
>  
>  	gpiod_set_value(chip->rdwr_pin, 1);
>  	gpiod_set_value(chip->rdwr_pin, 0);
> @@ -91,14 +91,12 @@ static int ad7816_spi_read(struct ad7816_chip_info *chip, u16 *data)
>  
>  	gpiod_set_value(chip->rdwr_pin, 0);
>  	gpiod_set_value(chip->rdwr_pin, 1);
> -	ret = spi_read(spi_dev, &buf, sizeof(*data));
> +	ret = spi_read(spi_dev, &chip->rx_buf, sizeof(chip->rx_buf));
>  	if (ret < 0) {
>  		dev_err(&spi_dev->dev, "SPI data read error\n");
>  		return ret;
>  	}
> -
> -	*data = be16_to_cpu(buf);
> -
> +	*data = be16_to_cpu(chip->rx_buf);
>  	return ret;
>  }
>  

