Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC8B31A813
	for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 11:05:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783767923; cv=none; b=YLjsuH2CuhY7nF+y0ZB6+dNvYKBW59e2Raw4NPt3B4KkAcKC2PLtTIAKpnzNob+Ul7rYpYovfnsc/ETdc3t0e5ZpLiB625/BX2RIX5EDXaZO35f+RUQO7YXoaWGYOXlxe12EUty7ojCMAbrOl+wREu1fXOYOcpBvMviwnt+lOGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783767923; c=relaxed/simple;
	bh=PvNrLEy0esAgjkx98SqINTHZQ5HZEEkzMrRFEp1RfB4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ks/iFNtDaS5P/E9VYQauKtayJhY/1UpV7gi/0ZlOvKWYwVT3KfxsOGHPZE7MtianKvVfGKkrUEodTqBQv0yrByVXJoBwEq/sVQrzYYcaF4cip6ye4XKS1PbKZ9HBgfw9aSzxNuSPUNGGvlLKl6Ewkv/na54p3vQvbuhCzIDDJqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DXpSRAO6; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DXpSRAO6"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeae771c49so1941033e87.3
        for <linux-staging@lists.linux.dev>; Sat, 11 Jul 2026 04:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783767921; x=1784372721; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bA6h6uzBB8Oq/gwDDfVQp4kei7vWwer0wCBkghOzAFs=;
        b=DXpSRAO6ofgkjge5Nl4OUq5lfwsaUKgBQK2XwavOCox5xEOlB5Pzb0dc/OaVv8nprj
         ph98Q5QBkyAPDU7jilyPJBDdHfH0w9IoqQeRVCHkmRUUEyf5ASLVlTiQ97EBzlxnD2cG
         N6EOzi+8aMqqSoOq8/5nUVhZAJp/H2b5rVwzqb31J9GG2QPEt+kMUZ4INOl0AkQtjfLM
         5HVxKx0N7FnCPwuFcTBeqFbrX0iOs8ACLCseNV6vpUPQHCI80NfYsI4tR9jeR+pJ7PQM
         HGPt6suvfQn2SSBhrZD2XvnC8wx8KSBqQuk590I6ef/C6gJminyUloiRs5cO58pVs75B
         3Icg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783767921; x=1784372721;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bA6h6uzBB8Oq/gwDDfVQp4kei7vWwer0wCBkghOzAFs=;
        b=aLVJejUo8+otSeW5Av+V6xiRQJoiump2E0QMKlyTuxHFFAf2LiLeRppXzn9GMeHGg9
         bRR0L6F4HAo9gt/YyIhj6Rv9XamB7CVC7/o2/YTQ4zrUYPXB1rlRUqylcvgVIpqKnZqY
         zjAKn3GgOfgf0sNNtHA0SoeWtwWqgpzomSlfstmfiqeC6G4CrzYgOr8a0Qb1TJbJddEr
         qWbt0a+Cpp+M8qJgXb91sbI1XWTQ6sjm29bAsrfMp7PtPV6mRRS9htqpcvyRqzAi3TAu
         KsUFH71Cqq4l3SCng0L4re7SaoVPnHXRdMr3E6BfLAEBGSvyLUu2Ht/IMeT2gBuN2JE0
         YNyA==
X-Forwarded-Encrypted: i=1; AHgh+RoThIBH2AWUgc6di3A7uMCWQQq/wbDXY1iOOGlKMccDgDY5OG//F/KUpfBrLtIN5+vcQJ5g25J2JUHWAeGR@lists.linux.dev
X-Gm-Message-State: AOJu0YxzwaJsAguVmhb2CksWzTBhtSeke1G9qZYTo1tK+pLfSOhRCz0B
	7kGrYZAAimhwPfNRKd+Lic3u1rNaSrAiAyDOTMhPWstVrvxWJlTX1Q2a
X-Gm-Gg: AfdE7cmYYFdiBvSaLYQnhucqsXUeGWuLJuJCmoxKPrZvClN+XqVwHJD/ICphFsmrdMB
	Yl/ZWZL2LLmlHrhQCtYsXMCDN8/GC95n3PuHQKn+dZlfukMpKzd18LAYLfzLS8n59qLM9ii3Tf3
	c64QQ32UNFwN3IrthngHkKNAJQq8DUH4uHFZu+Lh9FtMcUwyAFi0fVhFs3FZzSTv18kfE+2poqe
	ECY051X97y4FHQVxBaUUq1OrPdCWm98y68tcAX/cB4Vc6uQKIm5Z0vAZvUehOKD6wRC50L73AkN
	pntsaiuEhiDZtituZaYbBSGncP0HU63KoH1uELi1VOUtb6W6DtjfvQuQ3poCQl80iB+t9oixUjQ
	qeCHHiJ0pzWDZ44L0vdXZ2uVIAJguntjUOIYjpS8xoZyhp8xODjsD2al5Hl4SlKxdUvMvAeXQj9
	YfjdzAdrs=
X-Received: by 2002:a05:6512:3582:b0:5b0:1e16:f3a2 with SMTP id 2adb3069b0e04-5b0236c7c84mr381624e87.57.1783767920589;
        Sat, 11 Jul 2026 04:05:20 -0700 (PDT)
Received: from linux ([195.54.40.37])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm516488e87.55.2026.07.11.04.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jul 2026 04:05:19 -0700 (PDT)
From: "A. Kalimov" <erqeon@gmail.com>
To: error27@gmail.com,
	gregkh@linuxfoundation.org,
	hansg@kernel.org,
	andy@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@intel.com,
	linux-staging@lists.linux.dev,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"A. Kalimov" <erqeon@gmail.com>
Subject: [PATCH v2 2/2] staging: media: atomisp: fix function arguments indentation
Date: Sat, 11 Jul 2026 15:01:52 +0400
Message-ID: <20260711110152.66188-3-erqeon@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260711110152.66188-1-erqeon@gmail.com>
References: <20260711110152.66188-1-erqeon@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: A. Kalimov <erqeon@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_cmd.c | 17 +++++++----------
 1 file changed, 7 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_cmd.c b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
index 81d0afae8..d741f4f04 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_cmd.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_cmd.c
@@ -1883,9 +1883,8 @@ int atomisp_calculate_real_zoom_region(struct atomisp_sub_device *asd,
 /*
  * Function to check the zoom region whether is effective
  */
-static bool atomisp_check_zoom_region(
-    struct atomisp_sub_device *asd,
-    struct ia_css_dz_config *dz_config)
+static bool atomisp_check_zoom_region(struct atomisp_sub_device *asd,
+				      struct ia_css_dz_config *dz_config)
 {
 	struct atomisp_resolution  config;
 	bool flag = false;
@@ -1918,9 +1917,8 @@ static bool atomisp_check_zoom_region(
 	return flag;
 }
 
-void atomisp_apply_css_parameters(
-    struct atomisp_sub_device *asd,
-    struct atomisp_css_params *css_param)
+void atomisp_apply_css_parameters(struct atomisp_sub_device *asd,
+				  struct atomisp_css_params *css_param)
 {
 	if (css_param->update_flag.wb_config)
 		asd->params.config.wb_config = &css_param->wb_config;
@@ -3893,10 +3891,9 @@ enum mipi_port_id atomisp_port_to_mipi_port(struct atomisp_device *isp,
 	}
 }
 
-static inline int atomisp_set_sensor_mipi_to_isp(
-    struct atomisp_sub_device *asd,
-    enum atomisp_input_stream_id stream_id,
-    struct camera_mipi_info *mipi_info)
+static inline int atomisp_set_sensor_mipi_to_isp(struct atomisp_sub_device *asd,
+						 enum atomisp_input_stream_id stream_id,
+						 struct camera_mipi_info *mipi_info)
 {
 	struct v4l2_control ctrl;
 	struct atomisp_device *isp = asd->isp;
-- 
2.53.0

