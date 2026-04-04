Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44092CCB9
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 07:27:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775287621; cv=none; b=aJWdbHtdstyGq+gArSCu5TxduMQKyGKFdX4BxCGZqgRbuVMOEydEgCQkOB1p9pcTZnFmpvk3vGCQzImwA4eVzuw57hhU37D2a1OyUrCInQj4ODhv7H2ha7WLJJa7THeQW9FFN/ioq3GDaCzmBruyPotqyeA3v0575pa5mTzQ6vY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775287621; c=relaxed/simple;
	bh=sb2fmB993ebXnCnaEuIeIRGemVRQkR1+ufsm0h+Y+ow=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ci+giPVhXiX+qjdM6Jpj7MoxrJa6qjg198sEx0gyZTRDmPrOEeWKQt9VDVMG/4wE8WjcR8/nR3ciF2XMoGcr+oTGCMsJKF94+cB1dVlEgCyZPGaK6ItP3U5sG4mkIr1AFskcn9+ib3dJgifVvc4t/4+l+6xuUpGqqAWt0X0aMEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVWCXDcc; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVWCXDcc"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-35d971fbcddso1456937a91.1
        for <linux-staging@lists.linux.dev>; Sat, 04 Apr 2026 00:27:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775287620; x=1775892420; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nj5Y/SorWLtFN0bUiCoURTSzeOJOZqdTnQqo2WBg2NY=;
        b=mVWCXDccL4ZjH4FrMMmFhvDLrHygD6oMAXpnLr6wEMJgOVJuE3tOyIYKpRYN4cmE5n
         Jyxz/ZBgFY1j7+bLDAn5CSf2F2M8OJryxUX/3Sm4Tc+kIU5ZIqtAfJa5O77aHN9fDHmW
         tpkfOPWTiblvtWOSANFRfTzJKx2MSaBVn/DyY1r6+XZ/vKCFev7qbKR3gSF18yKNMOln
         h8soYjvRXZ+juQy9+jabwvDGlWHKrLdyapfSminJ604ijmcU1Tq2UadoAYysKJBBF5Ne
         ppTBChyoLR1aFkt/FGC+aTnPk6xN84XbKDgPH/SjfLMfGiBTJUv+hxGn3bO/eoh8BLqU
         0dcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775287620; x=1775892420;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nj5Y/SorWLtFN0bUiCoURTSzeOJOZqdTnQqo2WBg2NY=;
        b=Jt3ZCuI/SJgtR/4BEl468bR5oMP1puSuOm7oq0+EHGdjdilQM87Bd6Dz9015ziLqOZ
         Dze7iciAhCK43rMbIn3VWQT7Ud3L4HhPIKR1H1wqW7QS5YpcI0SgVUjSB9J7gbodX+Ok
         L5zZLEPHFuqZCASwOCqhMMhJ7KYdVq0ZE503ZFEh2g0vEuaWj5XXaeL5TwvJw10luXkS
         XT19EXRnB522GdoV98dOpSgkA5buKDp44s8vWdzfQBZcTfRSZDOzjSNmiW6dBmfMYjlN
         vbsHKnM0BmuTgtVBK/di/aC78OalmRJaVZdmy5VetWssTYdSOIpjNjI+xuKgQndphIWi
         gdxg==
X-Forwarded-Encrypted: i=1; AJvYcCWiZ3G/jQ+AIU2F/xcTcubhtF84m6ZbrTpb/Hht72+59kX+RHRy+6gQ0n+nqFy7btW7IOxb2HJrRk14LnXL@lists.linux.dev
X-Gm-Message-State: AOJu0YzpgFEYqKaGqXKNqTFyWt9jBLXktc9j+WA0xeO9c+rUhxc+cPl5
	tAaul3xaobGrx9peGyXxZCa1L+scDnD4xNT505B6JvadyukCEoUFxJuK
X-Gm-Gg: AeBDieuiUWSN+3LeSEGHQRtOtYHc4ScoYnzhiltczVrhj6/T8Iu7hPTOyiz8oNIymHz
	DnzAbPMsi+zVV6y8ZI+U8r2XNtdPTAwE3vgnndlIVvTtul+S8OHqQyuDDmYsmMcVmnaie1nDIYz
	iDbvS0MscLgLZk2ypwJsQXP+sVlM1JFVNxs/gIdF1P3JUqPf96O352jiFZ46+jBSuN+QesWTZiV
	ZHhNlaJGlM7SFlliaC64MOT35mXEsMenNVZNtDUjxHdDt11XQz2k3dEG412nHUHf0hudxI7ROaP
	uDhmyybmW0+bLgLHVxS9mKzM8A0lBBDNmYJp8uDIBF9McQ8iTSwWNZK3xA1N1+QbhCxoLY8KXIT
	LN7KTgdPdZdvMq9pEQNH1XIcsfof+SfbW5S1RShU+qawuj9tG2tPUBxN+cYbosIVdvJlPlWb0Bq
	uidDAf9KrWyN3ZKPPAg3GYiWs=
X-Received: by 2002:a17:90b:3f50:b0:356:21e9:73ff with SMTP id 98e67ed59e1d1-35de5c3d5b5mr4063529a91.11.1775287619979;
        Sat, 04 Apr 2026 00:26:59 -0700 (PDT)
Received: from fedora ([206.84.225.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd35f52c8sm7250956a91.5.2026.04.04.00.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 00:26:59 -0700 (PDT)
From: Paarth Mahadik <paarth.mahadik@gmail.com>
To: marvin24@gmx.de
Cc: gregkh@linuxfoundation.org,
	ac100@lists.launchpad.net,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Paarth Mahadik <paarth.mahadik@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix logical continuation style
Date: Sat,  4 Apr 2026 12:56:26 +0530
Message-ID: <20260404072626.134642-1-paarth.mahadik@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Logical continuation should be on the previous line,
move && to the end of the preceding line and align
the continuation with the opening parenthesis.

Signed-off-by: Paarth Mahadik <paarth.mahadik@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_btcoex.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_btcoex.c b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
index 0191a943f0a4..f47c9d079e70 100644
--- a/drivers/staging/rtl8723bs/core/rtw_btcoex.c
+++ b/drivers/staging/rtl8723bs/core/rtw_btcoex.c
@@ -10,8 +10,8 @@
 
 void rtw_btcoex_MediaStatusNotify(struct adapter *padapter, u8 media_status)
 {
-	if ((media_status == RT_MEDIA_CONNECT)
-		&& (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
+	if ((media_status == RT_MEDIA_CONNECT) &&
+	    (check_fwstate(&padapter->mlmepriv, WIFI_AP_STATE) == true)) {
 		rtw_hal_set_hwreg(padapter, HW_VAR_DL_RSVD_PAGE, NULL);
 	}
 
-- 
2.53.0

