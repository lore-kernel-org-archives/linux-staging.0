Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA1FE27FD6D
	for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 19:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766951126; cv=none; b=P1R1psWlfsIMsPu4iur5ERNBE7asQP+3XTifWOEoY+MUVpd7PEIAtfYmRHlEaT7ZYYBuNy0/UgAy+3dQi7NTxUu42OU7n7VYo16xWitM90AeSupp2ZaJ0A3L/pLygpVQ1tV+BtzhQpRxkm+ye8JBqj/LvQ8hGa0hsKYrRV7luo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766951126; c=relaxed/simple;
	bh=Kuyg2OOkYpKTpbcdEVstbh12s1+drGtTpu6g0UcaPwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L8WpHToovqtYu9DG42fixXnZcCd72TJVWDi4krEXSwTHf3eLLnUMdkqDBnXgfQgSmgiL+f5/pg6auf5no96/Ssr72i2MQpHvysBQbsB9YRMfPvMKsNrNjafeGUrC5jBhHLOw7Eq7yc0Ta6tWwoJ58bkrhsYKQxCvVgFmtF6TZe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AkMlQqUt; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AkMlQqUt"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so49636405e9.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Dec 2025 11:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766951121; x=1767555921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6R7BKT0LFS75tbdnFhzlpRvSo7z/8enEGUcXTEqP3XM=;
        b=AkMlQqUtMzg+EFhcU+esG/BKWyBAHiT21sQ3MMVIa5kHE9FCeOKg0ibG9VlTLkml7s
         u97Uyp4jOyvN+zDHH6BOw6/fX9dbAHqPVrIMgu1AWZhL/iWZNNE+x+OlUazZln7Kq0jB
         Gkkh0IQyo383XqWTRDHSducPNoCeMcbq9F6xPp/8Md1qmeRcouV1/tYhOLCrpnBzuoMq
         YJj2gaXkPh3hI9plPgFQQjT9FrutM0zQoyPTGn2NYF7fK07sI55n9xOZ0UcjE4S8oeYZ
         rv74zc7Udrhmd/kNqQiVG3FM+2AoH5x2gxEeks4lSi8dWIwFB4/f7OUVMlTVfUqHHg4A
         CRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766951121; x=1767555921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6R7BKT0LFS75tbdnFhzlpRvSo7z/8enEGUcXTEqP3XM=;
        b=FDOVj6LhJUZsWI4Hs2t2B/o38KoR3T1HCANguh5jw7bg68UIvDPForBbamqT0TNos/
         8Q6lwkJJ0Ta2Rv2EjDIMYuEcdDmoB+3PseijC/n9k7yEfiQ9a9tBQB5Z0RMTTXmVgBNt
         mYJmwsoj8/4bVnx7dGruIK9UL9hUjdRbh9loCALJ4rsIWLTU3LLBXG6q+7NpMTdTqQZB
         RcLrtBmI7UijxsS/n1yClmyHz+mX1LZh6j5cRYNA+EETNabDrCxyyPUYttwE2DLjcmFi
         F2cIMZ4K9HnzXKV0sTmxAxigspsCzAgszSOi+xYhiYBEKEfBXnMVWFSb3nu9UVEglv1m
         57nw==
X-Gm-Message-State: AOJu0YxDXkQnIKWC1pXew8BkSSTWPn8tfXnvVsBikuWjyTz5PTCkcufH
	LQ1jfLXOlDXSvDRoClNQdah6vDgUzwNkYUdt7Vy+d2hX5J3c2XGRF/0x7LEEaw==
X-Gm-Gg: AY/fxX4rRPZ9pAbDqd7XkZhrBA0UjcDp5p149iuXvfFp8y/BCr3w8/Qj4U9m5l96dzk
	Ypw4+qPgPoo7PkCWOPE6q2jgEPJ6NM5KiE7jGukVx0M01slSU/V7IcghXlPpn7dWfd5v31nSlZM
	kVsEE/pdNrlT38JyNorethx22R6zopFnX08+LTs+53V/pFyTqnTv/uPtNs9RNKfSUY7FyliUnH3
	gLmKtSdN8c7K49OCOWGfb6zKvlj66lDKKv0uQlBFN7nIKt/LGolCvdUtnKE/p3zqAmRFoY4Fo3k
	gU78q65lXEqeXO8+u2geAgwFI5H2/rERMty2t4Npb8tGVtp8VvTjxysxWwhmM7fhCds1AGirNFy
	N++5hHVGLNH5LI7W6Lgb0fXqQK6NZmmgrxtYcYUoMXyVpSHQxwW038u4+7XIwAO9xTOuFytGoJu
	U5mYz0ZG3JKHatOA9Fm2ytc4lShx7A6jwgmk3k2NDcn6nKReFK46PZb63KiOjkLjv5vg==
X-Google-Smtp-Source: AGHT+IELiOFFwA15m5teGuOQk7I+GdtKLbYHG/BWCzNKZ7GTVggI5SSAXoD37iRdHh8oczCbU7x9bA==
X-Received: by 2002:a05:600c:3106:b0:47a:829a:ebb with SMTP id 5b1f17b1804b1-47d1957b115mr310630715e9.19.1766951120919;
        Sun, 28 Dec 2025 11:45:20 -0800 (PST)
Received: from LAPTOP-2QR70VTP.localdomain ([77.137.75.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbe58sm503733665e9.9.2025.12.28.11.45.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 11:45:20 -0800 (PST)
From: Ofir Mirovsky <ofirmirovsky@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ofir Mirovsky <ofirmirovsky@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove unnecessary blank lines
Date: Sun, 28 Dec 2025 21:45:00 +0200
Message-ID: <20251228194500.971-2-ofirmirovsky@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251228194500.971-1-ofirmirovsky@gmail.com>
References: <20251228194500.971-1-ofirmirovsky@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank lines to fix checkpatch checks:
- "Blank lines aren't necessary before a close brace '}'"
- "Blank lines aren't necessary after an open brace '{'"

This improves code readability and adheres to the kernel coding style.

Signed-off-by: Ofir Mirovsky <ofirmirovsky@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/os_intfs.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/os_intfs.c b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
index 6ca6dc548..e66b9684d 100644
--- a/drivers/staging/rtl8723bs/os_dep/os_intfs.c
+++ b/drivers/staging/rtl8723bs/os_dep/os_intfs.c
@@ -553,7 +553,6 @@ static void rtw_init_default_value(struct adapter *padapter)
 	padapter->fix_rate = 0xFF;
 	padapter->driver_ampdu_spacing = 0xFF;
 	padapter->driver_rx_ampdu_factor =  0xFF;
-
 }
 
 struct dvobj_priv *devobj_init(void)
@@ -898,7 +897,6 @@ void rtw_ips_pwr_down(struct adapter *padapter)
 
 void rtw_ips_dev_unload(struct adapter *padapter)
 {
-
 	if (!padapter->bSurpriseRemoved)
 		rtw_hal_deinit(padapter);
 }
@@ -980,7 +978,6 @@ void rtw_dev_unload(struct adapter *padapter)
 	u8 cnt = 0;
 
 	if (padapter->bup) {
-
 		padapter->bDriverStopped = true;
 		if (padapter->xmitpriv.ack_tx)
 			rtw_ack_tx_done(&padapter->xmitpriv, RTW_SCTX_DONE_DRV_STOP);
@@ -1022,7 +1019,6 @@ void rtw_dev_unload(struct adapter *padapter)
 		}
 
 		padapter->bup = false;
-
 	}
 }
 
-- 
2.43.0

