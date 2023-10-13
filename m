Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18C88111B7
	for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 10:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Tam02bm2"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-406618d0992so19911685e9.0
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 03:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697191201; x=1697796001; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XyPAgTzM1/g4gPZZcwICWt2m4l0zgMIJEbaa3FF8/rc=;
        b=Tam02bm2eu1DK5e7jIYbgiUUD32BgslB4UOZwH8l1fnrmc+YgMU2E1I7BOAQRglxSU
         wbxqWXms4HLQV8zQmKxykPqtNOP/g/b074AFfobfoCAdx7cCV83myjSBhh0tNZ8fC5e6
         mrGNwXKlfETvqJInHDq4atAr9cyWSx2vhSY0dhtU6SjXNvsFJI+2S46mf/YIVZ643XeX
         hxOfg3fwCfhUOE+BtfEc4kAUkN28ZHHeQ9ftytZtVNaNpeyN2eLUPUUaHhCuFM3ARagm
         5OuikQly+Lf95jR4avhUBGkpwb7iyf0KWxLwlvY3SgEaiIHi1K7Z98Ubas5XkgrGOGVV
         jf6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697191201; x=1697796001;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XyPAgTzM1/g4gPZZcwICWt2m4l0zgMIJEbaa3FF8/rc=;
        b=ktfX8+TLToeXfxxoVH7RPw9yMbAL/EmF5qH0cmdygBwMjnFt7xDFun8jdt6vwWAoOA
         UNpoKVb1PU+ZlNRaWJWS0KzFHtsq69+3t2KVpapE15z0Ae4FUPdEfXJDgU1yuTbXnojd
         nnr9cKKSMaJgKTORvBPVr4M2HwWtG2iLJKQJZ//JmucRyCDrRpL24qf+WDurikQILbsc
         Q27q/qPQlLHEywdFUGupxaDAGQT9X1RsPHuL8ooavGIOscnKKAIa7LJxCzNNMIyFTzUQ
         lvavO+AIa3HsgA+uP4fgKVNm3EyXLn3E/ohcUz5EC26Er/4M4+Cqax33vE3R+BT0oLi8
         UCnQ==
X-Gm-Message-State: AOJu0Yy8ng6cFtbEVBN31FqHlDt2FCGhh7+rlT/5Z4Q1H8a7Bpm0yKSF
	p0OqKHIaUDiq9kQQj0uziL+6VA==
X-Google-Smtp-Source: AGHT+IFtG5rE+zx5Zt2wiuAc9FukWFD0iWAMWdFFwP31fcLpwYJAkqFbL7DnufhzKAsr+EjYbbPSAQ==
X-Received: by 2002:a05:6000:1c09:b0:329:6b35:d141 with SMTP id ba9-20020a0560001c0900b003296b35d141mr22025569wrb.44.1697191201245;
        Fri, 13 Oct 2023 03:00:01 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id i5-20020a5d55c5000000b003142e438e8csm1307815wrw.26.2023.10.13.03.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:00:00 -0700 (PDT)
Date: Fri, 13 Oct 2023 12:59:58 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Calvince Otieno <calvncce@gmail.com>
Cc: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>, linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: wlan-ng: replace  strncpy() with strscpy()
Message-ID: <b53cc9c0-f1fd-43ae-85d9-2c502fc4fcec@kadam.mountain>
References: <ZSkT0pFu0VClVc1V@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZSkT0pFu0VClVc1V@lab-ubuntu>

On Fri, Oct 13, 2023 at 12:54:26PM +0300, Calvince Otieno wrote:
> Checkpatch suggests the use of  strscpy() instead of strncpy().
> The advantages are that it always adds a NUL terminator and it prevents
> a read overflow if the src string is not properly terminated.  One
> potential disadvantage is that it doesn't zero pad the string like
> strncpy() does.
> 
> In this code, strscpy() and strncpy() are equivalent and it does not
> affect runtime behavior.  The string is zeroed on the line before
> using memset().  The resulting string was always NUL terminated and
> PRISM2_USB_FWFILE is string literal "prism2_ru.fw" so it's NUL
> terminated.
> 
> However, even though using strscpy() does not fix any bugs, it's
> still nicer and makes checkpatch happy.
> 
> Signed-off-by: Calvince Otieno <calvncce@gmail.com>
> ---
> Patch version v4:
> 	Provide a valid description of the patch

Good.

However, you've still included the v1 patch...  See below.  Don't do
that.

regards,
dan carpenter

> Patch version v1:
>         Replacing strncpy() with strscpy()
> 
>  drivers/staging/wlan-ng/prism2fw.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/wlan-ng/prism2fw.c b/drivers/staging/wlan-ng/prism2fw.c
> index 5d03b2b9aab4..57a99dd12143 100644
> --- a/drivers/staging/wlan-ng/prism2fw.c
> +++ b/drivers/staging/wlan-ng/prism2fw.c
> @@ -725,7 +725,7 @@ static int plugimage(struct imgchunk *fchunk, unsigned int nfchunks,
> 
>                 if (j == -1) {  /* plug the filename */
>                         memset(dest, 0, s3plug[i].len);
> -                       strncpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
> +                       strscpy(dest, PRISM2_USB_FWFILE, s3plug[i].len - 1);
>                 } else {        /* plug a PDR */
>                         memcpy(dest, &pda->rec[j]->data, s3plug[i].len);
>                 }
> 
> -- 
> Calvince Otieno
> 
