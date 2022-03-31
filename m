Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BDB7C
	for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 20:15:37 +0000 (UTC)
Received: by mail-oi1-f174.google.com with SMTP id i7so692371oie.7
        for <linux-staging@lists.linux.dev>; Thu, 31 Mar 2022 13:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=6O6TQE9gY/RCGoA8Lj72Kezh8AhkaXWoFpitVHtqqC0=;
        b=mXBaYXFodB5BNYtQLsAi85UeIgUz+rJ8jR+IjiFZ7xdlENE8KMHvCXLuuZLNbwMwx2
         woFVXRWjONwaTsuJqBRZbtbssVAObJzulRjY/OOqYy5RVGQRFUuoj6VMHtyCP+iLwZVH
         AXRy5kqcp/yQ8DrLEinN4/hL3JYxoLGiDeQ62TnzGrMe9RPKG8OTEfDdW+L+ACVrzuZC
         hCHP05rd5gQYTbLk7gzcg0t/pR1vNhlgDDfZhEBo1gk03ccs7VWJCITWMFe8GHrJaGhB
         vWi9ZMT9l5ycdy5Co2CJd8cPoiy8xAQmIdtlDAd+PzlDjajTJC0+zPiAfeEF03DmSMFZ
         w+qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=6O6TQE9gY/RCGoA8Lj72Kezh8AhkaXWoFpitVHtqqC0=;
        b=AUOjYigxZubyJPmA25JyyVyoiiXodQgXv4Kk8IXKeErpZ4s73je39IX//rRWU2Iy8R
         emRHmXbj14/6QxEE7zz67Ym4G/FATDHjnvXXYHKUiurfwa+vaK1lB4vcrY79l0USNnhW
         8fQEhkUoZmQq6oil/LixRGEWAAwUpv5ncRKdp+IqEax/kkj4aur5/lSWP3E6rIXQVTVQ
         +mCSutXz4lv3CWjZbKT1krQ6x9OyMkWfv7vU7H74IdpKVsMvmYOoT82EEKYRZ1XZdUXf
         seMTwGKSZhg10/kWWyU5X9YIhGzJqp3oQ/VbeRdVZhsNBEVaMRLc1fwkqVk3Al2ZpG1i
         Qolg==
X-Gm-Message-State: AOAM5308mpp4he0ZPKiAZ1ovqf5lEiZs5rRdOuJDJtI8L40bhbg+LMa2
	bHPqfle41aXGm9twMLcPcQDk+w==
X-Google-Smtp-Source: ABdhPJz0dHz0S0Kxb6XfpeUoORZA029B4Og25ME2y94yefm5MksonaTie6pvHqTlUxRYIXLjV2cN7g==
X-Received: by 2002:a05:6808:ec5:b0:2f7:4019:53be with SMTP id q5-20020a0568080ec500b002f7401953bemr3370230oiv.176.1648757737012;
        Thu, 31 Mar 2022 13:15:37 -0700 (PDT)
Received: from eze-laptop ([190.194.87.200])
        by smtp.gmail.com with ESMTPSA id z10-20020a0568301daa00b005ce0f36dd81sm252391oti.12.2022.03.31.13.15.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 13:15:36 -0700 (PDT)
Date: Thu, 31 Mar 2022 17:15:31 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] media: hantro: Empty encoder capture buffers by default
Message-ID: <YkYL45bEwjS/1+Rs@eze-laptop>
References: <20220331084907.628349-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331084907.628349-1-wenst@chromium.org>

On Thu, Mar 31, 2022 at 04:49:06PM +0800, Chen-Yu Tsai wrote:
> The payload size for encoder capture buffers is set by the driver upon
> finishing encoding each frame, based on the encoded length returned from
> hardware, and whatever header and padding length used. Setting a
> non-zero default serves no real purpose, and also causes issues if the
> capture buffer is returned to userspace unused, confusing the
> application.
> 
> Instead, always set the payload size to 0 for encoder capture buffers
> when preparing them.
> 
> Fixes: 775fec69008d ("media: add Rockchip VPU JPEG encoder driver")
> Fixes: 082aaecff35f ("media: hantro: Fix .buf_prepare")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>

> ---
> 
> This was previously incorrectly squashed into my Hantro encoder cmd
> patch [1].
> 
> [1] https://lore.kernel.org/linux-media/20220301042225.1540019-1-wenst@chromium.org/
> 
>  drivers/staging/media/hantro/hantro_v4l2.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/hantro/hantro_v4l2.c b/drivers/staging/media/hantro/hantro_v4l2.c
> index 67148ba346f5..261beb0c40f6 100644
> --- a/drivers/staging/media/hantro/hantro_v4l2.c
> +++ b/drivers/staging/media/hantro/hantro_v4l2.c
> @@ -733,8 +733,12 @@ static int hantro_buf_prepare(struct vb2_buffer *vb)
>  	 * (for OUTPUT buffers, if userspace passes 0 bytesused, v4l2-core sets
>  	 * it to buffer length).
>  	 */
> -	if (V4L2_TYPE_IS_CAPTURE(vq->type))
> -		vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
> +	if (V4L2_TYPE_IS_CAPTURE(vq->type)) {
> +		if (ctx->is_encoder)
> +			vb2_set_plane_payload(vb, 0, 0);
> +		else
> +			vb2_set_plane_payload(vb, 0, pix_fmt->plane_fmt[0].sizeimage);
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.35.1.1021.g381101b075-goog
> 
