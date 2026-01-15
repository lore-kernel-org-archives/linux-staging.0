Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7598133B6C7
	for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 12:39:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768480792; cv=none; b=OYgUMlXGrZ+OfmsG0Jj0FPYyKnp8BKqTph5vcSTzHulM8qqdRAq/2OxzmJThJ4iDsXhWLeyPtCJ7P92YwUSQV1yvayf5YL6xactN4M5/QeuOcVwZKYoSq6nnc4S5sXt3Gevjdny+SJNsM2St7pesn0ypIYvjG0nedDHYo22Lxkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768480792; c=relaxed/simple;
	bh=gKAqU+JWfFxMSx4Ys0uzjp3Qev3gJoDn4VvwqP7oNdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kJ5LWEKCAP9+KflCPYdR8Fpab1hfCoq67j6iB3DWZaIPUfp386IT+9UOjK2rZHWiaY7LYur2S173aQOcOSEQMB2YrNoloObqwgy4ixik0U10sxL9wNQ8Ogdrm9qyFPIUSICOaCp6WezKtXmqH73RrtxnTtGpa69PvTIVUUZzAyk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X6W/E/lA; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X6W/E/lA"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c026e074373so375090a12.1
        for <linux-staging@lists.linux.dev>; Thu, 15 Jan 2026 04:39:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768480791; x=1769085591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EG2GU/SfS8q24OqJDu1HCz0B9H6lhX6kcQ5XkWsyYm0=;
        b=X6W/E/lArog1PqdA+K0Qf8uSzeeYA5Uyi8ezLB8svnfi8fNbM2rPjiL1Lf8oXS90Tm
         k0Nf06uHzI7txrcFWnqcZP9WkktQoxcFVaAUbouERlbJ85RgCn76036SW1zN52Nj0U6A
         bsLtIlKrtn59WKO28dMIqr3vm7OPZfOEoaZvQQ6ATQbG7msyrfgJVoK1eSjffP88PMJ7
         K1GHOvE44xBg8wFZKtCQtQ4r/lK0F8KLppYJqbpsLomFRgUohGeyGX6n72Baa1b35ZmX
         DBkBFG8wO0bseCCtl3GhmSaEKUzh/EHiTClYGvj6uAjxwMwmcIZI0xGRPFnniNjdogtr
         PXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768480791; x=1769085591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EG2GU/SfS8q24OqJDu1HCz0B9H6lhX6kcQ5XkWsyYm0=;
        b=b+WhCOzxjmdYTALgr29CR0pQmD3ID8Nh2+DIdq2bCvdycMsgn6Wvrbrc8kkK4kGmfn
         Rksaj/jAUU0bibSUolLy7KuDrHmyYNXD+97W94fq0gqqcisvVQ7rvvxGnaRcoUkd6ahN
         EuRJbfFJ+IQbJZ5Bt4ALQUKYDUKfQJhZNoW20i3W0m5naeWeXbviq0EJHSrelFgbNeSb
         e0mS0etv/EQWqtK8y+YZnj+1NkYfPNJuODzIje7AF//ymmnc+gW8mvl3ZscIrGQPArO0
         UFqvP0Y9DMP8fnpwEmp/YvspBKbefPthKw7Gcija9qauuNFWuMZBp94kgyU38kEGmslB
         NFgQ==
X-Gm-Message-State: AOJu0YxZ4yfZskIr2Whrg+Kd4iTUhD65G6WGkBjNp78f4OiFIHLYyjcA
	jupikAGIGjEeqKZZ5S8RTDeoA8BTlMccPXl2wUey1VWJj/RLx7bY+bORyV8JEQ==
X-Gm-Gg: AY/fxX5tsg3gQlV0P8DFoG3YxLrs4toNMDg3vnySIxr163FJhZEpBipjl/LbYhUrIF8
	e5NKzYw7FXuYiZaVAQVGlj8UNWB4k9EnWVcNt6L+lUpT6Uaz82tu9Ha2qGSQkgMcyj6nd4GEruZ
	cQ2jlis9nJXoRGAaU7FZV9apgf7oCiHc2RyfcOC2aZIqwscB0z7DjzjM7JnDzZMBWEDWXgBwfa8
	1iN2otTxwHkyFfKAI+ZDcoF1pG7i0wNw/caQjYp7KINXPRfx78x3SpcdlRAhnELRRk2Gf1xsB4A
	n7uirqufNISfHjQmQgB7LbhR8VhOVknL3fgYhIAiryQ43l5mzA9qp3VHUsEGeaYsCEPskE+rnH0
	EH0HkROZlStwqk8i71LdHO2QF18KUEwE6IR5e2IOWRZRqd4P93jhVjAFis4WsoF621ePVR4Gh+q
	5rQX+a8Ie8eY+TXPIQ8wks+p8ac+t8Hw==
X-Received: by 2002:a05:6a20:6a26:b0:38d:f62a:a9f7 with SMTP id adf61e73a8af0-38df62aab6emr1179758637.5.1768480790754;
        Thu, 15 Jan 2026 04:39:50 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.163])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c54972a5e67sm18000315a12.35.2026.01.15.04.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 04:39:50 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v4] staging: octeon: Remove port status typedefs
Date: Thu, 15 Jan 2026 18:09:42 +0530
Message-ID: <20260115123942.83341-1-karthikey3608@gmail.com>
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

Reported-by: kernel test robot <lkp@intel.com>
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

