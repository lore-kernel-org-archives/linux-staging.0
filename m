Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71FE525392A
	for <linux-staging@lists.linux.dev>; Thu,  2 Apr 2026 16:24:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775147054; cv=none; b=m/UyhdlaCqz3+vno2KoKxWTiSjo6szHlL1CBE3hKjx1F5bqUqTDNp77imXOa9UWOTt14jONpOTIggJ3JOiqUrd3p6L6vZwW2ogreFZ6e6mrowmYp9Zc00BdF3cblt+5dEGropU8kkj0t97WYGjFPE5YhX2MHu5OwRu2CqJ/k1As=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775147054; c=relaxed/simple;
	bh=PyAQGXbvthsP8MV3AW4kYz64b7KWFKysrDWrGa/tTjI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sBnexGwW8pBK5rYXfbfkWWf5kMJCVwW647GGOMoNlqkFWildo9kM84Xryj2Py+XflAHtsKiIiHQM0Ci2/k/xT4qAx+4AT4To/oF5nevS9TOBVCIcYFbxdQ+PLk8ANN/TGqXvMlMlnwTe2CuQZiR3sPeSRtiwBFusvEJL6pp08VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dmD5gFQB; arc=none smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dmD5gFQB"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79f855b2575so11148117b3.2
        for <linux-staging@lists.linux.dev>; Thu, 02 Apr 2026 09:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775147052; x=1775751852; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BbKKG4hJM1CuAV3VkhDnfcVyY36d0N0abiWE58/EJEY=;
        b=dmD5gFQBquwR3B6syuwFHTRjzlEFgCK/wloivtYNZQ0wn7/1lLLVn37AVbqmkf8qA5
         X1nZnmenA2r1lbQCVkUj5TreUjgq2rUA/ZAQtpRgiW0vsT3FQl7LrvVYE6zOxmrtY9bs
         tj1qc9KJV4lqurkxe/dRwggLLxPjWFiAK4i8v8yygki3LRxUEKC3ci03F6TdhltZ2AL5
         G7tgT6pvB49KsiBWf76/IbWKWtwjlLkN22MAMCECgXwF2qi4HZ0Vgd69+UIe1ymsGKru
         2RKBRPytiuC+qJieNzDYR+DsPmITgb6bGPFdBILFvlJHSUK00ui7omHYBpZOWHyljDPk
         0M8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775147052; x=1775751852;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BbKKG4hJM1CuAV3VkhDnfcVyY36d0N0abiWE58/EJEY=;
        b=dZMUvv9asrvl+bwE15nxO7JkWmc+PQdGeYz9yq8ecStK+Dm4nYam+Aa+hiKtcNY69p
         q2ECgqSkQQ/OBRGxx0LRz2ZINRtLKx0PHA/8IJJVaPCcxYZS4qfH2uP/G1TU/ym1+2MK
         XbxkaZn029aE5yjGB8WnaWA9IKAAb1GxGS2h2EBxC+GLU91FOiSvo09WroRtQExBO2Bg
         3eLg4TZuENtCFM/5i3+15bBYxXrpH0jXuqtU3HIiTsLbDdLOk0i8Yqnn7T4lQc+5kZKX
         9ERo6nVDUA65AoTVMh/voa/jZd7TLrfRz0NvEUdQpbNmdb+o26zgfoIdt07Kxz2K/08z
         TRsw==
X-Gm-Message-State: AOJu0Yz0ZtNjhbh4dHB6UrFBZrhaqnLPMvs0WHT0OcNDTV5hu1ol6Er3
	9Nt4uL1QiByk8ngOcMSIAENUvow0X8X/4iuoxD4mND8/Y7KDfH1A16+M
X-Gm-Gg: AeBDievgtmSSV+g7rIWj+4eHm3tYWhkdSewvp5jf+30eFamY9GgsIjm2ms/TwE4cDzp
	8vmfXKm3OL3humx4OUKL2a+XOhwL89XhJDhT3BA8qGJHmUqwNrfXR0CzDuK2g73s1GRnMoUMipD
	iVFd84eVNJsiCv6h95O8to7XXVpgBntaYzoYCaZJ43PWovm63ZapoUXHklieJ5d/7zC+V6bltts
	ZFv8+Hkh2avTiOG6cNA+T5Ahxb/pXrXbxlk6q6JfCSZVe4gjtdqVenAXHOqxvCwTPDSKOqvrU3n
	yOZZkCBn9gAQfAjd4gzDKJ7Pxr2Ntkg54CXWY9yA9i4nJuryxLTZ0+1T5K3szZPmgQ8ScKWvHts
	HrGXTVwZa0bGKwQ+GxUy0GTv/mJTEV99c01epSXiPeFic/M30tOXPHqGtqkKvD9VrwshRFFM5nb
	eyWB8rWUjgqOjIfuqaExy1yOkqKATt/UpN
X-Received: by 2002:a05:690c:c4f9:b0:79a:b766:c034 with SMTP id 00721157ae682-7a2110792b9mr85670197b3.25.1775147052524;
        Thu, 02 Apr 2026 09:24:12 -0700 (PDT)
Received: from [192.168.243.250] ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a36ed2bb47sm12909577b3.21.2026.04.02.09.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 09:24:12 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
Date: Thu, 02 Apr 2026 19:23:17 +0300
Subject: [PATCH v2 1/2] staging: rtl8723bs: remove dead code in rtw_io.c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-cleanup_rtw_io-v2-1-8d12ef658e18@gmail.com>
References: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
In-Reply-To: <20260402-cleanup_rtw_io-v2-0-8d12ef658e18@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nikolay Kulikov <nikolayof23@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775147048; l=2639;
 i=nikolayof23@gmail.com; s=20260402; h=from:subject:message-id;
 bh=PyAQGXbvthsP8MV3AW4kYz64b7KWFKysrDWrGa/tTjI=;
 b=CJ80EtUxg31FnjPCxgjCs3TrOYd0E2PtHoqEcfK2Y3ZOgyilzs6h68y5fDQQs/rJ3mueHVH4T
 X/ZlWXlhAT5BxGJsIGZ+FdiKOSnrInRYvIB1lp4CHMcaAse2+vbf9S8
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

