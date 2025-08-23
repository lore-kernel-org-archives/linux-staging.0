Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DC7726CE2E
	for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755953030; cv=none; b=AN4iMquzLSCm0BPL23bquqeg4uZId7Gf6ZXmN+xE1/PuAG4JKJzEvKQ+M1+EshBN476LvySgH7GE0wgpXx6YarvN68f+USu1qnjA5gXVUj+mEfEUv1H6BYwPDeaiYdhQlxAvbqYyOBe9810hNossXiy0wZcgwnsIgv9/ZFUoENo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755953030; c=relaxed/simple;
	bh=6TMKFvsgcOmBT4IWHGPu6ltkEHCP9W2kyxfMooXoo04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UqdaDjyl7t9Tgkntk9B1yMtVT/n9RzDYpLKTOaHbYi95ES5BNH/gCiBKBccSEpyHnKVF3LKx9c2a9XrTfcwL2JkQZCVrneZDXf0uc5uA9JHFtUN6EbdbkhU8LW8vtmxTZNfZtrwVj3PJmdJaG25UVIj2xVmemWQLKkfTktu4/yw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I3n4ROCz; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3n4ROCz"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-afcb78da8a7so448944866b.1
        for <linux-staging@lists.linux.dev>; Sat, 23 Aug 2025 05:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755953026; x=1756557826; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VKg6tpfTSdRmNVL9oWWx5/tJnTNrLO7MU62UoNru7CE=;
        b=I3n4ROCz+UUbIjJqKedcEdXUJ77F83J64/68aWGtY8UO2dXwiTqchx2tvWP03i1zzG
         S++V7Znhrfi3Un9wAF0g3bZOY0TxbCRLYBxYrpVZvThTNWgPfCs7rcQyeOjcVjqvxVxj
         jKkajuLM3AufF0pju8yMSIX0bsIaS53fOe/1vxojkC/7Ye/qm0mUlNk2i0PdaC7dDI6S
         3IkX/weEKDvu2u8xK87DhWVL9gPd1qPeXy3aUZ+Qy/oz/kEhv0YpL3T3JBctk+a8eYX5
         oJjncSZfrB+2mjz2ngxOquXO5Xas7F2DGMWt9tuKy34avd+PstlV+ZN8HvJ8W8halZ/8
         Ja4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755953026; x=1756557826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VKg6tpfTSdRmNVL9oWWx5/tJnTNrLO7MU62UoNru7CE=;
        b=j3kNPF4gufSWRAK/WUtsiax4o+HVIEL5bsUcJajk5eKhRXuIGagwa9cY+z28QBwxU+
         V+uwouLeKpDDdzrue9JwnzPP7IgRF91rj0fSbzTXtQtihDFfErVRb07QCYZ0iKcGOFc3
         WymU8Esr8C4kvyuNbCCeCp+jzr08osBMZTflvBmd54VDUnUqzWFi28FkAxBd0cyqEt9t
         P8+itPPa27+4fNWH0fu9NzaNh3SgRRZfWgm6/pE/qLdHeULe5HKY8lXqWaPAvtxKwMZv
         jDU4HI3AfjesDxwB7MuURUhiOrkRJQ9y9LH6TzNzstw55WttL/mtDatK8Abc9mvB/bi8
         Nf9g==
X-Forwarded-Encrypted: i=1; AJvYcCVlqcuzNv7U+eo1pXLOcQ/8ILarZY0TMuow9kJM2r75CBVUHHNmfMewqMKlDvUTIG7s+HK9Rs7/CiLLAPgl@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0MOAJUp1+/r3fHd2YLE6FrOZsFZ68d2HVHCMk6AANkmbxpOiu
	PKqPEtD8584P1ZY+l77pfNzsb0otDVcYaO5KJhg1PZ3e6mkMq4kMdxt7
X-Gm-Gg: ASbGncuCn1+6l2qsbLb9EbIL0RsiYiOngx3dITN7lEvzaawG4DDqIdQAbwV3eMR67p5
	UiEvb7RBNi/ok50U8Fj9+kzzawBuYA5Gq62RToK++qZb+/XpsrbUMFT+3wJPsIs6ek2cORnKBZL
	TXMBrdUaBppcUhyekn17bLqxpp6ocgWzKHc2cugZ3mMjuL2AMY15OPfUFxjt6/l9qZF2ywVUJq7
	cVQuaVj1FIVGrlEl7QUSIV5unnTS3ICQCx1RzzoGYQQlozisdlcCsxFEe8uS1r8vFeI2TqEY1Ds
	XyoQG/WEQLj7k+loS6P9YestZN4WWTWNbEPQoXROcLWBzELYcTUDSa5Wu/bUBU5/cQEf/Kd9goZ
	j85NvcAyKNpZPrpPIS8So9avHXg==
X-Google-Smtp-Source: AGHT+IG3MCS/XQ1i3zCJ1Ac6TjWBul2Y1v2qRKnCvZBiJ+c3h0j7SWN3xftK6mA1RE2UFwtjBHFnEQ==
X-Received: by 2002:a17:907:6e89:b0:af9:3116:e104 with SMTP id a640c23a62f3a-afe28ffcd72mr616727166b.3.1755953025569;
        Sat, 23 Aug 2025 05:43:45 -0700 (PDT)
Received: from tumbleweed ([95.90.184.246])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afe49a1f5a6sm165076466b.111.2025.08.23.05.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 Aug 2025 05:43:45 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 14/14] staging: rtl8723bs: remove efuse_OneByteWrite
Date: Sat, 23 Aug 2025 14:43:21 +0200
Message-ID: <20250823124321.485910-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250823124321.485910-1-straube.linux@gmail.com>
References: <20250823124321.485910-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function efuse_OneByteWrite is not used. Remove it and remove related
dead code, namely the function Efuse_Write1ByteToFakeContent.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_efuse.c    | 48 -------------------
 drivers/staging/rtl8723bs/include/rtw_efuse.h |  1 -
 2 files changed, 49 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_efuse.c b/drivers/staging/rtl8723bs/core/rtw_efuse.c
index c4542e00c730..e39032b45c35 100644
--- a/drivers/staging/rtl8723bs/core/rtw_efuse.c
+++ b/drivers/staging/rtl8723bs/core/rtw_efuse.c
@@ -29,18 +29,6 @@ u8 fakeBTEfuseModifiedMap[EFUSE_BT_MAX_MAP_LEN] = {0};
 #define REG_EFUSE_CTRL		0x0030
 #define EFUSE_CTRL			REG_EFUSE_CTRL		/*  E-Fuse Control. */
 
-static bool
-Efuse_Write1ByteToFakeContent(u16 Offset, u8 Value)
-{
-	if (Offset >= EFUSE_MAX_HW_SIZE)
-		return false;
-	if (fakeEfuseBank == 0)
-		fakeEfuseContent[Offset] = Value;
-	else
-		fakeBTEfuseContent[fakeEfuseBank - 1][Offset] = Value;
-	return true;
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	Efuse_PowerSwitch
  *
@@ -183,42 +171,6 @@ u8	*data)
 	return bResult;
 }
 
-/*  11/16/2008 MH Write one byte to reald Efuse. */
-u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool bPseudoTest)
-{
-	u8 tmpidx = 0;
-	u8 bResult = false;
-
-	if (bPseudoTest)
-		return Efuse_Write1ByteToFakeContent(addr, data);
-
-	/*  -----------------e-fuse reg ctrl --------------------------------- */
-	/* address */
-
-	/*  <20130227, Kordan> 8192E MP chip A-cut had better not set 0x34[11] until B-Cut. */
-
-	/*  <20130121, Kordan> For SMIC EFUSE specificatoin. */
-	/* 0x34[11]: SW force PGMEN input of efuse to high. (for the bank selected by 0x34[9:8]) */
-	/* PHY_SetMacReg(padapter, 0x34, BIT11, 1); */
-	rtw_write16(padapter, 0x34, rtw_read16(padapter, 0x34) | (BIT11));
-	rtw_write32(padapter, EFUSE_CTRL, 0x90600000 | ((addr << 8 | data)));
-
-	while ((0x80 &  rtw_read8(padapter, EFUSE_CTRL + 3)) && (tmpidx < 100)) {
-		mdelay(1);
-		tmpidx++;
-	}
-
-	if (tmpidx < 100)
-		bResult = true;
-	else
-		bResult = false;
-
-	/*  disable Efuse program enable */
-	PHY_SetMacReg(padapter, EFUSE_TEST, BIT(11), 0);
-
-	return bResult;
-}
-
 /*-----------------------------------------------------------------------------
  * Function:	Efuse_ReadAllMap
  *
diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 1cee7a8eedf2..5251ecc855d7 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -92,7 +92,6 @@ extern u8 fakeBTEfuseModifiedMap[];
 
 u8 Efuse_CalculateWordCnts(u8 word_en);
 u8 efuse_OneByteRead(struct adapter *padapter, u16 addr, u8 *data);
-u8 efuse_OneByteWrite(struct adapter *padapter, u16 addr, u8 data, bool	 bPseudoTest);
 
 void Efuse_PowerSwitch(struct adapter *padapter, u8 bWrite, u8  PwrState);
 
-- 
2.51.0

