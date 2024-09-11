Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58A271ABED6
	for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 16:36:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726072610; cv=none; b=GgV35xtEJw5NkgEZ6QkKo53Ju86WZ32posVjMcdOcRQvGYRh4iHmZCWy0fWZNL9ij++NgWrkRdRMlvU7F/DCXws0ClfqGW5n03TD6UYyIijpDWTKq1iWWmI5Lhlj8V1G3v0wjftiyY9mgaeIrrJUvjj2IsGxmC8GVbFf0f4itjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726072610; c=relaxed/simple;
	bh=Y0B40j+6XfhANv86hO/y2jfsZpiCElizXindBwzyRU8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EOH4aS5tRzvbtOoffbZoq5zqmHAYQSMhZlBxBq+bo2QXjmn4acTp5a0f7jeAmcKSPOBlpj5zHQQP4P4ngPJEmJNn+vd74XnV1iWNBvc9di8+oAdffXUyow5+Qt+/T0Xfs0VowY3rXE1eelRoQtB/Y/xrtCbUM78e2SdnpB9WZRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kIpgZ7mA; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kIpgZ7mA"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-5c245c62362so8724763a12.0
        for <linux-staging@lists.linux.dev>; Wed, 11 Sep 2024 09:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726072606; x=1726677406; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vGFSZxbGGSwXr4tsYBH87dhImbiPRckhT6s8NPepfIw=;
        b=kIpgZ7mA69LXUBD6tD/eRtWIhiyv1Tud2tYQQ1jnX66b8Aho/ojgrC6ldO9P1J+QvL
         eOLg29AtuoiQT8F1DsHG3/r51zHRXLSK4ze3cYI2SQgQXXt8iRht7uGMDQEiNzqVOlYP
         BVk9nbNKikzEKgj5tUj1Cw178r7UrJ/T6keyt/vMNM/G2CmP6ni06v/wHw/7qiWgLoiv
         7p/dvuTra88AiMDPVXCg3dJ+PmENXe067zUasZOcwnJ7T4HkR7TSmB+R245wJLJt0SNk
         Ad3SBQvfr2xLa/KBttIXC2nlCOmv0tnE1WzsusCMv2yZ+6Sj8jy9K+OvQaFk2+oYEg99
         oIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726072606; x=1726677406;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vGFSZxbGGSwXr4tsYBH87dhImbiPRckhT6s8NPepfIw=;
        b=iZvHhxH1qXQ/rRpQof5/rDWcBSiD8ff3RrY+IGXUi8bIqxUDVf0ZmDnSjxTbGTaIwV
         ADxGWPRLGD4RpymNVBBPmpxt0r86uh2FXoJz1peYEYYdd8OCfsWIvG4TG0BAH9ZAFvrF
         nt3iFn3oRqERfjBEiQaZ+CJsRL9jSupSc2VPtBX9cAuITlUuLlS/D6suUeW+TtByycLx
         D6b5+Gb6qXX2+8GZ4DFATzxoToRj9Lzjo4gMgLd+cmxltZyvMOV2ex5MaOchsIM3vCqO
         9K0VubqQTbjAz/TUHEVgdTeJU6i617LPhJ2BGBJyC5GfI3Z9sndB/qXS9tolMndWdbKt
         ZnXw==
X-Gm-Message-State: AOJu0YyuOCvokgFFU3tbKH7Ipc2GQLjg/Y29V6sYvBAb/PHhiMuw+qb6
	/T6cRUmt3/6Hxkl/2SRTD4u2YfKPa53KDu3s6UWZvT2wes+RFQIA
X-Google-Smtp-Source: AGHT+IFB8LrmoJ77KXeUcOqmvYDxZrxZCXblK6guiGjjrd9zznVwaL7hH6w33YQENm1mdPtPPoNcbw==
X-Received: by 2002:a05:6402:3092:b0:5c0:8c5a:f4f3 with SMTP id 4fb4d7f45d1cf-5c413e4fb87mr33032a12.26.1726072605230;
        Wed, 11 Sep 2024 09:36:45 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8584:fadb:465e:486a:4871? (p200300c78f2a8584fadb465e486a4871.dip0.t-ipconnect.de. [2003:c7:8f2a:8584:fadb:465e:486a:4871])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5c3ebd4680esm5565368a12.21.2024.09.11.09.36.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Sep 2024 09:36:44 -0700 (PDT)
Message-ID: <93afc2fd-7aa2-41d5-bd08-2afc72540abb@gmail.com>
Date: Wed, 11 Sep 2024 18:36:44 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix coding style issues in the
 hal_pwr_seq.h
To: Sayyad Abid <sayyad.abid16@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
References: <20240910121144.635348-1-sayyad.abid16@gmail.com>
 <89893a22-5018-4ae0-b4f9-e473a36f09b6@gmail.com> <ZuCY1Tuog1sFHLBQ@debian>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <ZuCY1Tuog1sFHLBQ@debian>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/10/24 21:07, Sayyad Abid wrote:
> On Tue, Sep 10, 2024 at 08:47:54PM +0200, Philipp Hortmann wrote:
>> On 9/10/24 14:11, abid-sayyad wrote:
>>> Improving the code readability and coding style compliance of the code.
>>> Running checkpatch.pl on the file raised coding style warnings:
>>> -The comment block needs "*" on all lines of the block
>>> from line 8 to 26
>>> -Use tabs for indent
>>> on line 103 and 115
>>>
>>> Applying the patch fixes these coding style issues and makes the code more
>>> readable/developer friendly.
>>>
>>> Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
>>> ---
>>
>> Hi Abid,
>>
>> I cannot apply your patch. Are you using the right git repo?
>>
>> git remote show origin
>> * remote origin
>>    Fetch URL:
>> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
>> ...
>> git branch -a
>> my branch: staging-testing
>>
>>
>> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ mutt
>> Applying: staging: rtl8723bs: Fix coding style issues in the hal_pwr_seq.h
>> error: patch failed: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:101
>> error: drivers/staging/rtl8723bs/include/hal_pwr_seq.h: patch does not apply
>> Patch failed at 0001 staging: rtl8723bs: Fix coding style issues in the
>> hal_pwr_seq.h
>>
> I found the issue, I have been amending these changes on the mainline repo,
>    $ git remote show origin
> * remote origin
>    Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
> 
>    I need to clone the staging branch.
>> Please also change your Description. Concentrate on why this patch makes
>> sense. Do not describe the patch. What is changed can be seen below. Please
>> also use the correct time.
>>
> I did not understand the correct time here. could you please
> elaborate a little on this please.

Hi Abid,

please visit:

https://kernelnewbies.org/PatchPhilosophy#Patch_description_format_for_checkpatch_fixes

Look for this clause:
"In patch descriptions and in the subject, it is common and preferable 
to use present-tense, imperative language. Write as if you are telling 
git what to do with your patch. For example, instead of:"

This is about the time that should be used in patches.

Bye Philipp

>> You can find accepted examples in the git repo.
>>
> I'll look into the accepted patches right now. Meanwhile I have this question
> , descriptions addressing only the coding style issue fixes are acceptable or
> it needs to be having somethingelse too? (apologies in advance for
> this illy question)
>> Thanks for your support.
>>
>> Bye Philipp
>>
> Thank Youy for your feedbacks
>>
>>
>>> changes since v1:
>>> v2: Fix the email body, amke it more informative
>>> link to v1:
>>> https://lore.kernel.org/all/ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com/
>>>    .../staging/rtl8723bs/include/hal_pwr_seq.h   | 46 +++++++++----------
>>>    1 file changed, 23 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>>> index 5e43cc89f535..10fef1b3f393 100644
>>> --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>>> +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
>>> @@ -5,26 +5,26 @@
>>>    #include "HalPwrSeqCmd.h"
>>>
>>>    /*
>>> -	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
>>> -	There are 6 HW Power States:
>>> -	0: POFF--Power Off
>>> -	1: PDN--Power Down
>>> -	2: CARDEMU--Card Emulation
>>> -	3: ACT--Active Mode
>>> -	4: LPS--Low Power State
>>> -	5: SUS--Suspend
>>> -
>>> -	The transition from different states are defined below
>>> -	TRANS_CARDEMU_TO_ACT
>>> -	TRANS_ACT_TO_CARDEMU
>>> -	TRANS_CARDEMU_TO_SUS
>>> -	TRANS_SUS_TO_CARDEMU
>>> -	TRANS_CARDEMU_TO_PDN
>>> -	TRANS_ACT_TO_LPS
>>> -	TRANS_LPS_TO_ACT
>>> -
>>> -	TRANS_END
>>> -*/
>>> + *	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
>>> + *	There are 6 HW Power States:
>>> + *	0: POFF--Power Off
>>> + *	1: PDN--Power Down
>>> + *	2: CARDEMU--Card Emulation
>>> + *	3: ACT--Active Mode
>>> + *	4: LPS--Low Power State
>>> + *	5: SUS--Suspend
>>> + *
>>> + *	The transition from different states are defined below
>>> + *	TRANS_CARDEMU_TO_ACT
>>> + *	TRANS_ACT_TO_CARDEMU
>>> + *	TRANS_CARDEMU_TO_SUS
>>> + *	TRANS_SUS_TO_CARDEMU
>>> + *	TRANS_CARDEMU_TO_PDN
>>> + *	TRANS_ACT_TO_LPS
>>> + *	TRANS_LPS_TO_ACT
>>> + *
>>> + *	TRANS_END
>>> + */
>>>    #define	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS	26
>>>    #define	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS	15
>>>    #define	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS	15
>>> @@ -101,7 +101,7 @@
>>>    	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
>>>    	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
>>>    	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
>>> -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
>>> +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
>>>    	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
>>>    	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
>>>    	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
>>> @@ -112,7 +112,7 @@
>>>    	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
>>>    	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
>>>    	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
>>> -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
>>> +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
>>>    	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
>>>    	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
>>>    	{0x0301, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*PCIe DMA start*/
>>> @@ -209,7 +209,7 @@
>>>    #define RTL8723B_TRANS_END															\
>>>    	/* format */																\
>>>    	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
>>> -	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
>>> +	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
>>>
>>>
>>>    extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
>>> --
>>> 2.39.2
>>>
>>

