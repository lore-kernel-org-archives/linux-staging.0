Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3869A2F44
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 13:13:10 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id z99so19793351ede.5
        for <linux-staging@lists.linux.dev>; Tue, 03 May 2022 06:13:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=m9EJXKOaKjDDNKQv1gqS5JQ7TFaPX71hGDmkIvDsda0=;
        b=jFHCvpg7kJ7bmVCanX+9zqu46ofKvbl/Xb/SqqfkaxIx/MLwrPEJg27OzILpJiK3qZ
         clfA5sgrVh2Kl2tk4tnXaUwgNoSJR/UxnYJtAMAVNYN46DEXN2H5Yxk2XMCg10vUFo2W
         flWDfcAqisasCl/8EA5Sqq3PU4sVOVUSVBhgGhP0qVURTSGw2Pyn2Y1AiCt4CyQFVy3t
         Hhq487eMpjhKhV8B69S3+eJcbhkRiXS5GJJYz2gHKcJoeFijCo1oWCm31Ksvl4l+zTiJ
         UyGrqOsLINbNMXAMr5Wp9Gy2eGkXHGRw/kU5XL+C9hWsBV0zJuPeVpgs97XjYg4MPeMz
         8k+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=m9EJXKOaKjDDNKQv1gqS5JQ7TFaPX71hGDmkIvDsda0=;
        b=MSlskk1U/rSb32VPYihlwzuUAhCgM1wl5PM8kFiFq6+iwdGMxRgpZZqTmUR1CftzC2
         MbQmTTC2eIZlu5ccf4BAze4L3IrZ9kfB23yvzJBdndty+UaI34UD8wIVxB4P5m1Ub1pm
         J17zip/mzRf2fcoSCMBugD8/5FM3amgi7L71mNg2KCnqczVGTCX4YbrL2ajVh5G1mZ4F
         SwMDAXB3wFGlWrtNoULgv5cJrln1hbyOGcnVWZIY7XbbiBkGklUK8zWX7MgpL1jpwHS3
         TXjFglttZV77QUWR+QVKJhe01KT/sO2HBTSRFvwedLpfY9hYZXkVl+XtdlVgiXNDY4hp
         GU9w==
X-Gm-Message-State: AOAM533j0R/73olSQ39bz2ZZksakA6dbYTl3HyniN90dKoLSbXQ2w0U+
	SRTYKnrFEyUeJZ/rmDmyJD3lJ1anTWcjljjFWaC0TQ==
X-Google-Smtp-Source: ABdhPJxXwCm9IHHV3kTuM6DOq/lBLPdzGlFlGxt6I/BTiZE2k82vcX4wZYbW9ztH1iJfXbCDL0KsRXOdo34VWfoK7Fc=
X-Received: by 2002:a05:6402:2c4:b0:425:ac5c:4376 with SMTP id
 b4-20020a05640202c400b00425ac5c4376mr18103055edx.10.1651583588354; Tue, 03
 May 2022 06:13:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220426135034.694655-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20220426135034.694655-1-benjamin.gaignard@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 3 May 2022 10:12:57 -0300
Message-ID: <CAAEAJfAvUjtR4w0uaZ5yFueXu8jNbH-gmWUOEZxoJH78771RSA@mail.gmail.com>
Subject: Re: [PATCH v2] media: hantro: HEVC: unconditionnaly set
 pps_{cb/cr}_qp_offset values
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-media <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jon@nanocrew.net, 
	Adam Ford <aford173@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Benjamin,

On Tue, Apr 26, 2022 at 10:50 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT
> flag value.

I would say we need more justification why this is correct, or at least
checking what the reference vendor implementation is doing (and mentioning
in the commit description so we can track it in the future).

> This fix CAINIT_G_SHARP_3 test in fluster.
>

This could sound like a tad a pedantic detail, but I'd say it's
important we stop refering to tests
as "fluster tests", and instead say something more correct as "HEVC
conformance test CAINIT_G_SHARP_3".

Also, when we are fixing conformance tests, let's please add the
Fluster score (in this case, I think it's
OK to refer to Fluster).

PS: Same comments apply to patch "media: hantro: HEVC: Fix reference
frames management".

Thanks,
Ezequiel

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 6deb31b7b993..503f4b028bc5 100644
> --- a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> +++ b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> @@ -194,13 +194,8 @@ static void set_params(struct hantro_ctx *ctx)
>                 hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
>         }
>
> -       if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT) {
> -               hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> -               hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
> -       } else {
> -               hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
> -               hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
> -       }
> +       hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> +       hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
>
>         hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_offset_div2);
>         hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_div2);
> --
> 2.32.0
>
