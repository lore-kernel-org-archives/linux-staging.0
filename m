Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC3772
	for <linux-staging@lists.linux.dev>; Tue,  1 Jun 2021 11:04:01 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id l18-20020a1ced120000b029014c1adff1edso1285145wmh.4
        for <linux-staging@lists.linux.dev>; Tue, 01 Jun 2021 04:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:content-transfer-encoding:date:message-id:cc:subject
         :from:to:references:in-reply-to;
        bh=UIeev169KsjRHIHSK44fgwRCcjF3oL63Fw85uvXExqs=;
        b=KvzCCTj/0TGGXpfZKR9UGY0wC/FftejkhUxjOm+geMYWUYljCPae/mROSOWpu+UYrb
         ShBHZcRmnjjg767XGrE08i5WsakGc4dJrIV1HLAgvLnRcOsYkOm9/f1550HkKqTgub2U
         ZV6JfcJRs75dXucvlyNBM1aMcIopYauMEB3q1VgzRWfS4oE/9JfbNo27tCyXR4Ujb1MZ
         n51p12Lg4PJ1jondTA91Ml45ze1QTPqZ9Lvej+jyD5AIYm3o1a4+/pZ/52/UmUDspqBz
         Len4mSE2cglioc2E8Lko+dUCpKqSO/bb+ZwVKn3za2eiPjyBa+KLE6e13oSbpfYWXh8L
         dl0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:content-transfer-encoding:date
         :message-id:cc:subject:from:to:references:in-reply-to;
        bh=UIeev169KsjRHIHSK44fgwRCcjF3oL63Fw85uvXExqs=;
        b=NOST1jO2U3B8oQRAugzlcRJQ95/JIFIjBKRSgojzHIBLG4ovbE9qMz3MBEr5bS1j/x
         qnp0ZKggwROgRhTwVVTCPZsJ9bSu9bN7lVwOswxdHXRP3xu3A55TdHo+ELhhYfAMPWQM
         ykocx4k5lhLtYfWnuF8F2cHwlMi2HndMHzfDNiXZ+a3EWGTxekUxWrwR+0XLH11/t7wJ
         /Ymdu+ZuXPamwyR1WreXZo12lNht0MTJhQtgqpOBqkz1rSqDatA6GUJ2VTZNSb+mHHu2
         dTc2g40vtpplLUBOYelpAvb3j4fk9BZ1Hk9h2+b0pjXqoxZXJdEuCodGhOszC0tZiWkb
         x6iA==
X-Gm-Message-State: AOAM532yknL5U+4xFjh4RZYunFFdCaVMOtGIjHgR+pbWvg41sBZyjbzl
	/JHZkADnTXaRknbzcm2jSr4=
X-Google-Smtp-Source: ABdhPJzNJTzJo1iWAFdFFiIgWC2+hfB9CM4LEfJWadWMhzsrL8GS7Czqs8kzSnzTDLb/ygH3MQYjfQ==
X-Received: by 2002:a1c:a3c3:: with SMTP id m186mr14625537wme.154.1622545440071;
        Tue, 01 Jun 2021 04:04:00 -0700 (PDT)
Received: from localhost (a109-49-46-234.cpe.netcabo.pt. [109.49.46.234])
        by smtp.gmail.com with ESMTPSA id t14sm2755228wra.60.2021.06.01.04.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jun 2021 04:03:59 -0700 (PDT)
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 01 Jun 2021 12:03:59 +0100
Message-Id: <CBS8CSIHJTXJ.1HWQ3AWYCC1V8@arch-thunder>
Cc: <linux-media@vger.kernel.org>, <linux-staging@lists.linux.dev>,
 <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] media: imx: imx7_mipi_csis: convert some switch cases
 to the default
From: "Rui Miguel Silva" <rmfrfs@gmail.com>
To: <trix@redhat.com>, <laurent.pinchart@ideasonboard.com>,
 <slongerbeam@gmail.com>, <p.zabel@pengutronix.de>, <mchehab@kernel.org>,
 <gregkh@linuxfoundation.org>, <shawnguo@kernel.org>,
 <s.hauer@pengutronix.de>, <kernel@pengutronix.de>, <festevam@gmail.com>,
 <linux-imx@nxp.com>
References: <20210531174300.2594109-1-trix@redhat.com>
In-Reply-To: <20210531174300.2594109-1-trix@redhat.com>

Hi Tom,
Thanks for the patch.

On Mon May 31, 2021 at 6:43 PM WEST,  wrote:

> From: Tom Rix <trix@redhat.com>
>
> Static analysis reports this false positive
> imx7-mipi-csis.c:1027:2: warning: 4th function call argument is
>   an uninitialized value
>
> The variable 'align' is falsely reported as uninitialized.
> Even though all the cases are covered in the
> 	switch (csis_fmt->width % 8) {
>
> Because there is no default case, it is reported as uninialized.
>
> Improve the switch by converting the most numerous set of cases
> to the default and silence the false positive.
>
> Signed-off-by: Tom Rix <trix@redhat.com>

It solves that, looks good to me.

Reviewed-by: Rui Miguel Silva <rmfrfs@gmail.com>

------
Cheers,
     Rui

> ---
>  drivers/staging/media/imx/imx7-mipi-csis.c | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx7-mipi-csis.c b/drivers/staging=
/media/imx/imx7-mipi-csis.c
> index d573f3475d28..330f283030ec 100644
> --- a/drivers/staging/media/imx/imx7-mipi-csis.c
> +++ b/drivers/staging/media/imx/imx7-mipi-csis.c
> @@ -1016,10 +1016,8 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *s=
d,
>  	case 6:
>  		align =3D 2;
>  		break;
> -	case 1:
> -	case 3:
> -	case 5:
> -	case 7:
> +	default:
> +		/* 1, 3, 5, 7 */
>  		align =3D 3;
>  		break;
>  	}
> --=20
> 2.26.3



