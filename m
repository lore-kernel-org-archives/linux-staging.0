Received: from mail-wm2-f13.google.com (mail-wm2-f13.google.com [74.125.225.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7560C52ED38
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789767711; cv=none; b=T4IVrFVSZSuL87GI6aqiJexEX6NP0g3bL4BR4LJ70jin7/aUWAbIqin1v8p4CseB4fMRA+5ThNwJgQ8/FJMoC1BtTos1pLR5ZO+AneiL6xsnsAChRDqIU2EKiGE8zKZwaWsnCs9n42tAV5DAhB4y7TAQWF8HZ6EUjL3rYSADzo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789767711; c=relaxed/simple;
	bh=hCt8RfFDNnfDD7Z4MhN/gVhkVJMx6mKfaNhEb0XUMbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=CyrL7d3Vr99x0ZsnjHi0R1aJfBS+u8MAvAn/EuiJwI0dZdPd9tdXcHZFao2CForPc5kvOrAMV6MSzKM9YYb2jAf7mGFJXvs1ams40NeT/IzsOmS5B8uhBDxhx8z89Z8EjgRxVc7enYCi92xfuh5vO8eaf7/BVXGKCxMRVuSDPZc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtoluJVf; arc=none smtp.client-ip=74.125.225.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtoluJVf"
Received: by mail-wm2-f13.google.com with SMTP id 5b1f17b1804b1-49b91369d18so9592895e9.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789767707; x=1790372507; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=TtoluJVfe7yTtmWc8zibBiuaXkKTCRd95xcUOqI93sCylBDpM8gJRpARwHYAhvpdPN
         h4CCdi0Kj0bRqsOnDeIeY08NYwcL1YhfRTEyDWi4jW9Zwt33jTs/ja+fNrkK7z62PFMc
         /MWJk56TcrDW4X002QW74pRmfdYvdrkSA1SghAqLfQ+tDxUu8VCoJi+IVcFSi9VIAw5R
         0eVTkszcnkawUtmEps4CdfDaRSOwoI9AGLTRd6lyAhSCfmzJ01aXj1EeopdTQXAhSOSq
         7KQX7NAkyIZv5UgjLU6kaGHG8PILn+aWFUbYcYEP4Grn6YQUbEM5e5Dou/2H0hkoUuzs
         lDUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789767707; x=1790372507;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SWnkCWkXNXciq3jXvBPGD+9vXB4RTRQg9E2OELK+XNk=;
        b=D+Moy71Q3gkIuMb+/r49mk881fyxyfmwYvHIvZPExJTS/64bReDqczoiAsHUlm1fvU
         i0Ecla3FdxM6P8MKXqK1+HvVBTuRVMLrFstXMQjtdHIXiCZXw8y/a/Wjf6iEIlmeGEYj
         C5N+AiQJmCGw7ob8Aa3IZcweMV2uv57BU+IcMDCY4Hfyx3lhGTtTBjiUXdLkJunp7FDQ
         V6dOdF3zdkccN0wAovB6UJ4fkqqvk0eRTpodVoTLZ+gRjZXkVbfc8BCmZM03FEoGySkC
         nvOtdQsSibBRiSlG7QVDCYr8zle0LFhnhsZjztfYnjxLs/XwoN1EL20UoksUVz8Wq8Yz
         ytUA==
X-Forwarded-Encrypted: i=1; AKwUvBxQLoAijFdwDnIxKNHm+UXFqmUcSJ96vSfKXXpRAWRQL9sUOBl6SqRBOmezbGe3hGMkXX/GjiaZIcKHKNbc@lists.linux.dev
X-Gm-Message-State: AFuF++nyVJbvhS//puslC8sty3oC/3ledqEqvMsckkoP7vgRCR7sNPj4
	lBLEI7SCdD89o5vQYIbk0kvRTeZThS/n4rzIVu2thKeXEA1WmJzokfaC
X-Gm-Gg: AYBFou24WP9fpKhXjafzRbY96WmW9iTSHbvdarhd3mJxJMJYENYk5Jmk4Nd/oD/SKQQ
	smdLg4qimhLi37Xg8NJwyyoOEnLJXWqZCT6UsxqrHG//v3HD9YJEZQ0WEMBFkuhVP6wBu/h9UI0
	T+YcxYwI/Q3aCe86vTsAVmd9Y57XK+lLO38/ecft9eW8Ra+hmSXhq6wMV+I+uRE9kfYFfK31wyD
	ZEnz+0M8H6kByF4V8X+UUjiKJ3wYzGj5jnykDrRrs5NeFFNy7jRmkI33OslUfCUIhhFCIrwnvTh
	/JyIR35tWb+VUFV6WaRE7Qkl9BLbNbr9lUOVNrNoz38MLcKZzvtGdnpAgY5Z6PRfEJMQgzGv2DT
	Uw8mN8x+SoLIpMcd7EX6SIa0O6AvaCwJJujD4F6doPGDAEr3y6t5P0uiczFka9ajuSHe/ycf9fG
	EhYPUUoFrZt5f0MM+P/hgXNNBatqXV6msqxp36Xuhglfx5C2fxommxrdP6RaYJMN9y6o0XSYBmx
	30xKa8mijs6NtPNzuYpLA==
X-Received: by 2002:a05:600c:548c:b0:49e:6e7c:d895 with SMTP id 5b1f17b1804b1-49fc584fee0mr52180715e9.26.1789767707302;
        Fri, 18 Sep 2026 14:41:47 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd068059sm22631565e9.5.2026.09.18.14.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 14:41:46 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: media: atomisp: remove ia_css_circbuf_t typedef
Date: Fri, 18 Sep 2026 21:41:32 +0000
Message-ID: <20260918214132.1135549-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove typedef ia_css_circbuf_t and use struct ia_css_circbuf_s
directly, as per kernel coding style (chapter 5).

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 .../base/circbuf/interface/ia_css_circbuf.h   | 37 +++++++++----------
 .../atomisp/pci/base/circbuf/src/circbuf.c    | 28 +++++++-------
 .../pci/runtime/queue/src/queue_access.h      |  2 +-
 3 files changed, 33 insertions(+), 34 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
index fbcd73b71..de49bf9cd 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/interface/ia_css_circbuf.h
@@ -23,7 +23,6 @@
 /*
  * @brief Data structure for the circular buffer.
  */
-typedef struct ia_css_circbuf_s ia_css_circbuf_t;
 struct ia_css_circbuf_s {
 	ia_css_circbuf_desc_t *desc;    /* Pointer to the descriptor of the circbuf */
 	ia_css_circbuf_elem_t *elems;	/* an array of elements    */
@@ -37,7 +36,7 @@ struct ia_css_circbuf_s {
  * @param desc	The descriptor set to the size using ia_css_circbuf_desc_init().
  */
 void ia_css_circbuf_create(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t *elems,
     ia_css_circbuf_desc_t *desc);
 
@@ -47,7 +46,7 @@ void ia_css_circbuf_create(
  * @param cb The pointer to the circular buffer.
  */
 void ia_css_circbuf_destroy(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Pop a value out of the circular buffer.
@@ -60,7 +59,7 @@ void ia_css_circbuf_destroy(
  * @return the pop-out value.
  */
 uint32_t ia_css_circbuf_pop(
-    ia_css_circbuf_t *cb);
+	struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Extract a value out of the circular buffer.
@@ -74,7 +73,7 @@ uint32_t ia_css_circbuf_pop(
  * @return the extracted value.
  */
 uint32_t ia_css_circbuf_extract(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /****************************************************************
@@ -135,7 +134,7 @@ static inline void ia_css_circbuf_elem_cpy(
  * @return the position at offset.
  */
 static inline uint8_t ia_css_circbuf_get_pos_at_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 base,
     int offset)
 {
@@ -163,7 +162,7 @@ static inline uint8_t ia_css_circbuf_get_pos_at_offset(
  * @return the offset.
  */
 static inline int ia_css_circbuf_get_offset(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     u32 src_pos,
     uint32_t dest_pos)
 {
@@ -188,7 +187,7 @@ static inline int ia_css_circbuf_get_offset(
  * TODO: Test this API.
  */
 static inline uint32_t ia_css_circbuf_get_size(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -204,7 +203,7 @@ static inline uint32_t ia_css_circbuf_get_size(
  * @return the number of available elements.
  */
 static inline uint32_t ia_css_circbuf_get_num_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	int num;
 
@@ -226,7 +225,7 @@ static inline uint32_t ia_css_circbuf_get_num_elems(
  *	- false when it is not empty.
  */
 static inline bool ia_css_circbuf_is_empty(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -243,7 +242,7 @@ static inline bool ia_css_circbuf_is_empty(
  *	- true when it is full.
  *	- false when it is not full.
  */
-static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
+static inline bool ia_css_circbuf_is_full(struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -261,7 +260,7 @@ static inline bool ia_css_circbuf_is_full(ia_css_circbuf_t *cb)
  * @param elem	The new element.
  */
 static inline void ia_css_circbuf_write(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     ia_css_circbuf_elem_t elem)
 {
 	OP___assert(cb);
@@ -285,7 +284,7 @@ static inline void ia_css_circbuf_write(
  * @param val	The value to be pushed in.
  */
 static inline void ia_css_circbuf_push(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     uint32_t val)
 {
 	ia_css_circbuf_elem_t elem;
@@ -308,7 +307,7 @@ static inline void ia_css_circbuf_push(
  * @return: The number of free elements.
  */
 static inline uint32_t ia_css_circbuf_get_free_elems(
-    ia_css_circbuf_t *cb)
+	struct ia_css_circbuf_s *cb)
 {
 	OP___assert(cb);
 	OP___assert(cb->desc);
@@ -320,24 +319,24 @@ static inline uint32_t ia_css_circbuf_get_free_elems(
  * @brief Peek an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
  * @brief Get an element in Circular Buffer.
  *
  * @param cb	 The pointer to the circular buffer.
- * @param offset Offset to the element.
+ * @param offset to the element.
  *
  * @return the elements value.
  */
 uint32_t ia_css_circbuf_peek_from_start(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     int offset);
 
 /*
@@ -356,7 +355,7 @@ uint32_t ia_css_circbuf_peek_from_start(
  *			false on failure
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems);
 
diff --git a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
index cb34d0b5a..203856e24 100644
--- a/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
+++ b/drivers/staging/media/atomisp/pci/base/circbuf/src/circbuf.c
@@ -24,7 +24,7 @@
  * @return the oldest element.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb);
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb);
 
 /*
  * @brief Shift a chunk of elements in the circular buffer.
@@ -36,8 +36,8 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb);
  * @param chunk_src  The position at which the first element in the chunk is.
  * @param chunk_dest The position to which the first element in the chunk would be shift.
  */
-static inline void ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
-	u32 chunk_src,
+static inline void ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
+					      u32 chunk_src,
 	uint32_t chunk_dest);
 
 /*
@@ -60,7 +60,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem);
  * Refer to "ia_css_circbuf.h" for details.
  */
 void
-ia_css_circbuf_create(ia_css_circbuf_t *cb,
+ia_css_circbuf_create(struct ia_css_circbuf_s *cb,
 		      ia_css_circbuf_elem_t *elems,
 		      ia_css_circbuf_desc_t *desc)
 {
@@ -84,7 +84,7 @@ ia_css_circbuf_create(ia_css_circbuf_t *cb,
  * @brief Destroy the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
+void ia_css_circbuf_destroy(struct ia_css_circbuf_s *cb)
 {
 	cb->desc = NULL;
 
@@ -95,7 +95,7 @@ void ia_css_circbuf_destroy(ia_css_circbuf_t *cb)
  * @brief Pop a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
+uint32_t ia_css_circbuf_pop(struct ia_css_circbuf_s *cb)
 {
 	u32 ret;
 	ia_css_circbuf_elem_t elem;
@@ -112,7 +112,7 @@ uint32_t ia_css_circbuf_pop(ia_css_circbuf_t *cb)
  * @brief Extract a value out of the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_extract(struct ia_css_circbuf_s *cb, int offset)
 {
 	int max_offset;
 	u32 val;
@@ -162,7 +162,7 @@ uint32_t ia_css_circbuf_extract(ia_css_circbuf_t *cb, int offset)
  * @brief Peek an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -176,7 +176,7 @@ uint32_t ia_css_circbuf_peek(ia_css_circbuf_t *cb, int offset)
  * @brief Get the value of an element from the circular buffer.
  * Refer to "ia_css_circbuf.h" for details.
  */
-uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
+uint32_t ia_css_circbuf_peek_from_start(struct ia_css_circbuf_s *cb, int offset)
 {
 	int pos;
 
@@ -192,7 +192,7 @@ uint32_t ia_css_circbuf_peek_from_start(ia_css_circbuf_t *cb, int offset)
  * Please refer to "ia_css_circbuf.h" for details.
  */
 bool ia_css_circbuf_increase_size(
-    ia_css_circbuf_t *cb,
+	struct ia_css_circbuf_s *cb,
     unsigned int sz_delta,
     ia_css_circbuf_elem_t *elems)
 {
@@ -260,7 +260,7 @@ ia_css_circbuf_elem_get_val(ia_css_circbuf_elem_t *elem)
  * Refer to "Forward declarations" for details.
  */
 static inline ia_css_circbuf_elem_t
-ia_css_circbuf_read(ia_css_circbuf_t *cb)
+ia_css_circbuf_read(struct ia_css_circbuf_s *cb)
 {
 	ia_css_circbuf_elem_t elem;
 
@@ -280,7 +280,7 @@ ia_css_circbuf_read(ia_css_circbuf_t *cb)
  * Refer to "Forward declarations" for details.
  */
 static inline void
-ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
+ia_css_circbuf_shift_chunk(struct ia_css_circbuf_s *cb,
 			   u32 chunk_src, uint32_t chunk_dest)
 {
 	int chunk_offset;
@@ -289,7 +289,7 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* get the chunk offset and size */
 	chunk_offset = ia_css_circbuf_get_offset(cb,
-		       chunk_src, chunk_dest);
+						 chunk_src, chunk_dest);
 	chunk_sz = ia_css_circbuf_get_offset(cb, cb->desc->start, chunk_src) + 1;
 
 	/* shift each element to its terminal position */
@@ -308,5 +308,5 @@ ia_css_circbuf_shift_chunk(ia_css_circbuf_t *cb,
 
 	/* adjust the index "start" */
 	cb->desc->start = ia_css_circbuf_get_pos_at_offset(cb, cb->desc->start,
-			  chunk_offset);
+							   chunk_offset);
 }
diff --git a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
index d62133a8f..d9b76b70d 100644
--- a/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
+++ b/drivers/staging/media/atomisp/pci/runtime/queue/src/queue_access.h
@@ -47,7 +47,7 @@ struct ia_css_queue {
 	u8 location;    /* Cell location for queue */
 	u8 proc_id;     /* Processor id for queue access */
 	union {
-		ia_css_circbuf_t cb_local;
+		struct ia_css_circbuf_s cb_local;
 		struct {
 			u32 cb_desc_addr; /*Circbuf desc address for remote queues*/
 			u32 cb_elems_addr; /*Circbuf elements addr for remote queue*/
-- 
2.43.0

