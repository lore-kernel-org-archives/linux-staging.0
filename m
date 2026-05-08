Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F339713A86C
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 19:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778269173; cv=none; b=p/MWSOCVCI9oF+Lm2ZCn3ZPTtVxY3EfMHcr2nm5JSxLiL+J+XGi7dbsuF8MTmA3CRgLuZx5sfhvTa7SgO0FxnHbZnEbQeVOSx9b7pTTjxvIwBcs8kVdlCZene97+yPHWbB+7sAQwlZ75qL+/0UgXZkZhiB/t9PbjvkMEPL1lPX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778269173; c=relaxed/simple;
	bh=PAcB/zUcrf9Nq8co2qTTk/k0foEPzhBxXUXBJ9RfWBI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fYA5Mm+tUr5/iJrOvqM9yTij+bJttbiJcvMIQ3CsrTGlYoWMXQTggn/46XLETtKUbPVywlUEVrSARYugRfeRKkiVvZfQ1AacTHJkb6tdWzZhVKC/02U98TKO9kVbiM8ygRvaO3Z7JiNyDWt8IRcjgfJQzP4mI5EC0N+z/eCKGFo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qiXtI/dI; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qiXtI/dI"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a87edf88b3so1910175e87.0
        for <linux-staging@lists.linux.dev>; Fri, 08 May 2026 12:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778269170; x=1778873970; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2AcQAWtBVkKu8p+8Bn1RIwWMXORC7gAYXSEFAKUWPs=;
        b=qiXtI/dIh/xRROPnC/XvqVcUzQeCJd+9naxFTpsDuM2QFzLaZU2zfi6jRf6xs7XohX
         k7D/dnAo5rZQQPPXZq1Uuv0fBiio3o+J9YfBBxyqkXUq7oQfwGqNg9S30NoBHZ7CJZmG
         aHZqEOPlBBXQgYxuBguA92QVCfGic77I0PmHDFVLM/4xiLeNVL82jFxZbq5L9pzHT8e+
         jw8400thrAqyG4HHTaIQwuibeFnR0NxJJL9hhFklJMtG/YF7OzrbLYjJNU/4zYNUBqnE
         ORwYO2a8iS9e4cXZBKsfLXgslcPCytCGqGRW/Vsh4RW6hB5r81LllaOyUJHMKZvoPu0d
         WKUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778269170; x=1778873970;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=K2AcQAWtBVkKu8p+8Bn1RIwWMXORC7gAYXSEFAKUWPs=;
        b=T2bR7rmp0ZQAajeT0EgWsTzJd2aUwwGvrxjAlQseFLhOcp0cfy16mF07gZILtVtomk
         e0CZE/IaKoUH7ptuqPZtZ7fCb5R1Bw+Q7XDUIiAG1fHnWiEsq/PZgd8EDdfcdDHhHy6X
         u5UJKj4pEr0OTomXgv2tpKrfQ2u6do0FlpKvDd3msHZE9p5fMQ0dGSemhalRTRI+IlSX
         raV8ES65fUKDFvHr2LoQU418JG7MPibR+DkHZrCu03GVuSuob6VFmbD9THm2cJMeH1T6
         0eePAyzEg0Jd/08We2dRc7/jdn2gIxu0PpN2y6dIiYGKf20CcLQ/XQjPi8vFdKAnyl5K
         iWUw==
X-Gm-Message-State: AOJu0YzCpugtUrZbTg3OI538k8LzKMoqNY+eIBdGkXwyRfLRocFaj4wz
	0dsVjRhzHuMiwSbqWIZk0sbBPiDCii7I2E/fGk6orM6ktoHYZLrKD7g8iWUbAGzb
X-Gm-Gg: Acq92OF1IA0l3L1ZU6d0qeeDqKTlNsrxqSagTN1tM+mFQScDH2QR6bFjmS2g9I/s6lE
	1PtFjNYgFN63IlmIoey7r0EQONUB4BtBk/frRB6331300/uDmw18xT+NdBBrCaq4UuAS+KrI3tS
	GEerW/ExXBZ1CLr+AcG6kocbhs4UDaGCQLHzIB1w2ExwhE12ad+tZTlBs90cQOTyfwUya8eobWG
	oMi51IuUP774ccNjEIEjScfN1j7b5rKYAHHu3JtkUIHhx8RSpESZeyWk7zzJY3b0xN1o2giPhQr
	YBYWP/Tl92SWGPzzTHrCimvvxywtnW8O6lYmfNcuiiYUPCyu4Zz66J2qcoGEXwAwAEpjCip3sya
	aUeXxI9bweiYJ+sPC8KMv0oDw96kY1yRxfmcbn7az7/nwO1yYx9/fe/Jxzw2xxjjJqe43CY6v3r
	7PVpwFYMyw+phGPN1QZ8bD040yzkBgawDgCx/N6bbgX6PsdA==
X-Received: by 2002:a05:6512:2213:b0:5a8:9bb6:230a with SMTP id 2adb3069b0e04-5a89bb62434mr4065320e87.18.1778269169887;
        Fri, 08 May 2026 12:39:29 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a8a955df99sm776407e87.45.2026.05.08.12.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 12:39:29 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH RFC 01/11] staging: rtl8723bs: remove unused sdio_local_read()
Date: Fri,  8 May 2026 22:38:30 +0300
Message-ID: <20260508193909.16015-2-nikolayof23@gmail.com>
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

This function is never called in the driver, so remove it to get rid of
dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/hal/sdio_ops.c     | 41 --------------------
 drivers/staging/rtl8723bs/include/sdio_ops.h |  1 -
 2 files changed, 42 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
index 5d74913be573..bfe8ac5d2bfe 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
@@ -396,47 +396,6 @@ static s32 _sdio_local_read(
 	return err;
 }
 
-/*
- * Todo: align address to 4 bytes.
- */
-s32 sdio_local_read(
-	struct adapter *adapter,
-	u32 addr,
-	u32 cnt,
-	u8 *buf
-)
-{
-	struct intf_hdl *intfhdl;
-	u8 mac_pwr_ctrl_on;
-	s32 err;
-	u8 *tmpbuf;
-	u32 n;
-
-	intfhdl = &adapter->iopriv.intf;
-
-	hal_sdio_get_cmd_addr_8723b(adapter, SDIO_LOCAL_DEVICE_ID, addr, &addr);
-
-	rtw_hal_get_hwreg(adapter, HW_VAR_APFM_ON_MAC, &mac_pwr_ctrl_on);
-	if (
-		(!mac_pwr_ctrl_on) ||
-		(adapter_to_pwrctl(adapter)->fw_current_in_ps_mode)
-	)
-		return sd_cmd52_read(intfhdl, addr, cnt, buf);
-
-	n = round_up(cnt, 4);
-	tmpbuf = kmalloc(n, GFP_ATOMIC);
-	if (!tmpbuf)
-		return -ENOMEM;
-
-	err = sd_read(intfhdl, addr, n, tmpbuf);
-	if (!err)
-		memcpy(buf, tmpbuf, cnt);
-
-	kfree(tmpbuf);
-
-	return err;
-}
-
 /*
  * Todo: align address to 4 bytes.
  */
diff --git a/drivers/staging/rtl8723bs/include/sdio_ops.h b/drivers/staging/rtl8723bs/include/sdio_ops.h
index 13f13076bc16..0be763631873 100644
--- a/drivers/staging/rtl8723bs/include/sdio_ops.h
+++ b/drivers/staging/rtl8723bs/include/sdio_ops.h
@@ -16,7 +16,6 @@ extern void sdio_set_intf_ops(struct adapter *padapter, struct _io_ops *pops);
 /* extern void sdio_func1cmd52_write(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *wmem); */
 extern u8 SdioLocalCmd52Read1Byte(struct adapter *padapter, u32 addr);
 extern void SdioLocalCmd52Write1Byte(struct adapter *padapter, u32 addr, u8 v);
-extern s32 sdio_local_read(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
 extern s32 sdio_local_write(struct adapter *padapter, u32 addr, u32 cnt, u8 *pbuf);
 
 u32 _sdio_read32(struct adapter *padapter, u32 addr);
-- 
2.54.0

