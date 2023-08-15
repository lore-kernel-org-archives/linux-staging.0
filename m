Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E37417F3
	for <linux-staging@lists.linux.dev>; Tue, 15 Aug 2023 04:38:46 +0000 (UTC)
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-63fbfc0b817so33814396d6.1
        for <linux-staging@lists.linux.dev>; Mon, 14 Aug 2023 21:38:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692074325; x=1692679125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vUSlJ1K+YltX3fu0fwuh0HX4VMb0WiCiIqUudwqAsHI=;
        b=Av+4LsG4ZZU6TgMGKe/aUJfcGcY4JNFgEIKy7F0/L2u2R6253lSrAQk0upWXGiv0AL
         Lwfp89+pzCbRyOG6ejURrWN3s5LHgEms85TFwIoq/eNDcna3X5sVOa+ydo/5MC/d5hud
         6Z60XaMHzBPMjJ6mOUE02vqXuN9Dh8hAeFnlNfiP8IUT/z1b+50GCZ/JYV6kKAF0Mrl9
         EnXqnUm9ZrcU9fWAv2iSeD0KnAktVdz8ApIHBO2V7ZV6MccfEp8UJBp3JLarLeusXuQ7
         LzZiVmMfLoGTrIGG94mJVj4LYOHkolLqGk2BPA+WhDyhsR5MQZjBHU7fLAWWRxyj6hTg
         rH+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692074325; x=1692679125;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vUSlJ1K+YltX3fu0fwuh0HX4VMb0WiCiIqUudwqAsHI=;
        b=IzKmVV7ZfNrJOaYUYJJ/8/PdXDSFYuZozYZBzJ25ePsVQf8EJDJZfTSAhfhlxMXZ9J
         R3Ob7DWQY+nz06qYMTZYUBdR37NkpSSuleC818i4nwpa8ntUTbwV464yVSF+ere/cBsY
         32fBAgOcOQOCXUPxIS4yQJXi6oZWwZ8SZ+vgJT/vm2TaVBDZf7aGiG9V2+RozYrtO0lk
         cgye8ggvtcItKTcOzrgRlhhO4kEh1n5tFTJ5DZnPBV81TwWeRT/U2MtzbLyjNHHALcZi
         HfNo+JP8GFRChGrenZIcsBtodXobxjxR1hdXiDZIGZ57R8kDDm7+zmtv6KgRrrohxu4J
         12zg==
X-Gm-Message-State: AOJu0Yw39tXC0jez5ek4Mtz0KjA5Xb7DsDwqtmJoowD/M52oK9GP/EnY
	8A4d6WXC9ajqyEAn3yQpq/E=
X-Google-Smtp-Source: AGHT+IHlRKYII7XNiHTvKhRFpl+U39brmO0LJzBgiLbx8fE8kLkSj0Lwrb5EjbPw5hmZsFns09Ducw==
X-Received: by 2002:a0c:df8a:0:b0:647:2f8f:8c29 with SMTP id w10-20020a0cdf8a000000b006472f8f8c29mr2054378qvl.48.1692074325225;
        Mon, 14 Aug 2023 21:38:45 -0700 (PDT)
Received: from localhost.localdomain ([174.95.13.129])
        by smtp.gmail.com with ESMTPSA id a7-20020a0cb347000000b00630c0ed6339sm3880822qvf.64.2023.08.14.21.38.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Aug 2023 21:38:44 -0700 (PDT)
From: Abdel Alkuor <alkuor@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	Abdel Alkuor <alkuor@gmail.com>
Subject: [PATCH] staging: sm750fb: fix sii164InitChip function name
Date: Tue, 15 Aug 2023 00:37:59 -0400
Message-Id: <20230815043759.404423-1-alkuor@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux Kernel coding style. Found by checkpatch.

Signed-off-by: Abdel Alkuor <alkuor@gmail.com>
---
 drivers/staging/sm750fb/ddk750_dvi.c    | 2 +-
 drivers/staging/sm750fb/ddk750_sii164.c | 4 ++--
 drivers/staging/sm750fb/ddk750_sii164.h | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index e0c7ff3352bf..8b81e8642f9e 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -14,7 +14,7 @@
 static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 #ifdef DVI_CTRL_SII164
 	{
-		.init = sii164InitChip,
+		.init = sii164_init_chip,
 		.get_vendor_id = sii164_get_vendor_id,
 		.get_device_id = sii164GetDeviceID,
 #ifdef SII164_FULL_FUNCTIONS
diff --git a/drivers/staging/sm750fb/ddk750_sii164.c b/drivers/staging/sm750fb/ddk750_sii164.c
index 3da1796cd7aa..d162e1a16584 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.c
+++ b/drivers/staging/sm750fb/ddk750_sii164.c
@@ -72,7 +72,7 @@ unsigned short sii164GetDeviceID(void)
  */
 
 /*
- *  sii164InitChip
+ *  sii164_init_chip
  *      This function initialize and detect the DVI controller chip.
  *
  *  Input:
@@ -118,7 +118,7 @@ unsigned short sii164GetDeviceID(void)
  *      0   - Success
  *     -1   - Fail.
  */
-long sii164InitChip(unsigned char edge_select,
+long sii164_init_chip(unsigned char edge_select,
 		    unsigned char bus_select,
 		    unsigned char dual_edge_clk_select,
 		    unsigned char hsync_enable,
diff --git a/drivers/staging/sm750fb/ddk750_sii164.h b/drivers/staging/sm750fb/ddk750_sii164.h
index ca330f6a43e2..13420bcc282c 100644
--- a/drivers/staging/sm750fb/ddk750_sii164.h
+++ b/drivers/staging/sm750fb/ddk750_sii164.h
@@ -16,7 +16,7 @@ enum sii164_hot_plug_mode {
 };
 
 /* Silicon Image SiI164 chip prototype */
-long sii164InitChip(unsigned char edgeSelect,
+long sii164_init_chip(unsigned char edgeSelect,
 		    unsigned char busSelect,
 		    unsigned char dualEdgeClkSelect,
 		    unsigned char hsyncEnable,
-- 
2.34.1

