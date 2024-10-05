Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E83AE17108A
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160495; cv=none; b=jASimb9ftdMRz+i1WspdSlZKSqaa8HnMmWSCY8jXFSvC0NoVbGmIajXKdGNL4hsRqsQ/d7t/wz7nJwfrM+MnzT/2YIKNPfK3EtKRaiN/gjipE643zf8L1dBuTPPqNu2aTu6z3245/O4RF7F6dzVt4wIwyrKlg9X6t7wIyKq30zI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160495; c=relaxed/simple;
	bh=dabQ6fghBfIvhyifZzKyzwvT/xIYIhxb9K8PNzkevQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SE/JyWOz+6jlj5n17mgVQhAun64E+k2Muv1JSQJdwRc4Ut7DmqiFKcw8JH+0QQfpUV5z+08fuiX4/n+yohFrm6QPcg4lSkw/MO622BujjxLlyNpyXiYN+MSxEPU7A7sSCdPYGRyKGmQ9TsLFed9DadvZEaqQJzce5J711OVRMDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PpIsBs4O; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PpIsBs4O"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42cbb08a1a5so31601215e9.3
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160492; x=1728765292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dxnc96e2zL7BVq58lm7tPzStwCCg21M4KyRml5a1xEk=;
        b=PpIsBs4OoypIihtparkm2sUm1+ESseywII9Hwyc0zLfErGY0I6jCyKWKFS8wLOBMcB
         cvqs28CJIXnMDd/i4DC/bOkBh4y10gvr6nkIs5K/LxkQqubJTxeZOaURuqdToDK/gXpl
         +jSRmzEzvxJZqTdoMBl0BdlvOMURaF+koDC5LgEt8yIEkelMkrzvb9v3q2ezOk5hJltl
         k9mRshvtx/ng5CTmUi00IXyNKL76yGicwaHrqc3DTO/fPRqBBLWV1zerTFgjd9TOdemh
         zGVBLkY2NVnYdwmqStDFiskF5vUSMGkqvDsVdc6S8OjlYrUmQLDHqZhUF0urAWhOQE8h
         PAyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160492; x=1728765292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dxnc96e2zL7BVq58lm7tPzStwCCg21M4KyRml5a1xEk=;
        b=Qz0NzzoExNSSSpHymPiqbW0qlnjKhtyNSiAsKQ0LFJT58erd8/Rb7JZIIF1iVBE8gd
         T/5a09VrQ5VS10t1xTnyXnEPGIYD7TKnAgzQriSTBJwf3tsFAvQvakSU15BLJVrlmWx0
         zqYDZZw+jsr/P2H68GnGnt8fGqam7QMZ98LDUjiiAVaCAI3ChBuGMS5VhmvcT+1S3fID
         iU8/95I2a8DnsqYYhUAWO3FrV5Wq3jYPZycRGnpO6wR2SQHO5LIIIBV8J499EiiIdqAt
         eHhM94jNvvDDWKeAPCg/7tdbRGXkZe8HHD94itwMMsyijFG/ZotMeZsrneavtHffMlT4
         IUJA==
X-Forwarded-Encrypted: i=1; AJvYcCVMMQ8HGxaVGzXuoTKrROqJA9Y+J51a16WPH9GtSPT1hK/pULfo7ey2Xd3gN4/+AhYs4+XFz7K/EmmzuJml@lists.linux.dev
X-Gm-Message-State: AOJu0Yw7P+SgLJLCuXOZnR7HDoBRcHMba6glUMx0928896Pyhs62z8dR
	j5DwkZD5kn2TMdvFmk3d72ZpFkqLEt/zC49dPoScmsa+EyDz0KKl
X-Google-Smtp-Source: AGHT+IHUweZibiPXVMd+Cs17iH023FX7ucoRIBL+3Nw87JOZUy0zoEaXpTUDzdFBAI8zmvbRKEHtPA==
X-Received: by 2002:a05:600c:19c9:b0:428:10d7:a4b1 with SMTP id 5b1f17b1804b1-42f85ae92f4mr50982645e9.25.1728160492135;
        Sat, 05 Oct 2024 13:34:52 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:51 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 08/15] staging: rtl8723bs: Remove function pointer dm_init
Date: Sat,  5 Oct 2024 22:33:51 +0200
Message-ID: <e25134aacd3f784300f527d7e367b9f0f066254a.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer dm_init and use rtl8723b_init_dm_priv directly to
increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c          | 3 +--
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h      | 1 -
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index de7dfaa69c66..760ba45de8f7 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -39,8 +39,7 @@ void rtw_hal_free_data(struct adapter *padapter)
 
 void rtw_hal_dm_init(struct adapter *padapter)
 {
-	if (padapter->HalFunc.dm_init)
-		padapter->HalFunc.dm_init(padapter);
+	rtl8723b_init_dm_priv(padapter);
 }
 
 void rtw_hal_dm_deinit(struct adapter *padapter)
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 867021ed31bf..106f1124964a 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1823,8 +1823,6 @@ static void UpdateHalRAMask8723B(struct adapter *padapter, u32 mac_id, u8 rssi_l
 
 void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 {
-	pHalFunc->dm_init = &rtl8723b_init_dm_priv;
-
 	pHalFunc->read_chip_version = &rtl8723b_read_chip_version;
 
 	pHalFunc->UpdateRAMaskHandler = &UpdateHalRAMask8723B;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index ced414f2368e..8b85baf5be92 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,7 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*dm_init)(struct adapter *padapter);
 	void (*dm_deinit)(struct adapter *padapter);
 	void (*read_chip_version)(struct adapter *padapter);
 
-- 
2.43.0

