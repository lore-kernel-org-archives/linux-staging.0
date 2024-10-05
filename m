Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51AF616F265
	for <linux-staging@lists.linux.dev>; Sat,  5 Oct 2024 20:34:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728160495; cv=none; b=ZRIZUe/iy9LmJYKyiyUcy0CEn2I6qIbsGm3n10daxlnF+nEFct25uxRJvc0IHGalg20WExl6tJ2HvzAkd8sw9t20yXVQO7Fw5Csyr8TjqyNBLM57Tcfmj4gZ46NvRj51uxymQkgJj3+nyNTPEa7BEqjWvwM6damTmLiZorq9yJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728160495; c=relaxed/simple;
	bh=Jm1rGgJTi+mCasyO4bMyXN8oeJxCKBSRh5MsXJXwyNw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bny0spBPXHDmIbLMFo6Abz3gII9rbzdJn9pLdBRL0KPxNU1A5ZczM/OAlgqfhva8gpd23EuQF56NFyta8PrBBXf/7g68S6sO6kkts802eswOaWMnpS4raZ96kmCFyNv+za2qogoo6cHCWnHBYhwq5Qx2ymXiqzx/xvJPEgYCxCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RsRQKGmb; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RsRQKGmb"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-42e82f7f36aso26837995e9.0
        for <linux-staging@lists.linux.dev>; Sat, 05 Oct 2024 13:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1728160492; x=1728765292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Wi+hIllgebzi4E1LyxylRUbiLWFw6eryMs3u2YRRFU=;
        b=RsRQKGmbWY+Ik8iTwMMkSzfQHwPiP9P02XB4om9fjVhIvNiTBLxki65XxhucsHzDF8
         pJ6PAKwIac0rM7WlcAdqNW3kvUD2heJsf32LekXGfEPXcLKfGlPnz21Colf0pPADtsxp
         kTWyDjcQBNQKWm/2lrFVbJVdm15Cay3SnE4mRkUTPPaCf8j6fDQREDHslTij70cDlw4t
         +7PiUvJCTbmPO9kJU4tPXKZ9K+wyah0hFMxruHhfnBPoJTdMe4QYmpteRol9Hejck71H
         cwRDxjqwcSXQz8LRdVbpOkujRuqUrCy0y+m/8GmWAMjCpxoT3M9AiULrIqg8nGhLRa2H
         oJ4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728160492; x=1728765292;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Wi+hIllgebzi4E1LyxylRUbiLWFw6eryMs3u2YRRFU=;
        b=FuR7vokKO/QUcEObrWfKhz8JoMHiB0g1iHUix2H7yrEabN79vu2rIGFMGFxSkcvy3J
         f5ocEMaQ1JR0JQWkabLv4RXRDQaAzf5IS6Ef30Fd9e5d54bLQXPgkC/s/98a7EkBFAwF
         jN/VDUGRdh1nIWZ88niQUCptmVD7pD0hmHvtLVX1U53CnQPWrsiMOAN+SNOHtoFap9KV
         iANLzMT0JGZm0C8RJ1v4Sd85tRNi1yAdlJCIAf74sBmA49fGkNhUINqCBnCyk/fh1FCY
         JQVB1POO9oxJQ+YtovJdwV0BMa1LASxM4GfQwInCgpY3YOYmqgu+zWjJC9GG4nf8c40Y
         H8uw==
X-Forwarded-Encrypted: i=1; AJvYcCXDWYAWMTbIZRUPgKCFbKskPQnKQ9gG3gGFU4EZaGh/PklhXga2M4HRmq5vsDBhTOCg3pTPzv6qZxXZ/Cmr@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1B1iFAnLr1B2o6ToEpCsvdv3q6gr+TISnioVVYq/LC3pSNaCk
	GESSqyN5kTu466TvDo1WjMm0O9Rs5txNVuR7WjRL/aUf2MCpNKKLUsjFflal
X-Google-Smtp-Source: AGHT+IGk4Rda6bc641qDF72QqSR+3nlF1zPT8cTBSwlrSfc96+yP7+osH55oyi+/xpfK8NlP7gh9iA==
X-Received: by 2002:adf:a198:0:b0:37c:d20d:447c with SMTP id ffacd0b85a97d-37d0e779f64mr4039355f8f.29.1728160491566;
        Sat, 05 Oct 2024 13:34:51 -0700 (PDT)
Received: from kernel-710.speedport.ip (p54a0712c.dip0.t-ipconnect.de. [84.160.113.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42f85995932sm41824805e9.0.2024.10.05.13.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Oct 2024 13:34:51 -0700 (PDT)
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Philipp Hortmann <philipp.g.hortmann@gmail.com>
Subject: [PATCH 07/15] staging: rtl8723bs: Remove function pointer free_recv_priv
Date: Sat,  5 Oct 2024 22:33:50 +0200
Message-ID: <17f06e3495abea1f6ad2a2f8d4f4ff1f23bef654.1727966761.git.philipp.g.hortmann@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
References: <cover.1727966761.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function pointer free_recv_priv and use rtl8723bs_free_recv_priv
directly to increase readability.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 3 +--
 drivers/staging/rtl8723bs/hal/sdio_halinit.c | 2 --
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 3 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index d571bf81ab2b..de7dfaa69c66 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -235,8 +235,7 @@ s32	rtw_hal_init_recv_priv(struct adapter *padapter)
 
 void rtw_hal_free_recv_priv(struct adapter *padapter)
 {
-	if (padapter->HalFunc.free_recv_priv)
-		padapter->HalFunc.free_recv_priv(padapter);
+	rtl8723bs_free_recv_priv(padapter);
 }
 
 void rtw_hal_update_ra_mask(struct sta_info *psta, u8 rssi_level)
diff --git a/drivers/staging/rtl8723bs/hal/sdio_halinit.c b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
index 8d2a44726fc7..52cd980c2003 100644
--- a/drivers/staging/rtl8723bs/hal/sdio_halinit.c
+++ b/drivers/staging/rtl8723bs/hal/sdio_halinit.c
@@ -1259,8 +1259,6 @@ void rtl8723bs_set_hal_ops(struct adapter *padapter)
 
 	rtl8723b_set_hal_ops(pHalFunc);
 
-	pHalFunc->free_recv_priv = &rtl8723bs_free_recv_priv;
-
 	pHalFunc->init_default_value = &rtl8723bs_init_default_value;
 	pHalFunc->intf_chip_configure = &rtl8723bs_interface_configure;
 	pHalFunc->read_adapter_info = &ReadAdapterInfo8723BS;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index cc01b8d56498..ced414f2368e 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -162,8 +162,6 @@ enum hal_intf_ps_func {
 typedef s32 (*c2h_id_filter)(u8 *c2h_evt);
 
 struct hal_ops {
-	void (*free_recv_priv)(struct adapter *padapter);
-
 	void (*dm_init)(struct adapter *padapter);
 	void (*dm_deinit)(struct adapter *padapter);
 	void (*read_chip_version)(struct adapter *padapter);
-- 
2.43.0

