Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A45A939;
	Tue, 14 Mar 2023 19:53:25 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id da10so66852487edb.3;
        Tue, 14 Mar 2023 12:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678823604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vsp8Tj0Vktuf9bbrjDiQaJ9V5M9finhOPDw8dAUIlFQ=;
        b=QRy9UBfQi/bmZP2AMa6LauQh1VorDM8ZrVcpeEFJYZ0LnAdvOX5JcghVGOPDf9/TCR
         Xlk2evnPwBe60SCL69UtvMbHoKjI8gItlfvKSKOUzlFyhzZT01xFoux8YD20tQTXYEX3
         c6QlWOR9qWYRN4QLaTLo+cJlnTO1sRmnUOm3au7yxfk9EkmGVge91mhj0KHUV5TfILZa
         kbof++5IA8CBHsvpSOONobt2u4aPz3OyyubfLNXApoUzYEEBms6jR1RANbdfRpW0LcrQ
         7NiGinbujqirCtCbGGGLsTi48KwMpfqyUF2YtVAjd9gizGEAGeTmoq9uxYdAeVZ3+s4B
         v4qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678823604;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vsp8Tj0Vktuf9bbrjDiQaJ9V5M9finhOPDw8dAUIlFQ=;
        b=kuyWaFsHW5cCrrbKaWTfQd+XtW21IfjZU8f3USVxG+md3v2cJwI697HlTo72uZu08j
         Ru28ZYvO9PxRWkwON4+e4dh+D6Pm9GA0w1/H9abDEokJUvVV7sPw/NGi1G5So+HfYdCl
         mLj/Rvy8xaDfvH1/AZ8fkvN0hR7t8oV8gKxHDKyifp12LB6BQ/rXHtPD6EReWRylMB8L
         ikR82TsVpGWjtNSG6UjbsChO9cs7MJfBqjgG5Z6csYMI2pIv8QM6Ns3STBaDAqCxMXKx
         yiTD8i/RJcwNHSX0MP38Q12jzhIY/+oz2d8gCXBrGa6sX0taoZqBUzKMUd5+IMlP11Pq
         x9sA==
X-Gm-Message-State: AO0yUKUY0iW309bNOZk1WFMRUUNJ+WxrzlgwKDy6go7/wKeM38cinFzA
	kagqwrWO41J75JHtrmQ2Zbg=
X-Google-Smtp-Source: AK7set/aZQdUOqZ2pfdQ1/SmUcMim+rOjI0ri/3qpQg1f1JZzTN0Sb5PQFFOEMQcK+x6rxZijFw+9w==
X-Received: by 2002:a17:906:dc3:b0:839:74cf:7c4f with SMTP id p3-20020a1709060dc300b0083974cf7c4fmr4344319eji.8.1678823603740;
        Tue, 14 Mar 2023 12:53:23 -0700 (PDT)
Received: from jernej-laptop.localnet (82-149-1-233.dynamic.telemach.net. [82.149.1.233])
        by smtp.gmail.com with ESMTPSA id rq4-20020a17090788c400b00927341bf69dsm1523827ejc.88.2023.03.14.12.53.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 12:53:23 -0700 (PDT)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: mchehab@kernel.org, Zheng Wang <zyytlz.wz@163.com>
Cc: hverkuil@xs4all.nl, wens@csie.org, samuel@sholland.org,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, hackerzheng666@gmail.com,
 1395428693sheep@gmail.com, alex000young@gmail.com,
 Zheng Wang <zyytlz.wz@163.com>
Subject:
 Re: [PATCH v2] media: cedrus: fix use after free bug in cedrus_remove due to
 race condition
Date: Tue, 14 Mar 2023 20:53:22 +0100
Message-ID: <2274018.ElGaqSPkdT@jernej-laptop>
In-Reply-To: <20230313163120.3741811-1-zyytlz.wz@163.com>
References: <20230313163120.3741811-1-zyytlz.wz@163.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Dne ponedeljek, 13. marec 2023 ob 17:31:20 CET je Zheng Wang napisal(a):
> In cedrus_probe, dev->watchdog_work is bound with cedrus_watchdog function.
> In cedrus_device_run, it will started by schedule_delayed_work. If there is
> an unfinished work in cedrus_remove, there may be a race condition and
> trigger UAF bug.
> 
> CPU0                  CPU1
> 
>                     |cedrus_watchdog
> 
> cedrus_remove       |
>   v4l2_m2m_release  |
>   kfree(m2m_dev)    |
> 
>                     | v4l2_m2m_get_curr_priv
>                     | 
>                     |   m2m_dev //use
> 
> Fix it by canceling the worker in cedrus_remove.
> 
> Fixes: 7c38a551bda1 ("media: cedrus: Add watchdog for job completion")
> Signed-off-by: Zheng Wang <zyytlz.wz@163.com>
> ---
> v2:
> - use cancel_delayed_work_sync instead and add Fixes
> label suggested by Hans Verkuil
> ---
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c
> b/drivers/staging/media/sunxi/cedrus/cedrus.c index
> a43d5ff66716..a50a4d0a8f71 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -547,6 +547,7 @@ static int cedrus_remove(struct platform_device *pdev)
>  {
>  	struct cedrus_dev *dev = platform_get_drvdata(pdev);
> 
> +	cancel_delayed_work_sync(&dev->watchdog_work);
>  	if (media_devnode_is_registered(dev->mdev.devnode)) {
>  		media_device_unregister(&dev->mdev);
>  		v4l2_m2m_unregister_media_controller(dev->m2m_dev);




