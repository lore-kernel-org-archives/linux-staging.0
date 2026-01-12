Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3F531064E
	for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 10:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768214355; cv=none; b=RdCr1MJZuRDz/wz4/IVtGX0yldCvZML9XF4JgqxCdavg8GU9ROslKbsebErcEI/luDxcxuirQQiIORP6rJazqRqrK/SWrfTQiB8L75v6zGJHngcb5DQuHEJpwIOiUcCcDX9X3mw0A2oAzbKtBC/+sOyuBhoHxjvs+GIh2gxV9x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768214355; c=relaxed/simple;
	bh=S5Twa72nfVFGtqf+k2L41DeNdYekhlN++HMUxcy4lx8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MX5FhDwFV8cONqq3/wHU2K0Axw+5Dc8hYHvo1yUY4QkwTx99mfnjSF3mpgPTIWKlIXeWBO5XbEKJ9Rk9dRu3DH3+eZP3PlrFsWE11zAvuNPi3nNk3hqjZbxmzDAd+UmypaLDEpMIf3zOtxuEIS1O6DNxaY8CECtG2aW9ugZwPxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SueWs7Aj; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SueWs7Aj"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-81f223c70d8so1561276b3a.1
        for <linux-staging@lists.linux.dev>; Mon, 12 Jan 2026 02:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768214352; x=1768819152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KK//KsiGEp60qFYaue6h/gxDfdmIfb6SRdWzhxa5x3U=;
        b=SueWs7AjsFMol9kwFCFlteYGOa9O70zJDMSrZGV1ztmMYpA5WckIsEGApPUPDmRYhk
         YVKg1mC8OL8BM4kcNMtjIcxB8lt415Pw3aS3r0Bmztf1bK7Bf2pgTdx36DSeIydc2YfW
         rmLu1OoClVUgZL5keyH/SdU21IuqVyCmX+naeRPA1i3kRoNXF20p1vpMSVFvwVbPVDdn
         9+of9pFQmnOu4wiCI1tCjMF+4XnazEQxavJVQ/KWx3z13e9wqmm4TZMnUMLwPUDPqpex
         agEyuhFlH1L2P8X6qj0kUMDsVOBI8L6irVQgqPn0CaDii10qB2k95ZtIkpyD25bcf3D7
         AuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768214352; x=1768819152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KK//KsiGEp60qFYaue6h/gxDfdmIfb6SRdWzhxa5x3U=;
        b=fagcX34OikSxxxVzlXIVH/+Xta5OdkQ58ramSlQceNHtp5Sht8RQ4gngcZLydVtEug
         VeIqBJ0OFjQyO39pt6eXUND6d02/rMN1ip3cy/NgwEk9ZLSyyL7UCbE7BFxMwZuP3F3s
         EkUSiVAeEkEojZpkjIZd3l0OFlmUV+ZyO4CPRMJVlIFHdOKQT1lM/u3p6qlbzEWW4k+4
         JCgxcJAF1JLqh9WvkJASfNHq/03NZLQkMdzRfxWGcAdOIjCSQT3ZjNx/KZtLqF8oZxwm
         YlT6xxn8MIKk6a7PjP73/Ee/lV28vgP4ZlZUb+7nybqCbODb6d0TFZzHLx1OaZ1yfRbC
         AGXQ==
X-Gm-Message-State: AOJu0YyPyR+3kGpjgDjarZb5OfR6Zp4CXVD9fvbuacO0jKJ8oGjJJ9XW
	xrrlXzMtz738H5tJECSfu73K8fxEqI02UpULYMFf2aXyEAM1Hcxc3lS6
X-Gm-Gg: AY/fxX6BcHQPDLjWIQnLn3COi6rrrpsHNBiJhk6Y4dGwMFWdZ4cNHb/k8Uw3FjFNLos
	tsfIpq74p79L2eQOCNDc7ciQr6X8EcMxJSLheYLBJBxOhjkONVGSUyzEIZvpVQG/YsdkB9gqhma
	ZAz/PrqFEnoYLgN3fF0GuVtsqGpIxD82V9rw2ofSmwHu3S8Ii9w2Z/shXCIWkvkxITFWBwZQCeL
	3JtK6SJOUmbGzc1rMNB44pLM1QIBaV5HxCJ+eqETDMWyxtLQTS8N/W9xcMUfywaISQYw9sWqOAY
	B5aEPCr4AxE1+nXeCp3PPYfVu+hrOLMf7yranBNWKpT5QFu7bV12b+/0BJDQdAgE6+G3QJnyENo
	N0OJO+XNLE/vFoFdK7Reqs+n8o4Pdf2KaI6N6+6bCcM1Xm09C0jpZEhjRRBVhHa2hwblcWaZzO7
	v5q72GnsGaGOeY9tJMcmVDgK7P1QbrDP44Igc+hbgs
X-Google-Smtp-Source: AGHT+IG92RPFmB9zW9yxL8Ezh+MU9FoXAr0f04UbmJ9eNExks6Us/ApCWm7HhOXJSacQ3uU9H3n4Og==
X-Received: by 2002:a05:6a21:6d8c:b0:366:581e:1a07 with SMTP id adf61e73a8af0-3898f9bc617mr15684162637.60.1768214351843;
        Mon, 12 Jan 2026 02:39:11 -0800 (PST)
Received: from localhost.localdomain ([103.215.237.209])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c59b024cfb4sm4885376a12.14.2026.01.12.02.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 02:39:11 -0800 (PST)
From: Karthikey Kadati <karthikey3608@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karthikey Kadati <karthikey3608@gmail.com>
Subject: [PATCH v2] staging: octeon: Remove port status typedefs
Date: Mon, 12 Jan 2026 16:08:43 +0530
Message-ID: <20260112103843.22925-1-karthikey3608@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove cvmx_pip_port_status_t and cvmx_pko_port_status_t typedefs.

Replace them with struct cvmx_pip_port_status and struct cvmx_pko_port_status

to match Linux kernel coding style.

Signed-off-by: Karthikey Kadati <karthikey3608@gmail.com>
---
 drivers/staging/octeon/ethernet.c     |  4 ++--
 drivers/staging/octeon/octeon-stubs.h | 15 ++++++++-------
 2 files changed, 10 insertions(+), 9 deletions(-)

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
index 35b5078ba..3f90cfd0d 100644
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
@@ -1260,11 +1260,12 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
-static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+static inline void cvmx_pko_get_port_status(uint64_t port_num,
+					      uint64_t clear,
+					      struct cvmx_pko_port_status *status)
 { }
 
 static inline cvmx_helper_interface_mode_t cvmx_helper_interface_get_mode(int
-- 
2.43.0

