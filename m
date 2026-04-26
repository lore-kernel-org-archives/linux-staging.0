Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ABB423BCED
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 04:46:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777178782; cv=none; b=hTAnynyGLriDx4ZQ4q3NfwVgTPsGcEpp33IeFjf584A+WsQtFpcbyRNikX87gxFbS4lOuvCOrsKPUk97ZbfVVCwij7Y+6gh+elKgbqjjptKp24gpLLRiuc21R9B9Go2+38Nu/IPb4e/mOLn3EvO/lJhbWPhqKgPLU0IeyyxoftM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777178782; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jWAeD5RC1ph7h9iMjOUe3s2F7y1/rsuM2uNJEDGtFUZKg0IJY+f94h1/cg+/E59KOz1CNyB6f2uyzSyMzgFu2JIQqhnsUXCqPCfpxpv54NOGTmzX98RFaiYO7IwYP3RC7SPn6d2DhTrQeY+G2orsL2S5fTKySnhhaWmYgfzf8DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s9m1GL7t; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s9m1GL7t"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7de431da8fbso3417073a34.1
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 21:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777178780; x=1777783580; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=s9m1GL7tCa7fDjbQ/KeR0VVtyJ/qVLaDtAkB7gMOf/ow5jhV84pcj8/gpzv3mRE0TZ
         9GQlzNm7yBRkGX8ZTypSYSVyZnHUStERkCVnX7FLoqDfWLXTr+qPbnhAk/0ZWmJBSlI/
         ravcMwIJBZoewXwnFf0UPPP2BHTWmI8xFreVxbjZ42eGVEBieqI5BfCDjGEP7w5G8nQ4
         O9vVoLg5e+OrKS5MgtzbsGPc8iDUywfkBk4ASnpsDayWabx7oaYQAii2h0fgc2CJh+rm
         OV97YvjC0QKB3fFuKZ5eB22SuuukWh+dIpVIf8n9ZtOft+6mhtdIeDZbjEpC8ZEcPnrh
         8KHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777178780; x=1777783580;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=NcmWZ8QtbK6DdqmyuSzSljc3AXLIPjGq28gy89rSFiyEdPxTtXRs5fvc13mGKmwWPv
         hEoK/bPCtA2sbpGeztXBfmM0pKkuSoJpm984D828rLcQJngwyIyrbsND68qBE4N7CDX2
         bOUfGwAwaW3SjY5Tm26w5xZtdAtIPm3Yx9pXRK1dX5oRQklE09Q6wMD8A7UDfa+ScGRW
         ZGssqzWs+2DmrHTQ1f0dQtvl0FVD8QpKyDFBATVt4aN9ddMM1C1tKsQrNMMrbo+4AbWn
         hYe7tvlKm5YSH2PORKSuu4iOHy1rx40MTGeJ1sF+G8oyn6wO1sYIJQNgu/rMXNGR92ga
         IAfQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OzUi3rJvVS7wE0qIxHWGMxtYiVouYmPoPBXt+SBF23UivfcYKJGw0Nc/6kc8QAWx2W6w12BUhWDbB58Rm@lists.linux.dev
X-Gm-Message-State: AOJu0YxuzheOB8eKfYqoHzzeZxcgTnOgIqJFwMEKb9QXklu8BpMTByQY
	Oq8qGdCYu5JsRTUfxdhhO4HtqSqvQJVAeZEbeY8vGmqTdqO5SuBfUPJ5
X-Gm-Gg: AeBDievCRZbD3Xtd0G1HwqV7CsEU/yJjH8H5V4OBLYi48lo1TigoffaXMTQe/wVgfa0
	qKw25IVXDEJxlj755gtEOeOSJQKq+rKg9RBSWmo0Sa2d4rPF5B3p3A0FPwDGSuQo8ULDoPzdCZs
	mIP3zcftZgKN2kQAsVPiueKI4baduvoD/r2UeEtO0mIIhajc9zEldRt7JpXaDH1SKJBiIIzI1M/
	S9ELbmS1YH1VoTr2c0WqQUwuSyrHc1nXJUUQZyfej88uAwXSmNpP2IwRWHi7XCH4qQEibAv9RwZ
	ZXu7zFroOWengUwE6VYsfdY3SSWyRbxO+z/qtJcdLLwY2DxUna+7fQUlhvvtmqsMFuOipwX04x7
	n6BDxW/92JZ558MEPh2FIYYVgu6ysrLaTbl4lxq6rKvuy05n21tYu0p6XjiliStrxzR07e8lhJo
	GviEIXdSMf6xtt5PKPvE1vNcoK
X-Received: by 2002:a05:6820:1c9e:b0:694:9206:5bdf with SMTP id 006d021491bc7-69492065ff0mr14588821eaf.4.1777178780263;
        Sat, 25 Apr 2026 21:46:20 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-42c054997absm19260684fac.3.2026.04.25.21.46.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:46:19 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: atomisp: fix coding style issues in mmu_public.h
Date: Sun, 26 Apr 2026 00:46:13 -0400
Message-ID: <20260426044614.6067-1-sonionwhat@gmail.com>
X-Mailer: git-send-email 2.53.0
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

