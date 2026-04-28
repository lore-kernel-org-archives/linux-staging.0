Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776EF3E5EC7
	for <linux-staging@lists.linux.dev>; Tue, 28 Apr 2026 10:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777371437; cv=none; b=K5xP6Vc/cwZ3wH0FiwPyagE2UQIVwxVqvQZYnU/kiAmRwqsifttNsKKXU8wf/obu2FAEQtocahggSvWYfervARuyRTZowDpGfkqnN4y3uYRoRhg3PeDmKVE8t/VcRdW5nKjUh93GbiIYMDPaRnDyB0tPruD+kM7ZTtNMWaLl7jE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777371437; c=relaxed/simple;
	bh=IWcmOY2pfrEGSaWXBvBvs5xeFyk03dK4Yqb8uKvYoCo=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DyvAjT7pSKYJ+YmKIdvkfETnCEKYljmlVHEoYQu3xTX/O3HyO9YNrr8FY5VBLcLWVVaXsNuAsnnffPV/uOSdMEdnFfgFXSsaPVO1xJ94BRtY0DKtYRc2eybbMuwTVcFi3HBrpod1az/Wo73XduKA6+B0nh3qGTkWMPAoN4FTFNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=DG3oEzaF; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="DG3oEzaF"
Date: Tue, 28 Apr 2026 12:17:02 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777371427;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4VsdcX/qUFeVQhnzcj75Hb3FckCFnDIqtslfNvFtrZQ=;
	b=DG3oEzaF74RuHl6eu/EVkruNXTngX6c+TYpA4OvUcZWSMKcbbiWhmMn3btqmBHdsxvy9d6
	Lbm9u9fUPDmNtBgZ5b21VPwsVAMb2AtWYIj6qRS3wGd8k40MC0Y8qoF6YPygaM03Tejr4o
	LuFE3YJP9G+0B98ZKwBfPBdbfZIMJMs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Alexandru Hossu <hossu.alexandru@gmail.com>, gregkh@linuxfoundation.org,
 linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
CC: error27@gmail.com, hossu.alexandru@gmail.com, stable@vger.kernel.org,
 luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_1/2=5D_staging=3A_rtl8723b?=
 =?US-ASCII?Q?s=3A_fix_OOB_write_in_HT=5Fcaps=5Fhandler=28=29?=
In-Reply-To: <20260428091621.739680-2-hossu.alexandru@gmail.com>
References: <20260428091621.739680-1-hossu.alexandru@gmail.com> <20260428091621.739680-2-hossu.alexandru@gmail.com>
Message-ID: <6F31E192-AB57-4738-9C9D-2C11931D2DFC@linux.dev>
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

On April 28, 2026 11:16:20 AM GMT+02:00, Alexandru Hossu <hossu=2Ealexandru=
@gmail=2Ecom> wrote:
>HT_caps_handler() iterates pIE->length bytes and writes into
>HT_caps=2Eu=2EHT_cap[], which is a fixed 26-byte array (sizeof struct
>HT_caps_element)=2E Because pIE->length is a raw u8 from an over-the-air
>802=2E11 AssocResponse frame and is never validated, a malicious AP can
>set it up to 255, causing up to 229 bytes of out-of-bounds writes into
>adjacent fields of struct mlme_ext_info=2E
>
>Truncate the iteration count to the size of HT_caps=2Eu=2EHT_cap using
>umin() so that data from a longer-than-expected IE is silently ignored
>rather than written out of bounds, preserving interoperability with APs
>that pad the element=2E An early return on oversized IEs was considered
>but rejected: it would bypass the pmlmeinfo->HT_caps_enable =3D 1
>assignment that precedes the loop, silently disabling HT mode for APs
>that append extra bytes to the HT Capabilities IE=2E
>
>Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
>Cc: stable@vger=2Ekernel=2Eorg
>Signed-off-by: Alexandru Hossu <hossu=2Ealexandru@gmail=2Ecom>
>---
>Changes in v3:
>- Use umin() instead of min_t() (Dan Carpenter)
>- Keep truncation approach; early return would bypass
>  HT_caps_enable =3D 1, disabling HT mode for vendor-padded IEs
>  (Luka Gejak, AI review)
>- Expand commit message to document the early return tradeoff
>- Add changelog
>
>AI review (flagged early return as regression-inducing):
>  https://sashiko=2Edev/#/patchset/2026041408-grill-mahogany-d1e3%40gregk=
h
>Greg KH v1 reply (requested truncation over early return):
>  https://lore=2Ekernel=2Eorg/linux-staging/2026042630-tightness-runner-2=
121@gregkh/
>
> drivers/staging/rtl8723bs/core/rtw_wlan_util=2Ec | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util=2Ec b/drivers/s=
taging/rtl8723bs/core/rtw_wlan_util=2Ec
>index e0d73c267786=2E=2Edd34f229df12 100644
>--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util=2Ec
>+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util=2Ec
>@@ -936,7 +936,8 @@ void HT_caps_handler(struct adapter *padapter, struct=
 ndis_80211_var_ie *pIE)
>=20
> 	pmlmeinfo->HT_caps_enable =3D 1;
>=20
>-	for (i =3D 0; i < (pIE->length); i++) {
>+	for (i =3D 0; i < umin(pIE->length,
>+			     sizeof(pmlmeinfo->HT_caps=2Eu=2EHT_cap)); i++) {
> 		if (i !=3D 2) {
> 			/* Commented by Albert 2010/07/12 */
> 			/* Got the endian issue here=2E */

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
