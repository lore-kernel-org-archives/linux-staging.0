Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7941DEE2
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119823; cv=none; b=gBomkLkVd0e8pnjYnuzXEiO1ANhj94TZZH6Gnmp+1BhBXkDudxeFgXV0Z67+s+IwVNH0raeE/BbJ1BBqRkknF758y4/WJuSXfapxuT36GlaE4tta+zHPikTihKUE3p1UO79wKBQAL/XVN4/TQlO/u496HvXcUHkiDxx5sosvGIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119823; c=relaxed/simple;
	bh=2enGK+2yFu7ccYT1RFgOq9BblDV/xR+9lzKnkxuffKg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hEvS3v4ZIlCSIT+2LUtlD7Aec2tkswSu/QCv4KPcoJBeG+zsgZcQaDsbGOIf007KsdUw2g0EngWxbi6j/bbBtZ5ZP+yBjv8HIMeg6krQdklAQufP1AA4JcyYA1gxhq84x9cpFET6cMBrn/U7mPCA2notShGfE/CquSeCIqgIs9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WUfoEaUu; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WUfoEaUu"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so764569e87.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119819; x=1784724619; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ppLEqAItlHRjf3OSSFlRs6JoUnbvvpjgmMQuOUp2Ddk=;
        b=WUfoEaUuEzGTXUrTga1+fGYgmDiCaFZnpLhQcB2oFXMaCfT/M9MXHaJ2RSg+vMm/0F
         xUmPP0kwPdoHyTBI0k9Se8m5y7VlihnXRPzbebhcBE28E7XRCjXEvVaffA0t55GaOvVo
         DK4T5f9gS4K0dnTpiCvXLf/c9b7AZNaM/Y5AO7O9imYN2GqaL7ALatCr8YoEzNVyppa9
         VWyVBo+Wve+oL5BNh5LY39nxWhrk+hWHeDV+TBU+KpbTNC0aLmMDLPlvcYJD+f0ycsEq
         KAQZ44hd6ycqfSFsijNHGbWKs+4DxdZY4SBUIKCBg2lNg/8DmxyNRya/bQFj2rsxZhmr
         jMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119819; x=1784724619;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ppLEqAItlHRjf3OSSFlRs6JoUnbvvpjgmMQuOUp2Ddk=;
        b=dA2bHNp2FioVI1FLXVMYRZgYbPYMEDHYHfdy+s1k+YxMhw7VYlf3aNE0EdhFrfusyz
         hB+NspMbkgolUkFO1a5vBp41rMxsRRp9btzBYJfC+rZizQ2Fk7z4ixUAHwIEixG7Ow9H
         KEabocu4nilPPxSdszfC3ChqbdnSnrqK8njmgIg8Otj5yHSZ3MAcidw1WwbLc1Uqta4y
         j3eNbifJ3KxkddauT1MczDJdLjXRc5Y0kImydeoj6qwtYpXaroJ0q00B+hXitCnqW0yu
         MqF3YuR4ERmdNo7MBrg1MH+GGL2CQBotWlv4oEXU5DtFS79Vokliv870Vn+4Nx4UDzU6
         f23A==
X-Gm-Message-State: AOJu0YxD8UEbuomwWAjdFD/nhQV4p/aZHTHUcxZrMNWFR7kHmkrJZ2rD
	oKT93PZh5b/eq3IdTrmIpc81Mm/3xMUslPxj3mO69wOBW/MB24JNTyf4
X-Gm-Gg: AfdE7cluV2Ye2k2+arJC+3HtsHMgeSLzCMpc76OZ79k35yN+RrA6ySlmKvAoujhP7B6
	WSqXf4BoxAMc2KFUbzIUWI4RUoZbswHGdkZegNInSbIHMAD5VumZXI4Ld0Jb/tFc+klHyGhmHeT
	Wa3d4o2ZvLbGofE1t/8gMSHOMg4RC1U1Dd9HROea+1at40t4OJxA4CguvNRyjAdaItGnI3OUp1E
	9ZXXIA0EdSIILA2icj73699YNtIMiX2fO2vp6Xvr8lcdGhDz+txGfyT9MzRp7iFQPqyhd5Wzf1x
	+0N3x5Pui2kkuSUgFewf4E6XEXr+AVX4polSEpp7qbv+BULfrC9YxgT1NwJ4QWb5uyKyU130edw
	EabsshMJKKvEzHsSq81ijHDROUqrGbL9u4RfqcTsw+b+yjagYEiaLe7UHoQpqAwfPtzPB5YcpjI
	/iw+fZh66I7Gy6hoy4el/mQmkZh6X3zuNOP3xzdEo1zTiopQhiJo/pXAbYkXoTJi10a+snjOp3X
	BXMHSbPYr9NFA==
X-Received: by 2002:a05:6512:66c6:10b0:5b0:bc3:dbf3 with SMTP id 2adb3069b0e04-5b15d79dabbmr463709e87.30.1784119819065;
        Wed, 15 Jul 2026 05:50:19 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.50.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:50:18 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 05/61] staging: rtl8723bs: remove unused OnAtim stub function
Date: Wed, 15 Jul 2026 19:47:33 +0700
Message-ID: <20260715124829.90290-6-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The OnAtim() function is an empty stub that merely returns _SUCCESS
without performing any actual work. Since ATIM frame processing is
not required for this driver, remove the redundant function definition,
its prototype, and replace its reference in mlme_sta_tbl[] with NULL.

The internal _mgt_dispatcher() already safely checks if ptable->func is
not NULL before dereferencing, making this change completely safe.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c    | 7 +------
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 1 -
 2 files changed, 1 insertion(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index a86d6f97c..774fa9e32 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -23,7 +23,7 @@ static struct mlme_handler mlme_sta_tbl[] = {
 	{0,					"DoReserved",		&DoReserved},
 	{0,					"DoReserved",		&DoReserved},
 	{WIFI_BEACON,		"OnBeacon",		&OnBeacon},
-	{WIFI_ATIM,			"OnATIM",		&OnAtim},
+	{WIFI_ATIM,			"OnATIM",		NULL},
 	{WIFI_DISASSOC,		"OnDisassoc",		&OnDisassoc},
 	{WIFI_AUTH,			"OnAuth",		&OnAuthClient},
 	{WIFI_DEAUTH,		"OnDeAuth",		&OnDeAuth},
@@ -1531,11 +1531,6 @@ unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame)
 	return _SUCCESS;
 }
 
-unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame)
-{
-	return _SUCCESS;
-}
-
 unsigned int on_action_spct(struct adapter *padapter, union recv_frame *precv_frame)
 {
 	struct sta_info *psta = NULL;
diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index cb23c6939..332411ead 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -564,7 +564,6 @@ unsigned int OnProbeReq(struct adapter *padapter, union recv_frame *precv_frame)
 unsigned int OnProbeRsp(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int DoReserved(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnBeacon(struct adapter *padapter, union recv_frame *precv_frame);
-unsigned int OnAtim(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnDisassoc(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnAuth(struct adapter *padapter, union recv_frame *precv_frame);
 unsigned int OnAuthClient(struct adapter *padapter, union recv_frame *precv_frame);
-- 
2.55.0

