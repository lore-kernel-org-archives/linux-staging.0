Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818103F0746
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147057; cv=none; b=gsxJkrhQWnQtCnCzHqTy28leddheMpQgsc0lQS7HeY4E3OKnPGqJXHF8OFty5wo+FEViM+nO3aayx1VJdaW+1XQ2JjUKxeQaZhIn44kMm0GlrtWSGq/qYIaQe4eImxijDPcpjTYSnTNuJN51joAgxhAvdBeirPAPfrTjpHuMYfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147057; c=relaxed/simple;
	bh=9jabMCL5JWKYyj6LIgJDd2Za2C3GTdAbzDX2qUY61NU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FxFJ9GN1ahbLvMw6vNwDdrT34XTP9zZ1EbUArxKP45TY/4yKTWoyCVYiRT6SVIl3lGJGzvrhCFSzh5L0zkqIWp2V7dbMBKKisThm/AojFOd7rRp04L62GCiQE75jgfbgVSCMJnGKZbjw/yVhyjomX/f7FP3wYAPAi5Vfz68XHg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fs3nGfmu; arc=none smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fs3nGfmu"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-650182d19e0so1276695d50.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 09:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775147054; x=1775751854; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IIwhVG5h20JWibEb62lRfumFmtrdqxrBHw/Lpye2sjg=;
        b=fs3nGfmuWD8pDlDKsKE5dZm5qk2/nAym9ApN7aXUeyrEIHOchEizaTC4BphpgqpNAm
         Jed1XGqFEan4kxd+Ql25fC3gqMymv/oOXz/5L9vqytQ+kgcOh+L6DaDFpjWjlIKcrDjv
         zfBzObSKGJC9igF/7VM1SXMBEu24UtDYLMOuDp+yMUXGgVxkM3NVdZ3EufZxgjaixX/m
         iX5ErXATfoMC1BzKapBizL7NnGqsnyYIhm0yfbCcn7zA5qUlm++eXXfrBCoSePpKiD//
         1l8vdLI/sD8u2zIOeMPb273BU8iYRJTqNcVBVvF7V64lcl/9IZVldz0RCFgdvpYCIiaK
         swIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775147054; x=1775751854;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IIwhVG5h20JWibEb62lRfumFmtrdqxrBHw/Lpye2sjg=;
        b=dflId5mcy/iKB1vVBpPbIVId5bPu5iKRfFySt5h5YGhCqza7hejYwcN3sULi6oRydo
         A7oYUhNA1x2DwBg88k1U7RUdMipsrn4dqxX+eWUjWn4XoksqLptW1LfsSA1OGhrynaY6
         GUY6pxuzHtbT9vkQjo5zCblcrqybE7/k51x4RtUWH2znWZLhmpVI34maAcVWsb5X8edn
         cXLhlwv+e4N9AkSI/W0p9X2/GFYb8YvgLCCHWoH5MKB+KnibhGKsWcBSxCuFKHqJL2cY
         IFoIlAkhX6SgwyVcotsKMBNcRVX11oO/30B4Qwu0OmpoXuel3W5S84UzUFEWF8NowKoU
         +I7w==
X-Gm-Message-State: AOJu0YwrpiOOYM39gNN2epQey++Zsv57GKUdFZQGfZAzTjN9oqnSEiZ6
	H918ikHxxsbxY5kGa5TVhRvPqiN542vuSDTrhvp2eQPV/j0A2ZoEwe7h
X-Gm-Gg: AeBDieu0hRNoBtoht9GkrWYvLzvEOjbvQWF4jeSXS1OuGsFsfQghseERkWmeVKU7ACY
	fxNBwfWJk7tk2vhMWAe7gLzsgo3IAugR/7gRD1SK9HzmzQh+Vy/pXpK64IZ3QK9BRlYUy2dyT/9
	iEdla0wGsFP+FxqLYUNQUtGixt+tXmnUNkFbQvwdwXJjwT92x/NDxnocVRtjL+1+3IW/8/EEiHn
	3EWcY29kZEcwJvIefrVcN+kxMX9Bd6SuCf4Q0ukGa8EH7nWGUs4VaoFo1RRozn4dkErahEs4rHG
	sOKKemQNHpzKIt7W7Ym12zFclw/RzJ4ueDfhnWGkt3dUGvS5obEvz3Aj0tV2ua5Uha8R9l2Jmzj
	8IJTRJ0YpAroi6ZeNE8nLkfgUJQ8La6ssZ75pb4wEqhrYkK93WEKPSaDCzPekS9EGmcZm6Ikh70
	QPYGz47CYHKDzGBc9DkTCw2BOOP8D5YbsUJ51wHZhbfQg=
X-Received: by 2002:a05:690c:9201:b0:79d:81a:1f86 with SMTP id 00721157ae682-7a21214be50mr74165417b3.31.1775147054574;
        Thu, 02 Apr 2026 09:24:14 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ed2bb47sm12909577b3.21.2026.04.02.09.24.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:24:14 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Thu, 02 Apr 2026 19:23:18 +0300
Subject: [PATCH v2 2/2] staging: rtl8723bs: replace tabs used as separators
 with spaces
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-cleanup_rtw_io-v2-2-8d12ef658e18@gmail.com>
References: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
In-Reply-To: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775147048; l=3031;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=9jabMCL5JWKYyj6LIgJDd2Za2C3GTdAbzDX2qUY61NU=;
 b=90PUb+oIHYweGHPubYiYKzpB1INqNv+C/qy9gRGILLh0GxWfBKjjBjRnCil1Xo/gNYi6fQ6vr
 zgGwEFgknaeB+tQ0AcNULZ28FM2MB4dL3pplbeyfq40fLYWt9d8TVW0
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

