Received: from gz.d.sender-sib.com (gz.d.sender-sib.com [77.32.148.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C16CAD5A
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 10:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.32.148.26
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773053317; cv=none; b=bXUkqvRBV09KWUV1epb6dSma3ledQHvr/zN0PIHADbk1KeTAUTx5MzdTaS+eK1eMJpOkFgKID68wQg7d+V0zjvEIgfqDoMd4r6v1Yg/BR3Wphbphdf5ZsuapquSQ8HMGJwSi4iSgzaWbO0yV+afzP58h90bT3RD0OnLNiuhgPME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773053317; c=relaxed/simple;
	bh=Rm/HhuIp0KtnJ1GzzoXeGPepDUOGTsiMik0HR3BRK1Y=;
	h=To:Date:Subject:From:Message-Id:Cc:Mime-Version; b=iXJq1mwauJedGjVdJkk0bAxqiu0PrCStRNvWal0hXX9babOcnYQ1p+4x18Kt47CXNvzEdoX0ZX6RusNfMIlZDnYCbx3pLMyfiIwLLJZQ7YkgH0Z6mgc0GwPG6cEHfSM4Q5EGwfeQFx6u8Q/ITnDOXgTr7BhBz6/5z6pfIpAJHbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in; spf=pass smtp.mailfrom=gz.d.sender-sib.com; dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b=QbQaO3wo; arc=none smtp.client-ip=77.32.148.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=dipeshchaudhary.in
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gz.d.sender-sib.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dipeshchaudhary.in header.i=@dipeshchaudhary.in header.b="QbQaO3wo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dipeshchaudhary.in;
 q=dns/txt; s=brevo1; bh=m8f+7LMbeLxUJkZ4ONeUh1/AD+7LqpzsNMnu2yjanzE=;
 h=from:subject:date:to:cc:mime-version:content-transfer-encoding:list-unsubscribe:x-csa-complaints:list-unsubscribe-post:message-id:x-sib-id:feedback-id;
        b=QbQaO3woz+DV685y7Z0Vp6UjvDouJTWkQGRKEs3pIMarIqhOnd0fUTKiafknYCRRNH8rsew4E8lz
        jbnps6Nm12geQ8oEfHJAtaoBFX5bGOgMOCiFaqNiVHNiqK8ehBCiSQ20e//Gt6FoN7l158Uy8TMZ
        v8nhXrLxquJVBDZ8ns8+QJfEAeMPs1wV/T1yOfNhg4NZizNiI4Km4QpnmBqvZ4I7JcZHFT/kp/P4
        2OJgIjDfQubrHsiziIrTsA8sY6XGlFgIf7p0OcuoTyGwUotxPsyazrooQHDVA04tPCnsqHmC7VK0
        Q1pf3RWhmpP7quPoNbK7/V9Sf2YjNKC0p5Th9Q==
X-CSA-Complaints: csa-complaints@eco.de
X-Mailin-EID: NDQ2MTgxMzU4fmxpbnV4LXN0YWdpbmdAbGlzdHMubGludXguZGV2fjwyMDI2MDMwOTEwNDgyNC4yOTQzMzItMS1tZUBkaXBlc2hjaGF1ZGhhcnkuaW4%2Bfmd6LmQuc2VuZGVyLXNpYi5jb20%3D
To: <gregkh@linuxfoundation.org>
Date: Mon,  9 Mar 2026 10:48:23 +0000
Subject: [PATCH] staging: rtl8723bs: replace comparison to false with logical NOT
Feedback-ID: 77.32.148.26:10551297_-1:10551297:Sendinblue
From: "dipesh chaudhary" <me@dipeshchaudhary.in>
X-sib-id: S-Bhrs0C-7kIZ2YMjgw3bgECmZ-J1B9WRWlMHUCDOhfw9_onQ75uEi8zQtZ-FDgHHlTvuqwyRr7UkvGEQyR3Wc9Ic6uhPW5N7iOeBrOuEbF8H7ofEyOwZNLEETwwMjDKQqVUFgKMUrns-ETlIvESjqhnFjZFqsDhz930BJo47N70bOdeJeuKkATlDuI
Message-Id: <2108b131-65ce-4ef3-91f1-cd51ec79a3a0@smtp-relay.sendinblue.com>
Origin-messageId: <20260309104824.294332-1-me@dipeshchaudhary.in>
List-Unsubscribe-Post: List-Unsubscribe=One-Click
Cc: <trohan2000@gmail.com>, <s9430939@naver.com>, <dan.carpenter@linaro.org>, <ethantidmore06@gmail.com>, <davidzalman.101@gmail.com>, <linux-staging@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "dipesh chaudhary" <me@dipeshchaudhary.in>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fix checkpatch warning "Using comparison to false is error prone". Replace =
"=3D=3D false" with the logical NOT operator "!" to align with the standard=
 Linux kernel coding style and improve readability.

Signed-off-by: dipesh chaudhary <me@dipeshchaudhary.in>
---
 drivers/staging/rtl8723bs/core/rtw_ap.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8=
723bs/core/rtw_ap.c
index 864cd8b6d1f1..8f18175175ee 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -1013,10 +1013,10 @@ int rtw_check_beacon_data(struct adapter *padapter,=
 u8 *pbuf,  int len)
=20
 		rtw_ht_use_default_setting(padapter);
=20
-		if (pmlmepriv->htpriv.sgi_20m =3D=3D false)
+		if (!pmlmepriv->htpriv.sgi_20m)
 			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_20));
=20
-		if (pmlmepriv->htpriv.sgi_40m =3D=3D false)
+		if (!pmlmepriv->htpriv.sgi_40m)
 			pht_cap->cap_info &=3D cpu_to_le16(~(IEEE80211_HT_CAP_SGI_40));
=20
 		if (!TEST_FLAG(pmlmepriv->htpriv.ldpc_cap, LDPC_HT_ENABLE_RX))
--=20
2.47.3



