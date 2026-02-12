Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBA0158535
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 08:29:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770884955; cv=none; b=WvY9UHhte4Qm7wUDFvq2G3WPjgiJroAPFaC/EPK9d56O7NJqHJUX6QU/QXc0vzzO4+fMVKgX/cA3MSS86H6zgjY4+dYcMXf9vglbYZSwfAzWGdD6G+sPlANJqoznb7vCX2cBgL9aRJatVi0e6D4Muibl19qqwDEilwF7YkKcG/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770884955; c=relaxed/simple;
	bh=vhT1G1GAVqAHw1WxipoADml0XpFurMmBRKGfvoF6rjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TGBnko/WIH03dkJBYgtZpU7WrNR/fyzpZ26skjLMGWn6f4mBlslaKJnKid5O/7K6/CJIk6yLwV5GSHQNcY6pq6uCliL69oK++IiNUkyf5gUp2TnvQaLDtLvNiLNZRmnIt9RMzyWIAnclmw6P6tj5NOjo46gaDsp4TgP+CL148xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9hS8zum; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9hS8zum"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so78438385e9.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 00:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770884951; x=1771489751; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zjU1aoGYCkNZPphUC+JIh2H1iCSNxzKXoo0QDvq/Q/0=;
        b=L9hS8zumGLnJZTAwUjDhO8gmiShJot0FxIJh94v/WTRa5f2D5PVM7LQIV/21+bZoiD
         zk1caaQ+qnxv6uyN3E0u04VwiaKemk5NqBZHyxpwzOUHHx+0JkpppGMkiGRqjCTiWkoj
         foghhzfP53t5oLUNKlgkdcPntSGKDFPtVz1EqpbxhdXfFLkuWq8mECElyiJiP4psIAcl
         Yog3leRqf4+FDPeX9kwtTEvN3Yj0AxhlRssK7iEmCvOmqQWUCQZ37eKMX7qvDUtjbizn
         HFvHB2bvxlfFtprNF71ZPciJzl1KNj6Cxnyolxg5/H6WZWIArHjwjMzaf7yAhthO+kVO
         b99A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770884951; x=1771489751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zjU1aoGYCkNZPphUC+JIh2H1iCSNxzKXoo0QDvq/Q/0=;
        b=BagX9oEBvRa3qCXKGVPHrU+fYC9GtzYUNZk1IkhsynJHMwqZewiNouLDd2z5+afY4/
         mg5FJrsOShXB1mYgh4dtaTVuc9OyAeTq7ajFIEiAc2JhD9bYSVViaqsar5QS68rD6pS/
         xH8+oMJ4L0mYkE8Wv3krh69ycdTo4TuTBrdiLNXyosa6aE1EgmavlAe8qXORNzmBceWL
         Pg3j74vM/C88uGE0ndWMoaQ9mjNR7dXd5G+vKFfzcCK8kLRQg3dUbRSH8YuaCwh3jpbJ
         bosAdb3fuZsmryHvV58Phq6XKuzNedRMelQZwkVYcI+/sGej8UPUMOWPqwju+dYXIBN9
         QarA==
X-Gm-Message-State: AOJu0Yy39E1Z2vSMoBOfmg4qxstyy2N/9NrgWUCQGfItAASk82K2i3Wk
	ZR02iVTQUpp7sdTWMy2hdLj57vL6GF+oOdhuovPbiz6aJ1phDNEpSTOzBZVBSA==
X-Gm-Gg: AZuq6aKMLl43+r2L5aKhJB1xkcL9ItqcDh9nXU3SV2pacFegd7tQKsB2jE2EiZz2RnZ
	0QYJf9nLfNeZmurTzCZMLd4wX27Cv2qEV3DauiIroYxoZc8r0nt2DGy/VsvgqXQfVT/M4LaDwn7
	R9VDckAhznoMWNzpOiJjaMNF/j0nuOa8weL3uZ60/LvOOamHZSow0mXpIcuMcAqBUmS/ejWshaS
	cYKdk5jEL/xf/SbedmiEmsPJlf9PYWhE9p0gxxWLIwpY+Uyn9aj/HmFo8scq463NlrKz7FZJ9Wv
	v3Fo8NwqAHFwS8OH8hmDxs2lRfx/TBjSsk6JzCdc5tYMQxhBEVteqBZ/3N9E4+GQpZ331JntyoG
	Y4N9Oz0pON9dr9QL4u7c8xHQZgOuv9Cm0J+qtK/qbQnTiVe9eRDarXSBc3yjmEoQxLmm2Dh6Sdp
	P3cPH3WkH4XjqlchukWqlBwmiJBCCqn2dw1Nkmag==
X-Received: by 2002:a05:600c:3f1b:b0:482:ef72:5787 with SMTP id 5b1f17b1804b1-483656ae605mr23132865e9.1.1770884951023;
        Thu, 12 Feb 2026 00:29:11 -0800 (PST)
Received: from sarah-VirtualBox.Dlink ([147.234.64.33])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4835a627c96sm59341245e9.2.2026.02.12.00.29.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 00:29:10 -0800 (PST)
From: Sarah Gershuni <sarah556726@gmail.com>
To: gregkh@linuxfoundation.org,
	sarah556726@gmail.com,
	dan.carpenter@linaro.org,
	arthur.stupa@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] staging: rtl8723bs: remove unnecessary parentheses in rtw_io.c
Date: Thu, 12 Feb 2026 10:23:56 +0200
Message-ID: <20260212082358.3403-2-sarah556726@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260212082358.3403-1-sarah556726@gmail.com>
References: <20260212082358.3403-1-sarah556726@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove redundant parentheses around structure member
address expressions reported by checkpatch.pl:

  CHECK: Unnecessary parentheses around pio_priv->intf

Seven instances were updated.

Signed-off-by: Sarah Gershuni <sarah556726@gmail.com>
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
2.43.0

