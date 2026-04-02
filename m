Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F10183DFC98
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 15:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775144821; cv=none; b=BlNPIhV/n1gJliM0P1N5xiMYXl0nJpz4iBMz069h1LDjsOEOPZ3cFgAcZCy3Ec6Vbf+BXjpvnRiVweiXz7MHQBjO59neNrSA8+HvFrMVOewUWPGnl4BOe6ulkLt0YQTzrFKBeiGPo5SbwVQBqG3zQPHTCTAS02Jq+px7GczXRH0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775144821; c=relaxed/simple;
	bh=PyAQGXbvthsP8MV3AW4kYz64b7KWFKysrDWrGa/tTjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BCtMsLc2CiyqAuVscNrqhuLE3bz0EK25QJ9Ju8K3YHOx/5SQq5BCKBlMZlEL/gNm7qN/52Zb+Y1yxleu1V0cYGqT51Z8Z3IRnGJkYdb9aV4v8UhauFr2+m0+trwvc2Op8bjsfvWDRcDkpMLFyR7UiI9yRUr8nhJUuLLnT3vPOc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rbNO84Ls; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rbNO84Ls"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6501e465a8eso1172039d50.1
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 08:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144819; x=1775749619; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbKKG4hJM1CuAV3VkhDnfcVyY36d0N0abiWE58/EJEY=;
        b=rbNO84Ls9pNSGs5nwg0KAqzHhqjPbG7B6WrZANjZ/aD9Rp4P49gNxfbRxObVpoWSk5
         aIRorRneF8de6jE2YMgjR2nQYWVCf3KAiVoBe4XJ1D07e89iMmKSiWyY5BE5wXTAkrNi
         4isLqtfh+C1h/9jxHsZRbD4nnbgdX5/1U9LzmPYRqbzyWlDGoR7VwGieTVTsPU6etZPn
         JA01/ZS/siXdQyQrMkQ35lm+VTC5TFZWGn9aeHnp3flScm+BMkYwtwomk2EJVi0cN3mj
         lYlRGKpc9tb5oTjan6C29gbSRLjkxT0VO/eMlig0YImttL1LuZcNdneHNUv4+Z77GDNk
         r2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144819; x=1775749619;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbKKG4hJM1CuAV3VkhDnfcVyY36d0N0abiWE58/EJEY=;
        b=Ldb7+0deMlxE15BfRBaQGR/E2tMmQ9hNiXEc0a36v7RW3eEQccmMXg2K+jejhAcVQq
         6KLjZrwGEKOfehGUULl1pZmVyciWm1Od4q04VMijEEvUb3Uq05BnycGCfUCJfuKhQ+wL
         iOMpdJLGE9LEPpP05jRdlji6eFmaf6jQ7M+SCadUMyV9Z/0p1ll/Y2OP8fLyd3sNfXFI
         96t3RCJdwNdAIp1XpZb1S4rcBuvslWDo6G6FGp4mai5JQvy6gexakm//SB6bPs+aYf0L
         OB8skSaxM8fsEsQCmajLTH3fVu/bIFr6J5Cg4IdgARh6ReGflLqHcZjbRm/ve3BiIMRB
         ecow==
X-Gm-Message-State: AOJu0Yz280ZWBsK+3nwYw6whQ80k9hGWEbFs6DWs1E/9Neo0f+l24Bxh
	IbOd4YN598p0OQpp+pcOQV+WIcay+ywVRAlAplxKrtOS4W5dlLKq8uGJ
X-Gm-Gg: AeBDievy5XEoKOR5rpgJlTlnHAZveuEZ9OCUPIrmfxwRXw+m0GPJQy298qc4sswYiqK
	oOooyo7IsPjWmfH+YKEbe6tEvBpZH3y7cRH0+3aLDFIFLC1IvB/A7SvWEUJf3OepUnCImURIPMH
	axDe6hUqFeO4v8sY2HYquO/1ffeFYsfCXCNc/lzRJuD9OnVbjFn7R/O94Y+J+PUX1AfnBtjZ/GQ
	uRq/4t/OrzeRYda8y5Q7+KG02JkpSO4KztDD8/5iLShQCJKPnIGSD9Lk3+DAjn6LzRjOZmwxPsW
	brTKPZePqBHJEwHVeOOvggYj/CxvLKfU65e73/7bFShpktXtARNVyVrvn52+Gs8KcDR8Jt5Sptt
	4YbHivKLIXnTxI5HE94zKG2IOQw62Bk1ez3LarE9pSoWtTuCQvQyjNwzM3HGgjShRAD75Fy+dRZ
	fZea6Kib7TEkrXAZEa+aQlTBlVvA7nzfTg
X-Received: by 2002:a05:690e:c43:b0:650:1a14:b2fd with SMTP id 956f58d0204a3-6503d73c935mr2262177d50.4.1775144818864;
        Thu, 02 Apr 2026 08:46:58 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370ef3fa5sm11768097b3.42.2026.04.02.08.46.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:46:58 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Thu, 02 Apr 2026 18:45:50 +0300
Subject: [PATCH 1/2] staging: rtl8723bs: remove dead code in rtw_io.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-cleanup_rtw_io-v1-1-874b9747de6b@gmail.com>
References: <20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com>
In-Reply-To: <20260402-cleanup_rtw_io-v1-0-874b9747de6b@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144815; l=2639;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=PyAQGXbvthsP8MV3AW4kYz64b7KWFKysrDWrGa/tTjI=;
 b=6DnKOalDAaX8Um2cxs5E/aVCkOthcsZ5YSdawk5d7LA7MZsUhpUxiNdnpkdA4IAcEkyP8WFHh
 mZiQGqSiscnA9orladkAN5as+AmGoj8X2mlUDiA1ges75v75rgiBZ1c
X-Developer-Key: i=nikolayof23@gmail.com; a=ed25519;
 pk=2GWUU1isl5NJpkwSCQ4OG80EinZ3EUZXlrgAg6Pz5zI=

Remove the commented variable declarations as they are not used
anywhere.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_io.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_io.c b/drivers/staging/rtl8723bs/core/rtw_io.c
index 53ba99e1de00..ff16027ee129 100644
--- a/drivers/staging/rtl8723bs/core/rtw_io.c
+++ b/drivers/staging/rtl8723bs/core/rtw_io.c
@@ -27,7 +27,6 @@
 
 u8 rtw_read8(struct adapter *adapter, u32 addr)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u8 (*_read8)(struct intf_hdl *pintfhdl, u32 addr);
@@ -39,7 +38,6 @@ u8 rtw_read8(struct adapter *adapter, u32 addr)
 
 u16 rtw_read16(struct adapter *adapter, u32 addr)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u16 (*_read16)(struct intf_hdl *pintfhdl, u32 addr);
@@ -51,7 +49,6 @@ u16 rtw_read16(struct adapter *adapter, u32 addr)
 
 u32 rtw_read32(struct adapter *adapter, u32 addr)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	u32 (*_read32)(struct intf_hdl *pintfhdl, u32 addr);
@@ -63,7 +60,6 @@ u32 rtw_read32(struct adapter *adapter, u32 addr)
 
 int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write8)(struct intf_hdl *pintfhdl, u32 addr, u8 val);
@@ -78,7 +74,6 @@ int rtw_write8(struct adapter *adapter, u32 addr, u8 val)
 
 int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write16)(struct intf_hdl *pintfhdl, u32 addr, u16 val);
@@ -92,7 +87,6 @@ int rtw_write16(struct adapter *adapter, u32 addr, u16 val)
 
 int rtw_write32(struct adapter *adapter, u32 addr, u32 val)
 {
-	/* struct	io_queue	*pio_queue = (struct io_queue *)adapter->pio_queue; */
 	struct io_priv *pio_priv = &adapter->iopriv;
 	struct	intf_hdl		*pintfhdl = &pio_priv->intf;
 	int (*_write32)(struct intf_hdl *pintfhdl, u32 addr, u32 val);

-- 
2.53.0

