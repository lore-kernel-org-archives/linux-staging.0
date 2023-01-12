Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 160DD79C9
	for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 15:02:45 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id bf43so28835970lfb.6
        for <linux-staging@lists.linux.dev>; Thu, 12 Jan 2023 07:02:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YHPdJqIq38+J4n8CN1cX0dFtD8Rvs4CgnEIDyi8KGdM=;
        b=Woe1qwgtFH7Jk41E81KSelxmDXOGMuHmgXn6VZV+usKWWZERy9NlA4O/8t7+hHGGfa
         OlkZmuSpKm0A+6UXmZ1n0aiH6yjGj0LhtVz+oEAbiGv1yqqIbsxD3VFJNPasbGrOv4p7
         dsZY2XqG+A5CDFFXfTx6enU6kcSjJxBuOLlv0Ct9+SCRrdkyZ5atqzmyZKv1xi/FfVTN
         uYfwCqASIh+xwjWvNiOU7vLc2yVt5yAgbt3kGH8DMmyfOniD5Shex3KPg9xbX6cV67pg
         WFqxIhzd2Ef6CB1DWOBq2aVPUq3P/NO9D0KVsn+bZY0a7wGfVOCsu8M8BomQd5KUSBM4
         dl9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHPdJqIq38+J4n8CN1cX0dFtD8Rvs4CgnEIDyi8KGdM=;
        b=BkWJpILmGlmiXwX5eC7FzB2rKHK2/EFWLUY5Wvke/meHT29VURyRBZjR1MpxtR9XtC
         U6FiPx5G7F6t/9hwFZdSRbA7umK7iBWhx7UqptlI6KQUf7q0RAEi8ogjYgOkSiatvfbE
         MCi7uxRjYKwDl9OmyTJ9Sa2OmNTRkiWMXSMwxy98b8E8VSG+vr9qPxD4xZag4KmdAIB+
         OuqepuksjMxI3FSR7zxHDT/O02DQaBnupGCr+NV6pebJbYpaxETNJ3fYtDG8JadHqvdl
         61miMfAZvjZbOzM/C2VOL3WIZk1tL48y02O5w9kT7tqWa+dPGT70b8La2OPK1k9KuTyf
         4gKw==
X-Gm-Message-State: AFqh2kq2EMJB/gAcJqr0WP/sFez+cWYxq4z/0zVUFPnT4XCVvJxhbM/V
	0OrT9nT4CYUqmFtEfWaqzI1Onn5LIj5+498ZQbGqFQ==
X-Google-Smtp-Source: AMrXdXvR1l36/qUwB1P+1UgWfgsNtjVZ4KPZcRod+KwbmrmOF3n+QPkLuOVKH18qwF4Pv5w3YUxBKrLQn+R8ZCn2uSg=
X-Received: by 2002:a05:6512:33cd:b0:4cb:3df9:b25f with SMTP id
 d13-20020a05651233cd00b004cb3df9b25fmr1748078lfg.653.1673535762952; Thu, 12
 Jan 2023 07:02:42 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230101-patch-series-v2-6-2-rc1-v2-0-fa1897efac14@collabora.com> <20230101-patch-series-v2-6-2-rc1-v2-5-fa1897efac14@collabora.com>
In-Reply-To: <20230101-patch-series-v2-6-2-rc1-v2-5-fa1897efac14@collabora.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Thu, 12 Jan 2023 12:02:31 -0300
Message-ID: <CAAEAJfDqXJf-UovhGnmN7FDY-skSu-x5Rgz+K2WVQP+PKUVbsQ@mail.gmail.com>
Subject: Re: [PATCH v2 05/12] staging: media: rkvdec: Add SPS structure to
 internal context
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev, 
	Jonas Karlman <jonas@kwiboo.se>, Alex Bee <knaerzche@gmail.com>, 
	Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
	Collabora Kernel-domain <kernel@collabora.com>, Robert Beckett <bob.beckett@collabora.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Andrzej Pietrasiewicz <andrzej.p@collabora.com>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Content-Type: text/plain; charset="UTF-8"

Hi Sebastian,

On Thu, Jan 12, 2023 at 9:56 AM Sebastian Fricke
<sebastian.fricke@collabora.com> wrote:
>
> Prepare storing the SPS structure for HEVC & H264 in the internal
> context of the rkvdec instance. This structure is used to figure out
> which capture queue format is appropriate for decoding.
>
> Signed-off-by: Sebastian Fricke <sebastian.fricke@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.h | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 633335ebb9c4..332126e7b812 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -105,6 +105,7 @@ struct rkvdec_ctx {
>         struct v4l2_ctrl_handler ctrl_hdl;
>         struct rkvdec_dev *dev;
>         void *priv;
> +       void *sps;

I don't really like re-caching the SPS in the context,
since all the controls are already stored in the context,
via the ctrl_handler.

See hantro_get_ctrl().

Duplicating state can lead to problems and even if we get it
right this time, will be hard to maintain.

Thanks,
Ezequiel

>  };
>
>  static inline struct rkvdec_ctx *fh_to_rkvdec_ctx(struct v4l2_fh *fh)
>
> --
> 2.25.1
