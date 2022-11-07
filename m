Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4DFF3209
	for <linux-staging@lists.linux.dev>; Mon,  7 Nov 2022 13:08:36 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso7098905wmp.5
        for <linux-staging@lists.linux.dev>; Mon, 07 Nov 2022 05:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQ3EIftToSDAs8kIxnNN64z6dj2+/KZibkFT+hIH+I=;
        b=L+hnZtSjLy47alR2cv82vQMSOeIO5hmyynkrCswoFbg6CZe+MECKFqdR+16N+FwdRV
         mTfeI/nKmiCpm7kXfdpfr2o6wVMlc77JTgoDiJoY2GfASOCYamlmMnaKRBtOCzdw4ciT
         tP6ez2pQmAgww836XsX1PtCqwsGCx9/QvbWx97gYyqKd+XV4/oZANewMfhCa9gpaAtxq
         G8phyU/pynmFQBuB8oQbtjGidYGlYpHSnzubftS0CApdvaO+oyWT8x5xPexUzGuovy1V
         EkR9q8lSk5G9NVpuc5lO4AMHgRr7qRnMgs2iUZJ0S5hjgXz0m6n2IbwqkPiOT05AiriD
         bR6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OjQ3EIftToSDAs8kIxnNN64z6dj2+/KZibkFT+hIH+I=;
        b=Usp18D9VRg/t+2RMXzVPJm1AmyAOLMWZfIR5X9d3wD1RUEpeY8c5gAoYBC/NRbzp4j
         A0dm7UjwSx6fm6eDwiCPLQ69fM6LJD3on8gocgtfH1bJ6lNVpPIeKzpMe9+MHQVvnRpN
         fvduc25ymGlTHsJQwgNDJZdGOg+e1llP3zuYoUrVgWfnMTZ5feWXpTn4T2HadCkAaeBC
         HxpTI34aNPaE9z1RN7cLbL6udUpI0AWvs7VVpctxwy1PgnoS9jjX/0lQ+fDt6kTbIsYe
         aAsWmllKT6LOZj27408pluaFHsAQcV7Z2BW39YRt3L1kUbNwl7/1u2m5W5O0FDwVeFkr
         XpQw==
X-Gm-Message-State: ACrzQf1laTKHAmGQtbgXQEYtNj1K+IYZFN+EQPmb7BXirmuVA7t+n7m0
	RlnoELAbiN7tgCXNiOnuiaQ=
X-Google-Smtp-Source: AMsMyM5XlevBa2XTwPGVMGYwItpf9GANoVu6vIuqwg96EaKpvguJYcU66RI593ZqRNf1hMY8VrkxUw==
X-Received: by 2002:a7b:cc8c:0:b0:3cf:7b8c:d18a with SMTP id p12-20020a7bcc8c000000b003cf7b8cd18amr25194367wma.0.1667826514866;
        Mon, 07 Nov 2022 05:08:34 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bg20-20020a05600c3c9400b003c6bd12ac27sm8667304wmb.37.2022.11.07.05.08.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Nov 2022 05:08:34 -0800 (PST)
Date: Mon, 7 Nov 2022 16:08:31 +0300
From: Dan Carpenter <error27@gmail.com>
To: Deepak R Varma <drv@mailo.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-iio@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: iio: meter: use min() for comparison and
 assignment
Message-ID: <Y2kDTxE38epBN368@kadam>
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

The original code is better.

If it's a failure return the error code.  If it's not return zero.

You can only compare apples to apples.  min() makes sense if you're
talking about two lengths.  But here if ret is negative that's an error
code.  If it's positive that's the number of bytes.  If the error
code is less than the number of bytes then return that?  What???  It
makes no sense.

In terms of run time, this patch is fine but in terms of reading the
code using min() makes it less readable.

regards,
dan carpenter
