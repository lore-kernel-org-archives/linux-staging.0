Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734D0145B25
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 18:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744567706; cv=none; b=tvy3yxYG2yZjyf0Gk8WR0qvRMqUCNfAsGtc9gA87XoUKcYNfp/ANufRQpDrlCRBmvfl1+LrsxAlNTzntyIYYcrv8+tWWEpThQtKmIRyfkwNcVRlPlgN+3mDg7vl+bKYtmOsTmoyMkkt5A13rwdBzu99QnvJVg/XzUKgfHSktfw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744567706; c=relaxed/simple;
	bh=98LFtn1tseprsMwLIYxoIRt09wt+dQXWBQe3wx8f7Us=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m/30eSGzZzLo+YuL29Rlmqw187y9sGe+wnoynwzuKqpj/cryF+0hX01+EHRGHnqZd8RITdJ7NGIdqX4HvSGUYryplxEp4CLnsFFdAUxrhyQc1zrAa3123ANh3QwRaRg3MbMdO141ooBwyvchD4wUzk6gGafGmmEYd0ZB1DsgfqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a628TvjU; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a628TvjU"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-72d3b48d2ffso3362284b3a.2
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 11:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744567705; x=1745172505; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8msCUUJodnedscKDvA6MjGmFcc4O0OyJw8Mm90R/Hx8=;
        b=a628TvjUw46eQ2FVgVwSia2qLz1VG09zjuvr/YDz5aQGAI5qGoMMy5XvA5t8rb8R3Q
         /1H1cyWwX2Xa5/ZjYvRMB/Ujj+1Ho7ceP5xwEjD7Z+2xbnWY+RBX66b9Rta9RKfr3xrb
         QJegfT1xoa0EOBO4OFUsgc+/xGaR63K2d6C/lpdFyQz6ZwMVPpjsD2r5WqYUG6PDqfVF
         PFg7VazfgubUMuUlWkTr3cSGLk8+fOP6XXB4tj86a/zZ8pxqfuPSgz1pqJPdGaXr1orb
         CvqV7EflbWGAtKuY17gHUSgUNwq5iIOGO3wr4K9eAXPb0wvowtmkA5eAnX2z+u1v+SPe
         RNMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744567705; x=1745172505;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8msCUUJodnedscKDvA6MjGmFcc4O0OyJw8Mm90R/Hx8=;
        b=NRT9lKtYthfjtsrd5l5w6Y3o6jE5DRidXd+S6RnAKnWAdI78T11awR5zifEe1DzaXo
         n1aoxljjqM+sA6Z0k0ACNbStR+t5b43yuffDC1PTFITIeHfd6VSIwi6ptqs1QKcR+Tgx
         evoVnKAQih0ELxK6JsijLwkXmWLELo+qvcw6EmpU16gMuvOYO2k1FqOCwnscg9fotGEy
         cAwbtdsseRaJLRLsFWjb2AIq30RTkUqQQsN/VValYz7GB51mfebxGQpyDTBUrLHQJpYo
         B7tPlxo8iyM+orPJa7rFBtYGAVLocVuPmnibQwvEWTvDlprsDhrL7/XhgFO/CvWyuicu
         0QZQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1Ymi4p/J7Px+mlu8A78SM9UYpO/e96vja1It9ixM2TOnkD88LmuunAyzKVzkTgKKOhOnY233OijMOsJYL@lists.linux.dev
X-Gm-Message-State: AOJu0YzI9R5Ilr6hS4fjSrA/4pKgjLs7szFCernd7sqn7dAZEb8/WvAM
	51g0JfdOcOS+6spQ18c4Ldon8sv4DGajj6DK1Tir0o6g5lPxphSK
X-Gm-Gg: ASbGncst2+BkESXaOre/AETmUW1jBD5O794bBpN/p/IzHzAvhkkJST8mGtCMwG3g2kb
	sJYo16u6CydDsvkhkz4Jkbw4NQSEL1oWh5eHg4ZRAJobpCdnX0ksxgzpZwH8oFx16ZNmZ887sbY
	tXAyeZF2zC5mEdLdsM954+jS6zML30wm74UxlTz3v1r0A4phXKyQri1xhzKdDb3gHMBkEYOTzBp
	NC9yovWJab9VzS4z8rUks3O/znlZQFCElqFHRg+BtVYbKtyxggAV+3ADlu1VGYnYdD3I3alhPJe
	9D6ycwwvtSKgVVJb7a0gaoszdv0ZQbRzVHaql2Tz16U6PvPg
X-Google-Smtp-Source: AGHT+IHHpazn8+vcBt0d5bUXCBCSA4Ri6OBXDZzp8cb/V4X1zMybbDxXn303XM70OY2H7CFwrfd8+Q==
X-Received: by 2002:a05:6a00:22ca:b0:736:a682:deb8 with SMTP id d2e1a72fcca58-73bd11ded49mr15615790b3a.8.1744567704616;
        Sun, 13 Apr 2025 11:08:24 -0700 (PDT)
Received: from localhost ([2804:30c:92d:f600:d5e4:543:c403:4767])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-73bd21c4e51sm5397399b3a.55.2025.04.13.11.08.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 11:08:23 -0700 (PDT)
Date: Sun, 13 Apr 2025 15:09:33 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Siddharth Menon <simeddon@gmail.com>
Cc: linux-iio@vger.kernel.org, lars@metafoo.de,
	Michael.Hennerich@analog.com, jic23@kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v6] iio: frequency: ad9832: Use FIELD_PREP macro to set
 bit fields
Message-ID: <Z_v93dtgks2CquIn@debian-BULLSEYE-live-builder-AMD64>
References: <20250413120354.19163-1-simeddon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250413120354.19163-1-simeddon@gmail.com>

Hi Siddharth,

Your patch looks good to me and I keep the review tag offered on the other email.
One small thing I noticed right before closing the driver. See comments below.

On 04/13, Siddharth Menon wrote:
> Use bitfield and bitmask macros to clearly specify AD9832 SPI
> command fields to make register write code more readable.
> 
> Suggested-by: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
> Signed-off-by: Siddharth Menon <simeddon@gmail.com>
> ---
...
> +
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
>  					st->ctrl_ss);
I think st->ctrl_ss alignment with the preceding parenthesis could also have
been adjusted since the patch is updating the very same assignment.
		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SYNCSELSRC) |
						  st->ctrl_ss);
There are some other places where similar change could be done but these are
probably not a reason for a v7.

>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
...
> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
This one would have become 
		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
						  st->ctrl_fp);

>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
...
> -		st->data = cpu_to_be16((AD9832_CMD_FPSELECT << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_FPSELECT) |
>  					st->ctrl_fp);
Same here
>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
...
>  
> -		st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> +		st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
>  					st->ctrl_src);
ditto

>  		ret = spi_sync(st->spi, &st->msg);
>  		break;
> @@ -396,7 +400,7 @@ static int ad9832_probe(struct spi_device *spi)
>  	spi_message_add_tail(&st->phase_xfer[1], &st->phase_msg);
>  
>  	st->ctrl_src = AD9832_SLEEP | AD9832_RESET | AD9832_CLR;
> -	st->data = cpu_to_be16((AD9832_CMD_SLEEPRESCLR << CMD_SHIFT) |
> +	st->data = cpu_to_be16(FIELD_PREP(AD9832_CMD_MSK, AD9832_CMD_SLEEPRESCLR) |
>  					st->ctrl_src);
ditto

Regards,
Marcelo
