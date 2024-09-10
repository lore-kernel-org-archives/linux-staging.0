Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0E1C69D
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725994080; cv=none; b=Cor0IVRoSU1ttGMDZC86y0xxV4/uiVgzYa0EAIu7w2ER8L1TkJddrfMWqvvQ+NYjjV8QNU4i94bOXcReqAD1Qdqu+w2us8BoSD5IirwHBGE8qC8WQI8upI21q/nNgNqCNJbOPtBh6rndLTTrCMkeohR6j/JOrvjvAGScslgqQDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725994080; c=relaxed/simple;
	bh=+ky8oJg86wBPAINYFROJZlQQ78byoQ+FwPrYHQD8CTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oaClatmFZ3kKuS2MwNvqtNmAvtXOE8Z3CZZHXbrjVCTVe+38B94l+xfLLgbsE/Cs0aWegWfuR4bPLyR6jGi4+bnpbia7o3z6hlgH0AUg3YWQLMzmMklNjXKdUMfC4PJ+gBWfTW9IYMEsBsSajySkCK0jb9H49gTDnVHoeh3VlwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr+B9xUW; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr+B9xUW"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a8a789c4fc5so19872866b.0
        for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 11:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725994076; x=1726598876; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OWGrueiTQnytXcx9sWxLNLzaYhUD+bCBEfwG71GZFy0=;
        b=Vr+B9xUWz5xvY5KpdXqRUXpkTIW5hzm/QIXiZGREDsofQYKq/invZCC8BHQr3gVlXD
         Y0fyYuADR1+/K/dnN36OgrDkB7URP2PbdKZfTqKdWJX2gi3N/Gn3WvMYfCvGTSkkiY3Y
         1I+HAcJwY6K1s9dzNegy4lacIrszql7eiqoWtDm0sj62anR40HaU+gWz0A7z4rY1TB4k
         t71FYKTcvKXeLTK2uBrrasGWMaKhdEABxmv8IC0mKlMQxUjwsKD31g9Kjd2e5H4jZYFY
         ZfHxWnAVcFFyE9vXBIVDGAZGvrycM5wLCBHB1zUqWL5l078r42y8rRFRF3fs7Mvwmff9
         a6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725994076; x=1726598876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OWGrueiTQnytXcx9sWxLNLzaYhUD+bCBEfwG71GZFy0=;
        b=IU8oTMgJkm57+/Uee8AuoMtg4eSvJH13DNOIyL3qGCTsiIKlAMbt7e6x25YZg0mF7z
         si/UgGlATD7HwwDGejFkvNzCkcBkGun3UOKlsJSGdNPW0l4WHT5Ei57D3fCb0InmBZgA
         VJAXjqGKaxgyuU4rYEBJT16ONPQMkGMbFH8HeCiqgk6fi2PHZCoLF2VJy4xYjpo7wX4w
         e8PFjQpluO3mcmTn4Cd88BDbiwSmSFT4IUYBqY6dW7P1dLuLr06I5wQ7sqgl/xUjFsxH
         rtWLQ9+0CGSPXfUkJ0hPJ2vaQhewyBCCbYBDfkxkt1v+h2S8CBffzpttJ9jhhEZVQzV9
         TMMQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTJ6snXm0C0QYtV+8Oha0JOloBdrg3L4pYZmdNn4qDNhHoUNY/7bcyEDebRmLRvfQVmyPqxy1V2gAursrd@lists.linux.dev
X-Gm-Message-State: AOJu0Yw894ekjPW11n0MXU4xv3MHRXe++RqlLyOOcVqIn79e1jcOT5U5
	OyxKBFA0hhuhq1xvMQZbNNC3Cbv89a5Qvqq0cHVywtC8LzQ6Q4ZA
X-Google-Smtp-Source: AGHT+IFWS8gI/VbRAttr3tgAmThSzcMd3ve9EQNQkfiz/cP1NeU6Y/LYX9gj578tRX74nG+je8aRVQ==
X-Received: by 2002:a17:907:3f9b:b0:a86:8f9b:ef6e with SMTP id a640c23a62f3a-a8ffb212a62mr217542066b.13.1725994075635;
        Tue, 10 Sep 2024 11:47:55 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8583:6054:7e40:1de3:a91? (p200300c78f2a858360547e401de30a91.dip0.t-ipconnect.de. [2003:c7:8f2a:8583:6054:7e40:1de3:a91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a8d25c727fcsm512200166b.119.2024.09.10.11.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Sep 2024 11:47:55 -0700 (PDT)
Message-ID: <89893a22-5018-4ae0-b4f9-e473a36f09b6@gmail.com>
Date: Tue, 10 Sep 2024 20:47:54 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix coding style issues in the
 hal_pwr_seq.h
To: abid-sayyad <sayyad.abid16@gmail.com>, linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240910121144.635348-1-sayyad.abid16@gmail.com>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240910121144.635348-1-sayyad.abid16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 14:11, abid-sayyad wrote:
> Improving the code readability and coding style compliance of the code.
> Running checkpatch.pl on the file raised coding style warnings:
> -The comment block needs "*" on all lines of the block
> from line 8 to 26
> -Use tabs for indent
> on line 103 and 115
> 
> Applying the patch fixes these coding style issues and makes the code more
> readable/developer friendly.
> 
> Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
> ---

Hi Abid,

I cannot apply your patch. Are you using the right git repo?

git remote show origin
* remote origin
   Fetch URL: 
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
...
git branch -a
my branch: staging-testing


kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ mutt
Applying: staging: rtl8723bs: Fix coding style issues in the hal_pwr_seq.h
error: patch failed: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:101
error: drivers/staging/rtl8723bs/include/hal_pwr_seq.h: patch does not apply
Patch failed at 0001 staging: rtl8723bs: Fix coding style issues in the 
hal_pwr_seq.h

Please also change your Description. Concentrate on why this patch makes 
sense. Do not describe the patch. What is changed can be seen below. 
Please also use the correct time.

You can find accepted examples in the git repo.

Thanks for your support.

Bye Philipp



> changes since v1:
> v2: Fix the email body, amke it more informative
> link to v1:
> https://lore.kernel.org/all/ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com/
>   .../staging/rtl8723bs/include/hal_pwr_seq.h   | 46 +++++++++----------
>   1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> index 5e43cc89f535..10fef1b3f393 100644
> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> @@ -5,26 +5,26 @@
>   #include "HalPwrSeqCmd.h"
> 
>   /*
> -	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
> -	There are 6 HW Power States:
> -	0: POFF--Power Off
> -	1: PDN--Power Down
> -	2: CARDEMU--Card Emulation
> -	3: ACT--Active Mode
> -	4: LPS--Low Power State
> -	5: SUS--Suspend
> -
> -	The transition from different states are defined below
> -	TRANS_CARDEMU_TO_ACT
> -	TRANS_ACT_TO_CARDEMU
> -	TRANS_CARDEMU_TO_SUS
> -	TRANS_SUS_TO_CARDEMU
> -	TRANS_CARDEMU_TO_PDN
> -	TRANS_ACT_TO_LPS
> -	TRANS_LPS_TO_ACT
> -
> -	TRANS_END
> -*/
> + *	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
> + *	There are 6 HW Power States:
> + *	0: POFF--Power Off
> + *	1: PDN--Power Down
> + *	2: CARDEMU--Card Emulation
> + *	3: ACT--Active Mode
> + *	4: LPS--Low Power State
> + *	5: SUS--Suspend
> + *
> + *	The transition from different states are defined below
> + *	TRANS_CARDEMU_TO_ACT
> + *	TRANS_ACT_TO_CARDEMU
> + *	TRANS_CARDEMU_TO_SUS
> + *	TRANS_SUS_TO_CARDEMU
> + *	TRANS_CARDEMU_TO_PDN
> + *	TRANS_ACT_TO_LPS
> + *	TRANS_LPS_TO_ACT
> + *
> + *	TRANS_END
> + */
>   #define	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS	26
>   #define	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS	15
>   #define	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS	15
> @@ -101,7 +101,7 @@
>   	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
>   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
>   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
> -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
> +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
>   	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
>   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
>   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
> @@ -112,7 +112,7 @@
>   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
>   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
>   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
> -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
> +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
>   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
>   	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
>   	{0x0301, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*PCIe DMA start*/
> @@ -209,7 +209,7 @@
>   #define RTL8723B_TRANS_END															\
>   	/* format */																\
>   	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
> -	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
> +	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
> 
> 
>   extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
> --
> 2.39.2
> 

