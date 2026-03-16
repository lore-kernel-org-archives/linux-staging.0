Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 885F58635D
	for <linux-staging@lists.linux.dev>; Mon, 16 Mar 2026 02:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773628253; cv=none; b=EfVvrLMCCNa1tJ6l6qv22AMBREyywyVjdeSg568ymJcHfl23x2ok/untDTaSe0mULCTnw7s5bJfy0Itj0aB/tEmn6gdXw5q+H6HveM6+kIRM3h5nYBnIZ4XFj+H3/etM95c5o4WDrmFzHoUFKy1+k9UZjUNRG+SDndgOlGUm7k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773628253; c=relaxed/simple;
	bh=9+EEpNIFfZVq8GbT2p5Z8jpLBPNqRD4XGeXaUyYDgY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZexLDzezGsK2+ADajfaH2u6/F4b6tdB0DeGlGldiuEHN0l2zr0P7Fud5iMYuHCUlafYYeRVSfWmvHHqb6mCUeu2/AbC7aBAqTerTzK0qwAxma9J/74mOEP3oqSd/tyYUi1rclIQap2tLjS9ZbwrdGEERwr2Zmf2CE+Ml8U+1CeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iv0dKxus; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iv0dKxus"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-56b7043c97eso528011e0c.1
        for <linux-staging@lists.linux.dev>; Sun, 15 Mar 2026 19:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773628251; x=1774233051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B80zMXXpfCeq/8Z8TlXHY887n5ywr8jOIpxYzXa8D94=;
        b=iv0dKxusdBaDGCdmAzskD/jNeUIKBiA2Jd5xIb82Gok7ga86b4+uJ6Yxj4UnLT6838
         H+R0cuDh3fDhv91Xnv84p9TZ84aZIPS7wubHjF25eZf3OAEp4kIrikP+rKj0DARA2/84
         /28M4W2LkMRi3M65dFkrYWRdlrImW/SQlrL2D4KlkqT/vERb68cZD5YjIB4agf4IY2dL
         22CSzn8SX7syVvYO+S4HWl9IYShMSYMc27GvEnXxMW00luh/kHFeWDGsMyT6qCXu5sOJ
         uEbJxFWcVZ0jvOu8m0F27lu53hA0KlNy2ZyS2763equ50lOEXontoeuUw8ZMLVD+Tlmt
         IAVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773628251; x=1774233051;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B80zMXXpfCeq/8Z8TlXHY887n5ywr8jOIpxYzXa8D94=;
        b=nIYpwsk2cgOWPi31V/Ya0kUVR1BPJO4WS8WzR3zNUskjJlccfIGam0wD85AEIqH1+4
         iLC/0BmZw53/khN9MdLh7oNDnEWVlLJWMoYuwawU+JO+fmosgh15tyBzJv/k0lKvS3+w
         1aLOnYJ6BAqinUuFeAXPHTb9tNXiA343H+8gXEgGNV213M1biaCtcWAzJ7rR9p8rP3oA
         sg0eSrMbQZbCfcvB14LQ54chkeEDQk6OGp/Cwe7rUUn3BOCGOkDIc53CadXXAScwDvJy
         n88FmCXCUSk6CszL/MRB4adj6Ug8evz/DRWFPyv7UdEypwjC+jHiik1WoGJPmIURlAmX
         dOWw==
X-Gm-Message-State: AOJu0Yyn9zqOhmNF1ZwrS8ZwBgjmHv3sgcAUCGA5DBUDBDdebiWKMd3b
	3Gce0kanh75E2Hi/KwBJjomh2vt/7ttIBIUVYYOrBZZ2UioeSePfQhVJ
X-Gm-Gg: ATEYQzwghc2QjGUXp8YvuQ7ud0csgpMhNeCB8R0IlW1AB0L2XCjqe6Yv0naiwDWh68Z
	rMUewRSGbgeD0AelS4+mTrz5jeabk/nRNU83iRJnVoOOkA9Q2cIQYVjGRUiTbuM3kSNb+F7tes7
	tie3xpQYcoeK4VL1GzqSq8lIfQ6h/rkBgqv2n7MQuZUA5GPM9KIp2u78MFtsy/SooAVOYsJAkQa
	Gmd4aLek/VPtjxlGwKkgKr7o+LDzUCTmtSQhndG2yfNaVc2Ak70NeDfhwzF4wzwV8kxo8MmR4C2
	AyRdC7vxatkCYAasFpkM+edDt1AWaGQlkkd34MKiI0+KXXBQYMNv3V+iH0Hoa7AltSQ1W7SFiWF
	LU1+jpSpWlZIGI9tNnql8Jivv2CT3qkj1qpw2UdwTb4JXq6m7bYz32jGkhxWjygMg+ZfnlbsAQj
	OVWRDTDOEi/91UQuJ40RM1VsDVQf+aZ6GVWkPeS3tACUs8G4XU0lBBW+cmTQ==
X-Received: by 2002:a05:6122:1d45:b0:566:3c22:c131 with SMTP id 71dfb90a1353d-56b6294f25fmr4131464e0c.10.1773628251468;
        Sun, 15 Mar 2026 19:30:51 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56b6f39166asm3117460e0c.9.2026.03.15.19.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Mar 2026 19:30:50 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unused global efuse variables
Date: Sun, 15 Mar 2026 23:30:37 -0300
Message-ID: <20260316023037.11437-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove several global efuse variables from rtw_efuse.c and their
corresponding extern declarations in rtw_efuse.h.

These variables (fakeEfuseBank, BTEfuseUsedBytes, etc.) are completely
unused legacy code. The driver currently maintains the efuse state
properly within the 'efuse_hal' structure, which is encapsulated
inside 'hal_com_data'.

The removal of this dead code cleans up the global namespace and
resolves multiple checkpatch.pl warnings regarding CamelCase naming
conventions. Verified by compilation that no functional code
references these variables.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 18 ------------------
 drivers/staging/rtl8723bs/include/rtw_efuse.h | 19 -------------------
 2 files changed, 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index 98b15ca10..0e550c631 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -8,24 +8,6 @@
 #include <hal_data.h>
 #include <linux/jiffies.h>
 
-
-/* Define global variables */
-u8 fakeEfuseBank;
-u32 fakeEfuseUsedBytes;
-u8 fakeEfuseContent[EFUSE_MAX_HW_SIZE] = {0};
-u8 fakeEfuseInitMap[EFUSE_MAX_MAP_LEN] = {0};
-u8 fakeEfuseModifiedMap[EFUSE_MAX_MAP_LEN] = {0};
-
-u32 BTEfuseUsedBytes;
-u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 BTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 BTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-
-u32 fakeBTEfuseUsedBytes;
-u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-u8 fakeBTEfuseInitMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
-
 /*  11/16/2008 MH Add description. Get current efuse area enabled word!!. */
 u8
 Efuse_CalculateWordCnts(u8 word_en)
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 936b204b8..191ffdf59 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -68,25 +68,6 @@ struct efuse_hal {
 	u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN];
 };
 
-
-/*------------------------Export global variable----------------------------*/
-extern u8 fakeEfuseBank;
-extern u32 fakeEfuseUsedBytes;
-extern u8 fakeEfuseContent[];
-extern u8 fakeEfuseInitMap[];
-extern u8 fakeEfuseModifiedMap[];
-
-extern u32 BTEfuseUsedBytes;
-extern u8 BTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-extern u8 BTEfuseInitMap[];
-extern u8 BTEfuseModifiedMap[];
-
-extern u32 fakeBTEfuseUsedBytes;
-extern u8 fakeBTEfuseContent[EFUSE_MAX_BT_BANK][EFUSE_MAX_HW_SIZE];
-extern u8 fakeBTEfuseInitMap[];
-extern u8 fakeBTEfuseModifiedMap[];
-/*------------------------Export global variable----------------------------*/
-
 u8 Efuse_CalculateWordCnts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
 
-- 
2.53.0

