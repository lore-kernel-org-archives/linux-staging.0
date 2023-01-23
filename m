Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A9F630
	for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 08:49:29 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id g10so8389856wmo.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Jan 2023 00:49:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=soja83e34c2eLz9845rol6k2LZ7cLCXqZuSiTiSx964=;
        b=SkRILWqFbm/CTcnfDATfLaDF5BJtzFA1CI607stoaDCCGOpOypRFQjEhH30g/INtaZ
         yyt8orlvR+kuPJQObM77e1o7AKF+IGdiPjQ5XAyqJqeyBJk/wr+2gbampd3Ekng3GNqr
         zt2wQ4Xr+mCyFehQdMguU/qA5p/N/wy7bcBs2kQ4NRrKwG1Skb2PmCJ8inlia+QZo0YB
         AafwA0QDa9PsoFhszpYa7aOiWAxDGgWrqv0jS1a+dZn0szQG0FVKyWNxP3PrhX0+31KU
         V41yWdPzLVE4labU5tdeOdb9SYajAJ1BIk57aQe1sDRQXtULIgSi9ZInbvDBxaUA7+Op
         mDWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :references:cc:to:subject:reply-to:from:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=soja83e34c2eLz9845rol6k2LZ7cLCXqZuSiTiSx964=;
        b=G+gmITCSHgRAcNfyA9pQdI5F7xBxkc7WKb4ry3qfEqlJolwm67soBh6l47oRyxujm/
         w6KsAQK7TtbI8pxyGoA86rDDoy/MwImEF5h3YJm8TYOm/uQFtdRs+eWSe2MRw68cxJxC
         rBRLVaKsnACDA86LWlvXQeVfZgSJMwoD3f5ZwTMIUfHvlpH20WHBVRSsEd/qBp4/Y79W
         4oK/D0CbNAFXiRSXwbEVfGXsvl0jx74Q8PasZw283+p6AteLh8alm2gwAD4G/bnRxHiI
         C414X1XC0hclvclM99Z0nSeThPSPl7qZ4+X/kWuYh/qHpXDFPbSPDZ4VQsvCN9c6jW8d
         i8Lw==
X-Gm-Message-State: AFqh2krQhKef2AgfqDhIHuymwld8OrNPE9WS9lH12tAqVa5Jey0xo/fT
	1i+6QeJ+W8VmmdTjO8V9csF/tg==
X-Google-Smtp-Source: AMrXdXvwi8oXyhzxtSXMDorQp5ZuNfEJhKBQoqpgabUgwuOh93L8qUifFWtwT3ydPwQM1NZM2ssqCg==
X-Received: by 2002:a1c:cc11:0:b0:3da:1d52:26b5 with SMTP id h17-20020a1ccc11000000b003da1d5226b5mr31095778wmb.14.1674463767626;
        Mon, 23 Jan 2023 00:49:27 -0800 (PST)
Received: from [192.168.7.111] (679773502.box.freepro.com. [212.114.21.58])
        by smtp.gmail.com with ESMTPSA id u13-20020a05600c19cd00b003cf71b1f66csm11144887wmq.0.2023.01.23.00.49.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jan 2023 00:49:27 -0800 (PST)
Message-ID: <6b4df841-6f8f-4c32-767c-8b8c34108272@linaro.org>
Date: Mon, 23 Jan 2023 09:49:26 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: neil.armstrong@linaro.org
Subject: Re: [PATCH] media: meson: vdec: remove redundant if statement
To: Christian Hewitt <christianshewitt@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-media@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Benjamin Roszak <benjamin545@gmail.com>
References: <20230123071708.2670751-1-christianshewitt@gmail.com>
Content-Language: en-US
Organization: Linaro Developer Services
In-Reply-To: <20230123071708.2670751-1-christianshewitt@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/01/2023 08:17, Christian Hewitt wrote:
> From: Benjamin Roszak <benjamin545@gmail.com>
> 
> Checking if sess->fmt_out->pixfmt is V4L2_PIX_FMT_VP9 was already done as a
> condition to enter the if statement where this additional check is made.
> 
> Signed-off-by: Benjamin Roszak <benjamin545@gmail.com>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> ---
>   drivers/staging/media/meson/vdec/esparser.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/media/meson/vdec/esparser.c b/drivers/staging/media/meson/vdec/esparser.c
> index 86ccc8937afc..7b15fc54efe4 100644
> --- a/drivers/staging/media/meson/vdec/esparser.c
> +++ b/drivers/staging/media/meson/vdec/esparser.c
> @@ -314,8 +314,7 @@ esparser_queue(struct amvdec_session *sess, struct vb2_v4l2_buffer *vbuf)
>   			num_dst_bufs = codec_ops->num_pending_bufs(sess);
>   
>   		num_dst_bufs += v4l2_m2m_num_dst_bufs_ready(sess->m2m_ctx);
> -		if (sess->fmt_out->pixfmt == V4L2_PIX_FMT_VP9)
> -			num_dst_bufs -= 3;
> +		num_dst_bufs -= 3;
>   
>   		if (esparser_vififo_get_free_space(sess) < payload_size ||
>   		    atomic_read(&sess->esparser_queued_bufs) >= num_dst_bufs)


Acked-by: Neil Armstrong <neil.armstrong@linaro.org>
