Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F4A28E3
	for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 15:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1675091064;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=AHzUAFOISigJSuZLYSE9gYkWGGTM6t11vLNDnydgJJc=;
	b=KIe2cYdiLtAGhSodWpwLrjzYlmVHR9061LSjQbUrpXQ32EcoKyv/nbkCeDX5UVi4VASnDI
	DiTlVm6cgGi4/bFakkoz1Vs/Rd5xwd3yxwN5tcFC5ES0RGeaJedBPjGHjYTQ098KY27vJ0
	L6LGZBUMB0XwSvBsmBovRn4EjI8lmuM=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-213-kDm3OlhkPEqgb_AC7xhS7g-1; Mon, 30 Jan 2023 10:04:23 -0500
X-MC-Unique: kDm3OlhkPEqgb_AC7xhS7g-1
Received: by mail-qt1-f197.google.com with SMTP id j14-20020ac874ce000000b003b6917d0731so5015763qtr.4
        for <linux-staging@lists.linux.dev>; Mon, 30 Jan 2023 07:04:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AHzUAFOISigJSuZLYSE9gYkWGGTM6t11vLNDnydgJJc=;
        b=bWP2qDjnXZeIqhyIWLPXl0L2ZnwSs3UZ54gHuKg2QsYOZCbwgXMxaipHWTKBJQ0w56
         lGZ03rsSjrYmCr9WWG2EHvSX6Fyhzdi/zRQWHC1AcztOaTHSCIMUrRSomhdrFaUgvR2A
         Zl2ME70nQt2HoH1px4Hmcfkoj9/JJ//h3isiSEvtrA93Zql6axEraMcmorCKR02wHOPy
         zMscULK0T6adwQZzhbeaLq6gNNnwXCvV736gbabqApiHsQ4g3QCoX8EivDdHa9Zd0KsM
         UDN098TTs1btxqSbpKUBq6f7xvRqsdMvRGIWqMg1U9vzsP8yDpiSxIP6BAHNNJZp+HIQ
         t4gQ==
X-Gm-Message-State: AO0yUKWZai0wuwpelr9iCD541Mb9jE5XUk90iLJ/tHisVptNcA/Iw9e4
	g2cSi+ivn6CCfptZ8hNBeWF9nMFpwIJBWKEs6INb00nbxbXl/TfIcGMDquLa6cio3p7A2k6k0N7
	VcP5ihcedB7gR5zjuB0jxpqkvQQ==
X-Received: by 2002:ac8:5ccf:0:b0:3b8:6aaf:acfe with SMTP id s15-20020ac85ccf000000b003b86aafacfemr4750201qta.38.1675091062950;
        Mon, 30 Jan 2023 07:04:22 -0800 (PST)
X-Google-Smtp-Source: AK7set9YJRIkiVvinAoDC8719oWhQC2COIk00xm3Dl23OMFlPho0p5nFr66Bab8WpRnJVguTUiT25Q==
X-Received: by 2002:ac8:5ccf:0:b0:3b8:6aaf:acfe with SMTP id s15-20020ac85ccf000000b003b86aafacfemr4750176qta.38.1675091062547;
        Mon, 30 Jan 2023 07:04:22 -0800 (PST)
Received: from jsavitz-csb (c-98-229-96-5.hsd1.ct.comcast.net. [98.229.96.5])
        by smtp.gmail.com with ESMTPSA id b1-20020ac85bc1000000b003b6325dfc4esm8246094qtb.67.2023.01.30.07.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 07:04:21 -0800 (PST)
Date: Mon, 30 Jan 2023 10:04:19 -0500
From: Joel Savitz <jsavitz@redhat.com>
To: Jongwoo Han <jongwooo.han@gmail.com>
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
	gregkh@linuxfoundation.org, linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] vc04_services: mmal-vchiq: fix typo in comment
Message-ID: <20230130150419.GA1268781@jsavitz-csb>
References: <20230130145400.40890-1-jongwooo.han@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20230130145400.40890-1-jongwooo.han@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jan 30, 2023 at 11:54:00PM +0900, Jongwoo Han wrote:
> Signed-off-by: Jongwoo Han <jongwooo.han@gmail.com>
> ---
>  drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> index 294b184d4..e318f3609 100644
> --- a/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> +++ b/drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c
> @@ -245,7 +245,7 @@ static void event_to_host_cb(struct vchiq_mmal_instance *instance,
>  /* workqueue scheduled callback
>   *
>   * we do this because it is important we do not call any other vchiq
> - * sync calls from witin the message delivery thread
> + * sync calls from within the message delivery thread
>   */
>  static void buffer_work_cb(struct work_struct *work)
>  {
> -- 
> 2.34.1
> 
> 
> _______________________________________________
> linux-rpi-kernel mailing list
> linux-rpi-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rpi-kernel
> 
Acked-by: Joel Savitz <jsavitz@redhat.com>

