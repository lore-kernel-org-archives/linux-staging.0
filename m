Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF39E7E
	for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 12:12:33 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id el3so13320752edb.11
        for <linux-staging@lists.linux.dev>; Mon, 25 Apr 2022 05:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=u8jWkC3uGhpIesYWEXYlUoa6QOg8WMwc/6eHbmnOET0=;
        b=z8IQnKw/QCUVdEhGIPQl+8KO75rfqTMoiKMA3BB9sFazxr+viuAmkDtOFAjYYeqiOc
         BICBVB5W2S7RFYNSYuiQ6npvOUj18cyj24dNXTVDLHF+Df1i3nrw0JfwTe3/UGJ4/wUE
         Qca2+w5QoifM49TBcyBSRvgIievMdF2gdAJds31r60IivrAwNdzi3MI849ffzBimYtZG
         vwDiY04IZruTc3NDSAl4XfavEBJ1vfBwMPdlEkYSVfnOVY15MH9gH0F7JHLbs43U8yMf
         h/8JO4jyVbPJnAS414pRuAsGdZ9Da+iWc9gku4zBIfYqxQSrDaaccKm2crCoDnSsiUne
         u/Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=u8jWkC3uGhpIesYWEXYlUoa6QOg8WMwc/6eHbmnOET0=;
        b=D2W2nugebBl7ZHuI8+Qm4K5nVfWp8ruVYCUAWOB6KtFkPnLXyRVXD/Zo+/VsQullt+
         QJpAxxbjdbC0VHmvVp73aMw36MD98njcO0q6gXInyesFFO22BKmLgMzkXLk2e38ij4L8
         UQNKKQ2t+jKUfT4quDH4HDXuN+oN5SdpQl0dnWP4GYNQL3OxJttRRsPCS+DtgS5Po69+
         sI5yEXmR7sHuhQUZ3V4vnUfO2bYGDs02HdjnD3bNkxfAs5uhfzmc4zZ5kY6mvnhLUmza
         O3TmU2nOTEucer4OYNA9gBhonSGAvFCUWpS0TcJ/BepBqFQUrgQ/MvFCQj0BQHZCpt77
         +s+A==
X-Gm-Message-State: AOAM531tvQ52Sc3LpOnloX21SRVMIuj19Wv9+uVRqicn5BDEYtppkIDp
	gcfoZVoNafPYB9JFxas0igSEYPgPDP6cWnaa9Jpkbg==
X-Google-Smtp-Source: ABdhPJyaFAHnaHfcxF9oK2zzYsY2EtPh/uGq+12bC7Ho7eUw/yPfwKq2bJmWpg53blCYTMA1ROMhpC7iIBK74ygqh2U=
X-Received: by 2002:aa7:c789:0:b0:413:605d:8d17 with SMTP id
 n9-20020aa7c789000000b00413605d8d17mr18351707eds.100.1650888752051; Mon, 25
 Apr 2022 05:12:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20220425105346.324864-1-benjamin.gaignard@collabora.com>
In-Reply-To: <20220425105346.324864-1-benjamin.gaignard@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Mon, 25 Apr 2022 09:12:20 -0300
Message-ID: <CAAEAJfA2K2-YOruDMUjHixaPa1wfTSwpb3K5A-y_i3H6BF7oKQ@mail.gmail.com>
Subject: Re: [PATCH] media: hantro: HEVC: unconditionnaly set
 pps_{cb/cr}_qp_offset values
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Greg KH <gregkh@linuxfoundation.org>, linux-media <linux-media@vger.kernel.org>, 
	"open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>, 
	"open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, jon@nanocrew.net, 
	Adam Ford <aford173@gmail.com>, Collabora Kernel ML <kernel@collabora.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Apr 25, 2022 at 7:53 AM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT
> flag value.
> This fix a couple of tests in fluster.
>

Which tests?

Thanks,
Ezequiel

> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> ---
>  drivers/staging/media/hantro/hantro_g2_hevc_dec.c | 9 ++-------
>  1 file changed, 2 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/staging/media/hantro/hantro_g2_hevc_dec.c b/drivers/staging/media/hantro/hantro_g2_hevc_dec.c
> index 2c8eb0720db8..bb512389c1a5 100644
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
