Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448BE2FE0F
	for <linux-staging@lists.linux.dev>; Mon, 13 Jul 2026 03:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783914729; cv=none; b=fLDiSfPAflvgWYzjo3UbQdtuTdPlyVUSTtPMzm89uBXkWPfGYEvn7FPJ1T+zDGca74P6zYv6QNvMgGr6jWHxGfOMAMJGi0snH/po3TCeD9g/kcazo8pJLuDMzeOq03B5exWoi8KwwgIb+xH3DO3Ht5pBnC7TbSAh7OQZKY1B0no=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783914729; c=relaxed/simple;
	bh=e+7ZmP1gEty+MLocFmBbvEQImMQ6MJkpOvjneR6ApTM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Df9BbQM9VDttbv+wf5JQuNrD/uveI0c6Ce7mgx9X3QCtXXqgXM8gqeVaHOUGG6QzPxa7ratPSqyFc0su/V8aKhTTfecbzIkvY9c7IlvQKkHmh5GUqpeUnTK/i6vJG4vgT3NFf+oZFmwUL51G1q2cNclAxoMw/KY2Tmx4czP0NKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eCybKiAA; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eCybKiAA"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5aebc8cb5bcso1848230e87.2
        for <linux-staging@lists.linux.dev>; Sun, 12 Jul 2026 20:52:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783914726; x=1784519526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=340psMf+BAIM2OdFY2Lmz5jQ7FcxtDiSvzpa4hXYBzg=;
        b=eCybKiAAzO8SDlqhvi3pnQtb0AdieDR/kKHyhfTsZX7opGRrqP9birCaA0HRKHFOrE
         qca9faq88ebgr/NxF17x5fLIshJn4KjIIN8ucXOqgtQkWnQhaxgYjctlwfty2tOfFH6i
         UD0+rPIWcE8HNeF3FfkpnoiQlOBO2N89Nrw5O1+pmIF9LBCE0jfZo1n7vp8HB0ej5cNu
         zkrUFwkkM5NbWabZFMvM5jMGAyUE7qV37XVy3Rci5diFYl6J12KTZWaVfUKkpIv9JYIc
         9gM4Erfk+RVBV0mlVcdy9mcv8TQ+rIOd2DxJBSDJrZm4tPsovTmwi8GIeLyT0hO/nLr0
         oqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783914726; x=1784519526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=340psMf+BAIM2OdFY2Lmz5jQ7FcxtDiSvzpa4hXYBzg=;
        b=Krurdle3UyZOetsUXNxAv8XalBvWHcsIMRHmLwxBolo4BbeK4DmXMXU3lfAOAROybu
         7riY1LuCSjSNxg32hRxasCbBlpcrXfb6kIm5GQrq95x+x3teQAOhQQU1WBujwXhA9iGP
         jZoBpxJc3NlDJVkQ2CgiR3TBObyykaAD6IthEvUkUVTghvao0VcGsNeFFJfj4Pw510Iz
         Npbe0r/XJcwBCBh2XtaaYXZeFahsvG2mSIrIQtoCBcBxw4cUUpj138gK+zIgiuJw3PSm
         EsyZC+sYoI/Y+E3mNkOA4qGneU9UZZH80rrWQf5H8+q+eGzSIBGQWZaUawZ0WT94YLVf
         xE4w==
X-Gm-Message-State: AOJu0YxCF3VRsNXpr33UFJ87EASwvToHbKBogPHeTOOl/v9k1p41psEh
	nfUfdGJIN942sDFCWvUFAw43I2eM+JR6yBnIn3LnEImBjqn68G8CLHLz
X-Gm-Gg: AfdE7cm75/Nm/y276Ba9rm1zxMnS20xNYOM8oULgQ0+XcMmuG2csWDCgmXagv/Um2mS
	N782SBzp02cc8ltxBOgljQFZ/tFF+ZMuuYit2cQqEZVEwegV814brJyqj+mIFBxy6S8WFwALnNK
	QrqnIZjWVHwjk2Vz2HnZaPRkIjl9nj84ZW2/8XqgdhDy5HrgkvNj7tzp+4dbJXM/j68r5Sz3koO
	ezeSYhsaWVMlCn5Dtv0zVYziE2vgWuZAkukZZDTdXI32OS7hFo+c3MiktId9VG1kANxQAQ4OgwE
	EKhP7h6kwWGq5CVFK6vy4JDOa32R7afTVaHSWJT02/r1jUKvAne0qHY0CAsH2TKjwBthSVkS6aH
	xzki37whFs2YJKkh/cnxHoPuaHEaSDsNsDUwRcMHc9+mdKP4MrfGT1ZvOusMRbm9rXH/DWSbmyr
	dnZ2cZmwlGpB0bpqsdan4hl47gSd0jhoZyR/VAxxuhJuD+nmJBCktmo5PmU3902XG7X6LKM9MQz
	J5dwH1Z7TuJ7WA=
X-Received: by 2002:a05:6512:689:b0:5b0:227d:ceed with SMTP id 2adb3069b0e04-5b0236bfa3cmr1670597e87.57.1783914726032;
        Sun, 12 Jul 2026 20:52:06 -0700 (PDT)
Received: from archlinux ([94.180.100.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01cab0ebbsm2516433e87.78.2026.07.12.20.52.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 20:52:05 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH v3] staging: rtl8723bs: remove redundant ReadChipVersion8723B wrapper
Date: Mon, 13 Jul 2026 10:51:56 +0700
Message-ID: <20260713035156.144502-1-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Collapse the static CamelCase helper function ReadChipVersion8723B()
directly into the main rtl8723b_read_chip_version() function.
This removes unnecessary code nesting and cleans up the CamelCase
naming violation in a single atomic change.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
Changes in v3:
  - Merged the previous 2-patch series into a single patch as suggested
    by Nikolay. Completely removed the redundant helper instead of
    renaming it with '__' prefixes.

Changes in v2:
  - Resent the series due to submission issues with v1 (no code changes).
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 1b8ae3d57..53f6cd708 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -820,7 +820,7 @@ void Hal_ReadEFuse(
 		hal_ReadEFuse_BT(padapter, _offset, _size_byte, pbuf);
 }
 
-static void ReadChipVersion8723B(struct adapter *padapter)
+void rtl8723b_read_chip_version(struct adapter *padapter)
 {
 	u32 value32;
 	struct hal_com_data *pHalData;
@@ -843,11 +843,6 @@ static void ReadChipVersion8723B(struct adapter *padapter)
 	pHalData->PolarityCtl = ((value32 & WL_HWPDN_SL) ? RT_POLARITY_HIGH_ACT : RT_POLARITY_LOW_ACT);
 }
 
-void rtl8723b_read_chip_version(struct adapter *padapter)
-{
-	ReadChipVersion8723B(padapter);
-}
-
 void rtl8723b_InitBeaconParameters(struct adapter *padapter)
 {
 	struct hal_com_data *pHalData = GET_HAL_DATA(padapter);
-- 
2.55.0

