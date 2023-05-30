Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812661C38
	for <linux-staging@lists.linux.dev>; Tue, 30 May 2023 04:15:33 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-30ac4e7f37bso2375973f8f.2
        for <linux-staging@lists.linux.dev>; Mon, 29 May 2023 21:15:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685420131; x=1688012131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9zAmG8r5Tvl40l89QOePVe0ImxWIFUXod7GM9rjQ6w4=;
        b=Cb0tUT/yg+2xLrCPQuYqIbDjPDTphCH1qAbkrurkgLiNWjf/+GsbPBedPGXMO0NPeo
         2csyGZIh/5JddVjwDBMEHKWK+Oobnbg83tOJsq28qtKMvAGMIhHdrw19I2qk/UHJzS4R
         eBeI+QR7McKqWffpzi1fC+lB3XK0TURBrmBhXrQWmlMYVsWAzG8f4uDtAaRL/ZvVZ3BF
         2xNjgjpI1h14o3ItEAjw/DbBXH94w7FRKwSyRLNMErYyz9YGkX3h5hJ3utLQC2cP5LCQ
         24xBICXEBTLk9Dv77Gfwvayf9MqeaCnaruG5SvRTnk3gnd+YLUSRY/xj6Br4WTjsuDC9
         MjQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685420131; x=1688012131;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9zAmG8r5Tvl40l89QOePVe0ImxWIFUXod7GM9rjQ6w4=;
        b=fLCwmqTFvPtAGvGRRuOu9krB8/uhx0sSYoAgODnVXL/hcNGrxYThsHBcJujdmf1OF7
         73j0Ji0SyN3HhtMwX6VSvLcC4Qu043K0ldnd/1WOyQJf8u8987hDjFFfvbfraKhKj6Nz
         Kx8PYf9BkBAX/bWk0Xg1J0rE91lHouZ3IbyHwSfno9jXh7B6c6l4j6QMNuRnFPmKMpVK
         gB+cKIYXTfQeUYcUYR2lLmBgF/Mo5E0ab4+8Q9BK4Yv1kuYWdvU4W/s1MYbsjmmMuZI+
         +ulJo4NnhIeR/DZdCpS66uurNk707urHs3yr98AOqRW4AIuyWilIOXM8zdeNpyGiZHVF
         +czA==
X-Gm-Message-State: AC+VfDw7Oshf86WJBlvqkNwzUM8J1OioSGI1uXLG1laE30OmErmFIQJA
	GpVFykXBUrpvWd5rYSnrq/F/dQ==
X-Google-Smtp-Source: ACHHUZ5SesDtWuZ/F2abelZZil/nppjy3LFKMWP+MiqKh1HA0BKpirE+O275NqL6Cp90anfi0dLFIQ==
X-Received: by 2002:a5d:4a11:0:b0:30a:bae6:fa98 with SMTP id m17-20020a5d4a11000000b0030abae6fa98mr434634wrq.39.1685420131670;
        Mon, 29 May 2023 21:15:31 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id v12-20020a5d4a4c000000b003077a19cf75sm1780745wrs.60.2023.05.29.21.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 May 2023 21:15:29 -0700 (PDT)
Date: Tue, 30 May 2023 07:15:26 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Deepanshu Kartikey <kartikey406@gmail.com>
Cc: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] Staging: rts5208: rtsx: Moved else statement to same
 line with else if
Message-ID: <ee41bf67-a074-49fd-bd0f-7fb992d68884@kili.mountain>
References: <20230530022259.24094-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230530022259.24094-1-kartikey406@gmail.com>

On Tue, May 30, 2023 at 07:52:59AM +0530, Deepanshu Kartikey wrote:
>  drivers/staging/rts5208/rtsx.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
> index 2284a96abcff..47dacef0aaf8 100644
> --- a/drivers/staging/rts5208/rtsx.c
> +++ b/drivers/staging/rts5208/rtsx.c
> @@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
>  				chip->srb->device->id,
>  				(u8)chip->srb->device->lun);
>  			chip->srb->result = DID_BAD_TARGET << 16;
> -		}
> -
> -		/* we've got a command, let's do it! */
> -		else {
> +		} else {
> +			/* we've got a command, let's do it! */

This code is part of series of if else statements that all have the
same issue but you're only changing one.  Please change them all.

regards,
dan carpenter

