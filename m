Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637067C
	for <linux-staging@lists.linux.dev>; Sat,  2 Apr 2022 11:34:01 +0000 (UTC)
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-e1e5e8d9faso137242fac.4
        for <linux-staging@lists.linux.dev>; Sat, 02 Apr 2022 04:34:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vanguardiasur-com-ar.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=V3U+5UMiJybq7zY98DwsaSNVhzwSmjvGiJkV3X+RFBM=;
        b=24BPX8VpvHlBMEx6hIWdtAG/9S/+iyZLlr/QAmp0Z+5yWJiGHzFhq/uIQdxSKyVYCP
         enPRmYoZkbFQcW1HpQH8zrb3IRM4d0hYNTbwxbVgEBdL6AG2jt0/HSVAt9robgILFabJ
         hPkLvUch+hB8OPL87o/mqnhm3QiZhrMUfdzGNvgyVWrVhnz/AJhfBVlruRn8eWEQNGCu
         c4w8zQ0s4CUgcN34kZe+uGnqzOnVLeqA0YDWuGn26R8g+72dBvLyMw/s+cjtb5JCtN0k
         NvTn7x2fWQ5Jv/xStKL7yXif078NOV/iO9/fHaI5S9fhUpkKVvCwnsGEVqWwzqQuIz4I
         iIPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=V3U+5UMiJybq7zY98DwsaSNVhzwSmjvGiJkV3X+RFBM=;
        b=v+JoigWz7SzGYwz5pEpQ9WzVmA4OZYZ1OI9kXGBZjTVZ/xajk3cLMdfI91Vp94YLoa
         FJwycYGRVxObl2C+VKRQ77dxmDN32ON7P8ZrnifG5RWzzHWQLmk7nS+c88ZOuMjD7I4S
         V9eMUy3Nbf0Qi21rwp5530YWBWj7NqmlCFDwxgVESHj5ouiJzP6CqTqokPGoeDZ2dPpl
         S+I7/GiXliD7wkedrNCa7uswhY+NfxdzV5+f1cctb4kQGskO+6iSDkmQsZS93Zwzgv2P
         sDIAnb5MYEbO5rWrUsJgudxoDUTnlLUF6mQtq1VzHPJ6IbB9jsIiIMd0fqx0UFBPbo8V
         AnPw==
X-Gm-Message-State: AOAM5306/fdgxQBVOrTfXt+7L8yXczFPx+aKDQQirWHerXsL8hvzmcyq
	bKOYhO82+4ihPRIMq32U2JIZsw==
X-Google-Smtp-Source: ABdhPJy3rMJldwi8Tb/ncmzg6WyZ80EFa7bQd46QO9bii8Cw9gw35Jy6JhWEPjRky3sVVbphVckt4w==
X-Received: by 2002:a05:6870:3488:b0:de:eaa5:260b with SMTP id n8-20020a056870348800b000deeaa5260bmr6754153oah.281.1648899240576;
        Sat, 02 Apr 2022 04:34:00 -0700 (PDT)
Received: from eze-laptop ([2803:9800:98c2:8470:9f4:8e2a:88e5:ec01])
        by smtp.gmail.com with ESMTPSA id p16-20020a05680811d000b002d72ec3a921sm2098566oiv.21.2022.04.02.04.33.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:34:00 -0700 (PDT)
Date: Sat, 2 Apr 2022 08:33:54 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
	Ezequiel Garcia <ezequiel@collabora.com>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 16/23] media: rkvdec: h264: Fix reference frame_num
 wrap for second field
Message-ID: <Ykg0oqJOb/ExafB3@eze-laptop>
References: <20220331193726.289559-1-nicolas.dufresne@collabora.com>
 <20220331193726.289559-17-nicolas.dufresne@collabora.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220331193726.289559-17-nicolas.dufresne@collabora.com>

Hi Nicolas,

On Thu, Mar 31, 2022 at 03:37:18PM -0400, Nicolas Dufresne wrote:
> From: Jonas Karlman <jonas@kwiboo.se>
> 
> When decoding the second field in a complementary field pair the second
> field is sharing the same frame_num with the first field.
> 
> Currently the frame_num for the first field is wrapped when it matches the
> field being decoded, this cause issues to decode the second field in a
> complementary field pair.
> 
> Fix this by using inclusive comparison, less than or equal.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Ezequiel Garcia <ezequiel@collabora.com>
> Reviewed-by: Sebastian Fricke <sebastian.fricke@collabora.com>

To complete the Signed-off-by chain, can you add your Signed-off-by: at
the bottom?

Thanks,
Ezequiel

> ---
>  drivers/staging/media/rkvdec/rkvdec-h264.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/rkvdec/rkvdec-h264.c b/drivers/staging/media/rkvdec/rkvdec-h264.c
> index a42cf19bcc6d..730f8ebf7f58 100644
> --- a/drivers/staging/media/rkvdec/rkvdec-h264.c
> +++ b/drivers/staging/media/rkvdec/rkvdec-h264.c
> @@ -773,7 +773,7 @@ static void assemble_hw_rps(struct rkvdec_ctx *ctx,
>  			continue;
>  
>  		if (dpb[i].flags & V4L2_H264_DPB_ENTRY_FLAG_LONG_TERM ||
> -		    dpb[i].frame_num < dec_params->frame_num) {
> +		    dpb[i].frame_num <= dec_params->frame_num) {
>  			p[i] = dpb[i].frame_num;
>  			continue;
>  		}
> -- 
> 2.34.1
> 
