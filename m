Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDE41D530
	for <linux-staging@lists.linux.dev>; Fri,  5 Apr 2024 16:58:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712336286; cv=none; b=HQpqIMPrlmWF5sdaGgZHhAX+n3TTOOAXZnwZQAiGrw2TfRNFHV6vAyufb4mSdJLKlLUrOkGj85yr/6C/GU2yo6Q0m5uRV4I4K/nr/Lbzx3+P4GoWWNNz61Rt0++rzF7LzhQGgNLUnMdYx4k8W4LBIq+R2NuBYtKj2vwfhwvB63A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712336286; c=relaxed/simple;
	bh=5AW1eKgNf7MUu4dM7zRPWY+xw2bFTvlrZtGPjFMFryk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wq/QIOCKU5fr/+KMW3UTFCzZwjEcUfTdRIRsRUY32Sa8fzWvmGNpqGqrT9hbRCxcPESpWUXiTaET91LRLHKl3eQC6ySybEJ3a5TUNQ7HGrxaUuIVNR8eiQGkcjawHyBNkklDW5lbsuylie2ZpSeeUuNl3geMXoi7JgPGl1b9nSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ajkQld27; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ajkQld27"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6ecc9f0bdaaso1867589b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 05 Apr 2024 09:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712336284; x=1712941084; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VxOrpUcgWV1BIbN70ZBNYzAG96ZmcBy16Bx9JpTxO+Y=;
        b=ajkQld279Pzh8Zl3zyWla5CwCRT0J2vtp+fjKdZXDdPPz+jJSr8xEILnBS4GZOoym7
         uijAfrnhzkJTsUPKo4S2d5IYMEN1IN8n3BeNwgSWWrRR3WR1s7IVq7QYDHIGDyHN4fgO
         yzYPjhCArUFXswh4hImaWW8fUcxfcrXsxtW5xmotRTVKi0RAmoChFkQ85fTXGcimR0lh
         W4MfCQh5XCjLF7h72i4HKaJnKeWO3Yekebno92v+dumFuySN+gnrs1XlEewPAiwB5MBX
         CeFKzqyoc244hTxAwOgvkpKWrSCC8J/dCPUxcoE2nd/tqKXrpti+yJEjlrR+W1vnp+TT
         tDMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712336284; x=1712941084;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VxOrpUcgWV1BIbN70ZBNYzAG96ZmcBy16Bx9JpTxO+Y=;
        b=ECqEjjTFyivPox9jkkuTCUnRMkU7Eb6wdHPlV0A5GrTR9gzdYYkBtxNW8Hs+D3nAXh
         56cMiG4/oDHvpNghKzQ5jGx92vA2x/e9DPv1YJ+S8D92TdIoKswhjgA044nigWDZK/ef
         m3QBt1bQtyScjgMqtQ4tqNuf8oz5X7QDmZ1snxgfbbTBBjHLI3hF7vcNTPS4t75Qzyig
         NEUtEYmGoJ52AsH4ANM1XgTQ7oxBlbCC40r133hZ08n9NfwJ/P5MZ1q+HvgKhGplArSw
         pGn7jAQGVI2zAVimkxL+m4O/95p4oPoemTp7tWCOlv0vPhKeGQs2Z0pV96e4M9Eq441d
         pNmw==
X-Forwarded-Encrypted: i=1; AJvYcCXuFJ0IfTkBr86p86SIHHG9x5hKEG570UJgz1+lLHXEKgp4eoKw7JXdWWT0YEkWSokQxvU+SraUM+F2PAoWfXKvTtCg4DCcxYGIYPvNLQ==
X-Gm-Message-State: AOJu0YzWAPtFTuWdDAX+/FKHwkgOXaAYlkGemNcPooA6TSp0pGZbHZf4
	/fPnjAJXSWcm/9+jpYb9zecF6xPInYysxjiVufX7ph1kr+dX7eY3
X-Google-Smtp-Source: AGHT+IF8+QcgSzXuJgKfFeVtRFmbVoLvx0pIjuAHQZQ5xpIO1ad1rxcl4fMvBNa0DNG870OGXhAphg==
X-Received: by 2002:a05:6a00:6508:b0:6ec:d950:fd59 with SMTP id hc8-20020a056a00650800b006ecd950fd59mr1796570pfb.29.1712336283914;
        Fri, 05 Apr 2024 09:58:03 -0700 (PDT)
Received: from localhost.localdomain ([168.138.41.106])
        by smtp.gmail.com with ESMTPSA id c17-20020aa78c11000000b006ed0199bd57sm1447393pfd.177.2024.04.05.09.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 09:58:03 -0700 (PDT)
From: purofle <purofle@gmail.com>
To: linux-fbdev@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
	linux-staging@lists.linux.dev,
	gregkh@linuxfoundation.org,
	purofle <purofle@gmail.com>
Subject: [PATCH] staging: fbtft: fb_st7789v: support setting offset
Date: Sat,  6 Apr 2024 00:57:47 +0800
Message-ID: <20240405165747.93377-1-purofle@gmail.com>
X-Mailer: git-send-email 2.44.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some screen sizes using st7789v chips are different from 240x320,
and offsets need to be set to display all images properly.

Signed-off-by: purofle <purofle@gmail.com>
---
 drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a15414..d47ab4262 100644
--- a/drivers/staging/fbtft/fb_st7789v.c
+++ b/drivers/staging/fbtft/fb_st7789v.c
@@ -30,6 +30,12 @@
 
 #define HSD20_IPS 1
 
+#define WIDTH 240
+#define HEIGHT 320
+
+#define LEFT_OFFSET 0
+#define TOP_OFFSET 0
+
 /**
  * enum st7789v_command - ST7789V display controller commands
  *
@@ -349,6 +355,21 @@ static int set_gamma(struct fbtft_par *par, u32 *curves)
 	return 0;
 }
 
+static void set_addr_win(struct fbtft_par *par, int xs, int ys, int xe, int ye)
+{
+	unsigned int x = xs + TOP_OFFSET, y = xe + TOP_OFFSET;
+
+	write_reg(par, MIPI_DCS_SET_COLUMN_ADDRESS, (x >> 8) & 0xFF, xs & 0xFF,
+		  (y >> 8) & 0xFF, xe & 0xFF);
+
+	x = ys + LEFT_OFFSET, y = ye + LEFT_OFFSET;
+
+	write_reg(par, MIPI_DCS_SET_PAGE_ADDRESS, (x >> 8) & 0xFF, ys & 0xFF,
+		  (y >> 8) & 0xFF, ye & 0xFF);
+
+	write_reg(par, MIPI_DCS_WRITE_MEMORY_START);
+}
+
 /**
  * blank() - blank the display
  *
@@ -379,6 +400,7 @@ static struct fbtft_display display = {
 		.set_var = set_var,
 		.set_gamma = set_gamma,
 		.blank = blank,
+		.set_addr_win = set_addr_win,
 	},
 };
 
-- 
2.44.0

