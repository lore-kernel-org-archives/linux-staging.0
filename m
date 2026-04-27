Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F17334572F
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305285; cv=none; b=j+DE5Q9aneEdYY5gtDUwrpgoKGzilaaX1wsFBfdK+5+JztlKE7F8cEfjxGVnW+XWpeRgCi1cJZ99L0fycDljyrtt+aJct3M0YyYRM58D2Ac2XP6QwLWrKVkfhTX1QbpsvU4KZZg8kWg9XfTmnqkifG9vjPu75lmN+Jgb+q7T9WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305285; c=relaxed/simple;
	bh=Lx+FWdTX4CUROM4Gf843xRsUmieLSZtB1d7xcdZ8S/k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=W6LVptxR4U23utdO6omaMcI/6Z/senq033wN0nR1IK2PwpbOqrLbzpH0h37iVLSOV3gZDZGPi7b/4dbjGTNYLPuXm6ZoIbXbeFq10vVNOjoYspZ09PR45TzCznFhnp9TlnfJzpOizW5gEnikApY1If5eJz04oljqU5QnX5Iehvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WpanEBtp; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WpanEBtp"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-82fbdd60b64so5590880b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305284; x=1777910084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgFqJGxTSWQ0zarrhY26FqAsVAR+FlyVmEuRhaiFjvY=;
        b=WpanEBtpDBr7u8Rc8eAZhxOWWjqcN3LykPq2MPRvegSED+nHCYBiOj5VLQM0unBwzf
         tPnt9/2AzyAkeAWgzqVlLR0McDA7qVvE7kI7BFu7zUScEe+4pKTe7xi/eQyCWXLK/WNG
         uee3X5+8jZa6o1PkI3B8toSR61hquaI7kx/tP+1zfPPzpnsdr04JZBfAA2OkaG3e/ynj
         TXM+iAqC2Eg7daPeBTOdpQYjpD5lfzjO5ygQJuwvz2wj5tDxUqpwEqVEndJAOq6a2O9+
         UdjWpG+5gtFdiXq5wMBBmjsIQkbb9T3D1M959E7z+11cReN3uID1yqAn7P3/0dCjt34Y
         XeYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305284; x=1777910084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DgFqJGxTSWQ0zarrhY26FqAsVAR+FlyVmEuRhaiFjvY=;
        b=bSDB/yEZtabnhWF5DHGkBXq1F7JlwNr3u3ismW+FNn62KzobhrAnfcTIGGsfR9EMe0
         6ZB8jDSWz05+xW+svzzQVCsMa4pyAQRDxBH0o+ZdVfqdAVpxIhRJbD4GOhz35dKmDm1Q
         hW6KlXlotBc50ynbhix+HAtOtN5TOHWVlj2WWZozM4A+Y28TPSetEPMa4Jm8zlA88jzy
         r8f8zFyxclsMM4owK/1IWMRQDcK7/l9iZIzU/Pq+geAtWd4v2xegUkV3T99mIAO5YpLq
         KbHH0yfczhjavbD8YMdRugs6hMqePqvvF609+XUjlXhKkDiMrTks4gzXM52Hhu9bn6lg
         UU+A==
X-Forwarded-Encrypted: i=1; AFNElJ88OWoJm+fevJZnI44H8QIu+qNzX4a9WYhDVgDczeu32PCyW6K6KU3RqPWHCUMt+YWn4CvdOKVXupYCiCqE@lists.linux.dev
X-Gm-Message-State: AOJu0YxGlgOsGrm1TbKZ4GgWeF1vOX9fcL1j7eR8uBv4SDfw6Eo2CyoQ
	uqhsb+RY/P00LdF5yB5ayLWQ7/a3oDMlDrg3nIdq1fjcSOrBKz9ixxiwfPJKDQtNUdk/IQ==
X-Gm-Gg: AeBDietLC7x7yv/L35XddeNThIkT+m4HPCVz3lOqc2ffC6sN7+3/c3yu48UZZZtlwHE
	9mW6HVvVZknpr16xfxgfLTFEQrpK+ILixEWsTD+M5K+bzAZQWUPgrMPxQxjpPOgtmnj4VYzbDdV
	k6vBfmeayj7v84Ury8E05CduiOZEkOb2BxqQkS6M38F11/uAHH+2CBQpy5iZVpG5ecD4QE34ECh
	26L1c/LfF5SUOBzImr+ZLm9tqqk456AF9NO92Vnphyo2hrVEuGJozF0A9zyzyOjAQkiUnqP+sqB
	WdilI8QTqXG/zfcpCsdkjkAg0pmg7RuaJV0e+x9Lm1V7UvxmSVV0Vj4g0/4XbrB6JClbHFX1+YE
	2ggI83GKrNVJQVbLOpYRXdWtAVqcemdLqprqVFmBAYihIcwn0djvd3kX4G/6gf84O3L+x1Ibc94
	uu232gkk4NgTXlAlnEyhRX+wsSmesKyqHwBk5YbZured/rPhwQ0gE=
X-Received: by 2002:a05:6a00:2e15:b0:82c:d7c9:5479 with SMTP id d2e1a72fcca58-82f8c9024bamr47144381b3a.32.1777305283728;
        Mon, 27 Apr 2026 08:54:43 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3829sm34445786b3a.31.2026.04.27.08.54.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:43 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 4/7] staging: octeon: convert cvmx_pko_lock_t from typedef to plain enum
Date: Mon, 27 Apr 2026 23:54:24 +0800
Message-ID: <20260427155427.668540-5-kunjinkao.jp@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
References: <20260427155427.668540-1-kunjinkao.jp@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Linux kernel coding style discourages the use of typedefs for
enums. Convert cvmx_pko_lock_t to a plain 'enum cvmx_pko_lock' and
update all users across the MIPS Octeon architecture code and the
staging driver stubs.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pko.h | 10 +++++-----
 drivers/staging/octeon/octeon-stubs.h   |  8 ++++----
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24daf8..d8e74a305646 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -93,7 +93,7 @@ typedef enum {
 /**
  * This enumeration represents the different locking modes supported by PKO.
  */
-typedef enum {
+enum cvmx_pko_lock {
 	/*
 	 * PKO doesn't do any locking. It is the responsibility of the
 	 * application to make sure that no other core is accessing
@@ -112,7 +112,7 @@ typedef enum {
 	 * ll/sc. This is the most portable locking mechanism.
 	 */
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
 typedef struct {
 	uint32_t packets;
@@ -374,7 +374,7 @@ static inline void cvmx_pko_doorbell(uint64_t port, uint64_t queue,
  */
 
 static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 {
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG) {
 		/*
@@ -419,7 +419,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
 	uint64_t queue,
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
@@ -463,7 +463,7 @@ static inline cvmx_pko_status_t cvmx_pko_send_packet_finish3(
 	union cvmx_pko_command_word0 pko_command,
 	union cvmx_buf_ptr packet,
 	uint64_t addr,
-	cvmx_pko_lock_t use_locking)
+	enum cvmx_pko_lock use_locking)
 {
 	cvmx_cmd_queue_result_t result;
 	if (use_locking == CVMX_PKO_LOCK_ATOMIC_TAG)
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index df0456417f15..06cb4f15d9d5 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -240,11 +240,11 @@ enum cvmx_pow_wait {
 	CVMX_POW_NO_WAIT = 0,
 };
 
-typedef enum {
+enum cvmx_pko_lock {
 	CVMX_PKO_LOCK_NONE = 0,
 	CVMX_PKO_LOCK_ATOMIC_TAG = 1,
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
-} cvmx_pko_lock_t;
+};
 
 typedef enum {
 	CVMX_PKO_SUCCESS,
@@ -1383,12 +1383,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 }
 
 static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
-						cvmx_pko_lock_t use_locking)
+						enum cvmx_pko_lock use_locking)
 { }
 
 static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
 		u64 queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+		union cvmx_buf_ptr packet, enum cvmx_pko_lock use_locking)
 {
 	return 0;
 }
-- 
2.43.0

