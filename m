Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98AC537AA72
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 05:42:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775108568; cv=none; b=sR/ItJyBo8G79VjVTu0wbQy7qa5Eg5JZ8US9blU8vpZwluwlRND68WgM76JpGy1bUQBLvHFMawKYRetyb4j7HbU6Pm94YPEtoB1DzPTr4MWAaK7rWxNzcYuFo72CYdKRrNYKNu7uc6C+v6H4+oOxm7Rqe2v0C4iS4jwJFikIEWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775108568; c=relaxed/simple;
	bh=9xDOH90Rnl0g+fs4MUN+12KD6d0T7ciWVE7X94Ky3kY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ck93kibdQ9yUI2nD3+63lCw34NVlwejOJy/EYI0su9bUoYg9OMSwjA2AzLGIRfaEbO4ZWx6ZvNGHt+vSU7ozGVVGWvFz5v8kD6rkJQxH9fJaaqNsxV0N1/+bUOOP1PPvorFUKarbl9OsNdf18MmjV2O2Y3roG5bA6v2VW2OPiKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Al1b636v; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Al1b636v"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a0ff30b240so665342e87.0
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 22:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775108565; x=1775713365; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C/5Ak4l/pJMpoXMCrQwF/5rvLFL8ZaCMBRmM6sefavs=;
        b=Al1b636v7ji/kpj+lFL75RV9fAEuNT1E0wDNL18/ffjR2nPJJMFOUkwlhczTAP93Le
         XfWDJtaC1Q2geS7t+TDPbw5hq615niQqcoQgV5p0Sn87e9kLSUyWY7rO5Bo3i41pBkDN
         qIZDvn9Q65uGr3hlCzpwlP910iFhAu0vW2Z8z7GI3JmcAjZzUyoAiAEPD1kioL063PTO
         nucqZwHV/UKgYVnYv3AFHqRZ1jA5vqjxyDnz/Hhc4GJGK94DsdPXG6XJEwNOVVdYuHPF
         CUzXsxXM1N6bWfSfOo62KMT/UHtnNvo3+Ikm18lpdaFzsfdU+iZBMyxaTpsHHJbVMrmP
         oOXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775108565; x=1775713365;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=C/5Ak4l/pJMpoXMCrQwF/5rvLFL8ZaCMBRmM6sefavs=;
        b=XVzpvJdvsKu2E2yi6eKiAgzrk3Vk3/kjT9ibw6jwIbRt/nMDBW0waLJ9TbmrJfety8
         Z0w7cUNgbuCrZ3nWGcjIlLi4KieuneaqDFncr/SR7W1sy/Lv7MO0wFkf/HJ57qoFMGn3
         ruc4UYudtPCPc1wAtpaxsqIc6GfcqHrkcJ1MQpbT/Zf0wZNCAYH7ugMdIqo0xI1Vpg9o
         j3qEuWl9A65afjXiBAme9qa+1pmRwbR1W1Qk8jsONxkeUaUNgMT4tOsea4h7sUuI5gHr
         BcnTP6R4li3P/wNFnFnt64IhKBjh1chGDBQwKIrbr640YdbSZ4/x4erFIt4Jgq3mLhX+
         Q8Uw==
X-Gm-Message-State: AOJu0Yzpp2MdUrrCBWkDDx74CCsvb7IU/Iz/8tqmNtdVAadPWS/nNnB3
	UmT3D+/2g61MPI61E32AAg7h4n6NBF77szlJWctrgACQmPYNhTRNv0Bz
X-Gm-Gg: ATEYQzyAmFjj/qJuyVUUfvbzhrzPez8K8CYOtIQu9HPncnOkaMujk4h3KRP+SqbyH5z
	i8uef9UOrffobyTWcGVl88+VHXOUIATvp97eiz3WCw65hSFZCVFELLBe0fXY6pCrZSLA9sYp+YO
	mtDX/hsb6d1I7WQhT54GjyWVgeaWi9NSmT3Erh0AZxS3Ewsk0ay9dFophUG1XcQlt36xa91wsAE
	wWy9bH4VXLdTmJX9p/XopARtUE0M7EclxdNakteUrLem9F8Btl2bo1X3qK6m3i/3NoWGedWVfr+
	IhaFcudY1OFbTeyuy+pDdIeI0iHmSokvwfyA177UzCeEyXKf0nItD85Wyxkv8ztXykS9KYPlOVF
	e/rmTO8PhPYJIZiGLRdh76cYC4a/ZyeqOWFUDT9BXhyLTwT5rY5x5H7DQFau8XWTYqZLdjHtD68
	DCh39bDvvIP5tytVqpy/n4tyYPVUZG
X-Received: by 2002:a05:6512:3192:b0:5a2:c3e4:6c7 with SMTP id 2adb3069b0e04-5a2c7679858mr630708e87.29.1775108564636;
        Wed, 01 Apr 2026 22:42:44 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6c95263sm452739e87.11.2026.04.01.22.42.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 22:42:44 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v5 6/7] staging: rtl8723bs: remove two unused function prototypes
Date: Thu,  2 Apr 2026 07:42:14 +0200
Message-ID: <20260402054215.271981-7-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260402054215.271981-1-linus.probert@gmail.com>
References: <20260402054215.271981-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes two unused functions Rtw_Hal_ReadMACAddrFromFile and
Rtw_Hal_readPGDataFromConfigFile from rtw_efuse.h.
The functions only existed in this header. No implementation or calls
were present in the code.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v5: Reworded subject

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1012831c7eb5..4e8980d86965 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -74,7 +74,5 @@ u8 rtw_efuse_one_byte_read(struct adapter *padapter, u16 addr, u8 *data);
 u8 rtw_efuse_read_1_byte(struct adapter *padapter, u16 Address);
 void rtw_efuse_shadow_map_update(struct adapter *padapter, u8 efuseType);
 void rtw_efuse_shadow_read(struct adapter *padapter, u8 Type, u16 Offset, u32 *Value);
-void Rtw_Hal_ReadMACAddrFromFile(struct adapter *padapter);
-u32 Rtw_Hal_readPGDataFromConfigFile(struct adapter *padapter);
 
 #endif
-- 
2.53.0

