Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBD5BE5E
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776393373; cv=none; b=NL8vMxd9stBQGST3w3QnZgsOdqTnGhLymHF5cs3O7kBI6/pX6ayA029sxvukZZCDqT3hdlGN+HQFAgQp1twKdxMTMfkwg+buRKnzLziTUURB5AxSWac20YSDxhefAD+GjYMMcInCzThXbYBRMeXphoDs3qetOsP4tgHw0ZxYsqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776393373; c=relaxed/simple;
	bh=VeKDihqhlOCIhst3RPegrgi+QOHxHhPbR2wfKOfov+s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fiQQWpqGGqr8PXzi8PhUwOs4sW8zZNnYmX7riPhgRkA7FHzYYZnxLlv6NojiQTWUt0DjgDgIsKnZKTv+0WcY+2DDytOksizNWwyE1LuDI6a7c8jFnPAV2HW3tRV4ytc9TnnudK874EN+SgGjN6QoiflUYrDFCg7Z7fF0v6xZmYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F5dbEr/n; arc=none smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F5dbEr/n"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7d4be94eeacso196110a34.2
        for <linux-staging@lists.linux.dev>; Thu, 16 Apr 2026 19:36:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776393370; x=1776998170; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6SHyQChDMp2FfJSL1Jb4vIVb/ftlOjma1SC6BeaD5Lg=;
        b=F5dbEr/njkmVhLPzXGaT06XMMZKQKTtPpGWUWTCiCGLWDuooMYrr2L4/l6t8T4HNKK
         8+brdksC3me60YVqXGs3iwES9jSTiCCYWBMaQHdn5hrNKY5yyS5HTCWoapBxt+LQq426
         ltua1Sv4T/M/gtJfc0IFZjpnOPgu/e2evB0xG/F1VOwMUVoPKf0GfVJ11pf2wldON+ZO
         0EjaY5yI2I6PQaPyTn3KQjwT2A1rWHsKbil9PYkDVFl2ZnUZQk1cCjx40veu39dpVnO0
         KK4QHsoXLMVOZE5mnXzROHHLzgxHXurwQV0IhrNIUKj88TOkNE9rNhwv4akQ2yKobGVA
         qjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776393370; x=1776998170;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6SHyQChDMp2FfJSL1Jb4vIVb/ftlOjma1SC6BeaD5Lg=;
        b=E2ceYjE+JeM99eqjFu12o/aiybJrsldKhRSztOSjXKehnRvnNd/KkfW9BjJHN1NPq2
         HmmrN5j6rZhSSfZ2O8ggAmEAZQJRASDdsAUXHnHrZvdugnVlZ8NDjnfkvtqRIuRSJnag
         2NfY/lOQIBMapT3XxaPHSH1J8GE3oMp0x40YwzgH2pHeVrJW08VghX/S8X+pVYyRcSBM
         QtCXMLXo/6zwHldYfWJX+rsKxVQPSCsCMATlTIU9NihzdU4GSPCEKdMVi31dMOtqvv6S
         4W7TmhX5PSeboUkv7DpkYidXh5txhpqTTobcWwhe0jcnDq0/M522FtERl7tTem+Kud75
         4ojA==
X-Forwarded-Encrypted: i=1; AFNElJ8E6LFx3XZPXes4xLxah6H33zR5CqviQmji53q1Syc6BkzVO4aq84SuRohC8vAQdoXEVKoiqohUgqBIHzU9@lists.linux.dev
X-Gm-Message-State: AOJu0Ywrk6gn46XDG4kBBKhAgA0An4eMSnu20IbC89B2TGT4xPishWAX
	tLsxIjYGdBlYBjNmpunOPfkRuu06VnnL0JrlOsJwx7M24pJV3urSnHLg
X-Gm-Gg: AeBDietvNQr9XXzk5GTW6Fcg8ihCXUAstrJ6yUSxUSaHu8efdBEHR6Nd8XAN4cTM3b5
	vNrCGalqfpotJ4e4cThZuNZGq17bjTf3YcnUpVZHq3M7pJBZ1ba1BZMipvkqtZ5INaMg7k6msev
	FPAbhyhzQ0IgcroYqZLLOFWZs3veuGzzlm3ciugm+f0hrQhwi1vnNztZjeAYPWVF3qAdnDYgGIB
	niIbQEdxhGegZG261ZJe5wsqi8zUOYv1KuN1vuinA5/uljUhuY43zX1AEhsQMuv5dcxWTiDaqDt
	sppby6XlSyw5bdXTfd+yCeNgy7vK4JkBkNjXJQnGLer+D1bllv1JObvmmhQJNeuSmjovdhet07G
	9Q+bA0EnTi0vfOlQOsmGFmbMQImthjtT8XQ4ck0l0pGd1/vIVjeHOjji5yZlTPlLdBrQ7DNpNBV
	B2wWS45OO+tRdjVq6FtwEUGUxT8Ibn3xDkYtW4CasRdYB2dMlJAu1YXPsgsAC5wRah7mXM
X-Received: by 2002:a05:6830:6d2e:b0:7d7:cde1:5440 with SMTP id 46e09a7af769-7dc951c7541mr742358a34.18.1776393369920;
        Thu, 16 Apr 2026 19:36:09 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7dc97519090sm142802a34.10.2026.04.16.19.36.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 19:36:09 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: tsbogend@alpha.franken.de
Cc: gregkh@linuxfoundation.org,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] mips: cavium-octeon: remove cmd queue state and related typedefs
Date: Thu, 16 Apr 2026 21:36:02 -0500
Message-ID: <20260417023602.112359-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This change removes the cmd queue state typedefs to work towards the
"code cleanup" task in the staging's TODO, and aligns the codebase further with the
Linux Kernel Code Style.

The following structs are affected:

- __cvmx_cmd_queue_state_t (now struct __cvmx_cmd_queue_state)
- __cvmx_cmd_queue_all_state_t (now struct __cvmx_cmd_queue_all_state)

In addition, the global exported pointer __cvmx_cmd_queue_state_ptr has
also been updated to use the new names, and its extern statement in
cvmx-cmd-queue.h has been moved to the top of the file to satisfy the
requirements for EXPORT_SYMBOL_GPL.

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 note: This patch is a part of a continued effort to remove abiguous
 typedefs across the cavium-octeon/octeon codebase.
 .../cavium-octeon/executive/cvmx-cmd-queue.c  |  8 ++---
 arch/mips/include/asm/octeon/cvmx-cmd-queue.h | 32 +++++++++++--------
 2 files changed, 22 insertions(+), 18 deletions(-)

diff --git a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
index 042a6bc44b5c..4cf4060df48c 100644
--- a/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
+++ b/arch/mips/cavium-octeon/executive/cvmx-cmd-queue.c
@@ -46,7 +46,7 @@
  * This application uses this pointer to access the global queue
  * state. It points to a bootmem named block.
  */
-__cvmx_cmd_queue_all_state_t *__cvmx_cmd_queue_state_ptr;
+struct __cvmx_cmd_queue_all_state *__cvmx_cmd_queue_state_ptr;
 EXPORT_SYMBOL_GPL(__cvmx_cmd_queue_state_ptr);
 
 /*
@@ -109,7 +109,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_initialize(cvmx_cmd_queue_id_t queue_id,
 						  int max_depth, int fpa_pool,
 						  int pool_size)
 {
-	__cvmx_cmd_queue_state_t *qstate;
+	struct __cvmx_cmd_queue_state *qstate;
 	cvmx_cmd_queue_result_t result = __cvmx_cmd_queue_init_state_ptr();
 	if (result != CVMX_CMD_QUEUE_SUCCESS)
 		return result;
@@ -202,7 +202,7 @@ cvmx_cmd_queue_result_t cvmx_cmd_queue_initialize(cvmx_cmd_queue_id_t queue_id,
  */
 cvmx_cmd_queue_result_t cvmx_cmd_queue_shutdown(cvmx_cmd_queue_id_t queue_id)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 	if (qptr == NULL) {
 		cvmx_dprintf("ERROR: cvmx_cmd_queue_shutdown: Unable to "
 			     "get queue information.\n");
@@ -295,7 +295,7 @@ int cvmx_cmd_queue_length(cvmx_cmd_queue_id_t queue_id)
  */
 void *cvmx_cmd_queue_buffer(cvmx_cmd_queue_id_t queue_id)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 	if (qptr && qptr->base_ptr_div128)
 		return cvmx_phys_to_ptr((uint64_t) qptr->base_ptr_div128 << 7);
 	else
diff --git a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
index 67e1b2162b19..faef98173a4f 100644
--- a/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
+++ b/arch/mips/include/asm/octeon/cvmx-cmd-queue.h
@@ -71,6 +71,12 @@
  *
  */
 
+/* Global pointer to the state of command the queues
+ * Moved here to satisfy requirements in cvmx-cmd-queue.c for EXPORT_SYMBOL_GPL
+ */
+extern struct __cvmx_cmd_queue_all_state
+	    *__cvmx_cmd_queue_state_ptr;
+
 #ifndef __CVMX_CMD_QUEUE_H__
 #define __CVMX_CMD_QUEUE_H__
 
@@ -125,7 +131,7 @@ typedef enum {
 	CVMX_CMD_QUEUE_ALREADY_SETUP = -4,
 } cvmx_cmd_queue_result_t;
 
-typedef struct {
+struct  __cvmx_cmd_queue_state {
 	/* You have lock when this is your ticket */
 	uint8_t now_serving;
 	uint64_t unused1:24;
@@ -140,7 +146,7 @@ typedef struct {
 	uint64_t pool_size_m1:13;
 	/* Number of commands already used in buffer */
 	uint64_t index:13;
-} __cvmx_cmd_queue_state_t;
+};
 
 /**
  * This structure contains the global state of all command queues.
@@ -150,10 +156,10 @@ typedef struct {
  * ll/sc used to get a ticket. If this is not the case, the update
  * of queue state causes the ll/sc to fail quite often.
  */
-typedef struct {
+struct __cvmx_cmd_queue_all_state {
 	uint64_t ticket[(CVMX_CMD_QUEUE_END >> 16) * 256];
-	__cvmx_cmd_queue_state_t state[(CVMX_CMD_QUEUE_END >> 16) * 256];
-} __cvmx_cmd_queue_all_state_t;
+	struct __cvmx_cmd_queue_state state[(CVMX_CMD_QUEUE_END >> 16) * 256];
+};
 
 /**
  * Initialize a command queue for use. The initial FPA buffer is
@@ -234,10 +240,8 @@ static inline int __cvmx_cmd_queue_get_index(cvmx_cmd_queue_id_t queue_id)
  * @qptr:     Pointer to the queue's global state
  */
 static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
-					 __cvmx_cmd_queue_state_t *qptr)
+					 struct __cvmx_cmd_queue_state *qptr)
 {
-	extern __cvmx_cmd_queue_all_state_t
-	    *__cvmx_cmd_queue_state_ptr;
 	int tmp;
 	int my_ticket;
 	prefetch(qptr);
@@ -286,7 +290,7 @@ static inline void __cvmx_cmd_queue_lock(cvmx_cmd_queue_id_t queue_id,
  *
  * @qptr:   Queue to unlock
  */
-static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
+static inline void __cvmx_cmd_queue_unlock(struct __cvmx_cmd_queue_state *qptr)
 {
 	qptr->now_serving++;
 	CVMX_SYNCWS;
@@ -299,10 +303,10 @@ static inline void __cvmx_cmd_queue_unlock(__cvmx_cmd_queue_state_t *qptr)
  *
  * Returns Queue structure or NULL on failure
  */
-static inline __cvmx_cmd_queue_state_t
+static inline struct __cvmx_cmd_queue_state
     *__cvmx_cmd_queue_get_state(cvmx_cmd_queue_id_t queue_id)
 {
-	extern __cvmx_cmd_queue_all_state_t
+	extern struct __cvmx_cmd_queue_all_state
 	    *__cvmx_cmd_queue_state_ptr;
 	return &__cvmx_cmd_queue_state_ptr->
 	    state[__cvmx_cmd_queue_get_index(queue_id)];
@@ -329,7 +333,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write(cvmx_cmd_queue_id_t
 							   int cmd_count,
 							   uint64_t *cmds)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
@@ -427,7 +431,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write2(cvmx_cmd_queue_id_t
 							    uint64_t cmd1,
 							    uint64_t cmd2)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
@@ -528,7 +532,7 @@ static inline cvmx_cmd_queue_result_t cvmx_cmd_queue_write3(cvmx_cmd_queue_id_t
 							    uint64_t cmd2,
 							    uint64_t cmd3)
 {
-	__cvmx_cmd_queue_state_t *qptr = __cvmx_cmd_queue_get_state(queue_id);
+	struct __cvmx_cmd_queue_state *qptr = __cvmx_cmd_queue_get_state(queue_id);
 
 	/* Make sure nobody else is updating the same queue */
 	if (likely(use_locking))
-- 
2.53.0

