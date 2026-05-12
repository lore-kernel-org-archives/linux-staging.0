Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D6FE35979
	for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 19:32:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778614367; cv=none; b=FRbBrXXw2mnHnI/sy8SrZl8Rga+seJF9OtveX3YrpaEa4RjC/2HGJOzgQsprtxiuEBsIivbJU4WXTbJEce5OKVS+gbwGFljKSqBGkZKBpHQN6kC6B/ZvzscDVvRD6oRAAkilzfGzHwsnr6L7EYA5DOqiN5CMif2zElHvMOMenxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778614367; c=relaxed/simple;
	bh=YaZQcxMPOZ5/Dp5YStDxKEPNdAL4OEo28UJCf+YTGVc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=GCcx9J3hBTV7KMSCD5CMZY0N+G0CW+iP5gKNWN0f2Z6aH67uiHcqKIWKG7q9jl5jmo8RuU4GiJzQ8aQ0uH/CMXP2QaJQq9BktPZQPyMx018Q7AeMlPlxzafrfPAidT/EwA9Q1pDnFxwgtEUHHShME2UT0zbuz53/wSLaWIumCS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hUZL7iR3; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hUZL7iR3"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso5886921eec.0
        for <linux-staging@lists.linux.dev>; Tue, 12 May 2026 12:32:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778614365; x=1779219165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wVD8VTj0+dLMOEBwXxKMmvzU2blKWnplzzkaGTkbKZs=;
        b=hUZL7iR3COw7xELRl0vG2KaDKNwsMWd7pm3og2qzSKWIyGAxAEhD5HhQGyWSSF3cof
         Iv0umtDYac/pKMx7GlQFV7LH5xEKKi13i7HhwgtWenCalq1QqN4dfW0lv5cRnRGtwBEU
         IAGRmYDjLjwopf0TlZfmEYZuMeGFBMI047dYZn+f1Tr0lz5WHvW9/6q8s6n0tQj7Yb7T
         6QJEM6HO8b2mKyKA4L0gaA5VnLlQ9NlU8JXaxAvvEoXaEsIG+OBNcUt1tg+QO/6CHdrY
         hhwnkz4gBFFymUQgQEEanndtKRzXbTPrS09Df1ZNfbfvybPPI0x+pbSiHMJTnqVt4d7l
         uv2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778614365; x=1779219165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wVD8VTj0+dLMOEBwXxKMmvzU2blKWnplzzkaGTkbKZs=;
        b=QGczxoJKchcepNbyCIzS0bHCM5wcKpo5ijDd6XGEEgDiuwKzRrTn7RwxDJHpFvZdaJ
         Va32aBMve8OGz1DARRuOgg6wtktljEiIj0tg4x0oWm3z/rKQfORO/XXujv7QNR+aYP4P
         rkopRPE1reI5xFmMWPXKl0bm2ikF3Yrp6DwHDoOQSqQlq53Gg3UyC8PP/OpvWYYmaXYk
         kRYIJ1vJ6cCPgpTHu7zmiXJu4rDajSgi/nQKM89m1KIDK3tGSa17KkNQPyXznEDCX8Q5
         ggyxUKhwDaTCHchWSidR6hEwhtS7DzWNaZ3csraOdpoiTMI5G6TUQrnTev/XqHe4rxX5
         NxFQ==
X-Gm-Message-State: AOJu0YzGgQ0M1fbYifhNiboRa7n2TjFk1LWaXESOfKRAneJG6sgUXUZr
	U2oTwup2Z+UoWh5dBo4jC7jRUqYiof/40lFg+pLy8GECt7aBgXD3zLr+HwhqkQ==
X-Gm-Gg: Acq92OEBxa6O5qHGTE/r83LjRqWwl0I2refKfpdG4/qxRqkC4D5hL83r7YqoFAKKXxo
	7OMHJdNnVsqstVRc2gPz9+FM5KtjCwu7ZKrR1NQozSL99/F/gcprE8R7xSBsCNVjT6zCV6iiFZ8
	fFHhhJJ48FOvShCLB4NqBKk+8eHdb31O/OeCZ9q7m7Mv9sd5nU+ljl5ihoDJ/xsYpZjBBh8cHqs
	3+6aEovBcSPRIxp1REnVEYWGr6gZu0u4kShBvjmVWdVopR0Maj1WU0vrVjQVPUFCrUPMeWTLgvF
	fhJusRW1msUcplqGV+P3jABXGs4Cf8YUCGMzR7Onh1jh/EIK5Ar1EMEWypbmmKbx/jSZwYt931w
	Lxet4w9YPgZpT71aAQA8NOEOcuFY2ueO8wDj4taeBhpHpiWT8r0uTOgfNSkuC1f7n1blOzxhyvt
	rHfqhTJ2R8V7o5BxH+DTm7ufggpdLpnvhk
X-Received: by 2002:a05:7301:1296:b0:2c4:dd55:ffc1 with SMTP id 5a478bee46e88-30117c7e420mr236067eec.2.1778614364789;
        Tue, 12 May 2026 12:32:44 -0700 (PDT)
Received: from TestUbuntu22.. ([73.15.108.84])
        by smtp.googlemail.com with ESMTPSA id 5a478bee46e88-2f888c3b301sm24226858eec.23.2026.05.12.12.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 12:32:44 -0700 (PDT)
From: Jennifer Guo <guojy.bj@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	Jennifer Guo <guojy.bj@gmail.com>
Subject: [PATCH] staging: media: atomisp: fix indentation for function parameters
Date: Tue, 12 May 2026 12:32:34 -0700
Message-Id: <20260512193234.43156-1-guojy.bj@gmail.com>
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

This addresses the following checkpatch.pl check for csi_rx_private.h:
CHECK: Lines should not end with a '('

Signed-off-by: Jennifer Guo <guojy.bj@gmail.com>
---
 .../pci/css_2401_system/host/csi_rx_private.h | 51 ++++++++-----------
 1 file changed, 21 insertions(+), 30 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
index 989f55bec519..0b5a9d56bf98 100644
--- a/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
+++ b/drivers/staging/media/atomisp/pci/css_2401_system/host/csi_rx_private.h
@@ -25,9 +25,8 @@
  * @brief Load the register value.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline hrt_data csi_rx_fe_ctrl_reg_load(
-    const csi_rx_frontend_ID_t ID,
-    const hrt_address reg)
+static inline hrt_data csi_rx_fe_ctrl_reg_load(const csi_rx_frontend_ID_t ID,
+					       const hrt_address reg)
 {
 	assert(ID < N_CSI_RX_FRONTEND_ID);
 	assert(CSI_RX_FE_CTRL_BASE[ID] != (hrt_address)-1);
@@ -39,10 +38,9 @@ static inline hrt_data csi_rx_fe_ctrl_reg_load(
  * @brief Store a value to the register.
  * Refer to "ibuf_ctrl_public.h" for details.
  */
-static inline void csi_rx_fe_ctrl_reg_store(
-    const csi_rx_frontend_ID_t ID,
-    const hrt_address reg,
-    const hrt_data value)
+static inline void csi_rx_fe_ctrl_reg_store(const csi_rx_frontend_ID_t ID,
+					    const hrt_address reg,
+					    const hrt_data value)
 {
 	assert(ID < N_CSI_RX_FRONTEND_ID);
 	assert(CSI_RX_FE_CTRL_BASE[ID] != (hrt_address)-1);
@@ -55,9 +53,8 @@ static inline void csi_rx_fe_ctrl_reg_store(
  * @brief Load the register value.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline hrt_data csi_rx_be_ctrl_reg_load(
-    const csi_rx_backend_ID_t ID,
-    const hrt_address reg)
+static inline hrt_data csi_rx_be_ctrl_reg_load(const csi_rx_backend_ID_t ID,
+					       const hrt_address reg)
 {
 	assert(ID < N_CSI_RX_BACKEND_ID);
 	assert(CSI_RX_BE_CTRL_BASE[ID] != (hrt_address)-1);
@@ -69,10 +66,9 @@ static inline hrt_data csi_rx_be_ctrl_reg_load(
  * @brief Store a value to the register.
  * Refer to "ibuf_ctrl_public.h" for details.
  */
-static inline void csi_rx_be_ctrl_reg_store(
-    const csi_rx_backend_ID_t ID,
-    const hrt_address reg,
-    const hrt_data value)
+static inline void csi_rx_be_ctrl_reg_store(const csi_rx_backend_ID_t ID,
+					    const hrt_address reg,
+					    const hrt_data value)
 {
 	assert(ID < N_CSI_RX_BACKEND_ID);
 	assert(CSI_RX_BE_CTRL_BASE[ID] != (hrt_address)-1);
@@ -92,10 +88,9 @@ static inline void csi_rx_be_ctrl_reg_store(
  * @brief Get the state of the csi rx fe dlane process.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline void csi_rx_fe_ctrl_get_dlane_state(
-    const csi_rx_frontend_ID_t ID,
-    const u32 lane,
-    csi_rx_fe_ctrl_lane_t *dlane_state)
+static inline void
+csi_rx_fe_ctrl_get_dlane_state(const csi_rx_frontend_ID_t ID, const u32 lane,
+			       csi_rx_fe_ctrl_lane_t *dlane_state)
 {
 	dlane_state->termen =
 	    csi_rx_fe_ctrl_reg_load(ID, _HRT_CSI_RX_DLY_CNT_TERMEN_DLANE_REG_IDX(lane));
@@ -107,9 +102,8 @@ static inline void csi_rx_fe_ctrl_get_dlane_state(
  * @brief Get the csi rx fe state.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline void csi_rx_fe_ctrl_get_state(
-    const csi_rx_frontend_ID_t ID,
-    csi_rx_fe_ctrl_state_t *state)
+static inline void csi_rx_fe_ctrl_get_state(const csi_rx_frontend_ID_t ID,
+					    csi_rx_fe_ctrl_state_t *state)
 {
 	u32 i;
 
@@ -146,9 +140,8 @@ static inline void csi_rx_fe_ctrl_get_state(
  * @brief dump the csi rx fe state.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline void csi_rx_fe_ctrl_dump_state(
-    const csi_rx_frontend_ID_t ID,
-    csi_rx_fe_ctrl_state_t *state)
+static inline void csi_rx_fe_ctrl_dump_state(const csi_rx_frontend_ID_t ID,
+					     csi_rx_fe_ctrl_state_t *state)
 {
 	u32 i;
 
@@ -184,9 +177,8 @@ static inline void csi_rx_fe_ctrl_dump_state(
  * @brief Get the csi rx be state.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline void csi_rx_be_ctrl_get_state(
-    const csi_rx_backend_ID_t ID,
-    csi_rx_be_ctrl_state_t *state)
+static inline void csi_rx_be_ctrl_get_state(const csi_rx_backend_ID_t ID,
+					    csi_rx_be_ctrl_state_t *state)
 {
 	u32 i;
 
@@ -247,9 +239,8 @@ static inline void csi_rx_be_ctrl_get_state(
  * @brief Dump the csi rx be state.
  * Refer to "csi_rx_public.h" for details.
  */
-static inline void csi_rx_be_ctrl_dump_state(
-    const csi_rx_backend_ID_t ID,
-    csi_rx_be_ctrl_state_t *state)
+static inline void csi_rx_be_ctrl_dump_state(const csi_rx_backend_ID_t ID,
+					     csi_rx_be_ctrl_state_t *state)
 {
 	u32 i;
 
-- 
2.34.1

