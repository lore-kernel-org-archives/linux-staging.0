Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ADE346E4A
	for <linux-staging@lists.linux.dev>; Sun,  5 Apr 2026 13:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775394139; cv=none; b=SoTruazHRMfergGVNaD8tqNf6H9eeo+gVe72fvkcXi50iz4y4Yc9uHTSB++qAfk/t+gfp3ZGMe5+pxRD0e7aG0ahbU58rOOD7hJ5V6JCbHj/qXxj91A07jTbrqpGT1Fxtikj3KO0uafZac5wBPJ/zkQVt43lIWYSSBcQS8bI0f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775394139; c=relaxed/simple;
	bh=eYr6+osP1En0FVWvyebOZn/HOdQMPYeCTAmeuADcDfU=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=C4cez+hySfk8SGVTKpasq10tRH8O6KTJdj5A60BrNK3c/9DkdmGVBmXmU8kdTSwXm47ojerBLyxxuv/QPFhYMb3rVUO4IkjV5lvmbxM51gnCrln6lxu3HP1kz1S9G7DmjMxZLWYXEVAZKPONObsYTvILOUj4D+Jk3YRySkv6A9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=fYhmksT9; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="fYhmksT9"
Date: Sun, 05 Apr 2026 14:57:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1775394135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CLrBI3xHnqTwBT+rIhcBHjQ33vFk37Hl8TapPzd4JJc=;
	b=fYhmksT9dND1Y5fqYvCBUnnmAEI7Xgu9ZkB1CKnH9QmlUyVYKqVi4MF8ibaIM0oUTidfDS
	0cArar7XD1mAyIUrxBEyiYISYmtMAKAYEGfdLZ01VtpA0/oX8wv2+ODT/CNolCNgUozsmb
	kd8UoLMNweRz8rffrghowkaWlbHKlpo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Prithvi Tambewagh <activprithvi@gmail.com>, gregkh@linuxfoundation.org,
 abrahamadekunle50@gmail.com, b9788213@gmail.com, straube.linux@gmail.com,
 ethantidmore06@gmail.com, andriy.shevchenko@linux.intel.com,
 dan.carpenter@linaro.org, weibu@redadmin.org, knavaneeth786@gmail.com,
 ignacio.pena87@gmail.com, dharanitharan725@gmail.com,
 samasth.norway.ananda@oracle.com, karanja99erick@gmail.com,
 s9430939@naver.com, suunj1331@gmail.com, ysinghcin@gmail.com
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
 david.hunter.linux@gmail.com, khalid@kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFT_PATCH_v3_5/5=5D_staging=3A_rtl8723bs=3A_remove_?=
 =?US-ASCII?Q?duplicate_rate_checks_in_PHY=5FGetTxPowerIndexBase=28=29?=
In-Reply-To: <20260405114132.310774-6-activprithvi@gmail.com>
References: <20260405114132.310774-1-activprithvi@gmail.com> <20260405114132.310774-6-activprithvi@gmail.com>
Message-ID: <B3F00249-F9E5-4077-B863-EC809A556296@linux.dev>
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

On April 5, 2026 1:41:32 PM GMT+02:00, Prithvi Tambewagh <activprithvi@gmai=
l=2Ecom> wrote:
>The code previously checked (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7)
>condition twice - once for the (BandWidth =3D=3D CHANNEL_WIDTH_20) check =
and
>once for the (BandWidth =3D=3D CHANNEL_WIDTH_40) check=2E Fix if statemen=
t
>formatting to move that if check as an outer if check to improve code
>formatting=2E
>
>Signed-off-by: Prithvi Tambewagh <activprithvi@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec | 7 +++----
> 1 file changed, 3 insertions(+), 4 deletions(-)
>
>diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec b/drivers/s=
taging/rtl8723bs/hal/hal_com_phycfg=2Ec
>index 9e523491a008=2E=2Eefd1c76f2953 100644
>--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg=2Ec
>@@ -469,11 +469,10 @@ u8 PHY_GetTxPowerIndexBase(
> 	if ((Rate >=3D MGN_6M && Rate <=3D MGN_54M) && !IS_CCK_RATE(Rate))
> 		txPower +=3D pHalData->OFDM_24G_Diff[RFPath][TX_1S];
>=20
>-	if (BandWidth =3D=3D CHANNEL_WIDTH_20) { /*  BW20-1S, BW20-2S */
>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+	if (Rate >=3D MGN_MCS0 && Rate <=3D MGN_MCS7) {
>+		if (BandWidth =3D=3D CHANNEL_WIDTH_20) /*  BW20-1S, BW20-2S */
> 			txPower +=3D pHalData->BW20_24G_Diff[RFPath][TX_1S];
>-	} else if (BandWidth =3D=3D CHANNEL_WIDTH_40) { /*  BW40-1S, BW40-2S */
>-		if (MGN_MCS0 <=3D Rate && Rate <=3D MGN_MCS7)
>+		else if (BandWidth =3D=3D CHANNEL_WIDTH_40) /*  BW40-1S, BW40-2S */
> 			txPower +=3D pHalData->BW40_24G_Diff[RFPath][TX_1S];
> 	}
>=20

LGTM,
Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>
