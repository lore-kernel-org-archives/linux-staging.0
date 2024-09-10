Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0E961AB526
	for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 19:07:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725995230; cv=none; b=aZcgFpA2xZJjsdPXk3V9KSKSXDhOibtJ8eGmwmb9N7TjTBSQng4RRMHNhxRE2tAMtMu3SrN0l0+2gRrvp3CCIFSn2kyJAvPnHQeJtfERpBsuoccCequW1GqUDGxzCH3ahiMV5u/fsHDfHsHkMXZjwnskdnPWN2cLVeXKBcqPfR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725995230; c=relaxed/simple;
	bh=/fPvS6tHaPYkd+ieklVpLMDzeZI3SXacgyA3mGQdBfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DrZsvkP2c+A6PZwBllClmkEk3SRGn92dWX3jPKhbKzEdPLzMEyRxqF7DsLpYMC+OZmaVQSafUeYiWcvhHt/nbmo46QVboLUCZ/OLgfdAEQ+Vs/NSRtS4ABPdBLczyzepbQDY0dYGg6V8wh+/bX3C4kf2BZIgmqxUbpUpMqeWL5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vkp1hjSS; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vkp1hjSS"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20551e2f1f8so59303675ad.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Sep 2024 12:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725995228; x=1726600028; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6lOiIJ4Mc69h2PNQojh4dfRelmJgPkTSzYXUp3tv+n8=;
        b=Vkp1hjSSJgPxhL6MixzOzhhveQcRDdXf2l6xUiog9otfkRC51mans6HbB/AZN32SYF
         hAwqbjILVa5yl3PVW9nnqtXl2nNloD2YqWp7qbbBSctwgi3iVrKtcVNKsppKwulLOrEU
         B/J25/DNEyWJlcCXqmIwhSckf4kPRpNVO+O8/utgVraZ2L3IiCIJDYdxV+tnzm6VoYpa
         SJkPqvkMZgwe8LouLmf0bFEKX69uVl40/S8cNUid98iOH4YXvdMnGD6Ocd665oSg5KZP
         PY98JXKyBByLEI0YLOAl9OQFI9KmbYPhB//usQCbm++uY65+KJzNOwCf2+/jnPRtMMUZ
         j3Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725995228; x=1726600028;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6lOiIJ4Mc69h2PNQojh4dfRelmJgPkTSzYXUp3tv+n8=;
        b=ZkKhETcBmlW4gO73aS/Ma7A+uUp8shCeTYUkd5inibLOReZUekI8+T0e6iT2Z/os4O
         0MpY7S2WEcfTOx9QJyqM2JEuAZeshhCHi+IVv484Foa7P+GEHJ0xYULOvQaEKA39LKaB
         +cgKqZmETSqIjLQ3pigA2JZ6b8vZhhHfRrh7a/4zDB3/7Vx7AM3JNwOSClCjLFu9XGsy
         d0jJ1iWbrvapAV2uDgSP8oU0E7H1lxdqq6NiGQMeD9j2BP1gM95vV7tQlUqE6kDHVDy1
         2+E8w4r3+gHlvy79T+uQo9SU112bs5fGyMnpnb3QDNW1lCZ1HKT0sftxgHsQnt+C2743
         HbFA==
X-Gm-Message-State: AOJu0Yzpy45nBRFbx1PWMWjHkBmvc2gt+NsB32sEWedZfHniyl0PzWr8
	10XU4FGRnfez+kj87N+zdSuTYZ1t7alETxeVvyaNJQWSF6WAzGAiifYHZFUFst4=
X-Google-Smtp-Source: AGHT+IFh7ypVlg+pkVmteXSfq34hnWWEiP32lthCK2Pt8J4txP0R/BlbvzOq3InKFv3MpF58XUjruQ==
X-Received: by 2002:a17:902:ec8e:b0:205:4885:235e with SMTP id d9443c01a7336-2074c70dac2mr18657265ad.39.1725995227605;
        Tue, 10 Sep 2024 12:07:07 -0700 (PDT)
Received: from debian ([103.57.174.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20710f1e29asm51657045ad.214.2024.09.10.12.07.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Sep 2024 12:07:07 -0700 (PDT)
Date: Wed, 11 Sep 2024 00:37:01 +0530
From: Sayyad Abid <sayyad.abid16@gmail.com>
To: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: linux-staging@lists.linux.dev, gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org, sayyad.abid16@gmail.com
Subject: Re: [PATCH v2] staging: rtl8723bs: Fix coding style issues in the
 hal_pwr_seq.h
Message-ID: <ZuCY1Tuog1sFHLBQ@debian>
References: <20240910121144.635348-1-sayyad.abid16@gmail.com>
 <89893a22-5018-4ae0-b4f9-e473a36f09b6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <89893a22-5018-4ae0-b4f9-e473a36f09b6@gmail.com>

On Tue, Sep 10, 2024 at 08:47:54PM +0200, Philipp Hortmann wrote:
> On 9/10/24 14:11, abid-sayyad wrote:
> > Improving the code readability and coding style compliance of the code.
> > Running checkpatch.pl on the file raised coding style warnings:
> > -The comment block needs "*" on all lines of the block
> > from line 8 to 26
> > -Use tabs for indent
> > on line 103 and 115
> >
> > Applying the patch fixes these coding style issues and makes the code more
> > readable/developer friendly.
> >
> > Signed-off-by: abid-sayyad <sayyad.abid16@gmail.com>
> > ---
>
> Hi Abid,
>
> I cannot apply your patch. Are you using the right git repo?
>
> git remote show origin
> * remote origin
>   Fetch URL:
> git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git
> ...
> git branch -a
> my branch: staging-testing
>
>
> kernel@matrix-ESPRIMO-P710:~/Documents/git/kernels/staging$ mutt
> Applying: staging: rtl8723bs: Fix coding style issues in the hal_pwr_seq.h
> error: patch failed: drivers/staging/rtl8723bs/include/hal_pwr_seq.h:101
> error: drivers/staging/rtl8723bs/include/hal_pwr_seq.h: patch does not apply
> Patch failed at 0001 staging: rtl8723bs: Fix coding style issues in the
> hal_pwr_seq.h
>
I found the issue, I have been amending these changes on the mainline repo,
  $ git remote show origin
* remote origin
  Fetch URL: git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git

  I need to clone the staging branch.
> Please also change your Description. Concentrate on why this patch makes
> sense. Do not describe the patch. What is changed can be seen below. Please
> also use the correct time.
>
I did not understand the correct time here. could you please
elaborate a little on this please.
> You can find accepted examples in the git repo.
>
I'll look into the accepted patches right now. Meanwhile I have this question
, descriptions addressing only the coding style issue fixes are acceptable or
it needs to be having somethingelse too? (apologies in advance for
this illy question)
> Thanks for your support.
>
> Bye Philipp
>
Thank Youy for your feedbacks
>
>
> > changes since v1:
> > v2: Fix the email body, amke it more informative
> > link to v1:
> > https://lore.kernel.org/all/ca1908f3-74aa-45e7-a389-3995aba2660c@gmail.com/
> >   .../staging/rtl8723bs/include/hal_pwr_seq.h   | 46 +++++++++----------
> >   1 file changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > index 5e43cc89f535..10fef1b3f393 100644
> > --- a/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > +++ b/drivers/staging/rtl8723bs/include/hal_pwr_seq.h
> > @@ -5,26 +5,26 @@
> >   #include "HalPwrSeqCmd.h"
> >
> >   /*
> > -	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
> > -	There are 6 HW Power States:
> > -	0: POFF--Power Off
> > -	1: PDN--Power Down
> > -	2: CARDEMU--Card Emulation
> > -	3: ACT--Active Mode
> > -	4: LPS--Low Power State
> > -	5: SUS--Suspend
> > -
> > -	The transition from different states are defined below
> > -	TRANS_CARDEMU_TO_ACT
> > -	TRANS_ACT_TO_CARDEMU
> > -	TRANS_CARDEMU_TO_SUS
> > -	TRANS_SUS_TO_CARDEMU
> > -	TRANS_CARDEMU_TO_PDN
> > -	TRANS_ACT_TO_LPS
> > -	TRANS_LPS_TO_ACT
> > -
> > -	TRANS_END
> > -*/
> > + *	Check document WM-20130815-JackieLau-RTL8723B_Power_Architecture v08.vsd
> > + *	There are 6 HW Power States:
> > + *	0: POFF--Power Off
> > + *	1: PDN--Power Down
> > + *	2: CARDEMU--Card Emulation
> > + *	3: ACT--Active Mode
> > + *	4: LPS--Low Power State
> > + *	5: SUS--Suspend
> > + *
> > + *	The transition from different states are defined below
> > + *	TRANS_CARDEMU_TO_ACT
> > + *	TRANS_ACT_TO_CARDEMU
> > + *	TRANS_CARDEMU_TO_SUS
> > + *	TRANS_SUS_TO_CARDEMU
> > + *	TRANS_CARDEMU_TO_PDN
> > + *	TRANS_ACT_TO_LPS
> > + *	TRANS_LPS_TO_ACT
> > + *
> > + *	TRANS_END
> > + */
> >   #define	RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS	26
> >   #define	RTL8723B_TRANS_ACT_TO_CARDEMU_STEPS	15
> >   #define	RTL8723B_TRANS_CARDEMU_TO_SUS_STEPS	15
> > @@ -101,7 +101,7 @@
> >   	{0x0007, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0x20}, /*0x07 = 0x20 , SOP option to disable BG/MB*/	\
> >   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK|PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, BIT3}, /*0x04[12:11] = 2b'01 enable WL suspend*/	\
> >   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT2, BIT2}, /*0x04[10] = 1, enable SW LPS*/	\
> > -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
> > +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 1}, /*0x48[16] = 1 to enable GPIO9 as EXT WAKEUP*/   \
> >   	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, BIT4}, /*0x23[4] = 1b'1 12H LDO enter sleep mode*/   \
> >   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, BIT0}, /*Set SDIO suspend local register*/	\
> >   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, 0}, /*wait power state to suspend*/
> > @@ -112,7 +112,7 @@
> >   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3 | BIT7, 0}, /*clear suspend enable and power down enable*/	\
> >   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_WRITE, BIT0, 0}, /*Set SDIO suspend local register*/	\
> >   	{0x0086, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_SDIO, PWR_CMD_POLLING, BIT1, BIT1}, /*wait power state to suspend*/\
> > -        {0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
> > +	{0x004A, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_USB_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT0, 0}, /*0x48[16] = 0 to disable GPIO9 as EXT WAKEUP*/   \
> >   	{0x0005, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT3|BIT4, 0}, /*0x04[12:11] = 2b'01enable WL suspend*/\
> >   	{0x0023, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_SDIO_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, BIT4, 0}, /*0x23[4] = 1b'0 12H LDO enter normal mode*/   \
> >   	{0x0301, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_PCI_MSK, PWR_BASEADDR_MAC, PWR_CMD_WRITE, 0xFF, 0},/*PCIe DMA start*/
> > @@ -209,7 +209,7 @@
> >   #define RTL8723B_TRANS_END															\
> >   	/* format */																\
> >   	/* { offset, cut_msk, fab_msk|interface_msk, base|cmd, msk, value }, comments here*/								\
> > -	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
> > +	{0xFFFF, PWR_CUT_ALL_MSK, PWR_FAB_ALL_MSK, PWR_INTF_ALL_MSK, 0, PWR_CMD_END, 0, 0},
> >
> >
> >   extern struct wlan_pwr_cfg rtl8723B_power_on_flow[RTL8723B_TRANS_CARDEMU_TO_ACT_STEPS+RTL8723B_TRANS_END_STEPS];
> > --
> > 2.39.2
> >
>
