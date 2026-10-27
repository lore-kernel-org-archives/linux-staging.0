Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793102642;
	b=A6sl/RTYknC+aDHmoSCxd1FFsnF5ztsGXiGENc7HlbrZNvZSzH3QFqsjjvTbBoNMDV9o
	 e/fq5lN74qSCzG1JndMEP14zhVNYdCWyfuwfiI7BpvOAtbpl1YJP0vN4xwfdlK13xAaYZ
	 Dq3QPMBorxS0JleHnMfr2taZsVAUdDuXlkDKK6F7NKwoXppvs05luR2yE0AeOdqL/mquy
	 /+iJXdAObSFwwxAgSreFjedc/arMG6C94zJR44xWJeW938gXKGHQub7LdCV7My9RFsLk8
	 kNsERjYtC3Xlwlh8fIkhcD/f6MQ09N1N6m4kZAWqz749eKCxv29YF/Rpole6QqOpH+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793102642;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
	b=eGNXrImUDDRWPwg0MRjyS/YuDsk1Z1pdLba7/CwCNysbapo47RjHd0t2/poegVC8n+tm
	 htT3lYIZ3/8cKTN1ItIHZbKzZcYpH3UH7jX+293FMdJfU3FqozsRV4bTS90vTtyRPYrFS
	 KdkSEpa8Hn7979JApvuMFh/TfaXcAyKKPnM5DzMycnmWDRVO77AceV46jBKPO/HLWKPIG
	 Dmr7y4tHBFwB8my0Ix+Jokj+QbT16kzqCQvLlZ9eK3nKGjGGCRpieLp6CwVawe7//n3Yp
	 Au0QhephStCCBNA1aeDgKOlok2qM6+hJLEYeywJOvKsxPLjl5Us2SqZ88z6bzKj2spg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m2dIH42y;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDB6606A32C
	for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 12:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FDB6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=m2dIH42y
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-48dfdd0678dso2948651f8f.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Oct 2026 05:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793102641; x=1793707441; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
        b=m2dIH42yhBQ2vy+PNLMEhLH46STdeIq53sDzHuneV69HOT/ywIuuEz84gv/1Ko2JDW
         07zhso52CkT1cjb9KWeRVzJyC3nveVvazk0+qaweLdbIlVyCGESqq7ZItV/7YBNSwnBW
         sBK03icpwRz/Xwai/ScRCQoxChXnMLor4NBLsEz1PghAZrfKM/eK7PxQQ4Krv25lyrYH
         5FxhmUV2lxv2cP7jj2tcC4gw+zkST3fuArXpwje2kr2Kurm5WzBpoO3sEi5wITzlrAIZ
         YWxgPGkz+fee+XZjHH7w+SuXHMbGsVCrzmS7bsfH3VBZVMYWuvdZLRHIOv9eXQp3PggI
         FAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793102641; x=1793707441;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ngKLlD/TZFndBBHOawGu//O5HfItQqjo8oistDQQOGc=;
        b=h102p7B24GW+QDaoyMmkwWn8F+xClWvMn9GC2lD0b2EVW+t4ztm74HBNx40HgBHX1n
         ND7lcy69jLBc9vHYKDhIzX2ehwN8rHBo3hI7yIUbjmfcKZhKDlbJDxNenD4ZMMMsAmBK
         alot/z6/lhUIhOfLu8Qn79WHewAKiFvTCVPylMb3kX6g9vzO2YT40nI38HU+39aWG6Go
         0SBbTCj4C3xiKfGW5r1nc4l7ivD9qWVnroD4N7ENHFSpWRh/k1nIq0qwe5psnJh+Ys9I
         ljJ2Wgoa8g8oj4OrGHq2TCK1CrxjkFA3iy/f8NW45DuVoTkLXvVbI7fsxMw5e26HDk5P
         DIvA==
X-Forwarded-Encrypted: i=1; AKwUvBzzJW48XXSywhFEnCLQTfemFiZwQ7KWsvZl3OV/fHg1LGPV7O9uSxxT8RFXZ9m2eRzyPKoxZxOSsinlAFXD@lists.linux.dev
X-Gm-Message-State: AFq9FYKKXp/4TMdgLtqLYNTbVt/Kon2EeivKNL16huIWRVQ+AkrgRGho
	gtjD93RIhl9wussVZcjSAppn5zEd7VkU2nkX8e9j0Yr0OANjsfZOvS20
X-Gm-Gg: AYBFou0EGI4rebIcnBMcoirf+J0mBKm1Y1AE4KaISuKbd/kOKqqH4Xy8ngaI7gxb2dg
	SYRhC4TnRwXtUAD7I1VYIe0aOBdSdGmzjjW0JpSGjpKOFB8QMDklGD7FwY9HiE0yDlHzKT2omjk
	wpSjpvpPCX4sMNmCX+TXs8BskxNXQApgB8kHDmbHyL/1QJO+NtHWDwtXyvukPMlTpmBIm3fax3O
	j3tmt85I6ZyzpWCXhJGAV8P015V51a5EmJRmgOU+UXg1sjs3k2bContBJ1bdVj4MCs561CYC5Ua
	Cf7E+QfhFdreg5snFfmx+YDq5lve+lckLnt5kqGlzdpPNW8fxgNnWSyMtnHoQ3X6V4jIlE62b41
	qRYEX8QZBsIpP3LYi1CuMZvBfqR5oGZ/frv+wYDc6GbVeRlZYxdZvopocfbUwgvxH6AD9ee0FEq
	7MXj981xbiC7CSxkUF5gXimDjk5XYto8QFrbdLRmY2/k079QEBbx8UxvxJQs+rZ38du/Ld59G7c
	anmyeGBSia7Jk5CrHW9wAmFlWwkVKgL+Yj2rj3UKE+dpZQ07be9WlTItG9eTnjAfoRAidt0df4T
	ROU=
X-Received: by 2002:a05:600c:620b:b0:4a1:c6fd:4db0 with SMTP id 5b1f17b1804b1-4a35aca41e4mr160349135e9.19.1793102640602;
        Tue, 27 Oct 2026 05:04:00 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd39a9sm22977554f8f.46.2026.10.27.05.03.59
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
Subject: [PATCH v3 2/5] media: atomisp: queue: move remote queue handling into helpers
Date: Tue, 27 Oct 2026 12:03:37 +0000
Message-ID: <20261027120341.2305533-3-vladurares@gmail.com>
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

Move the remote queue branch of every queue operation into its own
static helper, written the way the function is meant to look once the
unused local queue support is gone, and call it from the existing
function after the local branch.

This prepares for removing the local queue support in the next patch
and keeps that change easy to review. No functional change intended.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../atomisp/pci/runtime/queue/src/queue.c     | 407 ++++++++++--------
 1 file changed, 232 insertions(+), 175 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
index d27c6567daeb0..cfd7473720d1f 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue.c
@@ -70,10 +70,50 @@ int ia_css_queue_uninit(ia_css_queue_t *qhandle)
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
+	if (error != 0)
+		return error;
+
+	/* b. Operate on the queue */
+	if (ia_css_circbuf_desc_is_full(&cb_desc))
+		return -ENOBUFS;
+
+	cb_elem.val = item;
+
+	error = ia_css_queue_item_store(qhandle, cb_desc.end, &cb_elem);
+	if (error != 0)
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
+	error = ia_css_queue_store(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
+		return error;
+
+	return 0;
+}
+
+int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
+{
 	if (!qhandle)
 		return -EINVAL;
 
@@ -89,48 +129,56 @@ int ia_css_queue_enqueue(ia_css_queue_t *qhandle, uint32_t item)
 
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
+	if (!qhandle || NULL == item)
+		return -EINVAL;
+
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
 
 int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
 {
-	int error;
-
 	if (!qhandle || NULL == item)
 		return -EINVAL;
 
@@ -145,47 +193,35 @@ int ia_css_queue_dequeue(ia_css_queue_t *qhandle, uint32_t *item)
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
+	if ((!qhandle) || (!is_full))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
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
 
@@ -196,28 +232,34 @@ int ia_css_queue_is_full(ia_css_queue_t *qhandle, bool *is_full)
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
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
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
 
@@ -228,28 +270,34 @@ int ia_css_queue_get_free_space(ia_css_queue_t *qhandle, uint32_t *size)
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
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
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
 
@@ -260,28 +308,47 @@ int ia_css_queue_get_used_space(ia_css_queue_t *qhandle, uint32_t *size)
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
+	if ((!qhandle) || (!element))
+		return -EINVAL;
+
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
+
+	return 0;
 }
 
 int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 {
 	u32 num_elems;
-	int error;
 
 	if ((!qhandle) || (!element))
 		return -EINVAL;
@@ -298,39 +365,34 @@ int ia_css_queue_peek(ia_css_queue_t *qhandle, u32 offset, uint32_t *element)
 
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
+	if ((!qhandle) || (!is_empty))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
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
 
@@ -341,28 +403,35 @@ int ia_css_queue_is_empty(ia_css_queue_t *qhandle, bool *is_empty)
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
+	if ((!qhandle) || (!size))
+		return -EINVAL;
+
+	/* a. Load the queue from remote */
+	QUEUE_CB_DESC_INIT(&cb_desc);
+
+	error = ia_css_queue_load(qhandle, &cb_desc, ignore_desc_flags);
+	if (error != 0)
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
 
@@ -373,20 +442,8 @@ int ia_css_queue_get_size(ia_css_queue_t *qhandle, uint32_t *size)
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

