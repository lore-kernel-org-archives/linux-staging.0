Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C603DFC98
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144823; cv=none; b=B0LCCqJrQHNaYMNN9SgwAN74drH0S7Tby4SMjtVjXt2SToFsq2ZQyUQS5UZrGFeEYsCZtfB2MFSWKjCsYizK+iWEM9l2vluELQHTqA9YmVlEXTdZshvS3bhKWiJPuHeBNYjOow1UpmosdDwUNJCvdICLPBAvPWGB6n+3jIAE6SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144823; c=relaxed/simple;
	bh=9jabMCL5JWKYyj6LIgJDd2Za2C3GTdAbzDX2qUY61NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Vhn41O2Jyio+A2MoaIUwmlCQ1KLQRGAAQ2jTKDokBs2jtl5X0M2cOW2LkGSD0NwBz0KkJ6Bh0sFyEKbI1CoDqNJNHOPUGwp+0Fd/JQ5gQ7haIYwQk+IaNbL+gib5bW3wyLBjreXn0qe6GwvoVttT/0PbVjafk+lfUQawMsfZDgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wk8sVopN; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wk8sVopN"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-7986e538decso10734017b3.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 08:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144821; x=1775749621; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIwhVG5h20JWibEb62lRfumFmtrdqxrBHw/Lpye2sjg=;
        b=Wk8sVopNbQGKtZvCPXACGs1HmG8tj01a+yGHWsGJsfNiOUM0V/XXp9VPhNcoe9C3cZ
         /6qJ95iSh61az9AH8i/MnhkeZb4X2lQ/GZ4lYR/o38x6/x8EY/i8YzP7qRRn+q+BzyxQ
         j4iiv4EoLpr21LFYSdgF1PuB/x2ZOzsaizJdNiJnFqdVKMQrPW81oyaZjirI7aH3mLmd
         2Kvc7319aOu8sFsp1PhZCW6W3LDcbtLlU3zIdb3+9xdPrl7XeJx20tQgrkpRwROa3+ry
         jn57Du+FQtwGpAQlJHrGwLCppCvfv0359Now1OeP5Q4GvfrYweMmlMYQL1vXc9C9BOGb
         1wPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144821; x=1775749621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IIwhVG5h20JWibEb62lRfumFmtrdqxrBHw/Lpye2sjg=;
        b=kQxBhMWMrv51gix0Mdnb3DXFP+Lg/j+TBx0+UmaVKME+SG1CMBR1gcqqsXXtCAS44M
         VZl9F4VTa7ICwU0sLInG6f78Y7yoH8U70P3skouYmA5zO87jQvVvaAluozNyxxilsk+m
         In4oUGtCNgDAIyqEfnwL2PmrIfMU4rMWB2jQEwURvaN6obDVEvUfmOebqLLBK/yS2dQ5
         bTl2wFCoGnZajunnFUe5ezqBMFEyXjDT9sTIfGCI4e4MtH3tY4lXBJP3yj5ktm6H5nMk
         pEcn/KjpDnGYt50/CHjgUOt1FMXkf/jbaqahqS6kiyGCoGHWOylGjHg0KqHkJ8r6m0aY
         vhUA==
X-Gm-Message-State: AOJu0YxqqWSz1Jt6E6RTMwrxLXtkumcN52uIPTHq1r02marYO7lelaXD
	0sHvJiXU1CDRTdhIcjBbb73QCw/OKQ7R/nh9Af8FEM8ASX4vdcg4/Y0c53ro4g==
X-Gm-Gg: AeBDiesNV1qQRwXOCSiN99tq5EYXy8gXPfkt8WJPpbLlHAKPF8600VuMKxIf9sAutiT
	fi6EqdOtQhXCVIA0OZX5oHmJ5XuCK/4YSTixIlkSBNEerKApcSufWjNQk5Hzyu2JAkTmdJbD7v8
	fwyY+8CYcRo3X38Q8zGdIBxubYzKBy9FGwQ6HRVuZXgUib6ZAJN9obxLQZcjwg0177qRZfLjalR
	+aoOuP3/29CZ6qVw27QGJseq29bobmhoUIzgzYmL/1lDlhpXHVu+zu1xmNXBdnQfE/m2x+uByEf
	J627ZicjAKYoDAVYO8Cv8/CrW0IwE/ic2hZNp+TV4L8dtaFtrSjWKIRg9CcPsIAtJC9STgnzp83
	AVCidsyLz7CFS3NtyHMEX+2/ZhAK8Q1PAiAFtnqPbZYLjs1p2YMgDYj/Pt33gdkFrea/ItXodSM
	5vsVjTZosTpDqDVH+o9oLUe3Ka/Ec5/9BUk85qrkdl3d8=
X-Received: by 2002:a05:690c:c4cc:b0:79b:73ca:7ae3 with SMTP id 00721157ae682-7a2133f6d0dmr90130277b3.56.1775144820876;
        Thu, 02 Apr 2026 08:47:00 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370ef3fa5sm11768097b3.42.2026.04.02.08.46.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:47:00 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Thu, 02 Apr 2026 18:45:51 +0300
Subject: [PATCH 2/2] staging: rtl8723bs: replace tabs used as separators
 with spaces
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-cleanup_rtw_io-v1-2-874b9747de6b@gmail.com>
References: <20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com>
In-Reply-To: <20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144815; l=3031;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=9jabMCL5JWKYyj6LIgJDd2Za2C3GTdAbzDX2qUY61NU=;
 b=Ajg6TFkdweksS0ToIMdiP24NnqAzUenDtInjnoMqeUNN2/FbIvY2HAbbmH/r0/P2A93KJs7YF
 er4b5EjhKiCDCUMusHvVTzgKq6VRAGYjMaCK07r3B/Rp29tPWB/xfir
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Replace tabs in variable initialization lines with spaces to make code
more consistent.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index ff16027ee129..c793ae7ea5c4 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -28,7 +28,7 @@
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read8 = pintfhdl->io_ops._read8;
@@ -39,7 +39,7 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read16 = pintfhdl->io_ops._read16;
@@ -50,7 +50,7 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
 
 	_read32 = pintfhdl->io_ops._read32;
@@ -61,7 +61,7 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
 	int ret;
 
@@ -75,7 +75,7 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
 	int ret;
 
@@ -88,7 +88,7 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);
 	int ret;
 
@@ -103,7 +103,7 @@ u32 rtw_write_port(struct adapter *adapter, u32 addr, u32 cnt, u8 *pmem)
 {
 	u32 (*_write_port)(struct intf_hdl *pintfhdl, u32 addr, u32 cnt, u8 *pmem);
 	struct io_priv *pio_priv = &adapter->iopriv;
-	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
+	struct intf_hdl *pintfhdl = &pio_priv->intf;
 
 	_write_port = pintfhdl->io_ops._write_port;
 

-- 
2.53.0

