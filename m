Received: from mail-oo1-f53.google.com (mail-oo1-f53.google.com [209.85.161.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FD01624
	for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 22:15:48 +0000 (UTC)
Received: by mail-oo1-f53.google.com with SMTP id 187-20020a4a09c4000000b004d8f3cb09f5so228678ooa.6
        for <linux-staging@lists.linux.dev>; Mon, 26 Dec 2022 14:15:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XUckakhK2YDfWvKB+vPGRiFS4B95mA3CWPNKe4m32vE=;
        b=mfqi0fGyCtEcfB2h/+lOc7iZKAzfGRM38qDX4ixBx6F+WRrpMGqbVFFDKlrbhU/n43
         NLCfgWYoW6Qgfzk2FEQ5k685jM2noRs/BsYV7FvZ+wBZQUlgO+3dI6lfc1QlPVYbTqsF
         CS2Vt3u0VNjHymZwJUKr3B3h5khXO90bTSLjjSiG+Kk+CMdH/FWEk/0zL3Gn1rDTrEsS
         7cOTgNtjJumF1jQ7Fjnno9E15UP3FXmhjqoYqOagnTv1f6wB1eGmMUR1Ikak+ohiCnpe
         HlxnRQPbIGXd82AdCL7A1dSg3l603RFIpwz/h2qseFzJbZ+FDy0O3TCnlRQzOJlVDHA8
         vcQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUckakhK2YDfWvKB+vPGRiFS4B95mA3CWPNKe4m32vE=;
        b=CEb9MZS+Y8SVBTKr7fcrYnS1fEZSe0fun9XQBMdMZXhZy8e7DAmE3H0Tnxk+l6hkTD
         IYIymBs2+ict2l8CIRUR55cAhT3yPjJx6Q/QrmmUh2xiJeG4XVxREFpC0nt+aF+GT824
         Z5786/FfgbzPLoHhy50FqMPvUwSjp0JK+SjvCe2rBMrmy6zk91u6aiu6eLF9jGq/DjUs
         Im2pCLZ1IHlnHFec1gk15VLFVtD7gIgQBKiwknLQAXhK3jpGbJZKtIIZjsoeA4rBj5Gu
         ZJuoet+U8FpzQPl4gVQnvrZOvhHRgxhurc+qVQNTaLl5dmIJHhxZDcIjgG8O/sjoU28y
         UBoQ==
X-Gm-Message-State: AFqh2krC/Hd1nR3S0NIlLWdnq72oHH67tAyZoYvmIIMj2zdwfxPWicKW
	QRKq5pJwFGmtTPJ/f99aydqV2A==
X-Google-Smtp-Source: AMrXdXvn3BXZiNw7vAUdU4u5D7tsVvCvwRwrfcrB5MW9EP+EYLbjcbtJMMSMuvpr0Oy+Z35K7WzUOQ==
X-Received: by 2002:a4a:98f1:0:b0:4a5:e527:77f8 with SMTP id b46-20020a4a98f1000000b004a5e52777f8mr8283003ooj.3.1672092948116;
        Mon, 26 Dec 2022 14:15:48 -0800 (PST)
Received: from eze-laptop ([190.11.62.130])
        by smtp.gmail.com with ESMTPSA id y12-20020a4a9c0c000000b004a09df5a1dbsm4776600ooj.8.2022.12.26.14.15.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Dec 2022 14:15:47 -0800 (PST)
Date: Mon, 26 Dec 2022 19:15:41 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] media: rkvdec: Add an ops to check for decode
 errors
Message-ID: <Y6odDbRNY7g+eKag@eze-laptop>
References: <20221223193807.914935-1-nicolas.dufresne@collabora.com>
 <20221223193807.914935-2-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221223193807.914935-2-nicolas.dufresne@collabora.com>

Hi Nicolas,

Thanks for the patch.

On Fri, Dec 23, 2022 at 02:38:03PM -0500, Nicolas Dufresne wrote:
> This optional internal ops allow each codec to do their own
> error status checking. The presence of an error is reported
> using the ERROR buffer state. This patch have no functional
> changes.
> 
> Signed-off-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> ---
>  drivers/staging/media/rkvdec/rkvdec.c | 10 ++++++----
>  drivers/staging/media/rkvdec/rkvdec.h |  2 ++
>  2 files changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec.c b/drivers/staging/media/rkvdec/rkvdec.c
> index 7bab7586918c1..7e76f8b728854 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.c
> +++ b/drivers/staging/media/rkvdec/rkvdec.c
> @@ -950,6 +950,7 @@ static void rkvdec_v4l2_cleanup(struct rkvdec_dev *rkvdec)
>  static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  {
>  	struct rkvdec_dev *rkvdec = priv;
> +	struct rkvdec_ctx *ctx;
>  	enum vb2_buffer_state state;
>  	u32 status;
>  
> @@ -958,12 +959,13 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
>  		VB2_BUF_STATE_DONE : VB2_BUF_STATE_ERROR;
>  
>  	writel(0, rkvdec->regs + RKVDEC_REG_INTERRUPT);
> -	if (cancel_delayed_work(&rkvdec->watchdog_work)) {
> -		struct rkvdec_ctx *ctx;
> +	ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
>  
> -		ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
> +	if (ctx->coded_fmt_desc->ops->check_error_info)
> +		state = ctx->coded_fmt_desc->ops->check_error_info(ctx);
> +
> +	if (cancel_delayed_work(&rkvdec->watchdog_work))
>  		rkvdec_job_finish(ctx, state);
> -	}
>  
>  	return IRQ_HANDLED;
>  }
> diff --git a/drivers/staging/media/rkvdec/rkvdec.h b/drivers/staging/media/rkvdec/rkvdec.h
> index 633335ebb9c49..4ae8e6c6b03c9 100644
> --- a/drivers/staging/media/rkvdec/rkvdec.h
> +++ b/drivers/staging/media/rkvdec/rkvdec.h
> @@ -73,6 +73,8 @@ struct rkvdec_coded_fmt_ops {
>  		     struct vb2_v4l2_buffer *dst_buf,
>  		     enum vb2_buffer_state result);
>  	int (*try_ctrl)(struct rkvdec_ctx *ctx, struct v4l2_ctrl *ctrl);
> +	/* called from IRQ handler */
> +	int (*check_error_info)(struct rkvdec_ctx *ctx);

I don't think it's a good idea to mix the return of this internal API
with enum vb2_buffer_state.

Please make the return type of this function a boolean or an integer
type that is decoupled from the VB2 buffer state.

Thanks!
Ezequiel

>  };
>  
>  struct rkvdec_coded_fmt_desc {
> -- 
> 2.38.1
> 
