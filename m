Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793142513;
	b=riSbduLdi44FuD+Ded7CKppmWI0r/ZUiG4QtgEjc6mP7F9ZU4C68Rw0/Cc7CMIYX0L+U
	 taYuOUGyHsl38HOLf/Kg9J2V89Aj0Q3JXsXq4dIP4HzkFdOnyfZM+I9+DXRnO1k9hRe0p
	 nYFuvxdnByfbfDQhHGciSQQ/LzfnvC40sJSeV/QfH3n7fM6wP3ByB8P0KQcCpfhhCYoez
	 HSAtHfzw7++xTdEVMt2Em+/ZSM5uRv5jj2VcEKLkRyKwkqzdzhFF06Z08NHVXkzFnRf2i
	 kn6laud+fUJYjlKiI2DReI6JK36BToG90odKsxRbRwt3/ImtAUD7z0BZ7Y5EbHcYjHw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793142513;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
	b=PQHVuI94EkwO+LmjFEYkpQQLM+Ts5f1tBFn2+Y+GgZQdH3V5GXsWMo1Cgfd+9TKDTbmy
	 /TwiogxKqKl5YFm+mr7XgdJhhy+g4K34Ol5A+1gAs+0WRx2MuOx1n0s2YBuYhrdjDOTjE
	 nhX3+lzosX7Tp1kywMAnB4xSNBrpDWiYvxqGj73oRzCWRfUEzi04qRCoSpuGmM9ffPoAm
	 CJ7ZtMQ9oI2+XAAB81IxaSosSELlvBf85qELwKuqrWFpgPK8vtfMk7a02yc5dZst0HZ00
	 VIZX8DNqI118vOMsLH9bRJXb/ckoydGtQ3qIFKCvsotVOld/CIc9jBbnLUCnhGK+BAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTwu8PEs;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F6C6606A332
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 23:08:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2F6C6606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fTwu8PEs
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so2805925e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 16:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793142511; x=1793747311; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=fTwu8PEs4uzWWUX8JhXNIOV8nuoheG+oxBt/sRKuu1b0pp3K3Z0mm2jQ//EzxF4d0k
         MQ/Ydi3dE1PezxiSgpK8fPcRe0/N/+HD7nio9rYKrc6GxCm/unsIkybjvydgVDteM/vF
         iW0x4GTpxo+0WmRelFXK3esjxbBU8wH8Gkalc45GSRPA00wh4EbgF49ojF2AGZY8aFCN
         bQ0JGXfIcHnFUcthOlomt7CN1VzEkj9iC2EvtL6lwllwYsqlAY95g4J6h+Lo50Q+xmrY
         McEn3Ah5dILoOu//c5Z39b+X/0XAvdo8bMOolSppokgICLVqhOIEXQYXiQa6JlwTG+s4
         snoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793142511; x=1793747311;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ykc8ocMFfmIqIKZHnq3IoPM9xwtWxFOdLypt+51AUbY=;
        b=ZrKL/IZxtaI+PAkn/CBoKyb/MoyppSAK9MXZvvc75dIBb72eyfBJn940szr8HL5Czj
         3i87in5WSpIjIuUnIwAbv4tXN5ivnvNjXyzUAdXNvOGrEBXA/UZ+PVmhjRNyzwECChWB
         PqmP4FVkIQIenj4S3X45mKLCoSGYWAyZKUgCbpSD7G3xZMOWsOiIqZIbSdRQasBNwuTB
         d/gvqANHabQXMWy8cNJt0HxwH9dX8ly1cxxIg4yiDSy8rQdHvMrR28wjXa0y+kjjFKLS
         lL0iWnmU8w4Lv65Ffpe5/XgYSAZwo2AHpz/CboeOqTR+mf09Ybxxl66oB7eLKFxEuquV
         RFTw==
X-Forwarded-Encrypted: i=1; AKwUvBzbL2LkgVIuLmO8Qcjpb1Z5qsHvGw9uHA+Xr216y1ajqnhNq1LgL85qWkvJ4DVj0eXHT7BC2196s4NpLFFn@lists.linux.dev
X-Gm-Message-State: AFq9FYI+xfD1KM6qqEhV2htZF/SSS6qXpLrRg6pPwqwjvpj7imqDn0Wv
	9HB++CcjxgzvFKwbCy0KiW3fZG6ZsSHeLcyJycJe0zlNiskBz3HpRkED
X-Gm-Gg: AYBFou2EarY5iP2aQeMZ0AxHKIfXc94ekC8Zs13+rRiAiGtN//wC+cKiAvoIf1yyNSk
	tnDLYa/f217fK0uS44MtV+AwTapDHXrFnTG2dRy+jAx4/ssUOMCl0hs1cji9N/HrpzP8SYE+uHh
	hPr0Lybocpo9OxaCT5P72cD4IqDnSyUH9UgnY7+xVfLMaB7fEu3U40eVIoZZk1S3k15HahWLcgU
	ofe8Agu6AkZ743viuklAXcTYIpB7/SoMyJUKYs3OXTh0fwoeM1a7nhUTRfOk7kLFFlemA9CGqvu
	VhoLzSpb+t3yw2wu4iahGPgkY2Pep54O/XAL2anyJOZgGg92cgVaq+HI9rU+G3YxF9MgE8+Rafz
	LOjiBJm+gM3+Us4EGRGg8JWffI+QnxVAXAVBDdbfo4M4DxI2j71T2GIa3AOB6zsFidnb5fuptb7
	pgPIQuB3Cx5Az7cEWTwu5ssigYBMlNXSgE7O0KqmHti2X9DRMZ1Aroc7NGdKGGyvMfSQ5XHct/z
	er2DoH1fUFOEeNNhp55qV3/KVPDcjDw323525x9I6SlbRNVFgdt6V2U/8dxl0opDTVLlc6KByIA
	sWSK7KasCrVHx1WpYWW5oCSb
X-Received: by 2002:a05:600c:8b78:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4a9672fa52cmr8085195e9.27.1793142510534;
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a97cebf858sm3407595e9.12.2026.10.27.16.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:08:30 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v4 2/5] media: atomisp: queue: move remote queue handling into helpers
Date: Tue, 27 Oct 2026 23:08:04 +0000
Message-ID: <20261027230807.2407261-3-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261027230807.2407261-1-vladurares@gmail.com>
References: <20261027230807.2407261-1-vladurares@gmail.com>
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

Move the remote queue branch of every queue operation into its own
static helper, written the way the function is meant to look once the
unused local queue support is gone, and call it from the existing
function after the local branch.

While at it, tidy up the moved code: drop the redundant parentheses
and '!= 0' comparisons, use !ptr instead of comparing to NULL, and
return the result of the final ia_css_queue_store() call directly.

This prepares for removing the local queue support in the next patch
and keeps that change easy to review. No functional change intended.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 402 ++++++++++--------
 1 file changed, 226 insertions(+), 176 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..4212c113da41a 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -70,10 +70,46 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
 	return 0;
 }
 
-int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+static int ia_css_queue_enqueue_remote(ia_css_queue_t *qhandle, uint32_t item)
 {
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
 	int error;
 
+	if (!qhandle)
+		return -EINVAL;
+
+	/* a. Load the queue cb_desc from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
+
+	cb_elem.val = item;
+
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error)
+		return error;
+
+	cb_desc.end = (cb_desc.end + 1) % cb_desc.size;
+
+	/* c. Store the queue object */
+	/* Set only fields requiring update with
+	 * valid value. Avoids unnecessary calls
+	 * to load/store functions
+	 */
+	ignore_desc_flags = QUEUE_IGNORE_SIZE_START_STEP_FLAGS;
+
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+}
+
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+{
 	if (!qhandle)
 		return -EINVAL;
 
@@ -89,48 +125,53 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
 		/* Push the element*/
 		ia_css_circbuf_push(&qhandle->desc.cb_local, item);
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
+		return 0;
 	}
 
-	return 0;
+	return ia_css_queue_enqueue_remote(qhandle, item);
+}
+
+static int ia_css_queue_dequeue_remote(ia_css_queue_t *qhandle, uint32_t *item)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !item)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_empty(&cb_desc))
+		return -ENODATA;
+
+	error = ia_css_queue_item_load(qhandle, cb_desc.start, &cb_elem);
+	if (error)
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
+
+	return ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
 }
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
-	int error;
-
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
@@ -145,47 +186,35 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 		}
 
 		*item = ia_css_circbuf_pop(&qhandle->desc.cb_local);
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
+		return 0;
 	}
+
+	return ia_css_queue_dequeue_remote(qhandle, item);
+}
+
+static int ia_css_queue_is_full_remote(ia_css_queue_t *qhandle, bool *is_full)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !is_full)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_full = ia_css_circbuf_desc_is_full(&cb_desc);
+
 	return 0;
 }
 
 int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 {
-	int error;
-
 	if ((!qhandle) || (!is_full))
 		return -EINVAL;
 
@@ -196,28 +225,34 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
 		 */
 		*is_full = ia_css_circbuf_is_full(&qhandle->desc.cb_local);
 		return 0;
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
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_full_remote(qhandle, is_full);
+}
+
+static int ia_css_queue_get_free_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_free_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -228,28 +263,34 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_free_elems(&qhandle->desc.cb_local);
 		return 0;
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
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_free_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_get_used_space_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*size = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -260,28 +301,47 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		*size = ia_css_circbuf_get_num_elems(&qhandle->desc.cb_local);
 		return 0;
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
 	}
 
-	return -EINVAL;
+	return ia_css_queue_get_used_space_remote(qhandle, size);
+}
+
+static int ia_css_queue_peek_remote(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	ia_css_circbuf_elem_t cb_elem;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	u32 num_elems;
+	int error;
+
+	if (!qhandle || !element)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* Check if offset is valid */
+	num_elems = ia_css_circbuf_desc_get_num_elems(&cb_desc);
+	if (offset > num_elems)
+		return -EINVAL;
+
+	offset = (cb_desc.start + offset) % cb_desc.size;
+	error = ia_css_queue_item_load(qhandle, (uint8_t)offset, &cb_elem);
+	if (error)
+		return error;
+
+	*element = cb_elem.val;
+
+	return 0;
 }
 
 int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	u32 num_elems;
-	int error;
 
 	if ((!qhandle) || (!element))
 		return -EINVAL;
@@ -298,39 +358,34 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 
 		*element = ia_css_circbuf_peek_from_start(&qhandle->desc.cb_local, (int)offset);
 		return 0;
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
 	}
 
-	return -EINVAL;
+	return ia_css_queue_peek_remote(qhandle, offset, element);
+}
+
+static int ia_css_queue_is_empty_remote(ia_css_queue_t *qhandle, bool *is_empty)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_STEP_FLAG;
+	int error;
+
+	if (!qhandle || !is_empty)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* b. Operate on the queue */
+	*is_empty = ia_css_circbuf_desc_is_empty(&cb_desc);
+
+	return 0;
 }
 
 int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 {
-	int error;
-
 	if ((!qhandle) || (!is_empty))
 		return -EINVAL;
 
@@ -341,28 +396,35 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
 		 */
 		*is_empty = ia_css_circbuf_is_empty(&qhandle->desc.cb_local);
 		return 0;
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
 	}
 
-	return -EINVAL;
+	return ia_css_queue_is_empty_remote(qhandle, is_empty);
+}
+
+static int ia_css_queue_get_size_remote(ia_css_queue_t *qhandle, uint32_t *size)
+{
+	ia_css_circbuf_desc_t cb_desc;
+	u32 ignore_desc_flags = QUEUE_IGNORE_START_END_STEP_FLAGS;
+	int error;
+
+	if (!qhandle || !size)
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error)
+		return error;
+
+	/* Return maximum usable capacity */
+	*size = cb_desc.size;
+
+	return 0;
 }
 
 int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 {
-	int error;
-
 	if ((!qhandle) || (!size))
 		return -EINVAL;
 
@@ -373,20 +435,8 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
 		 */
 		/* Return maximum usable capacity */
 		*size = ia_css_circbuf_get_size(&qhandle->desc.cb_local);
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
+		return 0;
 	}
 
-	return 0;
+	return ia_css_queue_get_size_remote(qhandle, size);
 }
-- 
2.43.0

