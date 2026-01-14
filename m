Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28D3117BB35
	for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 17:00:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768410016; cv=none; b=mgHVT2s9CyXPXNM2AG8Pp5L533oS9yn+GetCeYJDEE6HLKSyD/kFUBku0uHNRjd7S6cH6LR9oq9VPor9JhjQoxl4hDhfK49vBuqO5E7Z48RGv0j4Vx3G2CvN98wo0/TnyhLDVLHzPZSR4aO0sb/HU6T2R+v1urHymY22mBHtNHM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768410016; c=relaxed/simple;
	bh=TdQ1PxnixZuTqBgDjCx71BraKAPrKTU04PfdZhnHF8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CRxKXlzkbXTEC+0gDtl3h8jPGxkpIP9o8Iz9MKx9LX+qTz4Os3QhcQu1x3a9KiJ2SuV/lqNhU7vIE9OUfyn2dbKxm+mAAjag2/Jc8lh1rR+pJ/Q0tvZzJ2wlL4FkJW0wV/jzb15pT+5rcF54B9SZaAJY940sWmReC9YC5GSejqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eRYwa4Eb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRYwa4Eb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-34c2f335681so5214878a91.1
        for <linux-staging@lists.linux.dev>; Wed, 14 Jan 2026 09:00:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768410013; x=1769014813; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GagbSgLZicpSoO4nWTcoXi5mvyUj9ai6yjSI7MoALoI=;
        b=eRYwa4EbFc7L71uB3QBK/Wr5kQdeVWMSIvksNOudHomuI/QBT61GB/GVWyS5SnEcxc
         dl2rfltivjekOMLFFP7pjIXa7hsGTrqHkhpsG232a2XWXmBf97sKe5CAEZaNbKHUSUSQ
         SF1CI4GeVJp2wGpCI8YJR3vP/wImXZb+609F5IslWsg1baxrjf3bcuFPLfchprkRADH4
         6glqkF55uFBughdz9EGSJ+KWs8iuONt43QVBARiJ3zHQ35yF8Df7IcmCSpQOvTNZ5ija
         cq/mSFZEIb/O2D7Okz5SKxtcJ+yHhURjXHGzf3/xgug+NYxL2YInnXPJlcl/KOXTlHq5
         QpYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768410013; x=1769014813;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GagbSgLZicpSoO4nWTcoXi5mvyUj9ai6yjSI7MoALoI=;
        b=GeyW2e06kt61Cvh7M0eNwz/RmkffDOoIrsSaK4gSyzEdiEQA2o6tPavdfB3pPJkpsi
         9Kqfz/NXpOPif0pIyHJObkyK1MEM8qwwWOvMzrsgTKMXY/r8cvrvQntnra+YRQBZAUyn
         rkj8KVDiQxEsn+/y2RPrN4nU1yM2CiPQXXY6AMy8Pq22R/BugU/sj4Zh7z4F89r85S0E
         D3V8D/tMvXzJyheXpAT54n4wPXpg8fVvnzRG2e9fabZVFpNViO/QpfIbY4gT94HmP03i
         IhKvjxZGjlMO22jG5ckPT/P72qlapqh9ogMZWomhbr8SI6VB3kHuvOZVi2ofFxS+5E1o
         EmqA==
X-Gm-Message-State: AOJu0Yyr8jCaUfpM4xge9D2JTucMCACM2NghUUZkquHTyS3OR0+J4gn/
	7RRzHgpCuKmzOXkh0KBYqTS0+y2P+v7eQocg0M6B6G0j94nMfdYhJi85
X-Gm-Gg: AY/fxX6GAk81s24rFL5jZTIte49junCZF4NGx2VWnD04g+cT/KVboUCgvfak7llQMk4
	rS6wfRJ52yEjy7a2F1EKyAxcebionYyTeX5NdKZ9l6OqkmrQzLUcG65PWnsZWnhYrGwpAMZvcPr
	zBrhqgbcNUWydWc+dYPsllcFUr2nyv41LaS3YJ7HqyFbZ4d/RnMiR6ULDMG7t9lWToivzAxBQL9
	XLsioeeViaqhvlhRh9EOD9JF3aRFTXYB9pA8fNM4kGh3BFLyoVBCdZ+vJwuYLJU2Dvii4f+DA72
	LuKdKeaPj6oHtWcC9cbSsFn04HMuRw9j7XYwp7Xv0lKAYxHEqqLY9K+TdNV1zWEr6W44iaYiCJ0
	rhrzTSqz0mA+VPoxWGcbRw70bXbrMyEVLBVR9tbm+BbUsKdYJkrdP3WNJegs5y8s3Ucth38vPJ3
	d6munUipJIb31Mw5ikOLGPpaw=
X-Received: by 2002:a17:90b:4a52:b0:340:e8e9:cc76 with SMTP id 98e67ed59e1d1-351090da00fmr3612320a91.11.1768410013265;
        Wed, 14 Jan 2026 09:00:13 -0800 (PST)
Received: from karthik.bbrouter ([103.215.237.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-352677c9315sm32098a91.2.2026.01.14.09.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 09:00:12 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org,
	tsbogend@alpha.franken.de
Cc: linux-staging@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	karthikey3608@gmail.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v3] staging: octeon: Remove port status typedefs
Date: Wed, 14 Jan 2026 22:28:34 +0530
Message-ID: <20260114165834.33387-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status
to match Linux kernel coding style.

This also updates the MIPS architecture headers to name the anonymous
structs so they can be referenced by the staging driver.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601131108.A90iCRFi-lkp@intel.com/
Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
v3:
  - Fix build failure by naming anonymous structs in MIPS headers
    (Reported by kernel test robot).
  - Add Reported-by and Closes tags.
v2:
  - Remove invalid "Unix Antigravity" Signed-off-by.
  - Submit as standalone patch (detached from unrelated series).

 arch/mips/include/asm/octeon/cvmx-pip.h |  2 +-
 arch/mips/include/asm/octeon/cvmx-pko.h |  2 +-
 drivers/staging/octeon/ethernet.c       |  4 ++--
 drivers/staging/octeon/octeon-stubs.h   | 12 ++++++------
 4 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
index 01ca7267a..cb3342313 100644
--- a/arch/mips/include/asm/octeon/cvmx-pip.h
+++ b/arch/mips/include/asm/octeon/cvmx-pip.h
@@ -180,7 +180,7 @@ typedef union {
 /**
  * Status statistics for a port
  */
-typedef struct {
+typedef struct cvmx_pip_port_status {
 	/* Inbound octets marked to be dropped by the IPD */
 	uint32_t dropped_octets;
 	/* Inbound packets marked to be dropped by the IPD */
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24d..46bb5ddcb 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -114,7 +114,7 @@ typedef enum {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 } cvmx_pko_lock_t;
 
-typedef struct {
+typedef struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc1..6d03d2346 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,8 +201,8 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pip_port_status rx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 35b5078ba..f6d502193 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -409,13 +409,13 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1260,11 +1260,11 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
 static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-- 
2.43.0

