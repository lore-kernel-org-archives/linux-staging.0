Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83BAD442A
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 21:52:33 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id e18so9721646wmq.3
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 14:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=ZVBClz5UADw6p4i5ntN20pjVh1R1K58JMXf5poyJ0TE=;
        b=D+f5kF/lruQpccq2kmjY/yT7kpdvZo3qQ8z3rCDa7gNGURB2GOvcfbNyFgTHiU5z+E
         4lnQ1YdCXks61vvBHtY1hTnaXwTrVFVRVjXpNKrIpUFEp3Us6jIfbUdo9itVUy3TWVFt
         TxVmdB2JdyNidYhTmYAFs4PpaH3bt/+dHPckmICd7kKx1rPGfCdIF/Yft6I2KtfIQW0V
         9hyordTaGIQawokeGu9D2bZdonOtG55/hjnC5vQ0KRunis5UKGTy6/slYHF6ZGsrmSfi
         dbrvNoIARpLw+aHE3k2ZvVQEoecO57WxaIdqSGkyw5vugBPMaVvvlJbZA0dud0K9SZw8
         njyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=ZVBClz5UADw6p4i5ntN20pjVh1R1K58JMXf5poyJ0TE=;
        b=h/OfxrTZF8gMHVjNGozFLintd6Q7LvTPuu89efQIZte8q4ZiZqvZv4T80GYkRo782Y
         x3dLVhjDOa+/f3YgAQGZd78//4l9fcFUO4hoeU8rLa4baSCDl2KdOGYtnbccQoFPiLVN
         wHebSBuOD5MSMgSw6SzwnbEnTSWqThyVLUAo3W6lKlNgem7N1rgOMek5tlQc8TaTLTog
         WawkanBEBUb58H3D8V7CaAf5Zz3GdqoqE34yYhJa0RfEi/wRAn4Zqv8lTdmMVuRCRcDx
         uP4O63zvnmAWgm+1Ct/9+3AsqKby8aY1xoh7Z2WY2htmIfHU8JFhaiB1f5w8eQbIu4Vt
         C9uQ==
X-Gm-Message-State: ACrzQf0JTxu89eZcJJF7uAb87cj6yJ9F1YOB+Bop65sG2dzRNxczfVa+
	MpcMcn4y3gPXJGvrn5C+8fA=
X-Google-Smtp-Source: AMsMyM4IaXLlycOx8nSl/t/NWDycCOUpefXZFEszSVjHBGG1WlmhpAZ8MJCbVA2dYr31O1kJfrdr6g==
X-Received: by 2002:a05:600c:ace:b0:3b4:621f:93f4 with SMTP id c14-20020a05600c0ace00b003b4621f93f4mr1191707wmr.8.1664920351710;
        Tue, 04 Oct 2022 14:52:31 -0700 (PDT)
Received: from [192.168.0.210] (cpc154979-craw9-2-0-cust193.16-3.cable.virginm.net. [80.193.200.194])
        by smtp.googlemail.com with ESMTPSA id t66-20020a1c4645000000b003b4a699ce8esm89001wma.6.2022.10.04.14.52.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 14:52:31 -0700 (PDT)
Message-ID: <b9ef993d-dd37-05da-9095-e27c403ce1ab@gmail.com>
Date: Tue, 4 Oct 2022 22:52:29 +0100
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] media: atomisp: Fix spelling mistake "modee" -> "mode"
Content-Language: en-US
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004161336.155337-1-colin.i.king@gmail.com>
 <73a3969a-d821-f3ee-78ce-df2fedefecdb@gmail.com>
From: "Colin King (gmail)" <colin.i.king@gmail.com>
In-Reply-To: <73a3969a-d821-f3ee-78ce-df2fedefecdb@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04/10/2022 22:25, Philipp Hortmann wrote:
> On 10/4/22 18:13, Colin Ian King wrote:
>> There is a spelling mistake in a literal string. Fix it.
>>
>> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
>> ---
>>   .../media/atomisp/pci/css_2401_system/host/pixelgen_private.h   | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git 
>> a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h 
>> b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h 
>>
>> index 1c7938d8ccb5..8f79424bedb2 100644
>> --- 
>> a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h 
>>
>> +++ 
>> b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h 
>>
>> @@ -161,7 +161,7 @@ STORAGE_CLASS_PIXELGEN_C void 
>> pixelgen_ctrl_dump_state(
>>                state->syng_stat_fcnt);
>>       ia_css_print("Pixel Generator ID %d syng stat done  0x%x\n", ID,
>>                state->syng_stat_done);
>> -    ia_css_print("Pixel Generator ID %d tpg modee  0x%x\n", ID, 
>> state->tpg_mode);
>> +    ia_css_print("Pixel Generator ID %d tpg mode  0x%x\n", ID, 
>> state->tpg_mode);
>>       ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,
>>                state->tpg_hcnt_mask);
>>       ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,
> 
> 
> This is typically to pedantic for a patch.
> 
> You can fix same type of issues at one time. Do not make your patch to 
> long.
> 
> Use checkpatch.
> 
> Bye Philipp
> 
> 
> ./scripts/checkpatch.pl --file 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
> CHECK: Lines should not end with a '('
> #32: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:32: 
> 
> +STORAGE_CLASS_PIXELGEN_C hrt_data pixelgen_ctrl_reg_load(
> 
> WARNING: please, no spaces at the start of a line
> #33: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:33: 
> 
> +    const pixelgen_ID_t ID,$
> 
> WARNING: please, no spaces at the start of a line
> #34: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:34: 
> 
> +    const hrt_address reg)$
> 
> CHECK: Lines should not end with a '('
> #38: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:38: 
> 
> +    return ia_css_device_load_uint32(PIXELGEN_CTRL_BASE[ID] + reg * 
> sizeof(
> 
> CHECK: Lines should not end with a '('
> #46: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:46: 
> 
> +STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_reg_store(
> 
> WARNING: please, no spaces at the start of a line
> #47: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:47: 
> 
> +    const pixelgen_ID_t ID,$
> 
> WARNING: please, no spaces at the start of a line
> #48: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:48: 
> 
> +    const hrt_address reg,$
> 
> WARNING: please, no spaces at the start of a line
> #49: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:49: 
> 
> +    const hrt_data value)$
> 
> CHECK: Lines should not end with a '('
> #69: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:69: 
> 
> +STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_get_state(
> 
> WARNING: please, no spaces at the start of a line
> #70: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:70: 
> 
> +    const pixelgen_ID_t ID,$
> 
> WARNING: please, no spaces at the start of a line
> #71: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:71: 
> 
> +    pixelgen_ctrl_state_t *state)$
> 
> CHECK: Lines should not end with a '('
> #133: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:133: 
> 
> +STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(
> 
> WARNING: please, no spaces at the start of a line
> #134: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:134: 
> 
> +    const pixelgen_ID_t ID,$
> 
> WARNING: please, no spaces at the start of a line
> #135: FILE: 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:135: 
> 
> +    pixelgen_ctrl_state_t *state)$
> 
> total: 0 errors, 9 warnings, 5 checks, 184 lines checked
> 
> NOTE: For some of the reported defects, checkpatch may be able to
>        mechanically convert to the typical style using --fix or 
> --fix-inplace.
> 
> drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h has 
> style problems, please review.
> 
> NOTE: If any of the errors are false positives, please report
>        them to the maintainer, see CHECKPATCH in MAINTAINERS.
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$


So for a simple 1 char change I need to clean up everything else that is 
legacy cruft that checkpatch warns about.

I'll decline. I just wanted to correct a simple typo, I've never faced 
this kind of extra work to do in the past 3900+ patches I've submitted.  :-(

Colin
