Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7793920E6E2
	for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768756436; cv=none; b=oWnG6VAScu1GtNrozg7nvMKWwqAIOqmrSsS6NyTmydy1f8A1UpUmJUnG6u6HgbyzcWn108MCGn5+SbKMURjXXh8DL0ETQyfRL3bWXcOpg8+VZAmdKysLqXdugLhA3pFEpmSN1B3L+VFW07YjNatLMSodMWHNMCXdV+2VsX0nmJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768756436; c=relaxed/simple;
	bh=NYv4wXfCJsteCh/IKKa+p26JSCus6vhr1+RsekjO2WM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pi7uMO+NdPXV9zuy2O5gao+2Qt157yL1TRWOSyIjKPG/SJ1XrtbsYJCBCRKJfzwbz1pDG5e4zgoego7DYrRL4CPcPUWmM/k13xtFp/KmJAn1s0Y7JRkqHanzWdzzDFeGbktzJwTZ+170xTP4myW83J1OxGKgMi3jttJ4qzimvf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZBfGVTss; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZBfGVTss"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso22439975ad.1
        for <linux-staging@lists.linux.dev>; Sun, 18 Jan 2026 09:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768756434; x=1769361234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X+kJzV16mDttQz/c0iPQYgG9KI/jQGHFGLrakgQpWTY=;
        b=ZBfGVTsswi36U8gNtJ+b2ghL1qo6hQ+EQjJf0I2ybPbbCYKzEAwDJrwBjyKNGH7UfS
         8DBSfrgfG4OOQdLxdKmbZgqfKxMiNKthNtsWJq0S0sDy2hjHW2JCAtPh5lmo5vI57+h3
         Vl85ZkxahTVjIpQks+alyFSA8L+tsaZhLIPMWL4Q996phlSAlZJWwd3hrLJhc/h3VD8C
         NkF0Sw3wyBAc9zm1uLOvnIpv23qaP3Fo10ehVRp82m6lNW4vnm6VYFNpl0VsUI7zmwdk
         /SYvUTTz7l6n0CiPWp9o3zszZGpJqJ6PIkIdKjnfR6/yyD6DZ3sLuclzLXiL1TWV6GCF
         VgVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768756434; x=1769361234;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X+kJzV16mDttQz/c0iPQYgG9KI/jQGHFGLrakgQpWTY=;
        b=EmQOi60+hL8/A5gZaxJj8bU3XSVMAKa6NVErHDi3/BMZMp2XEnbVSefxSuB6G3GCG9
         beVU0x5pgHvVBT+tMTn7p0Ah3WzdfLSLJK/QxRTYVaZY9euN5w1YpHJu3cBbLoB0LqSe
         qMaR7vd00hlrrSnT3zoQTncDhWuZTmyuY+CdJtQ/e1W/6q6RYGve54FwDAV+Ej88GCu1
         kpWjUgzLyI2RDRrTx8KwAoUqmh0J0bELUd1LbJtOTWFP0eRbsqhSwvFboVTUvwDujIe1
         ovKV2dxPjAxkaCMqNwAAYtcUWDv2MepHyzer7oI0rThMYfr2P1iIo9/rZXlzN/a1wkN/
         29uw==
X-Gm-Message-State: AOJu0YywgIVxSi27Z2AtIguBDSV0SBXzOSZZ5rtB41wCsxwV66sFnZmP
	TxCOuctT1bMjtVUtnfdRgkxgFvS1Wjv1vMwdhnwkdM+G3tDAk94V5iGY
X-Gm-Gg: AY/fxX5VggLblmwsC8ALGVKd3i/AK86eh6fzb/oPNX3zARriHswRvYmHYpJNEUaGU41
	10okkHR0L55wzOGPGXHt+LtFPCJfJasL89qnoUbs0su7TLMzR6dUpFMyeaXH8xtUEDAMWaQHxjj
	G/TFB/MWz5sgVJdo5n9BZvAC29Pi3hW+yynw3dK2KecbSdO87UE4431BLyPakkWJKDKv5Rn8qU9
	0q2+yQprNCv7djZR2QtU/ipOWMFaQaFC7G4PbZ2KoEXOfOZLr0LIpr/RfG9Xgb4W9mngaIync8u
	gU68DPDO/V16yHL8KMxC4Ls3F9cD4Tlmvbi1Zp1BmP39Zaa0PfG5FH1mTV1oo9HOsXLQcO/DaDR
	i7H/niPFOcoH0JN6W+xHD6TZ8b3ip+Yy1GITbXA/gdlRickwQGUbPhICZnh44M4R9AShw8AcnrZ
	Cwq+PiaQaoXCPyCaCyRosmV182TsxsdA==
X-Received: by 2002:a17:903:2f8a:b0:2a2:f0cb:dfa2 with SMTP id d9443c01a7336-2a71754509fmr83815545ad.13.1768756433757;
        Sun, 18 Jan 2026 09:13:53 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941c088sm71370285ad.91.2026.01.18.09.13.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jan 2026 09:13:53 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	karthikey3608@gmail.com
Subject: [PATCH v6] staging: octeon: Remove port status typedefs
Date: Sun, 18 Jan 2026 22:43:48 +0530
Message-ID: <20260118171348.54963-1-karthikey3608@gmail.com>
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
they can be referenced by the staging driver. The anonymous struct
definitions in the headers caused compilation errors when referenced
directly, so they are now named structs.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
Changes in v6:
- Actually removed the 'typedef' keyword from cvmx-pip.h (Greg KH).
- Moved changelog history below the --- line (Greg KH).
- Removed misleading Reported-by tag.
Changes in v5:
- Removed misleading Reported-by tag.
Changes in v4:
- Completely removed typedefs (Greg KH). Now uses struct directly.
- Clarified commit message.
Changes in v3:
- Fix build error caused by anonymous structs.
Changes in v2:
- Fix invalid Signed-off-by name.
v1:
- Initial submission.

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

