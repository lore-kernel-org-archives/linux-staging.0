Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCA1866E8
	for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 19:30:25 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id q63so12243070pga.9
        for <linux-staging@lists.linux.dev>; Tue, 13 Sep 2022 12:30:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=D2vwqOzav4CEoHkfQCGRtdC0GM50sPPilT94bMdUvjM=;
        b=nJFfUaF6joYDViuPYmXJaqGEJlU0aKCjzkr3/uyMC9FR9ZUCeiU6lS3mrMfSS4Go1o
         SiSkoNKE5R5ET4HWPIxeSzfuZgImw9+hHPVK9fBD5/+vDZuxA6jiHw3bo5kTF1+dBQlZ
         TS5umc5ag+/UI6pTHh1WG/To4VnRbxq/HQMSmSibFcAd18PhSLFnoVDh3J1KshAha1a+
         wnA3bj6xcYuGGGl5RmHg4N+U8HDwZBujWXcw9F9BcT6w/pyKeXoraOqfxIPp0UBloZfH
         uhlRMsg/kK6lgUpYpf02ev2ooi2sdcIqQuTMVpnWhp4CA3G3H2zEQNKuP88vZcHWhggU
         bTeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=D2vwqOzav4CEoHkfQCGRtdC0GM50sPPilT94bMdUvjM=;
        b=vR1sMq3xQeo01OjTeC/TYD3JEDd3aGWH/EXVwBfsb+QyLKgmhlL5Ju/+Xu1w/oZPW+
         jGbf7fa43qYC0BkwO5QpyAQAquz2048nlMts1ETRPmoBiHxtcKmcvRy2gVX1j4zfwylm
         7yjs+SVqDfBYX6+egc7V3piXjtGngm9tXq+OBs73tLb3Ke6vt8iIybv8/1mHRWPeq9Y7
         4otxCZj0I914F/A0U6HX9+CqAcA2OFZi1I9VUM7EKkMsT/9028iLotklQ6MBpgFMRHos
         B00G6kOzblkZbBZ7ooRox3oBeye4oFoTlEpK128SXvvQTpLPPEYRfu0+sigz5jYMmFLk
         UafQ==
X-Gm-Message-State: ACgBeo1So2aG8IW/TBWOhj8vi9vCyPvhcv0LvEMoSfiNq4MZBr7Q0t2J
	AOR+ydjdKWhKB1CjsCRopJA=
X-Google-Smtp-Source: AA6agR4QP3iZF1NpQyf3yZ97OjjUp3qIeT9bmLCVv/nJPirFI2hu6uRzc7OSRX8F7zr9GTrDGaNmKw==
X-Received: by 2002:a63:80c6:0:b0:438:d512:e87c with SMTP id j189-20020a6380c6000000b00438d512e87cmr13605581pgd.619.1663097425170;
        Tue, 13 Sep 2022 12:30:25 -0700 (PDT)
Received: from ritvixpc.. ([2405:201:5c0b:6821:308b:e0f8:702c:13e6])
        by smtp.gmail.com with ESMTPSA id r18-20020a170902c7d200b001745662d568sm8641452pla.278.2022.09.13.12.30.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 12:30:24 -0700 (PDT)
From: Ritwik Sahani <ritwik.shn.dev@gmail.com>
To: 
Cc: Ritwik Sahani <ritwik.shn.dev@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] media: atomisp: move trailing statements to next line
Date: Wed, 14 Sep 2022 00:59:32 +0530
Message-Id: <20220913192933.31694-1-ritwik.shn.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:
ERROR: trailing statements should be on next line

Signed-off-by: Ritwik Sahani <ritwik.shn.dev@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 712e01c37870..4b426d938586 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -878,7 +878,8 @@ static input_system_err_t input_system_configure_channel(
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
+		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+			return error;
 		// Input switch channel configurations must be combined in united config.
 		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
 		    =
@@ -1586,13 +1587,15 @@ static input_system_err_t input_system_configure_channel_sensor(
 
 	status = set_source_type(&config.source_type, channel.source_type,
 				 &config.source_type_flags);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	// Check for conflicts on source (implicitly on multicast, capture unit and input buffer).
 
 	status = set_csi_cfg(&config.csi_value[port], &channel.source_cfg.csi_cfg,
 			     &config.csi_flags[port]);
-	if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+	if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+		return status;
 
 	switch (channel.source_cfg.csi_cfg.buffering_mode) {
 	case INPUT_SYSTEM_FIFO_CAPTURE:
@@ -1601,7 +1604,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_MIPI_PORT0 + port;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_CSI_BACKEND;
 
 		// Shared resource, so it should be blocked.
@@ -1616,7 +1620,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
@@ -1631,7 +1636,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
-- 
2.34.1

