Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 865833204
	for <linux-staging@lists.linux.dev>; Tue,  3 May 2022 14:49:22 +0000 (UTC)
Received: by mail-oi1-f169.google.com with SMTP id z8so18420090oix.3
        for <linux-staging@lists.linux.dev>; Tue, 03 May 2022 07:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=L88EHtQ6nEd2T7lOrwIfVWNdp4VhbNintMvDvOLss8Q=;
        b=ORflvvEwfGsYDuH3xu13w2z6La7dFK0pcvzJHprpjjZDa7UOodm2NbKomhn0ZxHAv/
         WeE/Ng3JKryVEH1P+hAiDezRt5zKgpCZFB8g9ORQIIDosgtqZCbSX44tUWWNkJadZB+/
         f01px+Cg1VZ51LCys1DxkiAGuzIUWsIkAu5kSVwDPiBpmSCQrsc9Wp/cSw9zB0DZW/r2
         x0RJRXQJtbf49AAbQ/BfojEXpX68Og4gQffmpy/hrwZE0bRI2eZudc34eUEzTMEiAow7
         NXiA9f5U22R7Ln9pfvBUI+tMK2+425HiEAEphIOSfl/avuv1WHc1jpnEDZOYcXLFF6KN
         zihQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=L88EHtQ6nEd2T7lOrwIfVWNdp4VhbNintMvDvOLss8Q=;
        b=EfIdY6mI1+hF5jOWBeCBpwwxWlE3cYgrRPeAwQZ0Cmcu6nuOgBxWiq0hgk4SYTpUSq
         YI6cRKow9GUD/+8oGbcW3iBdVmIP02pTksoOKGuxMI3S7UAgCYqN7J5oBe+bVeaeti9J
         5hT/QRyIJS2hmcW1NLgIB09mny2bvHG8q/r/1zvf97DkKaUGYX8CxrSv7H2G39U67HqS
         vIZYKBFU2tQ6/nXE1xibt4qEVoKqT/tNk+CJPHLMhmEOFee91Um4N94yUa9eUrfjL6rc
         RVVQCwZRQZvQLd+mWS1JqAlJT2HowUx4NqCjVnYWF6rZ4pZaGQhTB3Uuc6tnOaJ5Flfk
         P2mQ==
X-Gm-Message-State: AOAM533xd9Z1b2HI45wM/iWBxlMfi8OtjCv4pdUS8hpRGTZeWN9N+JNV
	8pmXW7q6+LyhtsZrpT5vpEEaIw==
X-Google-Smtp-Source: ABdhPJw8xg+KsB8XzF+qTHUK9MDA9KrMrs/SF3SF90jBoUxSXf+/VSVFqz3qHdYKPaSfEzX/l0ykMA==
X-Received: by 2002:a05:6808:56b:b0:325:9f5e:3fd4 with SMTP id j11-20020a056808056b00b003259f5e3fd4mr1978437oig.199.1651589361547;
        Tue, 03 May 2022 07:49:21 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id o20-20020a0568080bd400b00325cda1ffafsm1707597oik.46.2022.05.03.07.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 May 2022 07:49:21 -0700 (PDT)
Date: Tue, 3 May 2022 11:49:15 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Benjamin Gaignard <benjamin.gaignard@collabora.com>
Cc: p.zabel@pengutronix.de, mchehab@kernel.org, gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	jon@nanocrew.net, aford173@gmail.com, kernel@collabora.com
Subject: Re: [PATCH v3] media: hantro: HEVC: unconditionnaly set
 pps_{cb/cr}_qp_offset values
Message-ID: <YnFA6z0VxUdF6zht@eze-laptop>
References: <20220503135529.683474-1-benjamin.gaignard@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220503135529.683474-1-benjamin.gaignard@collabora.com>

On Tue, May 03, 2022 at 03:55:29PM +0200, Benjamin Gaignard wrote:
> Always set pps_cb_qp_offset and pps_cr_qp_offset values in Hantro/G2
> register whatever is V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT
> flag value.
> The vendor code does the case to set these values.
> This fix conformance test CAINIT_G_SHARP_3.
> 

Another silly nitpick: s/fix/fixes.

> Fluster HEVC score is increase by one with this patch.
> 
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
>  		hantro_reg_write(vpu, &g2_max_cu_qpd_depth, 0);
>  	}
>  
> -	if (pps->flags & V4L2_HEVC_PPS_FLAG_PPS_SLICE_CHROMA_QP_OFFSETS_PRESENT) {
> -		hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> -		hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
> -	} else {
> -		hantro_reg_write(vpu, &g2_cb_qp_offset, 0);
> -		hantro_reg_write(vpu, &g2_cr_qp_offset, 0);
> -	}
> +	hantro_reg_write(vpu, &g2_cb_qp_offset, pps->pps_cb_qp_offset);
> +	hantro_reg_write(vpu, &g2_cr_qp_offset, pps->pps_cr_qp_offset);
>  
>  	hantro_reg_write(vpu, &g2_filt_offset_beta, pps->pps_beta_offset_div2);
>  	hantro_reg_write(vpu, &g2_filt_offset_tc, pps->pps_tc_offset_div2);
> -- 
> 2.32.0
> 
