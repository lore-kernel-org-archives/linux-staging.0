Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C31B82C81
	for <linux-staging@lists.linux.dev>; Fri,  8 Oct 2021 15:48:44 +0000 (UTC)
Received: by mail-qk1-f172.google.com with SMTP id p4so9858287qki.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Oct 2021 08:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=l3PEMMPfXxjXjuD/So1WBTTo0/C4bwAxd2b6X1tJZs8=;
        b=hz44myI2e9hT99CcaOMwcPVlnQnJbFO3h/0o8xHijXj70TxjuCcD0tZhUCfCk+yqXz
         XwpMs5vk04TCBD7HIVSnK8kf3Oq8Lmo//xOzsYbLjIV3YvvJwK0a5EYvw7JnNvIsemUF
         yDUx2KPPhAHJ3l79xy2cohXDh3ykEIB4//OacdN6yUQgHVibPtocf3xiesR7r9zVkIpC
         G0DrmWqg+8xfpT8bFTI4MAurT4OTdlvhgjgmEwBmiDJ+Mw3vj7pkV0gHORF2lySeWuzp
         qSQmEAdEjCrR4XwB8MBDrKlKJz1OPqYArGJX4gtPSMnz/lzMutKV583HPAYyaYvlbRi6
         VSzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=l3PEMMPfXxjXjuD/So1WBTTo0/C4bwAxd2b6X1tJZs8=;
        b=cuyDG5khg8VelMGYKrJzFujX0QWQzUnta28KY2vQ/orgjb/wMgcSa6ZYrU1fZaFiVT
         1qDbZ9CKP7F2PW/Wtn5fReKSFDa6QC7gecOwBnqY3wvn1ZDzGkiQPro9kb/G3hSPoQss
         /IIDejQV0NOxJQsroqu3XjTMuODDD4CobLvZvxQHFz3oPF/zZRSKnCE/P70D/ik4gfP5
         kegdNI0X8/SPDDTnRzkqxxFyDnLoqi2cvv4JA358bYZHqhmbfKNbFwxI7sQqgjydhwpx
         0w/0oUXeJh5vFIk1PblWh77HiUtVUvQ/6H5tW62vPRcFTfDtNKO4wyDIJ2uPM00LA/9J
         LFhg==
X-Gm-Message-State: AOAM531fiVrKFLX0GPKUMIj9vd1X+6pwnPq5tnQsOEnRBzpedQ/2FQuZ
	Asgmqs5TOAs1QcUMcBGzu0qxzw==
X-Google-Smtp-Source: ABdhPJzY04tEl4nAarIutljMkJuT3pDnLioval4mb3+ZBoihi3Uh3E7RjIRdP27pTSBVzuYrLOLRfA==
X-Received: by 2002:a05:620a:4548:: with SMTP id u8mr3616083qkp.253.1633708123733;
        Fri, 08 Oct 2021 08:48:43 -0700 (PDT)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id y6sm2312972qkj.26.2021.10.08.08.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 08:48:43 -0700 (PDT)
Message-ID: <44b1a16754d9b44f98da5a02ae1b06bd7adcdcd3.camel@ndufresne.ca>
Subject: Re: [PATCH 1/2] media: rkvdec: Do not override sizeimage for output
 format
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Chen-Yu Tsai <wenst@chromium.org>, Ezequiel Garcia
 <ezequiel@vanguardiasur.com.ar>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, Andrzej Pietrasiewicz
 <andrzej.p@collabora.com>,  stable@vger.kernel.org
Date: Fri, 08 Oct 2021 11:48:42 -0400
In-Reply-To: <20211008100423.739462-2-wenst@chromium.org>
References: <20211008100423.739462-1-wenst@chromium.org>
	 <20211008100423.739462-2-wenst@chromium.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.40.4 (3.40.4-1.fc34) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le vendredi 08 octobre 2021 à 18:04 +0800, Chen-Yu Tsai a écrit :
> The rkvdec H.264 decoder currently overrides sizeimage for the output
> format. This causes issues when userspace requires and requests a larger
> buffer, but ends up with one of insufficient size.
> 
> Instead, only provide a default size if none was requested. This fixes
> the video_decode_accelerator_tests from Chromium failing on the first
> frame due to insufficient buffer space. It also aligns the behavior
> of the rkvdec driver with the Hantro and Cedrus drivers.
> 
> Fixes: cd33c830448b ("media: rkvdec: Add the rkvdec driver")
> Cc: <stable@vger.kernel.org>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index 76e97cbe2512..951e19231da2 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -1015,8 +1015,9 @@ static int rkvdec_h264_adjust_fmt(struct rkvdec_ctx *ctx,
>  	struct v4l2_pix_format_mplane *fmt = &f->fmt.pix_mp;
>  
>  	fmt->num_planes = 1;
> -	fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> -				      RKVDEC_H264_MAX_DEPTH_IN_BYTES;
> +	if (!fmt->plane_fmt[0].sizeimage)
> +		fmt->plane_fmt[0].sizeimage = fmt->width * fmt->height *
> +					      RKVDEC_H264_MAX_DEPTH_IN_BYTES;

Note that the test is more strict then the spec, since this behaviour is within
spec. But in general, the application may have more information about the
incoming stream, the maximum encoded frame size would even be encoded in the
container (which is parsed in userspace). So I agree it will be more flexible to
accept userspace desired size. If that size is too small, userspace will fail at
filling it in the first place, and decoding won't be possible, that's all.

Perhaps we could make a recommendation in that sense in the spec ?

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

>  	return 0;
>  }
>  


