Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EF5063B6
	for <linux-staging@lists.linux.dev>; Wed,  2 Aug 2023 09:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1690970227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nXHvhsWvUt9QlzRY0BQlGeFWwRZs8w0/lYaxHK9W8GY=;
	b=U96mOhmNekTjOmUkDzzuL8ewAyJ8sWq2eoYvhnz4XC75WR2ENBxCFm9i2zAxI0h1LlUZqW
	dCY3gQP7WRJ8Li2i1f8GJHRxM50H8+fmxA3HnByyn7am5leKtyUHl7VJmKoMzYQIljABja
	dtCG7sD5OXTaIGD7Xxy4r4QQUcbTJa4=
Received: from mimecast-mx02.redhat.com (66.187.233.73 [66.187.233.73]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-638-hpurGaDhOZ2fz5mgPfF9Vw-1; Wed, 02 Aug 2023 05:57:04 -0400
X-MC-Unique: hpurGaDhOZ2fz5mgPfF9Vw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id EB3D73C13928;
	Wed,  2 Aug 2023 09:57:03 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.67.24.18])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 595E8401061;
	Wed,  2 Aug 2023 09:57:00 +0000 (UTC)
From: Kate Hsuan <hpa@redhat.com>
To: Hans de Goede <hdegoede@redhat.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Kate Hsuan <hpa@redhat.com>
Subject: [PATCH 05/12] media: atomisp: sh_css_mipi: Removed unused code ia_css_mipi_frame_enable_check_on_size()
Date: Wed,  2 Aug 2023 17:55:59 +0800
Message-ID: <20230802095606.1298152-6-hpa@redhat.com>
In-Reply-To: <20230802095606.1298152-1-hpa@redhat.com>
References: <20230802095606.1298152-1-hpa@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10

ia_css_mipi_frame_enable_check_on_size() wasn't used by any functions.
So, it can be removed.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 .../staging/media/atomisp/pci/ia_css_mipi.h   | 16 ----------
 .../staging/media/atomisp/pci/sh_css_mipi.c   | 29 -------------------
 2 files changed, 45 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/ia_css_mipi.h b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
index 9e50e1c619be..cd6e0111d9f4 100644
--- a/drivers/staging/media/atomisp/pci/ia_css_mipi.h
+++ b/drivers/staging/media/atomisp/pci/ia_css_mipi.h
@@ -25,22 +25,6 @@
 #include "ia_css_stream_format.h"
 #include "ia_css_input_port.h"
 
-/* @brief Register size of a CSS MIPI frame for check during capturing.
- *
- * @param[in]	port	CSI-2 port this check is registered.
- * @param[in]	size_mem_words	The frame size in memory words (32B).
- * @return		Return the error in case of failure. E.g. MAX_NOF_ENTRIES REACHED
- *
- * Register size of a CSS MIPI frame to check during capturing. Up to
- *		IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES entries per port allowed. Entries are reset
- *		when stream is stopped.
- *
- *
- */
-int
-ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words);
-
 /* @brief Calculate the size of a mipi frame.
  *
  * @param[in]	width		The width (in pixels) of the frame.
diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index b20acaab0595..16c824981c59 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -185,35 +185,6 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	return err;
 }
 
-/*
- * Check if a source port or TPG/PRBS ID is valid
- */
-
-#if !defined(ISP2401)
-int
-ia_css_mipi_frame_enable_check_on_size(const enum mipi_port_id port,
-				       const unsigned int	size_mem_words)
-{
-	u32 idx;
-
-	int err = -EBUSY;
-
-	OP___assert(port < N_CSI_PORTS);
-	OP___assert(size_mem_words != 0);
-
-	for (idx = 0; idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT &&
-	     my_css.mipi_sizes_for_check[port][idx] != 0;
-	     idx++) { /* do nothing */
-	}
-	if (idx < IA_CSS_MIPI_SIZE_CHECK_MAX_NOF_ENTRIES_PER_PORT) {
-		my_css.mipi_sizes_for_check[port][idx] = size_mem_words;
-		err = 0;
-	}
-
-	return err;
-}
-#endif
-
 void
 mipi_init(void)
 {
-- 
2.41.0

