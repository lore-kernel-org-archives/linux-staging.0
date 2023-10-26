Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132EE38FA0
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 18:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ieee.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ieee.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ieee.org header.i=@ieee.org header.b="eFnWNiO/"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6ce2d4567caso741374a34.2
        for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 11:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1698344287; x=1698949087; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0Zrdmi0PlCbzd03QyeNEy+ZQ9+9RTjcBkZ1MibcLC6s=;
        b=eFnWNiO/Wq8IraReL1w5dBkvFOsqyp110Sg/EBhyLLShTPc9rZ+a78GF96h8oPkPWk
         GBnINSjdPAQTQ/f22SpFadJvnaOoBS6WvRYMs9KWMoWUiI813/XiAMOu/64tLAsHxMB+
         NeYVLmDB4340Ke8bLhDcHXg30bLBPs3Gybi1A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698344287; x=1698949087;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Zrdmi0PlCbzd03QyeNEy+ZQ9+9RTjcBkZ1MibcLC6s=;
        b=ICF1JC5lqZtIwIU6cm+fLdFvmkBzhbyThXzTxbAdVDn+uQmkMeDd3Bhcem50lMpCSU
         emvTSnjKMZKBuKjuhx9SaSf6U+e3W+EajAY2PpojfH15wWDluR+MCrWX0XL2hjlICmC5
         blhu6HZdaea5Wtr0GaTn15MXvmhfHIs1f0lnPQtA818oz7Oi2C9Kh2QBnlpn7oo1VDP7
         1qeyslRwT9h65LBVzFyApimH37zPJ12QWv9TnKD2AKsG/O9dafWlVoecWWMBosr9hLRM
         rG8+ZxMAqJxVtxLrKjZG0iHjOLDM0TfGmAW0BGqEoUZZeeGfNrLL0iSri1FFNKEZwiGd
         yUew==
X-Gm-Message-State: AOJu0YwOyJhtNSxSWsdl7J+bT/H4WLwwQ9E17/ELP8q8FRgIh65RJIGB
	0PfdMGtBaBnKbUA1WKGnZKToYg==
X-Google-Smtp-Source: AGHT+IEhH9iVCLpzD7q41stWzYUMoDwk7Inn9AfGlPa4LLttvZiBlDsYRkt/rVnmVZRzHuZbvXTnNg==
X-Received: by 2002:a05:6830:3d0e:b0:6c0:7bab:3457 with SMTP id eu14-20020a0568303d0e00b006c07bab3457mr173489otb.20.1698344287106;
        Thu, 26 Oct 2023 11:18:07 -0700 (PDT)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id x144-20020a4a4196000000b00581f11e81c7sm607913ooa.7.2023.10.26.11.18.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Oct 2023 11:18:06 -0700 (PDT)
Message-ID: <7703f20b-60e1-4140-8380-5a5157bc49b0@ieee.org>
Date: Thu, 26 Oct 2023 13:18:04 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] staging: greybus: camera: Alignment should match
 open parenthesis
Content-Language: en-US
To: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>,
 Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
 Alex Elder <elder@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
References: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
 <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <d2630a16ff9eca40b03dcade63c197fdd5e5b78f.1697976302.git.nandhakumar.singaram@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/22/23 7:15 AM, Nandha Kumar Singaram wrote:
> Adhere to linux coding style. Reported by checkpatch.pl:
> CHECK: Alignment should match open parenthesis

Generally, the result of this patch in isolation looks OK.
But when you compare it with your next patch, what you're
doing here becomes inconsistent with the indentation used
for the function arguments there.

There is value in consistency as advocated by checkpatch,
but there's also value in consistency within a single
source file.

I'd stay away from these white space changes.

					-Alex

> Signed-off-by: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
> ---
>   drivers/staging/greybus/camera.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
> index ae49e37a87e9..6516e7efaab9 100644
> --- a/drivers/staging/greybus/camera.c
> +++ b/drivers/staging/greybus/camera.c
> @@ -220,7 +220,7 @@ static int gb_camera_operation_sync_flags(struct gb_connection *connection,
>   }
>   
>   static int gb_camera_get_max_pkt_size(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp)
> +				      struct gb_camera_configure_streams_response *resp)
>   {
>   	unsigned int max_pkt_size = 0;
>   	unsigned int i;
> @@ -378,8 +378,8 @@ struct ap_csi_config_request {
>   #define GB_CAMERA_CSI_CLK_FREQ_MARGIN		150000000U
>   
>   static int gb_camera_setup_data_connection(struct gb_camera *gcam,
> -		struct gb_camera_configure_streams_response *resp,
> -		struct gb_camera_csi_params *csi_params)
> +					   struct gb_camera_configure_streams_response *resp,
> +					   struct gb_camera_csi_params *csi_params)
>   {
>   	struct ap_csi_config_request csi_cfg;
>   	struct gb_connection *conn;
> @@ -783,8 +783,8 @@ static ssize_t gb_camera_op_capabilities(void *priv, char *data, size_t len)
>   }
>   
>   static int gb_camera_op_configure_streams(void *priv, unsigned int *nstreams,
> -		unsigned int *flags, struct gb_camera_stream *streams,
> -		struct gb_camera_csi_params *csi_params)
> +					  unsigned int *flags, struct gb_camera_stream *streams,
> +					  struct gb_camera_csi_params *csi_params)
>   {
>   	struct gb_camera *gcam = priv;
>   	struct gb_camera_stream_config *gb_streams;

