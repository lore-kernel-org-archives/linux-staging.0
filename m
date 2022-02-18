Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD8428E2
	for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 14:54:00 +0000 (UTC)
Received: by mail-qv1-f49.google.com with SMTP id f19so15173677qvb.6
        for <linux-staging@lists.linux.dev>; Fri, 18 Feb 2022 06:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20210112.gappssmtp.com; s=20210112;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=AMxb1/snu2ldA/ubJJEAYt1WVb3/09SyAfGJTEa/UKQ=;
        b=Fgz90lidrUWx8l9/L+dip/BnxqYGQh6NwgzlB66sPD48dp7ZS+wyGTykM1quRiiwCK
         Q3ZYwz1Z+E/dKHgKgkNkOw0THEQ70be8BD6HxmlwRbAQlf/Onle4QuK2Q1X2YjYScZb1
         Rw+h/B+ErAD0GMCl5cJJyNZSzInCV/TPEJh+2OF6EcmPGOAH0+D/XJrnjLwiFuqvI+AT
         ajOSwwvowFnB2e96OcEIECaDhyGL1UKz4wywrx6dF4/u9aDNUvMTOsfycj5W9XEs5k27
         +C525sy9IXwMGSiYSUKd2oll0mJXowpW7I1TzH1F+KEDgv9OX9e3VzgU0PktJjfavLI9
         fS1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=AMxb1/snu2ldA/ubJJEAYt1WVb3/09SyAfGJTEa/UKQ=;
        b=qJNnxAejMVOtlNkfH2uFbxeYCwxpaLxr2nI7AfxyY9hgLyxJEHMJXWC4PY02oChyYb
         yzr4WcTVKZQcGCrR5oUpAgii6lMRVHvoIfVyXnHSKQGHDmxAwLTMGzcTUFmhwQwpK8JW
         kTLaINlbxN7niH2fCzPTswd8/xQ5wKtp+fJOooClxFC1bddiJKgCjCXTWpZdh72jPVwt
         6DcElIgQM9RClaOFJRjhO5oi4z4G+LFAHueXqsW/AjII4eC2pA03Dus6fyCQm/Adex++
         foXJKLOOBkLvHx3f8wgwdWpV6+Pa1UN4AsV9aeMGFc0JsWM+efnqK/STM16yE+jSLzEM
         ZpPQ==
X-Gm-Message-State: AOAM530Hf4CMNkhWZucmHQqkJc865yP/QsKPKKe2HBBvkjxLwFjPNtdb
	77ZVIOHJofIFuGqU6epKqYae+m2xVeVfUEmN
X-Google-Smtp-Source: ABdhPJwhFNB8fLdh0ym9XWrA9EZ9+ejd6mCNse+81XslSzMhPYs9F3LauZqXUMfLhfpDArU2+f7pUA==
X-Received: by 2002:a05:6214:d03:b0:42c:ce43:9f8b with SMTP id 3-20020a0562140d0300b0042cce439f8bmr5926290qvh.102.1645196039402;
        Fri, 18 Feb 2022 06:53:59 -0800 (PST)
Received: from nicolas-tpx395.localdomain (173-246-12-168.qc.cable.ebox.net. [173.246.12.168])
        by smtp.gmail.com with ESMTPSA id a188sm876860qkf.27.2022.02.18.06.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Feb 2022 06:53:59 -0800 (PST)
Message-ID: <419d47d2dfac0b31d48e2ce3b4128c421f808038.camel@ndufresne.ca>
Subject: Re: [PATCH] media: cedrus: h264: Fix neighbour info buffer size
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Jernej Skrabec <jernej.skrabec@gmail.com>, mripard@kernel.org, 
	paul.kocialkowski@bootlin.com
Cc: mchehab@kernel.org, wens@csie.org, gregkh@linuxfoundation.org, 
	hverkuil-cisco@xs4all.nl, linux-media@vger.kernel.org, 
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Date: Fri, 18 Feb 2022 09:53:57 -0500
In-Reply-To: <20220214190839.707889-1-jernej.skrabec@gmail.com>
References: <20220214190839.707889-1-jernej.skrabec@gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.42.3 (3.42.3-1.fc35) 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Le lundi 14 février 2022 à 20:08 +0100, Jernej Skrabec a écrit :
> According to BSP library source, H264 neighbour info buffer size needs
> to be 32 kiB for H6. This is similar to H265 decoding, which also needs
> double buffer size in comparison to older Cedrus core generations.
> 
> Increase buffer size to cover H6 needs. Since increase is not that big
> in absolute numbers, it doesn't make sense to complicate logic for older
> generations.
> 
> Issue was discovered using iommu and cross checked with BSP library
> source.
> 
> Fixes: 6eb9b758e307 ("media: cedrus: Add H264 decoding support")
> Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
>  drivers/staging/media/sunxi/cedrus/cedrus_h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> index b4173a8926d6..d8fb93035470 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus_h264.c
> @@ -38,7 +38,7 @@ struct cedrus_h264_sram_ref_pic {
>  
>  #define CEDRUS_H264_FRAME_NUM		18
>  
> -#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(16 * SZ_1K)
> +#define CEDRUS_NEIGHBOR_INFO_BUF_SIZE	(32 * SZ_1K)
>  #define CEDRUS_MIN_PIC_INFO_BUF_SIZE       (130 * SZ_1K)
>  
>  static void cedrus_h264_write_sram(struct cedrus_dev *dev,

