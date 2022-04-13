Received: from mail-io1-f44.google.com (mail-io1-f44.google.com [209.85.166.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9B128FF
	for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 12:48:05 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id h63so1684863iof.12
        for <linux-staging@lists.linux.dev>; Wed, 13 Apr 2022 05:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=9jPZG9/+m97btsIbUfBFkqEN0JQ7wZ3+b8nQQ/RX0/U=;
        b=QBoFY5ec7cTEQSifRW8FUGrkedVgwRZQotcNk3yipnOF3lhr9Pcn4eFZ9Puuwt97s9
         uXvcFWEzJ2ok1oCj6cpgUqFryCjxuO3hPjWQrNyMdJDmwZw2HOQrGwO1anN03ZPZZR65
         VSUM5TcLIQTgDrKFO1rlFgqmx4H88Sn4OPrXo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=9jPZG9/+m97btsIbUfBFkqEN0JQ7wZ3+b8nQQ/RX0/U=;
        b=5ohxRIF5IgegJXfvbh8qO6hAefoSKO9gBDcn/w/wq2zYT1o9iWcuyjMcJCUv1CDxoX
         Wmu9loOgoYK5YT7MuroHNDvICPHeUymZVqe6pWFmhWtA32HwSBi77nDql6AWioTiWzbK
         xacEYEmbc5/rG+W3kTDB4hdmX1QQ8V1jRKU62kI8y28SSwsyU/o8IL/0wqfSGTA6iKki
         iibY79Bw6ol64YyaroO8iyuVpE2TXLRqOF4QF2ghscMILgTc1a82ioruh6ASJIuU5rKp
         SbVTfi2oaYtlu1ux+W1fysGvOgW2hOHaqxAKlZyOKY1SsilplF7po0szW4F9MvFwxBCa
         vjpA==
X-Gm-Message-State: AOAM532kArPog0QdGJuuyN9xf7RfFGYAlL63ddMMdRBk54Ly4rsCBxk/
	fsJYfmmnfctGLvHl2Rs1W0r6tw==
X-Google-Smtp-Source: ABdhPJwcDwROpz/UfIELVwrdwOuvg76PG0BW+jpB2S6XlS8+0l+GjJIkxkMWI7DdRYklftWbiiTamQ==
X-Received: by 2002:a02:271f:0:b0:326:af4:3f0c with SMTP id g31-20020a02271f000000b003260af43f0cmr11290770jaa.300.1649854085065;
        Wed, 13 Apr 2022 05:48:05 -0700 (PDT)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id x186-20020a6bc7c3000000b00648deae6630sm24343335iof.54.2022.04.13.05.48.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Apr 2022 05:48:04 -0700 (PDT)
Message-ID: <a4e5c567-63dd-f7de-114b-a357075444a2@ieee.org>
Date: Wed, 13 Apr 2022 07:48:03 -0500
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3 2/2] staging: greybus: remove empty callback function
Content-Language: en-US
To: Jaehee Park <jhpark1013@gmail.com>, johan@kernel.org
Cc: elder@kernel.org, gregkh@linuxfoundation.org,
 greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org, outreachy@lists.linux.dev,
 Dan Carpenter <dan.carpenter@oracle.com>
References: <cover.1649824370.git.jhpark1013@gmail.com>
 <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <12037ae2502ad7d0311bcdf2178c3d2156293236.1649824370.git.jhpark1013@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/12/22 11:38 PM, Jaehee Park wrote:
> Remove the optional remove callback for the soc_codec_dev_gbaudio
> structure. The only place it is referenced is
> snd_soc_component_remove() which is only called if the sound_component
> pointer is non-null. The null function pointers here can be optionally
> ommitted. When a sound component is registered this way, the remove
> callback is optional. We can safely remove the whole gbcodec_remove
> function, which used to be an empty function with a void return type.

Now I think your description is a little long...  But that's OK.

This looks good to me.  Thank you for responding to all our
feedback.

Reviewed-by: Alex Elder <elder@linaro.org>
> 
> Suggested-by: Dan Carpenter <dan.carpenter@oracle.com>
> Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
> ---
>   drivers/staging/greybus/audio_codec.c | 8 --------
>   1 file changed, 8 deletions(-)
> 
> diff --git a/drivers/staging/greybus/audio_codec.c b/drivers/staging/greybus/audio_codec.c
> index 0f50d1e51e2c..dc030caa64ba 100644
> --- a/drivers/staging/greybus/audio_codec.c
> +++ b/drivers/staging/greybus/audio_codec.c
> @@ -1029,12 +1029,6 @@ static int gbcodec_probe(struct snd_soc_component *comp)
>   	return 0;
>   }
>   
> -static void gbcodec_remove(struct snd_soc_component *comp)
> -{
> -	/* Empty function for now */
> -	return;
> -}
> -
>   static int gbcodec_write(struct snd_soc_component *comp, unsigned int reg,
>   			 unsigned int value)
>   {
> @@ -1049,8 +1043,6 @@ static unsigned int gbcodec_read(struct snd_soc_component *comp,
>   
>   static const struct snd_soc_component_driver soc_codec_dev_gbaudio = {
>   	.probe	= gbcodec_probe,
> -	.remove	= gbcodec_remove,
> -
>   	.read = gbcodec_read,
>   	.write = gbcodec_write,
>   };

