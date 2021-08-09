Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C5870
	for <linux-staging@lists.linux.dev>; Mon,  9 Aug 2021 16:50:58 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id m12so22303665wru.12
        for <linux-staging@lists.linux.dev>; Mon, 09 Aug 2021 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NyiIplakq4MSvNabcXva5WLk0bCoGGYQJOMtAI5jTQE=;
        b=Tq1l00RmDef4Wx3z1rbBvWxxMsQV403ptPKldnurrHM6BhvPloLHSPvSrv7MbNTYZ3
         Tzg3i4V9PsAP27mmIt84sH5+QrFWnz93xB3ZCWF91cBUXC9396nB3fxpPiZfI3bYehD1
         PpHNWDaQnMQTER1D483kB8Ab3qxVk0lhr937dqgW3NTrge+1Cge7ZRZXVRJVj5iQ3LxL
         JHLVoMFyTEeMDBQcVuX3s1ApEREHAnck3RHhM/b6jyqsa0EtauNjpbpR9x5sbxteAfAj
         SXmM8xtJWR16jl1G1u2OyB4QPnGrNRfw/u60tMFJF5F/h+EAKGQtxGchy31NNmoWDEP4
         zbFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NyiIplakq4MSvNabcXva5WLk0bCoGGYQJOMtAI5jTQE=;
        b=cwp6nw2aRKK7fDQCMf2pCtAasSHHRtidoiURSvKgy/aifs2rGgG0zJvFLiQyN5sBGi
         QNJcRCSUapTTcYVPrwX30h/LbBF34Ms9pKWlPkwlqTAp7p85XGHt32vogbKH6Kl+4P3a
         RZW6Azw6q7vj8IQecGJu2gwDGipeRFw6pEy69uWA7bmL7Eg9O2g0FB7Kethc5lmQrIU5
         dgquVYLcYXjkucjqZZ9Cfz4dfnwuOBMeYDa/mvHiAtTL10KTjDLq8+v4qF2oIvzkSYPr
         9+VQjil0u2BFJTRq7boAqW3fqIxsfXbHCcs3N+yhh9fJzyZ/7o9OPMOJuHp7ElTEyqdJ
         D8OQ==
X-Gm-Message-State: AOAM530QOVV+dpSio3MwFpfI8n1mISk9YnDjEV8yIth5Xr1yWSYdTaYG
	p67bjjKCHjYJKKh63IkNRLY=
X-Google-Smtp-Source: ABdhPJzgMLD9vkTkpg1UPo9afHNG10+QVQnJB8aUu8FPOctt/5CW9AIcfUcZ1XOtPFCq4YPBIL0fuA==
X-Received: by 2002:adf:f141:: with SMTP id y1mr12016551wro.173.1628527857282;
        Mon, 09 Aug 2021 09:50:57 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::996b])
        by smtp.gmail.com with ESMTPSA id q5sm20484469wrx.33.2021.08.09.09.50.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 09:50:57 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 14/17] staging: r8188eu: remove unnecessary parentheses in core/rtw_io.c
Date: Mon,  9 Aug 2021 18:50:04 +0200
Message-Id: <20210809165007.23204-15-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210809165007.23204-1-straube.linux@gmail.com>
References: <20210809165007.23204-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary parentheses in core/rtw_io.c reported by
checkpatch.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_io.c | 32 +++++++++++++--------------
 1 file changed, 16 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_io.c b/drivers/staging/r8188eu/core/rtw_io.c
index 2a47329d90e8..b5cd9bbc1ce1 100644
--- a/drivers/staging/r8188eu/core/rtw_io.c
+++ b/drivers/staging/r8188eu/core/rtw_io.c
@@ -38,7 +38,7 @@ u8 _rtw_read8(struct adapter *adapter, u32 addr)
 {
 	u8 r_val;
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl *pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl *pintfhdl = &pio_priv->intf;
 	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
 
 
@@ -52,7 +52,7 @@ u16 _rtw_read16(struct adapter *adapter, u32 addr)
 {
 	u16 r_val;
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read16 = pintfhdl->io_ops._read16;
@@ -66,7 +66,7 @@ u32 _rtw_read32(struct adapter *adapter, u32 addr)
 {
 	u32 r_val;
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u32	(*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read32 = pintfhdl->io_ops._read32;
@@ -79,7 +79,7 @@ u32 _rtw_read32(struct adapter *adapter, u32 addr)
 int _rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 	int ret;
 
@@ -94,7 +94,7 @@ int _rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 int _rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 	int ret;
 
@@ -108,7 +108,7 @@ int _rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 int _rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 	int ret;
 
@@ -123,7 +123,7 @@ int _rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl *pintfhdl = (struct intf_hdl *)(&(pio_priv->intf));
+	struct	intf_hdl *pintfhdl = (struct intf_hdl *)(&pio_priv->intf);
 	int (*_writeN)(struct intf_hdl *pintfhdl, u32 addr, u32 length, u8 *pdata);
 	int ret;
 
@@ -137,7 +137,7 @@ int _rtw_writeN(struct adapter *adapter, u32 addr, u32 length, u8 *pdata)
 int _rtw_write8_async(struct adapter *adapter, u32 addr, u8 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write8_async)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 	int ret;
 
@@ -152,7 +152,7 @@ int _rtw_write8_async(struct adapter *adapter, u32 addr, u8 val)
 int _rtw_write16_async(struct adapter *adapter, u32 addr, u16 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write16_async)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 	int ret;
 
@@ -165,7 +165,7 @@ int _rtw_write16_async(struct adapter *adapter, u32 addr, u16 val)
 int _rtw_write32_async(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write32_async)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 	int ret;
 
@@ -179,7 +179,7 @@ void _rtw_read_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	void (*_read_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 
 
 	if (adapter->bDriverStopped || adapter->bSurpriseRemoved)
@@ -193,7 +193,7 @@ void _rtw_write_mem(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	void (*_write_mem)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 
 
 
@@ -208,7 +208,7 @@ void _rtw_read_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	u32 (*_read_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 
 
 
@@ -226,7 +226,7 @@ void _rtw_read_port_cancel(struct adapter *adapter)
 {
 	void (*_read_port_cancel)(struct intf_hdl *pintfhdl);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &(pio_priv->intf);
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 
 	_read_port_cancel = pintfhdl->io_ops._read_port_cancel;
 
@@ -238,7 +238,7 @@ u32 _rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &(pio_priv->intf);
+	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u32 ret = _SUCCESS;
 
 
@@ -273,7 +273,7 @@ void _rtw_write_port_cancel(struct adapter *adapter)
 {
 	void (*_write_port_cancel)(struct intf_hdl *pintfhdl);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct intf_hdl *pintfhdl = &(pio_priv->intf);
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 
 	_write_port_cancel = pintfhdl->io_ops._write_port_cancel;
 
-- 
2.32.0

