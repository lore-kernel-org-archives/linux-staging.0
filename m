Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B7A168
	for <linux-staging@lists.linux.dev>; Tue,  4 Jan 2022 20:46:34 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id q3so35532578qvc.7
        for <linux-staging@lists.linux.dev>; Tue, 04 Jan 2022 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=TWapPhsHYw3VtBoPQgmWd2yPfeI/3LTqvIBr/d8b8MA=;
        b=eUsY5bx0KaZNUWF69TH1bVVX0ClCrXV/8+zehGbpDu27aJz407/M4e2Y4oO8MIOE7C
         0IhQsaYyjYbs0Vkmg1EzpHEN3GCcHdTH0+zL0xg6fOm0sM2ZQf3IdvNYXu809V4ZyVM0
         UgKS4CzdHOCLvOPYyVY3+Z4hNGkHA28eSa8AI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=TWapPhsHYw3VtBoPQgmWd2yPfeI/3LTqvIBr/d8b8MA=;
        b=Pr3kbg5kFcZuRXOg3pFZDSQ3GsC9B1Z7gGnANWSjqlVxRP1t9BftlkzjtXvhCGdc4E
         9i13qdemIDZdMUC3tpS+l7aQxsmBFa2+yIoHZUtTd3J5W3iTocYrPk5bfLvbCa5C5rni
         lyR/C1dQ1dBHJNCEwffrgFovEe1JW/x2pnjM586kcKcnyw7ehtz120z2XqZbu1PYJ4PG
         wKAhiJnzhakjOL5GLZ++pRa0wAk9YEHue4bmC+OdGuje803VvH3V5Zp0EWU/2AyfjOZK
         BcM5uOek88Kq4v8RM9P/o08jykR/nftq+Y+imHtsE36qneKUIJJMWbM2r7pNm/i80ZMG
         YBzw==
X-Gm-Message-State: AOAM533LWigZZO7p2YWGHpjEiXPHu+87MK0u3E5oomVerls6+tWWVVO5
	kOhjD/PZKME5gckSOfRbEiX1DQ==
X-Google-Smtp-Source: ABdhPJyo5ioGOfzcQV1Z4+h5S/0pv/JabmELhbJt3jcNITsDgK8amivYK96uZOZM8l8bApMp2O6nqg==
X-Received: by 2002:a05:6214:c4f:: with SMTP id r15mr47994044qvj.22.1641329193040;
        Tue, 04 Jan 2022 12:46:33 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id bi9sm31266556qkb.60.2022.01.04.12.46.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Jan 2022 12:46:32 -0800 (PST)
Message-ID: <c78c7f1f-40bc-1d3a-744f-199a613c4af1@ieee.org>
Date: Tue, 4 Jan 2022 14:46:31 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v3] staging: greybus: audio: Check null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220104150628.1987906-1-jiasheng@iscas.ac.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20220104150628.1987906-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/4/22 9:06 AM, Jiasheng Jiang wrote:
> As the possible alloc failure of devm_kcalloc(), it could return null
> pointer.
> Therefore, 'strings' should be checked and return NULL if alloc fails to
> prevent the dereference of the NULL pointer.
> Also, the caller should also deal with the return value of the
> gb_generate_enum_strings() and return -ENOMEM if returns NULL.
> Moreover, because the memory allocated with devm_kzalloc() will be
> freed automatically when the last reference to the device is dropped,
> the 'gbe' in gbaudio_tplg_create_enum_kctl() and
> gbaudio_tplg_create_enum_ctl() do not need to free manually.
> But the 'control' in gbaudio_tplg_create_widget() and
> gbaudio_tplg_process_kcontrols() has a specially error handle to
> cleanup.
> So it should be better to cleanup 'control' when fails.
> 
> Fixes: e65579e335da ("greybus: audio: topology: Enable enumerated control support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>

This looks good to me.  Thanks for fixing things.

Reviewed-by: Alex Elder <elder@linaro.org>

> ---
> v3: Same code as v2, but remove the redundant message as requested.
> v2: Updated to use common error processing at the end of both
> gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols().
> ---
>   drivers/staging/greybus/audio_topology.c | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/staging/greybus/audio_topology.c b/drivers/staging/greybus/audio_topology.c
> index 1fc7727ab7be..6bba735d2e5c 100644
> --- a/drivers/staging/greybus/audio_topology.c
> +++ b/drivers/staging/greybus/audio_topology.c
> @@ -147,6 +147,9 @@ static const char **gb_generate_enum_strings(struct gbaudio_module_info *gb,
>   
>   	items = le32_to_cpu(gbenum->items);
>   	strings = devm_kcalloc(gb->dev, items, sizeof(char *), GFP_KERNEL);
> +	if (!strings)
> +		return NULL;
> +
>   	data = gbenum->names;
>   
>   	for (i = 0; i < items; i++) {
> @@ -655,6 +658,8 @@ static int gbaudio_tplg_create_enum_kctl(struct gbaudio_module_info *gb,
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -862,6 +867,8 @@ static int gbaudio_tplg_create_enum_ctl(struct gbaudio_module_info *gb,
>   	/* since count=1, and reg is dummy */
>   	gbe->items = le32_to_cpu(gb_enum->items);
>   	gbe->texts = gb_generate_enum_strings(gb, gb_enum);
> +	if (!gbe->texts)
> +		return -ENOMEM;
>   
>   	/* debug enum info */
>   	dev_dbg(gb->dev, "Max:%d, name_length:%d\n", gbe->items,
> @@ -1034,6 +1041,10 @@ static int gbaudio_tplg_create_widget(struct gbaudio_module_info *module,
>   			csize += le16_to_cpu(gbenum->names_length);
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> @@ -1183,6 +1194,10 @@ static int gbaudio_tplg_process_kcontrols(struct gbaudio_module_info *module,
>   			csize += le16_to_cpu(gbenum->names_length);
>   			control->texts = (const char * const *)
>   				gb_generate_enum_strings(module, gbenum);
> +			if (!control->texts) {
> +				ret = -ENOMEM;
> +				goto error;
> +			}
>   			control->items = le32_to_cpu(gbenum->items);
>   		} else {
>   			csize = sizeof(struct gb_audio_control);
> 

