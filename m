Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81CE1509A4
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 19:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724269447; cv=none; b=MIgYg0OjbvL+lQVAdY/pHKf95q9XZW8r1ZghDT/tZtyqZe3luYR1o0btD4Bn5niT2QwrxbM/LAZUOTrX3UEGMIDi8QLGYIzYaR2+kdLY8ENKsEBLKw4HXDM949MRPalE56YmbZqKFe2SWbh7Mx0FPHZbM2csE8LP8vKY9ZmLWtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724269447; c=relaxed/simple;
	bh=ArvKsggnJGPhOp+q0h9Mjxp3iUObKcvKOE2fcEWyoBI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QO3fnf3H1M2NlhZcfFbFvCACxwJAWqTgA2Kr6j3vrLv/l1mkEuAkRWhlEw/aF1/jmaxrg271fYFQhWONWpb278K5CI7LeymBWdYF5eKLmfCe6biX2FektVt+ielzMSEFaqgU34P5g7rsNtbs2kuaB6jpHchgYPcn1ZPvvZ+zgHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cgubjYDX; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cgubjYDX"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5bef295a45bso83341a12.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 12:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724269444; x=1724874244; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X9ZixJ4L2M9QC9AJ9kc6Ub9a6W9rSCr1rc3nn+e6qsY=;
        b=cgubjYDXbqfP3l8k0uJtYp4oOVKX3/csKbil+UFEV4tw9Ans1LMFLlEFr5ZfWs/Nfg
         0arjsKI/iWhmVtVr3QU+NPuINnV4sjp2Vj7Obx2bapFJZ0iQd+cO4tdmAY/aEfUvckAr
         mH1nZfvK/CCxu2PTm0cwM7oks7n9JaXy8wjqSeA9hpWuN9jTAvaBWp8vRzjupZfSadof
         H5UF9JDD19ftcqzdYFGee9ZIJo0sL8KEtYWxQ4au/y5dtc0igl4WGMwOSZ2uPtfvahj9
         9W7oIcgSCRt8+HpqUamWkTxVZRmr8t4/MTlGnkSGQoO1EYYGfKlxlaWflp+qSeYlQ0KP
         usig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724269444; x=1724874244;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X9ZixJ4L2M9QC9AJ9kc6Ub9a6W9rSCr1rc3nn+e6qsY=;
        b=MzJPDixyqtPXlrDc7NHdIWX0TEyQlxOokkNraB8EFwUpHagdhkluuYjI8lHDPv53Da
         481JUMhJ415ShiXuxmmqPDoApKnXzCgp/2vlfJucWnldQyWvcQcC+n+Osq+qhMQc4bwo
         6hnxnESHwGyhmFXpREyRJFNFCDcRs8k4EZfGerc00OekEiHsDSNm045ruYwlYr/+7Aoi
         n5jY5OrpS350C5lgJWFbFzhNOut6fJyg1Mq+xQjrLtfwBXZOxDaFqx/qeBiPUwEGI0xi
         87b39o9D9TQtzp4YWa32EjOUTP8KBQHQHaXnxMSYRbY2Fz+M6vQnunM2+r1IxCy19LjP
         Goiw==
X-Gm-Message-State: AOJu0Yw9io4thHr1WaeawykF58m2bUYhCTl9My+jh46V7wxLdVpL0KDH
	N7XCXeaI/vKZxAtThS1r/WUeLtH3f0syI3tHu6Chk+GG/ol+m+/9
X-Google-Smtp-Source: AGHT+IFOxSJhs1ice/CJPbgFCF94dLFI9ejDF3YEagA8yT7YH2ObM/obuHhjkcaCKC7p5IlP6W/YfA==
X-Received: by 2002:a05:6402:4302:b0:5be:f0dd:d501 with SMTP id 4fb4d7f45d1cf-5bf1f272d3fmr3444803a12.27.1724269443660;
        Wed, 21 Aug 2024 12:44:03 -0700 (PDT)
Received: from ?IPV6:2003:c7:8f2a:8501:ea5e:6daf:6c3:197a? (p200300c78f2a8501ea5e6daf06c3197a.dip0.t-ipconnect.de. [2003:c7:8f2a:8501:ea5e:6daf:6c3:197a])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbe7f3f6sm8424267a12.66.2024.08.21.12.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Aug 2024 12:44:03 -0700 (PDT)
Message-ID: <072156e5-575c-491c-b323-d4de682ea84a@gmail.com>
Date: Wed, 21 Aug 2024 21:44:02 +0200
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] staging: rtl8723bs: add spaces arround operators
To: =?UTF-8?Q?Guillaume_Lef=C3=A8vre-Crim=C3=A9?=
 <guillaume.lefevre.crime@netc.fr>, gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20240816183756.59250-1-guillaume.lefevre.crime@netc.fr>
Content-Language: en-US
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
In-Reply-To: <20240816183756.59250-1-guillaume.lefevre.crime@netc.fr>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/16/24 20:37, Guillaume Lefèvre-Crimé wrote:
> Adhere to Linux kernel coding style.
> Reported by checkpath :
> CHECK: spaces preferred around that '&' (ctx:VxV)
> 
> Signed-off-by: Guillaume Lefèvre-Crimé <guillaume.lefevre.crime@netc.fr>
> ---
>   drivers/staging/rtl8723bs/core/rtw_efuse.c | 54 +++++++++++-----------
>   1 file changed, 27 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> index eb848f9bbf2c..89acb6f290cc 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -38,7 +38,7 @@ Efuse_Read1ByteFromFakeContent(u16 Offset, u8 *Value)
>   	if (fakeEfuseBank == 0)
>   		*Value = fakeEfuseContent[Offset];
>   	else
> -		*Value = fakeBTEfuseContent[fakeEfuseBank-1][Offset];
> +		*Value = fakeBTEfuseContent[fakeEfuseBank - 1][Offset];
>   	return true;
>   }
>   
> @@ -50,7 +50,7 @@ Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
>   	if (fakeEfuseBank == 0)
>   		fakeEfuseContent[Offset] = Value;
>   	else
> -		fakeBTEfuseContent[fakeEfuseBank-1][Offset] = Value;
> +		fakeBTEfuseContent[fakeEfuseBank - 1][Offset] = Value;
>   	return true;
>   }
>   
> @@ -206,21 +206,21 @@ u16		Address)
>   	if (Address < contentLen) {/* E-fuse 512Byte */
>   		/* Write E-fuse Register address bit0~7 */
>   		temp = Address & 0xFF;
> -		rtw_write8(Adapter, EFUSE_CTRL+1, temp);
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+2);
> +		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
> +		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 2);
>   		/* Write E-fuse Register address bit8~9 */
>   		temp = ((Address >> 8) & 0x03) | (Bytetemp & 0xFC);
> -		rtw_write8(Adapter, EFUSE_CTRL+2, temp);
> +		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
>   
>   		/* Write 0x30[31]= 0 */
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
> +		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
>   		temp = Bytetemp & 0x7F;
> -		rtw_write8(Adapter, EFUSE_CTRL+3, temp);
> +		rtw_write8(Adapter, EFUSE_CTRL + 3, temp);
>   
>   		/* Wait Write-ready (0x30[31]= 1) */
> -		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
> +		Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
>   		while (!(Bytetemp & 0x80)) {
> -			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL+3);
> +			Bytetemp = rtw_read8(Adapter, EFUSE_CTRL + 3);
>   			k++;
>   			if (k == 1000)
>   				break;
> @@ -253,16 +253,16 @@ bool		bPseudoTest)
>   
>   	/*  -----------------e-fuse reg ctrl --------------------------------- */
>   	/* address */
> -	rtw_write8(padapter, EFUSE_CTRL+1, (u8)(addr&0xff));
> -	rtw_write8(padapter, EFUSE_CTRL+2, ((u8)((addr>>8) & 0x03)) |
> -	(rtw_read8(padapter, EFUSE_CTRL+2)&0xFC));
> +	rtw_write8(padapter, EFUSE_CTRL + 1, (u8)(addr & 0xff));
> +	rtw_write8(padapter, EFUSE_CTRL + 2, ((u8)((addr >> 8) & 0x03)) |
> +	(rtw_read8(padapter, EFUSE_CTRL + 2) & 0xFC));
>   
>   	/* rtw_write8(padapter, EFUSE_CTRL+3,  0x72); read cmd */
>   	/* Write bit 32 0 */
> -	readbyte = rtw_read8(padapter, EFUSE_CTRL+3);
> -	rtw_write8(padapter, EFUSE_CTRL+3, (readbyte & 0x7f));
> +	readbyte = rtw_read8(padapter, EFUSE_CTRL + 3);
> +	rtw_write8(padapter, EFUSE_CTRL + 3, (readbyte & 0x7f));
>   
> -	while (!(0x80 & rtw_read8(padapter, EFUSE_CTRL+3)) && (tmpidx < 1000)) {
> +	while (!(0x80 & rtw_read8(padapter, EFUSE_CTRL + 3)) && (tmpidx < 1000)) {
>   		mdelay(1);
>   		tmpidx++;
>   	}
> @@ -293,9 +293,9 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
>   
>   
>   	efuseValue = rtw_read32(padapter, EFUSE_CTRL);
> -	efuseValue |= (BIT21|BIT31);
> +	efuseValue |= (BIT21 | BIT31);
>   	efuseValue &= ~(0x3FFFF);
> -	efuseValue |= ((addr<<8 | data) & 0x3FFFF);
> +	efuseValue |= ((addr << 8 | data) & 0x3FFFF);
>   
>   
>   	/*  <20130227, Kordan> 8192E MP chip A-cut had better not set 0x34[11] until B-Cut. */
> @@ -304,9 +304,9 @@ u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoT
>   	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
>   	/* PHY_SetMacReg(padapter, 0x34, BIT11, 1); */
>   	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) | (BIT11));
> -	rtw_write32(padapter, EFUSE_CTRL, 0x90600000|((addr<<8 | data)));
> +	rtw_write32(padapter, EFUSE_CTRL, 0x90600000 | ((addr << 8 | data)));
>   
> -	while ((0x80 &  rtw_read8(padapter, EFUSE_CTRL+3)) && (tmpidx < 100)) {
> +	while ((0x80 &  rtw_read8(padapter, EFUSE_CTRL + 3)) && (tmpidx < 100)) {
>   		mdelay(1);
>   		tmpidx++;
>   	}
> @@ -365,19 +365,19 @@ efuse_WordEnableDataRead(u8 word_en,
>   						u8 *sourdata,
>   						u8 *targetdata)
>   {
> -	if (!(word_en&BIT(0))) {
> +	if (!(word_en & BIT(0))) {
>   		targetdata[0] = sourdata[0];
>   		targetdata[1] = sourdata[1];
>   	}
> -	if (!(word_en&BIT(1))) {
> +	if (!(word_en & BIT(1))) {
>   		targetdata[2] = sourdata[2];
>   		targetdata[3] = sourdata[3];
>   	}
> -	if (!(word_en&BIT(2))) {
> +	if (!(word_en & BIT(2))) {
>   		targetdata[4] = sourdata[4];
>   		targetdata[5] = sourdata[5];
>   	}
> -	if (!(word_en&BIT(3))) {
> +	if (!(word_en & BIT(3))) {
>   		targetdata[6] = sourdata[6];
>   		targetdata[7] = sourdata[7];
>   	}
> @@ -463,7 +463,7 @@ static void efuse_ShadowRead2Byte(struct adapter *padapter, u16 Offset, u16 *Val
>   	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
>   
>   	*Value = pEEPROM->efuse_eeprom_data[Offset];
> -	*Value |= pEEPROM->efuse_eeprom_data[Offset+1]<<8;
> +	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
>   
>   }	/*  EFUSE_ShadowRead2Byte */
>   
> @@ -473,9 +473,9 @@ static void efuse_ShadowRead4Byte(struct adapter *padapter, u16 Offset, u32 *Val
>   	struct eeprom_priv *pEEPROM = GET_EEPROM_EFUSE_PRIV(padapter);
>   
>   	*Value = pEEPROM->efuse_eeprom_data[Offset];
> -	*Value |= pEEPROM->efuse_eeprom_data[Offset+1]<<8;
> -	*Value |= pEEPROM->efuse_eeprom_data[Offset+2]<<16;
> -	*Value |= pEEPROM->efuse_eeprom_data[Offset+3]<<24;
> +	*Value |= pEEPROM->efuse_eeprom_data[Offset + 1] << 8;
> +	*Value |= pEEPROM->efuse_eeprom_data[Offset + 2] << 16;
> +	*Value |= pEEPROM->efuse_eeprom_data[Offset + 3] << 24;
>   
>   }	/*  efuse_ShadowRead4Byte */
>   


Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>

