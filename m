Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BBC1D536
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XxYfs0B5"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-507962561adso2334812e87.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883314; x=1698488114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OzDHqn7UNaJzOjgCcjrENJmpRSweOhwpG6H5CfyFDbc=;
        b=XxYfs0B5QU/OnTpkxqmxAuvnajDaCDqgtItTEfZ+e8rFSxRkONBnhQbMuBvWGPKl1c
         TJSRS6A0AzbhJWGOf4RUuVb15YPSfEzEkKdRXqXUE9wlYrPsAYERPnfS/FdVcnPgmoQA
         MYNz4O1eUPxNUVxjPS7NH1RtQlwal6TZJuPrzDzz8h4cEqkHxYuJW1lKP1S083WukTHJ
         9xOWNiqddrs5tSOjbDKHa3wUJowXVi3DNmCNIbYbi3JHligDqY7E9RKPQnfbKYr62H4V
         CMeqCogvbOGiUEf/2+zfeV/nf8jS1NvIlENg45KZfMKY8PsPDUybwsFGeWL1PS24XBye
         5SOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883314; x=1698488114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OzDHqn7UNaJzOjgCcjrENJmpRSweOhwpG6H5CfyFDbc=;
        b=EhPNVCpb+/CBzRzUk8B4z2kZ0VWaPnJiXA0dBh08iC5+SOmcA3anopPeW5F+YyUiKq
         I3G3b1NMFbKQmuOrmkRKPc0elveqQCLiFmz5ZaMHw1l0D2aywVaeG8t+tthfFWgIrb/K
         lHfzH9ao6K0K7o29aTNicLm+eGSyz2IkPyTi7bhOgi+PpDIsFAR/nJZI29nNZ39ad0DS
         RvQ7145nRKF9mKAHeQ+7T+qJSCMPFxZOfXQGL1Gn5rG/FztHuaCloSJEJZMwXQhax+AV
         RbzXBK7kq1/Pp5e2o+x816fQmLv11KuiY3IS1p2XcV8n5bWg+TgUbDqUBEQzpDj2CFOY
         jekQ==
X-Gm-Message-State: AOJu0Yxm3v5LfAbcL7NY9w4Wfl7j5lnIid55AP0vHs++KWa0SbBaSe2V
	7foizD0E7kBEPHXPB2DjI4MgDZbqsV4=
X-Google-Smtp-Source: AGHT+IHDPVY4sNcclDFYWhFX/VrTw2vslXmMeCj+Hasg4Lr25V58WfbCv/H1hTrGtHIo3nN9NFVlIg==
X-Received: by 2002:a05:6512:baa:b0:500:acf1:b432 with SMTP id b42-20020a0565120baa00b00500acf1b432mr3336978lfv.63.1697883313787;
        Sat, 21 Oct 2023 03:15:13 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:15:13 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 7/7] staging: octeon: Fix introduction of new typedef cvmx_pko_port_status_t in octeon driver
Date: Sat, 21 Oct 2023 12:12:38 +0200
Message-Id: <20231021101238.81466-8-bergh.jonathan@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231021101238.81466-1-bergh.jonathan@gmail.com>
References: <20231021101238.81466-1-bergh.jonathan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes the introduction of a new struct typedef
cvmx_pko_port_status_t in the octeon driver and then fixes the
implementations which used it.

Signed-off-by: Jonathan Bergh <bergh.jonathan@gmail.com>
---
Changelog:                                                                 
v1 -> v2: Fix breaking change spread across multiple patches                
v2 -> v3: Break changes up into individual patches for each removed        
          typedef

 drivers/staging/octeon/ethernet.c     | 2 +-
 drivers/staging/octeon/octeon-stubs.h | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/octeon/ethernet.c b/drivers/staging/octeon/ethernet.c
index 8c48acab49e4..8e1f4b987a25 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -202,7 +202,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
 	struct cvmx_pip_port_status rx_status;
-	cvmx_pko_port_status_t tx_status;
+	struct cvmx_pko_port_status tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
 	if (priv->port < CVMX_PIP_NUM_INPUT_PORTS) {
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 33a0e1d5f961..cf7f77061eb9 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -409,11 +409,11 @@ struct cvmx_pip_port_status {
 	uint16_t inb_errors;
 };
 
-typedef struct {
+struct cvmx_pko_port_status {
 	uint32_t packets;
 	uint64_t octets;
 	uint64_t doorbell;
-} cvmx_pko_port_status_t;
+};
 
 union cvmx_pip_frm_len_chkx {
 	uint64_t u64;
@@ -1262,7 +1262,7 @@ static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pko_port_status_t *status)
+					    struct cvmx_pko_port_status *status)
 { }
 
 static inline enum cvmx_helper_interface_mode cvmx_helper_interface_get_mode(int
-- 
2.40.1

