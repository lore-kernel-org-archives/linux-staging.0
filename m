Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102644;
	b=xcdANVeFCe4MRcoGRdM9+WuOGijmRD233QGVhYvPMzjm4JCUY0nW34o6cM+t2eEx3aYE
	 U2HUSQt4OjgTaSlrgjCy8tUfE20L72dy3eXXw0hg7pmIDJ9eC5koSxzGDHHjtFZhGnCIG
	 rjD+pqTJrNFZoJ3zGSFWGnpzip+uJhSjtVLcatQKGEbAHfELzKZwQrLllDspzOo7h4tKt
	 E6wa+SqQaQOI3NZGobw72kfpPEcn7OPRvCtIf4ikSHK/3pFgL95Z2SIpGAufvDGVH0vWt
	 r8G2gwa+SQYy7RRcPSZYDO4s6Wd8DgjOWo+zkYa6fVcZUbAxp7ggi/kKjTWvzN/uh7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102644;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
	b=3EvQhgwUyui2IGIzZDUy9uHPYSrkCZvJFoqWjhO/vc49byhJ04xZlPKC6P1BiqKXlBZp
	 WskOPXJwW/Qq9tcis/iollcaAVxrIoOb/LiTXxKjkxzqhvuCkZEI+qqEU9322OBsCqFW0
	 oHOmjMNAi3t6agNUWbvdKpepCHCvWsnKnmLsLuPAur+mOKSpXS98qeLYc8OHZLpSck8f8
	 2In2nvSstGdAm33cym31EDGBebyhAu08zmsOB7hdlEGFVWzC0tdHYaml5QFLLaA2OXQeE
	 HMNI4qddVfnARo4NfWzp0Re7SoAEsMGhH0e8xAwHjjD3SeB1pmr5sOJCldvgfpCagRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dP283dWY;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85A9B606C956
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85A9B606C956
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=dP283dWY
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4956869750eso27262185e9.2
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102643; x=1793707443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=dP283dWYbsOGruOgT1eNOdYkkUBWtjcy3UHIff1gENjTj88LMsQrtqVcZDaNbhaKRZ
         NGO78tQhJiWTTktNDK5gSnr9HshMi3VU3w3vIOntA/uIcrUOFRAUPsaqIEfeAqj963EE
         jCwh6EeRXwtjIZE+sCkGoYbiqGdJL0S4auP8Bs0LkMH00f4qLvJd2iEiAAUKuGWN+JDh
         kIjiwoelMe8uPmPxCOGeXqGUjF4DXKjurISeO4XdLZ+YWIYH/CIrR0AG+lM97gsPOIar
         1U02hhq0hZe+ynfZxIbSEHPdc77m4RILWCqrB4KT4TEznzbkCzXoQuJn/u41R3PtYA0R
         U52g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102643; x=1793707443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ql/VTrEuXaadEBjKgJVl5o63RIe6hsZ90eJUJtNqjG0=;
        b=i9SKvofFOQe0I8E03ke4nZDoN/IBnf5BdAFzIC5NkeVH2lTmM/qYwICuchyWXo18Sx
         hR0ZGMRTmphq79o945UbJG1pEgtGYQSJbG2WpyHJuaCkOdjlBz4cdJq92RabaCWYeSla
         8Gzjfl5z0zgTygc0phWRKj0JX7S3Hjcq9UynivQcM5+4Q35wuHeJ0XT669Zc50/qEjOO
         PrsMJ0etGA3ovY2UJFXaDx5APaYjYYWHEIV0UFEpohhzKEJxMbsFFgsh/NKXR2xa5MRH
         sinjxyAW/EmT8AUC9B1wHBlYRFAnCOppMG3/jSd/QIOZaXCPAM/Y0ryGs4MMI+lBo4dP
         j+Ew==
X-Forwarded-Encrypted: i=1; AKwUvByIc5Olv3HX3XO5K6VRR2t+iHr3gi5VvdH1LfIGyyBKUvot9E2jZ+bdHjPydSp5kSJnutiRaWdH8GwRkyis@lists.linux.dev
X-Gm-Message-State: AFq9FYK+NEH0IWI7A9DLw26LBhEtd5uz2jtJAEHrYK+MaxBX/PmG/f/7
	pOsmMMi0iZeiXgJ+w+N8q4SjNWtjQXaAZ/9CP3UX6+dHJHqMBO0orrMh
X-Gm-Gg: AYBFou3ULBeomSbgdfMrEluwqJDjOkJTwwyNvi2b+yg4ce6HW61x1DtlnQsS4C2OuYa
	dSgBPubz5VnsPznvmY9NMWtguhIUMKdheVzqTvFXiMM0/NqaMR4nPSB1hZ0Gsy63PXa47mZ6CeZ
	JrLAgUixYd0GGyxJUhZCGvkLZCbAs1yk5vAQxCtDCiGdKbN5EMBmMKAWLw6uCkqnb+jetKOdIM6
	ta9SaIhXS0chm9+j3L+y22sCwlKW/2tuzSTsMaP2ghN609z3kbPfDi0o4T60SFIYVRpDdZqSOVK
	yTC7CtYPcU/+yygyl//U7xFD8XNAD4FFs3mrawHE+doxbBxziQkrxXXRXjrg/lUYNAPG48gdlDp
	4WjtPn1ye4i3aIw5gAE7HGEAB77vcJ42QzozVySxgf+przfgIcBCSiDYELU7rrnVWHSB2EZYM5/
	NuPSjbIj7FfxIFV4oiS4+douL6e+NiR2bqAdOYcf+5bTgtfFX36XcG9q1AET2STik5ZNZ1EaQFc
	POx1y7mPwkV5OsNAwYAnUOZnJ7wv/UlR8fxMihurUV841HWd43+/1hH4VKEPA2BZQQ6o2SGjDDx
	90Q=
X-Received: by 2002:a05:600c:b99:b0:4a1:efba:511 with SMTP id 5b1f17b1804b1-4a35acba31cmr176444585e9.35.1793102642389;
        Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH v3 4/5] media: atomisp: queue: move circbuf types and helpers to queue_comm.h
Date: Tue, 27 Oct 2026 12:03:39 +0000
Message-ID: <20261027120341.2305533-5-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027120341.2305533-1-vladurares@gmail.com>
References: <20261027120341.2305533-1-vladurares@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The remote queue code only needs the circbuf descriptor and element
layouts plus five small descriptor helpers from the circbuf library.
Move them into ia_css_queue_comm.h and include that header instead of
the circbuf ones.

The descriptor and element layouts are shared with the SP firmware and
are moved unchanged, including their static_asserts.

While at it, drop the OP___assert() NULL checks from the moved helpers,
as every caller passes the address of a local variable, and convert the
moved code to the kernel u8/u32 types and the usual function
declaration style.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../queue/interface/ia_css_queue_comm.h       | 130 +++++++++++++++++-
 .../atomisp/pci/runtime/queue/src/queue.c     |   2 -
 .../pci/runtime/queue/src/queue_access.c      |   1 -
 .../pci/runtime/queue/src/queue_access.h      |   1 -
 .../media/atomisp/pci/sh_css_internal.h       |   2 +-
 5 files changed, 130 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 7cd788e2b16bd..8323347bea6b4 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -7,8 +7,136 @@
 #ifndef __IA_CSS_QUEUE_COMM_H
 #define __IA_CSS_QUEUE_COMM_H
 
+#include <linux/build_bug.h>
+#include <linux/types.h>
+
 #include "type_support.h"
-#include "ia_css_circbuf.h"
+
+/****************************************************************
+ *
+ * Portable Data structures
+ *
+ ****************************************************************/
+/*
+ * @brief Data structure for the circular descriptor.
+ */
+typedef struct ia_css_circbuf_desc_s ia_css_circbuf_desc_t;
+struct ia_css_circbuf_desc_s {
+	u8 size;	/* the maximum number of elements*/
+	u8 step;   /* number of bytes per element */
+	u8 start;	/* index of the oldest element */
+	u8 end;	/* index at which to write the new element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT	(4 * sizeof(u8))
+
+static_assert(sizeof(struct ia_css_circbuf_desc_s) == SIZE_OF_IA_CSS_CIRCBUF_DESC_S_STRUCT);
+
+/*
+ * @brief Data structure for the circular buffer element.
+ */
+typedef struct ia_css_circbuf_elem_s ia_css_circbuf_elem_t;
+struct ia_css_circbuf_elem_s {
+	u32 val;	/* the value stored in the element */
+};
+
+#define SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT	(sizeof(u32))
+
+static_assert(sizeof(struct ia_css_circbuf_elem_s) == SIZE_OF_IA_CSS_CIRCBUF_ELEM_S_STRUCT);
+
+/****************************************************************
+ *
+ * Inline functions.
+ *
+ ****************************************************************/
+/*
+ * @brief Test if the circular buffer is empty.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return
+ *	- true when it is empty.
+ *	- false when it is not empty.
+ */
+static inline bool ia_css_circbuf_desc_is_empty(ia_css_circbuf_desc_t *cb_desc)
+{
+	return (cb_desc->end == cb_desc->start);
+}
+
+/*
+ * @brief Test if the circular buffer descriptor is full.
+ *
+ * @param cb_desc	The pointer to the circular buffer
+ *			descriptor.
+ *
+ * @return
+ *	- true when it is full.
+ *	- false when it is not full.
+ */
+static inline bool ia_css_circbuf_desc_is_full(ia_css_circbuf_desc_t *cb_desc)
+{
+	return ((cb_desc->end + 1) % cb_desc->size) == cb_desc->start;
+}
+
+/*
+ * @brief Get the offset between two positions in the circular buffer
+ * descriptor.
+ * Get the offset from the source position to the terminal position,
+ * along the direction in which the new elements come in.
+ *
+ * @param cb_desc	The pointer to the circular buffer descriptor.
+ * @param src_pos	The source position.
+ * @param dest_pos	The terminal position.
+ *
+ * @return the offset.
+ */
+static inline int ia_css_circbuf_desc_get_offset(ia_css_circbuf_desc_t *cb_desc,
+						 u32 src_pos, u32 dest_pos)
+{
+	int offset;
+
+	offset = (int)(dest_pos - src_pos);
+	offset += (offset < 0) ? cb_desc->size : 0;
+
+	return offset;
+}
+
+/*
+ * @brief Get the number of available elements.
+ *
+ * @param cb_desc The pointer to the circular buffer.
+ *
+ * @return The number of available elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_num_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	int num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (u32)num;
+}
+
+/*
+ * @brief Get the number of free elements.
+ *
+ * @param cb_desc The pointer to the circular buffer descriptor.
+ *
+ * @return: The number of free elements.
+ */
+static inline u32 ia_css_circbuf_desc_get_free_elems(ia_css_circbuf_desc_t *cb_desc)
+{
+	u32 num;
+
+	num = ia_css_circbuf_desc_get_offset(cb_desc,
+					     cb_desc->start,
+					     cb_desc->end);
+
+	return (cb_desc->size - num);
+}
+
 /*****************************************************************************
  * Queue Public Data Structures
  *****************************************************************************/
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d3818fe8be364..79a67b3c614eb 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -6,8 +6,6 @@
 
 #include "ia_css_queue.h"
 #include <math_support.h>
-#include <ia_css_circbuf.h>
-#include <ia_css_circbuf_desc.h>
 #include "queue_access.h"
 
 /*****************************************************************************
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
index 2591d157870ce..65835420a13c0 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.c
@@ -8,7 +8,6 @@
 
 #include "type_support.h"
 #include "queue_access.h"
-#include "ia_css_circbuf.h"
 #include "sp.h"
 #include "assert_support.h"
 
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index 776c6d6cb1fcc..93dae469cff9a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -11,7 +11,6 @@
 
 #include <type_support.h>
 #include <ia_css_queue_comm.h>
-#include <ia_css_circbuf.h>
 
 #define QUEUE_IGNORE_START_FLAG	0x0001
 #define QUEUE_IGNORE_END_FLAG	0x0002
diff --git a/drivers/staging/media/atomisp/pci/sh_css_internal.h b/drivers/staging/media/atomisp/pci/sh_css_internal.h
index ec68c16d42722..f08f918b361c4 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_internal.h
+++ b/drivers/staging/media/atomisp/pci/sh_css_internal.h
@@ -29,7 +29,7 @@
 #include "sh_css_defs.h"
 #include "sh_css_uds.h"
 #include "dma.h"	/* N_DMA_CHANNEL_ID */
-#include "ia_css_circbuf_comm.h" /* Circular buffer */
+#include "ia_css_queue_comm.h"
 #include "ia_css_frame_comm.h"
 #include "ia_css_3a.h"
 #include "ia_css_dvs.h"
-- 
2.43.0

