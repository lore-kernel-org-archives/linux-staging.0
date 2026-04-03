Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DA4E346A0A
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 21:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775252361; cv=none; b=LoB2GxcL/7wVuqSxVAtJ5wGnBqANivSXPpBEiQrB72Gr1VaLbPmALwZrW6xJOUJBT5180VSc8ex4iMvdkit3g9LYKIwYkAgM2bDeyfpIYkzGSwZvg1iYS+ZrKneL6iZEB2TaRU6vr3OuwFGxW97cpWzwTlKHfFJpkK+2ezaVevc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775252361; c=relaxed/simple;
	bh=XUv2zHffbIMnVNQiZJFK/zDbrK2aZC4otKGAMtxQNMo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=lhjglkG2ZAlOvzXw0pPu9gzo1PxyFbGr2XoSfwToqP9mkp9AgDeelDTghAxeEH22mMsPSnoSk0Rs9HlsIiQGTSeuP9xvy6By7ylSUqTbgyRZN26BjgWx4j7XgOOOEy9AQOlS5dQeFVPF4iznvs8jMK0SIwBcyhShveVJxAtql2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=miBYFjA4; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="miBYFjA4"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79ab3e26cceso20712127b3.3
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 14:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775252359; x=1775857159; darn=lists.linux.dev;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJrsXqouJBs+QJo4U/h4iVs3B1LQcjTgx6CW78TnpbE=;
        b=miBYFjA4w7/teXXTMi5IRbCgIFZi2Ivl/izVscYXiPJxFg85Y9ggxjGPI/0HsKlbU8
         7fUMFM6lgTpQ9SO/tS8TjmzIYsBKllBxqb0OdDKfvjn2WC1m25v2VBV+ncErcMkFUtlx
         CfWGsLrGrvqIviMXFqFm4COkSwEjlQhKoE7MdFurVSNNozxHln09pV7Vy+TdU5jn6Zv5
         hg+Qx778p98TRtzLQrukIQYe9q4iJIeGH2Ivwzrmac2suxrIKzjm/DGBlNM5Wmu2qcwU
         tdzyIA+SZxJw5v6gD4N2CFlkhmWkn5Lz4xt7Ar0F1rth1DWy3DH9Ngp5z/pMQPkXXqDw
         qDlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775252359; x=1775857159;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pJrsXqouJBs+QJo4U/h4iVs3B1LQcjTgx6CW78TnpbE=;
        b=l6zJdufUwjREt8tGONwkL1JhodjsIN60mNCYg2NlxSukk0Hg4nyPKqvYqPa+0mWFz5
         JvkGeVPEYuGDb3M5Krncr+VBZot783/oJdEW95pRpLZVR5V/Bm/WON+L5iGfbjuEPC7e
         grzlRUEPP3dN9jzG8GD53PjEW5Iwqf3Fb3UnhaG8MSoW4kxrOaCNUv0ILq8uHl+RqemC
         7Rel3j17bBBN/kERBovbNRcgFBfdpsGD2tSyx04ZI4SNN/n/v86ht8ARRPWAYY+vOUXu
         qU7yQijymt7h53rOQs4P4uFyVvEqpbD4KX0UjZYlZkSwzrwmpNPviUOIqVvBtU4bumvv
         5ZJQ==
X-Gm-Message-State: AOJu0YxfxBpZbHXPI1xlL8ycAK9Ve2DXUV94jO2ZX1/WokvER6KEhoER
	CZqVh/+e4WohRd8xMKlQ1omq8ZW1kf3/FGAbkvw6b5qLYqD7aLBJek1lEt+anc3I
X-Gm-Gg: AeBDiesNK7/N2+e4vKwHbc7S9aAJdSPTJTw9ytT/AUa9IstWmp4FEJZnTygRWST5QKG
	c72QVYCSHk1nnqATJ8NLVFvJD/TZ38yqUMRYGc7UxnLky63I1ure9vXmem9jl2WckyBThSo7Ri8
	dIkvSQ48VWX4lvPRDA5Mduyo8OZ9jZSiqjiUf+WW1Q+Dyzzw31BfbrPyP4AmC8Fp0LSa+zku97K
	OT72NasgjwkVhz/U1OFQKD8jqWzXct6aiPEkFR1PvChPi/CJxOv/rBjk7cUPNMI3rUpERla3XH2
	7J2+s2RunjGxhZYIJbzf/iv+lTEm7X4uKlgOD/b9zBwj2KNyxloZCljRJA70qIOOXdjYN5lqwGe
	u/Epkb9crJhMIramAwveLeljWDE41+/7CPwiR9TCxatdgqBee3p4RBEVxc6mdbgK1bdF8XpHlUP
	av04TjyhNjaFZNE+mx39/uHd94eQbEaq/5WFZtt4RIbCpvlTM/Sis5PVfEK40c5MkBzhlCK8j+g
	jAda2A5vvS90N0rNKUJPhbo7HA0E2kG
X-Received: by 2002:a05:690c:4426:b0:79a:40fb:9339 with SMTP id 00721157ae682-7a4d60557f2mr33676767b3.47.1775252359144;
        Fri, 03 Apr 2026 14:39:19 -0700 (PDT)
Received: from localhost ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370df19f3sm26801157b3.39.2026.04.03.14.39.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 14:39:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Apr 2026 16:39:16 -0500
Message-Id: <DHJUFTYOW0C9.1KG9RVHIZID46@gmail.com>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 3/7] staging: rtl8723bs: rename EFUSE_Read1Byte() to
 rtw_efuse_read_1_byte()
From: "Ethan Tidmore" <ethantidmore06@gmail.com>
To: "Linus Probert" <linus.probert@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260402054215.271981-1-linus.probert@gmail.com>
 <20260402054215.271981-4-linus.probert@gmail.com>
In-Reply-To: <20260402054215.271981-4-linus.probert@gmail.com>

On Thu Apr 2, 2026 at 12:42 AM CDT, Linus Probert wrote:
> Renames EFUSE_Read1Byte to rtw_efuse_read_1_byte in order to conform to
> kernel code styl.

I missed that you misspelt style in my last review. Sorry about that.
Also, its generally wanted that you include the change logs in the
actual patches themselves.

Thanks,

ET
>
> Discovered using checkpatch.pl tool.
>
> Signed-off-by: Linus Probert <linus.probert@gmail.com>
> ---
> v5: No change
>
>  drivers/staging/rtl8723bs/core/rtw_efuse.c        | 6 +++---
>  drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 3 ++-
>  drivers/staging/rtl8723bs/include/rtw_efuse.h     | 2 +-
>  3 files changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging=
/rtl8723bs/core/rtw_efuse.c
> index a7b120cc70a3..d6212b3b0b1d 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
> @@ -26,7 +26,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>  }
> =20
>  /*----------------------------------------------------------------------=
-------
> - * Function:	EFUSE_Read1Byte
> + * Function:	rtw_efuse_read_1_byte
>   *
>   * Overview:	Copy from WMAC fot EFUSE read 1 byte.
>   *
> @@ -42,7 +42,7 @@ rtw_efuse_calculate_word_counts(u8 word_en)
>   *
>   */
>  u8
> -EFUSE_Read1Byte(
> +rtw_efuse_read_1_byte(
>  struct adapter *Adapter,
>  u16		Address)
>  {
> @@ -79,7 +79,7 @@ u16		Address)
>  	} else
>  		return 0xFF;
> =20
> -} /* EFUSE_Read1Byte */
> +} /* rtw_efuse_read_1_byte */
> =20
>  /*  11/16/2008 MH Read one byte from real Efuse. */
>  u8
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 355167883f08..941c2ebef9e2 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -1559,7 +1559,8 @@ void Hal_ReadRFGainOffset(
> =20
>  	if (!AutoloadFail) {
>  		Adapter->eeprompriv.EEPROMRFGainOffset =3D PROMContent[EEPROM_RF_GAIN_=
OFFSET];
> -		Adapter->eeprompriv.EEPROMRFGainVal =3D EFUSE_Read1Byte(Adapter, EEPRO=
M_RF_GAIN_VAL);
> +		Adapter->eeprompriv.EEPROMRFGainVal =3D rtw_efuse_read_1_byte(Adapter,
> +									    EEPROM_RF_GAIN_VAL);
>  	} else {
>  		Adapter->eeprompriv.EEPROMRFGainOffset =3D 0;
>  		Adapter->eeprompriv.EEPROMRFGainVal =3D 0xFF;
> diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/stag=
ing/rtl8723bs/include/rtw_efuse.h
> index b8cd9e694f56..7b78fd5e583b 100644
> --- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
> +++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
> @@ -71,7 +71,7 @@ struct efuse_hal {
>  u8 rtw_efuse_calculate_word_counts(u8 word_en);
>  u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data)=
;
> =20
> -u8 EFUSE_Read1Byte(struct adapter *padapter, u16 Address);
> +u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
>  void EFUSE_ShadowMapUpdate(struct adapter *padapter, u8 efuseType);
>  void EFUSE_ShadowRead(struct adapter *padapter, u8 Type, u16 Offset, u32=
 *Value);
>  void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);

