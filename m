Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02DC4DA00
	for <linux-staging@lists.linux.dev>; Sun, 15 Sep 2024 06:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726382467; cv=none; b=VIL0CZ1xYGudmwRhaGYowiv8j/CvdD3+vpASmuiK+EJ/R3r1kKQ+GfkdOGF+zEC6hpvsbcz8FhtYtCyqePSlVPCyUBwRVBUkcxg8yM7gfnEwLno/JKYtPqEYHZCcm2ngI9ktRpo7Pi26RmobX3yPs7QD2p/rsYaxD5gFdjjxxig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726382467; c=relaxed/simple;
	bh=H/5C/7Pq0/4r9GEExQHKfhf+aom5wH/AOubWvKBdP9U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T653RHBHZqlTIwM4zPia+jRg0gFAPqTPqKyupFw9iEhwcjIjzQWlEDJ3/SEksRwycpQbmERjIP+yQiOlme4hQElgzDZ9Qz7alGJFi1y13Dor81rMMygStv1bW6nvf+Npc/7VonuLayMRZ2ULmm3llKdBitTGiQ6EIWEex2uwlnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=deF1rCGk; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="deF1rCGk"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-a8a6d1766a7so436947166b.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Sep 2024 23:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726382464; x=1726987264; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EDNe2JeoZZgOZzlo+ZuSEo9w+uQCIRKUr+z91NOOW5g=;
        b=deF1rCGkZKFRJN9NJpekO+Ev+XEPmsBUAPXdwhIp68YlEEEmJZAS1IlEIiJ+ONQyV5
         gkfzW2EyjuPjBb6eBBlwLlKezrcvviFk+3LCEy8HV6W69Tspani3+wiNohHO2KsdwcQ8
         QDOUb4HP12WvNpr+/+o2pstC4Z/5P36NMfYqSn0IyXV8md2c6wSaMoA4Ybfmk5f8aMz0
         q5QqGtyxSyyVI2eFGk/rPwpik/qDUUhTMMNJNHCMBxWh4/+XmJ0owPr79UidT9UnRa6k
         hJQcJur40VHp+Wl3IB29MNP5sCDEcx/Any38KcbZdRQtgWSyj3IhaASHZTC1MS5fvFib
         4EJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726382464; x=1726987264;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EDNe2JeoZZgOZzlo+ZuSEo9w+uQCIRKUr+z91NOOW5g=;
        b=jVErWVZlrIPafCu4P7/R5J7cDsUHq5R8vQY9dAHF9bEnxmY12x8JGERyqwXJuYRsI8
         d3jostjbFV5aTzZalsd+LcOr5VOFW2c1VRdcITJB+9Kxwup5aEWunfv/yubBMMdhYgFI
         wnSSr083Zk66/AgXKfggrxVhdp7I/vJ8Ppr2Sw9Q5dwiwQ6QIHZbdxQYsICef+uhLwvi
         7VJOIQ/42Bm2Sg5xrNAu7b230uFefiHaKQ8s4FwpbUvb71ejW0TOlnpvGlhNC9FZjZeU
         VCj6YObvChT39q+UmVp+/J3ukN2FVAqi2ubZn45BdDczlD65uO2JV9PfcSFqxGwFf/tv
         uL2w==
X-Forwarded-Encrypted: i=1; AJvYcCXLOMpiHL6yE8KicfEBMk0DllxTMJbaBTVY41B9RnGr0Dy18g6u7QZfmXqLN5zvV9EIHOo9GC98o1EQedD8@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6BXAyaM+EVX5aXrSVJeE0erRMCKwmHlmXqJZs7q4AYYrONze/
	mqXUyYi/IiWes8Wd+UNdX3qfI1UrXyQ+FsLMrnTUWMLR6GN21rCNz6t5pw==
X-Google-Smtp-Source: AGHT+IE9US5RPXllkXRUFCp55JqjWjrH62fOS+qtz8JPFE/cglfP6G+solJ9l7DIQZ2Aum5hIcsKAw==
X-Received: by 2002:a17:907:f1a2:b0:a8d:250a:52b2 with SMTP id a640c23a62f3a-a90293c543emr983350166b.6.1726382464054;
        Sat, 14 Sep 2024 23:41:04 -0700 (PDT)
Received: from kernel-710.speedport.ip (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a90610967bbsm160201066b.8.2024.09.14.23.41.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Sep 2024 23:41:03 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 11/17] staging: rtl8723bs: Remove unused function rtl8723b_GetHalODMVar
Date: Sun, 15 Sep 2024 08:38:25 +0200
Message-ID: <3837617badf7c81b2914074b56c5064276eb1946.1726339782.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
References: <cover.1726339782.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused function rtl8723b_GetHalODMVar and belonging unused
function pointer in struct hal_ops GetHalODMVarHandler.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 11 -----------
 drivers/staging/rtl8723bs/include/hal_intf.h      |  1 -
 2 files changed, 12 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 4c6d9f1fa895..33ae1ae51a30 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -1769,16 +1769,6 @@ static void rtl8723b_SetBeaconRelatedRegisters(struct adapter *padapter)
 	rtw_write8(padapter, bcn_ctrl_reg, val8);
 }
 
-static void rtl8723b_GetHalODMVar(
-	struct adapter *Adapter,
-	enum hal_odm_variable eVariable,
-	void *pValue1,
-	void *pValue2
-)
-{
-	GetHalODMVar(Adapter, eVariable, pValue1, pValue2);
-}
-
 static void rtl8723b_SetHalODMVar(
 	struct adapter *Adapter,
 	enum hal_odm_variable eVariable,
@@ -1876,7 +1866,6 @@ void rtl8723b_set_hal_ops(struct hal_ops *pHalFunc)
 	pHalFunc->Efuse_WordEnableDataWrite = &Hal_EfuseWordEnableDataWrite;
 	pHalFunc->Efuse_PgPacketWrite_BT = &Hal_EfusePgPacketWrite_BT;
 
-	pHalFunc->GetHalODMVarHandler = &rtl8723b_GetHalODMVar;
 	pHalFunc->SetHalODMVarHandler = &rtl8723b_SetHalODMVar;
 
 	pHalFunc->xmit_thread_handler = &hal_xmit_handler;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index d41f458d117e..73b6c4d199c3 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -206,7 +206,6 @@ struct hal_ops {
 	u8 (*GetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 	u8 (*SetHalDefVarHandler)(struct adapter *padapter, enum hal_def_variable eVariable, void *pValue);
 
-	void (*GetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, void *pValue2);
 	void (*SetHalODMVarHandler)(struct adapter *padapter, enum hal_odm_variable eVariable, void *pValue1, bool bSet);
 
 	void (*UpdateRAMaskHandler)(struct adapter *padapter, u32 mac_id, u8 rssi_level);
-- 
2.43.0

