Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763373859D7
	for <linux-staging@lists.linux.dev>; Mon,  9 Feb 2026 17:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770659858; cv=none; b=HeLbHW1FQnBnHkFteVW1Bk42+qPi0We9uy9hx+H4BcpOafaAwCiYdTPSV2V/eMFsDzBFmz1/9PamyjclLT807g8PkMfOHM/5+ViA0ZNiGftCWvgpgGlypqaB4yR/uUlHTbrx1T7fxNhN8IyVwxsQTI9fSUs+pxyQAfonKkBf3iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770659858; c=relaxed/simple;
	bh=Q45eo5XqUsU28o/eDGjP57OZSbf9OYY8ofJii3ES3HA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LUF/BduBfSuNL90emqI3KXkUQBxN/UAHgjQXrWCJOB5kaBvVowh9cVgBC9agmcM4RS1eXDWZth3jDZUmfwHuFFsjUyZK+2kglQ0SJzO1Vatpnc21PE05zhTZOrsJr1HOIz7/7Ug0Orj+H32pGfyhWdHccObV+k1WjMAHVtke7G0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EEo6l4qR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EEo6l4qR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4375d4fb4d4so14338f8f.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 09:57:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770659857; x=1771264657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ng9eGfhVOB3q5BGAvPSSXIQd44JrTYXj0/BCraGi5vE=;
        b=EEo6l4qRLvTBxxioSabmevJz9pXljoKfDqrvTo2TvcUkQRPIG+Z0OP9PwhszKeDX2j
         F9XsDEfjhpMgczM5OqcdQ72HIKz3BwNVsXwOYXmY8lMS1jdTMVq0yQ4yzUkpP0w7ET6l
         XCJ/b9wx+j0+ZIBZxnB7BfL8TQ6CcHDUFhPj3i93xBCP714+GTY4C/GHGf64IYW8tf4x
         oZunNTWRRpw8gvO82RwbyhDpFAO9H8aLZ3Ww0b261iq0Mq3+u/sDImogzoX5O/djxJvV
         t0BXPogLYWn21qYm56ZuyQnMOLRqZcTwUDwq6VsnfwOkX39o7MjNiUrcm9yCebTH5UVJ
         PA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770659857; x=1771264657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ng9eGfhVOB3q5BGAvPSSXIQd44JrTYXj0/BCraGi5vE=;
        b=tXPlerz6sKyQjDgHtbuVHIIJdZPQclBxJB7HuVd+MkeqS+v6K2lgwwyTtHjHuLCj/R
         XxrgzHH+bcvzy8/Cs9EsARAaJ0ZHLqLpcsLCjtOxYnCD1bkkdR+0fBTcj7bRCb4iNqnp
         Ann3EeKwRHy0TqN9xdUd9toN3KPc8XpEGagnQMy6/DXfuFed9gE3iniwiNTAT0HGMb21
         pkIXPVjHMWv7XC6B/BvowpRvD5mJvwtX2GOAkZYihR780LcTTWSKoMkYpvPO+unjKf+U
         gVl4AGz1FFsZVIJTZsp4jHVbds04iOKzSig48PvYP/PIH5Sy9TsXfdLAfdevVvav0d9J
         +Juw==
X-Gm-Message-State: AOJu0YwGbJdiz9EDXCwXdfBhZasTvsiK4w0NUmpl/lyjujo1gAWFBWn1
	2eXKkJslYMH8FSAs87nuPRdY4ylpf/tCEMU0xDsWoOOhyUhej781YcrC
X-Gm-Gg: AZuq6aLivBss/JKfCzpLhYNokoHailDbPjcTC9C9SIj9gKIK2TNOcwZWxqxpU4zL8GK
	wGhTEKJeCnaAub5yM92No0K4Ckz1lo808bdJxK8IDLSH9FtFwOP7utcsOxth5PP7O75MxrNH+yD
	JE/4lFlGSYfrIAIHJNfw6ArYhi1dH+L1RKKyRG/e/X48xjSTPED3fUtyavyde6Nfb7So235Fmva
	sW1rLnkv87gvhTBV/Bn1Raf15s3ULBLcj+ht3zrfUPIW2mSed71xZ5jfDsvlKT4sIcAPxNQ5Hwu
	FsqbJySJmyi8UR8SuWHJIVTsZP/URbfmhjGaTJfOqvWMiqs4ycmBLi5P3LOyhlnJ1xHSrjtzzW6
	KEf/HIuBcFD2T/a/8J9r8J6ZxOX7Z0gGb407c74mvC0YhmTo5DopecLQr1FkXYn6XCFSJdIhSpM
	DKN7xSz8HSnTXEsiVJL2Bd2wdBRg==
X-Received: by 2002:a05:6000:1863:b0:437:69c0:9619 with SMTP id ffacd0b85a97d-43769c098a6mr8254656f8f.29.1770659856735;
        Mon, 09 Feb 2026 09:57:36 -0800 (PST)
Received: from sarah-VirtualBox.Dlink ([147.234.64.33])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-436296bd4desm28539873f8f.18.2026.02.09.09.57.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 09:57:36 -0800 (PST)
From: Sarah Gershuni <sarah556726@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com,
	sarah556726@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: rtw_io: resolve all checkpatch warnings
Date: Mon,  9 Feb 2026 19:55:30 +0200
Message-ID: <20260209175530.3597-1-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Resolve all checkpatch.pl warnings in rtw_io.c.
This includes removing redundant parentheses, fixing overly long lines,
and adjusting blank lines. The file is now checkpatch-clean.
No functional changes.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..b375c1a67a0d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -29,7 +29,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read8 = pintfhdl->io_ops._read8;
@@ -41,7 +41,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read16 = pintfhdl->io_ops._read16;
@@ -53,20 +53,19 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
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
 
@@ -76,11 +75,12 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
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
 
@@ -89,11 +89,12 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
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
 
@@ -108,14 +109,15 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
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
+		     void (*set_intf_ops)(struct adapter *padapter, struct _io_ops *pops))
 {
 	struct io_priv *piopriv = &padapter->iopriv;
 	struct intf_hdl *pintf = &piopriv->intf;
@@ -133,7 +135,8 @@ int rtw_init_io_priv(struct adapter *padapter, void (*set_intf_ops)(struct adapt
 }
 
 /*
- * Increase and check if the continual_io_error of this @param dvobjprive is larger than MAX_CONTINUAL_IO_ERR
+ * Increase and check if the continual_io_error of this @param dvobjprive is
+ * larger than MAX_CONTINUAL_IO_ERR
  * @return true:
  * @return false:
  */
-- 
2.43.0

