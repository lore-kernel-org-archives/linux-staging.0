Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB6684DB557
	for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 17:04:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778691862; cv=none; b=jayYlQt3SVtBpLynCZnhDK7FJOqRMgqzMVbyvYX1+fHODngxDuRmI2j2qH7xzmS+cZ7C9ZxAsQbvE5gSVvXyQzRXYMB/zJGq2jvETCpztvuy/9+izaon0C17Sj6xKbTSetiyq+Vml7anwrTea3ewPQ0RQnVzkk1jGH+HliZGu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778691862; c=relaxed/simple;
	bh=M03VGnPw3A8DdSISwpvtbeABhaMtWieGENTzbxAaAvM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JiNw63F9AKNju63mi/U3RLVTP0L6Fpty+dW5Z/BUj0dK4Pw5w8oZ+LienaEvMT3tevMovnVWnJf5Jg1BXQn9Pt1mEe4ckDEFm/ief726NRf+OGLCY21HbCtCLYYcPULihwoED33PBB4iYUVn6nPctkWLoj4Y2iPXBeh4mh5hhd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cR6RbuQb; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cR6RbuQb"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38e97e73234so65185011fa.1
        for <linux-staging@lists.linux.dev>; Wed, 13 May 2026 10:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778691857; x=1779296657; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9CQ8kFrkRqI2OJXhweWy37iYOSF41egtPSUHTO04/H0=;
        b=cR6RbuQbWGKk07vxLlv5WzN6G2c8a0giSEQk8USaJf+YktmWG3JbRukiVEbW0oKhVf
         eEK4kUT6nKiYzwMSp4/XeGnyIOqg3NeIit8qUe2PEul9a3fmMWey1gijuUZknA71c+lz
         oht6RDO2os+W59Va7mtyQdRywtfCbw69deIq/eHQlcMk1EDr3SyB4pnlbF0a77zYtd8q
         RtvuQCe5Gi2BAVM8TIbuDF1ujd/2/kYUXslqqG7kvZKgMaP/au/ZGLMVn6U3oDBWQM8W
         ++E4JWvNxTrkyEk7JMVcFR4rVr7MyEzCMX4yuVk44yN0VPSYVQvd/1+7SGzpMoVXdEkU
         H75A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778691857; x=1779296657;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CQ8kFrkRqI2OJXhweWy37iYOSF41egtPSUHTO04/H0=;
        b=j9cszDf8SS6ptBPEuzPkU7jYO7J6Ef0XUShbZFYf5NJGugdDVXSQZAjQqiVrlPRvlA
         U1pfdEV7MCsw+l/GXEmsY3d0xJBg6T23D+1snppn5M9IcMwgPHN6dah96zffv2bnaGz5
         aYZhVlw8IiND0sM61FLeFpcuGd1rjVdsJQLsJ35LvkoLMBAvgDMkdSYVJjRKzjmcP8O5
         ewebRTscw9Ukx5b81XOHHRlBAS+ZHwnzJNPdfHY9LPOyk/6f6MHIjRzq1AsTWGxbpGeo
         S+YlceRZMdDUgjpIhNVJon4RBc2NvlJOsYZgzKgC9W91EPzxV7/cK7SN+akyhTRLbX+P
         rHzw==
X-Forwarded-Encrypted: i=1; AFNElJ/3VwOqAFwx+WrJKlfFbXvhqa6YfGxKkFX5gpHV4ZGWUupFn5LOCcYp1+Z8ola5TxFK2olOgDJVJ3UuJAsz@lists.linux.dev
X-Gm-Message-State: AOJu0YwZ9bQ3fIX3PFg+B16kQgjDoW8kHB7Mbz76iVRRBye57XSL3BPH
	YwFy15XHogAqvwbwm29pqk1Z0IMnw8l6sTV8YTo9N0QTRs0miZG78IYX
X-Gm-Gg: Acq92OHv7tWkvat3/npd7FgQjxvbhK+hlDnY9PKhRAwCqZkjt7DJkAegXb+MyfaQ8IO
	1tSw2e5CFvQQJuLHtni6LwptRaSKRKkxzrC4fBWPmHh7wRGavoL1iX8HuMcEg2uHRXVYh703iwr
	7Z/p6tBZlv1cNS3OmVuf8f6t7TZstyKa4QJu4j7T59VwijSv/PeI0Zd4jeLnCLQJdaG35INAaZx
	awbAEOdnhtW9LmCA8FmluuCSZLUGP2apNlyhp49Fia5T5cCW5Fz5FhbTjIiHG4TIUVz9G1xPyvb
	Ziab4YW2GsuCRtHM3+twKVCb50BZvuskb/yLZsW9aSUodGJ8u03bwgGUytdVKDsPcohQce1nTVD
	F1gU0vEOL3XtOb04jLUhR6OygwUE3j/Gu7UKm7SNyQCuopeHXq+5hM3X26m2W/m36jsvcyutLNo
	kgrGXXxFeCXCoRgDmIaQucXFGx7t/SvSbWxfIjmsTCJU9oHrO5M0KgkO85aO3bPWwM6rit1V7cx
	zw=
X-Received: by 2002:a05:651c:1142:b0:391:c48:d30a with SMTP id 38308e7fff4ca-3944eaa0be0mr13018081fa.24.1778691857098;
        Wed, 13 May 2026 10:04:17 -0700 (PDT)
Received: from localhost.localdomain (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f61078cesm45487401fa.28.2026.05.13.10.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 10:04:16 -0700 (PDT)
From: IgorpetinDev <igorpetindev@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: sakari.ailus@linux.intel.com,
	andy@kernel.org,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	IgorpetinDev <igorpetindev@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: fix trailing statements in input_system.c
Date: Wed, 13 May 2026 20:04:13 +0300
Message-ID: <20260513170413.58469-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: IgorpetinDev <igorpetindev@gmail.com>
---
 .../hive_isp_css_common/host/input_system.c    | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
index 9f1199c47..86c9d7a48 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/input_system.c
@@ -423,7 +423,8 @@ static input_system_err_t input_system_configure_channel(
 			return INPUT_SYSTEM_ERR_PARAMETER_NOT_SUPPORTED;
 		}
 
-		if (error != INPUT_SYSTEM_ERR_NO_ERROR) return error;
+		if (error != INPUT_SYSTEM_ERR_NO_ERROR)
+			return error;
 		// Input switch channel configurations must be combined in united config.
 		config.input_switch_cfg.hsync_data_reg[channel.source_cfg.csi_cfg.csi_port * 2]
 		    =
@@ -1094,13 +1095,15 @@ static input_system_err_t input_system_configure_channel_sensor(
 
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
@@ -1109,7 +1112,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_MIPI_PORT0 + port;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_CSI_BACKEND;
 
 		// Shared resource, so it should be blocked.
@@ -1124,7 +1128,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
@@ -1139,7 +1144,8 @@ static input_system_err_t input_system_configure_channel_sensor(
 		mux = INPUT_SYSTEM_ACQUISITION_UNIT;
 		status = input_system_multiplexer_cfg(&config.multiplexer, mux,
 						      &config.multiplexer_flags);
-		if (status != INPUT_SYSTEM_ERR_NO_ERROR) return status;
+		if (status != INPUT_SYSTEM_ERR_NO_ERROR)
+			return status;
 		config.multicast[port] = INPUT_SYSTEM_INPUT_BUFFER;
 
 		// Shared resource, so it should be blocked.
-- 
2.43.0

