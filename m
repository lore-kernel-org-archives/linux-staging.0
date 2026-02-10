Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B85FB2E9729
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 04:36:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770698196; cv=none; b=KpunV91JPqeUTKpSFJl1mqBrVRmQJvS5eMSxLHPSJMYZy1NY3dhE0givD5Xik5hYzi+UmcxpqFDhFs/c8nTEQXszU2VSuzUbN1CaqHXjlRRjwUb9/pbPzkNq5HV9lEg417NEi9TgEP73orqP/KX9sibyGx6LJdonaXq6UdqotBQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770698196; c=relaxed/simple;
	bh=IEBTBhxh7sC8nkHO8lA3BqBD9Nu4qV+4g09NyMN5PB4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q6mq5YbX3VQdEuNZHkID6+yX2sAePgHz2bjEmtW42irm6ezIjz6Ry7hwZrwBOP8cpLEaJdX3yhvU6tm7AalapEsyKvHJlcrrzNaCY0OZZ2ca0oZrKpK1bsRbh3Zd9E7UXRyKMOXhhuI1QBqsstTioI1/FMZMnDCxVDYWDcRyeMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Yy19Xp9A; arc=none smtp.client-ip=209.85.217.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Yy19Xp9A"
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-5eea35e808dso115290137.2
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 20:36:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770698193; x=1771302993; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hV+BVBgJaATMWroNJCeU82hytR6uCK0h3vjLVBNBQ+I=;
        b=Yy19Xp9AQts2ukooWPXIHqtDN7q2SOX1Dsdg+RCTy/7RvwaspuJ9AH2RylcIxHRoNs
         9eVMPKxlNYf0PQG88xzZGsTnMmvL/ltUnC28xqgJCI7hVrrq0kVQQTIsqUeDbODQ0GjW
         Q6fYsOwNtWlHpILMYma0NuaxBEpIkiCCV0DYo2+gYAf06FYFqgqtrlT7MYX0Zq/S30lj
         4TqsE5lxrAywiEPjwQIF4X2bwsrHcQ06mMS+QufLGjnX/u/Pt+8HCw99S0q+Do6Z0xoD
         GuSKG86VKaEOhXiFMtFHCVicgLQddHkl4D7+kpp/bUjEcY4Xt7r0BCUcIiBF1ABzX2Fg
         zPLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770698193; x=1771302993;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hV+BVBgJaATMWroNJCeU82hytR6uCK0h3vjLVBNBQ+I=;
        b=NwWJwqu91HcbBpXImkAKyXP7WDRkd5RsOOh9Udj+yD299H3Whbq503KQ0eCFJjPlkv
         7eDZQ+iBUeoD+c2pSc42OhwrWodILxQ9D/UNDstXIhNc4FYDkiSJAJ0UHnyD1HYiBs8M
         8PpFO4l01U6Fhy6olkxQJre+iTkmFeM01morcdpPNXMLyCoUKcQ2IibYzod7CS+/+imK
         bZNQM8PW3zypITqrgYWoVFIj7nwmk/AOJ9akKuilwW0q4ZrBiqy0m6GPUJky6wMcP80R
         dodj2IX84koEZJortELFeTvSGphkv/prRSqfsj9L1/ZwuO/EhCDnk0YsZM6T/D3TSzXc
         oCUg==
X-Forwarded-Encrypted: i=1; AJvYcCW8S7xjNMxsSHa0h4fnIYmLob3JzEciGvd2yXVc2Td+2De2F1Z07oPFeQ7mhGdJ3Bmv5eNFEEfTbF54Bf2r@lists.linux.dev
X-Gm-Message-State: AOJu0YyvwVbRTnazg3Q8Y0z7yYUlpidw1ZULbxCwoMFOqmiFLgzbHZCT
	5pQ/hnRaxaZA2MMdcPeQx+oocDt0p4eT3a5+MQNIU5Wgffc1+VCKbH9wKtXaHY9/
X-Gm-Gg: AZuq6aIhVUszKzrWZHxIrekZcg5omq2+MEIpsjmZhYDXOKwcNAototIGNex9oTF0znY
	vyQ5DGwJQUykvgQTTtLe+hLHRisdBYQDSdh+w85y7nxlkbbcp185rp04M+yIgQsHrLo9gBmxnNd
	DVU/L581avNzx7zwMPXQulT6PfcgyNyvWNCvpAumr8lDiwnYPSNtODpC533WfK0DYDgyOBlswXt
	9TydYP6QEN6MT67yQ/RN9oAk2JyqETU3BsBpltnaP6no2wjQtOrYFroneVnEDfaj2q+RElI9mUv
	rGJ0ru67YLmfIb9uUBNesVr1IfGtNIP/XLCMQXaO2tDgGpt/wS0G7Dvawx7UIyGL8i4KrQhmWET
	ZIJgmlU9VjzIYLP3Y+nGQH/N9ZQPS2Rpuo5DH6xc0cmgG3NLuhYoZ4yOr4prclRSCf0Q8XpQH1p
	bp6rWx/Ds2ODsXM/Ucc2ZaKfzOwpbH
X-Received: by 2002:a05:6102:3713:b0:5ef:a666:5654 with SMTP id ada2fe7eead31-5fae8c0aa2cmr4272017137.34.1770698192397;
        Mon, 09 Feb 2026 20:36:32 -0800 (PST)
Received: from localhost ([154.41.185.172])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5fae8de2a55sm4199304137.4.2026.02.09.20.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 20:36:31 -0800 (PST)
Date: Tue, 10 Feb 2026 00:36:31 -0400
From: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH] staging: octeon: type change from uint<bits>_t to u<bits>
Message-ID: <aYq028TNyXQWZ_v5@home-pc>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Runing the ckeckpatch.pl on the staging/octeon driver they where using
uint<8/16/32/64>_T as type declaration and the checkpatch.pl was
putting a [CHECK] flag on those and that they should be change to
u<8/16/32/64>

Signed-off-by: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
---
 drivers/staging/octeon/octeon-stubs.h | 1922 +++++++++++++------------
 1 file changed, 972 insertions(+), 950 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 35b5078ba51e..aea3dad37cfe 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -1,188 +1,190 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE	512
+#define CONFIG_CAVIUM_OCTEON_CVMSEG_SIZE 512
 
 #ifndef XKPHYS_TO_PHYS
-# define XKPHYS_TO_PHYS(p)			(p)
+#define XKPHYS_TO_PHYS(p) (p)
 #endif
 
 #define OCTEON_IRQ_WORKQ0 0
 #define OCTEON_IRQ_RML 0
 #define OCTEON_IRQ_TIMER1 0
 #define OCTEON_IS_MODEL(x) 0
-#define octeon_has_feature(x)	0
-#define octeon_get_clock_rate()	0
-
-#define CVMX_SYNCIOBDMA		do { } while (0)
-
-#define CVMX_HELPER_INPUT_TAG_TYPE	0
-#define CVMX_HELPER_FIRST_MBUFF_SKIP	7
-#define CVMX_FAU_REG_END		(2048)
-#define CVMX_FPA_OUTPUT_BUFFER_POOL	    (2)
-#define CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE    16
-#define CVMX_FPA_PACKET_POOL		    (0)
-#define CVMX_FPA_PACKET_POOL_SIZE	    16
-#define CVMX_FPA_WQE_POOL		    (1)
-#define CVMX_FPA_WQE_POOL_SIZE		    16
-#define CVMX_GMXX_RXX_ADR_CAM_EN(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CTL(a, b)	((a) + (b))
-#define CVMX_GMXX_PRTX_CFG(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_FRM_MAX(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_JABBER(a, b)	((a) + (b))
-#define CVMX_IPD_CTL_STATUS		0
-#define CVMX_PIP_FRM_LEN_CHKX(a)	(a)
-#define CVMX_PIP_NUM_INPUT_PORTS	1
-#define CVMX_SCR_SCRATCH		0
-#define CVMX_PKO_QUEUES_PER_PORT_INTERFACE0	2
-#define CVMX_PKO_QUEUES_PER_PORT_INTERFACE1	2
-#define CVMX_IPD_SUB_PORT_FCS		0
-#define CVMX_SSO_WQ_IQ_DIS		0
-#define CVMX_SSO_WQ_INT			0
-#define CVMX_POW_WQ_INT			0
-#define CVMX_SSO_WQ_INT_PC		0
-#define CVMX_NPI_RSL_INT_BLOCKS		0
-#define CVMX_POW_WQ_INT_PC		0
+#define octeon_has_feature(x) 0
+#define octeon_get_clock_rate() 0
+
+#define CVMX_SYNCIOBDMA \
+	do {            \
+	} while (0)
+
+#define CVMX_HELPER_INPUT_TAG_TYPE 0
+#define CVMX_HELPER_FIRST_MBUFF_SKIP 7
+#define CVMX_FAU_REG_END (2048)
+#define CVMX_FPA_OUTPUT_BUFFER_POOL (2)
+#define CVMX_FPA_OUTPUT_BUFFER_POOL_SIZE 16
+#define CVMX_FPA_PACKET_POOL (0)
+#define CVMX_FPA_PACKET_POOL_SIZE 16
+#define CVMX_FPA_WQE_POOL (1)
+#define CVMX_FPA_WQE_POOL_SIZE 16
+#define CVMX_GMXX_RXX_ADR_CAM_EN(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CTL(a, b) ((a) + (b))
+#define CVMX_GMXX_PRTX_CFG(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_FRM_MAX(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_JABBER(a, b) ((a) + (b))
+#define CVMX_IPD_CTL_STATUS 0
+#define CVMX_PIP_FRM_LEN_CHKX(a) (a)
+#define CVMX_PIP_NUM_INPUT_PORTS 1
+#define CVMX_SCR_SCRATCH 0
+#define CVMX_PKO_QUEUES_PER_PORT_INTERFACE0 2
+#define CVMX_PKO_QUEUES_PER_PORT_INTERFACE1 2
+#define CVMX_IPD_SUB_PORT_FCS 0
+#define CVMX_SSO_WQ_IQ_DIS 0
+#define CVMX_SSO_WQ_INT 0
+#define CVMX_POW_WQ_INT 0
+#define CVMX_SSO_WQ_INT_PC 0
+#define CVMX_NPI_RSL_INT_BLOCKS 0
+#define CVMX_POW_WQ_INT_PC 0
 
 union cvmx_pip_wqe_word2 {
 	u64 u64;
 
 	struct {
-		u64 bufs         : 8;
-		u64 ip_offset    : 8;
-		u64 vlan_valid   : 1;
+		u64 bufs : 8;
+		u64 ip_offset : 8;
+		u64 vlan_valid : 1;
 		u64 vlan_stacked : 1;
-		u64 unassigned   : 1;
-		u64 vlan_cfi     : 1;
-		u64 vlan_id      : 12;
-		u64 pr           : 4;
-		u64 unassigned2  : 8;
-		u64 dec_ipcomp   : 1;
-		u64 tcp_or_udp   : 1;
-		u64 dec_ipsec    : 1;
-		u64 is_v6        : 1;
-		u64 software     : 1;
-		u64 L4_error     : 1;
-		u64 is_frag      : 1;
-		u64 IP_exc       : 1;
-		u64 is_bcast     : 1;
-		u64 is_mcast     : 1;
-		u64 not_IP       : 1;
-		u64 rcv_error    : 1;
-		u64 err_code     : 8;
+		u64 unassigned : 1;
+		u64 vlan_cfi : 1;
+		u64 vlan_id : 12;
+		u64 pr : 4;
+		u64 unassigned2 : 8;
+		u64 dec_ipcomp : 1;
+		u64 tcp_or_udp : 1;
+		u64 dec_ipsec : 1;
+		u64 is_v6 : 1;
+		u64 software : 1;
+		u64 L4_error : 1;
+		u64 is_frag : 1;
+		u64 IP_exc : 1;
+		u64 is_bcast : 1;
+		u64 is_mcast : 1;
+		u64 not_IP : 1;
+		u64 rcv_error : 1;
+		u64 err_code : 8;
 	} s;
 
 	struct {
-		u64 bufs         : 8;
-		u64 ip_offset    : 8;
-		u64 vlan_valid   : 1;
+		u64 bufs : 8;
+		u64 ip_offset : 8;
+		u64 vlan_valid : 1;
 		u64 vlan_stacked : 1;
-		u64 unassigned   : 1;
-		u64 vlan_cfi     : 1;
-		u64 vlan_id      : 12;
-		u64 port         : 12;
-		u64 dec_ipcomp   : 1;
-		u64 tcp_or_udp   : 1;
-		u64 dec_ipsec    : 1;
-		u64 is_v6        : 1;
-		u64 software     : 1;
-		u64 L4_error     : 1;
-		u64 is_frag      : 1;
-		u64 IP_exc       : 1;
-		u64 is_bcast     : 1;
-		u64 is_mcast     : 1;
-		u64 not_IP       : 1;
-		u64 rcv_error    : 1;
-		u64 err_code     : 8;
+		u64 unassigned : 1;
+		u64 vlan_cfi : 1;
+		u64 vlan_id : 12;
+		u64 port : 12;
+		u64 dec_ipcomp : 1;
+		u64 tcp_or_udp : 1;
+		u64 dec_ipsec : 1;
+		u64 is_v6 : 1;
+		u64 software : 1;
+		u64 L4_error : 1;
+		u64 is_frag : 1;
+		u64 IP_exc : 1;
+		u64 is_bcast : 1;
+		u64 is_mcast : 1;
+		u64 not_IP : 1;
+		u64 rcv_error : 1;
+		u64 err_code : 8;
 	} s_cn68xx;
 
 	struct {
 		u64 unused1 : 16;
-		u64 vlan    : 16;
+		u64 vlan : 16;
 		u64 unused2 : 32;
 	} svlan;
 
 	struct {
-		u64 bufs         : 8;
-		u64 unused       : 8;
-		u64 vlan_valid   : 1;
+		u64 bufs : 8;
+		u64 unused : 8;
+		u64 vlan_valid : 1;
 		u64 vlan_stacked : 1;
-		u64 unassigned   : 1;
-		u64 vlan_cfi     : 1;
-		u64 vlan_id      : 12;
-		u64 pr           : 4;
-		u64 unassigned2  : 12;
-		u64 software     : 1;
-		u64 unassigned3  : 1;
-		u64 is_rarp      : 1;
-		u64 is_arp       : 1;
-		u64 is_bcast     : 1;
-		u64 is_mcast     : 1;
-		u64 not_IP       : 1;
-		u64 rcv_error    : 1;
-		u64 err_code     : 8;
+		u64 unassigned : 1;
+		u64 vlan_cfi : 1;
+		u64 vlan_id : 12;
+		u64 pr : 4;
+		u64 unassigned2 : 12;
+		u64 software : 1;
+		u64 unassigned3 : 1;
+		u64 is_rarp : 1;
+		u64 is_arp : 1;
+		u64 is_bcast : 1;
+		u64 is_mcast : 1;
+		u64 not_IP : 1;
+		u64 rcv_error : 1;
+		u64 err_code : 8;
 	} snoip;
 };
 
 union cvmx_pip_wqe_word0 {
 	struct {
-		uint64_t next_ptr:40;
-		uint8_t unused;
+		u64 next_ptr : 40;
+		u8 unused;
 		__wsum hw_chksum;
 	} cn38xx;
 	struct {
-		uint64_t pknd:6;        /* 0..5 */
-		uint64_t unused2:2;     /* 6..7 */
-		uint64_t bpid:6;        /* 8..13 */
-		uint64_t unused1:18;    /* 14..31 */
-		uint64_t l2ptr:8;       /* 32..39 */
-		uint64_t l3ptr:8;       /* 40..47 */
-		uint64_t unused0:8;     /* 48..55 */
-		uint64_t l4ptr:8;       /* 56..63 */
+		u64 pknd : 6; /* 0..5 */
+		u64 unused2 : 2; /* 6..7 */
+		u64 bpid : 6; /* 8..13 */
+		u64 unused1 : 18; /* 14..31 */
+		u64 l2ptr : 8; /* 32..39 */
+		u64 l3ptr : 8; /* 40..47 */
+		u64 unused0 : 8; /* 48..55 */
+		u64 l4ptr : 8; /* 56..63 */
 	} cn68xx;
 };
 
 union cvmx_wqe_word0 {
-	uint64_t u64;
+	u64 u64;
 	union cvmx_pip_wqe_word0 pip;
 };
 
 union cvmx_wqe_word1 {
-	uint64_t u64;
+	u64 u64;
 	struct {
-		uint64_t tag:32;
-		uint64_t tag_type:2;
-		uint64_t varies:14;
-		uint64_t len:16;
+		u64 tag : 32;
+		u64 tag_type : 2;
+		u64 varies : 14;
+		u64 len : 16;
 	};
 	struct {
-		uint64_t tag:32;
-		uint64_t tag_type:2;
-		uint64_t zero_2:3;
-		uint64_t grp:6;
-		uint64_t zero_1:1;
-		uint64_t qos:3;
-		uint64_t zero_0:1;
-		uint64_t len:16;
+		u64 tag : 32;
+		u64 tag_type : 2;
+		u64 zero_2 : 3;
+		u64 grp : 6;
+		u64 zero_1 : 1;
+		u64 qos : 3;
+		u64 zero_0 : 1;
+		u64 len : 16;
 	} cn68xx;
 	struct {
-		uint64_t tag:32;
-		uint64_t tag_type:2;
-		uint64_t zero_2:1;
-		uint64_t grp:4;
-		uint64_t qos:3;
-		uint64_t ipprt:6;
-		uint64_t len:16;
+		u64 tag : 32;
+		u64 tag_type : 2;
+		u64 zero_2 : 1;
+		u64 grp : 4;
+		u64 qos : 3;
+		u64 ipprt : 6;
+		u64 len : 16;
 	} cn38xx;
 };
 
 union cvmx_buf_ptr {
 	void *ptr;
-	uint64_t u64;
+	u64 u64;
 	struct {
-		uint64_t i:1;
-		uint64_t back:4;
-		uint64_t pool:3;
-		uint64_t size:16;
-		uint64_t addr:40;
+		u64 i : 1;
+		u64 back : 4;
+		u64 pool : 3;
+		u64 size : 16;
+		u64 addr : 40;
 	} s;
 };
 
@@ -191,21 +193,21 @@ struct cvmx_wqe {
 	union cvmx_wqe_word1 word1;
 	union cvmx_pip_wqe_word2 word2;
 	union cvmx_buf_ptr packet_ptr;
-	uint8_t packet_data[96];
+	u8 packet_data[96];
 };
 
 union cvmx_helper_link_info {
-	uint64_t u64;
+	u64 u64;
 	struct {
-		uint64_t reserved_20_63:44;
-		uint64_t link_up:1;	    /**< Is the physical link up? */
-		uint64_t full_duplex:1;	    /**< 1 if the link is full duplex */
-		uint64_t speed:18;	    /**< Speed of the link in Mbps */
+		u64 reserved_20_63 : 44;
+		u64 link_up : 1; /**< Is the physical link up? */
+		u64 full_duplex : 1; /**< 1 if the link is full duplex */
+		u64 speed : 18; /**< Speed of the link in Mbps */
 	} s;
 };
 
 enum cvmx_fau_reg_32 {
-	CVMX_FAU_REG_32_START	= 0,
+	CVMX_FAU_REG_32_START = 0,
 };
 
 enum cvmx_fau_op_size {
@@ -257,928 +259,928 @@ typedef enum {
 } cvmx_pko_status_t;
 
 enum cvmx_pow_tag_type {
-	CVMX_POW_TAG_TYPE_ORDERED   = 0L,
-	CVMX_POW_TAG_TYPE_ATOMIC    = 1L,
-	CVMX_POW_TAG_TYPE_NULL	    = 2L,
+	CVMX_POW_TAG_TYPE_ORDERED = 0L,
+	CVMX_POW_TAG_TYPE_ATOMIC = 1L,
+	CVMX_POW_TAG_TYPE_NULL = 2L,
 	CVMX_POW_TAG_TYPE_NULL_NULL = 3L
 };
 
 union cvmx_ipd_ctl_status {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ipd_ctl_status_s {
-		uint64_t reserved_18_63:46;
-		uint64_t use_sop:1;
-		uint64_t rst_done:1;
-		uint64_t clken:1;
-		uint64_t no_wptr:1;
-		uint64_t pq_apkt:1;
-		uint64_t pq_nabuf:1;
-		uint64_t ipd_full:1;
-		uint64_t pkt_off:1;
-		uint64_t len_m8:1;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_18_63 : 46;
+		u64 use_sop : 1;
+		u64 rst_done : 1;
+		u64 clken : 1;
+		u64 no_wptr : 1;
+		u64 pq_apkt : 1;
+		u64 pq_nabuf : 1;
+		u64 ipd_full : 1;
+		u64 pkt_off : 1;
+		u64 len_m8 : 1;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} s;
 	struct cvmx_ipd_ctl_status_cn30xx {
-		uint64_t reserved_10_63:54;
-		uint64_t len_m8:1;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_10_63 : 54;
+		u64 len_m8 : 1;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} cn30xx;
 	struct cvmx_ipd_ctl_status_cn38xxp2 {
-		uint64_t reserved_9_63:55;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_9_63 : 55;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} cn38xxp2;
 	struct cvmx_ipd_ctl_status_cn50xx {
-		uint64_t reserved_15_63:49;
-		uint64_t no_wptr:1;
-		uint64_t pq_apkt:1;
-		uint64_t pq_nabuf:1;
-		uint64_t ipd_full:1;
-		uint64_t pkt_off:1;
-		uint64_t len_m8:1;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_15_63 : 49;
+		u64 no_wptr : 1;
+		u64 pq_apkt : 1;
+		u64 pq_nabuf : 1;
+		u64 ipd_full : 1;
+		u64 pkt_off : 1;
+		u64 len_m8 : 1;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} cn50xx;
 	struct cvmx_ipd_ctl_status_cn58xx {
-		uint64_t reserved_12_63:52;
-		uint64_t ipd_full:1;
-		uint64_t pkt_off:1;
-		uint64_t len_m8:1;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_12_63 : 52;
+		u64 ipd_full : 1;
+		u64 pkt_off : 1;
+		u64 len_m8 : 1;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} cn58xx;
 	struct cvmx_ipd_ctl_status_cn63xxp1 {
-		uint64_t reserved_16_63:48;
-		uint64_t clken:1;
-		uint64_t no_wptr:1;
-		uint64_t pq_apkt:1;
-		uint64_t pq_nabuf:1;
-		uint64_t ipd_full:1;
-		uint64_t pkt_off:1;
-		uint64_t len_m8:1;
-		uint64_t reset:1;
-		uint64_t addpkt:1;
-		uint64_t naddbuf:1;
-		uint64_t pkt_lend:1;
-		uint64_t wqe_lend:1;
-		uint64_t pbp_en:1;
-		uint64_t opc_mode:2;
-		uint64_t ipd_en:1;
+		u64 reserved_16_63 : 48;
+		u64 clken : 1;
+		u64 no_wptr : 1;
+		u64 pq_apkt : 1;
+		u64 pq_nabuf : 1;
+		u64 ipd_full : 1;
+		u64 pkt_off : 1;
+		u64 len_m8 : 1;
+		u64 reset : 1;
+		u64 addpkt : 1;
+		u64 naddbuf : 1;
+		u64 pkt_lend : 1;
+		u64 wqe_lend : 1;
+		u64 pbp_en : 1;
+		u64 opc_mode : 2;
+		u64 ipd_en : 1;
 	} cn63xxp1;
 };
 
 union cvmx_ipd_sub_port_fcs {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ipd_sub_port_fcs_s {
-		uint64_t port_bit:32;
-		uint64_t reserved_32_35:4;
-		uint64_t port_bit2:4;
-		uint64_t reserved_40_63:24;
+		u64 port_bit : 32;
+		u64 reserved_32_35 : 4;
+		u64 port_bit2 : 4;
+		u64 reserved_40_63 : 24;
 	} s;
 	struct cvmx_ipd_sub_port_fcs_cn30xx {
-		uint64_t port_bit:3;
-		uint64_t reserved_3_63:61;
+		u64 port_bit : 3;
+		u64 reserved_3_63 : 61;
 	} cn30xx;
 	struct cvmx_ipd_sub_port_fcs_cn38xx {
-		uint64_t port_bit:32;
-		uint64_t reserved_32_63:32;
+		u64 port_bit : 32;
+		u64 reserved_32_63 : 32;
 	} cn38xx;
 };
 
 union cvmx_ipd_sub_port_qos_cnt {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ipd_sub_port_qos_cnt_s {
-		uint64_t cnt:32;
-		uint64_t port_qos:9;
-		uint64_t reserved_41_63:23;
+		u64 cnt : 32;
+		u64 port_qos : 9;
+		u64 reserved_41_63 : 23;
 	} s;
 };
 
 typedef struct {
-	uint32_t dropped_octets;
-	uint32_t dropped_packets;
-	uint32_t pci_raw_packets;
-	uint32_t octets;
-	uint32_t packets;
-	uint32_t multicast_packets;
-	uint32_t broadcast_packets;
-	uint32_t len_64_packets;
-	uint32_t len_65_127_packets;
-	uint32_t len_128_255_packets;
-	uint32_t len_256_511_packets;
-	uint32_t len_512_1023_packets;
-	uint32_t len_1024_1518_packets;
-	uint32_t len_1519_max_packets;
-	uint32_t fcs_align_err_packets;
-	uint32_t runt_packets;
-	uint32_t runt_crc_packets;
-	uint32_t oversize_packets;
-	uint32_t oversize_crc_packets;
-	uint32_t inb_packets;
-	uint64_t inb_octets;
-	uint16_t inb_errors;
+	u32 dropped_octets;
+	u32 dropped_packets;
+	u32 pci_raw_packets;
+	u32 octets;
+	u32 packets;
+	u32 multicast_packets;
+	u32 broadcast_packets;
+	u32 len_64_packets;
+	u32 len_65_127_packets;
+	u32 len_128_255_packets;
+	u32 len_256_511_packets;
+	u32 len_512_1023_packets;
+	u32 len_1024_1518_packets;
+	u32 len_1519_max_packets;
+	u32 fcs_align_err_packets;
+	u32 runt_packets;
+	u32 runt_crc_packets;
+	u32 oversize_packets;
+	u32 oversize_crc_packets;
+	u32 inb_packets;
+	u64 inb_octets;
+	u16 inb_errors;
 } cvmx_pip_port_status_t;
 
 typedef struct {
-	uint32_t packets;
-	uint64_t octets;
-	uint64_t doorbell;
+	u32 packets;
+	u64 octets;
+	u64 doorbell;
 } cvmx_pko_port_status_t;
 
 union cvmx_pip_frm_len_chkx {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pip_frm_len_chkx_s {
-		uint64_t reserved_32_63:32;
-		uint64_t maxlen:16;
-		uint64_t minlen:16;
+		u64 reserved_32_63 : 32;
+		u64 maxlen : 16;
+		u64 minlen : 16;
 	} s;
 };
 
 union cvmx_gmxx_rxx_frm_ctl {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_gmxx_rxx_frm_ctl_s {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t vlan_len:1;
-		uint64_t pad_len:1;
-		uint64_t pre_align:1;
-		uint64_t null_dis:1;
-		uint64_t reserved_11_11:1;
-		uint64_t ptp_mode:1;
-		uint64_t reserved_13_63:51;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 vlan_len : 1;
+		u64 pad_len : 1;
+		u64 pre_align : 1;
+		u64 null_dis : 1;
+		u64 reserved_11_11 : 1;
+		u64 ptp_mode : 1;
+		u64 reserved_13_63 : 51;
 	} s;
 	struct cvmx_gmxx_rxx_frm_ctl_cn30xx {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t vlan_len:1;
-		uint64_t pad_len:1;
-		uint64_t reserved_9_63:55;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 vlan_len : 1;
+		u64 pad_len : 1;
+		u64 reserved_9_63 : 55;
 	} cn30xx;
 	struct cvmx_gmxx_rxx_frm_ctl_cn31xx {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t vlan_len:1;
-		uint64_t reserved_8_63:56;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 vlan_len : 1;
+		u64 reserved_8_63 : 56;
 	} cn31xx;
 	struct cvmx_gmxx_rxx_frm_ctl_cn50xx {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t reserved_7_8:2;
-		uint64_t pre_align:1;
-		uint64_t null_dis:1;
-		uint64_t reserved_11_63:53;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 reserved_7_8 : 2;
+		u64 pre_align : 1;
+		u64 null_dis : 1;
+		u64 reserved_11_63 : 53;
 	} cn50xx;
 	struct cvmx_gmxx_rxx_frm_ctl_cn56xxp1 {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t reserved_7_8:2;
-		uint64_t pre_align:1;
-		uint64_t reserved_10_63:54;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 reserved_7_8 : 2;
+		u64 pre_align : 1;
+		u64 reserved_10_63 : 54;
 	} cn56xxp1;
 	struct cvmx_gmxx_rxx_frm_ctl_cn58xx {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t vlan_len:1;
-		uint64_t pad_len:1;
-		uint64_t pre_align:1;
-		uint64_t null_dis:1;
-		uint64_t reserved_11_63:53;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 vlan_len : 1;
+		u64 pad_len : 1;
+		u64 pre_align : 1;
+		u64 null_dis : 1;
+		u64 reserved_11_63 : 53;
 	} cn58xx;
 	struct cvmx_gmxx_rxx_frm_ctl_cn61xx {
-		uint64_t pre_chk:1;
-		uint64_t pre_strp:1;
-		uint64_t ctl_drp:1;
-		uint64_t ctl_bck:1;
-		uint64_t ctl_mcst:1;
-		uint64_t ctl_smac:1;
-		uint64_t pre_free:1;
-		uint64_t reserved_7_8:2;
-		uint64_t pre_align:1;
-		uint64_t null_dis:1;
-		uint64_t reserved_11_11:1;
-		uint64_t ptp_mode:1;
-		uint64_t reserved_13_63:51;
+		u64 pre_chk : 1;
+		u64 pre_strp : 1;
+		u64 ctl_drp : 1;
+		u64 ctl_bck : 1;
+		u64 ctl_mcst : 1;
+		u64 ctl_smac : 1;
+		u64 pre_free : 1;
+		u64 reserved_7_8 : 2;
+		u64 pre_align : 1;
+		u64 null_dis : 1;
+		u64 reserved_11_11 : 1;
+		u64 ptp_mode : 1;
+		u64 reserved_13_63 : 51;
 	} cn61xx;
 };
 
 union cvmx_gmxx_rxx_int_reg {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_gmxx_rxx_int_reg_s {
-		uint64_t minerr:1;
-		uint64_t carext:1;
-		uint64_t maxerr:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t alnerr:1;
-		uint64_t lenerr:1;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t niberr:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t phy_link:1;
-		uint64_t phy_spd:1;
-		uint64_t phy_dupx:1;
-		uint64_t pause_drp:1;
-		uint64_t loc_fault:1;
-		uint64_t rem_fault:1;
-		uint64_t bad_seq:1;
-		uint64_t bad_term:1;
-		uint64_t unsop:1;
-		uint64_t uneop:1;
-		uint64_t undat:1;
-		uint64_t hg2fld:1;
-		uint64_t hg2cc:1;
-		uint64_t reserved_29_63:35;
+		u64 minerr : 1;
+		u64 carext : 1;
+		u64 maxerr : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 alnerr : 1;
+		u64 lenerr : 1;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 niberr : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 phy_link : 1;
+		u64 phy_spd : 1;
+		u64 phy_dupx : 1;
+		u64 pause_drp : 1;
+		u64 loc_fault : 1;
+		u64 rem_fault : 1;
+		u64 bad_seq : 1;
+		u64 bad_term : 1;
+		u64 unsop : 1;
+		u64 uneop : 1;
+		u64 undat : 1;
+		u64 hg2fld : 1;
+		u64 hg2cc : 1;
+		u64 reserved_29_63 : 35;
 	} s;
 	struct cvmx_gmxx_rxx_int_reg_cn30xx {
-		uint64_t minerr:1;
-		uint64_t carext:1;
-		uint64_t maxerr:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t alnerr:1;
-		uint64_t lenerr:1;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t niberr:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t phy_link:1;
-		uint64_t phy_spd:1;
-		uint64_t phy_dupx:1;
-		uint64_t reserved_19_63:45;
+		u64 minerr : 1;
+		u64 carext : 1;
+		u64 maxerr : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 alnerr : 1;
+		u64 lenerr : 1;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 niberr : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 phy_link : 1;
+		u64 phy_spd : 1;
+		u64 phy_dupx : 1;
+		u64 reserved_19_63 : 45;
 	} cn30xx;
 	struct cvmx_gmxx_rxx_int_reg_cn50xx {
-		uint64_t reserved_0_0:1;
-		uint64_t carext:1;
-		uint64_t reserved_2_2:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t alnerr:1;
-		uint64_t reserved_6_6:1;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t niberr:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t phy_link:1;
-		uint64_t phy_spd:1;
-		uint64_t phy_dupx:1;
-		uint64_t pause_drp:1;
-		uint64_t reserved_20_63:44;
+		u64 reserved_0_0 : 1;
+		u64 carext : 1;
+		u64 reserved_2_2 : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 alnerr : 1;
+		u64 reserved_6_6 : 1;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 niberr : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 phy_link : 1;
+		u64 phy_spd : 1;
+		u64 phy_dupx : 1;
+		u64 pause_drp : 1;
+		u64 reserved_20_63 : 44;
 	} cn50xx;
 	struct cvmx_gmxx_rxx_int_reg_cn52xx {
-		uint64_t reserved_0_0:1;
-		uint64_t carext:1;
-		uint64_t reserved_2_2:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t reserved_5_6:2;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t reserved_9_9:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t reserved_16_18:3;
-		uint64_t pause_drp:1;
-		uint64_t loc_fault:1;
-		uint64_t rem_fault:1;
-		uint64_t bad_seq:1;
-		uint64_t bad_term:1;
-		uint64_t unsop:1;
-		uint64_t uneop:1;
-		uint64_t undat:1;
-		uint64_t hg2fld:1;
-		uint64_t hg2cc:1;
-		uint64_t reserved_29_63:35;
+		u64 reserved_0_0 : 1;
+		u64 carext : 1;
+		u64 reserved_2_2 : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 reserved_5_6 : 2;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 reserved_9_9 : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 reserved_16_18 : 3;
+		u64 pause_drp : 1;
+		u64 loc_fault : 1;
+		u64 rem_fault : 1;
+		u64 bad_seq : 1;
+		u64 bad_term : 1;
+		u64 unsop : 1;
+		u64 uneop : 1;
+		u64 undat : 1;
+		u64 hg2fld : 1;
+		u64 hg2cc : 1;
+		u64 reserved_29_63 : 35;
 	} cn52xx;
 	struct cvmx_gmxx_rxx_int_reg_cn56xxp1 {
-		uint64_t reserved_0_0:1;
-		uint64_t carext:1;
-		uint64_t reserved_2_2:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t reserved_5_6:2;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t reserved_9_9:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t reserved_16_18:3;
-		uint64_t pause_drp:1;
-		uint64_t loc_fault:1;
-		uint64_t rem_fault:1;
-		uint64_t bad_seq:1;
-		uint64_t bad_term:1;
-		uint64_t unsop:1;
-		uint64_t uneop:1;
-		uint64_t undat:1;
-		uint64_t reserved_27_63:37;
+		u64 reserved_0_0 : 1;
+		u64 carext : 1;
+		u64 reserved_2_2 : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 reserved_5_6 : 2;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 reserved_9_9 : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 reserved_16_18 : 3;
+		u64 pause_drp : 1;
+		u64 loc_fault : 1;
+		u64 rem_fault : 1;
+		u64 bad_seq : 1;
+		u64 bad_term : 1;
+		u64 unsop : 1;
+		u64 uneop : 1;
+		u64 undat : 1;
+		u64 reserved_27_63 : 37;
 	} cn56xxp1;
 	struct cvmx_gmxx_rxx_int_reg_cn58xx {
-		uint64_t minerr:1;
-		uint64_t carext:1;
-		uint64_t maxerr:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t alnerr:1;
-		uint64_t lenerr:1;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t niberr:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t phy_link:1;
-		uint64_t phy_spd:1;
-		uint64_t phy_dupx:1;
-		uint64_t pause_drp:1;
-		uint64_t reserved_20_63:44;
+		u64 minerr : 1;
+		u64 carext : 1;
+		u64 maxerr : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 alnerr : 1;
+		u64 lenerr : 1;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 niberr : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 phy_link : 1;
+		u64 phy_spd : 1;
+		u64 phy_dupx : 1;
+		u64 pause_drp : 1;
+		u64 reserved_20_63 : 44;
 	} cn58xx;
 	struct cvmx_gmxx_rxx_int_reg_cn61xx {
-		uint64_t minerr:1;
-		uint64_t carext:1;
-		uint64_t reserved_2_2:1;
-		uint64_t jabber:1;
-		uint64_t fcserr:1;
-		uint64_t reserved_5_6:2;
-		uint64_t rcverr:1;
-		uint64_t skperr:1;
-		uint64_t reserved_9_9:1;
-		uint64_t ovrerr:1;
-		uint64_t pcterr:1;
-		uint64_t rsverr:1;
-		uint64_t falerr:1;
-		uint64_t coldet:1;
-		uint64_t ifgerr:1;
-		uint64_t reserved_16_18:3;
-		uint64_t pause_drp:1;
-		uint64_t loc_fault:1;
-		uint64_t rem_fault:1;
-		uint64_t bad_seq:1;
-		uint64_t bad_term:1;
-		uint64_t unsop:1;
-		uint64_t uneop:1;
-		uint64_t undat:1;
-		uint64_t hg2fld:1;
-		uint64_t hg2cc:1;
-		uint64_t reserved_29_63:35;
+		u64 minerr : 1;
+		u64 carext : 1;
+		u64 reserved_2_2 : 1;
+		u64 jabber : 1;
+		u64 fcserr : 1;
+		u64 reserved_5_6 : 2;
+		u64 rcverr : 1;
+		u64 skperr : 1;
+		u64 reserved_9_9 : 1;
+		u64 ovrerr : 1;
+		u64 pcterr : 1;
+		u64 rsverr : 1;
+		u64 falerr : 1;
+		u64 coldet : 1;
+		u64 ifgerr : 1;
+		u64 reserved_16_18 : 3;
+		u64 pause_drp : 1;
+		u64 loc_fault : 1;
+		u64 rem_fault : 1;
+		u64 bad_seq : 1;
+		u64 bad_term : 1;
+		u64 unsop : 1;
+		u64 uneop : 1;
+		u64 undat : 1;
+		u64 hg2fld : 1;
+		u64 hg2cc : 1;
+		u64 reserved_29_63 : 35;
 	} cn61xx;
 };
 
 union cvmx_gmxx_prtx_cfg {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_gmxx_prtx_cfg_s {
-		uint64_t reserved_22_63:42;
-		uint64_t pknd:6;
-		uint64_t reserved_14_15:2;
-		uint64_t tx_idle:1;
-		uint64_t rx_idle:1;
-		uint64_t reserved_9_11:3;
-		uint64_t speed_msb:1;
-		uint64_t reserved_4_7:4;
-		uint64_t slottime:1;
-		uint64_t duplex:1;
-		uint64_t speed:1;
-		uint64_t en:1;
+		u64 reserved_22_63 : 42;
+		u64 pknd : 6;
+		u64 reserved_14_15 : 2;
+		u64 tx_idle : 1;
+		u64 rx_idle : 1;
+		u64 reserved_9_11 : 3;
+		u64 speed_msb : 1;
+		u64 reserved_4_7 : 4;
+		u64 slottime : 1;
+		u64 duplex : 1;
+		u64 speed : 1;
+		u64 en : 1;
 	} s;
 	struct cvmx_gmxx_prtx_cfg_cn30xx {
-		uint64_t reserved_4_63:60;
-		uint64_t slottime:1;
-		uint64_t duplex:1;
-		uint64_t speed:1;
-		uint64_t en:1;
+		u64 reserved_4_63 : 60;
+		u64 slottime : 1;
+		u64 duplex : 1;
+		u64 speed : 1;
+		u64 en : 1;
 	} cn30xx;
 	struct cvmx_gmxx_prtx_cfg_cn52xx {
-		uint64_t reserved_14_63:50;
-		uint64_t tx_idle:1;
-		uint64_t rx_idle:1;
-		uint64_t reserved_9_11:3;
-		uint64_t speed_msb:1;
-		uint64_t reserved_4_7:4;
-		uint64_t slottime:1;
-		uint64_t duplex:1;
-		uint64_t speed:1;
-		uint64_t en:1;
+		u64 reserved_14_63 : 50;
+		u64 tx_idle : 1;
+		u64 rx_idle : 1;
+		u64 reserved_9_11 : 3;
+		u64 speed_msb : 1;
+		u64 reserved_4_7 : 4;
+		u64 slottime : 1;
+		u64 duplex : 1;
+		u64 speed : 1;
+		u64 en : 1;
 	} cn52xx;
 };
 
 union cvmx_gmxx_rxx_adr_ctl {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_gmxx_rxx_adr_ctl_s {
-		uint64_t reserved_4_63:60;
-		uint64_t cam_mode:1;
-		uint64_t mcst:2;
-		uint64_t bcst:1;
+		u64 reserved_4_63 : 60;
+		u64 cam_mode : 1;
+		u64 mcst : 2;
+		u64 bcst : 1;
 	} s;
 };
 
 union cvmx_pip_prt_tagx {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pip_prt_tagx_s {
-		uint64_t reserved_54_63:10;
-		uint64_t portadd_en:1;
-		uint64_t inc_hwchk:1;
-		uint64_t reserved_50_51:2;
-		uint64_t grptagbase_msb:2;
-		uint64_t reserved_46_47:2;
-		uint64_t grptagmask_msb:2;
-		uint64_t reserved_42_43:2;
-		uint64_t grp_msb:2;
-		uint64_t grptagbase:4;
-		uint64_t grptagmask:4;
-		uint64_t grptag:1;
-		uint64_t grptag_mskip:1;
-		uint64_t tag_mode:2;
-		uint64_t inc_vs:2;
-		uint64_t inc_vlan:1;
-		uint64_t inc_prt_flag:1;
-		uint64_t ip6_dprt_flag:1;
-		uint64_t ip4_dprt_flag:1;
-		uint64_t ip6_sprt_flag:1;
-		uint64_t ip4_sprt_flag:1;
-		uint64_t ip6_nxth_flag:1;
-		uint64_t ip4_pctl_flag:1;
-		uint64_t ip6_dst_flag:1;
-		uint64_t ip4_dst_flag:1;
-		uint64_t ip6_src_flag:1;
-		uint64_t ip4_src_flag:1;
-		uint64_t tcp6_tag_type:2;
-		uint64_t tcp4_tag_type:2;
-		uint64_t ip6_tag_type:2;
-		uint64_t ip4_tag_type:2;
-		uint64_t non_tag_type:2;
-		uint64_t grp:4;
+		u64 reserved_54_63 : 10;
+		u64 portadd_en : 1;
+		u64 inc_hwchk : 1;
+		u64 reserved_50_51 : 2;
+		u64 grptagbase_msb : 2;
+		u64 reserved_46_47 : 2;
+		u64 grptagmask_msb : 2;
+		u64 reserved_42_43 : 2;
+		u64 grp_msb : 2;
+		u64 grptagbase : 4;
+		u64 grptagmask : 4;
+		u64 grptag : 1;
+		u64 grptag_mskip : 1;
+		u64 tag_mode : 2;
+		u64 inc_vs : 2;
+		u64 inc_vlan : 1;
+		u64 inc_prt_flag : 1;
+		u64 ip6_dprt_flag : 1;
+		u64 ip4_dprt_flag : 1;
+		u64 ip6_sprt_flag : 1;
+		u64 ip4_sprt_flag : 1;
+		u64 ip6_nxth_flag : 1;
+		u64 ip4_pctl_flag : 1;
+		u64 ip6_dst_flag : 1;
+		u64 ip4_dst_flag : 1;
+		u64 ip6_src_flag : 1;
+		u64 ip4_src_flag : 1;
+		u64 tcp6_tag_type : 2;
+		u64 tcp4_tag_type : 2;
+		u64 ip6_tag_type : 2;
+		u64 ip4_tag_type : 2;
+		u64 non_tag_type : 2;
+		u64 grp : 4;
 	} s;
 	struct cvmx_pip_prt_tagx_cn30xx {
-		uint64_t reserved_40_63:24;
-		uint64_t grptagbase:4;
-		uint64_t grptagmask:4;
-		uint64_t grptag:1;
-		uint64_t reserved_30_30:1;
-		uint64_t tag_mode:2;
-		uint64_t inc_vs:2;
-		uint64_t inc_vlan:1;
-		uint64_t inc_prt_flag:1;
-		uint64_t ip6_dprt_flag:1;
-		uint64_t ip4_dprt_flag:1;
-		uint64_t ip6_sprt_flag:1;
-		uint64_t ip4_sprt_flag:1;
-		uint64_t ip6_nxth_flag:1;
-		uint64_t ip4_pctl_flag:1;
-		uint64_t ip6_dst_flag:1;
-		uint64_t ip4_dst_flag:1;
-		uint64_t ip6_src_flag:1;
-		uint64_t ip4_src_flag:1;
-		uint64_t tcp6_tag_type:2;
-		uint64_t tcp4_tag_type:2;
-		uint64_t ip6_tag_type:2;
-		uint64_t ip4_tag_type:2;
-		uint64_t non_tag_type:2;
-		uint64_t grp:4;
+		u64 reserved_40_63 : 24;
+		u64 grptagbase : 4;
+		u64 grptagmask : 4;
+		u64 grptag : 1;
+		u64 reserved_30_30 : 1;
+		u64 tag_mode : 2;
+		u64 inc_vs : 2;
+		u64 inc_vlan : 1;
+		u64 inc_prt_flag : 1;
+		u64 ip6_dprt_flag : 1;
+		u64 ip4_dprt_flag : 1;
+		u64 ip6_sprt_flag : 1;
+		u64 ip4_sprt_flag : 1;
+		u64 ip6_nxth_flag : 1;
+		u64 ip4_pctl_flag : 1;
+		u64 ip6_dst_flag : 1;
+		u64 ip4_dst_flag : 1;
+		u64 ip6_src_flag : 1;
+		u64 ip4_src_flag : 1;
+		u64 tcp6_tag_type : 2;
+		u64 tcp4_tag_type : 2;
+		u64 ip6_tag_type : 2;
+		u64 ip4_tag_type : 2;
+		u64 non_tag_type : 2;
+		u64 grp : 4;
 	} cn30xx;
 	struct cvmx_pip_prt_tagx_cn50xx {
-		uint64_t reserved_40_63:24;
-		uint64_t grptagbase:4;
-		uint64_t grptagmask:4;
-		uint64_t grptag:1;
-		uint64_t grptag_mskip:1;
-		uint64_t tag_mode:2;
-		uint64_t inc_vs:2;
-		uint64_t inc_vlan:1;
-		uint64_t inc_prt_flag:1;
-		uint64_t ip6_dprt_flag:1;
-		uint64_t ip4_dprt_flag:1;
-		uint64_t ip6_sprt_flag:1;
-		uint64_t ip4_sprt_flag:1;
-		uint64_t ip6_nxth_flag:1;
-		uint64_t ip4_pctl_flag:1;
-		uint64_t ip6_dst_flag:1;
-		uint64_t ip4_dst_flag:1;
-		uint64_t ip6_src_flag:1;
-		uint64_t ip4_src_flag:1;
-		uint64_t tcp6_tag_type:2;
-		uint64_t tcp4_tag_type:2;
-		uint64_t ip6_tag_type:2;
-		uint64_t ip4_tag_type:2;
-		uint64_t non_tag_type:2;
-		uint64_t grp:4;
+		u64 reserved_40_63 : 24;
+		u64 grptagbase : 4;
+		u64 grptagmask : 4;
+		u64 grptag : 1;
+		u64 grptag_mskip : 1;
+		u64 tag_mode : 2;
+		u64 inc_vs : 2;
+		u64 inc_vlan : 1;
+		u64 inc_prt_flag : 1;
+		u64 ip6_dprt_flag : 1;
+		u64 ip4_dprt_flag : 1;
+		u64 ip6_sprt_flag : 1;
+		u64 ip4_sprt_flag : 1;
+		u64 ip6_nxth_flag : 1;
+		u64 ip4_pctl_flag : 1;
+		u64 ip6_dst_flag : 1;
+		u64 ip4_dst_flag : 1;
+		u64 ip6_src_flag : 1;
+		u64 ip4_src_flag : 1;
+		u64 tcp6_tag_type : 2;
+		u64 tcp4_tag_type : 2;
+		u64 ip6_tag_type : 2;
+		u64 ip4_tag_type : 2;
+		u64 non_tag_type : 2;
+		u64 grp : 4;
 	} cn50xx;
 };
 
 union cvmx_spxx_int_reg {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_spxx_int_reg_s {
-		uint64_t reserved_32_63:32;
-		uint64_t spf:1;
-		uint64_t reserved_12_30:19;
-		uint64_t calerr:1;
-		uint64_t syncerr:1;
-		uint64_t diperr:1;
-		uint64_t tpaovr:1;
-		uint64_t rsverr:1;
-		uint64_t drwnng:1;
-		uint64_t clserr:1;
-		uint64_t spiovr:1;
-		uint64_t reserved_2_3:2;
-		uint64_t abnorm:1;
-		uint64_t prtnxa:1;
+		u64 reserved_32_63 : 32;
+		u64 spf : 1;
+		u64 reserved_12_30 : 19;
+		u64 calerr : 1;
+		u64 syncerr : 1;
+		u64 diperr : 1;
+		u64 tpaovr : 1;
+		u64 rsverr : 1;
+		u64 drwnng : 1;
+		u64 clserr : 1;
+		u64 spiovr : 1;
+		u64 reserved_2_3 : 2;
+		u64 abnorm : 1;
+		u64 prtnxa : 1;
 	} s;
 };
 
 union cvmx_spxx_int_msk {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_spxx_int_msk_s {
-		uint64_t reserved_12_63:52;
-		uint64_t calerr:1;
-		uint64_t syncerr:1;
-		uint64_t diperr:1;
-		uint64_t tpaovr:1;
-		uint64_t rsverr:1;
-		uint64_t drwnng:1;
-		uint64_t clserr:1;
-		uint64_t spiovr:1;
-		uint64_t reserved_2_3:2;
-		uint64_t abnorm:1;
-		uint64_t prtnxa:1;
+		u64 reserved_12_63 : 52;
+		u64 calerr : 1;
+		u64 syncerr : 1;
+		u64 diperr : 1;
+		u64 tpaovr : 1;
+		u64 rsverr : 1;
+		u64 drwnng : 1;
+		u64 clserr : 1;
+		u64 spiovr : 1;
+		u64 reserved_2_3 : 2;
+		u64 abnorm : 1;
+		u64 prtnxa : 1;
 	} s;
 };
 
 union cvmx_pow_wq_int {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pow_wq_int_s {
-		uint64_t wq_int:16;
-		uint64_t iq_dis:16;
-		uint64_t reserved_32_63:32;
+		u64 wq_int : 16;
+		u64 iq_dis : 16;
+		u64 reserved_32_63 : 32;
 	} s;
 };
 
 union cvmx_sso_wq_int_thrx {
-	uint64_t u64;
+	u64 u64;
 	struct {
-		uint64_t iq_thr:12;
-		uint64_t reserved_12_13:2;
-		uint64_t ds_thr:12;
-		uint64_t reserved_26_27:2;
-		uint64_t tc_thr:4;
-		uint64_t tc_en:1;
-		uint64_t reserved_33_63:31;
+		u64 iq_thr : 12;
+		u64 reserved_12_13 : 2;
+		u64 ds_thr : 12;
+		u64 reserved_26_27 : 2;
+		u64 tc_thr : 4;
+		u64 tc_en : 1;
+		u64 reserved_33_63 : 31;
 	} s;
 };
 
 union cvmx_stxx_int_reg {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_stxx_int_reg_s {
-		uint64_t reserved_9_63:55;
-		uint64_t syncerr:1;
-		uint64_t frmerr:1;
-		uint64_t unxfrm:1;
-		uint64_t nosync:1;
-		uint64_t diperr:1;
-		uint64_t datovr:1;
-		uint64_t ovrbst:1;
-		uint64_t calpar1:1;
-		uint64_t calpar0:1;
+		u64 reserved_9_63 : 55;
+		u64 syncerr : 1;
+		u64 frmerr : 1;
+		u64 unxfrm : 1;
+		u64 nosync : 1;
+		u64 diperr : 1;
+		u64 datovr : 1;
+		u64 ovrbst : 1;
+		u64 calpar1 : 1;
+		u64 calpar0 : 1;
 	} s;
 };
 
 union cvmx_stxx_int_msk {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_stxx_int_msk_s {
-		uint64_t reserved_8_63:56;
-		uint64_t frmerr:1;
-		uint64_t unxfrm:1;
-		uint64_t nosync:1;
-		uint64_t diperr:1;
-		uint64_t datovr:1;
-		uint64_t ovrbst:1;
-		uint64_t calpar1:1;
-		uint64_t calpar0:1;
+		u64 reserved_8_63 : 56;
+		u64 frmerr : 1;
+		u64 unxfrm : 1;
+		u64 nosync : 1;
+		u64 diperr : 1;
+		u64 datovr : 1;
+		u64 ovrbst : 1;
+		u64 calpar1 : 1;
+		u64 calpar0 : 1;
 	} s;
 };
 
 union cvmx_pow_wq_int_pc {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pow_wq_int_pc_s {
-		uint64_t reserved_0_7:8;
-		uint64_t pc_thr:20;
-		uint64_t reserved_28_31:4;
-		uint64_t pc:28;
-		uint64_t reserved_60_63:4;
+		u64 reserved_0_7 : 8;
+		u64 pc_thr : 20;
+		u64 reserved_28_31 : 4;
+		u64 pc : 28;
+		u64 reserved_60_63 : 4;
 	} s;
 };
 
 union cvmx_pow_wq_int_thrx {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pow_wq_int_thrx_s {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_23_23:1;
-		uint64_t ds_thr:11;
-		uint64_t reserved_11_11:1;
-		uint64_t iq_thr:11;
+		u64 reserved_29_63 : 35;
+		u64 tc_en : 1;
+		u64 tc_thr : 4;
+		u64 reserved_23_23 : 1;
+		u64 ds_thr : 11;
+		u64 reserved_11_11 : 1;
+		u64 iq_thr : 11;
 	} s;
 	struct cvmx_pow_wq_int_thrx_cn30xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_18_23:6;
-		uint64_t ds_thr:6;
-		uint64_t reserved_6_11:6;
-		uint64_t iq_thr:6;
+		u64 reserved_29_63 : 35;
+		u64 tc_en : 1;
+		u64 tc_thr : 4;
+		u64 reserved_18_23 : 6;
+		u64 ds_thr : 6;
+		u64 reserved_6_11 : 6;
+		u64 iq_thr : 6;
 	} cn30xx;
 	struct cvmx_pow_wq_int_thrx_cn31xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_20_23:4;
-		uint64_t ds_thr:8;
-		uint64_t reserved_8_11:4;
-		uint64_t iq_thr:8;
+		u64 reserved_29_63 : 35;
+		u64 tc_en : 1;
+		u64 tc_thr : 4;
+		u64 reserved_20_23 : 4;
+		u64 ds_thr : 8;
+		u64 reserved_8_11 : 4;
+		u64 iq_thr : 8;
 	} cn31xx;
 	struct cvmx_pow_wq_int_thrx_cn52xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_21_23:3;
-		uint64_t ds_thr:9;
-		uint64_t reserved_9_11:3;
-		uint64_t iq_thr:9;
+		u64 reserved_29_63 : 35;
+		u64 tc_en : 1;
+		u64 tc_thr : 4;
+		u64 reserved_21_23 : 3;
+		u64 ds_thr : 9;
+		u64 reserved_9_11 : 3;
+		u64 iq_thr : 9;
 	} cn52xx;
 	struct cvmx_pow_wq_int_thrx_cn63xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_22_23:2;
-		uint64_t ds_thr:10;
-		uint64_t reserved_10_11:2;
-		uint64_t iq_thr:10;
+		u64 reserved_29_63 : 35;
+		u64 tc_en : 1;
+		u64 tc_thr : 4;
+		u64 reserved_22_23 : 2;
+		u64 ds_thr : 10;
+		u64 reserved_10_11 : 2;
+		u64 iq_thr : 10;
 	} cn63xx;
 };
 
 union cvmx_npi_rsl_int_blocks {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_npi_rsl_int_blocks_s {
-		uint64_t reserved_32_63:32;
-		uint64_t rint_31:1;
-		uint64_t iob:1;
-		uint64_t reserved_28_29:2;
-		uint64_t rint_27:1;
-		uint64_t rint_26:1;
-		uint64_t rint_25:1;
-		uint64_t rint_24:1;
-		uint64_t asx1:1;
-		uint64_t asx0:1;
-		uint64_t rint_21:1;
-		uint64_t pip:1;
-		uint64_t spx1:1;
-		uint64_t spx0:1;
-		uint64_t lmc:1;
-		uint64_t l2c:1;
-		uint64_t rint_15:1;
-		uint64_t reserved_13_14:2;
-		uint64_t pow:1;
-		uint64_t tim:1;
-		uint64_t pko:1;
-		uint64_t ipd:1;
-		uint64_t rint_8:1;
-		uint64_t zip:1;
-		uint64_t dfa:1;
-		uint64_t fpa:1;
-		uint64_t key:1;
-		uint64_t npi:1;
-		uint64_t gmx1:1;
-		uint64_t gmx0:1;
-		uint64_t mio:1;
+		u64 reserved_32_63 : 32;
+		u64 rint_31 : 1;
+		u64 iob : 1;
+		u64 reserved_28_29 : 2;
+		u64 rint_27 : 1;
+		u64 rint_26 : 1;
+		u64 rint_25 : 1;
+		u64 rint_24 : 1;
+		u64 asx1 : 1;
+		u64 asx0 : 1;
+		u64 rint_21 : 1;
+		u64 pip : 1;
+		u64 spx1 : 1;
+		u64 spx0 : 1;
+		u64 lmc : 1;
+		u64 l2c : 1;
+		u64 rint_15 : 1;
+		u64 reserved_13_14 : 2;
+		u64 pow : 1;
+		u64 tim : 1;
+		u64 pko : 1;
+		u64 ipd : 1;
+		u64 rint_8 : 1;
+		u64 zip : 1;
+		u64 dfa : 1;
+		u64 fpa : 1;
+		u64 key : 1;
+		u64 npi : 1;
+		u64 gmx1 : 1;
+		u64 gmx0 : 1;
+		u64 mio : 1;
 	} s;
 	struct cvmx_npi_rsl_int_blocks_cn30xx {
-		uint64_t reserved_32_63:32;
-		uint64_t rint_31:1;
-		uint64_t iob:1;
-		uint64_t rint_29:1;
-		uint64_t rint_28:1;
-		uint64_t rint_27:1;
-		uint64_t rint_26:1;
-		uint64_t rint_25:1;
-		uint64_t rint_24:1;
-		uint64_t asx1:1;
-		uint64_t asx0:1;
-		uint64_t rint_21:1;
-		uint64_t pip:1;
-		uint64_t spx1:1;
-		uint64_t spx0:1;
-		uint64_t lmc:1;
-		uint64_t l2c:1;
-		uint64_t rint_15:1;
-		uint64_t rint_14:1;
-		uint64_t usb:1;
-		uint64_t pow:1;
-		uint64_t tim:1;
-		uint64_t pko:1;
-		uint64_t ipd:1;
-		uint64_t rint_8:1;
-		uint64_t zip:1;
-		uint64_t dfa:1;
-		uint64_t fpa:1;
-		uint64_t key:1;
-		uint64_t npi:1;
-		uint64_t gmx1:1;
-		uint64_t gmx0:1;
-		uint64_t mio:1;
+		u64 reserved_32_63 : 32;
+		u64 rint_31 : 1;
+		u64 iob : 1;
+		u64 rint_29 : 1;
+		u64 rint_28 : 1;
+		u64 rint_27 : 1;
+		u64 rint_26 : 1;
+		u64 rint_25 : 1;
+		u64 rint_24 : 1;
+		u64 asx1 : 1;
+		u64 asx0 : 1;
+		u64 rint_21 : 1;
+		u64 pip : 1;
+		u64 spx1 : 1;
+		u64 spx0 : 1;
+		u64 lmc : 1;
+		u64 l2c : 1;
+		u64 rint_15 : 1;
+		u64 rint_14 : 1;
+		u64 usb : 1;
+		u64 pow : 1;
+		u64 tim : 1;
+		u64 pko : 1;
+		u64 ipd : 1;
+		u64 rint_8 : 1;
+		u64 zip : 1;
+		u64 dfa : 1;
+		u64 fpa : 1;
+		u64 key : 1;
+		u64 npi : 1;
+		u64 gmx1 : 1;
+		u64 gmx0 : 1;
+		u64 mio : 1;
 	} cn30xx;
 	struct cvmx_npi_rsl_int_blocks_cn38xx {
-		uint64_t reserved_32_63:32;
-		uint64_t rint_31:1;
-		uint64_t iob:1;
-		uint64_t rint_29:1;
-		uint64_t rint_28:1;
-		uint64_t rint_27:1;
-		uint64_t rint_26:1;
-		uint64_t rint_25:1;
-		uint64_t rint_24:1;
-		uint64_t asx1:1;
-		uint64_t asx0:1;
-		uint64_t rint_21:1;
-		uint64_t pip:1;
-		uint64_t spx1:1;
-		uint64_t spx0:1;
-		uint64_t lmc:1;
-		uint64_t l2c:1;
-		uint64_t rint_15:1;
-		uint64_t rint_14:1;
-		uint64_t rint_13:1;
-		uint64_t pow:1;
-		uint64_t tim:1;
-		uint64_t pko:1;
-		uint64_t ipd:1;
-		uint64_t rint_8:1;
-		uint64_t zip:1;
-		uint64_t dfa:1;
-		uint64_t fpa:1;
-		uint64_t key:1;
-		uint64_t npi:1;
-		uint64_t gmx1:1;
-		uint64_t gmx0:1;
-		uint64_t mio:1;
+		u64 reserved_32_63 : 32;
+		u64 rint_31 : 1;
+		u64 iob : 1;
+		u64 rint_29 : 1;
+		u64 rint_28 : 1;
+		u64 rint_27 : 1;
+		u64 rint_26 : 1;
+		u64 rint_25 : 1;
+		u64 rint_24 : 1;
+		u64 asx1 : 1;
+		u64 asx0 : 1;
+		u64 rint_21 : 1;
+		u64 pip : 1;
+		u64 spx1 : 1;
+		u64 spx0 : 1;
+		u64 lmc : 1;
+		u64 l2c : 1;
+		u64 rint_15 : 1;
+		u64 rint_14 : 1;
+		u64 rint_13 : 1;
+		u64 pow : 1;
+		u64 tim : 1;
+		u64 pko : 1;
+		u64 ipd : 1;
+		u64 rint_8 : 1;
+		u64 zip : 1;
+		u64 dfa : 1;
+		u64 fpa : 1;
+		u64 key : 1;
+		u64 npi : 1;
+		u64 gmx1 : 1;
+		u64 gmx0 : 1;
+		u64 mio : 1;
 	} cn38xx;
 	struct cvmx_npi_rsl_int_blocks_cn50xx {
-		uint64_t reserved_31_63:33;
-		uint64_t iob:1;
-		uint64_t lmc1:1;
-		uint64_t agl:1;
-		uint64_t reserved_24_27:4;
-		uint64_t asx1:1;
-		uint64_t asx0:1;
-		uint64_t reserved_21_21:1;
-		uint64_t pip:1;
-		uint64_t spx1:1;
-		uint64_t spx0:1;
-		uint64_t lmc:1;
-		uint64_t l2c:1;
-		uint64_t reserved_15_15:1;
-		uint64_t rad:1;
-		uint64_t usb:1;
-		uint64_t pow:1;
-		uint64_t tim:1;
-		uint64_t pko:1;
-		uint64_t ipd:1;
-		uint64_t reserved_8_8:1;
-		uint64_t zip:1;
-		uint64_t dfa:1;
-		uint64_t fpa:1;
-		uint64_t key:1;
-		uint64_t npi:1;
-		uint64_t gmx1:1;
-		uint64_t gmx0:1;
-		uint64_t mio:1;
+		u64 reserved_31_63 : 33;
+		u64 iob : 1;
+		u64 lmc1 : 1;
+		u64 agl : 1;
+		u64 reserved_24_27 : 4;
+		u64 asx1 : 1;
+		u64 asx0 : 1;
+		u64 reserved_21_21 : 1;
+		u64 pip : 1;
+		u64 spx1 : 1;
+		u64 spx0 : 1;
+		u64 lmc : 1;
+		u64 l2c : 1;
+		u64 reserved_15_15 : 1;
+		u64 rad : 1;
+		u64 usb : 1;
+		u64 pow : 1;
+		u64 tim : 1;
+		u64 pko : 1;
+		u64 ipd : 1;
+		u64 reserved_8_8 : 1;
+		u64 zip : 1;
+		u64 dfa : 1;
+		u64 fpa : 1;
+		u64 key : 1;
+		u64 npi : 1;
+		u64 gmx1 : 1;
+		u64 gmx0 : 1;
+		u64 mio : 1;
 	} cn50xx;
 };
 
 union cvmx_pko_command_word0 {
-	uint64_t u64;
+	u64 u64;
 	struct {
-		uint64_t total_bytes:16;
-		uint64_t segs:6;
-		uint64_t dontfree:1;
-		uint64_t ignore_i:1;
-		uint64_t ipoffp1:7;
-		uint64_t gather:1;
-		uint64_t rsp:1;
-		uint64_t wqp:1;
-		uint64_t n2:1;
-		uint64_t le:1;
-		uint64_t reg0:11;
-		uint64_t subone0:1;
-		uint64_t reg1:11;
-		uint64_t subone1:1;
-		uint64_t size0:2;
-		uint64_t size1:2;
+		u64 total_bytes : 16;
+		u64 segs : 6;
+		u64 dontfree : 1;
+		u64 ignore_i : 1;
+		u64 ipoffp1 : 7;
+		u64 gather : 1;
+		u64 rsp : 1;
+		u64 wqp : 1;
+		u64 n2 : 1;
+		u64 le : 1;
+		u64 reg0 : 11;
+		u64 subone0 : 1;
+		u64 reg1 : 11;
+		u64 subone1 : 1;
+		u64 size0 : 2;
+		u64 size1 : 2;
 	} s;
 };
 
 union cvmx_ciu_timx {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ciu_timx_s {
-		uint64_t reserved_37_63:27;
-		uint64_t one_shot:1;
-		uint64_t len:36;
+		u64 reserved_37_63 : 27;
+		u64 one_shot : 1;
+		u64 len : 36;
 	} s;
 };
 
 union cvmx_gmxx_rxx_rx_inbnd {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_gmxx_rxx_rx_inbnd_s {
-		uint64_t status:1;
-		uint64_t speed:2;
-		uint64_t duplex:1;
-		uint64_t reserved_4_63:60;
+		u64 status : 1;
+		u64 speed : 2;
+		u64 duplex : 1;
+		u64 reserved_4_63 : 60;
 	} s;
 };
 
@@ -1190,26 +1192,29 @@ static inline int32_t cvmx_fau_fetch_and_add32(enum cvmx_fau_reg_32 reg,
 
 static inline void cvmx_fau_atomic_add32(enum cvmx_fau_reg_32 reg,
 					 int32_t value)
-{ }
+{
+}
 
 static inline void cvmx_fau_atomic_write32(enum cvmx_fau_reg_32 reg,
 					   int32_t value)
-{ }
+{
+}
 
-static inline uint64_t cvmx_scratch_read64(uint64_t address)
+static inline u64 cvmx_scratch_read64(u64 address)
 {
 	return 0;
 }
 
-static inline void cvmx_scratch_write64(uint64_t address, uint64_t value)
-{ }
+static inline void cvmx_scratch_write64(u64 address, u64 value)
+{
+}
 
 static inline int cvmx_wqe_get_grp(struct cvmx_wqe *work)
 {
 	return 0;
 }
 
-static inline void *cvmx_phys_to_ptr(uint64_t physical_address)
+static inline void *cvmx_phys_to_ptr(u64 physical_address)
 {
 	return (void *)(uintptr_t)(physical_address);
 }
@@ -1230,45 +1235,49 @@ static inline int cvmx_helper_get_interface_index_num(int ipd_port)
 }
 
 static inline void cvmx_fpa_enable(void)
-{ }
+{
+}
 
-static inline uint64_t cvmx_read_csr(uint64_t csr_addr)
+static inline u64 cvmx_read_csr(u64 csr_addr)
 {
 	return 0;
 }
 
-static inline void cvmx_write_csr(uint64_t csr_addr, uint64_t val)
-{ }
+static inline void cvmx_write_csr(u64 csr_addr, u64 val)
+{
+}
 
 static inline int cvmx_helper_setup_red(int pass_thresh, int drop_thresh)
 {
 	return 0;
 }
 
-static inline void *cvmx_fpa_alloc(uint64_t pool)
+static inline void *cvmx_fpa_alloc(u64 pool)
 {
 	return NULL;
 }
 
-static inline void cvmx_fpa_free(void *ptr, uint64_t pool,
-				 uint64_t num_cache_lines)
-{ }
+static inline void cvmx_fpa_free(void *ptr, u64 pool, u64 num_cache_lines)
+{
+}
 
 static inline int octeon_is_simulation(void)
 {
 	return 1;
 }
 
-static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
+static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pip_port_status_t *status)
-{ }
+{
+}
 
-static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
+static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pko_port_status_t *status)
-{ }
+{
+}
 
-static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-								   interface)
+static inline cvmx_helper_interface_mode_t
+cvmx_helper_interface_get_mode(int interface)
 {
 	return 0;
 }
@@ -1312,16 +1321,20 @@ static inline int cvmx_helper_ipd_and_packet_input_enable(void)
 }
 
 static inline void cvmx_ipd_disable(void)
-{ }
+{
+}
 
 static inline void cvmx_ipd_free_ptr(void)
-{ }
+{
+}
 
 static inline void cvmx_pko_disable(void)
-{ }
+{
+}
 
 static inline void cvmx_pko_shutdown(void)
-{ }
+{
+}
 
 static inline int cvmx_pko_get_base_queue_per_core(int port, int core)
 {
@@ -1345,11 +1358,13 @@ static inline unsigned int cvmx_get_core_num(void)
 
 static inline void cvmx_pow_work_request_async_nocheck(int scr_addr,
 						       cvmx_pow_wait_t wait)
-{ }
+{
+}
 
 static inline void cvmx_pow_work_request_async(int scr_addr,
 					       cvmx_pow_wait_t wait)
-{ }
+{
+}
 
 static inline struct cvmx_wqe *cvmx_pow_work_response_async(int scr_addr)
 {
@@ -1369,12 +1384,14 @@ static inline int cvmx_spi_restart_interface(int interface,
 	return 0;
 }
 
-static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
+static inline void cvmx_fau_async_fetch_and_add32(u64 scraddr,
 						  enum cvmx_fau_reg_32 reg,
 						  int32_t value)
-{ }
+{
+}
 
-static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interface, int port)
+static inline union cvmx_gmxx_rxx_rx_inbnd
+cvmx_spi4000_check_speed(int interface, int port)
 {
 	union cvmx_gmxx_rxx_rx_inbnd r;
 
@@ -1382,22 +1399,25 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 	return r;
 }
 
-static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
+static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						cvmx_pko_lock_t use_locking)
-{ }
+{
+}
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
-		uint64_t queue, union cvmx_pko_command_word0 pko_command,
-		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
+static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(
+	u64 port, u64 queue, union cvmx_pko_command_word0 pko_command,
+	union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
 {
 	return 0;
 }
 
 static inline void cvmx_wqe_set_port(struct cvmx_wqe *work, int port)
-{ }
+{
+}
 
 static inline void cvmx_wqe_set_qos(struct cvmx_wqe *work, int qos)
-{ }
+{
+}
 
 static inline int cvmx_wqe_get_qos(struct cvmx_wqe *work)
 {
@@ -1405,31 +1425,33 @@ static inline int cvmx_wqe_get_qos(struct cvmx_wqe *work)
 }
 
 static inline void cvmx_wqe_set_grp(struct cvmx_wqe *work, int grp)
-{ }
+{
+}
 
-static inline void cvmx_pow_work_submit(struct cvmx_wqe *wqp, uint32_t tag,
+static inline void cvmx_pow_work_submit(struct cvmx_wqe *wqp, u32 tag,
 					enum cvmx_pow_tag_type tag_type,
-					uint64_t qos, uint64_t grp)
-{ }
-
-#define CVMX_ASXX_RX_CLK_SETX(a, b)	((a) + (b))
-#define CVMX_ASXX_TX_CLK_SETX(a, b)	((a) + (b))
-#define CVMX_CIU_TIMX(a)		(a)
-#define CVMX_GMXX_RXX_ADR_CAM0(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CAM1(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CAM2(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CAM3(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CAM4(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_ADR_CAM5(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_FRM_CTL(a, b)	((a) + (b))
-#define CVMX_GMXX_RXX_INT_REG(a, b)	((a) + (b))
-#define CVMX_GMXX_SMACX(a, b)		((a) + (b))
-#define CVMX_PIP_PRT_TAGX(a)		(a)
-#define CVMX_POW_PP_GRP_MSKX(a)		(a)
-#define CVMX_POW_WQ_INT_THRX(a)		(a)
-#define CVMX_SPXX_INT_MSK(a)		(a)
-#define CVMX_SPXX_INT_REG(a)		(a)
-#define CVMX_SSO_PPX_GRP_MSK(a)		(a)
-#define CVMX_SSO_WQ_INT_THRX(a)		(a)
-#define CVMX_STXX_INT_MSK(a)		(a)
-#define CVMX_STXX_INT_REG(a)		(a)
+					u64 qos, u64 grp)
+{
+}
+
+#define CVMX_ASXX_RX_CLK_SETX(a, b) ((a) + (b))
+#define CVMX_ASXX_TX_CLK_SETX(a, b) ((a) + (b))
+#define CVMX_CIU_TIMX(a) (a)
+#define CVMX_GMXX_RXX_ADR_CAM0(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CAM1(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CAM2(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CAM3(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CAM4(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_ADR_CAM5(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_FRM_CTL(a, b) ((a) + (b))
+#define CVMX_GMXX_RXX_INT_REG(a, b) ((a) + (b))
+#define CVMX_GMXX_SMACX(a, b) ((a) + (b))
+#define CVMX_PIP_PRT_TAGX(a) (a)
+#define CVMX_POW_PP_GRP_MSKX(a) (a)
+#define CVMX_POW_WQ_INT_THRX(a) (a)
+#define CVMX_SPXX_INT_MSK(a) (a)
+#define CVMX_SPXX_INT_REG(a) (a)
+#define CVMX_SSO_PPX_GRP_MSK(a) (a)
+#define CVMX_SSO_WQ_INT_THRX(a) (a)
+#define CVMX_STXX_INT_MSK(a) (a)
+#define CVMX_STXX_INT_REG(a) (a)
-- 
2.53.0

