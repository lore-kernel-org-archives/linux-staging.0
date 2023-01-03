Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C23320E
	for <linux-staging@lists.linux.dev>; Tue,  3 Jan 2023 11:51:03 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id v13-20020a17090a6b0d00b00219c3be9830so30818295pjj.4
        for <linux-staging@lists.linux.dev>; Tue, 03 Jan 2023 03:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=t+ASKySmgpYe6aeuyIud7plzReCzUcsxfQRRqpb3dCM=;
        b=dLWgbFCgL/n8+lBOD8gxbhiFHszFpeZo6BLDCarxXTBswHednpdDH3tiBOUHIzQOp5
         TI0Rdf7kTZRDLe00zrmwQUVOnpj8jr/TmHnW2/kUSku2MJ7gvJrX1vYGaPl7Y8Yn35mX
         EogWrpq293abNtofIdw5cybQ7/bzkBtlUP+qOcJSTzOi7xIUvg7w2+E5N6c7ATvIDKZW
         OOhoOBKu1bxEhC4gJM69Lis/aPWlt6gtIKIEvjGqcnshfQqMLj9V7XQ45PGLrUweHVfV
         SfXHCcMqpBIIorivPDikeOufr+z7HteEdwseA9IGlJIARcJjUBY1i/ezVdzKhQBIJKLy
         9xzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t+ASKySmgpYe6aeuyIud7plzReCzUcsxfQRRqpb3dCM=;
        b=jUXdhBdeFRPTwVTzZxMuLCB5u3S3zz4G7Ts8i9PFdDxxajSBOmE8GNDS1+FItl82hI
         wfTFoeAdWH7AzhSdv7+LsISZW/CurnWVB5T0nkruFUl29Kp2/iHx6WF7Ui51u0pdZvD1
         osc3Y9H032UcrxUaZjmyRUDKXrgVqOa9XEukjrch7FxRDybo6IxZBmCgUxJN2Sw68aJ0
         1JhRBLaJs0MbkpZHPc8WXIqYe50Plu3v7IOuWLwpjqyPgX2uELh2jAFsffjNDUsQjQ1t
         eGxnkN04uoXKVvyqQ/T2fn7EKEIQKsZblIy339DHcGneVjwRN6wugYCGDZQy0YghD18v
         uVAA==
X-Gm-Message-State: AFqh2krzpD+lUMDD+p6v36FXG6xpHM/W1HFwu8Hb9yaeH0nchqrRiogr
	PC1tgUARuPKmOeWjBNQdbOFDwvnqIH1B+7CxwOk=
X-Google-Smtp-Source: AMrXdXtjlG1QUtAGeuLxA2IQuXmZaZsBpL9dcTNtyWMOgr14QYIXMLdO7UE7vUNs7b0MrUG8gFjc9kbTS0iPSsOUAFY=
X-Received: by 2002:a17:90b:485:b0:219:720c:29cb with SMTP id
 bh5-20020a17090b048500b00219720c29cbmr4199206pjb.76.1672746663119; Tue, 03
 Jan 2023 03:51:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <Y7QVN0XY+ld2mBk4@qemulion>
In-Reply-To: <Y7QVN0XY+ld2mBk4@qemulion>
From: Fabio Estevam <festevam@gmail.com>
Date: Tue, 3 Jan 2023 08:50:51 -0300
Message-ID: <CAOMZO5Adkz2ZZaWF1VQgTZ43LB-+MqLxp+smS_zFBSJK+x7bjA@mail.gmail.com>
Subject: Re: [PATCH] staging: media: imx: remove unnecessary return variable
To: Deepak R Varma <drv@mailo.com>
Cc: Steve Longerbeam <slongerbeam@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Saurabh Singh Sengar <ssengar@microsoft.com>, 
	Praveen Kumar <kumarpraveen@linux.microsoft.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, Jan 3, 2023 at 8:45 AM Deepak R Varma <drv@mailo.com> wrote:
>
> The function imx_media_fim_set_stream() can directly return 0 instead of
> using a ret variable which never changes its value. Issue identified
> using the returnvar.cocci Coccinelle semantic patch.
>
> Signed-off-by: Deepak R Varma <drv@mailo.com>
> ---
>  drivers/staging/media/imx/imx-media-fim.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/drivers/staging/media/imx/imx-media-fim.c b/drivers/staging/media/imx/imx-media-fim.c
> index fb6590dcfc36..e719227d4323 100644
> --- a/drivers/staging/media/imx/imx-media-fim.c
> +++ b/drivers/staging/media/imx/imx-media-fim.c
> @@ -373,7 +373,6 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
>                              bool on)
>  {
>         unsigned long flags;
> -       int ret = 0;
>
>         v4l2_ctrl_lock(fim->ctrl[FIM_CL_ENABLE]);
>
> @@ -393,7 +392,7 @@ int imx_media_fim_set_stream(struct imx_media_fim *fim,
>         fim->stream_on = on;
>  out:
>         v4l2_ctrl_unlock(fim->ctrl[FIM_CL_ENABLE]);
> -       return ret;
> +       return 0;

Maybe you could change imx_media_fim_set_stream() to a void function instead?
