Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ACFA30E84A
	for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 13:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763472826; cv=none; b=VKdeUiqF7nDfu/Y7JtTfBk0P5GpF70HgzkyIOv5E/eEfoPM4FI1BPbXNEcdC9JbNkojLcDv5j5vUBp1qjcVxpzvUiQYwzghNzTql4bZIasXXrE4i2ZgmDyjNKh7JCKPFDtia54ojdFqQlRLlJIfrRSroa/Tj/i+SJu/MEN3eOyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763472826; c=relaxed/simple;
	bh=76HQ6IQ9QTcfB996hFo9gZ0/AvkFRWwKPMJKe8uqKMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z3mzF5/bzij7eeyCGpuATgIkvK6/Tv0hJi1dc5iFbl1/BXMcxCCqbeOc3hPDuAoc5I53zMioHJN28TZ3QaSdoBcDFVyJvsMX/qa7Y3KyGiuJF3vtMtQBVIc32z6aWSBo6cm6niMFhMN+bGjs1s7c7mWyf26bhoLIGKXYqF2EGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hurgdeSb; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hurgdeSb"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4775ae5684fso28225415e9.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Nov 2025 05:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763472822; x=1764077622; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rT/5I+MJsNcyTPa7o6mNFKe3n3t9U4jsZXgzo9O7zSw=;
        b=hurgdeSbQKeH3JOnRQEYuTIZxp0njSqIUsqs8Aqo2YTHOd00BSvZ2smqJYURAsFaGJ
         VQXb6eQwB820icnjVaHUuNl1jgETddcQFdCvuPuEgsipQeueR3+QytZ4qqV+uWQCTPKG
         HDcAZt5KNdL8QWNNS/EvkIlCiz/1UEYFTmOFxv0UQl4FtDrQ3elmMcQTDZE3js4N6BO9
         Z63PKTF64xRklQQ5Kz2qwOZAZPvSzZCh5VqEO15GU4LLlkuHRfKcGbUy4i77y51aJdvV
         IiBUAc+e5D0jgN/96i8GMAtIKfHhef/wJ2CzZf03IeQbuOc9RxkZ+l7YrksnwH6r+kn9
         /hQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472822; x=1764077622;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rT/5I+MJsNcyTPa7o6mNFKe3n3t9U4jsZXgzo9O7zSw=;
        b=qna707EZJAiffSVPhxozV6HeEHQzgBjMMyA5D2qC0ZZDH5tcgHzaN3BIwKyZmf9nHk
         1skOM+WExGi6vzVzwBEuXDcToj6BH7iaEgo9XdsOJHxQlqopMf6X0pfLWEdf/M5bMWAG
         glXbIq5gujUO8fWCoAMUe7VgCjmh9cT7bpgrm+Ev+wMcbfTiR3VxketXCYbLrmUJHKjq
         LeQHpwlD0nURFkMkpWN10kIN5EWyCYCC8x9oGz8ugIbmlaxuUuMewHlwz6JSc5sbDckX
         h9r80ayOfZZMLbPW7NVM13Ic+oiapPVRY8wf3CgtyEShQH5b+f+2fUgOg1P+0VqCqgtj
         TngA==
X-Gm-Message-State: AOJu0YxYPvj5vzpXakyXG4G+tCD06Ojj+GXFSBI3Ks6VBv5A2zip5P0B
	ciJtoIbvrezQjRBXS2kwkQ1UUYiJYXCxLFKFWvBIAf2TpmEyJmULSFb4
X-Gm-Gg: ASbGncsvVro+ivmT/QXg+B+qSQ1/RYdgdI2EtIP4Oq24u6kY117lSiLABoUA5Qzdb6F
	/OC5ay3tSWy4eImxTefwVxuJ/oRRRQemZzcfAgRIj+r1jigx7vDq0FgdyVfQUNeHXMRQo1DhpzE
	HPu+sEZ1xuLgWlio5CKUSN1z/0VJFRn9p12b+s5o6fxQiFaBgkK2mz2eGVnDFDmAthyDjSCtCvx
	o01RO7PyoZ4EFVvMDLxNWr1AQQTxKjZBfihTb1LeSxTBB1j7vPUznprkEUHnVA3ZgWJu65b0I/Q
	+lG8GcVyZZghw9wVKGyw/0XTREKdH5OuCTbBjhwdHW8Hn/9Hr/TZaBdm4B0o057f5QmNsVbz/oK
	jqfLwJnVZlkDfF6Yv8xkeH359fe2rwf+k9KvJc+08njSEXRkteByyIBL5f41gIHWohbIbEwec4V
	79OU+/azII9u328NW6G0IB1AhhxUCnHp1f6LbKs4w=
X-Google-Smtp-Source: AGHT+IGa9D6vEe3w0eN9Xmv540V7CnSaHBtmp1YN6JdaAUVIfIkdHiPyd0kGBzeKYgO1yTvizFA0pQ==
X-Received: by 2002:a05:600c:1910:b0:477:9e10:3e63 with SMTP id 5b1f17b1804b1-4779e103efamr82713335e9.35.1763472822234;
        Tue, 18 Nov 2025 05:33:42 -0800 (PST)
Received: from DESKTOP-3GD23L5.localdomain ([197.200.14.134])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47787e2bcf9sm366463285e9.3.2025.11.18.05.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 05:33:41 -0800 (PST)
From: Bachir Benyammi <bachir.benyammi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	zhaochenguang@kylinos.cn,
	dan.carpenter@linaro.org,
	Bachir Benyammi <bachir.benyammi@gmail.com>
Subject: [PATCH] staging: rtl8723bs: Fix various coding style issues in rtw_io.c
Date: Tue, 18 Nov 2025 14:33:21 +0100
Message-ID: <20251118133321.300960-1-bachir.benyammi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch addresses various coding style warnings reported by
checkpatch.pl in drivers/staging/rtl8723bs/core/rtw_io.c to
bring it closer to kernel coding standards.

Specific fixes include:
* Reducing line lengths to fit within 80 columns.
* Removing unnecessary blank lines.
* Removing unnecessary parentheses in conditional statements.
* Aligning pointer stars ('*') in multi-line comments for readability

Signed-off-by: Bachir Benyammi <bachir.benyammi@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 71 +++++++++++++------------
 1 file changed, 37 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 79d543d88278..51a237a6205e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -5,25 +5,24 @@
  *
  ******************************************************************************/
 /*
-
-The purpose of rtw_io.c
-
-a. provides the API
-
-b. provides the protocol engine
-
-c. provides the software interface between caller and the hardware interface
-
-
-Compiler Flag Option:
-
-1. CONFIG_SDIO_HCI:
-    a. USE_SYNC_IRP:  Only sync operations are provided.
-    b. USE_ASYNC_IRP:Both sync/async operations are provided.
-
-jackson@realtek.com.tw
-
-*/
+ *
+ * The purpose of rtw_io.c
+ *
+ * a. provides the API
+ *
+ * b. provides the protocol engine
+ *
+ * c. provides the software interface between caller and the hardware interface
+ *
+ * Compiler Flag Option:
+ *
+ * 1. CONFIG_SDIO_HCI:
+ *    a. USE_SYNC_IRP:  Only sync operations are provided.
+ *    b. USE_ASYNC_IRP:Both sync/async operations are provided.
+ *
+ * jackson@realtek.com.tw
+ *
+ */
 
 #include <drv_types.h>
 
@@ -31,7 +30,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read8 = pintfhdl->io_ops._read8;
@@ -43,7 +42,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read16 = pintfhdl->io_ops._read16;
@@ -55,20 +54,19 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read32 = pintfhdl->io_ops._read32;
 
 	return _read32(pintfhdl, addr);
-
 }
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 	int ret;
 
@@ -78,11 +76,12 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 	int ret;
 
@@ -91,11 +90,12 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 	ret = _write16(pintfhdl, addr, val);
 	return RTW_STATUS_CODE(ret);
 }
+
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 	int ret;
 
@@ -110,14 +110,16 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 
 	_write_port = pintfhdl->io_ops._write_port;
 
 	return _write_port(pintfhdl, addr, cnt, pmem);
 }
 
-int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
+int rtw_init_io_priv(struct adapter *padapter,
+		     void (*set_intf_ops)(struct adapter *padapter,
+					  struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
@@ -135,10 +137,11 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 }
 
 /*
-* Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
-* @return true:
-* @return false:
-*/
+ * Increase and check if the continual_io_error of this @param dvobjprive
+ *  is larger than MAX_CONTINUAL_IO_ERR
+ * @return true:
+ * @return false:
+ */
 int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 {
 	int error_count = atomic_inc_return(&dvobj->continual_io_error);
@@ -150,8 +153,8 @@ int rtw_inc_and_chk_continual_io_error(struct dvobj_priv *dvobj)
 }
 
 /*
-* Set the continual_io_error of this @param dvobjprive to 0
-*/
+ * Set the continual_io_error of this @param dvobjprive to 0
+ */
 void rtw_reset_continual_io_error(struct dvobj_priv *dvobj)
 {
 	atomic_set(&dvobj->continual_io_error, 0);
-- 
2.43.0

