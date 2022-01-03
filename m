Received: from mail-io1-f51.google.com (mail-io1-f51.google.com [209.85.166.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91776168
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 15:10:07 +0000 (UTC)
Received: by mail-io1-f51.google.com with SMTP id q5so40657074ioj.7
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 07:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7vX8Xs6yuF4bAbb+cl7aqLiAFhp683mddogy8O4dZf0=;
        b=LOmdBmoMyP60/34RWbBhPFvj+qfUNtKPaav4Fy0PQOCv71jGZeK9dvo4eNgpyyPGrF
         JXmSwTrXFhaS8O8YF7rspq3lE5qRdAPAqMfkoQi8Qe940J9X8hfg6ZPSwIabQM2r0t5z
         wgrkHqE8Du89yofxo7dsElJq8xH+nOvr5ZYdk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7vX8Xs6yuF4bAbb+cl7aqLiAFhp683mddogy8O4dZf0=;
        b=wPYCYbgVA99Smva0LtbGw/k4gjRkKNlzATsd77up3rkEldmbYvuMHuEku92ZHF8Q/K
         MoW/3ZU80auWciv8VviW7w120PWttd+55gklxsAY1jqp63OYLSiVZDhU8GYdwDBdRXmq
         fxmXTUOXE4ybJBA8KmfW1l1avVitPSjpz+5Up4StWxYd7kd6uHHnMQ5Eo+YZPzX2q/4M
         udKYIFfw4aAVmJkqTZY6XLDaWOokjFFfNbWoWvnrccBvz4MB5NZcZMSwijnP3sZtbuRS
         yHv6yP3tqCPozAba9AL+B8ouuXGRQhOtlCNx31IIR1lTmMPF7urCd9y7biLPHLV7XFzi
         dzpw==
X-Gm-Message-State: AOAM533UAVY0RF3Z0NqctWkANNNT/rUDzZH/FKqOn7hp53NFjFiUmOQU
	IwU9Qg/1ckQk68H9spvhFM2SgQ==
X-Google-Smtp-Source: ABdhPJxiiEagwdO5otYjsdmUXYWUK6kG4VMRdc8pOQTdjrgtTk5MxJALe+qugo3OU+j3SNnmxOFMhQ==
X-Received: by 2002:a02:c60e:: with SMTP id i14mr15449276jan.207.1641222606591;
        Mon, 03 Jan 2022 07:10:06 -0800 (PST)
Received: from [172.22.22.4] (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.googlemail.com with ESMTPSA id u24sm22829037ior.20.2022.01.03.07.10.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Jan 2022 07:10:06 -0800 (PST)
Message-ID: <c81067a4-e8d7-6514-079d-283f14d6c5ba@ieee.org>
Date: Mon, 3 Jan 2022 09:10:05 -0600
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2] staging: greybus: audio: Check null pointer
Content-Language: en-US
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, vaibhav.sr@gmail.com,
 mgreer@animalcreek.com, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20211229022850.1682897-1-jiasheng@iscas.ac.cn>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <20211229022850.1682897-1-jiasheng@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/28/21 8:28 PM, Jiasheng Jiang wrote:
> On Tue, Dec 28, 2021 at 10:50:22PM +0800, Alex Elder wrote:
>> But the two places you're returning are in the middle of a loop (in
>> gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols()).
>> Each is building up a sort of hierarchical data structure, and as
>> you can see, the existing code takes care to de-construct the partially
>> built structure in the event an error occurs before it completes.
>>
>> There is a chance that your simple return would "work", but by
>> reading the surrounding code you should recognize that the proper
>> way to handle the error is to jump to the cleanup at the end.
> 
> Yes, I agree with your opinion and this time I use "goto error" instead
> of directly return in the two callers.
> The new patch is as follow.
> 
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

I haven't really looked at this yet, but in any case I would like
you to send version 3 of this patch.

The reason is that you should not include the message above in
the patch itself.

To be clear, I really appreciate your response; please *do* respond
to review comments.  But do so in e-mail only, and then follow up
with a new patch, using the same basic subject (with a new version)
and (roughly) the same description.

So your patch should have a subject line with v3.  It should then
contain the original description (not indented with ">>" or anything),
updated or improved if appropriate to reflect the current state of
the patch.  Then, below the "---" line you should include a patch
history, with a line or two describing each version.  For example,
it might look something like:

---
v3:  Same code as v2, but fixed description as requested.
v2:  Updated to use common error processing at the end of both
      gbaudio_tplg_create_widget() and gbaudio_tplg_process_kcontrols().

I will review version 3, and if I don't see anything else wrong with
it I'll offer a "Signed-off-by" tag.

					-Alex

> Fixes: e65579e335da ("greybus: audio: topology: Enable enumerated control support")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---
> Changelog:
> 
> v1 -> v2
> 
> *Change 1. Add the cleanup process when alloc fails in two callers and
> refine the commit message.
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

