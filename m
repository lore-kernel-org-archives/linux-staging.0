Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1F8374C0
	for <linux-staging@lists.linux.dev>; Thu,  9 Nov 2023 20:22:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HhvhV94N"
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-4ac10aacd27so568693e0c.0
        for <linux-staging@lists.linux.dev>; Thu, 09 Nov 2023 12:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699561324; x=1700166124; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=79oUciC1MphFLchMyW5zN+ld+Ip/ohdJ3MzsnnkdArI=;
        b=HhvhV94N3c2g4XI983ERjfLRFLN3xF6AD+Z7EBrUb5h33dZEhesQmZc+JwFvW7itRc
         FPnhLNAbK3CaOB/k9lg3S5NoJbMNTAuQYx220nRP88dlRGycTMDRJR7bD/fib5v5uItG
         O+Z4qJg5nB2z10ASaM1Iqd20dGiEwn6fN0CD9tEZHl6wdzjT5Ll5ZoBRWdvY2FOPmo5o
         6MplEAD41xVHv+hwqUrhsVT05E+SRkP1UDwYX2AuVQnBGrtFjdS4iXIE78elhEZ2KprK
         0oxA5M6NyxujU1bfycLIusPOUAMEMwhUcmQirY58mlV+DQ/LfDQGge6eDFSWdhrM5iZT
         JW5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699561324; x=1700166124;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=79oUciC1MphFLchMyW5zN+ld+Ip/ohdJ3MzsnnkdArI=;
        b=U5UfI/usjx3vzwv/ktUl6VuzMXuxQ0PEEXQq1nS6c5S6h6opEq1iI21ADtuF0YxQqQ
         87dJL9BEXjgQdTqaOma5jB1UOf2sukWmEyezn5j6b1JijDNJxXYHLnqKkbYQdO1Selue
         5AK7kcArWhy5W8txh0ccK872193uWPp7qDONskY3kN+E8F7yio4cGGELBeKUI4EFTORD
         YFnn79nhih1bVnwJQ0zRsym6GjfJ6ChmirRCFppcVZ4JFoXlGtYJPqtfRrZDxOt9Cyte
         o1EgR59QagyktDD8Uc3jp9DU8AN7z6MyDd9WhE2zbLOlRBH1s4HQLnZlT5r3/RVj3uZe
         ipjQ==
X-Gm-Message-State: AOJu0YzbIbLpPxE00LAXQV4dtAehiW2GlZp+3vFKlHA+1QQ9CD+4Th4q
	/Kfwt52RUVsaFTMGk7lokw7YoUoE4afucKKBHoI=
X-Google-Smtp-Source: AGHT+IHeEYBi5nUVdK8O1Fji9SXoWwVQ1ionOejtl0pq9n4Oxy3eyVaDJB4oTZ8X0i5CLfXx5Mqs5VNvA3gtw+Gk21c=
X-Received: by 2002:a05:6122:1807:b0:4a1:7278:3bf5 with SMTP id
 ay7-20020a056122180700b004a172783bf5mr2992264vkb.4.1699561324079; Thu, 09 Nov
 2023 12:22:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231109163512.179524-14-benjamin.gaignard@collabora.com> <20231109163512.179524-39-benjamin.gaignard@collabora.com>
In-Reply-To: <20231109163512.179524-39-benjamin.gaignard@collabora.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 9 Nov 2023 20:21:17 +0000
Message-ID: <CA+V-a8t33Q5C00dUmo=i=wd5wPzqdCNVO8MLH8to-7Ge9SjYuQ@mail.gmail.com>
Subject: Re: [PATCH v15 38/56] media: ti: Stop direct calls to queue
 num_buffers field
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: mchehab@kernel.org, tfiga@chromium.org, m.szyprowski@samsung.com, 
	ming.qian@nxp.com, ezequiel@vanguardiasur.com.ar, p.zabel@pengutronix.de, 
	gregkh@linuxfoundation.org, hverkuil-cisco@xs4all.nl, 
	nicolas.dufresne@collabora.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	kernel@collabora.com, Andrzej Pietrasiewicz <andrzej.p@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 9, 2023 at 4:38=E2=80=AFPM Benjamin Gaignard
<benjamin.gaignard@collabora.com> wrote:
>
> Use vb2_get_num_buffers() to avoid using queue num_buffers field directly=
.
> This allows us to change how the number of buffers is computed in the
> future.
>
> Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
> Reviewed-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> CC: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
> ---
>  drivers/media/platform/ti/am437x/am437x-vpfe.c   | 5 +++--
>  drivers/media/platform/ti/cal/cal-video.c        | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_capture.c | 5 +++--
>  drivers/media/platform/ti/davinci/vpif_display.c | 5 +++--
>  drivers/media/platform/ti/omap/omap_vout.c       | 5 +++--
>  5 files changed, 15 insertions(+), 10 deletions(-)
>
Reviewed-by: Prabhakar <prabhakar.csengg@gmail.com>

Cheers,
Prabhakar

> diff --git a/drivers/media/platform/ti/am437x/am437x-vpfe.c b/drivers/med=
ia/platform/ti/am437x/am437x-vpfe.c
> index 5fa2ea9025d9..f18acf9286a2 100644
> --- a/drivers/media/platform/ti/am437x/am437x-vpfe.c
> +++ b/drivers/media/platform/ti/am437x/am437x-vpfe.c
> @@ -1771,9 +1771,10 @@ static int vpfe_queue_setup(struct vb2_queue *vq,
>  {
>         struct vpfe_device *vpfe =3D vb2_get_drv_priv(vq);
>         unsigned size =3D vpfe->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/cal/cal-video.c b/drivers/media/pl=
atform/ti/cal/cal-video.c
> index a8abcd0fee17..94e67c057a20 100644
> --- a/drivers/media/platform/ti/cal/cal-video.c
> +++ b/drivers/media/platform/ti/cal/cal-video.c
> @@ -603,9 +603,10 @@ static int cal_queue_setup(struct vb2_queue *vq,
>  {
>         struct cal_ctx *ctx =3D vb2_get_drv_priv(vq);
>         unsigned int size =3D ctx->v_fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> diff --git a/drivers/media/platform/ti/davinci/vpif_capture.c b/drivers/m=
edia/platform/ti/davinci/vpif_capture.c
> index 99fae8830c41..fc42b4bc37e6 100644
> --- a/drivers/media/platform/ti/davinci/vpif_capture.c
> +++ b/drivers/media/platform/ti/davinci/vpif_capture.c
> @@ -113,6 +113,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>         struct channel_obj *ch =3D vb2_get_drv_priv(vq);
>         struct common_obj *common =3D &ch->common[VPIF_VIDEO_INDEX];
>         unsigned size =3D common->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
>         vpif_dbg(2, debug, "vpif_buffer_setup\n");
>
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>                 size =3D sizes[0];
>         }
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         *nplanes =3D 1;
>         sizes[0] =3D size;
> diff --git a/drivers/media/platform/ti/davinci/vpif_display.c b/drivers/m=
edia/platform/ti/davinci/vpif_display.c
> index f8ec2991c667..9dbab1003c1d 100644
> --- a/drivers/media/platform/ti/davinci/vpif_display.c
> +++ b/drivers/media/platform/ti/davinci/vpif_display.c
> @@ -115,6 +115,7 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>         struct channel_obj *ch =3D vb2_get_drv_priv(vq);
>         struct common_obj *common =3D &ch->common[VPIF_VIDEO_INDEX];
>         unsigned size =3D common->fmt.fmt.pix.sizeimage;
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>
>         if (*nplanes) {
>                 if (sizes[0] < size)
> @@ -122,8 +123,8 @@ static int vpif_buffer_queue_setup(struct vb2_queue *=
vq,
>                 size =3D sizes[0];
>         }
>
> -       if (vq->num_buffers + *nbuffers < 3)
> -               *nbuffers =3D 3 - vq->num_buffers;
> +       if (q_num_bufs + *nbuffers < 3)
> +               *nbuffers =3D 3 - q_num_bufs;
>
>         *nplanes =3D 1;
>         sizes[0] =3D size;
> diff --git a/drivers/media/platform/ti/omap/omap_vout.c b/drivers/media/p=
latform/ti/omap/omap_vout.c
> index 4143274089c3..72ce903717d3 100644
> --- a/drivers/media/platform/ti/omap/omap_vout.c
> +++ b/drivers/media/platform/ti/omap/omap_vout.c
> @@ -944,10 +944,11 @@ static int omap_vout_vb2_queue_setup(struct vb2_que=
ue *vq,
>                                      struct device *alloc_devs[])
>  {
>         struct omap_vout_device *vout =3D vb2_get_drv_priv(vq);
> +       unsigned int q_num_bufs =3D vb2_get_num_buffers(vq);
>         int size =3D vout->pix.sizeimage;
>
> -       if (is_rotation_enabled(vout) && vq->num_buffers + *nbufs > VRFB_=
NUM_BUFS) {
> -               *nbufs =3D VRFB_NUM_BUFS - vq->num_buffers;
> +       if (is_rotation_enabled(vout) && q_num_bufs + *nbufs > VRFB_NUM_B=
UFS) {
> +               *nbufs =3D VRFB_NUM_BUFS - q_num_bufs;
>                 if (*nbufs =3D=3D 0)
>                         return -EINVAL;
>         }
> --
> 2.39.2
>
