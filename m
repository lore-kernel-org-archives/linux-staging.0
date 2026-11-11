Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794379972;
	b=P2l976Ldt5c9nK9ltOT2I28XOev/48+YOnq8pLbb5Uiuex5FTO4xgKsKH2kQxlxme6nq
	 d9FG/8dwNUfFCOC+Vtbo8YKem908nT4/FHQ8VzGVs5+cn7fFA3+57A9TK4XoFd6gsqs26
	 Glzris+nMUWy/THxZ2CcrSWg3bffRwmokzkTeUvaYmQtadx+aVi/13qk9pVYpt0hWa4kf
	 Gcn7kgzaSNzUftDwBt1p9LKbcC2/SFP+HjCFNwjXsNTxO2eRaa6zURf7af8v48XcoSeVA
	 5N2btjHYLHQctfju9F5g3Qqn1pLHRUikuVG6C+79qFbYx1+uomJsSRxLUgwLdnvkHjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794379972;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HoW2S3qODYNFsPuLH7g4ByB0FMG1OvwPNnRs8ajNsfA=;
	b=fjfPIyuR3zEJXoqHbBCIboV++jWj9mxyo11WKIcWE29+9iO6rDGzHIr3T20lLLIXTbdz
	 ACQa8+ec8R/995cg3fPtP7hUjvsL4O0FU10lIwNAtiXAd8KK0i2x9TbGdWjnlNfg+zW8k
	 KkwETUKBdu97Jv/THm3Sxre7WURtXU9Wg7z4dSfyVHtq3Zs0UR78RVagkg2Mq56GFklYb
	 MNgx5ooqCg1i5Bya531P6M+rMYaNcfdXRHg3NBDXC2uA8rBb3tQbe7n4CbrHfukf024BE
	 03J9yJsI0pC/76wymqOeFJh2mtVlgL0Ytg+vvG5FQ4NeOSPN4SreFueX/bTQQEidPoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=cryspen.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8947C606A331
	for <linux-staging@lists.linux.dev>; Wed, 11 Nov 2026 06:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8947C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cryspen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so29824815e9.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Nov 2026 22:52:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794379970; x=1794984770;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HoW2S3qODYNFsPuLH7g4ByB0FMG1OvwPNnRs8ajNsfA=;
        b=1RcnoUQ1yZzG4m/flbwUlOACJGEx/tkntusQSiO66XnCVnqk8QgMttl9nL4I9lX+Xb
         atx9MhkemUS2QxuWt08/kGIQNTI2eYDZsxhibE1Q3gaPXUISCo+expZD/aY/argOIZpj
         BloPWpagY06iB+Ht4FPQ76FFJyitjfxHREm0czS48HbIOVuqZ6cleM5ilBYZZtNwEvhf
         rYhZkmRG2gyKn8dN1vGtmBIjVVteSZOLmQln/b0+JgWT4WDMxOFkVprR+yszt36BsHjI
         mGlRXDCPH2XUCd46JE2wjtjekTj8iAoB56KFTgCIR4a9THWgJ65C0A92VAHsQMm1ccEk
         erTA==
X-Forwarded-Encrypted: i=1; AL+hErEF3/gOLvKN4MIKwjTA0Le11XleVg1SG6EPLnP9gUI+XFFLPYh5NDAEr5INfPb8S8njx1CWA3PglivQq2U0@lists.linux.dev
X-Gm-Message-State: APuU4Z/idB5UBhKxTmGKLGRmi1x8SWxKJDwlmUdmnMu34gfCFb1F5XW+
	YEsuEItIgQHD7RkZUKIujayXnyQZC33+S80x1zNr3cUiHSqgNt/OzoDc
X-Gm-Gg: AYBFou1Qp4VEL6Zs6YXQnw3EI9zvAOpgG+E83azElapK90n8/2Tmg+HLg6MTgw/9IZc
	ScOO93vBKor5JLJFp8Pl+HtQ9l0tY1vqUgiclvhcuTM8O6XwYIZeMQoexRKor/g0AR8EWoEzagm
	0cmnZavvGKp5CTzOfNa6Z5IBxf+wxa+DeOTC8xJ1d53sq08jmrPoLqkwgPCKRSbVt+ni9+l1t3k
	G3qlysohe34GTXd4qwI3lI3M6vR3nLt54auNzeF5edKMZ2GbsHC2m4Oan3pDBhdlSoLlanwKrLM
	HCpBWzBpGWxpnufCqi2YaY3SGDo9MyeYHxmL+WiRew6/jAsE3pT3al5+0rM28PO5P+blQohjM0x
	EsYS/tdIVmAR6uQZsYTrs1103Uhoheo2yz1ixQLzpolOvaoAsiJCbr7941rldxMOCL0qE5eBK48
	hpjkD/tJKLHQ8LdBm6KnkpVoKS96aHAxloGGSKr1lODNiHmFKLSS5/D+/fvE/VGS/i62c318Olv
	GxEq6H7g2nD+UMIQyAJ9pCuXI0A2JxNS5DT2xPZqKNksKjoqNRU9Qx4Fk0Tnot95jSWkpBbs3Rb
	lfKgqE+wW2RCabrvNlteg8mDv+T3F3aDSLx/8olRBM/1wjGc4WqH4FTHFYrDU0UFU22eEfMb30t
	sAZ6tETtdutyeG8Pq7/Vaj2LgZUYimPse8tv3YZo5uaxOvdXjWG3p+rCfq3BxTNV9
X-Received: by 2002:a05:600c:a00d:b0:4a2:1a:a129 with SMTP id 5b1f17b1804b1-4ba093b7ffcmr22597675e9.35.1794379969657;
        Tue, 10 Nov 2026 22:52:49 -0800 (PST)
Received: from localhost ([2c0f:3d00:6be:8900:ce5e:9212:ea4b:f30])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0203a763sm116775375e9.4.2026.11.10.22.52.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 22:52:48 -0800 (PST)
Date: Wed, 11 Nov 2026 09:52:44 +0300
From: Dan Carpenter <dan@cryspen.com>
To: Nithishvelan M <mnithishvelan@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>, linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: frequency: ad9832: use guard(mutex)
Message-ID: <avQQvHuDsW8XTfgj@stanley.mountain>
References: <20261110164711.552-1-mnithishvelan@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110164711.552-1-mnithishvelan@gmail.com>

On Tue, Nov 10, 2026 at 04:47:11PM +0000, Nithishvelan M wrote:
> Use guard(mutex) to automatically manage the state lock in
> ad9832_write(). This simplifies error handling by allowing direct
> returns from each switch case and error branch, eliminating the
> manual mutex_unlock() calls and the goto error label.
> 
> Signed-off-by: Nithishvelan M <mnithishvelan@gmail.com>
> ---
>  drivers/staging/iio/frequency/ad9832.c | 47 +++++++++++++++++---------
>  1 file changed, 31 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/staging/iio/frequency/ad9832.c b/drivers/staging/iio/frequency/ad9832.c
> index 35f823f24..227dcd739 100644
> --- a/drivers/staging/iio/frequency/ad9832.c
> +++ b/drivers/staging/iio/frequency/ad9832.c
> @@ -8,6 +8,7 @@
>  #include <linux/array_size.h>
>  #include <linux/bitfield.h>
>  #include <linux/bitops.h>
> +#include <linux/cleanup.h>
>  #include <linux/clk.h>
>  #include <linux/dev_printk.h>
>  #include <linux/err.h>
> @@ -188,52 +189,65 @@ static ssize_t ad9832_write(struct device *dev, struct device_attribute *attr,
>  
>  	ret = kstrtoul(buf, 10, &val);
>  	if (ret)
> -		goto error_ret;
> +		return ret;
> +
> +	guard(mutex)(&st->lock);
>  
> -	mutex_lock(&st->lock);
>  	switch ((u32)this_attr->address) {
>  	case AD9832_FREQ0HM:
>  	case AD9832_FREQ1HM:
>  		ret = ad9832_write_frequency(st, this_attr->address, val);
> +		if (ret)
> +			return ret;
> +
>  		break;
>  	case AD9832_PHASE0H:
>  	case AD9832_PHASE1H:
>  	case AD9832_PHASE2H:
>  	case AD9832_PHASE3H:
>  		ret = ad9832_write_phase(st, this_attr->address, val);
> +		if (ret)
> +			return ret;
> +
>  		break;
>  	case AD9832_PINCTRL_EN:
>  		st->ctrl_ss &= ~AD9832_SELSRC;
>  		st->ctrl_ss |= FIELD_PREP(AD9832_SELSRC, val ? 0 : 1);
>  
>  		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
> -						  st->ctrl_ss);
> +				       st->ctrl_ss);

Please don't make these sorts of unrelated white space changes.  They
just make the review more complicated.

regards,
dan carpenter

