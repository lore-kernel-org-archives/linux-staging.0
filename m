Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87724A07C
	for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 14:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752502023; cv=none; b=dNFJBAbjumKZjOyPeVjovfS0Ot1bP0wW1smIQlK8lOA7uwrvxnCvYiD2Mk3v8WYNBu0ynublYCGgLm33gaCMyzK69brItqGj3k/Q+JQfX7AIYxPjrrXCNhASD5VHyuH38gxb4jX/MoYKG95DxiwmI/jbOMzrTQXcch7dQhdav9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752502023; c=relaxed/simple;
	bh=+04pRfrMC5bnxVH1z1JDJ55WhOxbPv/wMsPDtKE/wug=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kPbCVbvcX7IOJuuUsCSRdrvuwyN9LeyLHLjRia356Y/+JlGygaGSPHxWLX5klgETnYqrBovv9lg8k034ISiTSP2OKmyiaxPJ4BeVta34AfC9HbhSbizpxG0Fvy7nicj+SZfMEoPOAFBWuSjHBhVEb1yYtI808qaR5GdmurUt7J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LOHOY8Yu; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LOHOY8Yu"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-4a77ea7ed49so58569981cf.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jul 2025 07:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752502021; x=1753106821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A11jZ3IWs915tX3jAt6nejExoHwEI3hR6vxjjTJTwmY=;
        b=LOHOY8Yujf3tIkI67EOJ9Yfm+is0qNYWebwtWYs5pQKEOrJNuEsqNWv5qsNH4V1GZ8
         5MwrcN3Kl6GKsWPxu3LgIiGwf5iysz9/DuGPyb7r5p1bdPP7xpopkJyknXo9B3N78eKi
         yje9t4LTZIB02Zazfvc0KGa1wNH4qd2WAajXODpawaav0qFvQpHTuzp4flq59CPBj8JI
         Ex5hGgCMz8bIQq7luKvQBpKvv06SsWocKvdMoFTvkp8ilgSXRV0pFlTd6/Q+RETOOm+C
         qJ6wbnXYk3jvEqBAy34b75w6LiNf7EbAnqJlvO41iObRJQZIH5wMnhbS0q0TXaXfw0bs
         Fv/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752502021; x=1753106821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A11jZ3IWs915tX3jAt6nejExoHwEI3hR6vxjjTJTwmY=;
        b=EidtK1barvWxCjBnGl5RwvnPY8RDeKfJULW7HYUKytf4TeMGKBXeGGw6ACExkUtSfS
         CcuJ6ZdepncnGs8nkrRmz3UXM8gHke9Q4C5jbLEQGgLS7QN+KjI3PUG49B1HeldnqLZ7
         bpQncnFTENNYqeDXt2tnmMHexkLnZyWdjYgvrtQ1cVGYaTy7nm5RpIgSjhajwZ9M8fFh
         tnT6M3M9V2vmVcnQ4vBVzoV6cG13V4J0updm+I5bj3BrQxyNCyJZJ+p1FmkXCuoi7Na+
         IO2wZioOovV89hHzJZtsJi8Yq9qvL4VDhayfNJr4SzeLm+0QLQTfhuDQlK47Iu0AGeGA
         PWKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjn99/vihClLUkDflz37shR9LPpTiGNg+8xjT+rFvoTHIPhVfOhKtjK8DrsugFVGUJMfHdk0apqzrW7J5B@lists.linux.dev
X-Gm-Message-State: AOJu0YyF8oVEMSItGnvist448iKVsWQ2HzbqHocqQFS8X9isGMqyTKTo
	NQKACfrwI9LEdVouYk4WYBdT2JSbO93wwC/OcVbT2w26HmHuNSROgC8H
X-Gm-Gg: ASbGncsmu3IkA0/bNd+TXJ50ktBZTfPgIUtw3gwSDgqpqPA3zeEZOpjEL1enMIpa23W
	rIP2WMUUsWy7nVYUPDRoH4bVtvNqmiGEpUIK2Jfp8W/T4zFuIEB01Ze0JAlnQ6pb2VW8JPUp2UT
	1xzNcrjviK675HdkLolVNuv4e5ROJIBYgwpyT2AZiyoB4GUGXkrBP3JOecXIqhrWx3iK1HhcStD
	5NzuNfGnqePK5grhKvMj5GsFU1U3nUPR7rw5ZF+WHLxQJkjF70hj289H4Uv5KwzjAH3vlArae+J
	uCy9GOvPM71Yrfnm6uVhGTfFZv6T3y9ELBLs97VW6g4O1JHUCp4k6jYQE0g7Iq9v2ovDQ9t2S+k
	+U2PwiBM2pzB+ATGinfjDlqq9+he/ezgkpAmsEBmF
X-Google-Smtp-Source: AGHT+IEv313TLhURVuJV2ZjFg7WZOUSA5K8QH3+VOSOLnS1GhFcpirLmcVMiUuQvO1TRBLf2PHw96g==
X-Received: by 2002:a05:622a:5c05:b0:49a:4fc0:56ff with SMTP id d75a77b69052e-4a9e9ca5040mr311134641cf.12.1752502021073;
        Mon, 14 Jul 2025 07:07:01 -0700 (PDT)
Received: from localhost.localdomain ([2a00:5881:3041:2700:bc8c:6e13:ff9d:5355])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e8b7ae2a91bsm2940614276.1.2025.07.14.07.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 07:07:00 -0700 (PDT)
From: Woohee Yang <woohee9527@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: ~lkcamp/patches@lists.sr.ht,
	koike@igalia.com,
	Woohee Yang <woohee9527@gmail.com>
Subject: [PATCH v2] stating: media: atomisp: fix open brace placement
Date: Mon, 14 Jul 2025 16:06:47 +0200
Message-ID: <20250714140651.213850-1-woohee9527@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch error "ERROR: that open brace { should be on the previous
line" in isp_param.c

Signed-off-by: Woohee Yang <woohee9527@gmail.com>

---

Hey, this is my first patch, I appreciate any feedback, thank you!

Changelog:
v2: modified commit message
v1: https://lore.kernel.org/linux-media/20250714135014.212067-1-woohee9527@gmail.com/
---
 .../media/atomisp/pci/runtime/isp_param/src/isp_param.c     | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
index 251dd75a7613..b4aac76c2ed5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
+++ b/drivers/staging/media/atomisp/pci/runtime/isp_param/src/isp_param.c
@@ -102,8 +102,7 @@ ia_css_isp_param_allocate_isp_parameters(
 	unsigned int mem, pclass;
 
 	pclass = IA_CSS_PARAM_CLASS_PARAM;
-	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < IA_CSS_NUM_MEMORIES; mem++) {
 		for (pclass = 0; pclass < IA_CSS_NUM_PARAM_CLASSES; pclass++) {
 			u32 size = 0;
 
@@ -178,8 +177,7 @@ ia_css_isp_param_copy_isp_mem_if_to_ddr(
     enum ia_css_param_class pclass) {
 	unsigned int mem;
 
-	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++)
-	{
+	for (mem = 0; mem < N_IA_CSS_ISP_MEMORIES; mem++) {
 		size_t       size	  = host->params[pclass][mem].size;
 		ia_css_ptr ddr_mem_ptr  = ddr->params[pclass][mem].address;
 		char	    *host_mem_ptr = host->params[pclass][mem].address;
-- 
2.47.2

