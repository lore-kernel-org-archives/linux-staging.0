Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00470200110
	for <linux-staging@lists.linux.dev>; Tue,  5 Nov 2024 05:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730786138; cv=none; b=BXpWWYNMO3b2ZqZUkBXbFb4ASw6S8igw1HKKa9r4D1o3I5/q60PHfpweYrxUFDpADAiCWm0euoTfO/ntJds4uAFkuSLhAbBz6htQktLcmPRx8+bHtsTKzDg13aBEyNZ1+E5hWXnvmZETEwggZt5dnbKxkHMd0+5zftCzYjqHmOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730786138; c=relaxed/simple;
	bh=svDsaygyFTZe/9Fa4yspOWzEFRzq2T3AsVoPXnJ61Og=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gxddhn2YRWh4Q+D3K4KkqpONHGT94HY+1dpLafbF24Zo6GNDDDb1+CKj0yk3Rvc3IntKHMEfipzCEs8QEMi4p7lWo7VBxBkfmZlnwFVIV3OCObZGZzPC1LSwmrxN3gCLCr8q6Sk57H2gpLxfaITW1pqQbT2y5QJHduj1QP9izGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GtkQnJMI; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GtkQnJMI"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-539fb49c64aso6970435e87.0
        for <linux-staging@lists.linux.dev>; Mon, 04 Nov 2024 21:55:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730786134; x=1731390934; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8/p8mfQcwgmWTaow4D7FS5k0WwDF702iUg3tHZvn7wE=;
        b=GtkQnJMIErchS36rOMnkG2Wjs4Awx59hXTJ5fs3WMEqO6cSZ5cjDL5KVmWIltuWnZD
         EgViCHOMpeTcQ7lJ5aI/tTeYRlDhICzWypMmupSzeMIdjoQaJJI11KfgmmNfVX6tB3/d
         eTSpC8xfD+Xn3e97EBIROR3HCBLqymlqopVLtvZjHVsW1qfOc3VxhBVqNEvKMDtabUkE
         0n6GSR06U83FtnK7rIU9MpXwQZoeh4v7Io1sEbVvZPXHN/mOhGjO4Xg/JteLsZMNTfZ9
         KYtSKrZOSH06fgCmzixezgbLo8ErRYUCET0zW7yMt6StlQ5TFga6vXyrdJLhQ99zvQwu
         YBRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730786134; x=1731390934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8/p8mfQcwgmWTaow4D7FS5k0WwDF702iUg3tHZvn7wE=;
        b=uPk7nE4EEQbBO/4ihveNWedsM0y0dQKvqLUpxwH7Svq6oFiIHx4wtZW6m8+xVw9RRs
         3zPDouPXBoCoLhIUZr2HJYBgYdYbBpm0EOCwazN+btLyREeIBlIk27wbLP+PVPDqz4l1
         hUHMpTfnBKnvycOI04X3kLkuuIljen9edHftLRrqRr/GFhPxc8ki0h8FnZtylUYOFF6e
         ksPZ5NTOMgrPBzAWyM0eZY6u+ZJXXEhJ7k80o5LfWjXTOQbuoCum4hVAwqDaRL6WOhK4
         QMLGczKslyFJwsb2EsBqwOPr1bua55uLXujpt0kgLc8nhT1+PcF2125vKlKFM3BYc169
         0YKg==
X-Forwarded-Encrypted: i=1; AJvYcCXBOoTRHe1ecLHSYAOUaZE+GX1J8xE1UGTn4RUeRY0y4Nkv/XhP8GQ1Ovv9mOvTAzIWBGkhIYNxZfdxJi2N@lists.linux.dev
X-Gm-Message-State: AOJu0YxSfF5MDgfmFqC2hrruYFgL2ETJkM9aXXDDMqyN8NqvMFxThJq2
	fmk9Wd8YHdDDa6QyA2fM4R+EznsLzv9rj7uBZ4/R8cbcdto0TiyQyuVLJg==
X-Google-Smtp-Source: AGHT+IEeLXt78rYimjyRK8fTPdhONbLzK8bL2pl3MQuLGhvZK712Ig08iwAvKqiv3AYYM1OS1IfkEA==
X-Received: by 2002:a05:6512:2384:b0:539:8a50:6ee8 with SMTP id 2adb3069b0e04-53d65e168c8mr10761917e87.57.1730786133749;
        Mon, 04 Nov 2024 21:55:33 -0800 (PST)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9eb181451bsm78775466b.201.2024.11.04.21.55.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Nov 2024 21:55:33 -0800 (PST)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 11/16] staging: rtl8723bs: Remove function pointer read_bbreg
Date: Tue,  5 Nov 2024 06:54:58 +0100
Message-ID: <c80ba5221c2b4be85e65246b30cafc111235cf3f.1730749680.git.philipp.g.hortmann@gmail.com>
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

Remove function pointer read_bbreg and use PHY_QueryBBReg_8723B directly
to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 6 +-----
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 drivers/staging/rtl8723bs/include/rtw_mp.h        | 1 -
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 22c41e4deae4..5e53d6a56b44 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -243,11 +243,7 @@ void rtw_hal_stop_thread(struct adapter *padapter)
 
 u32 rtw_hal_read_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask)
 {
-	u32 data = 0;
-
-	if (padapter->HalFunc.read_bbreg)
-		 data = padapter->HalFunc.read_bbreg(padapter, RegAddr, BitMask);
-	return data;
+	return PHY_QueryBBReg_8723B(padapter, RegAddr, BitMask);
 }
 void rtw_hal_write_bbreg(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data)
 {
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index d23e4b1c36b6..9d1b47f4c828 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1744,7 +1744,6 @@ void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_level)
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->read_bbreg = &PHY_QueryBBReg_8723B;
 	pHalFunc->write_bbreg = &PHY_SetBBReg_8723B;
 	pHalFunc->read_rfreg = &PHY_QueryRFReg_8723B;
 	pHalFunc->write_rfreg = &PHY_SetRFReg_8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 02b31c142b9a..f95bd07a5d31 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -164,7 +164,6 @@ typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 struct hal_ops {
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
-	u32 (*read_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask);
 	void (*write_bbreg)(struct adapter *padapter, u32 RegAddr, u32 BitMask, u32 Data);
 	u32 (*read_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask);
 	void (*write_rfreg)(struct adapter *padapter, u8 eRFPath, u32 RegAddr, u32 BitMask, u32 Data);
diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index f94bb18479da..63b2ee7e824f 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -276,7 +276,6 @@ void _write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 bitmask, u3
 
 u32 read_macreg(struct adapter *padapter, u32 addr, u32 sz);
 void write_macreg(struct adapter *padapter, u32 addr, u32 val, u32 sz);
-u32 read_bbreg(struct adapter *padapter, u32 addr, u32 bitmask);
 void write_bbreg(struct adapter *padapter, u32 addr, u32 bitmask, u32 val);
 u32 read_rfreg(struct adapter *padapter, u8 rfpath, u32 addr);
 void write_rfreg(struct adapter *padapter, u8 rfpath, u32 addr, u32 val);
-- 
2.43.0

