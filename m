Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A9E368
	for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 14:02:29 +0000 (UTC)
Received: by mail-lj1-f177.google.com with SMTP id u22so24492521lju.7
        for <linux-staging@lists.linux.dev>; Sat, 27 Nov 2021 06:02:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=6Jp+Jmv9nQ4RwfE9Lv1G0z4T1+sN4K5Hm7FU2O6G3Po=;
        b=xLQAvi6VXf7U8l/yJVeP9gcvtkRIkIrjt64YcaNqsZaWkPQJhDq5Tqs7qufpRGEXwT
         UeYhciNhFatnRhRVAsGgtSCCR/zwi9OQkRqaytIqViWhcaPCZZIsx3JdJf1p14HhRGmI
         sINB1KdVGY1YSYStn5yRvJlEA9Tr33TU3K3/vHdsljmbu4ALNxeKRJ770XcPuOonS+2O
         bXyFj51bwXK8i4iOojBQutk8mG1TQUrKNPMFQEE5jbqVOTD0H2FYX0hJWMvEStV47a/M
         2n5pjMbkvpBrd1uoNrrN5dFe+servml7aDZvDxoPT6C1EBPaPncchphhYs1BgIZyF1mP
         vTAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=6Jp+Jmv9nQ4RwfE9Lv1G0z4T1+sN4K5Hm7FU2O6G3Po=;
        b=YWeZ7dARbEhUCgX8spjnyzFpx01hsx00MbbYcKXUiTtC9EamWF7n75H6EfmQqPvRnJ
         KSSOktrgNih0CDFqeUQjv9MukRKgTpy12YePwCV1boQV7af6EJTZBfJkuZE6HgxLo7Mv
         zncCMFegm3rg6qMPrEHIKce+rODYBg0QADJRybjfTmVs0V+6e5Z9zX6eleg3XqX1IR07
         Msclvc8+vWqMlxmUUE0hU3OMf0DxvHvxiKG5PBEdbbVSNqLemJNE1rjkr+FxP6G67m+p
         JrgHe7My5gV90+X24Xo1khEtMQ52aycuq6mewcko3aHNTdxAV3yTxMTlFccxemLMA0Ze
         krag==
X-Gm-Message-State: AOAM532cqHXKmdp3N1htW4lP52+Ybl9ZNBPZCqx2P4SfrfX15jsWHn6F
	xqQAa4HiEqVRBNzWXOq28lPSUw==
X-Google-Smtp-Source: ABdhPJyz24J5I1/otOJx9sQYPb9FUXaXuNX7Nh3JjWdXmTizPpwpJ5pmEAEZW14aF8rvZNyADHq7hg==
X-Received: by 2002:a2e:8e8f:: with SMTP id z15mr36136932ljk.508.1638021747974;
        Sat, 27 Nov 2021 06:02:27 -0800 (PST)
Received: from localhost (h-46-59-88-219.A463.priv.bahnhof.se. [46.59.88.219])
        by smtp.gmail.com with ESMTPSA id t4sm849568lfe.220.2021.11.27.06.02.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Nov 2021 06:02:27 -0800 (PST)
Date: Sat, 27 Nov 2021 15:02:26 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: staging: max96712: Constify static v4l2_subdev_ops
Message-ID: <YaI6csuWQFTU7moc@oden.dyn.berto.se>
References: <20211127094945.27985-1-rikard.falkeborn@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20211127094945.27985-1-rikard.falkeborn@gmail.com>

Hej Rikard,

Tack för din patch, ser bra ut.

On 2021-11-27 10:49:44 +0100, Rikard Falkeborn wrote:
> The only usage of max96712_subdev_ops is to pass its address to
> v4l2_i2c_subdev_init() which takes a pointer to const struct
> v4l2_subdev_ops as argument. Make it const to allow the compiler to put
> it in read-only memory.
> 
> Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
>  drivers/staging/media/max96712/max96712.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/max96712/max96712.c b/drivers/staging/media/max96712/max96712.c
> index 847e2ffd4f53..9bc72d9a858b 100644
> --- a/drivers/staging/media/max96712/max96712.c
> +++ b/drivers/staging/media/max96712/max96712.c
> @@ -250,7 +250,7 @@ static const struct v4l2_subdev_pad_ops max96712_pad_ops = {
>  	.set_fmt = max96712_get_pad_format,
>  };
>  
> -static struct v4l2_subdev_ops max96712_subdev_ops = {
> +static const struct v4l2_subdev_ops max96712_subdev_ops = {
>  	.video = &max96712_video_ops,
>  	.pad = &max96712_pad_ops,
>  };
> -- 
> 2.34.1
> 

-- 
Kind Regards,
Niklas Söderlund
