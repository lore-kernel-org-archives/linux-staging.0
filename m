Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3B823EAB2
	for <linux-staging@lists.linux.dev>; Sun, 26 Apr 2026 03:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777173052; cv=none; b=YQ+cCV1y7NQWLeeQh8zF+Kb02Ieu9tPM4gYDwm9REQF8aPmXRIFZ+QM+GgIc3NPN9kbI64wchWzX8OAE4EgStpTj58QwxGaRLB7jCxD9ItLAlBifGuSWQoVtwijI0uZLJXoCfCFgDYCSdF7lNfx2+E1xwVURLfiCcQpDpEFF3bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777173052; c=relaxed/simple;
	bh=iBMhq5lwSgwfGGv0sD5W65o1I5F1349MCKU+Iaq8XvA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VC6r5GYHRoiYGYnfzJFXGrlKk3UhFFaxsIIVH6XvIJAhG/ot754fco6wo8Kq461QiNdmemBxWnqLmUBf4p7JTuzVJkfvOvKgELlzRhxP5zLTcMjSQ7DcFzKiOgjVmnVLusDv/1FhGN1bnGIaLTued9paNloa68RN8GBNMnyDWbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g0WMvw2I; arc=none smtp.client-ip=209.85.210.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g0WMvw2I"
Received: by mail-ot1-f65.google.com with SMTP id 46e09a7af769-7d55b97f358so5984667a34.3
        for <linux-staging@lists.linux.dev>; Sat, 25 Apr 2026 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777173050; x=1777777850; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=g0WMvw2Is13qW0YTnpfhz0YGormrtFjt3SQYN+TCL0tRWgm3crnlq4UGjpi85MFsvP
         iogCUgmiGZBbFHjsDoaeWur6XUSl9a2pOKm2Egz3SPg4QQ+lielVK0RcHBauogYjuCbq
         ssBwBqj32MUXdVvkn5323jmW21MvArojR2cjkyKKCdvyBxfMLGTkr6gdDAZVsmC0h2Se
         fR3hwVH6d23euDTPV5LIOhjzcZ6wzPfL44VUBcX0Kb0Ahrac+Q9ckuelUn7YnLLe7J9W
         Fe+0gSyURcZvBykJwL2dC/7lyQ6nwsQ/3+nSvHqXd3wLptMRUne569tSXl5SGC/HDFpi
         H01w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777173050; x=1777777850;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oOULwLqvgrU1wCEhAdPKlH+/9gYQPD/8K3H9nkcKM5w=;
        b=H5moKeno/geIT8lvtw1X+Jx2sb02HUL6e/J9A+vZv+ssP2HLWvkBVMdLKggqKK32cS
         aRsdYu2kYFzuv6O8FgaW7u4pswxO5iyLaZUDd8cJN8ca8N/ytSQwehzvxs7MwOiXxmdF
         80Hi7Oa7uUT+zN/TKf9K7ICmqMDGesa8nBSdvQX6bZMdWnk2v3amGf1DCA65ugqWa6VM
         /SowWrb9FQMYRT3aEWGYMoYwINHLh/9cqvo7RhNhQHvecwK6qohTXAp/yIc71MWgady3
         /6v7TIqNE+mlShOZNBBxid7GvZK/oQYFeoqUNOXPIjzBv2UrPQmn/2QW/JhT8gEcyTHA
         5gBA==
X-Forwarded-Encrypted: i=1; AFNElJ8J4u9dHHtVdMI8Z+YyxwjoUHEfz+f4FPs7PqQR/5xawOrGj5xG5Am5WPZUJNAmIe/RrsdlTzGyjywXOOQt@lists.linux.dev
X-Gm-Message-State: AOJu0YwDcv3ZZiDU4GGb29Gyr25FUw6uBeT3GYEJkyka0ylFCULuQYUu
	byl3NI6ZrjKAp/+E1sHOFeakC9PtJ0ttYZNeJkqlycpbSlmhJOs+fvdj
X-Gm-Gg: AeBDiet1CHX9gaimrBgYs1JyRhqUYzMOzSUPUi8I13JuvqUyMQDbzljfy8LwsSGJuaT
	RuQ/aOy7U19RGUzwzZGDmEJZKe5tRuu1vgybnwIeLq5p7jL/OeawSrqKsPIpBsdP/oYG16EZ8GD
	A0sw8VeiViKDlrCkkyxghBJ4rCh4KAZn3pbFlWiU/yJ8FmsugaEkhg/6M7tM11f2oJcnBO/gGj3
	5HBexopbumI1Ufd/rfx27f5Zwo6qIaXkuHLle2qlQ8AIqbseJ9ENBwyJzaFBGttZo0n0+7SWiDI
	hSfBNlZKiPOrYtNlwLthmeynRtNyiHP0zhBEAl95ec/4bn1nzDGwEvRWHc9a/cE4kwjNFuspyvf
	A/0tfpmfhyHplUNeiqT+UojCCaNvZEU6eGDqKzVE1ZLeb/PCnD8BP6CCNFjVfq/qQCld3nt9OAk
	tc0n6e76jJRHHJrw==
X-Received: by 2002:a05:6830:82e9:b0:7de:44a5:51cd with SMTP id 46e09a7af769-7de44a55eebmr8910458a34.1.1777173050158;
        Sat, 25 Apr 2026 20:10:50 -0700 (PDT)
Received: from localhost ([2600:1700:3420:b5d0::15])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc97616c11sm22798566a34.25.2026.04.25.20.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 20:10:49 -0700 (PDT)
From: kernelcoredev <sonionwhat@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernelcoredev <sonionwhat@gmail.com>
Subject: [PATCH] staging: atomisp: fix coding style issues in mmu_public.h
Date: Sat, 25 Apr 2026 23:10:46 -0400
Message-ID: <20260426031047.5525-1-sonionwhat@gmail.com>
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

