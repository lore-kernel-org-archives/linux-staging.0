Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 361C81FC2
	for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 08:51:33 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l8so4516940wms.3
        for <linux-staging@lists.linux.dev>; Tue, 17 Jan 2023 00:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8xUTsuDVDtEpe1GJ8CtfZxPtOBZeRfWuY5JCnMma88g=;
        b=Q3J63XlGShJ/2WbvRq4hq2JID/RnkKt4xtbAsiugUa9SNycDgYwChezLN95KF6GWZS
         ZVJkIixYUlATzLJeowVp4c1h7z/f/4DH7nMUk4d4cegvxfChKv/AYjU+hXanodexOasF
         VAq8RVqnozkvWd1b5Fh1WlO2+qOfWgf+KUsbML1KuGpsVE2k8s88Z7SJqQfDqdIzgmai
         qbo8EyyaT9JS2OZssTz1Kfflfc2yI4nJHvivkCXHHpXB6yQMbO8dk+957rWZtiA+tEDr
         mJo3+KPuXQid4Tndd7zCW0puoOEZ60Ol+p6iPz76PYqum6cooiDuY2vr0mGP53YeFcAD
         MZLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8xUTsuDVDtEpe1GJ8CtfZxPtOBZeRfWuY5JCnMma88g=;
        b=RbWZYmMF+0RSNjYYoUkWooQM6GuLWvLR2CaJgPkCSuZg780k0ulAJ7JiAHc1H1fqF5
         YkcP8sPssV5W4mQjugrUgS0Ys/ZFJdhfP3VqhzCHrqmPtjE+ywbxHchBivn+LR2C+TEt
         dFBGPs79yu6AAf3OMokktizBwHL2zMUkf1IkEUUfaHbueu6dDfry9bqMvVRaoY+Alooe
         JsgyJTw1nJ/IUeX7PBE33r9yYDlOWMwR4G8ywK1bbpALEGk//gHWPBHSAbuNOvPk35dB
         S92821ZPcMtIhj4tD6fNf4gKCCoUXkCA1S2JBfve+JMGBIFNwfFAj847Z+6eltZ41crn
         zLjQ==
X-Gm-Message-State: AFqh2kr+P9tmKFLu6ciAjDfkQOma04AtcbHsrC7UKzBDTqLfvg7qWc9M
	LmOU6ST1uPIOC5ZCAv0kMfo=
X-Google-Smtp-Source: AMrXdXuaWZ988H1JpKPLPP+mvkv2SJjjaD8lYx2S17O9IVBsaXXDA9gK/NSe7U0nWs0SYGpizHjdWQ==
X-Received: by 2002:a05:600c:1d22:b0:3da:f66c:795d with SMTP id l34-20020a05600c1d2200b003daf66c795dmr2466961wms.9.1673945491342;
        Tue, 17 Jan 2023 00:51:31 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id o2-20020a05600c4fc200b003da2932bde0sm13956874wmq.23.2023.01.17.00.51.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jan 2023 00:51:30 -0800 (PST)
Date: Tue, 17 Jan 2023 11:51:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: Brent Pappas <bpappas@pappasbrent.com>
Cc: rmfrfs@gmail.com, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: greybus: gpio: Replace macro
 irq_data_to_gpio_chip with function
Message-ID: <Y8Zhj81ltR7HI7Uh@kadam>
References: <20230116184707.22302-1-bpappas@pappasbrent.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230116184707.22302-1-bpappas@pappasbrent.com>

On Mon, Jan 16, 2023 at 01:47:06PM -0500, Brent Pappas wrote:
> Replace the macro irq_data_to_gpio_chip with a static inline function to comply
> with Linux coding style standards.
> 
> Signed-off-by: Brent Pappas <bpappas@pappasbrent.com>
> ---
>  drivers/staging/greybus/gpio.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
> index 8a7cf1d0e968..833162ceb385 100644
> --- a/drivers/staging/greybus/gpio.c
> +++ b/drivers/staging/greybus/gpio.c
> @@ -43,7 +43,11 @@ struct gb_gpio_controller {
>  };
>  #define gpio_chip_to_gb_gpio_controller(chip) \
>  	container_of(chip, struct gb_gpio_controller, chip)
> -#define irq_data_to_gpio_chip(d) (d->domain->host_data)
> +
> +static inline void *irq_data_to_gpio_chip(struct irq_data *d)

1) Don't make this a void pointer.  ->host_data is void but we want to
   return a struct gpio_chip * type so declare it as returning a
   gpio_chip struct pointer.  A big advantage of function over macros is
   the type checking.

2) Don't declare it as inline.  Modern compilers are smart and confident.
   They are smart enough to make it inline automatically.  And confident
   enough that they just ignore when people mark stuff as inline.  (We
   have an __always_inline macro for when the compiler is wrong.)

regards,
dan carpenter

