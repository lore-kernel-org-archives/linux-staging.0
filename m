Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56B0D199252
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 15:23:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490641; cv=none; b=s2J2Idw1ceHfA8E4rl9zEznwCxE5m2p95pQjcBpeUY+1XlIDzFU2e6Oqab/oAaz5vBsaxiy8vnk7cmOn6UvNZmFeFU1kv3oRNMmp8YhavFb0WwAHeGvrCpBCjNwhFNXSu68hvPTV5uwzXGT8smkvu2LRdEWLCPSCLwR5LVzOj4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490641; c=relaxed/simple;
	bh=kVWTYXzyEGu6bSvDdHUv5uwSixy3sg1Dshdh2TcYYyM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i/Ikdk8KJjNdGJqE4bMbKzCZ+/51j9+SbatnatXDyM+II4KORMjgVZ7Ohce71HkLKYricFLPiHNpBARIcCSCL8aRK0b+GPcvVCdPD1hkDm6a1mmdi/VX/WNPrVSxSkAWrvLYxyMjHCLH7+bgMtXhFtmD2+0KDmyOCiqrrWxdd1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7B7OLJT; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7B7OLJT"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0fe77d141so7904865ad.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 07:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768490631; x=1769095431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ipChp6LQHB81vcBQdiF035Fn4p4lIhN+JvMnabyrpEk=;
        b=S7B7OLJTMRVnT5In3P9r3xdUFy2i8RchAdVOY9vuTxoj9C8s1zs2nl5Vcg0rtcQTEE
         +8MTyJXktX2TXkzAsapoxHSxBMWFaU5ktqwckgXy8trpnbnkj1vaVGYLUOv7xWcan39/
         QBtmkW0gPVda+u/3aXbZo4A4UKsMC0lr09rmRVgnaO2CL2H6NJMqxy1qaqs2L1YwTayw
         s6t+io2OSrMzQy8HlUgo5Ms43+4jlusOeV1XY2AKKEJv9LCn5v/2xjWISfU0ymCyf4Ca
         JRVRsipEfmiRvBwzYrM7Qg/ENcN8CtQjVK7XR9W4k2lKDLlwG2yQb6Eq3hVCJsqxwwHI
         iGRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768490631; x=1769095431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ipChp6LQHB81vcBQdiF035Fn4p4lIhN+JvMnabyrpEk=;
        b=iP13Rs05hrSJe/W7R1F48Kd7huR0IyNelOSemCnEkJDVjz+nPq5tILorxnksDm4jIu
         03uOP3w8+1udMOvYg2eWJyZjnHlvEY+JDx+rvXK05H2jmtiS303aXl/eKshMZo/A2gip
         b/RoS/FVbNIYlpFvjUlKePr50pg1oS0edpLpfX3uDSFn51IJTcZ1jD+y248nv52Vbsau
         OTE/tRX00mYparTbk6FKf6jzhqqLzSkf1yYLkcqES4kXkJ8O2sIQ3pMq2ieZtbJCjXDD
         vJixnW8S3x8+u8BaqgW16bvHdVODLUi7ksX9tZZUdQ+vLSQ01iP6oLXHAM0AK3WbzJh1
         7tog==
X-Gm-Message-State: AOJu0YyJoOyio/4jIJX4od3oUwzm6coytpWGGwbgzUfRzZR5uCPneBfN
	zFKLTkatVBWsQdaidtf8Zfr5jbcz3iLIltGdQJQeKD1hG0qCHupf/IZ/
X-Gm-Gg: AY/fxX55V2gtvEF2gmSLm/4IB9eowONZGneQVfLOsBnffRxADNX1GqjBA60vacjoagA
	XDGSZACZU9SxGZ/cauXjfokZiWRfm0ogbiVtGEvj/LnQeUU+xyru7BO/+dm/NPYmmDr17YVKDao
	LOEuEjN2Nrzj7n4jO/4NcVv0meYmY6aZeDFSGN5cSVSBlfzw/YWIdheMxauwtHy+0tvGxREpUPq
	EIrM/P4lC5+65mUldEx3uzbjzXwX3kqV5mum/+hg82rV01TZA8zy1cHAtEWnCPdJI36AsVmOCdk
	5HDvezPM4AJVSodLXNLX3y9IL2jbqNmbI23R0ayOIQ6sNv41jAefUTYt5UiDTvN4bAeYTOQQBov
	7YBfgfnrjUT67BqXBevr0vwq9ljddLuaINWKK1zSb6HD8hfRo2BzZHqtSEz9TneO/6Pn1FawB7x
	feiLYfMV+uFws4cnpVVgEuCA8zChPFgg==
X-Received: by 2002:a17:903:22c4:b0:29f:2b9:6cca with SMTP id d9443c01a7336-2a599e47d37mr67248555ad.44.1768490631442;
        Thu, 15 Jan 2026 07:23:51 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cb2d93sm258213645ad.63.2026.01.15.07.23.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 07:23:51 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v5] staging: octeon: Remove port status typedefs
Date: Thu, 15 Jan 2026 20:53:27 +0530
Message-ID: <20260115152327.92654-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs and
replace them with struct cvmx_pip_port_status and struct
cvmx_pko_port_status to match Linux kernel coding style.

This also updates the MIPS architecture headers to name the structs so
they can be referenced by the staging driver, resolving the build failure
found in v2.

In v2, the anonymous struct definition in the header caused a compilation
error when referenced in the driver. This patch names the structs in the
headers and updates all usages to use the struct type directly, removing
the typedefs as per coding style requirements.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
Changes in v4:
- Completely removed typedefs (Greg KH). In v3, the struct was named
  but the typedef keyword was retained. Now uses struct directly.
- Clarified commit message regarding the robot report (it was a build failure
  due to anonymous structs, fixed by naming overlap with typedef removal).
Changes in v3:
- Address robot feedback.
Changes in v2:
- Initial attempt.
---
 arch/mips/include/asm/octeon/cvmx-pip.h |  4 ++--
 arch/mips/include/asm/octeon/cvmx-pko.h |  6 +++---
 drivers/staging/octeon/ethernet.c       |  4 ++--
 drivers/staging/octeon/octeon-stubs.h   | 12 ++++++------
 4 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
index 01ca7267a2ba..1e107a9aa650 100644
--- a/arch/mips/include/asm/octeon/cvmx-pip.h
+++ b/arch/mips/include/asm/octeon/cvmx-pip.h
@@ -236,7 +236,7 @@ typedef struct {
 	uint64_t inb_octets;
 	/* Number of packets with GMX/SPX/PCI errors received by PIP */
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 /**
  * Definition of the PIP custom header that can be prepended
@@ -365,7 +365,7 @@ static inline void cvmx_pip_config_diffserv_qos(uint64_t diffserv, uint64_t qos)
  * @status:   Where to put the results.
  */
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 {
 	union cvmx_pip_stat_ctl pip_stat_ctl;
 	union cvmx_pip_stat0_prtx stat0;
diff --git a/arch/mips/include/asm/octeon/cvmx-pko.h b/arch/mips/include/asm/octeon/cvmx-pko.h
index f18a7f24daf8..4b83b2171c12 100644
--- a/arch/mips/include/asm/octeon/cvmx-pko.h
+++ b/arch/mips/include/asm/octeon/cvmx-pko.h
@@ -114,11 +114,11 @@ typedef enum {
 	CVMX_PKO_LOCK_CMD_QUEUE = 2,
 } cvmx_pko_lock_t;
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 /**
  * This structure defines the address to use on a packet enqueue
@@ -574,7 +574,7 @@ static inline int cvmx_pko_get_num_queues(int port)
  * @status:   Where to put the results.
  */
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 {
 	union cvmx_pko_reg_read_idx pko_reg_read_idx;
 	union cvmx_pko_mem_count0 pko_mem_count0;
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index eadb74fc14c8..6d03d23461e4 100644
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
index 35b5078ba51e..f6d502193789 100644
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

