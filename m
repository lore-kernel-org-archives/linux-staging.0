Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3DEF3CF21D
	for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 08:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782205161; cv=none; b=Bi84wepTCB/GX7YD70j3b5zLq60qK9sT/THE2AONslzpnAY7/ViK+rJzZiec5qWFdFJ21/C4aEtbE4/Y4jFLANjP3JJrBPN5Y7WDGVzunaa9ZXgxzGrCCj5Fi2yIEWujHUDi318r7rp7xseEIDz1WdC3xdb9IQbhSRYqxWbXvCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782205161; c=relaxed/simple;
	bh=q5vFEvZWzbB819xDndExKNKOTsO7e3Vspk//EfggE3E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bWVoqr2CrOzhNMDzpqy3wdb0hgLIAPg/PHI3YaYS3j2FY0P4mrIP1/NHZDc5jX/u0InaftjqHH+QmpQCLMy6NiboGDaN3hRpieXKciWvgaMltn3x3ePvkPYeGbmWAduFI54z1/SXoz9w80YDfu+rROwRw202whMqjfrhPy7d5JM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xh09e90+; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xh09e90+"
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-84531988438so412801b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 23 Jun 2026 01:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782205159; x=1782809959; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=koXbY8GdXbKItOUdwho/qeP2WHVoqyrKyawueZ3SelM=;
        b=Xh09e90+2VkTrbyWcHmDe3MaWN4ehaLrrU9FMJqw3Nhg+vu3ciEj8QUBnSP7+HCz15
         w2jhttQd4VoUZaLWULk/nT14+oPI5MAMwsP51dmfPy7KFXQWRJeNmULkj7EY0acN7UDT
         zVG2y1j2r1LKp6TnF8yjDJililr1aIzjLT2QAyoFbCYZdzzaX/S29BbgWuHd6DyYm1Lv
         EHWFo0QH8+7WGmtMpFK/jDzytVLxC/L0zXhDLq8pZKmggMPcd+6ECht5SHHqPLovoQn0
         y+h/ThuCGdxLLbG1SLn1s0JyJaoxfUqFufBoC3s16fM2rccsHmoz9xZlZuDVsVoMVdIk
         HWlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782205159; x=1782809959;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=koXbY8GdXbKItOUdwho/qeP2WHVoqyrKyawueZ3SelM=;
        b=Sgu05w+fl+VbP9S5L9Fp4zetR3noWoV0j6yu5MnEj9m0oV5MldsWm0h1tjcRMx1z4v
         obYazLiXpBrPs+Os97PI9UUUXZ10FqkBl1YNaSoB06dRQDdmiAe57IYFMoIxX5tXk7px
         4yXSv3diCPmxd4oAcSOu4SnTWmWtJ4I6ZsOLc+qPNfIr4aqNP9EdY0vPhdrM+V5S8la8
         iYH1Y0Bg/rnv/RnEOhn2ZpJLKzBMnX1G2IXa+ynTZNDFZZYuJRABTfTutHUa8J57RGKi
         Q7Ec3jii9vJIUjiI/hTEnAcVy+4Fj/dxX3CcXj3r5sadvTfDiKIUVjXvHPMvCYvD6liE
         3wMQ==
X-Gm-Message-State: AOJu0YxYnuzBKTxwjfN0fvLtRP5hYYJedzRdhusmODK7Cn9jcemwO+SY
	vTmpGCMUey8vnVf9bjKk2Cya7wsivf1gDAMUuEtsgPySUhxzGu/t6pNG
X-Gm-Gg: AfdE7ckE0j8+mfuMff56FKL/9aVTyRNeNbb2tdNdk5F5adn0wBDrH9dTHQVhVK06SBn
	BuuC06nfqN5FbQWdAvux0Y7vdg5SsZvm1CGNOH722PGnzZhtx30yCoXWyEELmqfGWfSUZkjscV3
	5jA0694mGl798Aq0YytF7GPSbx/Eu0+urew6kdfFPMlQq3ZVAxnbrpW0FVv6OKjeTUhG8OorLZN
	pT/Hiarm8i0wHc2pr+bpf7JN3d9Um/8RbZO4G3FYDjPqn14YpQFwAYcQNteNAnz+BmD0k4DURNZ
	o8LkrnNfmKdBzQfTaZDaB2OSfRr3PuvDnHNrqJOuLxzU5q7/1S2/od2UohQ2k/rdKtIEOOOmobq
	H25aTusDI6jrnuWHwlRyqgWCOjV6f5dn0nOdDIce4eQp85yQPPWYl9l6M0/bV1z7x1P0GO9o4TY
	YNOQm85eiXtFyPnQ3N62IjrSAU2Eg9U4F6CQxtNAdUff0saH1L9PQDoMBz
X-Received: by 2002:a05:6a00:4648:b0:842:3804:590d with SMTP id d2e1a72fcca58-84591b26003mr2611255b3a.7.1782205158996;
        Tue, 23 Jun 2026 01:59:18 -0700 (PDT)
Received: from localhost.localdomain ([27.10.55.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564c137e2sm10077715b3a.0.2026.06.23.01.59.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 01:59:18 -0700 (PDT)
From: Bruce Ou <oubruce1234@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bruce Ou <oubruce1234@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix CamelCase warnings for bResult and Address in rtw_efuse.c
Date: Tue, 23 Jun 2026 16:56:49 +0800
Message-ID: <20260623085650.17951-1-oubruce1234@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Bruce Ou <oubruce1234@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index b5dc5892f..355ac2004 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -44,7 +44,7 @@ Efuse_CalculateWordCnts(u8 word_en)
 u8
 EFUSE_Read1Byte(
 struct adapter *Adapter,
-u16		Address)
+u16		address)
 {
 	u8 byte_temp = {0x00};
 	u8 temp = {0x00};
@@ -53,13 +53,13 @@ u16		Address)
 
 	Hal_GetEfuseDefinition(Adapter, EFUSE_WIFI, TYPE_EFUSE_REAL_CONTENT_LEN, &content_len);
 
-	if (Address < content_len) {/* E-fuse 512Byte */
+	if (address < content_len) {/* E-fuse 512Byte */
 		/* Write E-fuse Register address bit0~7 */
-		temp = Address & 0xFF;
+		temp = address & 0xFF;
 		rtw_write8(Adapter, EFUSE_CTRL + 1, temp);
 		byte_temp = rtw_read8(Adapter, EFUSE_CTRL + 2);
 		/* Write E-fuse Register address bit8~9 */
-		temp = ((Address >> 8) & 0x03) | (byte_temp & 0xFC);
+		temp = ((address >> 8) & 0x03) | (byte_temp & 0xFC);
 		rtw_write8(Adapter, EFUSE_CTRL + 2, temp);
 
 		/* Write 0x30[31]= 0 */
@@ -89,7 +89,7 @@ u16	addr,
 u8	*data)
 {
 	u32 tmpidx = 0;
-	u8 bResult;
+	u8 result;
 	u8 readbyte;
 
 	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
@@ -114,13 +114,13 @@ u8	*data)
 	}
 	if (tmpidx < 100) {
 		*data = rtw_read8(padapter, EFUSE_CTRL);
-		bResult = true;
+		result = true;
 	} else {
 		*data = 0xff;
-		bResult = false;
+		result = false;
 	}
 
-	return bResult;
+	return result;
 }
 
 /*-----------------------------------------------------------------------------
-- 
2.43.0

