Received: from mail-ot1-f66.google.com (mail-ot1-f66.google.com [209.85.210.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3312BEFFD
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 04:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777178787; cv=none; b=PRqBLDiZ/T7spbOwPW/nLGCi4TpR2wrIWsLm0ssJ3dd57iIZ0mR2oYY5uMUsYMGv3Ux4DbS/4c5OJQczLzDE8Odo4YPrFAYSY4VLhsqGZpSAFgw0v8PPjl5s7Z0DmSWsewhqMN7D7qR4+KCk+MtJa1tO/hVeVn6G3+vAkSlGd0w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777178787; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rBerb2hXJXhdB6alJmG0hnmH0/0U1HL2Y94Mmy56wNsF1QHWC7VNBOBayQyQHFK37HziTp7Hvf07A/omnIR3GDInWoiaKrGcQM85zBLjuZTmIYmb44yG0/Ddv+2IEwehmiwAlBxIN+h8/QfZRFt8FMf+wy0Dv/jZBVJ+zjBoLIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oH0WEA48; arc=none smtp.client-ip=209.85.210.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oH0WEA48"
Received: by mail-ot1-f66.google.com with SMTP id 46e09a7af769-7d1872504cbso7836908a34.0
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 21:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777178785; x=1777783585; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=oH0WEA48spzei4N87pNrov47bztr8H6gw1XDvgoxrGPQV+kiU7QnkEX9bduM2xQBen
         70xYS6A7XtqvVYqMGSGszD4YftL7/YzWXL3UsDjgLR5XaVGVc/Ql1tjBBL4i9pflJ4Rv
         0bE7PaS/jQSsKbhP2UaD3GkVgawd0Preq87Gp1XBW5toMsPpIl0ig9oiDD9hTLqCOLj8
         GwVLFMr7mG69iGrHYiMBTYLm6L/yZrYSsV9P/+DEljcGykft2Ja5VlOsOwRKctZsr/Z3
         YiGbTXdHy6vITj1cFHxRrdBe/UyH7s7JpzzgyyXLygneOO3k7kj1jqkrDqj4ilAY46aK
         UejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777178785; x=1777783585;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=smj7Q1Yk5ryr2lL1yZ4rH52sPJWaYMmvmKjJ5MouoeXxfaRJ3jTA2mLhQqjLD0h3lQ
         8wqc73sXMZCRTWKGCygyye2qG9CKHPjYRDKgAE3adM02OVZ5qWNDIWmzXuRk7LpqQPYD
         sW/VZH+MG2doYt7orUK/j/Fv+16xOn8zcdF6/1xrwvpkzmyygf1X7nof+AijeJfdGQ78
         00JUz8ml/om498CY0lreKL+KqYlSj5aF9CVSdq7H2gS3AaJZNI5sRM40OhgNKzy/frJH
         fOt93SzQ3wW6mrxsg1ND4ojFalV4giV86hx+invmxERDj3w5lPl/pSSONhqA1KWh6U6j
         darA==
X-Forwarded-Encrypted: i=1; AFNElJ8Wt9pcYxYwt0kJKPNHiCiim7uiBleWBOhMKIWuOZnB8juMCQJPgIBMie+6BLDk5ANzrhdr0hEQn/ESpbRB@lists.linux.dev
X-Gm-Message-State: AOJu0YxyQQX1a/ioGjbXsrBFg056GjEQ8FJMr1Ztm9bDuaSuKRKYW26Q
	S5jduPN4TwwyPlPzHfzjAtpBVAWOWlYf4j061+9SQs4oPaUqTzi+ZKvr
X-Gm-Gg: AeBDievPC3dMKDsEGqRk18/93NTWihOhCB6mUqxRMVb8Ts6NC7tVS3FrhD8Y638ZzoY
	xc+vRfLzNikt5iFWN87ZyPJFcYk4kM2k+uZpAdBQEnaezwaeAaN1ksDxkCEAwFiQuOwQoE5Zwo1
	aThpeXZLj9Re/z7C990cxePWFOqPFlZLjcHm4AfO7oCejwMuxR7LZZSJ2TsgTK4n65PBYlKLTc5
	hJU/0eQPQPKn6aV5ngnPWtKO++8W+pdnoE2ce5DtaYZwmfpr8l40SpDTGpVBS2UDFfX2o9gcpUK
	l7lZ29oG7N0I4nhGELoWJf4QgnNUk1rtQyW0fnUWL9KeaV3cm+eXAMq/2gPYy6Y1sMiXjnOT7qP
	dHlokAoVd25EOLp38+Ma0elVFim9fca19QwHN1sws/xISb1QyK4H184Ty466iDUEWBRnw19Thii
	3BTYsj4g8HHhE3NsfvTeOWeXAf
X-Received: by 2002:a05:6830:4609:b0:7d9:ade1:e19b with SMTP id 46e09a7af769-7dc955dc568mr13369511a34.14.1777178784790;
        Sat, 25 Apr 2026 21:46:24 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dce5c346adsm11633571a34.27.2026.04.25.21.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:46:23 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix coding style issues in mmu_public.h
Date: Sun, 26 Apr 2026 00:46:14 -0400
Message-ID: <20260426044614.6067-2-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260426044614.6067-1-sonionwhat@gmail.com>
References: <20260426044614.6067-1-sonionwhat@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several checkpatch.pl warnings:
- remove leading spaces
- fix block comment style
- avoid open-ended lines
- remove unnecessary return in void function

No functional changes.

Signed-off-by: kernelcoredev <sonionwhat@gmail.com>
---
 .../hive_isp_css_include/host/mmu_public.h    | 94 +++++++++----------
 1 file changed, 44 insertions(+), 50 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
index 1a435a348..58b1af384 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_include/host/mmu_public.h
@@ -11,72 +11,66 @@
 #include "device_access.h"
 #include "assert_support.h"
 
-/*! Set the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return none, MMU[ID].page_table_base_index = base_index
+/* Set the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return none, MMU[ID].page_table_base_index = base_index
  */
-void mmu_set_page_table_base_index(
-    const mmu_ID_t		ID,
-    const hrt_data		base_index);
-
-/*! Get the page table base index of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	base_index[in]		page table base index
-
- \return MMU[ID].page_table_base_index
+void mmu_set_page_table_base_index(const mmu_ID_t		ID,
+				   const hrt_data	base_index);
+
+/* Get the page table base index of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	base_index[in]		page table base index
+ *
+ * \return MMU[ID].page_table_base_index
  */
-hrt_data mmu_get_page_table_base_index(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of MMU[ID]
+hrt_data mmu_get_page_table_base_index(const mmu_ID_t		ID);
 
- \param	ID[in]				MMU identifier
-
- \return none
+/* Invalidate the page table cache of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ *
+ * \return none
  */
-void mmu_invalidate_cache(
-    const mmu_ID_t		ID);
-
-/*! Invalidate the page table cache of all MMUs
+void mmu_invalidate_cache(const mmu_ID_t		ID);
 
- \return none
+/* Invalidate the page table cache of all MMUs
+ *
+ * \return none
  */
 void mmu_invalidate_cache_all(void);
 
-/*! Write to a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return none, MMU[ID].ctrl[reg] = value
+/* Write to a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return none, MMU[ID].ctrl[reg] = value
  */
-static inline void mmu_reg_store(
-    const mmu_ID_t		ID,
-    const unsigned int	reg,
-    const hrt_data		value)
+static inline void mmu_reg_store(const mmu_ID_t		ID,
+				 const unsigned int	reg,
+				 const hrt_data		value)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
 	ia_css_device_store_uint32(MMU_BASE[ID] + reg * sizeof(hrt_data), value);
-	return;
 }
 
-/*! Read from a control register of MMU[ID]
-
- \param	ID[in]				MMU identifier
- \param	reg[in]				register index
- \param value[in]			The data to be written
-
- \return MMU[ID].ctrl[reg]
+/* Read from a control register of MMU[ID]
+ *
+ * \param	ID[in]				MMU identifier
+ * \param	reg[in]				register index
+ * \param value[in]			The data to be written
+ *
+ * \return MMU[ID].ctrl[reg]
  */
-static inline hrt_data mmu_reg_load(
-    const mmu_ID_t		ID,
-    const unsigned int	reg)
+static inline hrt_data mmu_reg_load(const mmu_ID_t		ID,
+				    const unsigned int	reg)
 {
 	assert(ID < N_MMU_ID);
 	assert(MMU_BASE[ID] != (hrt_address) - 1);
-- 
2.53.0

