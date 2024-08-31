Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D94018E11
	for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 16:09:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725120576; cv=none; b=Lec+ODEsaUs9I3oUIHw1PyNYcFbOX6DyfJ9OiEOXOlu0pp9BD+XfwOKsSjYQkxr6fz7py9vwpJGUb3WEgF5AxYe3ZOZcTgaCuqKVSEiLcuvQNfsLax7AZKHG2w7Y2+jfAZmGggS0ACgvkdjkDtGFnyh+2q4hUO4ZzKo3I2zaFao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725120576; c=relaxed/simple;
	bh=MIfzWCzlDWzowm5RJozGkGCRRfMuyGxPtxZJ8z4WCIU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o7fb0UGlD8/j1bUS4MLLT1C9DhoV8QL6O4UoMcGbeLcEfBuA8y1X6dsS3/O123jdNjF5muYvmc1wZkFD63MZ55EziTtsweGYsxgNNsKpf96bGkKJPukRbCamk4j3HS383pJjR/h6vMbLbG4PW6cCGhIPrsjQPG9gpv1fZItzvqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MtvqkCsd; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MtvqkCsd"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2d87196ec9fso1109131a91.1
        for <linux-staging@lists.linux.dev>; Sat, 31 Aug 2024 09:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725120574; x=1725725374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OlL7w0NtM/rJvQ/HuhfgzNbJdMaXdH0yf2/UCZXnlmE=;
        b=MtvqkCsdfBPqaO9Q0LRV0OSXUUrCBBOBZb+p9xho5w4G8EnKRnUGdugwyH+/hPrpmD
         JVRZGlipY/7y1wiKsdr5Ow8jiAYCpu03j+aytCeyIlQB6NYBo+zRkqVeJOk/yMKmOws4
         qD7JCDQlkzJ/5ZnK76Ts0kfFfVhiHpjKOEqerrFssSP2z1ejFaA3O/1QEarig9OWJYXG
         BHI4wxQWadOIJEe9HvdAXi79byOc+SoAN+JYWMK0HGdL01hbsvZeNtD1ibz+wlhbOory
         6pBao9p2a2y0ySo56atuIQAFY8xqjKZRuZN1yUHZCg87SXWYSax299BXFo7KgHBjgOsl
         zrWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725120574; x=1725725374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OlL7w0NtM/rJvQ/HuhfgzNbJdMaXdH0yf2/UCZXnlmE=;
        b=qmYhWnKT2XkVBou8o8UQDmM+dY5ArUYPIz8UieAtgPYBiEbiQbZlQRdfGmTZBjdzXF
         boYxi4d867U2q28lQolHqGlcyjdprMG2qMyheBgYlS0kQ2k3l+uhLLOMSI6Qs48HvD4I
         EOCNljJUTiRYlEw3WhpffCEVda+fUHc3fPEKmWAnDPNpp9o4IPJTaFzq3fkGDfHJpesg
         hEs5fJAqQv6f8PF8AUMO6djI0DUhdIhc7IFE5N3uHFZqXckHaVftZzgppKEY9D3Dv+l6
         1YVH6BYmfwjVm0gDwW6Hx+UT7d63o0YCviqciHVlpnCFgWxxLzeP9Il1pVB4pmMSyDnb
         F0aw==
X-Forwarded-Encrypted: i=1; AJvYcCWsP6+GerRlo9Wt9zEeVyXDUHPBATf02f+Pv8NIAa+VDSVuj/jJRfOR7YffyHD87JOxt+8kUGYGa+tKoxha@lists.linux.dev
X-Gm-Message-State: AOJu0YzIJqw+LFlBftWdMkot9fxLd05ztOvJvL3U2xrqoKQuyGvz2ESa
	qkYoj8i1e9p0obl6M2bSdUxFUCGQwC+zqvXpVjQ43jYfYhdvjAXW
X-Google-Smtp-Source: AGHT+IGSn/PKLfzVWa/o1n9313A4D6309v/GqggvVlNQn0aPRH6SHf4V909kOzWvwPtIghDKfIF8og==
X-Received: by 2002:a17:90b:4fc4:b0:2d3:d8ae:67e1 with SMTP id 98e67ed59e1d1-2d89739d3d7mr1920697a91.26.1725120574186;
        Sat, 31 Aug 2024 09:09:34 -0700 (PDT)
Received: from fedora.. ([106.219.166.29])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d85b3b5c30sm5912487a91.48.2024.08.31.09.09.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Aug 2024 09:09:33 -0700 (PDT)
From: Riyan Dhiman <riyandhiman14@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Riyan Dhiman <riyandhiman14@gmail.com>
Subject: [PATCH] staging: rtl8192e: Constify struct pci_device_id
Date: Sat, 31 Aug 2024 21:38:31 +0530
Message-ID: <20240831160831.121720-1-riyandhiman14@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

static variable struct pci_device_id rtl8192_pci_id_tbl is not modified
in file rtl_core.c.

Constifying this structure moves some data to a read-only section, so
increase overall security.

Before
======
   text	   data	    bss	    dec	    hex	filename
  17838	    893	      1	  18732	   492c	drivers/staging/rtl8192e/rtl8192e/rtl_core.o

After
=====
  text	   data	    bss	    dec	    hex	filename
  18006	    725	      1	  18732	   492c	drivers/staging/rtl8192e/rtl8192e/rtl_core.o

Signed-off-by: Riyan Dhiman <riyandhiman14@gmail.com>
---
Compile tested only
--
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
index ad21263e725f..22a203d01b8a 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_core.c
@@ -25,7 +25,7 @@
 int hwwep = 1;
 static char *ifname = "wlan%d";
 
-static struct pci_device_id rtl8192_pci_id_tbl[] = {
+static const struct pci_device_id rtl8192_pci_id_tbl[] = {
 	{PCI_DEVICE(0x10ec, 0x8192)},
 	{PCI_DEVICE(0x07aa, 0x0044)},
 	{PCI_DEVICE(0x07aa, 0x0047)},
-- 
2.46.0

