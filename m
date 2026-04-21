Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6709A1C862D
	for <linux-staging@lists.linux.dev>; Tue, 21 Apr 2026 14:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776781592; cv=none; b=Hr8pvKsSrwitMjW0TjLxL0isCgZDn/e4bNzRaqDjExrRXx9iVjxAHqnnIjDzh3TH7eEcV4bJRxCDacYcM8cU+OMLIX95YyVJvOlaq3ox9OnTp/Pfxcg2fL1R02ZM5AHaLiaV2KWm2TOrIwmcvMBXvva0sOn0nzE9LEfB8ymCLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776781592; c=relaxed/simple;
	bh=w6+KrUebO330+HB5Hhz6sTo4xaE1M8HK0co2zUhRYZ0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=L2PMDFvuH/ovMO9nhrOAruF7oWs/lIWWb5IKralnHKKc6J0eRW/thAENT5rlN/lYNRmJCihRe4bb89z7vbTL8x7dyR7OIQpk9ImetiowM3WHp/1hcPO7+RsFA+MIU6nGkCImBrpvTbUOu/RgKGCz7dNdG3n4GOAifnNluBvGncU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fz8MDQf6; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fz8MDQf6"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1776781589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tpoy6rUXNuKtdlwQ+lKY9HEV2L/Wt2L9VSEO2g/bPp4=;
	b=Fz8MDQf6RnSSupfu7MUZc/pteiZak9GMIRTmJWWLx+HdbQVt79zNLOMWTdvfXsDkwedtp4
	cbPbG73F3bGoLQFPPW4WV11hpHyopFfUqNMVOVzXVU8BzUr77ixp5i4A1TK5RArNLAGPja
	pXz92IQRrZ1fEFSKbJEC2LGU7C1jPsM=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Apr 2026 16:26:24 +0200
Message-Id: <DHYWI7PRALBQ.UBTP7JS6GDUD@linux.dev>
Cc: <linux-staging@lists.linux.dev>
Subject: Re: [PATCH] staging: rtl8723bs: remove dump_chip_info() function
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Nikolay Kulikov" <nikolayof23@gmail.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>
References: <20260421051551.1694-1-nikolayof23@gmail.com>
In-Reply-To: <20260421051551.1694-1-nikolayof23@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Tue Apr 21, 2026 at 7:15 AM CEST, Nikolay Kulikov wrote:
> The dump_chip_info() function formats chip version information into a
> local 128-byte buffer using the scnprintf(). This buffer was previously
> passed to the DBG_871X macro.
> Commit 968b15adb0ea ("staging: rtl8723bs: remove all DBG_871X logs")
> removed the macro, leaving the buffer formatted but never used or output
> anywhere.
>
> dump_chip_info() is now useless, so remove it and its call from
> ReadChipVersion8723B().
>
> Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/hal_com.c       | 42 -------------------
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c |  2 -
>  drivers/staging/rtl8723bs/include/hal_com.h   |  2 -
>  3 files changed, 46 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rt=
l8723bs/hal/hal_com.c
> index 728a2171fbcb..0cafebd7b0c9 100644
> --- a/drivers/staging/rtl8723bs/hal/hal_com.c
> +++ b/drivers/staging/rtl8723bs/hal/hal_com.c
> @@ -30,48 +30,6 @@ void rtw_hal_data_deinit(struct adapter *padapter)
>  	}
>  }
> =20
> -
> -void dump_chip_info(struct hal_version	chip_version)
> -{
> -	char buf[128];
> -	size_t cnt =3D 0;
> -
> -	cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "Chip Version Info: CH=
IP_8723B_%s_",
> -			IS_NORMAL_CHIP(chip_version) ? "Normal_Chip" : "Test_Chip");
> -
> -	if (IS_CHIP_VENDOR_TSMC(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "TSMC_");
> -	else if (IS_CHIP_VENDOR_UMC(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "UMC_");
> -	else if (IS_CHIP_VENDOR_SMIC(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "SMIC_");
> -
> -	if (IS_A_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "A_CUT_");
> -	else if (IS_B_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "B_CUT_");
> -	else if (IS_C_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "C_CUT_");
> -	else if (IS_D_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "D_CUT_");
> -	else if (IS_E_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "E_CUT_");
> -	else if (IS_I_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "I_CUT_");
> -	else if (IS_J_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "J_CUT_");
> -	else if (IS_K_CUT(chip_version))
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "K_CUT_");
> -	else
> -		cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt,
> -				"UNKNOWN_CUT(%d)_", chip_version.CUTVersion);
> -
> -	cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "1T1R_");
> -
> -	cnt +=3D scnprintf(buf + cnt, sizeof(buf) - cnt, "RomVer(%d)\n", chip_v=
ersion.ROMVer);
> -}
> -
> -
>  #define	EEPROM_CHANNEL_PLAN_BY_HW_MASK	0x80
> =20
>  /*
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e794fe3caf9d..95bc4e73f512 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -852,8 +852,6 @@ static struct hal_version ReadChipVersion8723B(struct=
 adapter *padapter)
>  	pHalData->MultiFunc |=3D ((value32 & GPS_FUNC_EN) ? RT_MULTI_FUNC_GPS :=
 0);
>  	pHalData->PolarityCtl =3D ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_A=
CT : RT_POLARITY_LOW_ACT);
> =20
> -	dump_chip_info(ChipVersion);
> -
>  	pHalData->VersionID =3D ChipVersion;
> =20
>  	return ChipVersion;
> diff --git a/drivers/staging/rtl8723bs/include/hal_com.h b/drivers/stagin=
g/rtl8723bs/include/hal_com.h
> index 483f0390addc..cf775585c8e2 100644
> --- a/drivers/staging/rtl8723bs/include/hal_com.h
> +++ b/drivers/staging/rtl8723bs/include/hal_com.h
> @@ -92,8 +92,6 @@ enum rt_media_status {
>  u8 rtw_hal_data_init(struct adapter *padapter);
>  void rtw_hal_data_deinit(struct adapter *padapter);
> =20
> -void dump_chip_info(struct hal_version	ChipVersion);
> -
>  u8 /* return the final channel plan decision */
>  hal_com_config_channel_plan(
>  struct adapter *padapter,

LGTM.

Reviewed-by: Luka Gejak <luka.gejak@linux.dev>

Best regards,
Luka Gejak
