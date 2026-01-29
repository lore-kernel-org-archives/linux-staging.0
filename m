Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 418C930AACA
	for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 22:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769725348; cv=none; b=UiGAvlH8LCTx5UB3bd1PznHpnZiGfOSXYFbaMwyNfg1XgM6PPU4Q2Alpu2ijXKxA+rymACLUOELyg1OSQHqJDOUSglo7rUWc05y413JYqmmjipeXPay88569fSeDsagel8JR6WsyqvjcMd3FPj4ZNNgT15KbLWSnyr1pTocUpgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769725348; c=relaxed/simple;
	bh=iyQv9izzGMWsKIRJ2SvvELwWDIi3j/EAUmZ5I3T0J0g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aORNRAYDFsQuxVulf520yEaT9XDPBKSqRYJes7O+xwrMYMo64bvtALyZRkWnSco4n5m36XHJ6g0RJT3X1o1XKjQWXFzBXPDU7HAJRMieqIu8j5cCr72Xqd9Wp8aDqugQjz62dXxTke1YKwvCtiieJw9fI7qT3GxagbnGUJEbLWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c6EKNeW0; arc=none smtp.client-ip=209.85.216.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c6EKNeW0"
Received: by mail-pj1-f66.google.com with SMTP id 98e67ed59e1d1-350fe1f8ea3so633500a91.2
        for <linux-staging@lists.linux.dev>; Thu, 29 Jan 2026 14:22:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769725346; x=1770330146; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sTWQSrFOGB30wA8jRfnyTrMBqXR3RRewBAfVA+DPWEg=;
        b=c6EKNeW0L7QbKa1IkvcKQ8xAob+Zfm+cBNQPb00NuBqW/tRmza29fZJWkvdXxEh5nQ
         3j72FjdYbW0Ag1jRCrsHz7+JTqZ+RYq03n2jNOvPhJ1EmBvCMtSsYdXeaACAYK86IU8g
         OuWeB5fcWb8/yGeopCzea2f2IGpdTSV6epj9thOJ5GKxzDGvnbXOSoMiBPtZqlhumrpr
         fSMfj0i4SJMeqNLmwb+LIoNJCpTkQKF5UdiRtlJSeR+bLRQwPFRjcKKQcStaE8i0x8zk
         kOSgzuakWlS1mM8sxQLjL+GE+m21e1dY4lXk4qLxQNiluibPNVvOG02zlVkYNxQ4dnaN
         QJWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769725346; x=1770330146;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sTWQSrFOGB30wA8jRfnyTrMBqXR3RRewBAfVA+DPWEg=;
        b=wH/yIsgokTWBBNX+UTQh8wm5kF6bZ46Glx2GIEMc1juHAixCxetY3WsJ0B6wUDMPbp
         RLiR7PfoDHMyTaizj9lZrTfrvmgJ26JW5vPdkpNYSNJlmMkYVVqwa44fL2M6YXaK3yBY
         JRrY2Tn4uAbDmrvZtkYU2z5UBy/9CYZnTQNLwOHH6560I1ujQBfjSjTe6Y6gDguPwkz5
         vQFMEbUVJUAAM7tGLv0JQ0REd2ixk9dKQKvtyXpDOl1XER+IXyT3UlZXLhAHllO2AKvB
         3+lRbyrTCvDVilNHnvuLhM1YqRLuNHl80mAcrEG/dqPivag2GmXS47NWuILGCkLvafhb
         QavQ==
X-Forwarded-Encrypted: i=1; AJvYcCXoRaOlfre6groZdASQ/TW684+1GA0rM0I3g6NUtcf2g7lNTgzQUOAPsaSSpXKckS49+wxEN7DGKCXT9D4N@lists.linux.dev
X-Gm-Message-State: AOJu0YzY1rVfQY3FnyWaJVXakOYnZ2mawXTjZumWb1nRkruY9BPhDCzZ
	dy6HqHIiTrC9mVKYSBQ0cKeGxTBWde1GR5dSAEgmF4zfRMIiUK9oxp+pzVEgHfPm0CRPBw==
X-Gm-Gg: AZuq6aJ/JGod351y0AJfJjV6exb3Kw5qSEzxl1e6vFUDAouAXMzIyvH0/Z7mlq6zznt
	mdAVpiBfeq5rq5lUjiNQaTNWS1YaUeHk+Y4TXoGiURTUbcpy4WNs1w0sFROS2lvVa/BwIvFeHB7
	fJ+CegSYvaPFrDOz0rz34bS3DUROqhJeNXyxwkS7k15HEiz49M3DFHqbBEHeqkSrhEkgzuit5aN
	Cia1arRVdJHV9QHoXj7cAkYInv7vDRWuMjlEX69UwwPiKHBD58XPBLlYOCeza91hXWE+LWUDuCL
	3lJ/pFZyKEJ0KF2stG9NcKbkzZ9fYAQRUz+pS/2goB8YrIe4nemCdscbvZxEZoy6dB50B8/gL0B
	RQDuprXeq8UPPP0lzyXRNy190atwNs16rgOz0iqhF1afRoSXA1ib6BJVPqFOnhH79zhxsmK2Zfe
	+qA9HbchA=
X-Received: by 2002:a17:90b:3b46:b0:34a:b8e0:dd64 with SMTP id 98e67ed59e1d1-3543b31393cmr933157a91.1.1769725346481;
        Thu, 29 Jan 2026 14:22:26 -0800 (PST)
Received: from Horstaufmental ([159.192.34.233])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3543d52c396sm97438a91.4.2026.01.29.14.22.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jan 2026 14:22:26 -0800 (PST)
From: Siwanan Bungtong <horstaufmental@gmail.com>
To: gregkh@linuxfoundation.org
Cc: arthur.stupa@gmail.com,
	dan.carpenter@linaro.org,
	linux-staging@lists.linux.dev,
	Siwanan Bungtong <horstaufmental@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary parentheses
Date: Fri, 30 Jan 2026 05:17:19 +0700
Message-ID: <20260129221719.943285-1-horstaufmental@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses around 'address of' expressions
to comply with kernel coding style.

Signed-off-by: Siwanan Bungtong <horstaufmental@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index fe9f94001eed..7bc09a50d4dd 100644
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
@@ -53,7 +53,7 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read32 = pintfhdl->io_ops._read32;
@@ -66,7 +66,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 	int ret;
 
@@ -80,7 +80,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 	int ret;
 
@@ -93,7 +93,7 @@ int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 	int ret;
 
@@ -108,7 +108,7 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 
 	_write_port = pintfhdl->io_ops._write_port;
 
-- 
2.52.0

