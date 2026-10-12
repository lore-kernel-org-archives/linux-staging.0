Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D523CF962
	for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 23:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791846559; cv=none; b=NGLEXpRO/Zha+7REd2r+x4ORZ5VAHO80xCFGH3FxVg3x3q+bPgf+517EYImXGYlNBX+dF58Jwml+F94gDVe7a40Cos3I6nwREbT3R4XAIy/nTCcnv/27KOiWMizCqsd3mp9gseJ5sQ4+22km3MLtKtxT4XCfSIhFRbmW+drr2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791846559; c=relaxed/simple;
	bh=dg4T643caldg0HJI9k4QGKm68yJjVsxftMnodTOAOmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VruA0RuMAPYA/aGrCXIAoK/BmWCeGJDpZ09y9LfWcUaOCfMp1au6xpg1RUgQEq/KeTvXvOPgqzRMVGiL8eogzEbtC21+l9aT7uzRrS7GcOswAzrWOq0A/J+lK5eJoSXeu3y6WSrWaZtptC/V/fV08f9mfJUhO47cY8tQtqU60Jc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j0avVSMd; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j0avVSMd"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b03f23305so1963837f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Oct 2026 16:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791846556; x=1792451356; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7Lr2yPQEg35Ki75NW2RfP4XR1co/2vCH1ATjNGCH8eA=;
        b=j0avVSMdLmJx2+d9XJd7BMLgcqBLRXtewd3vBrrXmgIrrYDUiYoFGHKHHZYPVETvdk
         jMRGNIlgv39E2+fpdwUC4+BegqIZhT+K0Gknka7ttaxeGRT0UrKpJlVVssUpRbp05Eyg
         8EBfzvZzuAtpzZuI8f0QRgv/kiRvhLPEGWM3A/usWayX+zEYPGBqkMegQXskPqe+YSqd
         X90jmaAEyTV1YAYyWX+MbpnrhT85tR2g+fljlgiid0Iz6zF/5AaLxAeHXj7VBZDrEe7X
         O9RmwrR6FRyZa/qNslUtGvunpj5NUcT7cHXEE/bQyqYRd3G2Ay6MY1BpcpwcdbgpE0gH
         pcvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791846556; x=1792451356;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7Lr2yPQEg35Ki75NW2RfP4XR1co/2vCH1ATjNGCH8eA=;
        b=Lv2ONXzxyU8zNtIGuEZvFaptyy/wgGWPLCUxXh5d33mPoyxUrPLvtsX4Jnglf6OItz
         zPvvG0Qj0Pgp63Nn0/Ew5NmAAmvh0DSwauMz7PtpqR8UMmbH60NqfkQIz/OIMp6aO6lT
         CJ62aehpN7vKTv7IaWikdot+M7X2xib9X6uSJ/KcsY3/O2vE6QyUBQ42g7Va7+An799p
         lbMKMyx7kCD81ACPf5HiBNIZD51CFRvXoWExRAjVe0gckCf6HIWjA/mzdtUAUPkpC7Vw
         WKi5LvQmWR0hn2ORQnZBv4yGuoiOJ8f7sSQG7QwqiieEabuHldv25S3/Emnt1rC0ZqMm
         de1g==
X-Forwarded-Encrypted: i=1; AKwUvBzhdi7cMcBwx7PU7Dnbak2UHwTSP3b7g0JZi2eOs7bnbB8KxpxNP/Qci3HIQxhKFfK0IRL3FOiOUNhN7heX@lists.linux.dev
X-Gm-Message-State: AFq9FYLaoSnOTZvF6eJ+sEKSGk4WaheHhhbvNhjG79ZYUUGY8XNFDgFw
	W+qLocPNOdNO2jgAHv974L5wtMM+Ffewh24gM09ybW5pAfUdTDKPbzY5
X-Gm-Gg: AYBFou2vXtl4PeOcXSYjTj4MLGLfzPcxN3N/AcHqzp+F3nSMTBLAiiMz5rWFPJOukDZ
	TZbqfUEbdocQkKoY2UEP/XFd0g6lDu1vJN+MrPNi/an+8CZsExecCQswWp6QEME+H7M1RcPmjD7
	k295LsoMYIX9r6aTP8umMcEFPcxu/km14td8Txegqbs2dhr2Ek8LEHzAQYY2IusgJnkaAI69gwJ
	qWnn8sUGHTF/311kArsw+BL4UOq2p1X+4kxdXc8JPJwC8ygdOJbFH4GjPLdoSWrodcL8ZcHZn5z
	Q5wsc7MXj7OOHK4G7AAcmmN+o4rkBm8HCjCUPJYnBlF3USwu91fbrWTkoj427kTJZFAzSBpkI6j
	Q/PXFeJiSPz2oMR2fT1duWFWVkqO1V5dOcYFQ5mFJ/jFntPduaeAGDcYbRW7lsEN2yLVJ08jaAR
	N9VUJWR64KaODN/Qqqdj1zxYoQUFpRVDF2pIl+CgFbAG0KYML0kDc17DfTUd/H08MNdfZ2uY+a+
	xSI+NOwT47osftxL88X0w==
X-Received: by 2002:a05:6000:1788:b0:488:8a5d:ffbe with SMTP id ffacd0b85a97d-48dbaaed914mr22296198f8f.33.1791846556209;
        Mon, 12 Oct 2026 16:09:16 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0aaa9f9sm1873928f8f.19.2026.10.12.16.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 16:09:15 -0700 (PDT)
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
Subject: [PATCH 2/4] media: atomisp: queue: remove unused local queue support
Date: Mon, 12 Oct 2026 23:07:51 +0000
Message-ID: <20261012230754.1914517-3-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012230754.1914517-1-vladurares@gmail.com>
References: <20261012230754.1914517-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ia_css_queue_local_init() has no callers, so IA_CSS_QUEUE_TYPE_LOCAL
is never set and every local queue branch in queue.c is unreachable.
ia_css_queue_uninit() only tore down local queues and has no callers
either.

Remove both functions, the local branches, struct ia_css_queue_local
and the local member of the struct ia_css_queue union. Only remote
queues, shared with the SP firmware, are used by the driver.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../runtime/queue/interface/ia_css_queue.h    |  29 -----
 .../queue/interface/ia_css_queue_comm.h       |   1 -
 .../atomisp/pci/runtime/queue/src/queue.c     | 110 ++----------------
 .../pci/runtime/queue/src/queue_access.h      |   3 +-
 4 files changed, 9 insertions(+), 134 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
index c097d912d87f8..87207c355e8e2 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue.h
@@ -13,32 +13,12 @@
 #include "ia_css_queue_comm.h"
 #include "../src/queue_access.h"
 
-/* Local Queue object descriptor */
-struct ia_css_queue_local {
-	ia_css_circbuf_desc_t *cb_desc; /*Circbuf desc for local queues*/
-	ia_css_circbuf_elem_t *cb_elems; /*Circbuf elements*/
-};
-
-typedef struct ia_css_queue_local ia_css_queue_local_t;
-
 /* Handle for queue object*/
 typedef struct ia_css_queue ia_css_queue_t;
 
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-/* @brief Initialize a local queue instance.
- *
- * @param[out] qhandle. Handle to queue instance for use with API
- * @param[in]  desc.   Descriptor with queue properties filled-in
- * @return     0      - Successful init of local queue instance.
- * @return     -EINVAL - Invalid argument.
- *
- */
-int ia_css_queue_local_init(
-    ia_css_queue_t *qhandle,
-    ia_css_queue_local_t *desc);
-
 /* @brief Initialize a remote queue instance
  *
  * @param[out] qhandle. Handle to queue instance for use with API
@@ -50,15 +30,6 @@ int ia_css_queue_remote_init(
     ia_css_queue_t *qhandle,
     ia_css_queue_remote_t *desc);
 
-/* @brief Uninitialize a queue instance
- *
- * @param[in]  qhandle. Handle to queue instance
- * @return     0 - Successful uninit.
- *
- */
-int ia_css_queue_uninit(
-    ia_css_queue_t *qhandle);
-
 /* @brief Enqueue an item in the queue instance
  *
  * @param[in]  qhandle. Handle to queue instance
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
index 0bed6425a07f0..14f2c8de3b910 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -21,7 +21,6 @@
 
 /* Queue type specifier */
 /* Avoiding enums to save space */
-#define IA_CSS_QUEUE_TYPE_LOCAL  0
 #define IA_CSS_QUEUE_TYPE_REMOTE 1
 
 /* for DDR Allocated queues,
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..e4dacc812931d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -13,24 +13,6 @@
 /*****************************************************************************
  * Queue Public APIs
  *****************************************************************************/
-int ia_css_queue_local_init(ia_css_queue_t *qhandle, ia_css_queue_local_t *desc)
-{
-	if (NULL == qhandle || NULL == desc
-	    || NULL == desc->cb_elems || NULL == desc->cb_desc) {
-		/* Invalid parameters, return error*/
-		return -EINVAL;
-	}
-
-	/* Mark the queue as Local */
-	qhandle->type = IA_CSS_QUEUE_TYPE_LOCAL;
-
-	/* Create a local circular buffer queue*/
-	ia_css_circbuf_create(&qhandle->desc.cb_local,
-			      desc->cb_elems,
-			      desc->cb_desc);
-
-	return 0;
-}
 
 int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *desc)
 {
@@ -56,20 +38,6 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 	return 0;
 }
 
-int ia_css_queue_uninit(ia_css_queue_t *qhandle)
-{
-	if (!qhandle)
-		return -EINVAL;
-
-	/* Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Local queues are created. Destroy it*/
-		ia_css_circbuf_destroy(&qhandle->desc.cb_local);
-	}
-
-	return 0;
-}
-
 int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
 	int error;
@@ -78,18 +46,7 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_full(&qhandle->desc.cb_local)) {
-			/* Cannot push the element. Return*/
-			return -ENOBUFS;
-		}
-
-		/* Push the element*/
-		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		ia_css_circbuf_desc_t cb_desc;
 		ia_css_circbuf_elem_t cb_elem;
 		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -135,17 +92,7 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		if (ia_css_circbuf_is_empty(&qhandle->desc.cb_local)) {
-			/* Nothing to pop. Return empty queue*/
-			return -ENODATA;
-		}
-
-		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		ia_css_circbuf_elem_t cb_elem;
@@ -190,13 +137,7 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -222,13 +163,7 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -254,13 +189,7 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -287,18 +216,7 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		ia_css_circbuf_elem_t cb_elem;
@@ -335,13 +253,7 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -367,13 +279,7 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 		return -EINVAL;
 
 	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Return maximum usable capacity */
-		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
+	if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
 		/* a. Load the queue from remote */
 		ia_css_circbuf_desc_t cb_desc;
 		u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8fe6f8..5319818872626 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -43,11 +43,10 @@
 	} while (0)
 
 struct ia_css_queue {
-	u8 type;        /* Specify remote/local type of access */
+	u8 type;        /* Specify remote type of access */
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

