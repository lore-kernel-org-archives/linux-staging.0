Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47D463655CE
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 20:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778619584; cv=none; b=jF2qEh/FlO8Bk5GSjBqdotEzsmFkzAdOxmx7u9N//fF4KbU9UZw51AjH8jIsNuIA7/1ssgqqW6ys0YE2kq+KhB9rYL9MH0yUooOwexbl1oDhgo8x9XseFmzWwMWMJRSRHD9wNntfN6MoT7hq0hrdmjlFK00/NOpdypjyZyzrMGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778619584; c=relaxed/simple;
	bh=51nm+OJzdDjT7aci3cLJQHKZ22nakowBtJnz6IMMzfk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Fi9+bbQBkFGnFbJ8DAk6RS3OmAVMhHXDC5U/Vj648LQhMgzTSAN0s9vUNrO/BLVLDucgZmZeO3xJ4yddYGkWAg2dl0gwnS4zWc00B3JoHGs2tlftAgcGehHKGZMmp+7D5AhAOjXItw4l28YcdclPnAB3Zq5ezrBZmJyVP4OPGbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TqUGMqSL; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TqUGMqSL"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-132830d8281so504086c88.1
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 13:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778619582; x=1779224382; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/G9ndXIqpDIHxraLqQpZty2/hCAqoC8Ba2ceXWSt+4k=;
        b=TqUGMqSLcORSBBL29ect8qxCniL3+QdYlwJfCj8ZWYV0+ECFL12obxRyUbUGOtorQ9
         Awe2UliK4qWVsw26zN8FQIr3dR302ujV+CYKebF4swW5lAEZ4GhSdT8Bx01TQypMKgCv
         Ky2uUjMb2lAnDX66uoWJ4uGAD2P5JLGfG02SIvDpyFp3gFCmjyQVNbbG20cLaOwsnm42
         Nw9dkdRwwBTC2W24yvc09Q7j9Wnc5jZMm2XoYHJtUGmJh/OH8ONEFoppu8tanKoYSG1w
         j6IDSjS7cLfDjBPZ+JYu5mCdR93+IvlpWxyc05gmJMQLXyreWhoTtQ5j9bVOARdmJDCC
         hteA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778619582; x=1779224382;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/G9ndXIqpDIHxraLqQpZty2/hCAqoC8Ba2ceXWSt+4k=;
        b=f8jKj419Fb3OkyfnOgobfr7kjuj8lfyMYsH9RJ2bWo5DbJbTrfUMWdBPCBNYsaK83H
         QiEUv8269XokrE0fViC4/aZkj8z3TRQySPq2bFiktUlSqyw25xcC+b6DpwTB5mP/bkLk
         0J0wCMFyqsaPm6sxeO5l0XsUm5gj0QpbOFf7PjBqpjreUjiMevRUgs9cd1mxn+OotdDz
         pZ3I3r84ZsIUtQIccb1SE5FZ4VnN5ZOFZZ22mgxFgj7vUpBuO1Wk8gcn7VCwIqB0CTp/
         R3GmLV1kwDCbmNiRJqB/4TOfl6LiR6/9IcxUyJonkCTDQ3ZMDtDrtbLhIndF2+e2hIKU
         fUMQ==
X-Gm-Message-State: AOJu0YzFIxkphzeJsbpkOZDl7rKdqMVWCt3mp4e8BN0xmL+KCetgMLQQ
	7YAlOab63dSW9TbUAGm+XFLcmr3YyIZ/FnhvYIkNAoBCJaEGyZ7VCfNMt5zV4Q==
X-Gm-Gg: Acq92OHyzOCnuzUGlMFM3m0oBMdNZK7G7hwvSyR9LEJdT7TRcuW9Pkhxb3hxQbGs1By
	S+CqJWJY6KoViPxKWvEoDeiYN7Wj8k4o4xIyA9n8aIXFihlW/10Shvje9avxwNgJby8//I5r01v
	vpeM6vGNCaRFRPBt/f7Uy4xeSX6BrHBd2cyam2fghonBmUYEDTM/HXxxkussu4EONTT+QRARjpb
	6xYoPq2zfyfPtIVL/RC4y8LffKUw5lLn4vHt8c2wW2Gu7dfAgvob+mqVOa/tVg6bgGjYoeIhBXf
	YAwIX0a2ZUslqNtKbiEct/4+sgJYJjidgvhL3EYnhbwcr9+bCfKBHLesr70e3D1F+UUHbtEF2lX
	KAZBPvjSTQr4TpHojroLIGfrFWrVqK0Y06FmC3QNLCTs4ztXzV3lBF7ziQDTLuZ777ak2z9yJ8u
	3Aw2ZkIHb0NKXb6doeaOc26MYrlC/0uOHT
X-Received: by 2002:a05:7022:f008:b0:133:680f:cdcd with SMTP id a92af1059eb24-1342ee3a3d4mr350861c88.4.1778619581923;
        Tue, 12 May 2026 13:59:41 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1327865955fsm25931147c88.11.2026.05.12.13.59.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 13:59:41 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation for more function parameters
Date: Tue, 12 May 2026 13:59:27 -0700
Message-Id: <20260512205927.44704-1-guojy.bj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the indentation for function parameters to avoid a '(' at the end
of the line.

This fixes the following checkpatch.pl check for files isys_dma.c,
isys_irq_private.h:

CHECK: Lines should not end with a '('

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../pci/css_2401_system/host/isys_dma.c       |  5 ++---
 .../css_2401_system/host/isys_irq_private.h   | 21 +++++++------------
 2 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
index dfa7edefdff8..98a018384a15 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_dma.c
@@ -13,9 +13,8 @@ const isys2401_dma_channel N_ISYS2401_DMA_CHANNEL_PROCS[N_ISYS2401_DMA_ID] = {
 	N_ISYS2401_DMA_CHANNEL
 };
 
-void isys2401_dma_set_max_burst_size(
-    const isys2401_dma_ID_t	dma_id,
-    uint32_t		max_burst_size)
+void isys2401_dma_set_max_burst_size(const isys2401_dma_ID_t dma_id,
+				     uint32_t max_burst_size)
 {
 	assert(dma_id < N_ISYS2401_DMA_ID);
 	assert((max_burst_size > 0x00) && (max_burst_size <= 0xFF));
diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
index 4bd8209aaa01..9159a19a22f2 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/isys_irq_private.h
@@ -19,9 +19,8 @@
 * @brief Get the isys irq status.
 * Refer to "isys_irq.h" for details.
 */
-void isys_irqc_state_get(
-    const isys_irq_ID_t	isys_irqc_id,
-    isys_irqc_state_t *state)
+void isys_irqc_state_get(const isys_irq_ID_t isys_irqc_id,
+			 isys_irqc_state_t *state)
 {
 	state->edge     = isys_irqc_reg_load(isys_irqc_id, ISYS_IRQ_EDGE_REG_IDX);
 	state->mask     = isys_irqc_reg_load(isys_irqc_id, ISYS_IRQ_MASK_REG_IDX);
@@ -38,9 +37,8 @@ void isys_irqc_state_get(
 * @brief Dump the isys irq status.
 * Refer to "isys_irq.h" for details.
 */
-void isys_irqc_state_dump(
-    const isys_irq_ID_t	isys_irqc_id,
-    const isys_irqc_state_t *state)
+void isys_irqc_state_dump(const isys_irq_ID_t isys_irqc_id,
+			  const isys_irqc_state_t *state)
 {
 	ia_css_debug_dtrace(IA_CSS_DEBUG_TRACE,
 			    "isys irq controller id %d\n\tstatus:0x%x\n\tedge:0x%x\n\tmask:0x%x\n\tenable:0x%x\n\tlevel_not_pulse:0x%x\n",
@@ -55,10 +53,8 @@ void isys_irqc_state_dump(
  + -------------------------------------------------------*/
 
 /* Support functions */
-void isys_irqc_reg_store(
-    const isys_irq_ID_t	isys_irqc_id,
-    const unsigned int	reg_idx,
-    const hrt_data	value)
+void isys_irqc_reg_store(const isys_irq_ID_t isys_irqc_id,
+			 const unsigned int reg_idx, const hrt_data value)
 {
 	unsigned int reg_addr;
 
@@ -72,9 +68,8 @@ void isys_irqc_reg_store(
 	ia_css_device_store_uint32(reg_addr, value);
 }
 
-hrt_data isys_irqc_reg_load(
-    const isys_irq_ID_t	isys_irqc_id,
-    const unsigned int	reg_idx)
+hrt_data isys_irqc_reg_load(const isys_irq_ID_t isys_irqc_id,
+			    const unsigned int reg_idx)
 {
 	unsigned int reg_addr;
 	hrt_data value;
-- 
2.34.1

