Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37ED2359A89
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 15:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777305295; cv=none; b=S0Zjfz6s1eaQq4wv6zlWDnMSuyNX6K90W61+aUw/C50PvlrwUh5rODMoHI53wSpixUjndcGf3p3QdyTxlAfEjn3ZtjyNgmitVNqYvnxciNf514N40zalimLpQM13rmV6mPorUinnSclFu/u+0l9g8tZZ9uCW73w0Hd7NcLrstwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777305295; c=relaxed/simple;
	bh=23evcU1TdjFjzg2aQNROqzfbxAgSpKxe6AK/+hAaEV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U6fJ3E+S1uImpn6Z2q+Pd7c/18k1hVlXECVJkgdU4pWj84TaNIcIpvSVGDkucXLLDP0PyWtgxvj1ElvsEdq3Um219V08H654TTN4p3UrJZe23XQDcMnG1yvHAUG3r/wHqZD0w3zf1WUjb14Me1XKC9aE6RAlI5pTeK1nmCer6SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k+c9BIdC; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k+c9BIdC"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d90833cacso6491999a91.2
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777305294; x=1777910094; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ir1hTXu7IWWfjs4gdRRexBIGEymH3qRIcAM1ZommSVw=;
        b=k+c9BIdCvBapExujKsRjCyZqkadrt4xliWX4SXwqCqBYnzmH9Qm4x8nSLBZTOKayUo
         tcdC2sZAjDv3DchDYzQilTdqynQ2fjLYwnzBB8DkkK7P0z2BpGTl8fl3sWNFjDjydL+8
         o0A6RE9eR4uzTnnpJdoJlKvcnMJI/vQp8zL/CABx00Cj57N+0ORFoSs76FTth0RBh1FA
         uMIpEzXgxT/6ks4tVGyJUErc1Wcj9pRns2SXqgTtmTC7lOifxiTX5MgVWrdEo/h6Yld2
         jmMPfe5olzDFf6nsbHbnH/UamxoOfyzvPpG88d4JYeCHkjhrZ4knKRo7rrSRS8SyF7OP
         roxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777305294; x=1777910094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ir1hTXu7IWWfjs4gdRRexBIGEymH3qRIcAM1ZommSVw=;
        b=bPI+jtS5pXwVinINOXHfMFUyQ60oVJ2ko8vfwdz9UxADphte79KAv4JM3bPGboQ3Bl
         wvbhTewDUmOWaGPVVrHVHIZ76y9A35rK4Ui808A3CBAfz7tV2za1jLwa7MajhtNP8P9I
         ImEu3CXCjgAkvxXCRVj8ICJ0ruQssaldO3FHOWhRDR6vIdRsA3bOAB6U2QUYXeKKmYtG
         RdkqpThy2Rwc33ujCcMQn2b0yan3bcM3gOYEYaf1Z/XLduQfc2Jf0Xw/l0dSEO6hga2H
         QkRUE3OZtokAUe+Lde81bUc9RDw9luwrWrC4auSbmQ8BPL+gIWSXezLBXTnKLVrpcYtw
         ZL5g==
X-Forwarded-Encrypted: i=1; AFNElJ/ec1d9hjEcAUWhCBwLxChc3+LgYXn72r6IvGEKpQjKBgr/jcs0lIW2VTA17F7l1qoa/vdEUTmD0U3tTlGr@lists.linux.dev
X-Gm-Message-State: AOJu0Yzs/6lveFK5ewauyCoFx+ayi4jx5dWQpGzY0u24WFPXFcTAqzq3
	xvyOGAYUrJGPetvpgi/9ObntkHGmj2mjqhMKBCiGccfi4Bj7y1pNRGqQ
X-Gm-Gg: AeBDievn8k7xv7abRQSZMQ4vSJMTYsiAERJchrKFxVJ82G1s1SCmNJe8D+p8ETON1lN
	4buHCrhcTH67LHxAuFQORBNNbZMI8HUdrnjRt2WEelAeMU2MUptmVUL7HdnsI4aMFUrz65ag+ZX
	A72zVkxQmdIX3T3DnFMbYe18Rx9Fe2ptto9wb9CSMdH71GGRLEHRLtUb2nZgQE2DPRAKlQFFzxa
	tRmQ54/AfnRYPIx3E0A0e6hHUG3gqezq8iEjcgDHXYmmMZz0a98yh9bOvWlqtt5eoNJaMT+Vn50
	frk+PAtgB6PjSHhZT/A05ohbC8LD4rbn66IJM3Vl9Yf6j8JlgKjMtk5CV50tlZxP9ofnfTYhbdu
	msPUyG50GDDyfflyDqkSEh9Q145aICLFgKVxZmnkAngSMUSwvG49B/hDfHjxSE684XOwWjafB77
	DQ3n7vfLSvmxxKu2Gr8mqoIzWDc2VtI7siH//5WW9GutkDNG3o+fo=
X-Received: by 2002:a17:90b:3c0c:b0:35b:e690:c5ad with SMTP id 98e67ed59e1d1-361404a1ef6mr45500096a91.25.1777305293271;
        Mon, 27 Apr 2026 08:54:53 -0700 (PDT)
Received: from localhost (vps-e1cc9378.vps.ovh.us. [2604:2dc0:202:300::1365])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3614195a8f0sm31413787a91.12.2026.04.27.08.54.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 08:54:52 -0700 (PDT)
From: Eric Wu <kunjinkao.jp@gmail.com>
To: Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-mips@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Eric Wu <kunjinkao.jp@gmail.com>
Subject: [PATCH 7/7] staging: octeon: convert cvmx_pip_port_status_t from typedef to plain struct
Date: Mon, 27 Apr 2026 23:54:27 +0800
Message-ID: <20260427155427.668540-8-kunjinkao.jp@gmail.com>
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
structs. Convert cvmx_pip_port_status_t to a plain 'struct
cvmx_pip_port_status' and update all users across the MIPS Octeon
architecture code and the staging driver.

No functional change.

Signed-off-by: Eric Wu <kunjinkao.jp@gmail.com>
---
 arch/mips/include/asm/octeon/cvmx-pip.h | 6 +++---
 drivers/staging/octeon/ethernet.c       | 2 +-
 drivers/staging/octeon/octeon-stubs.h   | 6 +++---
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/mips/include/asm/octeon/cvmx-pip.h b/arch/mips/include/asm/octeon/cvmx-pip.h
index 01ca7267a2ba..911276ee90c2 100644
--- a/arch/mips/include/asm/octeon/cvmx-pip.h
+++ b/arch/mips/include/asm/octeon/cvmx-pip.h
@@ -180,7 +180,7 @@ typedef union {
 /**
  * Status statistics for a port
  */
-typedef struct {
+struct cvmx_pip_port_status {
 	/* Inbound octets marked to be dropped by the IPD */
 	uint32_t dropped_octets;
 	/* Inbound packets marked to be dropped by the IPD */
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
diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 448a4ec42d0b..d85a9991faf6 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,7 +201,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
+	struct cvmx_pip_port_status rx_status;
 	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 7bb72e152f08..9c1968b7e2d1 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -386,7 +386,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	u32 dropped_octets;
 	u32 dropped_packets;
 	u32 pci_raw_packets;
@@ -409,7 +409,7 @@ typedef struct {
 	u32 inb_packets;
 	u64 inb_octets;
 	u16 inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 struct cvmx_pko_port_status {
 	u32 packets;
@@ -1260,7 +1260,7 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
-- 
2.43.0

