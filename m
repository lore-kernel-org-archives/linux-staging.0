Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE67442A
	for <linux-staging@lists.linux.dev>; Tue,  4 Oct 2022 21:26:00 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id v22so3707926ejw.8
        for <linux-staging@lists.linux.dev>; Tue, 04 Oct 2022 14:26:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FA4LJWdiwYUEQsx68E+G6s7HzhTzaIPGCaPF+TV8Qms=;
        b=nuTI2cTf7rh4rxtd35UMwIcE/tST/2WEsxB9L0/3zf4V/GhsDhy+71ShviDnFxnI0F
         IdxbIYeF60fY3/eBeGq8k5beQMKU2x700bPm9uvNS1SWrQCZGRHpvH3xAbeS+j7ZmOQN
         QfhWZRzl6XJA9RsuSIdx8JPWJapDkG7JcGX78iCpPGJh86Wx+XWkBA1/NToMxwbihq85
         l8PezBpz4hOPjn4vRTg4JEyd9PXuYqfoB2XxDPWUF/nXvHUknL2qEcw6APwEesqYMnua
         1MpELQd9B0FS2sUKhzfxNuSb+Zw/Y2oP56OFvF8YQjxq6/Edv0Lr4k8FQHek4EZwCKnm
         hmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FA4LJWdiwYUEQsx68E+G6s7HzhTzaIPGCaPF+TV8Qms=;
        b=ZrHRVuttV9WZCh80Cx0AcmSp3NO0ewJJJu41fzu9MUBVHciNXSOlZ5X35Q8Kj7ySiU
         8v9prIHLb8A5+JZydd5Fk9+oDmbbBpH8/+gqqsJ9H9GxsBw+OV1HMv4bPw1ZCM555dbQ
         RmfkaRhy4f91/3e/OtRBB0vgolGlFuI+3y/F0lwNT/1SKR/oPj13YSCcRbrrp+Mw24RJ
         kYWz8V8XWRAiAM4NV1ae+zFR/mgWQczQrK/vbZk96jR5ZBsFJGIqbKhm3jrx3KUqhGGd
         g4aUE+KSpHRovfVZ0+D1Z4mOyVZlbT5qNtRMsFVA9pdIbLcLcst7rWUQgWMELnZSPWzn
         1GMg==
X-Gm-Message-State: ACrzQf3qIFIa+bsZsqi7M3LkR3UCvqjHznRdUcDf/Gq3CfJW+NOhYvnS
	DOkbEHzgeo81x9o8XcQQhkE=
X-Google-Smtp-Source: AMsMyM7KRFs1FZFUalci1ZrB0YChDhtfJ/86PyDNo1/1sDBN2bRLxk1uomsFJUHvH4/Q3t3AQcXOTw==
X-Received: by 2002:a17:907:7ea1:b0:782:8016:f67b with SMTP id qb33-20020a1709077ea100b007828016f67bmr21314451ejc.188.1664918758749;
        Tue, 04 Oct 2022 14:25:58 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f3e:6a06:125d:3a8d:82a2:428d? (p200300c78f3e6a06125d3a8d82a2428d.dip0.t-ipconnect.de. [2003:c7:8f3e:6a06:125d:3a8d:82a2:428d])
        by smtp.gmail.com with ESMTPSA id ky9-20020a170907778900b0073ddff7e432sm7729334ejc.14.2022.10.04.14.25.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Oct 2022 14:25:57 -0700 (PDT)
Message-ID: <73a3969a-d821-f3ee-78ce-df2fedefecdb@gmail.com>
Date: Tue, 4 Oct 2022 23:25:56 +0200
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
To: Colin Ian King <colin.i.king@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-media@vger.kernel.org, linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221004161336.155337-1-colin.i.king@gmail.com>
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20221004161336.155337-1-colin.i.king@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/4/22 18:13, Colin Ian King wrote:
> There is a spelling mistake in a literal string. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
> ---
>   .../media/atomisp/pci/css_2401_system/host/pixelgen_private.h   | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
> index 1c7938d8ccb5..8f79424bedb2 100644
> --- a/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
> +++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
> @@ -161,7 +161,7 @@ STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(
>   		     state->syng_stat_fcnt);
>   	ia_css_print("Pixel Generator ID %d syng stat done  0x%x\n", ID,
>   		     state->syng_stat_done);
> -	ia_css_print("Pixel Generator ID %d tpg modee  0x%x\n", ID, state->tpg_mode);
> +	ia_css_print("Pixel Generator ID %d tpg mode  0x%x\n", ID, state->tpg_mode);
>   	ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,
>   		     state->tpg_hcnt_mask);
>   	ia_css_print("Pixel Generator ID %d tpg hcnt mask  0x%x\n", ID,


This is typically to pedantic for a patch.

You can fix same type of issues at one time. Do not make your patch to long.

Use checkpatch.

Bye Philipp


./scripts/checkpatch.pl --file 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h
CHECK: Lines should not end with a '('
#32: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:32:
+STORAGE_CLASS_PIXELGEN_C hrt_data pixelgen_ctrl_reg_load(

WARNING: please, no spaces at the start of a line
#33: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:33:
+    const pixelgen_ID_t ID,$

WARNING: please, no spaces at the start of a line
#34: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:34:
+    const hrt_address reg)$

CHECK: Lines should not end with a '('
#38: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:38:
+	return ia_css_device_load_uint32(PIXELGEN_CTRL_BASE[ID] + reg * sizeof(

CHECK: Lines should not end with a '('
#46: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:46:
+STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_reg_store(

WARNING: please, no spaces at the start of a line
#47: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:47:
+    const pixelgen_ID_t ID,$

WARNING: please, no spaces at the start of a line
#48: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:48:
+    const hrt_address reg,$

WARNING: please, no spaces at the start of a line
#49: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:49:
+    const hrt_data value)$

CHECK: Lines should not end with a '('
#69: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:69:
+STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_get_state(

WARNING: please, no spaces at the start of a line
#70: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:70:
+    const pixelgen_ID_t ID,$

WARNING: please, no spaces at the start of a line
#71: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:71:
+    pixelgen_ctrl_state_t *state)$

CHECK: Lines should not end with a '('
#133: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:133:
+STORAGE_CLASS_PIXELGEN_C void pixelgen_ctrl_dump_state(

WARNING: please, no spaces at the start of a line
#134: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:134:
+    const pixelgen_ID_t ID,$

WARNING: please, no spaces at the start of a line
#135: FILE: 
drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h:135:
+    pixelgen_ctrl_state_t *state)$

total: 0 errors, 9 warnings, 5 checks, 184 lines checked

NOTE: For some of the reported defects, checkpatch may be able to
       mechanically convert to the typical style using --fix or 
--fix-inplace.

drivers/staging/media/atomisp/pci/css_2401_system/host/pixelgen_private.h has 
style problems, please review.

NOTE: If any of the errors are false positives, please report
       them to the maintainer, see CHECKPATCH in MAINTAINERS.
kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$
