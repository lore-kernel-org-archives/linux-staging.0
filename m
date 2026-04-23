Received: from sonic311-14.consmr.mail.bf2.yahoo.com (sonic311-14.consmr.mail.bf2.yahoo.com [74.6.131.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A786F33439F
	for <linux-staging@lists.linux.dev>; Thu, 23 Apr 2026 20:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.6.131.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776975779; cv=none; b=CHPkYj5Am/rc25XcHueR8AD7OqUsJpIPHnzLculmkIx2tl8HmMGXNDL1wKVKGQq0GTp9B2iWwdz5iH17uwbwOhvI+2i4Ee73e9xPLgX2b7RuXhywNuhtPoJVOkVz3F45cnnrjBsKnue+Rlw1I1tNVdpVAhKNDVmKpTlbguKFABc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776975779; c=relaxed/simple;
	bh=5rau5mFzRT4klIgQvzAgr1YMnO8BP9BwUNZbFkfjCqY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:References; b=bBvGzgpjl1ekoho7YkufKrfxoMmu6yjmhWZ9yVE2OiXGObR2bxhTLBku9XE4ldJL/WJaQzoF0bFVO0z9+NncN+AESh7xFM/r2ssZ2rOzHK9TcsBiaFk/WJNno5/6hmbfA15Ti5Kg40eEQTPndRSJ0xlVXatKyHudSop4Zf8lxaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com; spf=pass smtp.mailfrom=yahoo.com; dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b=ksErBAFt; arc=none smtp.client-ip=74.6.131.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=yahoo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yahoo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="ksErBAFt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1776975776; bh=gnfU7htUTcW61FkQaHXpRNP2NqHio4DbCxPAlXLli4g=; h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To; b=ksErBAFt6fs12Tpx2eq6YDijjsrqCssO+xHRRVdzrI8ECS0BQJiidsRmTSwrSGpyuTDNWcY2F6LJFqo8z+RaMBqv2PrmL68rjm3pwn41DaIxZzbG/5TkUzAZobeCcvd4n4h1pSe2h+eTObcYfrS2VLRFKmi6I7xAS4LIqPDhGkJVKqNtQyFgypNl8z/kapCN3tFqPV+nT7iI5EkOqlsWquiNdZ+KLRVZqcAB9g0r9cCqeIwINWSElcX5FRRpfOhpl3f8Bd7awFk7HOf9YViJLx4dWMtFYJZBbgGrAvzyklTrAAX6No1bj+pKYsKxhmlDOf6ZIq+Qg5yjuoaHxMU+fw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1776975776; bh=ElsF5P1rgEfSicgtueerVEX2guoVcBTaZEz6wcarA1K=; h=X-Sonic-MF:From:To:Subject:Date:From:Subject; b=lzmXs86kdvjHWRvkw37/sGtx3g53nJ9ooERcX+3KRfE+RvaT+HIyr9thTkeQxSPiy3DR43QiqQ34JKzW6wAl1ebjE3aphOir5PRbA1UuW6gF9o2gSDnd2lwu/cqCoVAlSUiMK/pAfBOZwU0yjs/bNEeLtCp/7uGO3bYW6qA3T1M8Ak9ZKVDWbdpIJWlLglsNaUM4M7+LLs3nV4plzoLWLnU+KNi6pcsPFJXR6L7df+eWecLXZD6GQg0amFPADL5XZ8gyqYwx3m+Wq4a34tro49vDBj3+KE0d8Yl7VFmwVFWdZ6UecUM0BhUg2lXZIZ3nMsqgebs7W1EkIhHm0m7Pmg==
X-YMail-OSG: dIYxM68VM1k0CdIGBKTjj3_x6zILELVKvvA0cJ0bxVfMFtdEWN6N8Ul7pBaakmo
 3ygB6JIpvE09Rz.Hwt9KvKDgYBFiDqasFjqXf0a0Snmq2I.IVSXtntS4PljzIW9jYf6up1e1meZB
 YwHCZ9xLjD.uF1c6wejquzQ6ec0IsiipodmsHr3B1R4LV2MPNdHUYnHMRRCUUJrGVF4C9.DGDr3q
 cyh9e0qWsvxCcMHhTBNH0dLdfbpjaNuIUrmvwXI7ohD6iKODx1yzcxdDOA5Bxq7PuqnQEHM7IApq
 24LWfcvoYmxvIqmyvy.vtpWdsdygH4HnDlLeU94qzudQZ5tQ6KTUZFM3Z9onOfMGmZYmSbYPxp0a
 TUGMVCB3XpJLrVdd4I6iKzjCeotxpUx8hXWvrcgAnScZSasFF60O5wlXCi8SA5aSz40lqvAl.8nd
 32k_xP8FDtb6oyC.OA3yqBzmiNZQwCSVVnD64G0HSRY7m85aXpkFZPttEbnr.wMxiaOcUogWcPt4
 cgdqdGN3Dkg8cWbqfFLxaYyk5UKrxB0HDvOQtnSp1aXk4K3pTE3YrsUlL65RDnH5OL3HnlJs4Tch
 JSAPPjQ6mPv5NZWJLClIwL2En.96iYVgoUXzlCWXQC_nFs0RZvXJGVovSEuOSLxN0RU5xjbsOl_V
 SpWUorIhqEGbIWxGXfYpT30t_eQGp0.0FXkb5656hr3V_iT.oHV2dzMzNYkb0tKCpQdgioD0P2_A
 tNEgm4YMy0Vjsyn.hxerO6BFTAPJB6pK18MQ3WPNLhMgyW.m31Lc3fXlnZtd9YAHbVWgup4tUq00
 mouHa8mmIepEqca1DNIGBCbYBEuUbPfi6bArC2rTysxpenw4GF5juCaSdw.qkXqwqgV_eOwbbPAR
 QKnw8rbsH0ZYTH3ZVvUrfFVDm0KeBd_trA9sDNX8y4LZCGQ3pXeFYmwMlmZYLVtK7qrnTpofETOr
 Q.yHjWq8rlo2imjKLWMruTGsjml0N82Nlp.FDd16JrYWZnZGRLwepYkKc2oBMbOQBOWTvHdzTkEq
 p6HLD2CGzA2K4lChFkvk.5vNtFU3Grm_D4QkQa9iIfjhDeXsZUmnZzJkNeT1VMpuM7gc4dIgYXzG
 mWyZ5_JKP6MZ4VAUGmJENg6vdWCJT80DuFtk.zRY7YNfP3dVfFzxbve1t_cVyB4nw8B6wRwa1RbO
 jdcWpr1_eaXu4XOBXIJYYgOs6nW1hc_9cvnEaF8_ZfDzO1Suo8kHCVLScmR85P0lK8qtY0YK8bN0
 5.Tn.31qZ7aPg3t32eAYcFTy0k19YPNSc8QuAOI_lStejH_z0NiQuzHT4yxg.fqT7DJIOMrCSJ4i
 Cah5gYAsLtHnk3K.ebN3oT3BD.ZY_Gz5hGi8Eq7xIP98izlC8YYGPZujYVxOkWiLmoeh2vCxg1Yj
 _56XzUTq6Y5S2O9P0osAO61v1V0TYID8NkW7hPZCf8LALUVzYiNulKIjVwU2PedLO5ySMLuv.qn5
 8Z1Y.kMuGpMigs5e2yjXcR0kW3j88kDgzyctfgQx7Tkq1VuKFaBwmni5pdTjQ.XZyut3_pSXG9T_
 v6Q_HYnsLDxWknRcg2NsGo6NOfGYd3N5wlLP6B7uAX1NXWueiTm.mUUE92Q_Zy4kufd1kq0KOm73
 QHeFOiebOl4D4zmFLOSyDWAsD.uVqqQU3yYSsIZKA0dyUQ0hTgKg2CX3l64SpE6ICZ1We.znCWI3
 nn5BAG9qrRHttLSZQj0XtlFXNc1Nh4MGlfGmWxBF1B4Qa1BSLMml8P6pO2auolnnfPyKPO6.vZvE
 7a6VjDDgh2ph2u6U5e07pY5jlbkmaN_pqlB5N8.mXSBIC7pn2D7VTDATaLNvUk6sxGsT5kSbfy3_
 s_AxdI8VA.QWjPj_RUy_E4vifZ9W_4hpo4mgIE0VTfzD.zw4mMrJNChnMQyhhiKbdRiVvwOol0fq
 _mkFxLF2tF.xkl53TWV3R7ksbHwGFQp.2lfP8cqxSY1OtOLvDe3yZdPcLiGe0UifE44KoNt6yF6C
 NyEzHsZbltSqt3r9q2DkRY0WZuuLmNkvKL4yuxYO6fXzsDbbpu6tQusdsYjDyq760bl34PPvdlmt
 k5v4llCbjanntnYJFSiMcJ8Eo_F3heJHpGYUxPg3EF9OiNcWG9rFGoJlLaYPh2JipnHacVN0osPy
 fNNW9M_ZETBPXsaO2fyHnebzIi0XXTodcOcxON.3l3mDsDJJyNS7p2GbpFWow9WgMCu7hvord69Q
 ziC5wMMcHWmdi21.LYCDGgQwhsps6LiX2dTvD_3RPyrRo_kzPco1zod8A8r_tlGDrsWHQjGLavZH
 nS5fDRGNH
X-Sonic-MF: <hcazarim@yahoo.com>
X-Sonic-ID: 96f0149d-df18-4e9a-b68f-246b8566371f
Received: from sonic.gate.mail.ne1.yahoo.com by sonic311.consmr.mail.bf2.yahoo.com with HTTP; Thu, 23 Apr 2026 20:22:56 +0000
Received: by hermes--production-bf1-758444f76f-z2s6l (Yahoo Inc. Hermes SMTP Server) with ESMTPA ID 2ec4fba892d189cd5779558938df5477;
          Thu, 23 Apr 2026 20:12:37 +0000 (UTC)
From: Henrique Cazarim <hcazarim@yahoo.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	gregkh@linuxfoundation.org
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Henrique Cazarim <hcazarim@yahoo.com>
Subject: [PATCH]     staging: rtl8723bs: add spaces arround |
Date: Thu, 23 Apr 2026 17:12:12 -0300
Message-Id: <20260423201212.77701-1-hcazarim@yahoo.com>
X-Mailer: git-send-email 2.30.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20260423201212.77701-1-hcazarim.ref@yahoo.com>

    Fix checkpatch error "CHECK: spaces preferred around that '|'"
    in rtw_ioctl_set.c:154.

Signed-off-by: Henrique Cazarim <hcazarim@yahoo.com>
---

Hey, this is my first patch, I appreciate any feedback, thanks!
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index c70541f95a73..edfb4b5e8db0 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -151,7 +151,7 @@ u8 rtw_set_802_11_ssid(struct adapter *padapter, struct ndis_802_11_ssid *ssid)
 	else if (check_fwstate(pmlmepriv, _FW_UNDER_LINKING) == true)
 		goto release_mlme_lock;
 
-	if (check_fwstate(pmlmepriv, _FW_LINKED|WIFI_ADHOC_MASTER_STATE) == true) {
+	if (check_fwstate(pmlmepriv, _FW_LINKED | WIFI_ADHOC_MASTER_STATE) == true) {
 		if ((pmlmepriv->assoc_ssid.ssid_length == ssid->ssid_length) &&
 		    (!memcmp(&pmlmepriv->assoc_ssid.ssid, ssid->ssid, ssid->ssid_length))) {
 			if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == false) {
-- 
2.30.2

