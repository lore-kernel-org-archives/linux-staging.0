Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A5A4168D6
	for <linux-staging@lists.linux.dev>; Mon,  5 Jun 2023 11:11:05 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-3f6d38a140bso33375725e9.1
        for <linux-staging@lists.linux.dev>; Mon, 05 Jun 2023 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685963463; x=1688555463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DrstvumQtW1JqE0YbZS9+L1Cqb2uWMvTeMMQ+qthFUA=;
        b=CEIQoPcK9wHM+tCzljmVvXd0Qp3r4kFQEwDls1OHwg2Ar7Pq9p5Clbe6FUY5KDsMPI
         G7zWObJeUveOpNZDqmIsUDxQ05p1FkhTbqq6ittHx1qwp6X1JBX6Tco+JS9te4iq60E2
         10FY5/93J/hsawntbYzN00YS7gki0GfZgNuXMbzkfxBmMHXCUyrLiPjRW5Yt/9HdbQJf
         /A799XlPrkGEpOLIy7mvtQUYoxJCGHETZco6SrFFutPOKjqaBLbi0pulKd8WpHCicatd
         To49vA9/DxOv2dD9Np+ktlTUkx2cmmRAXHW1wYBm5tMp7f0oGDa9Y8OVLs/BuLHelwph
         a3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685963463; x=1688555463;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DrstvumQtW1JqE0YbZS9+L1Cqb2uWMvTeMMQ+qthFUA=;
        b=K2ObSKR7k2FegvxaeyBzo7aMrwwa1VMzPS1mQFXibh1b3/CckxhX5BKT0vnpbJcpgg
         CvYYveui4LeaZ7nxOeUvb9Y2j7bf2xV9MLUGaW3AAEmmmQr/WnFyi96qfGAtJdAe2E+v
         2qZo94h3rjkdqQpMqqgwljozmFGTI74G20NsvJRx7SQ2m6f+IhRO0wYVR1W2JrfgvOgT
         uD40+vYu5A/skz+hf5IX01TsVYns1Z2PhN0/8kc6PE7XF4ph58MtIYliB3RN0L6cHWHB
         eKAJcPnI+bef203qocqIovxVA73xf82q9fEnM2bHyb4m9+r8mht92c7m9AvDtiTmZems
         LIDA==
X-Gm-Message-State: AC+VfDw0OF41tQlnix/INifDf8S31f9Vx1zz8K/owd27H1bXfLnq4FoF
	r9h9xS6LvYbxbfBIFrc7F/Olaw==
X-Google-Smtp-Source: ACHHUZ5IrHVg2TlUs+zH9rHoeWxHxcaY2S5wSvJwjs1K8hycuJ6dO6nHUnI8h3xLWvAluRpObB6a7g==
X-Received: by 2002:a05:600c:8511:b0:3f6:ff08:6ad4 with SMTP id gw17-20020a05600c851100b003f6ff086ad4mr7852148wmb.3.1685963463572;
        Mon, 05 Jun 2023 04:11:03 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id m11-20020a7bce0b000000b003f1958eeadcsm13959000wmc.17.2023.06.05.04.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 04:11:02 -0700 (PDT)
Date: Mon, 5 Jun 2023 14:10:59 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kate Hsuan <hpa@redhat.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH 2/3] atomisp: sh_css_params: write the sp_group config
 according to the ISP model
Message-ID: <f9f3f779-36e6-4329-880d-12a6faa707c2@kadam.mountain>
References: <20230605102903.924283-1-hpa@redhat.com>
 <20230605102903.924283-3-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605102903.924283-3-hpa@redhat.com>

On Mon, Jun 05, 2023 at 06:29:02PM +0800, Kate Hsuan wrote:
> Pick up the necessary part of sp_group configuration for both model and
> then copy those parts into a tempetory buffer. This buffer is finally
> written to the ISP with correct length.
> 
> Signed-off-by: Kate Hsuan <hpa@redhat.com>
> ---
>  .../staging/media/atomisp/pci/sh_css_params.c | 37 ++++++++++++++++++-
>  1 file changed, 35 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/sh_css_params.c b/drivers/staging/media/atomisp/pci/sh_css_params.c
> index 588f2adab058..2913d9d6d226 100644
> --- a/drivers/staging/media/atomisp/pci/sh_css_params.c
> +++ b/drivers/staging/media/atomisp/pci/sh_css_params.c
> @@ -3720,10 +3720,43 @@ struct ia_css_shading_table *ia_css_get_shading_table(struct ia_css_stream
>  
>  ia_css_ptr sh_css_store_sp_group_to_ddr(void)
>  {
> +	u8 *write_buf;
> +	u8 *buf_ptr;
> +
>  	IA_CSS_ENTER_LEAVE_PRIVATE("void");
> +
> +	write_buf = kzalloc(sizeof(u8) * 8192, GFP_KERNEL);

Please add a check for allocation failure.

regards,
dan carpenter


> +
> +	buf_ptr = write_buf;
> +	if (IS_ISP2401) {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(u8) * 5);
> +		buf_ptr += (sizeof(u8) * 5);
> +		memset(buf_ptr, 0, 3);
> +		buf_ptr += 3; /* Padding 3 bytes for struct sh_css_sp_config*/
> +	} else {
> +		memcpy(buf_ptr, &sh_css_sp_group.config, sizeof(sh_css_sp_group.config));
> +		buf_ptr += sizeof(sh_css_sp_group.config);
> +	}

