Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102645;
	b=HTOfqbBXdq07a4JKjsfiTA8CelpNtz208Vm52nYziRIBF5IrH8w5TO7ELlk6yLRRmo/c
	 ySujSIC/wy6o2qDQqzqKFz5j9k/BkrKebusYcN8JUVFrp3k6gpVZVnSAORsu/rGcDKSNP
	 W/nmSilrvDey/24RIrj0foacGfkYbN0BzCan3Kn//Hv5nfm3g7mPPGh61ihzivEzwKX0p
	 EVQNz1vC8uxObwy3WBp9BEexZeUyYHjEgJUvCC+t6wgLOdvvufHvEzLwswAd0dAd2lmT0
	 xLDpyDX7nEY1M58BRRs28HrPUUZec+IHdKQRClV/CTruBU6V6H0YRoakxtolDEv6BDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ts0/zwc9SVVdth+aBTLO4VyR2FemYoLRwXB1GWNtDBk=;
	b=zjJT19LVYYcUvzbXaFJW4ZYsrvs1hHrkeaghQzMeUDVdWzhZwooO9m+KH+CtcXNLmIz0
	 MKSxQLOpQd0YYoRBuDm0kG3TGV1H+KOa+H/XQxacEQ/eC59toKZ4NI34AIWc0q2P/KXgv
	 blHQYzDGlp2xCTgVHqIdGzF6LPfv2lCHGfULorFjSsHKARoc8BOFWn3WroozVDvoU0zeq
	 yvdOs9UAjyqI4Lz6pt/WhQDkCqvuMCo0a2rXAvV62lws4lIGefAE1sB2N4H8XGVbeZcVp
	 s7GuqrbtGGAhbdmRXNsvY8EmxGuNc1jjmeyVeis+Ud8RCKGitHjgWamxUhHdSuZCCDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQ3yTfjc;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 868E6606C957
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 12:04:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 868E6606C957
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=VQ3yTfjc
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48e4831c028so2367012f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102643; x=1793707443; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ts0/zwc9SVVdth+aBTLO4VyR2FemYoLRwXB1GWNtDBk=;
        b=VQ3yTfjcA6gWZx69z5CLPzzcSWfdpqxzy0Gs/0yX8q+ahCmywN0i/ImPO3j3Kl/bRN
         oYsN7egTzeToTnJObw6sD4TRtS6D3WQcjGHy3S8xt9bxn/dd3N88twy7LHT8+DmLh6/5
         uEa0kdsVaFqK6VukMCL7oFCrSaCotLDHKJpReMZySHOSUvQ+Nmc28UPoISaRlW4R8Ut/
         sRMgbvPrTHSf6BDDmK2fRF+KvGJqGUA/CTp7b5sud+aaPY0MBR9GA1bvGtVM6q83nliw
         Us1I2KZwQvpeDgXQUk9/y6lqXuNt/KkzWKhD+lyxiQzoyY3MNJxjJUVBTFt5jQ9vZxSw
         Er1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102643; x=1793707443;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ts0/zwc9SVVdth+aBTLO4VyR2FemYoLRwXB1GWNtDBk=;
        b=rCKx/hQ0uFbKpqc/LAuCYxQLrwIoexyl7klPNkrY+knBVMbeuCv+zucNX+U4zN+FJF
         wjB37hzFegFpcYLNYh0xWW8AMyAXcXID9/Bs1wUrGVWBRVTG6SMrBLeWpxeuWYX6zZit
         P7nCJjUVuiW22RUhB3iEIBLT4m9LphDyH6gfP0g8GtHNFAk8Wa6us/771nLbMYdma/px
         TtqEEjGkOGWdVyygajtct/akzj3bkJQ8tHfXBzNJhq6wzGoR0YPeWQbrh9QdGfaMfP4P
         dlr3vexAoOaEdIbqFJQXrKy69LPMm8xV6YijBIOth6MDwQ0/n9UVCDUOk67ynDRAHEcj
         L/CA==
X-Forwarded-Encrypted: i=1; AKwUvBzz/xRKy8a/lnyAY3jCh/ugOMugb131RLhML/6hd9cjJVlJ6/f/fFPRNvWQjLlEkff6MKyxIYrZl8h4emyY@lists.linux.dev
X-Gm-Message-State: AFq9FYKdNSXD4/mk3+m/4yNBNAwP6ZXbjYTG5uJnQmqZLLyFasol8Tlq
	RPIK3kF2XBvgtO1gvaUIZyt9qGXGXhbBCrvn+WM3yJ5kidE0eDb1/md7
X-Gm-Gg: AYBFou2mUy4YW14sfUBzJcAPLlJALnhpQR0YNilgukQAWgySXT+4dotx22iS86se2gp
	w49KNaKU0H321pALH/+PkBFJ9ilX+r1moAiBEfCahFC/rTWE/1u7cmrjSaejDAVkT/HCGNOFKyI
	FTJwtdvYazZkP7yRyKFLkYiNB+aJyCsxB5DPSwqap9UKYETRxRlhTRFQHbG1f9PTl3QH6mPYT0x
	vXhq2zxcq72R6UCL5y18T7fDI6qSx+WjsD7fQ7478aQlsXQhFNwCyI5mD5CyVsUhzR5VdL5sBlx
	huWb/f0rRm9XmvfGwc6q7dznlJvexM14W4JvoFnTXGSq/Y+rqy5OLT5/JgFndg3YSv5ZaT828It
	ChCR8DNKficAoWSp7y5rrFIF7QgmtSMxnVqoce5ys8WSJlPRyEpNiN6rDYzVSV823KmKMFMcA9Z
	GcPJyZoPrsQ/nTwi7iyjTkMIoBVi7xy5dectB/TBAsJ9SATcoiPkdSP2WsXuSVHROJxnCo1UpEM
	rBd/4+F8plpyoU/xPw28glbOh5QB6CvNZraijG5oUm83uvUVKqDnpan4nYiKASMroN30bdx+EvV
	+tM=
X-Received: by 2002:a05:6000:41d9:b0:48a:f354:aefe with SMTP id ffacd0b85a97d-48e3eb7bb5amr20344053f8f.39.1793102641341;
        Tue, 27 Oct 2026 05:04:01 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.04.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:04:00 -0700 (PDT)
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
Subject: [PATCH v3 3/5] media: atomisp: queue: remove unused local queue support
Date: Tue, 27 Oct 2026 12:03:38 +0000
Message-ID: <20261027120341.2305533-4-vladurares@gmail.com>
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
 .../runtime/queue/interface/ia_css_queue.h    |  29 ---
 .../queue/interface/ia_css_queue_comm.h       |   5 -
 .../atomisp/pci/runtime/queue/src/queue.c     | 206 +-----------------
 .../pci/runtime/queue/src/queue_access.h      |   2 -
 4 files changed, 8 insertions(+), 234 deletions(-)

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
index cfd7473720d1f..d3818fe8be364 100644
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
@@ -56,21 +35,7 @@ int ia_css_queue_remote_init(ia_css_queue_t *qhandle, ia_css_queue_remote_t *des
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
-static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -112,30 +77,7 @@ static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 	return 0;
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
-{
-	if (!qhandle)
-		return -EINVAL;
-
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
-		return 0;
-	}
-
-	return ia_css_queue_enqueue_remote(qhandle, item);
-}
-
-static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -177,29 +119,7 @@ static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
 	return 0;
 }
 
-int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
-{
-	if (!qhandle || NULL == item)
-		return -EINVAL;
-
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
-		return 0;
-	}
-
-	return ia_css_queue_dequeue_remote(qhandle, item);
-}
-
-static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -220,24 +140,7 @@ static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
 	return 0;
 }
 
-int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
-{
-	if ((!qhandle) || (!is_full))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_full_remote(qhandle, is_full);
-}
-
-static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -258,24 +161,7 @@ static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_free_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -296,24 +182,7 @@ static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t
 	return 0;
 }
 
-int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_used_space_remote(qhandle, size);
-}
-
-static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	ia_css_circbuf_elem_t cb_elem;
@@ -346,31 +215,7 @@ static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_
 	return 0;
 }
 
-int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
-{
-	u32 num_elems;
-
-	if ((!qhandle) || (!element))
-		return -EINVAL;
-
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
-	}
-
-	return ia_css_queue_peek_remote(qhandle, offset, element);
-}
-
-static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
@@ -391,24 +236,7 @@ static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
 	return 0;
 }
 
-int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
-{
-	if ((!qhandle) || (!is_empty))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_is_empty_remote(qhandle, is_empty);
-}
-
-static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
 	ia_css_circbuf_desc_t cb_desc;
 	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
@@ -429,21 +257,3 @@ static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
 
 	return 0;
 }
-
-int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
-{
-	if ((!qhandle) || (!size))
-		return -EINVAL;
-
-	/* 1. Load the required queue object */
-	if (qhandle->type == IA_CSS_QUEUE_TYPE_LOCAL) {
-		/* Directly de-ref the object and
-		 * operate on the queue
-		 */
-		/* Return maximum usable capacity */
-		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
-		return 0;
-	}
-
-	return ia_css_queue_get_size_remote(qhandle, size);
-}
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

