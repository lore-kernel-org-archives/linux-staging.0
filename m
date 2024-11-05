Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE96200118
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786138; cv=none; b=UO15yuT3Qz32fIZKAso3Gb9ztt7bmoTC+zqCSt31glU6wZ+vctotgCN3Tmf7CwQtfLiTTnR9iAdS7zPsk/a2MTZTzcEI6R/38y5GoGcDgQx+pnq/wei8T3PeNnaoCnymp+GmUgewX9PSGzC06p7g2pZXyHbOCCncsQVsG2Wl4xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786138; c=relaxed/simple;
	bh=28Bkc5YGsObVRPzBc7wWi9s9JfvFJnwV1Px34/m+LMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pmFQON9Tc/aQgLzDWv6VWgAw/QVqhNS6hURKQbV+abO/hMvSTcSjkdgvgNYk3sGbavAlJJb8AsvOWCGM6s8MC/XI9T2s+mg7XLpVHLrHkz3jS6Dj2kmZZVBu4HOTlxFhwvE679xEVQZ3DcswRYC7y8evxfGkXsg9sYLRgYjqoQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bolGDpTs; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bolGDpTs"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a9a0f198d38so851196266b.1
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786134; x=1731390934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJ0gej5hu5i4ouNXd0ApdepNnr3n035slJGM94RcvIk=;
        b=bolGDpTsVQ51c92JKcAmbv8kj4/qF43PSkTMksVZcKiCX39B7josb5DrMvoAVJpscI
         rsLVozUVYg1RJeBGYiXua+KI7fveEVOC5FTyC5ekyJEIxS+ulPXsQHcTkRLgDdapbBpM
         cesJriyMho7WHpysKU+qsdm4xfB2Dk0tZHZjxdpntkJjylHQUBnK60tjgoUXfvoa//hA
         ZJ9h9So/ZAXYxiYi96W2zhlj+N+5HWNOWNacvhy/l4gy72uhL+TuooRZ3/b3Nuuch+uf
         ENYtvoWUCXed9au6ukGAtiyLGCU46Fo1SNc2wBMBb4O0t77eNUIshlyv6Br0trSeYL8M
         +JlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786134; x=1731390934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BJ0gej5hu5i4ouNXd0ApdepNnr3n035slJGM94RcvIk=;
        b=LBSdS8Wg/0yCY8gerzF9MB2FeCVvXnaavMm6ih5USAzo/TWU9FdKVkVv3Cxwz/EUFj
         ACVZTj5ik+HF3hiP4mODxBHvHiX2tk44n1X4hd8oVlyde0YANiZO0NS8GX4woa1J6SHF
         JP7FTAVX+3bLo2WXIS6x/goa776n7wHx2vMDgQ8emqRBymU/QYXdS1DarHCFb8ffzHfG
         7r+iCXWt6nbWmIg6skXUnqi30RjxNfWq8oKfp9Il88zESoJGf15VqnwBe6wwt61PPLKs
         c2qlh+Lwz7T+S/5n9EkTDFHXqeCXk1qX0TrabpiIAO97I/hedAnv4B+NvAk940THxQNO
         COEQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNdPDc9bVAB8AI77se+RZZ8JtI+/6IaDUrbCwh2IkwYjEOv9jmV6cCgZxBmAg0alveKXJQCSjWNE5Zjj4s@lists.linux.dev
X-Gm-Message-State: AOJu0YwWSBRBG6+eth5w4wq+4aDq1TOYy8wadL4hkczLgdLF3OLc1L4F
	isQW73hgXADAZkW4cyc9PLCCXx8473yiTFILMZ+OirhNvJUdcvsZ
X-Google-Smtp-Source: AGHT+IFebDS3Zdq8uE5ocERonEnyJ7aAzrtfqYEtNnSmFUVZd3nDg0JDXj06JbVLHlSRZz2ILbv2mg==
X-Received: by 2002:a17:907:97c6:b0:a99:2ab0:d973 with SMTP id a640c23a62f3a-a9e657fd76dmr1370951066b.55.1730786134330;
        Mon, 04 Nov 2024 21:55:34 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:34 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 12/16] staging: rtl8723bs: Remove function pointer write_bbreg
Date: Tue,  5 Nov 2024 06:54:59 +0100
Message-ID: <0405fe50c32cfafc95ccf9ceabaa05e14ce653be.1730749680.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
References: <cover.1730749680.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer write_bbreg and use PHY_SetBBReg_8723B directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 drivers/staging/rtl8723bs/include/rtw_mp.h        | 1 -
 4 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 5e53d6a56b44..4faa64b1c476 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -247,8 +247,7 @@ u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
 }
 void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data)
 {
-	if (padapter->HalFunc.write_bbreg)
-		padapter->HalFunc.write_bbreg(padapter, RegAddr, BitMask, Data);
+	PHY_SetBBReg_8723B(padapter, RegAddr, BitMask, Data);
 }
 
 u32 rtw_hal_read_rfreg(struct adapter *padapter, u32 eRFPath, u32 RegAddr, u32 BitMask)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 9d1b47f4c828..a8191b84eb81 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->write_bbreg = &PHY_SetBBReg_8723B;
 	pHalFunc->read_rfreg = &PHY_QueryRFReg_8723B;
 	pHalFunc->write_rfreg = &PHY_SetRFReg_8723B;
 
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index f95bd07a5d31..02c18dbc04b1 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	void (*write_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data);
 	u32 (*read_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask);
 	void (*write_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data);
 
diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index 63b2ee7e824f..30badc3f8d45 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -276,7 +276,6 @@ void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u3
 
 u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
 void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
-void write_bbreg(struct adapter *padapter, u32 addr, u32 bitmask, u32 val);
 u32 read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr);
 void write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 val);
 
-- 
2.43.0

