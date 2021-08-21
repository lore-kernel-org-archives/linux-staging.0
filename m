Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653FB72
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 17:29:22 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id mq2-20020a17090b3802b0290178911d298bso9370046pjb.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 10:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mbXBY1K+bIvnA7frC2S0y5jy3wcA1bKUpmFcBQ25Dzk=;
        b=gsJG7hvUkpDh7HD4EmjVP9kdPG/PBNSMtqxEQjtRhtNGQ51sQIFDH09dvZCRrm0ZGe
         8TBCXzuO8EmNXisaQsSEcKbaMsQDM6rhEgfaCIf+WlbdazIZLOCa6L23gYxOeCSKKL6t
         UjAzMmoPWxDHbDiPFuaqPVd3bZog257iuf+RkwxvkNg8vkumTB76kzmkUvhxEPRGkZGX
         1liadzA5DWBQVo2Cvwnnn9qPXGXzv4yqX0uSLwtdbecDZJnG70LOM/NUlCzclFmaxzPz
         W0IvxluupVJ77xnsSocopNlpxMqjA/WXKxZUjKsy9zN52ehe7T4wfybI2ZDrdxvQQz+/
         Ygow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mbXBY1K+bIvnA7frC2S0y5jy3wcA1bKUpmFcBQ25Dzk=;
        b=KsHU8M3XZYHjEpqKlpqZOoDcaGp1c5OuMlJG/qXOi9Of/fy4PrR16uMFX4NTodhGP4
         6DraLb671HNB17kH1TjPzPucn0zTQpRPsCdwvQdKkL6oRQG2Ul+8wRcAEFr823EHQg7X
         mOK3Py0qwJNvn8WQX4+V3lssIMKsoEBL3WCTmgBYLa73/VRSVwsYss0lHqzCTEVmS2Ib
         gOevnBqdvh+2DKt//0f5L9rWY5LozC2MOyaUMviVP6m9jZ07Maih+5yVWP7T3ZraS4gI
         Ys4Ok/ayTPJ59njHr16hTHvdX3OMNrz0pVZvMNdD0KI5je8GmLfE5SaS24pdy8rJoWXt
         ms0A==
X-Gm-Message-State: AOAM533W3zWLC8+vPrlt+R9JqDI+lowH7Xb3IuO7DK4QSl4lKTqWo2hg
	QsEGWj1Fp5JRuvOHwc6nuKtFsXtq5Gga/+HYDd7dLw==
X-Google-Smtp-Source: ABdhPJx1PxpMu3bCnSml7ds1DFejoVvBh/9mDosyuXScV3s3fY4Hx/L75JY8mwkXgGQLkKO0Cg7ytx+JWkInEquHMc4=
X-Received: by 2002:a17:902:8c81:b029:12c:ee37:3f58 with SMTP id
 t1-20020a1709028c81b029012cee373f58mr21366030plo.45.1629566962001; Sat, 21
 Aug 2021 10:29:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20210821164859.4351-1-martin@kaiser.cx> <20210821164859.4351-5-martin@kaiser.cx>
In-Reply-To: <20210821164859.4351-5-martin@kaiser.cx>
From: Phillip Potter <phil@philpotter.co.uk>
Date: Sat, 21 Aug 2021 18:29:11 +0100
Message-ID: <CAA=Fs0=BzFpONB+Dtj-xTbk-YieqXvP8qHtLdUiv2MwsPjxq_w@mail.gmail.com>
Subject: Re: [PATCH 05/10] staging: r8188eu: remove an unused enum
To: Martin Kaiser <martin@kaiser.cx>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Larry Finger <Larry.Finger@lwfinger.net>, 
	Dan Carpenter <dan.carpenter@oracle.com>, Michael Straube <straube.linux@gmail.com>, 
	linux-staging@lists.linux.dev, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sat, 21 Aug 2021 at 17:49, Martin Kaiser <martin@kaiser.cx> wrote:
>
> The VENDOR_READ and VENDOR_WRITE defines are not used.
>
> Signed-off-by: Martin Kaiser <martin@kaiser.cx>
> ---
>  drivers/staging/r8188eu/include/usb_ops.h | 4 ----
>  1 file changed, 4 deletions(-)
>
> diff --git a/drivers/staging/r8188eu/include/usb_ops.h b/drivers/staging/r8188eu/include/usb_ops.h
> index b6a1cd536adf..c53cc54b6b87 100644
> --- a/drivers/staging/r8188eu/include/usb_ops.h
> +++ b/drivers/staging/r8188eu/include/usb_ops.h
> @@ -13,10 +13,6 @@
>  #define REALTEK_USB_VENQT_CMD_REQ      0x05
>  #define REALTEK_USB_VENQT_CMD_IDX      0x00
>
> -enum {
> -       VENDOR_WRITE = 0x00,
> -       VENDOR_READ = 0x01,
> -};
>  #define ALIGNMENT_UNIT                 16
>  #define MAX_VENDOR_REQ_CMD_SIZE        254     /* 8188cu SIE Support */
>  #define MAX_USB_IO_CTL_SIZE    (MAX_VENDOR_REQ_CMD_SIZE + ALIGNMENT_UNIT)
> --
> 2.20.1
>

Acked-by: Phillip Potter <phil@philpotter.co.uk>

Regards,
Phil
