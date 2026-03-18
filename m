Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C22322B88
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 06:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773816741; cv=none; b=idlpUl9R5ekkyB4I0lsKfBnLv567dD2YQ7Qox0ZWJNiU/JvJePvpQc5uN0NRHeTalKWJEZVvRWW89qutAGQ4+pNM9zMze5bNHTpIwjZXX3cSUP4z5Rn5U6E1YsyKF2bE8h65mVOxZZDLN3N8PgOQZ/UNAIqkbhiq9QToxn9YA84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773816741; c=relaxed/simple;
	bh=N7gOL8jd08bJ8hfwSUze/Iws4MDKC83UGM3LBsujVIM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=HpO8MOcOtcNaGFVu6FOf38Kpg+wznz6rz2oL1JjSf02zXvnnaHBZiGJVUxCKy6Gmlevobn10MUejtUzB2vre94SYxAo63uO0UzBmHDcWWIgou/i+4nbto0kug7U4kuL3+KCBgAsbhdzvm8C4g9cuokIoyajqXd2lTD3lawUrLHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=JBHseOaS; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="JBHseOaS"
Date: Wed, 18 Mar 2026 07:52:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773816737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ASbP/aMCkdO7ckDFPu9CYepaO2Dwjd0exH6b7p1A0OA=;
	b=JBHseOaS/rwtlcY80YQi0+WUbKjMQX/wOqUJbhk91KI3+0Ia1Dkwtik20p/fqTXbyFZFS0
	aK8aR/nILnZ5C28xqLwkSC8HAU5Xjlg/r+0zo6/y2NyoHR/B9zVR5n9F+g0agDRHwPSjMQ
	s90YVnk17dHguIkNcR4BiKj52769/TY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Aadarsh Mandal <aadarshmandal9354@gmail.com>, gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 straube.linux@gmail.com, dan.carpenter@linaro.org, ethantidmore06@gmail.com,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_staging=3A_rtl8723bs=3A_fixed_?=
 =?US-ASCII?Q?the_trailing_whitespaces/commented_code?=
In-Reply-To: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
References: <20260318021005.6346-1-aadarshmandal9354@gmail.com>
Message-ID: <46281493-328B-478A-985D-8F7A9218441A@linux.dev>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Migadu-Flow: FLOW_OUT

On March 18, 2026 3:10:05 AM GMT+01:00, Aadarsh Mandal <aadarshmandal9354@g=
mail=2Ecom> wrote:
>fixed the warnings,reported by checkpatch in
>drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>
>It mainly included the leading whitespace errors and commented line
>of codes, deleted those lines rebuild the module and it didn't produced
>any errors=2E one warning remains, fixing it breaks the logic=2E
>
>Signed-off-by: Aadarsh Mandal <aadarshmandal9354@gmail=2Ecom>
>---
>Note:
>* This patch is part of the GSoC2026 application process for device tree =
bindings conversions
>* https://github=2Ecom/LinuxFoundationGSoC/ProjectIdeas/wiki/GSoC-2026-De=
vice-Tree-Bindings
>
> drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec | 54 ++++++++++----------
> 1 file changed, 27 insertions(+), 27 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec b/drivers/sta=
ging/rtl8723bs/hal/sdio_halinit=2Ec
>index e32f051ed415=2E=2E70a5213ae52a 100644
>--- a/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit=2Ec
>@@ -46,7 +46,7 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
> 	u16 value16;
> 	u32 value32;
> 	u8 ret;
>-/* 	u8 bMacPwrCtrlOn; */
>+
By deleting this commented-out line and replacing it with a `+` on an empt=
y line, you are introducing extra blank lines into the code=2E You should j=
ust delete the commented line entirely without leaving a gap=2E
>=20
>=20
> 	/*  all of these MUST be configured before power on */
>@@ -70,8 +70,6 @@ u8 _InitPowerOn_8723BS(struct adapter *padapter)
> 	rtw_write16(padapter, REG_APS_FSMCO, value16);
>=20
> 	/*  Enable CMD53 R/W Operation */
>-/* 	bMacPwrCtrlOn =3D true; */
>-/* 	rtw_hal_set_hwreg(padapter, HW_VAR_APFM_ON_MAC, &bMacPwrCtrlOn); */
The standard practice in the kernel is to completely delete dead or commen=
ted-out code rather than re-indenting it=2E If the code is no longer used, =
it is better to just remove it entirely=2E Re-formatting dead code usually =
isn't accepted in staging cleanups=2E

>@@ -1147,6 +1146,7 @@ void SetHwReg8723BS(struct adapter *padapter, u8 va=
riable, u8 *val)
> 	case HW_VAR_SET_REQ_FW_PS:
> 		{
> 			u8 req_fw_ps =3D 0;
>+
> 			req_fw_ps =3D rtw_read8(padapter, 0x8f);
> 			req_fw_ps |=3D 0x10;
> 			rtw_write8(padapter, 0x8f, req_fw_ps);
This is a good fix=2E Adding the blank line after the variable declaration=
 improves readability and follows the kernel coding style=2E

Hope this helps with your v2!

Best regards,
Luka Gejak
Hi Aadarsh,

Thanks for submitting this patch, and good luck with your GSoC application=
!

I am also currently working on cleanups for
the rtl8723bs driver=2E I took a look at your
patch and noticed a few formatting and logic
issues that you might want to fix in a v2 before the maintainers review it=
=2E

First, your subject line does not match the standard format for this subsy=
stem=2E It should start with "staging: rtl8723bs: " and be more descriptive=
 of the actual changes rather than mentioning the tool used=2E Something li=
ke:
"staging: rtl8723bs: clean up coding style in sdio_halinit=2Ec"

I have left a few specific inline comments below regarding the code change=
s=2E
