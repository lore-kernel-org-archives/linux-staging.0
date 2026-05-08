Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99672376BC2
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269176; cv=none; b=gWnVswrUKjpUpR0S68kaiOWvJOawH3GFAipsTrzt64vv4d3fqWwyh6kA1X4wwciZ6+eTbz2Z5KO/anD69B8HhfhlgLLaiK/2i4Yf/Uf5316EmsUUnMrwGh7Oq5mJc7gdVNsFczsduYywlqV6QrbA/lrocHvOCO3R56aw+JYN1Vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269176; c=relaxed/simple;
	bh=x35HqTsN14wag/h4IhgJvXJosEb99tLjjkU3noYfeXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qu8UlxHWOpRfnAjMYWiIAMo3KrLdSYc5cWHMv8zBVZ/0pff/EyDf7J0FW7lG0ivtxhcrJ0wQ84C+NSSgTvND5kr+sQvjkjRrIRSQvyzTChb3rvvhdYL51tRcbjM2HxbzQOhT+omCmdPS+p2bjohabhwaJzxeAQAK3VngxgbJ1jI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kAZ/yuTM; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kAZ/yuTM"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a8738c178dso1604792e87.1
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269173; x=1778873973; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lC1iB7OEkTFsAJipPD4Is9/iULhDuok9XZb8th1RitU=;
        b=kAZ/yuTMz38m4PvYaWxceX0nEy9oWI4wooj3tp+cwSvEyF94aWpulCnds5Pws1MeLr
         gJg3UH7VHRI2rS5DqFtlJzC5qWzRH9g5Vw4jx8DKJpXmEjxNZaSEZy++KFMdz86eYSyl
         1vEJrtdai/6Nsr6fETptBPAvsSpmFt7jdX1qowpQdPh87bL3LVymjvUAYRyAcNT4NHrn
         sF3toholPRn2vXAxVipEpFnTsnOyIHLdLoXGHqWCzwAanr+QNylvAMIpphNBgWOhymPy
         FCEIK2w0+MQXKL+YCXaserdW0yiME3n6tzl27mp82kbf50cMNCOPNu3+kGtc3r0DHbct
         K3rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269173; x=1778873973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lC1iB7OEkTFsAJipPD4Is9/iULhDuok9XZb8th1RitU=;
        b=tIszW8EQOFuAQDGVFo60RTiUMO8Djat5s7PdHUuX8vIa2mPq5sjTBSclR5uKXpP15C
         D33Dkb7yPvF09LR9o4O2x33Pf313vMxGhcZmgo+vyZAqzMjEYjhe6eHpV/UWjgg0gMLD
         47bl0XsHKdnaiMHV4ubPmyP8lOKSvNurwQkMGZZNxeo5MOk/za9U33QYCQcDgtjNUiSK
         cYxCVuA9Dcsy1aeT+X7WORS6Ebt+Q4Rb/gUh556+Dgy4iFWYDWEH4+HdbDMTJgWOxvyb
         EA9RNy9IZbnBdAWw05n8nK3Y1/y6Nd/y519nngpnGhjAUOOT6PTTWqr/ZJJd3eQU8a9S
         zTmg==
X-Gm-Message-State: AOJu0YxrzYINA4VTmY3nOOiSgxc/46oVlxHvDeVPz2+R5pn1e+t9J0AF
	ngWxPPTJfIt8l2kQ16L9/soLkohIx9bEhkifynoUtb5GIB+PiiK937j1
X-Gm-Gg: Acq92OEf4CFaaJbhEEyEmOODTLIjtfzA07ghztOI87vGMZ5aWzcPjkLD45tr9F3afai
	NCBcb2Id8Qt7W4UrOZrOghsQ1HAgH/aH5gQhJW+FIYL8RgDNST0BbhIHHSbeCUhjmoGsQaoaUK4
	TMwiGSPv4JBKFpKG48Cs+s67tGVQDB77ogY6W5YfAoB+o+qfomKo7twnm+MidPB23Wg0Bqlpr4P
	UMLLDCICScWHLoGLx9Nd7OS4nP3J1qsTwQbrjuhz8H7NZEYdD/QFIgPUVDoeD3lCZKFKKRb7Hcc
	OWE5W19nLOUCDc8oPIHaqr0GOLFkYcLS2O9J6Em5WBXVvbjiudrQ1PfK4AWUwBybhWVaCOJqKfo
	IC1atV1XsuoBpFvlJ8c7UJrj+1JA26F0/o+wkRwNN69g0ReT8JUlxiAz56dtWloKqAyDwD6NSMt
	eJWt27YKdn7WuXbmwiFqUQKpoYr87Mm2pqIoWhWyeUjDrWMQ==
X-Received: by 2002:a05:6512:3b9e:b0:5a8:72e2:dba8 with SMTP id 2adb3069b0e04-5a887ada87amr5059764e87.3.1778269172446;
        Fri, 08 May 2026 12:39:32 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:32 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 02/11] staging: rtl8723bs: declare helper sdio functions in .h files
Date: Fri,  8 May 2026 22:38:31 +0300
Message-ID: <20260508193909.16015-3-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260508193909.16015-1-nikolayof23@gmail.com>
References: <20260508193909.16015-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These functions may be needed in the future in other files when fixing a
large numbrer of abstractions over SDIO in this driver.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c           | 5 ++---
 drivers/staging/rtl8723bs/include/sdio_hal.h       | 3 +++
 drivers/staging/rtl8723bs/include/sdio_ops_linux.h | 2 ++
 drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c  | 2 +-
 4 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index bfe8ac5d2bfe..a0b5d36d3b02 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -13,8 +13,7 @@
 /*  */
 /*  Creadted by Roger, 2011.01.31. */
 /*  */
-static void hal_sdio_get_cmd_addr_8723b(struct adapter *adapter, u8 device_id,
-					u32 addr, u32 *cmdaddr)
+void hal_sdio_get_cmd_addr_8723b(struct adapter *adapter, u8 device_id, u32 addr, u32 *cmdaddr)
 {
 	switch (device_id) {
 	case SDIO_LOCAL_DEVICE_ID:
@@ -85,7 +84,7 @@ static u8 get_deviceid(u32 addr)
 	return devide_id;
 }
 
-static u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
+u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset)
 {
 	u8 device_id;
 	u16 offset;
diff --git a/drivers/staging/rtl8723bs/include/sdio_hal.h b/drivers/staging/rtl8723bs/include/sdio_hal.h
index 6538253765f1..96f494dd1bc5 100644
--- a/drivers/staging/rtl8723bs/include/sdio_hal.h
+++ b/drivers/staging/rtl8723bs/include/sdio_hal.h
@@ -7,6 +7,9 @@
 #ifndef __SDIO_HAL_H__
 #define __SDIO_HAL_H__
 
+u32 _cvrt2ftaddr(const u32 addr, u8 *pdevice_id, u16 *poffset);
+void hal_sdio_get_cmd_addr_8723b(struct adapter *adapter, u8 device_id, u32 addr, u32 *cmdaddr);
+
 u8 sd_int_isr(struct adapter *padapter);
 void sd_int_dpc(struct adapter *padapter);
 void rtw_set_hal_ops(struct adapter *padapter);
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
index 18830dd18372..ab8b58acfe4b 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops_linux.h
@@ -11,6 +11,8 @@
 #define SDIO_ERR_VAL16	0xEAEA
 #define SDIO_ERR_VAL32	0xEAEAEAEA
 
+bool rtw_sdio_claim_host_needed(struct sdio_func *func);
+
 s32 _sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata);
 s32 _sd_cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata);
 s32 sd_cmd52_read(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pdata);
diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
index e9a2f3f7ec74..33bf826679f1 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_ops_linux.c
@@ -7,7 +7,7 @@
 
 #include <drv_types.h>
 
-static bool rtw_sdio_claim_host_needed(struct sdio_func *func)
+bool rtw_sdio_claim_host_needed(struct sdio_func *func)
 {
 	struct dvobj_priv *dvobj = sdio_get_drvdata(func);
 	struct sdio_data *sdio_data = &dvobj->intf_data;
-- 
2.54.0

