Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A67D168
	for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 18:31:30 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id z14so16582624ljc.13
        for <linux-staging@lists.linux.dev>; Tue, 25 Jan 2022 10:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OlIBnpkTLBL6sH3W/KXcb2UEgw4pfOFIKhtFEyjrjXg=;
        b=FHIOwTMrIgkrHCmEbk0yOERz2+rKuWBQWNsU9Bdktyt5XpnW0LjleS/S/XQi8l6uGt
         03IeHKCGxGw3Z2tJ+ssmZQ1cYVVmWjsy1nkE+VjZ05Z2g72yZzSO71lefk/36q2L6mzr
         xTIGThNJw8EZz6dd2bLNK4Ff0Ldq05vSwJfrqAbSZZC9ZiVSDst1JBVgRK8NzvPmeesx
         wS5tJg+xaEBIZvhZjhW09UY20gQwlM5hTIMMfQsZ3dAwsXcoXPosqfRdPTez5qd4bwnb
         ZAeTPRaeVVKnqOQ17BoV5KavTeCb+WralSZgGk2fkjEpIpHBTAQnaRlVZxtBzSzEFJuz
         PQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OlIBnpkTLBL6sH3W/KXcb2UEgw4pfOFIKhtFEyjrjXg=;
        b=gzT9g/n4TJM3ox8ap+BUFwF5A0DWyYKyZXTFNWreYAEzicp4wW/ayb/ino+qaS/k3e
         YABBngJVMbRokImEdoCpkncwqLq+cT34kDtXOvX2UBgI4wCVm7h4fbkyaGCLzL5b8YDB
         F6M4nQ/mPNGfnRgHNfveOenRhX78rFzF1evf8GQ5Wn3tFf8qVTBe4MA2ZSLSgaEgyFR7
         dmeJrtQH3JiI37U31+BjHFxpR7yPYsyhwoVeT4Qm1wyO+HNhoqU0XbJXzcpc3QmSqVqx
         kVvyl53hVSk6/bIW+ke22/9lGoyvY5ymgGBqUtYRre7bmOIoXeKuzvBO4JmMCDOH7/k4
         eeOQ==
X-Gm-Message-State: AOAM530n90Kcozuer6tbMi13cum9mCijEgDtnO79sPFjOTa4DML2sZob
	m+RBWT9n1f+I6IL5vVKww98=
X-Google-Smtp-Source: ABdhPJzMETM7h/HoAr3mua4MEe+7OlBNZZ024HhjTIEUx+vZgj5sSn7S1MbNXwqVzy/XYnwYAxHWgQ==
X-Received: by 2002:a2e:80cb:: with SMTP id r11mr6131870ljg.359.1643135488614;
        Tue, 25 Jan 2022 10:31:28 -0800 (PST)
Received: from [192.168.1.11] ([94.103.227.208])
        by smtp.gmail.com with ESMTPSA id h6sm490020ljg.58.2022.01.25.10.31.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Jan 2022 10:31:28 -0800 (PST)
Message-ID: <f766f910-4f7c-d3b5-d7a8-4d0d9de33a66@gmail.com>
Date: Tue, 25 Jan 2022 21:31:27 +0300
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 03/10] staging: r8188eu: remove DBG_88E calls from
 core/rtw_mlme_ext.c
Content-Language: en-US
To: Phillip Potter <phil@philpotter.co.uk>, gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com, Larry.Finger@lwfinger.net,
 straube.linux@gmail.com, martin@kaiser.cx, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20220124224415.831-1-phil@philpotter.co.uk>
 <20220124224415.831-4-phil@philpotter.co.uk>
From: Pavel Skripkin <paskripkin@gmail.com>
In-Reply-To: <20220124224415.831-4-phil@philpotter.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Phillip,

On 1/25/22 01:44, Phillip Potter wrote:
> Remove all DBG_88E calls from core/rtw_mlme_ext.c, including the commented
> one, as they do not conform to kernel coding standards and are
> superfluous. Also restructure where appropriate to remove no longer needed
> code left behind by removal of these calls. This will allow the eventual
> removal of the DBG_88E macro itself.
> 
> Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
> ---

[code snip]

>   static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
> @@ -7141,18 +6905,11 @@ static u8 chk_ap_is_alive(struct adapter *padapter, struct sta_info *psta)
>   static void rtl8188e_sreset_linked_status_check(struct adapter *padapter)
>   {
>   	u32 rx_dma_status =  rtw_read32(padapter, REG_RXDMA_STATUS);
> -	u8 fw_status;
>   
> -	if (rx_dma_status != 0x00) {
> -		DBG_88E("%s REG_RXDMA_STATUS:0x%08x\n", __func__, rx_dma_status);
> +	if (rx_dma_status != 0x00)
>   		rtw_write32(padapter, REG_RXDMA_STATUS, rx_dma_status);
> -	}
>   
> -	fw_status = rtw_read8(padapter, REG_FMETHR);
> -	if (fw_status == 1)
> -		DBG_88E("%s REG_FW_STATUS (0x%02x), Read_Efuse_Fail !!\n", __func__, fw_status);
> -	else if (fw_status == 2)
> -		DBG_88E("%s REG_FW_STATUS (0x%02x), Condition_No_Match !!\n", __func__, fw_status);
> +	rtw_read8(padapter, REG_FMETHR);
>   }

Unused read. Can be dropped



With regards,
Pavel Skripkin
