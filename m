Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA1175A7B
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 00:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775175216; cv=none; b=k7Helg/1a/LmNdnqAd6xsmF7vJEsNse2dLimhgrr6Ba96P2DlFGMRFejD/cZJgL1EQWCfjvBPuUV9XLwXXwzACrbghNKpCdYWkpItd2oHUfeX+BztsGjPa9EtXDwTF1EK8FJU5OeBpgN9L5L+/mcrJSpdDMp4Sm23De8bycE3zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775175216; c=relaxed/simple;
	bh=IH/tmMyyAD7K3KS6OQjBSn3Ym9sjPK0ZOxMqooO+6zE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cLuvKcaOQ5tDq8lc9d8XiWiHfjssabABkyEo9awNJJgOpY5meMI3aebxyuzdHt2cYx465lAVeouF8O10bEpoa/NKa+xB6/QFzgkwmfp6ILZQxAnT3iotxrc4jBu65EsY/hYbXB+GhdgbYyEIwf4tlYP/5Y5UXHlMHK42YZfnnng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UcPMgRDC; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UcPMgRDC"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-2cc4c693d59so131590eec.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 17:13:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775175214; x=1775780014; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6bRaWaNaJWXBrNeJHRZkwLUPUJxCj8JR5beB3x+F39E=;
        b=UcPMgRDCHvBWxgHWDNZWLofC6+Opxu5lERk/q+mUEDSF9mWM5niZ/CaYiqJPn1xBVh
         pAj0oYb+0oqLDPzuKqV5QD2njnfCKtM2T4nUrtZj/dP/lXvpr60Wb5v96W3ZqYKP3/+W
         ux87IsoQvC4rB3BszzKsQeoF/9HWYYC2d/ygTfr5DTq3LvmivCiABIKHVLqOhzBA8gK+
         acKLETwH0j0wqoFJaJhwU+tLt84vFWFvFTTuEP0H0sOQKQw7NgiJjNWwz3YOTAw9CNL2
         tpa8n4A0xS3EAK3mZ6kpJySnWcb8u1ol5smc282rpcMf5Uk7x69A3vso1ad+Dl224AoH
         90PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775175214; x=1775780014;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6bRaWaNaJWXBrNeJHRZkwLUPUJxCj8JR5beB3x+F39E=;
        b=PMAuXo6YFk4lWAkQhuO1uBuPJiJqX02RW0wHbEZ71Mlbn+DrsV3DHTfAwBXLxNMOTC
         mizorPUM63MT/VrR3//wlcsXqzxzMtE23AFRxjVZiMknqjDhlxqjYTO74PpEkAeUJqHZ
         rHHt9szlzNbLurGQZRZyGJgfZ+j3db5r80go+IOJfZdynU2mrNqDNIlB1+vGgVeZNtea
         hdI62Kuvwf+jtw8f4BbG/htVOVyP3OSEXDJwfUwZ3kL3VYdZmUOYAH413l564R1KIITH
         IM26BX4jJy/PMJFKpSBOuBHiddYr5fKU3pNR95WtRtV8tzvXX/Bk0Ld8MUfpn3wPCZfg
         iiZQ==
X-Gm-Message-State: AOJu0YyTnZwC+NyLl6zqJ+0IWIz81dEOqBKmkidNuUqOhxMiQm2SOUVl
	O+P91BQqLgQNcTUhHUPltTfTtX6rqdMoKFWgz8fMsa0dliSu+pjB8035
X-Gm-Gg: AeBDiev3IDaPTNgFP4swi8MNDNPtSNk/e4cayXIB5Kg6Inu2Jb2/9rIx62OA9sKiIDy
	klIVSTreHd/V8vAyshgY0QRQH0QF1g4EVjg2MKycZBEn5y+mNQKBeNBmpC1v97vNLnQi5mhRY66
	+O5kKR3FfxkxW41mNL8KCgIdP5daSUdN3SI9Qv01FWUr0x8wx/XROO/ovonRWhB84KkZVldYG8V
	nHr8W+kLaVxBmeLw+mQhn9uwRXzw7/KMFuHPpZuO9OzPl560v0VSufVrdLT5hSVTlybhr6yrytm
	hoziVf8GXIYcVpCkJt4w0sXS3lydbOYmEOgg+I/xHbfSE5FBAlpJVFyXWid/HoaeZJM31mQWZSX
	gS6h9rTx2eLW6uTixnhMM2gie+CQtR1UzX0hm4xk4gw4bVMRYXjnczu4RSARZxDp10II6nTxYej
	ePkLMCqoYt/cWXMpsYZJ6zArv4gvofrA15I53N6hKdDFCAcPc6YwhfmL+fZ7zA92eKjQ==
X-Received: by 2002:a05:7301:5793:b0:2c8:409:a9bb with SMTP id 5a478bee46e88-2cbf6a8e0cemr642209eec.0.1775175214271;
        Thu, 02 Apr 2026 17:13:34 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7c20c30asm3991453eec.15.2026.04.02.17.13.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:13:33 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] staging: rtl8723bs: simplify xmit_frame initialization
Date: Fri,  3 Apr 2026 00:13:07 +0000
Message-Id: <20260403001307.5722-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify initialization of pframe by combining declaration and
assignment, improving readability.

No functional change.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..84e58e53d708 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -239,8 +239,9 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						/* pxmitbuf->priv_data will be NULL, and will crash here */
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
-							struct xmit_frame *pframe;
-							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+							struct xmit_frame *pframe =
+								pxmitbuf->priv_data;
+
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
 							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
-- 
2.34.1

