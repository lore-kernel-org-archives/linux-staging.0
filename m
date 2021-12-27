Received: from mail-io1-f41.google.com (mail-io1-f41.google.com [209.85.166.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC46429CA
	for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 15:54:12 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id l3so17160795iol.10
        for <linux-staging@lists.linux.dev>; Mon, 27 Dec 2021 07:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=4nhEpPFb9f/KxFDUNJZMjBH0SecR/8ItM0JLV6alDWA=;
        b=VEW7iVwZaV+70e1kn1ZfCs1sBrp8cmXhclmP3j6EB3mE+bH5nAfMXzJhCzznrfLTYV
         lg5T0jFOZrshWWXQvsFiFwJepG+UEW+sCnuZGurmgRXRhKGpdR9b9Mc0DfAuW3c5yu7f
         +tzNmu/VUcVbQMF4NIFHfOugzoAuJqEdEhino=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=4nhEpPFb9f/KxFDUNJZMjBH0SecR/8ItM0JLV6alDWA=;
        b=1vaAwjo4zUO4xw2vMOUnU6e+f7uOMJPhKPZN9TDaXaf2EXBAXA+PiKojxPJ7Enb5YL
         hPxZvBlY7HGhDIz7Dlzj9eI7cbR++g2p9MivCA7+Ap7fXlnZdmDaNig4O9QbFLBOlhlx
         /cZtLsLy6VFkmIKPfAkr13q5eCGhHG+r01EfnEiArlIP7JjRkrvAttTxuW6Gnqxvlipr
         t08dUYnwrk32cL2UC+cgk9zAmXNRllLqiplyS708xxj26DOS8FCRd+K3gqu8Dpl/hxNA
         9rMi2Fe73zoVfzMp/gCWRvatVZHfNt9ZSrhjQVgoAkP6E8YeICHcf8jvO9kV5vKAsAS2
         6mTw==
X-Gm-Message-State: AOAM531rBoc8Spp9XAqlqU+fex7m4Cg6HVhw6gkLJqI9HsvG9UxIFsI7
	67VKhm5/d0olX8DNtRFYlww6zg==
X-Google-Smtp-Source: ABdhPJwxtnwdN4vCn2tLYxRBQbV4gwU6190yxMKezIqaORxdoUjBt8Ezz+sg5tHX+5SEdX7JYbn2qA==
X-Received: by 2002:a02:cf23:: with SMTP id s3mr7411164jar.201.1640620451807;
        Mon, 27 Dec 2021 07:54:11 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id f2sm5132365iow.33.2021.12.27.07.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Dec 2021 07:54:11 -0800 (PST)
Message-ID: <91f92fda-e8cf-c96d-26b2-56a860ac7cf1@ieee.org>
Date: Mon, 27 Dec 2021 09:54:10 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH] staging: greybus: audio: Check null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211224090336.1612305-1-jiasheng@iscas.ac.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20211224090336.1612305-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/24/21 3:03 AM, Jiasheng Jiang wrote:
> As the possible alloc failure of devm_kcalloc, it could return null
> pointer.
> To prevent the dereference of the null pointer, it should be checked.

I think this is a good change, but I would like you to improve
the description, and fix some different bugs introduced by your
change.

What you are specifically doing is checking for a null return
from devm_kcalloc() in gb_generate_enum_strings(), and are
returning the NULL pointer if that occurs.  That means you
need to update all the callers of gb_generate_enum_strings()
to also handle a possible null return value.

The fix does a good thing, and your description is correct
about what you are fixing.  But it should supply more
complete context for the change.

More below.

> Fixes: e65579e335da ("greybus: audio: topology: Enable enumerated control support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
>   drivers/staging/greybus/audio_topology.c | 18 ++++++++++++++++++
>   1 file changed, 18 insertions(+)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 1fc7727ab7be..e9f47a1f0d28 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -146,7 +146,11 @@ static const char **gb_generate_enum_strings(struct gbaudio_module_info *gb,
>   	__u8 *data;
>   
>   	items = le32_to_cpu(gbenum->items);
> +
>   	strings = devm_kcalloc(gb->dev, items, sizeof(char *), GFP_KERNEL);
> +	if (!strings)
> +		return NULL;
> +
>   	data = gbenum->names;
>   
>   	for (i = 0; i < items; i++) {
> @@ -654,7 +658,10 @@ static int gbaudio_tplg_create_enum_kctl(struct gbaudio_module_info *gb,
>   
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
> +
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -861,7 +868,10 @@ static int gbaudio_tplg_create_enum_ctl(struct gbaudio_module_info *gb,
>   
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
> +
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -1032,8 +1042,12 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>   			csize += offsetof(struct gb_audio_ctl_elem_info, value);
>   			csize += offsetof(struct gb_audio_enumerated, names);
>   			csize += le16_to_cpu(gbenum->names_length);
> +
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts)
> +				return -ENOMEM;
> +

You can't simply return here.  If you look a bit above this,
where the call to allocate a control structure is done, you
see that a NULL return there jumps to the "error" label, so
any already allocated and initialized control widgets get
cleaned up before returning.

>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> @@ -1181,8 +1195,12 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>   			csize += offsetof(struct gb_audio_ctl_elem_info, value);
>   			csize += offsetof(struct gb_audio_enumerated, names);
>   			csize += le16_to_cpu(gbenum->names_length);
> +
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts)
> +				return -ENOMEM;
> +

You have basically the same issue here.  You can't just return,
you must do some cleanup too.

					-Alex

>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> 

