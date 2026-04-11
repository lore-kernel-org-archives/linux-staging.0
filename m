Received: from out-180.mta1.migadu.com (out-180.mta1.migadu.com [95.215.58.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33FB3BADBC
	for <linux-staging@lists.linux.dev>; Sat, 11 Apr 2026 17:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775927736; cv=none; b=d/KHjGa/EbOzQQLuoFs0DwgqECG/eyHmigdBxuxKx94UpUhiu8B7mAaPE9ovImN6CGLs8Q+IeALuZxYNrzAGgumOFza76rFsCmuhej9L3p9LT1FpI1LtyvnKHhYXJDVFq0n8LG6mxAKutwZb26fNwzelpyh6SRQNb9ICiBZakuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775927736; c=relaxed/simple;
	bh=x/JAV2Mq3zJOhDaXhr92uXqFVdwIjoZQIO7FGAOyEWI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=LV/hn11gHr0cItdiLnigJjtabfinILm2tYlPvqrWSbViZwmXfwRMvbWRLkjMIlyWto8/AdOYIXaCoSzvt6Qg66Dmoz89rw59IchQCd3uR5W7RQ7DXWE3dQ0dPQHAREm5UDzVpROjiBAmp0gsHf/Aewcpc1mqSWOMeXDoL3UXH0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=tcXenyNy; arc=none smtp.client-ip=95.215.58.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="tcXenyNy"
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775927730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZPsDGcIk/Hd8un+uLUiBPbS0e/AWqbQWxALSAJjGn9I=;
	b=tcXenyNyoKIHIlcwMte+Ocr8BCsn5U58qi6AUCvLY8XBoW9raK8ohW6KkbQ9C1/C3rePYw
	dwE+JeLFD/TG4VZUVEmKNy0t0NsQcihi1CMoTIRTfsk9X0iSfsRKixQRN7+XcofPNtdTnL
	ly8hSXQjAWOTpL3Y8ialcHz4klckSos=
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 19:15:23 +0200
Message-Id: <DHQHU5751IBM.3ESP4IO5SFX6V@linux.dev>
Cc: <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <straube.linux@gmail.com>
Subject: Re: [PATCH] staging: rtl8723bs: replace magic numbers with named
 constants
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Luka Gejak" <luka.gejak@linux.dev>
To: "Adith-Joshua" <adithalex29@gmail.com>, <gregkh@linuxfoundation.org>
References: <20260411052817.354594-1-adithalex29@gmail.com>
In-Reply-To: <20260411052817.354594-1-adithalex29@gmail.com>
X-Migadu-Flow: FLOW_OUT

On Sat Apr 11, 2026 at 7:28 AM CEST, Adith-Joshua wrote:
> Replace hardcoded magic numbers in rtl8723b_InitBeaconParameters()
> with descriptive macros to improve readability and maintainability.
>
> No functional changes.
>
> Signed-off-by: Adith-Joshua <adithalex29@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c   | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/=
staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index 8d259820f103..41f561120af5 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -864,6 +864,18 @@ void rtl8723b_read_chip_version(struct adapter *pada=
pter)
>  	ReadChipVersion8723B(padapter);
>  }
> =20
> +#define TBTT_PROHIBIT_HOLD_TIME_MS   0x64
> +#define TBTT_PROHIBIT_SETUP_TIME_MS  0x04

Please drop the _MS suffix here. While the legacy comment says "ms",=20
802.11 beacon offsets are almost universally measured in time units=20
(TU, which are 1024 microseconds). 0x64 is 100 TU. Baking "MS" into the=20
macro name based on a loose comment introduces false precision. Please=20
fix the field mappings and send a v2. I highly recommend taking a look=20
at how rtw88 handles these exact same registers=20
(REG_BCNTCFG and REG_TBTT_PROHIBIT) and trying to align your macros with
their structure where possible.

> +
> +#define TBTT_PROHIBIT_VALUE \
> +	((TBTT_PROHIBIT_HOLD_TIME_MS << 8) | TBTT_PROHIBIT_SETUP_TIME_MS)
> +
> +#define BCNTCFG_AIFS 0x66
> +#define BCNTCFG_CW   0x0F
> +
> +#define BCNTCFG_VALUE \
> +	((BCNTCFG_AIFS << 8) | BCNTCFG_CW)

This is completely backwards. If you cross-reference this with the=20
primary upstream rtw88 driver (drivers/net/wireless/realtek/rtw88/reg.h)
, aifs is actually the lower 8 bits (GENMASK(7, 0)) and cw is in the=20
upper bits. So 0x0F is the aifs (a typical max value of 15), and 0x66=20
represents the cwmax and cwmin values. While your macro happens to=20
evaluate to the original 0x660F magic number, the field names are=20
swapped and would actively mislead future developers.

> +
>  void rtl8723b_InitBeaconParameters(struct adapter *padapter)
>  {
>  	struct hal_com_data *pHalData =3D GET_HAL_DATA(padapter);
> @@ -878,8 +890,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *pa=
dapter)
> =20
>  	rtw_write16(padapter, REG_BCN_CTRL, val16);
> =20
> -	/*  TODO: Remove these magic number */
> -	rtw_write16(padapter, REG_TBTT_PROHIBIT, 0x6404);/*  ms */
> +	rtw_write16(padapter, REG_TBTT_PROHIBIT, TBTT_PROHIBIT_VALUE);/*  ms */
>  	/*  Firmware will control REG_DRVERLYINT when power saving is enable, *=
/
>  	/*  so don't set this register on STA mode. */
>  	if (check_fwstate(&padapter->mlmepriv, WIFI_STATION_STATE) =3D=3D false=
)
> @@ -888,7 +899,7 @@ void rtl8723b_InitBeaconParameters(struct adapter *pa=
dapter)
> =20
>  	/*  Suggested by designer timchen. Change beacon AIFS to the largest nu=
mber */
>  	/*  because test chip does not contension before sending beacon. by tyn=
li. 2009.11.03 */
> -	rtw_write16(padapter, REG_BCNTCFG, 0x660F);
> +	rtw_write16(padapter, REG_BCNTCFG, BCNTCFG_VALUE);
> =20
>  	pHalData->RegBcnCtrlVal =3D rtw_read8(padapter, REG_BCN_CTRL);
>  	pHalData->RegTxPause =3D rtw_read8(padapter, REG_TXPAUSE);

Best regards,
Luka Gejak
