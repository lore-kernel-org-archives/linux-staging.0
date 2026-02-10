Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403FB277016
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 14:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770734910; cv=none; b=jJGsSpegtldl7LUvEuZVkdi7Ud51Sp4PM7HGzNjzVO+hfgY0+agVMtjS/nzcNMPrwswWTJuxpeMmzrSI4LAEYSVu0ByUD20U2zBSTC74ziXN0JXVPD0+v35dkmHoqzFq6nBP/lI3NLmoGkTulVsPvSt+gtMFOj18qOY6heHdAxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770734910; c=relaxed/simple;
	bh=TChafqoZZCEzU5FqyGi/MseCXu7/EMXRK9VspoJkaJ0=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PQCOR30zbjkJpJYr29h5syIpYUCoX9lLsxpxAXyfU0OQpU4kmOwHWxwaGDIcthW6TRe0bh2e8EoYi40hB00iR1nErHXA31KZBFEi9LpjkB7dCmET0am5GijrLrHfPkBgDliwfMCfYt10KgyE7EBglnhgB2uzU+Cs91e5sCvOeKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XIyEh+e4; arc=none smtp.client-ip=209.85.217.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XIyEh+e4"
Received: by mail-vs1-f54.google.com with SMTP id ada2fe7eead31-5fa3f2b8f7fso1656880137.2
        for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 06:48:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770734907; x=1771339707; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xTzbQuYBNJaOTIwrLRt4gzoNHBYxUzqS/39Cjf064us=;
        b=XIyEh+e4diWJ4CnKtlN365IYv6wY3PGZq/550ys4zOJcGke87IWEzlXFKf/flCnsUZ
         PDUhxK+J5m7uOlyy8ZLf6PbRkHUZNqj9B2dEsEBF+NbIRrjDBkHQ10xYkXs7cVB6GtVS
         AJDVMvWc44AA0i4oVUj7KEsDSniM4RDOG36EJp2bopm3ulDvV379OacLHNCWZSXbj3Pr
         9K/RMFvFrwqSEthMIVoDytMudchzTPMWa7chqgEB3UQ/Dzsk5wQCL1iHWyrPySs3zu3X
         t+vum261EWk2Wtu1bbupVzY8geP/M7MRsu1MGRbX3oi4VSFw5cYMpC9FDAztCqfV1/c9
         ONng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770734907; x=1771339707;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xTzbQuYBNJaOTIwrLRt4gzoNHBYxUzqS/39Cjf064us=;
        b=TF9+4h5Y3/kC0tbrTeX93q79iVZulBOhu5LBl90tBTiRom7p0GrFQolWwTBT970RCN
         BSFM/Y426theXfdSofm8nPEEzx5KfrxDG8VjxejR/jwK1528LpVRVp2O6Dr//7OzJV/S
         57xm6pU+3I9ldftEoh8J0RgcIPkkESbCUh7vdQKmMu3WvuYhORz/MlEf0aJkSD/vUqG+
         yocqf+JamEdHbSTv+OYdep7//LdbPC75+bwBx+CcfZqozr+kOhl2bvPeJq2sdJDwtXLB
         XcwW14BYkkh2mEhaT7OFAmExT4lnf/U8HhxFwGvxRTuYE7ObSftXDtxR7UHrfahto1+v
         Cq3Q==
X-Forwarded-Encrypted: i=1; AJvYcCX8OlN6lGuVrBTBaXK4z4CaSSvAAsw4LxvRlZ3MrgXA9HmI5zMAyL+j9g3LfBkUWBRNsqeduZ0Kq4yjfaGu@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2P3pQcah+Y76ul12QtnG6u7QDi6w1Bxol+aQVjdfO05JKZKpu
	sCj3991VsCr+T6uYW78hQGFzuz7ey+CvqT/q7WWpmW2X45Cnl1jOZTQhGc9vwm7O
X-Gm-Gg: AZuq6aJTMuZZ5eRBchTXo02NuXRyPt+4n1p5HerT5qvEExC/gg8pssTLZ77AsbnubMt
	982BwQouPIpbuAUW4E/8kHMHt1j8d+iKZgyEzmaa7c5stVJaglRnmnFgAk81Hf7Vlr957yRWohh
	DOEjZuI22W3nH2C5p0VPMv3Xr3jeotinayaGSLxAOZnYfso+T9BC83YMSz1smKWb0BL1o7fc4Nm
	6Q+U1A3g5UFU3qnfZkgU8wAm45IJne1hemijGMG7rATJ4vcstSPy5px93gerIeg5ltV5KhI/ZeE
	jlKF1I+dPasaihrdYHINgLESuvJYiG+2Nh0s2yvK56CDJKOf/HoOQ78Zm0XsEum9XlXhzUoL5aS
	dwfxMPsEeeTAPv2/0trfp/QDhD/Nw69e5GQApAh3YN8JIc+5jyuwj0Hs1q22CtE1tH0FwsFCwoQ
	awQIojAlwLjbafFb3PX8RB47fbhUPt
X-Received: by 2002:a05:6102:3e8a:b0:5db:3bbf:8e62 with SMTP id ada2fe7eead31-5fc48c34684mr600737137.1.1770734906842;
        Tue, 10 Feb 2026 06:48:26 -0800 (PST)
Received: from localhost ([200.33.206.188])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-949014a62d9sm4300862241.1.2026.02.10.06.48.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Feb 2026 06:48:26 -0800 (PST)
Date: Tue, 10 Feb 2026 14:48:25 +0000
From: Yoelvis Oliveros <yoelvisoliveros@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: octeon: type change from uint<bits>_t to u<bits>
Message-ID: <aYtDmUdoYPL58uVO@archlinux>
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
Changes in v2:
 - Removed unnecessary changes made for the formatter
---
 drivers/staging/octeon/octeon-stubs.h | 1614 ++++++++++++-------------
 1 file changed, 807 insertions(+), 807 deletions(-)

diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 35b5078ba51e..291eaffd2543 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -124,65 +124,65 @@ union cvmx_pip_wqe_word2 {
 
 union cvmx_pip_wqe_word0 {
 	struct {
-		uint64_t next_ptr:40;
-		uint8_t unused;
+		u64 next_ptr:40;
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
+		u64 pknd:6;        /* 0..5 */
+		u64 unused2:2;     /* 6..7 */
+		u64 bpid:6;        /* 8..13 */
+		u64 unused1:18;    /* 14..31 */
+		u64 l2ptr:8;       /* 32..39 */
+		u64 l3ptr:8;       /* 40..47 */
+		u64 unused0:8;     /* 48..55 */
+		u64 l4ptr:8;       /* 56..63 */
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
+		u64 tag:32;
+		u64 tag_type:2;
+		u64 varies:14;
+		u64 len:16;
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
+		u64 tag:32;
+		u64 tag_type:2;
+		u64 zero_2:3;
+		u64 grp:6;
+		u64 zero_1:1;
+		u64 qos:3;
+		u64 zero_0:1;
+		u64 len:16;
 	} cn68xx;
 	struct {
-		uint64_t tag:32;
-		uint64_t tag_type:2;
-		uint64_t zero_2:1;
-		uint64_t grp:4;
-		uint64_t qos:3;
-		uint64_t ipprt:6;
-		uint64_t len:16;
+		u64 tag:32;
+		u64 tag_type:2;
+		u64 zero_2:1;
+		u64 grp:4;
+		u64 qos:3;
+		u64 ipprt:6;
+		u64 len:16;
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
+		u64 i:1;
+		u64 back:4;
+		u64 pool:3;
+		u64 size:16;
+		u64 addr:40;
 	} s;
 };
 
@@ -191,16 +191,16 @@ struct cvmx_wqe {
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
+		u64 reserved_20_63:44;
+		u64 link_up:1;	    /**< Is the physical link up? */
+		u64 full_duplex:1;	    /**< 1 if the link is full duplex */
+		u64 speed:18;	    /**< Speed of the link in Mbps */
 	} s;
 };
 
@@ -264,921 +264,921 @@ enum cvmx_pow_tag_type {
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
+		u64 reserved_18_63:46;
+		u64 use_sop:1;
+		u64 rst_done:1;
+		u64 clken:1;
+		u64 no_wptr:1;
+		u64 pq_apkt:1;
+		u64 pq_nabuf:1;
+		u64 ipd_full:1;
+		u64 pkt_off:1;
+		u64 len_m8:1;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 reserved_10_63:54;
+		u64 len_m8:1;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 reserved_9_63:55;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 reserved_15_63:49;
+		u64 no_wptr:1;
+		u64 pq_apkt:1;
+		u64 pq_nabuf:1;
+		u64 ipd_full:1;
+		u64 pkt_off:1;
+		u64 len_m8:1;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 reserved_12_63:52;
+		u64 ipd_full:1;
+		u64 pkt_off:1;
+		u64 len_m8:1;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 reserved_16_63:48;
+		u64 clken:1;
+		u64 no_wptr:1;
+		u64 pq_apkt:1;
+		u64 pq_nabuf:1;
+		u64 ipd_full:1;
+		u64 pkt_off:1;
+		u64 len_m8:1;
+		u64 reset:1;
+		u64 addpkt:1;
+		u64 naddbuf:1;
+		u64 pkt_lend:1;
+		u64 wqe_lend:1;
+		u64 pbp_en:1;
+		u64 opc_mode:2;
+		u64 ipd_en:1;
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
+		u64 port_bit:32;
+		u64 reserved_32_35:4;
+		u64 port_bit2:4;
+		u64 reserved_40_63:24;
 	} s;
 	struct cvmx_ipd_sub_port_fcs_cn30xx {
-		uint64_t port_bit:3;
-		uint64_t reserved_3_63:61;
+		u64 port_bit:3;
+		u64 reserved_3_63:61;
 	} cn30xx;
 	struct cvmx_ipd_sub_port_fcs_cn38xx {
-		uint64_t port_bit:32;
-		uint64_t reserved_32_63:32;
+		u64 port_bit:32;
+		u64 reserved_32_63:32;
 	} cn38xx;
 };
 
 union cvmx_ipd_sub_port_qos_cnt {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ipd_sub_port_qos_cnt_s {
-		uint64_t cnt:32;
-		uint64_t port_qos:9;
-		uint64_t reserved_41_63:23;
+		u64 cnt:32;
+		u64 port_qos:9;
+		u64 reserved_41_63:23;
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
+		u64 reserved_32_63:32;
+		u64 maxlen:16;
+		u64 minlen:16;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 vlan_len:1;
+		u64 pad_len:1;
+		u64 pre_align:1;
+		u64 null_dis:1;
+		u64 reserved_11_11:1;
+		u64 ptp_mode:1;
+		u64 reserved_13_63:51;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 vlan_len:1;
+		u64 pad_len:1;
+		u64 reserved_9_63:55;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 vlan_len:1;
+		u64 reserved_8_63:56;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 reserved_7_8:2;
+		u64 pre_align:1;
+		u64 null_dis:1;
+		u64 reserved_11_63:53;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 reserved_7_8:2;
+		u64 pre_align:1;
+		u64 reserved_10_63:54;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 vlan_len:1;
+		u64 pad_len:1;
+		u64 pre_align:1;
+		u64 null_dis:1;
+		u64 reserved_11_63:53;
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
+		u64 pre_chk:1;
+		u64 pre_strp:1;
+		u64 ctl_drp:1;
+		u64 ctl_bck:1;
+		u64 ctl_mcst:1;
+		u64 ctl_smac:1;
+		u64 pre_free:1;
+		u64 reserved_7_8:2;
+		u64 pre_align:1;
+		u64 null_dis:1;
+		u64 reserved_11_11:1;
+		u64 ptp_mode:1;
+		u64 reserved_13_63:51;
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
+		u64 minerr:1;
+		u64 carext:1;
+		u64 maxerr:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 alnerr:1;
+		u64 lenerr:1;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 niberr:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 phy_link:1;
+		u64 phy_spd:1;
+		u64 phy_dupx:1;
+		u64 pause_drp:1;
+		u64 loc_fault:1;
+		u64 rem_fault:1;
+		u64 bad_seq:1;
+		u64 bad_term:1;
+		u64 unsop:1;
+		u64 uneop:1;
+		u64 undat:1;
+		u64 hg2fld:1;
+		u64 hg2cc:1;
+		u64 reserved_29_63:35;
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
+		u64 minerr:1;
+		u64 carext:1;
+		u64 maxerr:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 alnerr:1;
+		u64 lenerr:1;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 niberr:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 phy_link:1;
+		u64 phy_spd:1;
+		u64 phy_dupx:1;
+		u64 reserved_19_63:45;
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
+		u64 reserved_0_0:1;
+		u64 carext:1;
+		u64 reserved_2_2:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 alnerr:1;
+		u64 reserved_6_6:1;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 niberr:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 phy_link:1;
+		u64 phy_spd:1;
+		u64 phy_dupx:1;
+		u64 pause_drp:1;
+		u64 reserved_20_63:44;
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
+		u64 reserved_0_0:1;
+		u64 carext:1;
+		u64 reserved_2_2:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 reserved_5_6:2;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 reserved_9_9:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 reserved_16_18:3;
+		u64 pause_drp:1;
+		u64 loc_fault:1;
+		u64 rem_fault:1;
+		u64 bad_seq:1;
+		u64 bad_term:1;
+		u64 unsop:1;
+		u64 uneop:1;
+		u64 undat:1;
+		u64 hg2fld:1;
+		u64 hg2cc:1;
+		u64 reserved_29_63:35;
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
+		u64 reserved_0_0:1;
+		u64 carext:1;
+		u64 reserved_2_2:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 reserved_5_6:2;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 reserved_9_9:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 reserved_16_18:3;
+		u64 pause_drp:1;
+		u64 loc_fault:1;
+		u64 rem_fault:1;
+		u64 bad_seq:1;
+		u64 bad_term:1;
+		u64 unsop:1;
+		u64 uneop:1;
+		u64 undat:1;
+		u64 reserved_27_63:37;
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
+		u64 minerr:1;
+		u64 carext:1;
+		u64 maxerr:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 alnerr:1;
+		u64 lenerr:1;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 niberr:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 phy_link:1;
+		u64 phy_spd:1;
+		u64 phy_dupx:1;
+		u64 pause_drp:1;
+		u64 reserved_20_63:44;
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
+		u64 minerr:1;
+		u64 carext:1;
+		u64 reserved_2_2:1;
+		u64 jabber:1;
+		u64 fcserr:1;
+		u64 reserved_5_6:2;
+		u64 rcverr:1;
+		u64 skperr:1;
+		u64 reserved_9_9:1;
+		u64 ovrerr:1;
+		u64 pcterr:1;
+		u64 rsverr:1;
+		u64 falerr:1;
+		u64 coldet:1;
+		u64 ifgerr:1;
+		u64 reserved_16_18:3;
+		u64 pause_drp:1;
+		u64 loc_fault:1;
+		u64 rem_fault:1;
+		u64 bad_seq:1;
+		u64 bad_term:1;
+		u64 unsop:1;
+		u64 uneop:1;
+		u64 undat:1;
+		u64 hg2fld:1;
+		u64 hg2cc:1;
+		u64 reserved_29_63:35;
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
+		u64 reserved_22_63:42;
+		u64 pknd:6;
+		u64 reserved_14_15:2;
+		u64 tx_idle:1;
+		u64 rx_idle:1;
+		u64 reserved_9_11:3;
+		u64 speed_msb:1;
+		u64 reserved_4_7:4;
+		u64 slottime:1;
+		u64 duplex:1;
+		u64 speed:1;
+		u64 en:1;
 	} s;
 	struct cvmx_gmxx_prtx_cfg_cn30xx {
-		uint64_t reserved_4_63:60;
-		uint64_t slottime:1;
-		uint64_t duplex:1;
-		uint64_t speed:1;
-		uint64_t en:1;
+		u64 reserved_4_63:60;
+		u64 slottime:1;
+		u64 duplex:1;
+		u64 speed:1;
+		u64 en:1;
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
+		u64 reserved_14_63:50;
+		u64 tx_idle:1;
+		u64 rx_idle:1;
+		u64 reserved_9_11:3;
+		u64 speed_msb:1;
+		u64 reserved_4_7:4;
+		u64 slottime:1;
+		u64 duplex:1;
+		u64 speed:1;
+		u64 en:1;
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
+		u64 reserved_4_63:60;
+		u64 cam_mode:1;
+		u64 mcst:2;
+		u64 bcst:1;
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
+		u64 reserved_54_63:10;
+		u64 portadd_en:1;
+		u64 inc_hwchk:1;
+		u64 reserved_50_51:2;
+		u64 grptagbase_msb:2;
+		u64 reserved_46_47:2;
+		u64 grptagmask_msb:2;
+		u64 reserved_42_43:2;
+		u64 grp_msb:2;
+		u64 grptagbase:4;
+		u64 grptagmask:4;
+		u64 grptag:1;
+		u64 grptag_mskip:1;
+		u64 tag_mode:2;
+		u64 inc_vs:2;
+		u64 inc_vlan:1;
+		u64 inc_prt_flag:1;
+		u64 ip6_dprt_flag:1;
+		u64 ip4_dprt_flag:1;
+		u64 ip6_sprt_flag:1;
+		u64 ip4_sprt_flag:1;
+		u64 ip6_nxth_flag:1;
+		u64 ip4_pctl_flag:1;
+		u64 ip6_dst_flag:1;
+		u64 ip4_dst_flag:1;
+		u64 ip6_src_flag:1;
+		u64 ip4_src_flag:1;
+		u64 tcp6_tag_type:2;
+		u64 tcp4_tag_type:2;
+		u64 ip6_tag_type:2;
+		u64 ip4_tag_type:2;
+		u64 non_tag_type:2;
+		u64 grp:4;
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
+		u64 reserved_40_63:24;
+		u64 grptagbase:4;
+		u64 grptagmask:4;
+		u64 grptag:1;
+		u64 reserved_30_30:1;
+		u64 tag_mode:2;
+		u64 inc_vs:2;
+		u64 inc_vlan:1;
+		u64 inc_prt_flag:1;
+		u64 ip6_dprt_flag:1;
+		u64 ip4_dprt_flag:1;
+		u64 ip6_sprt_flag:1;
+		u64 ip4_sprt_flag:1;
+		u64 ip6_nxth_flag:1;
+		u64 ip4_pctl_flag:1;
+		u64 ip6_dst_flag:1;
+		u64 ip4_dst_flag:1;
+		u64 ip6_src_flag:1;
+		u64 ip4_src_flag:1;
+		u64 tcp6_tag_type:2;
+		u64 tcp4_tag_type:2;
+		u64 ip6_tag_type:2;
+		u64 ip4_tag_type:2;
+		u64 non_tag_type:2;
+		u64 grp:4;
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
+		u64 reserved_40_63:24;
+		u64 grptagbase:4;
+		u64 grptagmask:4;
+		u64 grptag:1;
+		u64 grptag_mskip:1;
+		u64 tag_mode:2;
+		u64 inc_vs:2;
+		u64 inc_vlan:1;
+		u64 inc_prt_flag:1;
+		u64 ip6_dprt_flag:1;
+		u64 ip4_dprt_flag:1;
+		u64 ip6_sprt_flag:1;
+		u64 ip4_sprt_flag:1;
+		u64 ip6_nxth_flag:1;
+		u64 ip4_pctl_flag:1;
+		u64 ip6_dst_flag:1;
+		u64 ip4_dst_flag:1;
+		u64 ip6_src_flag:1;
+		u64 ip4_src_flag:1;
+		u64 tcp6_tag_type:2;
+		u64 tcp4_tag_type:2;
+		u64 ip6_tag_type:2;
+		u64 ip4_tag_type:2;
+		u64 non_tag_type:2;
+		u64 grp:4;
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
+		u64 reserved_32_63:32;
+		u64 spf:1;
+		u64 reserved_12_30:19;
+		u64 calerr:1;
+		u64 syncerr:1;
+		u64 diperr:1;
+		u64 tpaovr:1;
+		u64 rsverr:1;
+		u64 drwnng:1;
+		u64 clserr:1;
+		u64 spiovr:1;
+		u64 reserved_2_3:2;
+		u64 abnorm:1;
+		u64 prtnxa:1;
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
+		u64 reserved_12_63:52;
+		u64 calerr:1;
+		u64 syncerr:1;
+		u64 diperr:1;
+		u64 tpaovr:1;
+		u64 rsverr:1;
+		u64 drwnng:1;
+		u64 clserr:1;
+		u64 spiovr:1;
+		u64 reserved_2_3:2;
+		u64 abnorm:1;
+		u64 prtnxa:1;
 	} s;
 };
 
 union cvmx_pow_wq_int {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_pow_wq_int_s {
-		uint64_t wq_int:16;
-		uint64_t iq_dis:16;
-		uint64_t reserved_32_63:32;
+		u64 wq_int:16;
+		u64 iq_dis:16;
+		u64 reserved_32_63:32;
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
+		u64 iq_thr:12;
+		u64 reserved_12_13:2;
+		u64 ds_thr:12;
+		u64 reserved_26_27:2;
+		u64 tc_thr:4;
+		u64 tc_en:1;
+		u64 reserved_33_63:31;
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
+		u64 reserved_9_63:55;
+		u64 syncerr:1;
+		u64 frmerr:1;
+		u64 unxfrm:1;
+		u64 nosync:1;
+		u64 diperr:1;
+		u64 datovr:1;
+		u64 ovrbst:1;
+		u64 calpar1:1;
+		u64 calpar0:1;
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
+		u64 reserved_8_63:56;
+		u64 frmerr:1;
+		u64 unxfrm:1;
+		u64 nosync:1;
+		u64 diperr:1;
+		u64 datovr:1;
+		u64 ovrbst:1;
+		u64 calpar1:1;
+		u64 calpar0:1;
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
+		u64 reserved_0_7:8;
+		u64 pc_thr:20;
+		u64 reserved_28_31:4;
+		u64 pc:28;
+		u64 reserved_60_63:4;
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
+		u64 reserved_29_63:35;
+		u64 tc_en:1;
+		u64 tc_thr:4;
+		u64 reserved_23_23:1;
+		u64 ds_thr:11;
+		u64 reserved_11_11:1;
+		u64 iq_thr:11;
 	} s;
 	struct cvmx_pow_wq_int_thrx_cn30xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_18_23:6;
-		uint64_t ds_thr:6;
-		uint64_t reserved_6_11:6;
-		uint64_t iq_thr:6;
+		u64 reserved_29_63:35;
+		u64 tc_en:1;
+		u64 tc_thr:4;
+		u64 reserved_18_23:6;
+		u64 ds_thr:6;
+		u64 reserved_6_11:6;
+		u64 iq_thr:6;
 	} cn30xx;
 	struct cvmx_pow_wq_int_thrx_cn31xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_20_23:4;
-		uint64_t ds_thr:8;
-		uint64_t reserved_8_11:4;
-		uint64_t iq_thr:8;
+		u64 reserved_29_63:35;
+		u64 tc_en:1;
+		u64 tc_thr:4;
+		u64 reserved_20_23:4;
+		u64 ds_thr:8;
+		u64 reserved_8_11:4;
+		u64 iq_thr:8;
 	} cn31xx;
 	struct cvmx_pow_wq_int_thrx_cn52xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_21_23:3;
-		uint64_t ds_thr:9;
-		uint64_t reserved_9_11:3;
-		uint64_t iq_thr:9;
+		u64 reserved_29_63:35;
+		u64 tc_en:1;
+		u64 tc_thr:4;
+		u64 reserved_21_23:3;
+		u64 ds_thr:9;
+		u64 reserved_9_11:3;
+		u64 iq_thr:9;
 	} cn52xx;
 	struct cvmx_pow_wq_int_thrx_cn63xx {
-		uint64_t reserved_29_63:35;
-		uint64_t tc_en:1;
-		uint64_t tc_thr:4;
-		uint64_t reserved_22_23:2;
-		uint64_t ds_thr:10;
-		uint64_t reserved_10_11:2;
-		uint64_t iq_thr:10;
+		u64 reserved_29_63:35;
+		u64 tc_en:1;
+		u64 tc_thr:4;
+		u64 reserved_22_23:2;
+		u64 ds_thr:10;
+		u64 reserved_10_11:2;
+		u64 iq_thr:10;
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
+		u64 reserved_32_63:32;
+		u64 rint_31:1;
+		u64 iob:1;
+		u64 reserved_28_29:2;
+		u64 rint_27:1;
+		u64 rint_26:1;
+		u64 rint_25:1;
+		u64 rint_24:1;
+		u64 asx1:1;
+		u64 asx0:1;
+		u64 rint_21:1;
+		u64 pip:1;
+		u64 spx1:1;
+		u64 spx0:1;
+		u64 lmc:1;
+		u64 l2c:1;
+		u64 rint_15:1;
+		u64 reserved_13_14:2;
+		u64 pow:1;
+		u64 tim:1;
+		u64 pko:1;
+		u64 ipd:1;
+		u64 rint_8:1;
+		u64 zip:1;
+		u64 dfa:1;
+		u64 fpa:1;
+		u64 key:1;
+		u64 npi:1;
+		u64 gmx1:1;
+		u64 gmx0:1;
+		u64 mio:1;
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
+		u64 reserved_32_63:32;
+		u64 rint_31:1;
+		u64 iob:1;
+		u64 rint_29:1;
+		u64 rint_28:1;
+		u64 rint_27:1;
+		u64 rint_26:1;
+		u64 rint_25:1;
+		u64 rint_24:1;
+		u64 asx1:1;
+		u64 asx0:1;
+		u64 rint_21:1;
+		u64 pip:1;
+		u64 spx1:1;
+		u64 spx0:1;
+		u64 lmc:1;
+		u64 l2c:1;
+		u64 rint_15:1;
+		u64 rint_14:1;
+		u64 usb:1;
+		u64 pow:1;
+		u64 tim:1;
+		u64 pko:1;
+		u64 ipd:1;
+		u64 rint_8:1;
+		u64 zip:1;
+		u64 dfa:1;
+		u64 fpa:1;
+		u64 key:1;
+		u64 npi:1;
+		u64 gmx1:1;
+		u64 gmx0:1;
+		u64 mio:1;
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
+		u64 reserved_32_63:32;
+		u64 rint_31:1;
+		u64 iob:1;
+		u64 rint_29:1;
+		u64 rint_28:1;
+		u64 rint_27:1;
+		u64 rint_26:1;
+		u64 rint_25:1;
+		u64 rint_24:1;
+		u64 asx1:1;
+		u64 asx0:1;
+		u64 rint_21:1;
+		u64 pip:1;
+		u64 spx1:1;
+		u64 spx0:1;
+		u64 lmc:1;
+		u64 l2c:1;
+		u64 rint_15:1;
+		u64 rint_14:1;
+		u64 rint_13:1;
+		u64 pow:1;
+		u64 tim:1;
+		u64 pko:1;
+		u64 ipd:1;
+		u64 rint_8:1;
+		u64 zip:1;
+		u64 dfa:1;
+		u64 fpa:1;
+		u64 key:1;
+		u64 npi:1;
+		u64 gmx1:1;
+		u64 gmx0:1;
+		u64 mio:1;
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
+		u64 reserved_31_63:33;
+		u64 iob:1;
+		u64 lmc1:1;
+		u64 agl:1;
+		u64 reserved_24_27:4;
+		u64 asx1:1;
+		u64 asx0:1;
+		u64 reserved_21_21:1;
+		u64 pip:1;
+		u64 spx1:1;
+		u64 spx0:1;
+		u64 lmc:1;
+		u64 l2c:1;
+		u64 reserved_15_15:1;
+		u64 rad:1;
+		u64 usb:1;
+		u64 pow:1;
+		u64 tim:1;
+		u64 pko:1;
+		u64 ipd:1;
+		u64 reserved_8_8:1;
+		u64 zip:1;
+		u64 dfa:1;
+		u64 fpa:1;
+		u64 key:1;
+		u64 npi:1;
+		u64 gmx1:1;
+		u64 gmx0:1;
+		u64 mio:1;
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
+		u64 total_bytes:16;
+		u64 segs:6;
+		u64 dontfree:1;
+		u64 ignore_i:1;
+		u64 ipoffp1:7;
+		u64 gather:1;
+		u64 rsp:1;
+		u64 wqp:1;
+		u64 n2:1;
+		u64 le:1;
+		u64 reg0:11;
+		u64 subone0:1;
+		u64 reg1:11;
+		u64 subone1:1;
+		u64 size0:2;
+		u64 size1:2;
 	} s;
 };
 
 union cvmx_ciu_timx {
-	uint64_t u64;
+	u64 u64;
 	struct cvmx_ciu_timx_s {
-		uint64_t reserved_37_63:27;
-		uint64_t one_shot:1;
-		uint64_t len:36;
+		u64 reserved_37_63:27;
+		u64 one_shot:1;
+		u64 len:36;
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
+		u64 status:1;
+		u64 speed:2;
+		u64 duplex:1;
+		u64 reserved_4_63:60;
 	} s;
 };
 
@@ -1196,12 +1196,12 @@ static inline void cvmx_fau_atomic_write32(enum cvmx_fau_reg_32 reg,
 					   int32_t value)
 { }
 
-static inline uint64_t cvmx_scratch_read64(uint64_t address)
+static inline u64 cvmx_scratch_read64(u64 address)
 {
 	return 0;
 }
 
-static inline void cvmx_scratch_write64(uint64_t address, uint64_t value)
+static inline void cvmx_scratch_write64(u64 address, u64 value)
 { }
 
 static inline int cvmx_wqe_get_grp(struct cvmx_wqe *work)
@@ -1209,7 +1209,7 @@ static inline int cvmx_wqe_get_grp(struct cvmx_wqe *work)
 	return 0;
 }
 
-static inline void *cvmx_phys_to_ptr(uint64_t physical_address)
+static inline void *cvmx_phys_to_ptr(u64 physical_address)
 {
 	return (void *)(uintptr_t)(physical_address);
 }
@@ -1232,12 +1232,12 @@ static inline int cvmx_helper_get_interface_index_num(int ipd_port)
 static inline void cvmx_fpa_enable(void)
 { }
 
-static inline uint64_t cvmx_read_csr(uint64_t csr_addr)
+static inline u64 cvmx_read_csr(u64 csr_addr)
 {
 	return 0;
 }
 
-static inline void cvmx_write_csr(uint64_t csr_addr, uint64_t val)
+static inline void cvmx_write_csr(u64 csr_addr, u64 val)
 { }
 
 static inline int cvmx_helper_setup_red(int pass_thresh, int drop_thresh)
@@ -1245,13 +1245,13 @@ static inline int cvmx_helper_setup_red(int pass_thresh, int drop_thresh)
 	return 0;
 }
 
-static inline void *cvmx_fpa_alloc(uint64_t pool)
+static inline void *cvmx_fpa_alloc(u64 pool)
 {
 	return NULL;
 }
 
-static inline void cvmx_fpa_free(void *ptr, uint64_t pool,
-				 uint64_t num_cache_lines)
+static inline void cvmx_fpa_free(void *ptr, u64 pool,
+				 u64 num_cache_lines)
 { }
 
 static inline int octeon_is_simulation(void)
@@ -1259,11 +1259,11 @@ static inline int octeon_is_simulation(void)
 	return 1;
 }
 
-static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
+static inline void cvmx_pip_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pip_port_status_t *status)
 { }
 
-static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
+static inline void cvmx_pko_get_port_status(u64 port_num, u64 clear,
 					    cvmx_pko_port_status_t *status)
 { }
 
@@ -1369,7 +1369,7 @@ static inline int cvmx_spi_restart_interface(int interface,
 	return 0;
 }
 
-static inline void cvmx_fau_async_fetch_and_add32(uint64_t scraddr,
+static inline void cvmx_fau_async_fetch_and_add32(u64 scraddr,
 						  enum cvmx_fau_reg_32 reg,
 						  int32_t value)
 { }
@@ -1382,12 +1382,12 @@ static inline union cvmx_gmxx_rxx_rx_inbnd cvmx_spi4000_check_speed(int interfac
 	return r;
 }
 
-static inline void cvmx_pko_send_packet_prepare(uint64_t port, uint64_t queue,
+static inline void cvmx_pko_send_packet_prepare(u64 port, u64 queue,
 						cvmx_pko_lock_t use_locking)
 { }
 
-static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(uint64_t port,
-		uint64_t queue, union cvmx_pko_command_word0 pko_command,
+static inline cvmx_pko_status_t cvmx_pko_send_packet_finish(u64 port,
+		u64 queue, union cvmx_pko_command_word0 pko_command,
 		union cvmx_buf_ptr packet, cvmx_pko_lock_t use_locking)
 {
 	return 0;
@@ -1407,9 +1407,9 @@ static inline int cvmx_wqe_get_qos(struct cvmx_wqe *work)
 static inline void cvmx_wqe_set_grp(struct cvmx_wqe *work, int grp)
 { }
 
-static inline void cvmx_pow_work_submit(struct cvmx_wqe *wqp, uint32_t tag,
+static inline void cvmx_pow_work_submit(struct cvmx_wqe *wqp, u32 tag,
 					enum cvmx_pow_tag_type tag_type,
-					uint64_t qos, uint64_t grp)
+					u64 qos, u64 grp)
 { }
 
 #define CVMX_ASXX_RX_CLK_SETX(a, b)	((a) + (b))
-- 
2.53.0

