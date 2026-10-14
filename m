Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FFFA4F68CF
	for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 11:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791976364; cv=none; b=cAY5lKMYiEnE+3FfW9aXLIoVNg3Y0WvwBNTXiFrYKNbQnTzuq/bgKSwagzHDAMkHAsbz7KYr10MdiQnIJIBOYF4wZeXgKR8mLxatBeRvSYtIfH59H4/cYRf9zIqf4AZ9Z5aATj9sbDFHtAXoTJkP+eaKHbrtRXvUEVRK9sz0i3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791976364; c=relaxed/simple;
	bh=WsPoYvNP8WpkcCcQmdX28XMS45PV8roZIVPU07jnx1o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ldx4Fxsj4GR4GEKdzYcnL/8dBn2ufIbFkhB40bDxeXiYYL3BGRY7jbnthokniL4hMqFZIT6PRlVNsMihWyrJ6utfJLSI2EsWQXpfOggnQYOvDwGWuqKMS+uthuMb6/XzRAf2WsH0v+rlplcG+izVrLa0lu+dI0BWt29kRFrwQoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c1NVWpVQ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c1NVWpVQ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48bbb06e746so220161f8f.3
        for <linux-staging@lists.linux.dev>; Wed, 14 Oct 2026 04:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791976355; x=1792581155; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LuqpHePq2kMuoWT0ajy3bfjk9seqHr4XBw3HPOSt2jk=;
        b=c1NVWpVQhxGwVzN599xWf+GRMQUoOnFXu1fwXspLTFvzOur2jOGYyvbAsAXsIeEmq3
         dXDHO9PM5RAIJlahB50u9hHZxeqv99tct5FA+lJZeVQbpxjv1he0+p2XHqvaqMhDHJ82
         4iOQVOLYO17Jq5/ZJwCsAcOw3sfEXcjzHYqWdfdBatrFQWe2jgbkPziSfZ+CEQ36JO/K
         aX2udKxjsHAnUzpD/46xurdcQ8yanCpuoPNhGGvEhD5dNjC0YuCVryIfSCwgsyBxOhlu
         JyghhyY7zIy/xfKLf+Si5/Ve20Yo1xDGxdKd9U+pk5wYxq3Qrx8VvXP3Z8cUf78pzURP
         oFgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791976355; x=1792581155;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LuqpHePq2kMuoWT0ajy3bfjk9seqHr4XBw3HPOSt2jk=;
        b=PMrBhlAUWA/yShQjMqSZQiesVykaQdmz7yrD2J7cpzMaMos+f6FTO6pA/9Jv+bYgp6
         7zRKjaTshIbzcadXdpqgCY09a9nkBFXw4IrlRfeKB9TZORMvlZANlVr5W3dBLJM6Arwk
         qT+BO0FpxMWQys6GDSxRshaYtg1VrZi4FtWISBbh7ubyRldNpykOZCv6t7j4obnXwx5B
         BqbHCaMyichiyOvsdsIAOGt9LdXzkFatbxlgYN6OCUb+gCrDScho+fCLtN6n349zISRr
         xxQZjpdB3J0boKolAKjSDZQbWolju5sgtMsQU7VvBUeAyJL9Fr9FhGJfAp3oRvwPlxtO
         /1rQ==
X-Forwarded-Encrypted: i=1; AKwUvBzr/C+VzoGSTatQyCZia8SEz5PqsMlP6QAgh4vpcc/1zoAaDAy41j5o37qRT08aZWIwFmgIn3UvmAS7KFe5@lists.linux.dev
X-Gm-Message-State: AFq9FYIuE/59/dNavyuS7fA8ak5jmPUAJSAbDu5pUP4evfeKdMPBn9ax
	rIVgTVq2dIhl7mg60SQUtw5swQ6pzvcvwOt2/Fe53o6A0u0nhlTR92Rj
X-Gm-Gg: AYBFou33ahKlg64ij6CazRD1LOLt22SDVf8vDMaYdTOW2VTNhkKvRcqfFijPM0kKvp8
	3YUCzy2jwVdyho41EEB30V+wVcqtW9tHkorv1OZwz3t++LTI+bPJIJTSDpCBG1B2N0Ezf2hvcY8
	JKQfQzvtjMAhiLU6cJ0DXM2DcgL4rCw7RUXv+1Xi78PDbCte1mSXEiGZRikQ725vJOMfpVJP6Q1
	D37MYUIdWbtGx3AICQvsFetxPDV++DCeW/m9er8TS20JZZQdjrltYYbO/lch4VYaQAiMRZgKOTz
	PsYjQuj+BLLfFeKqX1hr7TT/DYf0OqcFE+McYYkf93+F2FEvpcCcuvfIUiBWhXrLe/QPFS+vVq5
	kXBOg8sPcX+JryNG750ZGRGnnX57/diVRmOnPIwxhU6+3XkGiXd8hQIkH5pPAjMTAx47PsvAKpm
	E8AKBYzaiRIYYd3lNbeKR4jkq0GglPDb2hVCxYuobyVz2RVuQ08wOHR+hcff8QkLQrKWkmYk4JU
	kuNojLZoDSVeFGwwqWhvA==
X-Received: by 2002:a05:6000:2601:b0:48c:69ba:77c7 with SMTP id ffacd0b85a97d-48dba77cc91mr32578074f8f.6.1791976355045;
        Wed, 14 Oct 2026 04:12:35 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48deeadc0b5sm1846481f8f.6.2026.10.14.04.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 04:12:34 -0700 (PDT)
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
Subject: [PATCH v2 2/4] media: atomisp: queue: remove unused local queue support
Date: Wed, 14 Oct 2026 11:12:11 +0000
Message-ID: <20261014111213.1967452-3-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261014111213.1967452-1-vladurares@gmail.com>
References: <20261014111213.1967452-1-vladurares@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

ia_css_queue_local_init() has no callers, so no queue is ever created
as local. ia_css_queue_uninit() only handles local queues and has no
callers either.

All queue handles are in the static css_queues in bufq.c, and
ia_css_bufq_init() sets up each of them with ia_css_queue_remote_init().
This happens in ia_css_start_sp(), before the host sets
host_sp_queues_initialized for the firmware, and css_queues is not
cleared afterwards. Before that, the old code would have taken the local
path with a NULL cb_local.desc and hit OP___assert(), so the handles do
not seem to be used before initialization.

With only remote queues left, the queue type no longer serves a purpose.
Remove the local queue code together with IA_CSS_QUEUE_TYPE_REMOTE, the
type field and the type checks.

struct ia_css_queue appears to be host-only: it is not copied to SP or
ISP memory, and the firmware uses struct host_sp_queues, whose addresses
the handle stores. Removing the union member keeps the struct size on
32-bit and reduces it on 64-bit, where cb_local held two pointers.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../runtime/queue/interface/ia_css_queue.h    |  29 --
 .../queue/interface/ia_css_queue_comm.h       |   5 -
 .../atomisp/pci/runtime/queue/src/queue.c     | 411 ++++++------------
 .../pci/runtime/queue/src/queue_access.h      |   2 -
 4 files changed, 139 insertions(+), 308 deletions(-)

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
index 0bed6425a07f0..7cd788e2b16bd 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/interface/ia_css_queue_comm.h
@@ -19,11 +19,6 @@
 #define IA_CSS_QUEUE_LOC_SP   1
 #define IA_CSS_QUEUE_LOC_ISP  2
 
-/* Queue type specifier */
-/* Avoiding enums to save space */
-#define IA_CSS_QUEUE_TYPE_LOCAL  0
-#define IA_CSS_QUEUE_TYPE_REMOTE 1
-
 /* for DDR Allocated queues,
 allocate minimum these many elements.
 DDR->SP' DMEM DMA transfer needs 32byte aligned address.
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..d3818fe8be364 100644
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
@@ -39,9 +21,6 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 		return -EINVAL;
 	}
 
-	/* Mark the queue as remote*/
-	qhandle->type = IA_CSS_QUEUE_TYPE_REMOTE;
-
 	/* Copy over the local queue descriptor*/
 	qhandle->location = desc->location;
 	qhandle->proc_id = desc->proc_id;
@@ -56,337 +35,225 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
 	return 0;
 }
 
-int ia_css_queue_uninit(ia_css_queue_t *qhandle)
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
 	if (!qhandle)
 		return -EINVAL;
 
-	/* Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Local queues are created. Destroy it*/
-		ia_css_circbuf_destroy(&qhandle->desc.cb_local);
-	}
+	/* a. Load the queue cb_desc from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
 
-	return 0;
-}
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
-{
-	int error;
+	cb_elem.val = item;
 
-	if (!qhandle)
-		return -EINVAL;
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error != 0)
+		return error;
 
-	/* 1. Load the required queue object */
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
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		/* a. Load the queue cb_desc from remote */
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_full(&cb_desc))
-			return -ENOBUFS;
-
-		cb_elem.val = item;
-
-		error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
-		if (error != 0)
-			return error;
-
-		cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
-
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-	}
+	cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
+
+	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
 
 	return 0;
 }
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
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
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		if (ia_css_circbuf_desc_is_empty(&cb_desc))
-			return -ENODATA;
-
-		error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*item = cb_elem.val;
-
-		cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
-
-		/* c. Store the queue object */
-		/* Set only fields requiring update with
-		 * valid value. Avoids unnecessary calls
-		 * to load/store functions
-		 */
-		ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
-		error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_empty(&cb_desc))
+		return -ENODATA;
+
+	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
+	if (error != 0)
+		return error;
+
+	*item = cb_elem.val;
+
+	cb_desc.start = (cb_desc.start + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_END_STEP_FLAGS;
+	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
 	return 0;
 }
 
 int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
 	if ((!qhandle) || (!is_full))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
-		return 0;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
 
-	return -EINVAL;
+	/* b. Operate on the queue */
+	*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
-		return 0;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
 
-	return -EINVAL;
+	return 0;
 }
 
 int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		return 0;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
 
-	return -EINVAL;
+	return 0;
 }
 
 int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	u32 num_elems;
 	int error;
 
 	if ((!qhandle) || (!element))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
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
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		ia_css_circbuf_elem_t cb_elem;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error =  ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Check if offset is valid */
-		num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
-		if (offset > num_elems)
-			return -EINVAL;
-
-		offset = (cb_desc.start + offset) % cb_desc.size;
-		error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
-		if (error != 0)
-			return error;
-
-		*element = cb_elem.val;
-		return 0;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* Check if offset is valid */
+	num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+	if (offset > num_elems)
+		return -EINVAL;
+
+	offset = (cb_desc.start + offset) % cb_desc.size;
+	error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
+	if (error != 0)
+		return error;
+
+	*element = cb_elem.val;
 
-	return -EINVAL;
+	return 0;
 }
 
 int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
 	if ((!qhandle) || (!is_empty))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
-		return 0;
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* b. Operate on the queue */
-		*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
-		return 0;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
 
-	return -EINVAL;
+	/* b. Operate on the queue */
+	*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
 	int error;
 
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Return maximum usable capacity */
-		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-	} else if (qhandle->type == IA_CSS_QUEUE_TYPE_REMOTE) {
-		/* a. Load the queue from remote */
-		ia_css_circbuf_desc_t cb_desc;
-		u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
-
-		QUEUE_CB_DESC_INIT(&cb_desc);
-
-		error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
-		if (error != 0)
-			return error;
-
-		/* Return maximum usable capacity */
-		*size = cb_desc.size;
-	}
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	/* Return maximum usable capacity */
+	*size = cb_desc.size;
 
 	return 0;
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8fe6f8..776c6d6cb1fcc 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -43,11 +43,9 @@
 	} while (0)
 
 struct ia_css_queue {
-	u8 type;        /* Specify remote/local type of access */
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

