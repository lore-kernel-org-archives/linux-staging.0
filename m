Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07E4048A3
	for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 13:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782739607; cv=none; b=jkRpzziZbN0qkZ4MNTADMI1X9h7RF3KXDTG5X0R6rPpaszZ9ZWaLKl74LRuLpJ0BjKzQXLbCgzBIGC2LfRE1ww/Fms2zMiVpPdenckYV4aY6KZQeKUgtG0cXGw4IaIT1QxR5gLl9IXxIVsdTroLORiINGZYK3huDWDFu442/tOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782739607; c=relaxed/simple;
	bh=YEzZ8JhPCDsyOliz3prBRhRKGgHT2dwxCHOtp5fmFSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HG3cVnkrphwAj5dzIp6a0sxPtcychZ+gBXkCos/MPXPldwrf9FMZ3VfgR6QF4cwt7OeJFETKOR+8f/o00rJO9L/WHGeBUEMaUYmn4a+62jLN8c9vlerdJixKp7pLqgD8LyPZ4rtOWCl9zyhlA9Y4FheJWGBs1SVeMo1zbxd+VGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ps5ms3DV; arc=none smtp.client-ip=209.85.128.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ps5ms3DV"
Received: by mail-wm1-f65.google.com with SMTP id 5b1f17b1804b1-493b77b150aso474045e9.2
        for <linux-staging@lists.linux.dev>; Mon, 29 Jun 2026 06:26:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782739604; x=1783344404; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DEeGpCqAJdhaGT+mxRYABXQR8WS3drKLho0iS9oISdY=;
        b=Ps5ms3DVgAytbPMWno/GCVH/4pDWHfLaJaanRRkODlXO/A7m0YHBWaWY2jOx5N+BeJ
         PHYpQvPexJWEEikgbNh2EG0OEuLissz3uh/bc9IKu7U6PtuDB7HiqiISs2ZO4hyuxWL0
         EBcuS9piCJoHHWOpGD/3TrMW+l+ZwbdJwo+ZYZp6oyRzjljtrCYY3NJrtNIwy7yJHCW4
         11dAj+U6MB4lUJcD4Dhig+MsAXv4caZAIzVFX0bYm/wmSuDZXx6vRDc2jqcqTirr097o
         Mi5GDohO0cHVMpkD6m9IhhvcrLr71tePSdBsc/OQTURRGAXlSsOdCbYzU4K5lPSBEo8D
         xq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782739604; x=1783344404;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DEeGpCqAJdhaGT+mxRYABXQR8WS3drKLho0iS9oISdY=;
        b=dpgDH57sfozOB73mp1bM4r3cIHqEzlfRWhijaSe8qG85tYsOgPaI/ot1Tu/KycNI4W
         PcgUuGipR8kx29WwIBSodoYiM2/3J7oLp71ECvi/zo27q1tGiVesHKyG198mIUKpLJ2y
         03dUj60sCGoaCtpaTDsCjyFLbtEidrylZtftHEimQMp2LtNwGO0iMPDsOKC7KwzgxRZe
         YO7uf1r8xgC3fKBxlOCZ9v9LtsCk4qiS8Bcq7JMrANsFGueZ+OmaWjgVFtPlpoU8F8pX
         tFFHWOboLFGsH0L5rusVWl4Afs/eeCiM/hg22vBxsBQ7Z21O1opaZHVO3bi+ZK1wVkp/
         yFTg==
X-Gm-Message-State: AOJu0YxiBeMpD3Ayumk9Phx5nnv8G3NQRXHYIlmaUX7j1rDLeykOg1Xk
	ek+jFtlJU6sqxp/afZS8Pt/k5cn9rYclrTkkaLU1R6pPRFS5Z8AFwEdryjhLttjB1Olscw==
X-Gm-Gg: AfdE7clV/KKgQd3CtdevLBJrDwGx1GeyKhqw5OhEq7kZ5/WxBGml2yS0XhXiHoqopKd
	uZIpys+pZ/Shpy1RFvnP6oO7QehBaTZP1kJPNGfZJOxx4t/rEbYldElXRje/S0689wDXzO3PPr/
	yf6BDy0NFnUs21cWOxv3VvOvBJl0xY48FQg22fw7Y6AdavFLt+80Z3mYk+Cne/2j62cFtkYigY6
	0DMLiHMX/5Lji1q05cme4Sozyp+kDNXkjEzIUxvE9QCLJLdzKZXvlXnqqHj9qhWbCdPcnqJSiET
	u3HTR3Z2spI3TdgO8XZvI7MgifWz/d2kUoi6iMaoIE6sk1m4W2QvOcQhq8AuDc2kRitLtKlOJGY
	riIyrIqk7QihjuiT7LaJI5NGuTzE3chgnaO+Cd0xxfYMRkh8bBkLZpdaQhXTbIcnI5Zmeys5Gha
	HdwHWXVg==
X-Received: by 2002:a05:600c:8b30:b0:493:92c9:1e6d with SMTP id 5b1f17b1804b1-49392c91fbdmr140813225e9.33.1782739603957;
        Mon, 29 Jun 2026 06:26:43 -0700 (PDT)
Received: from myhost.localdomain ([89.253.23.109])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49268fc0d36sm494655565e9.2.2026.06.29.06.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 06:26:43 -0700 (PDT)
From: Ruziev Miraly <miraly.dev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: remove unnecessary braces in rtw_wlan_util
Date: Mon, 29 Jun 2026 18:26:29 +0500
Message-ID: <20260629132629.107724-1-miraly.dev@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary braces from a single statement block in rtw_wlan_util.c
to conform to the kernel coding style.

Changes in v2:
- Drop changes to rtw_xmit.c because the removed NULL check was actually a
  false positive by checkpatch.pl, and removing the if-block broke the mandatory
  goto logic. Focus only on rtw_wlan_util.c now.

Signed-off-by: Ruziev Miraly <miraly.dev@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
index 1d37c2d5b..cc05decd4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
+++ b/drivers/staging/rtl8723bs/core/rtw_wlan_util.c
@@ -256,9 +256,8 @@ inline void rtw_set_oper_ch(struct adapter *adapter, u8 ch)
 {
 	struct dvobj_priv *dvobj = adapter_to_dvobj(adapter);
 
-	if (dvobj->oper_channel != ch) {
+	if (dvobj->oper_channel != ch)
 		dvobj->on_oper_ch_time = jiffies;
-	}
 
 	dvobj->oper_channel = ch;
 }
-- 
2.54.0

