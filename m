Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803843876B5
	for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 10:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778755123; cv=none; b=R7dPQqruQ9uqaSLrhwTloGRLipVrMmVtJXgcsJIdALSPclqcpEdctw1BenfKhZa5AvCYprCZMVSeBlM+EOqLNu2gw7ZqfmJWTbXUI3eNJ4vL6f/A1MWrWEwEsPsSen+35b/1U0NrovN+93o50gkGYuvhGscXPf8hEpYWyeV6VCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778755123; c=relaxed/simple;
	bh=7cf1bTUHeTG8hP3P7+pktX/y94hBOhorO+KD/LMZc2s=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NqCU8jyREuX+Pac+NBA8GDTIHM25lI/8oQ7wIHGQCaXUbAcPso7Zc38WV9sR62aW5xM8DqEx0UL7qlVKSab7IBO/ixwbxNjATdGySuo/RzcfEyysCAWCRvOJ4yySBPCz/yrVLDBpNfxcgkgIVQaqbdIwvLeldIStfB+BPZiK0UY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e0btUrh7; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e0btUrh7"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a8891febd2so9397792e87.1
        for <linux-staging@lists.linux.dev>; Thu, 14 May 2026 03:38:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778755119; x=1779359919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ru+7Hoaiuh+KhENOJt2+sFlK6jzOqyzKGqLurDAOQng=;
        b=e0btUrh7i8Dv0XLhzbTEqWItRvDMmucuIL8tqumWq3Yt6QMZkcNm+AJwkviVkNK+sN
         V3YKDP6sv18GAZu7GwPdwQc/o2GEGaxsW7PDa0AuqntMRoNV2bzOTbs2KR5I4xjgo7pY
         7o9dqNseVOzO3dLinP2yUJpfVuDFSQ2AO9F0yiV96jVfTFGGW4L/scwtRteYLu/bcBGC
         dXatzZOknZGQ1CZ8Gn4NMmqQXPHJkGQ4RKxL78SzlDozeq8rY54O3WtIKm19rDiHQ/N1
         beo1UQqoouy0zloQM27D+lUNhqgeEvAQP9wDaZ+PCOipsFVWsdAg9tUp8L2dyaHm18Pc
         NE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778755119; x=1779359919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ru+7Hoaiuh+KhENOJt2+sFlK6jzOqyzKGqLurDAOQng=;
        b=aFdhwajNmvCyqr8LGbvpSSpJj6OBuIBAx38KSZp924si2OS9JnWfs6P7vPSL6jsu4u
         U/5SHeogyYODhfoDVAUbo9/P0RleWiZC5fUUqthtV2hGUdxj9ns9a3dZy6WmcUgFuqwt
         N6EFMF55RnvJ1W+ARC1mQomnAVDvhvVHni453FFZ1ayPLVGHuNXx7wbreE9U9IzUSWXz
         AcJfmFtIvk+kiyPaIQR87Al/5DBrCB8GYYui/Y2YSYDeXWlgbulGcvjbv8AuSocOusMu
         99Qr8qteXLmfzQz9XEws0lm1VZFIPeouUzYTm66zhI1GhM2mqvvBmYJrGACyAhkV9EhL
         F7Jw==
X-Forwarded-Encrypted: i=1; AFNElJ+BXsPQeb33UFzMXFO3G52gxV+zkq4R2fxAggcdB5KasyE4Rnd2katuHbbxLqbLyjGnkVsUUcoaJbHcOvpS@lists.linux.dev
X-Gm-Message-State: AOJu0YyN3g8hWJ8lv7+pTkpdeJr3MYA4JI2JSRXY9l3qMtvK5Za+pXn1
	XGCaUWHT6TpnR1dMbiyXR6dDhzMFWNuXrXcSOps7vVeSP8ADmAmU8fJ3
X-Gm-Gg: Acq92OHuMmqCvkw386Xat5gZlz4SAXUjVOoaBFXLNYOnIpi8GMVUJR+xJFNd2xpl/ps
	YktBgP83cEMnJO7gPgjWD3C2iMOONx4c7qu1nZ8Rn+70o4306MCvsMuXWz/7Fh7fWQWZ3fbV4Jj
	q2lTTkviYKfbJvpxonp/RbuSkKf3O8W+ydNMkLQSOZTT8oIEpQGw/gFMRsrPf1ajRM5ADMT4J1B
	toXXlYH+ZhvbURs6SZT9akobEs28DUemJNNDGB9/deb9CsVr0jFdOF69wYJPMwVCaxs3TD5o36Q
	Ef7ngCZ4sc5eGyDmVcFwlHYwisplMKcn0LCGrhRB8mxQrt8a29dIylPB75BGRXtvFF/RBepwAoK
	iWMwNWxARFJrZXlkpOLrg5aGSizAnaksRrqEyprZO4j8gu1rTcRTdnGxlNKBrPkuDdfhX9nCO6J
	2BqPE1zu43NmSIb9LsETU0kmCzU87RU0fowJAyrSrUznZusTFPlpoh7bUNjHqf28GYBFucuREPh
	belEj706Oryqw==
X-Received: by 2002:a05:6512:1155:b0:5a8:e5b2:c81f with SMTP id 2adb3069b0e04-5a8ef989b2cmr2500743e87.27.1778755119178;
        Thu, 14 May 2026 03:38:39 -0700 (PDT)
Received: from g-virtual-machine.lan (95-25-161-220.broadband.corbina.ru. [95.25.161.220])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc66bsm392369e87.53.2026.05.14.03.38.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 May 2026 03:38:38 -0700 (PDT)
From: Igor Pytko <igorpetindev@gmail.com>
To: andy@kernel.org,
	hansg@kernel.org,
	mchehab@kernel.org
Cc: sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Igor Pytko <igorpetindev@gmail.com>
Subject: [PATCH v3] staging: media: atomisp: fix trailing statements in input_system.c
Date: Thu, 14 May 2026 13:38:35 +0300
Message-ID: <20260514103835.13732-1-igorpetindev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move return statements to a new line to improve code readability
and comply with the Linux kernel coding style.

This patch also fixes several checkpatch.pl errors regarding
trailing statements throughout the file.

Signed-off-by: Igor Pytko <igorpetindev@gmail.com>
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

