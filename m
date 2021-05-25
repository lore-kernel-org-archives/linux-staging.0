Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA7CF2F80
	for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 20:49:07 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id t206so17492829wmf.0
        for <linux-staging@lists.linux.dev>; Tue, 25 May 2021 13:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:from:to:cc
         :subject:references:in-reply-to;
        bh=jII/VVluno3yfO2v6lRJ0YYluonaqN09SkqoJIS1cfw=;
        b=fGLl/uDUZ+ISpUMFDUVq4paXMAAcK8ivEawXPm/C/YVAyiEPUTIO2tzCtv8WI2nbrH
         be5r5SldPYICUq5Ben/JBlbhYCk1mj+/Iqkn5PkmvwfF/2pvyiO4mQR8ElDiVAE7Q2x6
         uBDKeUNW9zqpwJpiLRGO5/ZUsuAe/UuTTUcbsiJ87U8BgyO3ofgQdyDIz+3kvdVlHIku
         YfDHuwpjjV0du9bxq4NCw1htoCpNhoGXeVGYnItCTmoySovuDOFeR32BsYyGp7MS+dbd
         MlswfwWXIxRGlwyT67DGBj+kmjyoKXPpsf1UVTI2pq8W/p6Lc0Qe/usnZzV51rHkvZ4p
         C5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:from:to:cc:subject:references:in-reply-to;
        bh=jII/VVluno3yfO2v6lRJ0YYluonaqN09SkqoJIS1cfw=;
        b=o1bnRTr++XHsfJ7tEARY/65JDmBkMpY+0HAL9npvHPAXVEy4/CP9LSNTxAqUAPEK+9
         N+lz65tTF2dKvtKEZLx/HnbnoRPBvrDbEqeZNdXpJFntxB5YJJ05MY+jYC1QqkncHRiH
         fmDtN+l+OU8kLCPPnOvorV81ysJrB3/2QoYuInyWxsCCCOGlWka2v2LDdVBunlRjb2bb
         b8fZTZoIO4g9llTAxnMGzkl8YnCkKHD4Eyo4120LwBeHv+asmVBn1TDI7Td4qW12tFkb
         YUGhUPre6ahmbFssozGWNM3W02qwOBRyMWIjsvydrhZ3ktdSYJCydjnkyvvIKahneM3A
         jP7w==
X-Gm-Message-State: AOAM530SUU8XnfhWngjLEHNdESY3Ib2n+3z0uXFXTyBuUKMO6jOXXeym
	wXI2OwQEejOZk9pQdLkUJtU=
X-Google-Smtp-Source: ABdhPJzJlfJfIB37PK009nDgE5KqNXiHeyp9sColJ243inXDZKrA09gHbcrlDVRcpswW/LYb8SDsCg==
X-Received: by 2002:a05:600c:3795:: with SMTP id o21mr18550555wmr.70.1621975746411;
        Tue, 25 May 2021 13:49:06 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id m11sm11668543wmq.33.2021.05.25.13.49.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 May 2021 13:49:05 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 25 May 2021 21:49:04 +0100
Message-Id: <CBMMEYM3MW7O.2U464BSP8CLQA@arch-thunder>
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: "Wei Yongjun" <weiyongjun1@huawei.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, "Steve Longerbeam"
 <slongerbeam@gmail.com>, "Philipp Zabel" <p.zabel@pengutronix.de>, "Mauro
 Carvalho Chehab" <mchehab@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <kernel-janitors@vger.kernel.org>,
 "Hulk Robot" <hulkci@huawei.com>
Subject: Re: [PATCH -next] media: imx: imx7_mipi_csis: Fix error return code
 in mipi_csis_async_register()
References: <20210524133552.2365248-1-weiyongjun1@huawei.com>
In-Reply-To: <20210524133552.2365248-1-weiyongjun1@huawei.com>

Hi Yongjun,
Thanks for the patch.

On Mon May 24, 2021 at 2:35 PM WEST, Wei Yongjun wrote:

> Fix to return negative error code -EINVAL from the error handling
> case instead of 0, as done elsewhere in this function.
>
> Fixes: 88fc81388df9 ("media: imx: imx7_mipi_csis: Reject invalid data-lan=
es settings")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>

Looks good to me, thanks.

Acked-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui
> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index d573f3475d28..9cd3c86fee58 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1175,6 +1175,7 @@ static int mipi_csis_async_register(struct csi_stat=
e *state)
>  		if (vep.bus.mipi_csi2.data_lanes[i] !=3D i + 1) {
>  			dev_err(state->dev,
>  				"data lanes reordering is not supported");
> +			ret =3D -EINVAL;
>  			goto err_parse;
>  		}
>  	}



