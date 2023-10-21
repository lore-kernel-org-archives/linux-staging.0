Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E81AD532
	for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CWNjBSWL"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-507a29c7eefso2355324e87.1
        for <linux-staging@lists.linux.dev>; Sat, 21 Oct 2023 03:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697883311; x=1698488111; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I6i+6Zk+Ae4u3p5f0EYLwQQbZ/ZK0ytUZDMopEzD3lw=;
        b=CWNjBSWLZWPuFf5jxK476ya/CjjMdWu0z7tHvY7msCISmJM7L8toepOYF2Sc1ohJ8R
         60LPTCdD1tZo8/GvoAbNQDxG/Naf3t/x7rYy7SpCfn05wT6wmo9xcreLpQgL74soQMvN
         fdrhURMQcocs4Cn4Mrq4cyrKdblg+jDa+BMJdcI1rgLyPVUcrTDjGNuN0KPWwvWJqAxB
         U1ZfR+OfjjBAJNLn2NJDIoqArSMTy/VMjbYC9YOi9zuPmVRPLG1heG6qAgdr9V6b8Lw6
         Sv8hh8n7JovsMmghy9s5Ga2e6Jo3MxMustoevJKqfEWbrajWxo/v2OlmI2k9y8uFxMP2
         UfJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697883311; x=1698488111;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=I6i+6Zk+Ae4u3p5f0EYLwQQbZ/ZK0ytUZDMopEzD3lw=;
        b=FsxNM3XRuXpg/wC5N5wDN4CkDhXTOHA044xc/5k+UTPwNFl3x5pAgaC7KwI9BQrNLe
         NODvQHEC5nGupTyQr+3NkSbORhTDXQuVBNe5gYovSJk11ZxVSWZytEiG8u0cCQIeQAcm
         pmEXuL5PtilHzuAhJei+Hl2zkbX3TP2Uq+L4YYPIJ1uqEOOJ7pvbRv8r9Cru1QB24u19
         KwA05ySWsqJPcMXVdXyK1Ucj+c+5DsZpHMMo/GYWerCTSXgFpy7qxcSND2BBhUKPlR92
         hzcy2s40yvovQfm/27+hoMBj9h8Gs80RE0q7VPqo9VWVi/7lQicmqc5rF6eIx0ZM32Wb
         hwJA==
X-Gm-Message-State: AOJu0Yz6a7cR03PhmCfCdcjLCsoSjNYpNXl1W0Tn9DA/OR3FRJcypKnU
	lTiy3Ij3aFTva7CjJhEFzvz54DlzcMA=
X-Google-Smtp-Source: AGHT+IH/l8Jv8bNGei7moOM9J2kF685y5VbgHCx+tiAV9AliL1SBJQQcShZdUEh/IG+XDb099XOZ7w==
X-Received: by 2002:a19:500c:0:b0:502:cc8d:f20a with SMTP id e12-20020a19500c000000b00502cc8df20amr3052017lfb.27.1697883311508;
        Sat, 21 Oct 2023 03:15:11 -0700 (PDT)
Received: from HP-ENVY-Notebook.lan (81-229-94-10-no68.tbcn.telia.com. [81.229.94.10])
        by smtp.googlemail.com with ESMTPSA id d18-20020a056512369200b005007e7211f7sm803114lfs.21.2023.10.21.03.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 03:15:10 -0700 (PDT)
From: Jonathan Bergh <bergh.jonathan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Jonathan Bergh <bergh.jonathan@gmail.com>
Subject: [PATCH v3 6/7] staging: octeon: Fix introduction of new typedef cvmx_pip_port_status_t in octeon
Date: Sat, 21 Oct 2023 12:12:37 +0200
Message-Id: <20231021101238.81466-7-bergh.jonathan@gmail.com>
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
cvmx_pip_port_status_t in the octeon driver and then fixes instances
where it was used.

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
index 023b107e077a..8c48acab49e4 100644
--- a/drivers/staging/octeon/ethernet.c
+++ b/drivers/staging/octeon/ethernet.c
@@ -201,7 +201,7 @@ EXPORT_SYMBOL(cvm_oct_free_work);
  */
 static struct net_device_stats *cvm_oct_common_get_stats(struct net_device *dev)
 {
-	cvmx_pip_port_status_t rx_status;
+	struct cvmx_pip_port_status rx_status;
 	cvmx_pko_port_status_t tx_status;
 	struct octeon_ethernet *priv = netdev_priv(dev);
 
diff --git a/drivers/staging/octeon/octeon-stubs.h b/drivers/staging/octeon/octeon-stubs.h
index 529a75ad7c67..33a0e1d5f961 100644
--- a/drivers/staging/octeon/octeon-stubs.h
+++ b/drivers/staging/octeon/octeon-stubs.h
@@ -384,7 +384,7 @@ union cvmx_ipd_sub_port_qos_cnt {
 	} s;
 };
 
-typedef struct {
+struct cvmx_pip_port_status {
 	uint32_t dropped_octets;
 	uint32_t dropped_packets;
 	uint32_t pci_raw_packets;
@@ -407,7 +407,7 @@ typedef struct {
 	uint32_t inb_packets;
 	uint64_t inb_octets;
 	uint16_t inb_errors;
-} cvmx_pip_port_status_t;
+};
 
 typedef struct {
 	uint32_t packets;
@@ -1258,7 +1258,7 @@ static inline int octeon_is_simulation(void)
 }
 
 static inline void cvmx_pip_get_port_status(uint64_t port_num, uint64_t clear,
-					    cvmx_pip_port_status_t *status)
+					    struct cvmx_pip_port_status *status)
 { }
 
 static inline void cvmx_pko_get_port_status(uint64_t port_num, uint64_t clear,
-- 
2.40.1

