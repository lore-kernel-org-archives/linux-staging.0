Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3CD78F61
	for <linux-staging@lists.linux.dev>; Sat, 23 Dec 2023 06:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ni3FynlJ"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-6d855efb920so1704918a34.1
        for <linux-staging@lists.linux.dev>; Fri, 22 Dec 2023 22:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703313720; x=1703918520; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Opo0R05OB5wID6sQJu4dx2K7wLhXLYuO4epgLQz9yZE=;
        b=Ni3FynlJC7ALiN4heodDBwKpR2G51PGSHtqOV/xGO4f3cFR2lgLnmkArnVGwrNRGav
         +1d6ilt2cTGFanhohHPch2IwqiqGhTLe+heghEQTO7c7ZkCpTOKWGKw/poiOjC5O+Evo
         guLs78k05/pnwMFhrucxxQQZxskafB12fJDP0fs4HJs7acKfH0YYhIDhOAyvRdwb+lWg
         m9rte73rDdOj0XZXG/oe/0KiHI2GW4aUigQar1vCHfA7arv9PntEZIpKdrTuko7C/puy
         5tJuXFZiS5P1H3Hc3Wn7Mq1J/GGssijzT4ViUvMgphEPubDPsTzlndc6WB2/ODS4lmIs
         hO6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703313720; x=1703918520;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Opo0R05OB5wID6sQJu4dx2K7wLhXLYuO4epgLQz9yZE=;
        b=oH+5fQRc0kzXA9wyXHLmZ0UxMZFfHa9qy99R6X/p46fC5VcNAPVf8ccjBhJ2KinUHP
         nupqtx2zvk5AJq0k76p2cQIoOabAdvN9vbAgzJOwr38IbrHMZGvktwKMH6ow8UHdyu8s
         3qM0rtqPbmu32cv/qVLpIp2mhE7+yCQPjMc4lzM6jAWkGCbw8KEvIk2R23RMYdErYkmC
         e1VZKfSnuLcyFn4Q+fnneAA+6OTp+w7hFQMmQgSQgGsc5Bae7D5n2Gjhr8By8p+lhMEr
         ztyVh+L7nt9PITJvL9U1H/9moK51wSxSXVWW71FCwPken/hIIoepE3Om3EK+RSopoez5
         +gJA==
X-Gm-Message-State: AOJu0Yze7sQX7lrVFG5P6114gadYbwfyT6t0CGFk3BKTt5oPPGDDDBxo
	zyoK6hFKtq3ORL1HzWHAnvc=
X-Google-Smtp-Source: AGHT+IGbvtCMw5QMbF5aP6/UdVWZWEKE1p3xJRB03uLf1/uxV2A9/CYxiwT4/8kX/82sgTUfK53q/Q==
X-Received: by 2002:a05:6358:7e05:b0:172:fdd5:805 with SMTP id o5-20020a0563587e0500b00172fdd50805mr2924464rwm.27.1703313720528;
        Fri, 22 Dec 2023 22:42:00 -0800 (PST)
Received: from localhost.localdomain ([2400:1a00:b060:2b26:f462:e3d9:c28:4c99])
        by smtp.gmail.com with ESMTPSA id a15-20020a17090ad80f00b0028c35076de0sm423230pjv.35.2023.12.22.22.41.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Dec 2023 22:42:00 -0800 (PST)
From: Dipendra Khadka <kdipendra88@gmail.com>
To: hdegoede@redhat.com,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org,
	hpa@redhat.com
Cc: Dipendra Khadka <kdipendra88@gmail.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH] staging: media/atomisp/pci: Fix spelling mistakes in sh_css_mipi.c
Date: Sat, 23 Dec 2023 12:26:52 +0545
Message-Id: <20231223064152.79712-1-kdipendra88@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

codespell reported following spelling mistake
in sh_css_mipi.c as below:

'''
./sh_css_mipi.c:177: separatelly ==> separately
./sh_css_mipi.c:540: ofset ==> offset, of set
'''
This patch fixes these spelling mistakes by changing
"separatelly" to "separately" and "ofset" to "offset".

Signed-off-by: Dipendra Khadka <kdipendra88@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index b7c1e164ee24..6e11fd771938 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -174,7 +174,7 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 	mem_words = ((embedded_data_size_words + 7) >> 3) +
 	mem_words_for_first_line +
 	(((height + 1) >> 1) - 1) * mem_words_per_odd_line +
-	/* ceil (height/2) - 1 (first line is calculated separatelly) */
+	/* ceil (height/2) - 1 (first line is calculated separately) */
 	(height      >> 1) * mem_words_per_even_line + /* floor(height/2) */
 	mem_words_for_EOF;
 
@@ -537,7 +537,7 @@ send_mipi_frames(struct ia_css_pipe *pipe)
 
 	/* Hand-over the SP-internal mipi buffers */
 	for (i = 0; i < my_css.num_mipi_frames[port]; i++) {
-		/* Need to include the ofset for port. */
+		/* Need to include the offset for port. */
 		sh_css_update_host2sp_mipi_frame(port * NUM_MIPI_FRAMES_PER_STREAM + i,
 						 my_css.mipi_frames[port][i]);
 		sh_css_update_host2sp_mipi_metadata(port * NUM_MIPI_FRAMES_PER_STREAM + i,
-- 
2.39.2 (Apple Git-143)

