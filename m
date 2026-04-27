Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D110623ABBF
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 19:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777319435; cv=none; b=fV2Px/Puu04pmCMSHEdSj7anvcMRClLDgjc1YgmyTUtzuj2WNDvgn1yyiec4nOOMTTaoRu+OhdiaWeUgaxEMuz8XpMtAZQbtdXUZ6/gYp8yktU0rTIAjny2uKki4iPhUtKIoa2Fwr8gfyArz4su/eT6/3guGtlcCyVGP3InhZF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777319435; c=relaxed/simple;
	bh=uP/yE/XERctmEatx2KlDEK3Tl8amAEEoSM6mo033cqI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=egFEJI5tM4Q+ZB6OND9zZJBOBpzQVSxb0OeI4TQx3dWYYNziKHLQ6IvD/KXBUiEAmY4LIkq177GpmxYdm3oi+OotgUyCKsLVFKn2iEyj5wzHZm0Z4mtBOrjA3wSd4+IXdfaUjhcTxQ/TbNN9cBSmFvsBffTyFxq6VcBEq8CZY/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G4sJ/7Y0; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G4sJ/7Y0"
Date: Mon, 27 Apr 2026 21:50:21 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1777319430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tnroxKkG71DTG4Yug8/U1Sc7Fd0OhCeIZJPxC73IJ04=;
	b=G4sJ/7Y02/UKBKyY6nVkiBCzlQcrfi9TrtOjwwusmDHHc8cAt/pW+q6Ysuco3CFFyBDOPk
	FkH2iXa88l405PhE4Zii/gO8vbc0I5fyk113stcak15aOEXFIgc/a3RRttiJZ6+59aQeOT
	LT39nYnFTXNXlrniT5mns+HHpLvuih8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Luka Gejak <luka.gejak@linux.dev>
To: Miguel Cyrineu Vale <miguelcvalealt@gmail.com>, gregkh@linuxfoundation.org
CC: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, koike@igalia.com,
 ~lkcamp/patches@lists.sr.ht, miguelcvalealt@gmail.com, luka.gejak@linux.dev
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2=5D_staging=3A_rtl8723bs=3A_rep?=
 =?US-ASCII?Q?lace_NULL_comparison_with_NOT_operator?=
In-Reply-To: <20260427193759.71642-1-miguelcvalealt@gmail.com>
References: <20260423184219.827694-1-miguelcvalealt@gmail.com> <20260427193759.71642-1-miguelcvalealt@gmail.com>
Message-ID: <A7288F81-5DC4-4643-9DFE-C7ED20A3B454@linux.dev>
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

On April 27, 2026 9:37:59 PM GMT+02:00, Miguel Cyrineu Vale <miguelcvalealt=
@gmail=2Ecom> wrote:
>Fix checkpatch error "Comparison to NULL could be written "!psta"" in
>ioctl_cfg80211=2Ec:2432
>
>Signed-off-by: Miguel Cyrineu Vale <miguelcvalealt@gmail=2Ecom>
>---
>Hey, thanks for the feedback on v1! This is still my first patch, so I'm
>learning the ropes with the DCO and formatting=2E

No problem, I'm here if you need any help and feel free to cc me in=20
any future patch=2E

>
>Changes in v2:
>- Use real name in Signed-off-by tag=2E
>- Fix commit message line wrapping and remove unnecessary blank lines=2E
>---
> drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec b/driver=
s/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>index fd3bae31b0ed=2E=2E8ae3adecafd9 100644
>--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211=2Ec
>@@ -2429,7 +2429,7 @@ static int	cfg80211_rtw_dump_station(struct wiphy *=
wiphy,
> 	spin_lock_bh(&pstapriv->asoc_list_lock);
> 	psta =3D rtw_sta_info_get_by_idx(idx, pstapriv);
> 	spin_unlock_bh(&pstapriv->asoc_list_lock);
>-	if (psta =3D=3D NULL) {
>+	if (!psta) {
> 		ret =3D -ENOENT;
> 		goto exit;
> 	}

LGTM,

Reviewed-by: Luka Gejak <luka=2Egejak@linux=2Edev>

Best regards,
Luka Gejak
