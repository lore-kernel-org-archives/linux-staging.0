Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C303446CE;
	Wed, 10 Jun 2026 16:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781109827; cv=none; b=E0KUQg7VQdmH9agQFgL2Zssr/BTV5qU4u8ewXc6ZUl2w7XmTHXW0Og5XIomMEJmX+pFPR2doL+D61qLeXrSWYkp9o3JGcRMu+NAIeKDGdf3jueN8z8raZnKRswqAJ/abKrF6CHXZR4d4D3Megfv1X3zb5H/gddv0A9vjy3/7mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781109827; c=relaxed/simple;
	bh=jjNr8kVHPggXIn/73FLBxXDJEDMtoMEL0Zz6Rru9Kj0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=An/Rn5bnE+EM6bJ+UOv/r5xT35t2O8QNZtJkvGTDFD7sPTQqDTcmJ6OCyefWndY27DZAGT1AO7aOfB6rWjtq7ItZDNrQ6FEoh+PexZhYZycBaEORgTXXIgzC1EgpELPgFtSe8Vpyhy/tm+U+weXZlIh4V2U8qjkgVkeTVgYfDUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cfzcP2Fx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cfzcP2Fx"
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id D745E1F00893;
	Wed, 10 Jun 2026 16:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781109825;
	bh=xoQwEPYmjmd7EbAV5WbVi+9QReEBdpaGx+NiE/5Qx9U=;
	h=From:To:Cc:Subject:Date;
	b=cfzcP2Fxgdswl8YCMbX1V1J+3TpkDbjAvmku56ILRP9PwoBhSbbfGd8SO1muoEQFV
	 vZETp8bmVwW2re4S5DqeSqCfCa2fAK1lO2V9FXhUlMYKZGA+8b04m0VVU5+PT8Ukn9
	 1UUpOAevgAkz03+nMgt+82yR0cPPupPaz0wEplul5unfNLuMEUYN++v72JPS9TGPhg
	 ndKll1GDgAd3yVK9hylAs/hxu0O8V/j9XvU39XK9b9dZnpiQPLnKGGdQP0RDFOeDZ/
	 C7DsIdPFrAjywovG4jKlLtKokiWIYiMR8qkPoaKOmDNigEtzqrHWPDaj3Hu+PVa5b4
	 TseEBzYeVDYqA==
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Nikolay Kulikov <nikolayof23@gmail.com>,
	Luka Gejak <luka.gejak@linux.dev>,
	Dan Carpenter <error27@gmail.com>,
	Omer El Idrissi <omer.e.idrissi@gmail.com>,
	Michael Straube <straube.linux@gmail.com>,
	Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Liang Jie <liangjie@lixiang.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: Drop unused parameter from rtw_sdio_if1_init()
Date: Wed, 10 Jun 2026 18:43:35 +0200
Message-ID:  <23949de4c5f10e78a4bd85e333d7acd47b2f66b7.1781109707.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1256; i=ukleinek@kernel.org; h=from:subject:message-id; bh=jjNr8kVHPggXIn/73FLBxXDJEDMtoMEL0Zz6Rru9Kj0=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqKZQ4QUAUHgNjkC1azFKPAtJqkW1eD1Gb6eMpg 40I7CEqaWaJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaimUOAAKCRCPgPtYfRL+ TuKUCACB4MClOxW6tahDjYu92GB4LL+hLcAamwlHA9ttmmpESFXjjevDBBi9IdOZ1bX/KZFQp7/ pieVqgYYHF8ZqF1ReRX2ywifgXKqbb6it96AzX9yuAx/rjXnImFU2ftqkgmJczp+UE/84907pJn rsdrvzVW3KR5W8fdkl9O0UzlPohsxwjoAWXmKCbSwI6u8R9kPMloACBp7ABEEDsCrLnmcjjoqRm WwzZxT9kJUn+55fC7+3YwukHpybdnV6mZVxJwR2AgZGxP53chmiCzJls/YAwf4a+98abgdtmV7C L/wPFgbt4B5DE3xFxwdYNjdh4QOUldFTJmByb29SaJ48ikQ+
X-Developer-Key: i=ukleinek@kernel.org; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

The function doesn't use the pdid parameter, so drop that and adapt the
only caller accordingly.

Signed-off-by: Uwe Kleine-König <ukleinek@kernel.org>
---
Hello,

I noticed this patch opportunity while working on a change to struct
sdio_device_id. Only compile tested, but should be safe.

Best regards
Uwe

 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a5ca..06f00d35ced1 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -215,7 +215,7 @@ static void sd_intf_stop(struct adapter *padapter)
 }
 
 
-static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj, const struct sdio_device_id  *pdid)
+static struct adapter *rtw_sdio_if1_init(struct dvobj_priv *dvobj)
 {
 	int status = _FAIL;
 	struct net_device *pnetdev;
@@ -346,7 +346,7 @@ static int rtw_drv_init(
 	if (!dvobj)
 		goto exit;
 
-	if1 = rtw_sdio_if1_init(dvobj, id);
+	if1 = rtw_sdio_if1_init(dvobj);
 	if (!if1)
 		goto free_dvobj;
 

base-commit: abe651837cb394f76d738a7a747322fca3bf17ba
-- 
2.47.3

