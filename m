Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D308323A1
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 05:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1687152320;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=olsWwjorpRySZ01wEgK4D+uVHnsHFy4Cqo//GjPXpJM=;
	b=LUuX1U5SmNXJURsYyhs4VyYtNyTVtUUiA98O1Bg71dapM56aacBGxDap9OG/1Rtu0PSx49
	R5cBvGufAYofQQLttxst9wOL2SE/6lBy3rhJn3zcPIb96laDmaWkWVX+jwFbJMMkkfjSOT
	9Ul4Nf59J38p9ZFUMNgkhDS3XvkBVog=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-122-b4SeS3UqNIyT-MneTCbxpQ-1; Mon, 19 Jun 2023 01:25:17 -0400
X-MC-Unique: b4SeS3UqNIyT-MneTCbxpQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 90254185A78E;
	Mon, 19 Jun 2023 05:25:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.119])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 7F03B440CB;
	Mon, 19 Jun 2023 05:25:12 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 1/3] media: atomisp: ia_css_debug: Removed unused codes for debug
Date: Mon, 19 Jun 2023 13:24:51 +0800
Message-Id: <20230619052453.48598-2-hpa@redhat.com>
In-Reply-To: <20230619052453.48598-1-hpa@redhat.com>
References: <20230619052453.48598-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5

This portion of the codes was not referenced so it can be completely
removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../runtime/debug/interface/ia_css_debug.h    |  6 --
 .../pci/runtime/debug/src/ia_css_debug.c      | 73 -------------------
 2 files changed, 79 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
index fff89e9b4b01..3a3d72c6eaaa 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/interface/ia_css_debug.h
@@ -141,12 +141,6 @@ static inline void __printf(2, 0) ia_css_debug_vdtrace(unsigned int level,
 __printf(2, 3) void ia_css_debug_dtrace(unsigned int level,
 					const char *fmt, ...);
 
-/*! @brief Dump sp thread's stack contents
- * SP thread's stack contents are set to 0xcafecafe. This function dumps the
- * stack to inspect if the stack's boundaries are compromised.
- * @return	None
- */
-void ia_css_debug_dump_sp_stack_info(void);
 
 /*! @brief Function to set the global dtrace verbosity level.
  * @param[in]	trace_level	Maximum level of the messages to be traced.
diff --git a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
index bb6204cb42c5..3af855d844e5 100644
--- a/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
+++ b/drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c
@@ -147,79 +147,6 @@ void ia_css_debug_dtrace(unsigned int level, const char *fmt, ...)
 	va_end(ap);
 }
 
-static void debug_dump_long_array_formatted(
-    const sp_ID_t sp_id,
-    hrt_address stack_sp_addr,
-    unsigned int stack_size)
-{
-	unsigned int i;
-	u32 val;
-	u32 addr = (uint32_t)stack_sp_addr;
-	u32 stack_size_words = CEIL_DIV(stack_size, sizeof(uint32_t));
-
-	/* When size is not multiple of four, last word is only relevant for
-	 * remaining bytes */
-	for (i = 0; i < stack_size_words; i++) {
-		val = sp_dmem_load_uint32(sp_id, (hrt_address)addr);
-		if ((i % 8) == 0)
-			ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
-
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "0x%08x ", val);
-		addr += sizeof(uint32_t);
-	}
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "\n");
-}
-
-static void debug_dump_sp_stack_info(
-    const sp_ID_t sp_id)
-{
-	const struct ia_css_fw_info *fw;
-	unsigned int HIVE_ADDR_sp_threads_stack;
-	unsigned int HIVE_ADDR_sp_threads_stack_size;
-	u32 stack_sizes[MAX_THREAD_NUM];
-	u32 stack_sp_addr[MAX_THREAD_NUM];
-	unsigned int i;
-
-	fw = &sh_css_sp_fw;
-
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE, "sp_id(%u) stack info\n", sp_id);
-	ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-			    "from objects stack_addr_offset:0x%x stack_size_offset:0x%x\n",
-			    fw->info.sp.threads_stack,
-			    fw->info.sp.threads_stack_size);
-
-	HIVE_ADDR_sp_threads_stack = fw->info.sp.threads_stack;
-	HIVE_ADDR_sp_threads_stack_size = fw->info.sp.threads_stack_size;
-
-	if (fw->info.sp.threads_stack == 0 ||
-	    fw->info.sp.threads_stack_size == 0)
-		return;
-
-	(void)HIVE_ADDR_sp_threads_stack;
-	(void)HIVE_ADDR_sp_threads_stack_size;
-
-	sp_dmem_load(sp_id,
-		     (unsigned int)sp_address_of(sp_threads_stack),
-		     &stack_sp_addr, sizeof(stack_sp_addr));
-	sp_dmem_load(sp_id,
-		     (unsigned int)sp_address_of(sp_threads_stack_size),
-		     &stack_sizes, sizeof(stack_sizes));
-
-	for (i = 0 ; i < MAX_THREAD_NUM; i++) {
-		ia_css_debug_dtrace(IA_CSS_DEBUG_VERBOSE,
-				    "thread: %u stack_addr: 0x%08x stack_size: %u\n",
-				    i, stack_sp_addr[i], stack_sizes[i]);
-		debug_dump_long_array_formatted(sp_id, (hrt_address)stack_sp_addr[i],
-						stack_sizes[i]);
-	}
-}
-
-void ia_css_debug_dump_sp_stack_info(void)
-{
-	debug_dump_sp_stack_info(SP0_ID);
-}
-
 void ia_css_debug_set_dtrace_level(const unsigned int trace_level)
 {
 	dbg_level = trace_level;
-- 
2.40.1

