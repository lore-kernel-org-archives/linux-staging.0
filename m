Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C603EB7F0
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 10:18:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371490; cv=none; b=Y7tuEHrQ+I2plqHhgUPJvjwCGMV8lhnslzI5dnMSnoO0wGCWzXpAGjq3D5HnXPBBJHNGmkFPZvQ9+GfmG9V+nk3K/xcUM8vD3lWoCcdKlVEvrdl23d2zZSWKi/2d5uPSR6c/318M19DUZ1QSM6EmWEKUIxOzDs+SvxVNKtfuBHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371490; c=relaxed/simple;
	bh=/96AFtQ3AjYvodnokRLrLdJbnib/vOraiPwssWkAx3Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=BQzBPateRJIvDhfD1KRI7VHhw4M8RWafd6Be7haSzxxLpsPOwo01OnmLg+ZxEt8lOTm6R6/QSbL00DXsqbUL5hb+k2aZw0O9uOY67IXAju+6yQfxEqIJweuAlzmlEBzf1lgNb7BcAmcpsm5yGVmpFU0P8jgApe48XO0jflM98zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=swHwywU9; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="swHwywU9"
Date: Tue, 28 Apr 2026 12:17:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777371481;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YYLTZQNmY70dI4lwJn196u39RitunF/ihzdtxt+2TgE=;
	b=swHwywU9twHoJD+2loJyR0b6NpmQGwELylU47MBj0clzYd0E1AcPOfTlb9OrIYeozeEyCU
	l4PasK/ExWvPoGcj/i9NUQLWYESj71iMspZg0KwdyWc2EsOoA6e9+o3kb1Bglavb30of5R
	IIPoYqnE4aL+UemFPMATmnp33AXxj1U=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Alexandru Hossu <hossu.alexandru@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
CC: error27@gmail.com, hossu.alexandru@gmail.com, stable@vger.kernel.org,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/2=5D_staging=3A_rtl8723bs?=
 =?US-ASCII?Q?=3A_fix_OOB_read_in_OnAssocRsp=28=29_IE_loop?=
In-Reply-To: <20260428091621.739680-3-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com> <20260428091621.739680-3-hossu.alexandru@gmail.com>
Message-ID: <1E3772B0-8C58-4227-84E8-E9A4E9069B41@linux.dev>
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

On April 28, 2026 11:16:21 AM GMT+02:00, Alexandru Hossu <hossu=2Ealexandru=
@gmail=2Ecom> wrote:
>The IE parsing loop in OnAssocRsp() advances by (pIE->length + 2) each
>iteration but only guards on i < pkt_len=2E When a malicious AP sends an
>AssocResponse whose last IE has only one byte remaining in the frame
>(the element_id byte lands at pkt_len-1), the loop reads pIE->length
>from pframe[pkt_len], which is one byte past the allocated receive buffer=
=2E
>
>Additionally, even when the header bytes are in bounds, pIE->length
>itself can extend the data window beyond pkt_len, silently passing a
>truncated IE to the handler functions=2E
>
>Add two guards at the top of the loop body:
>  1=2E Break if fewer than sizeof(*pIE) bytes remain (can't read header)=
=2E
>  2=2E Break if the IE's declared data extends past pkt_len=2E
>
>Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>Cc: stable@vger=2Ekernel=2Eorg
>Signed-off-by: Alexandru Hossu <hossu=2Ealexandru@gmail=2Ecom>
>---
> drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec | 4 ++++
> 1 file changed, 4 insertions(+)
>
>diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec b/drivers/st=
aging/rtl8723bs/core/rtw_mlme_ext=2Ec
>index c646dc2a1741=2E=2E68ce422305ed 100644
>--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec
>+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext=2Ec
>@@ -1406,7 +1406,11 @@ unsigned int OnAssocRsp(struct adapter *padapter, =
union recv_frame *precv_frame)
> 	/* to handle HT, WMM, rate adaptive, update MAC reg */
> 	/* for not to handle the synchronous IO in the tasklet */
> 	for (i =3D (6 + WLAN_HDR_A3_LEN); i < pkt_len;) {
>+		if (i + sizeof(*pIE) > pkt_len)
>+			break;
> 		pIE =3D (struct ndis_80211_var_ie *)(pframe + i);
>+		if (i + sizeof(*pIE) + pIE->length > pkt_len)
>+			break;
>=20
> 		switch (pIE->element_id) {
> 		case WLAN_EID_VENDOR_SPECIFIC:

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
