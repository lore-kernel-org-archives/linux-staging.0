Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830831;
	b=WGluUES/HCs9XJxcFy6cez7YQS+GiBYlafqR0vc1Or+Yo85o0ow7/DAY2qNG126W4hSl
	 Ux0pSTYwdpfUqwa9gr3Wv29PYoAcGRxjV89M9ujNJm5tjZAMLObnRRHAhfHWkhehcsqqS
	 D33n8/p41/Arm9DSfvqbzRWcTz5WW3BXvasDTsb/7/MLjvJb74nuqspFLNmoBiZRthWhw
	 +SHLKTVjh9y1koZRIlPg5CdF3mV38WjyVexSBI8taqf7hXIQhtps/d8YSkWq1EebLpba3
	 PbTyxRohW03k9i2tTtz2J9DdXkz/aNT7FifAX/77v54AZs5mTLUN1bm/xZSk6PznSnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830831;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
	b=d8AqKKBq5ouFpfY6X+5vl8ueS8nbS8mRVUlnnHV0zhXiqnkSodsOj8Cby0HS5tolutnL
	 S1nIf0pnenvNO2ygt3HHdxke5VOGRql8ahe3mKCP5YvHPl74s5Sjr6GE0NJMbant5ezzX
	 hbBEibeW7B93mpo14ft22M7L0yr3uQLXhnf8KNz8wCU4nEbY0Ie++ktXK8UZhcEm68lHu
	 rVtJe3h4MBQ+zc1+d+Ea538HVNXJzqxFkvBAdWXSY17LZG68Rh5cg6eEsR/IHI1jTwRDU
	 6pYowT+iOEZPNuRprp6qoy6p0mPR4OB8e9jPxoQB+sI4I3EYBIRrUOq9lOcfLdDDiUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGzBpzPR;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54FBF606A329
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 12:07:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54FBF606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=gGzBpzPR
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1ae58d17cd9so2372732c88.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 04:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830830; x=1795435630; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=gGzBpzPRXDzS1t3O/PkVFGwTmEsCgWHOXjjuv4MUyQaEfj+osQV8CLIhLSjxMGxSuS
         tRMxqXPVoRLqYWu3vjy0Ido7ANOlwrAIIC1mF7Y2aABWsMq9MonVU5XHV8mUD40Dfxdp
         9FHk3w7Vhgg8Nv4Naug2s3Q8kbIztK6AoNx4gCCrkk7WSA6QOwdu0S5tnZ/SlyAt+jIa
         eRUamzn2UBpOtbu8tSfWzKYsC30DSEZhvsc9zVAa9eA+y1BIl51t8BZj0s8uNRyPg9K2
         s/tGyAl1HF90cdgu0vfFNt2zw44paj34nVf9ikoXKO8//U/Eslsj9wNJ+B0TkTKa4Den
         Awag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830830; x=1795435630;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l4qL3Nr489Ax8dG/w5h0GcdBFAkKeAr2j0Ix9Ut6gVs=;
        b=nNKFTJe9jksQGRtt/oAUsxEXeHed6typvMvfR/niBKzt5xDmc5mml2KgqzDUZgPy1o
         Z89jt7EztIxTo2wl/EQK9ybI4eYfxzcyPX+dl8BiqxAuXZuTxHEWCQV0hyOZAJtRdZMF
         C+437N7fNQxuy+/zRKslnqy8wPrUW29AXrqJeFJO7HZcmcTWPsM/Ly6/5spwfo+wbRP9
         /oGqDrT52t6f2u2DgddKE23vkt0bwabSSh+32M6un99QgOQa1Qykx6ipLgSyKP3BPI6n
         DjNA25BVzCC4oeD09hZrs5vTlc3FTRTQXj2e7MzlBbg72qMV1VnYqBYwlZO2gM4NJCad
         e/yw==
X-Forwarded-Encrypted: i=1; AL+hErEgcVwND2JGYNMUjF/eo3cATKHEvVkxop+H5M6xWB0rQCQjGYeYR5MLlFspkQT+ykKH1lA2L7HQ7qC/ojU6@lists.linux.dev
X-Gm-Message-State: APuU4Z+/J/UJyWlfS4KkXTwOxXTd+ZGICgzqG9CYrRxzQL8DRW3DR1Rs
	Y5opQzec5evR4ZZto88ooiAzn1nfzi/muO7qB3PlOzMIe9L3EwHLtB2Q
X-Gm-Gg: AYBFou0V+5JXQplwEq8cxYIKX9Z/G6l6KfBZ5VA2iYye5QQZcwCHBBdWbX0nK9nWwTY
	rKfOx6F5D59lPkn4gZEelSxD/zHNstOZ59ZgJ+XN/PlAXfytr/F0SziVtRiGK0jmb9qfQ/4/2ov
	kjcGaAVTU9JHI6l78BpF9eA1kkZO4t7sZ8+Sd5jCP+TH+WVlh9CPvgbKE2EXgu0iziVG3niDod/
	aH9no9mo6A3WqGyoygqsK56bmo+W0i1NeW0J4JbfsRP6PE85FHhnOcWxvm58SiTv/o6UFpDrLdP
	bu0SuSOVT8qkxWdTn9B+Pyn7TIRHWmJd5FtwfnHO+I6bpyjujF0jGXYorH+pgoc6Mg2AjXHOROd
	5ZYVn99I4xFor0055TfbGmL7pXTLl1x40KrEZN4mnBGzDgVi9aU+vof3p54nYDhOoI+GLjMHtvK
	y4BHyCJHc0JJK/G269eSXHMAycP1z0X9HfjNnQmL3WCYHrIunJTufSiByC3dMdXhsyiU2zdj9dK
	VgemrUlOX9htkwd8aiEiZodaRWKwfoXqGy1bBIOK45tJOC4OEKGWAqh/KVy3Ensw3dQmsHStd+I
	Rk+RCuKnz9dT/NMHGeIs4kKAXYELPgUyweJgk80GomMZX6g6b3O8hAFz9oAbrLu1xtB95Og1TEs
	=
X-Received: by 2002:a05:701b:2402:b0:1ab:faad:cba with SMTP id a92af1059eb24-1b5030eb09amr8706030c88.34.1794830830054;
        Mon, 16 Nov 2026 04:07:10 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:09 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 1/3] media: atomisp: Remove unused any_virq_signal()
Date: Mon, 16 Nov 2026 12:06:56 +0000
Message-ID: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

any_virq_signal() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 .../media/atomisp/pci/hive_isp_css_common/host/irq.c      | 8 --------
 .../atomisp/pci/hive_isp_css_include/host/irq_public.h    | 1 -
 2 files changed, 9 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
index 61dea3863..f1b01f5f9 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/irq.c
@@ -215,14 +215,6 @@ void irq_raise(
 	return;
 }
 
-bool any_virq_signal(void)
-{
-	unsigned int irq_status = irq_reg_load(IRQ0_ID,
-					       _HRT_IRQ_CONTROLLER_STATUS_REG_IDX);
-
-	return (irq_status != 0);
-}
-
 void cnd_virq_enable_channel(
     const enum virq_id				irq_ID,
     const bool					en)
diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
index 901e10f87..d7ff06219 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/irq_public.h
@@ -107,7 +107,6 @@ void irq_raise(
 
  \return any(VIRQ.channel[irq_ID] != 0)
  */
-bool any_virq_signal(void);
 
 /*! Enable an IRQ channel of the virtual super IRQ
 
-- 
2.43.0

