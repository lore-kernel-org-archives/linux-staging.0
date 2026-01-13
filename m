Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F626352F89
	for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 22:17:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768342654; cv=none; b=jUzCuR2RS1BTu3IB1KtuXO9mtSnHWywPHyly0NU5JllZaWCPe6MxikjBfieJr4nuNAqpE4g8GCfK+FZ8ahFUOosB4vRxQojlfSmBlbj2e36HhxYUleOv1VhM7+S0a7D6G7kUMlkgVrlV56Y+jhGe2LaJ+UjtADFQDSNA1pS2Ylo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768342654; c=relaxed/simple;
	bh=8wxY4lFLDlRaCZNNwjFawTBuuObSZmvd5ia+miLvcqA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hJNnsgbTrS0XJK8clfK7u9163vKqPsjHiC5PBnlzv+tBjSXFMzVyyZzb9m75j04ogFMpO6TjybJEvGWFytBtKRa2PcVSjTwxDQcu8UmZMGGqJBXSH1hOwYv7DpH3bIAdTE2zCQ03+W+YFZkaWMSO5L3Y1Op54//OoZHfn9sebSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XmXCJ+cm; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XmXCJ+cm"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-432d256c2a9so4357648f8f.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Jan 2026 14:17:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768342651; x=1768947451; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=adkzvRDq3qVFPYxqcikdCLTY3yBHVJYfnHghvFsSO8k=;
        b=XmXCJ+cmXFdg37RIGj5z26+UwsesNHwYE8+1zt1bOi5ydvaEKMaL5Le2ITob3YQDqN
         GjIWcxihM2m90uDkM5T2WPYfmSvxGAyZyalks3MEEr2O//xGrp+YTGJe0bZleD8ogIvP
         mY19cbzuRGywNLAv92tlEMGVv9NUZ77/ckSvEcoVTZspOdNEckpnCukXGK1JIthQn4Pe
         mTx6w9mK5EL/yk4uKhTLGA0y6Qer1Qw2IoxCi4PtVZM8+GpQVTvrFgg/3TGpBocXeQX7
         E9woQ4FO7mJfIML0972hr9zAPuLgQVToW/MtGlxE50bw7TIOzNxP4yeyBhNJDyTZTTkU
         kpcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768342651; x=1768947451;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=adkzvRDq3qVFPYxqcikdCLTY3yBHVJYfnHghvFsSO8k=;
        b=O/V+jN4SC9g2MTnap4jO0kCSSUD+UtIlKmBNxWxeTE4rOQpTDIe6uJIhBTALBdAouk
         T/6BBR36zC/Fr+BpQ1DdGs9QB3+5iXnwOkcc5grSwKQq9CtzY6woLgEAEt2Y4WicllX0
         +GBuWMcX5zizGifmRhIH+2amagWvwhUNF0uqUIOVbuq9KouVy8ZyT6iw3/qIaVs+3tyj
         7XNP7CudHUOpKy7dVHKZlghBES9rw72GVZGH8MAq6nL1DQXEXfJaEgwjOfl+lpjYtq3t
         G2dM/u6pQJrhk1lP9qVT/3zUZ8OBgXTLm6jC4Okkwoeiw4dxdcxqR0w+OQ702vvhUW5j
         2New==
X-Forwarded-Encrypted: i=1; AJvYcCUciT9D4ERYmU3+GygU+B67EbZTvVWddlyJ3/udGsqckg1isjaYblLpdU3d6DrIXQH+S8D5t9XKs3Ekr2xp@lists.linux.dev
X-Gm-Message-State: AOJu0YwzpGeTcO353dM3jZPJ6k7jP++7gnpdOeGdHTLQm5YJE72gmRox
	YiEugEiMhk2t7RMyEgTvZXnFVrmmDVSnxUfqf4t/Qhk/HrItNR2zhZLs
X-Gm-Gg: AY/fxX7yCmrpuaZijM3nvPBXzjGDp9E+9t/mJtmdD7Cs61p0gHPPMEJ8lN+D9tvQ+CR
	rILEspBWLbSIDcsXCKLdiJcMa3xhRT3JgsK4uq3Qb8a+nyqKNS+vjcCvwpZTz1Rp8i0JcL40yDg
	8nu/aSwpZCKNr8n8JU5cDkg5LN154mbr4P2yn8X9Zs0i2Y7TY2GislsxZzSSSBhLdE0e1IkJGs+
	11Jsp+6dH02H0sBS7bc5odkJ7GzJv5Ewf57K2IN31odiuJrXR3EqdpKsgMbIuGfQ4OKncGvXXfZ
	sW179PGyiwqqSExEPzyv5DYthcD2rEujwI5+LLQMW1JNgHRwHBIBHzT7fFZyufvEaXKYLcc9BfY
	1Y/OIIf2kAzBsuZ8KILbnHEJpx5xTzpTb3EnfjX1E07ZXh2cJqwITrl+WP1fAtZUH0RHmO8CAe/
	U4TLDuV7BPLImwqsB5Td3R9j7+A9Bt5ObBvwkW/3TOZePBrg==
X-Received: by 2002:a05:6000:3101:b0:431:abb:942f with SMTP id ffacd0b85a97d-4342c557b93mr412443f8f.54.1768342651409;
        Tue, 13 Jan 2026 14:17:31 -0800 (PST)
Received: from ubuntu.localdomain ([154.161.44.196])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-432bd5ee893sm46148930f8f.37.2026.01.13.14.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 14:17:30 -0800 (PST)
From: Gideon Adjei <gideonadjei.dev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Jianglei Nie <niejianglei2021@163.com>,
	Matthew Wilcox <willy@infradead.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gideon Adjei <gideonadjei.dev@gmail.com>
Subject: [PATCH v3] staging: fbtft: Change udelay() to fsleep()
Date: Tue, 13 Jan 2026 14:17:22 -0800
Message-Id: <20260113221722.5157-1-gideonadjei.dev@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace udelay() calls >= 100us with fsleep() to avoid busy-waiting.

The delays are used in init_display() callbacks. These callbacks are
invoked by fbtft_probe_common() during the driver's probe path. The
probe path runs in process context which already uses sleeping APIs.
This makes fsleep() safe to use in these situations.

Signed-off-by: Gideon Adjei <gideonadjei.dev@gmail.com>
---
 drivers/staging/fbtft/fb_tinylcd.c   | 2 +-
 drivers/staging/fbtft/fb_upd161704.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_tinylcd.c b/drivers/staging/fbtft/fb_tinylcd.c
index 9469248f2c50..3fb15df31592 100644
--- a/drivers/staging/fbtft/fb_tinylcd.c
+++ b/drivers/staging/fbtft/fb_tinylcd.c
@@ -41,7 +41,7 @@ static int init_display(struct fbtft_par *par)
 		       0x00, 0x35, 0x33, 0x00, 0x00, 0x00);
 	write_reg(par, MIPI_DCS_SET_PIXEL_FORMAT, 0x55);
 	write_reg(par, MIPI_DCS_EXIT_SLEEP_MODE);
-	udelay(250);
+	fsleep(250);
 	write_reg(par, MIPI_DCS_SET_DISPLAY_ON);
 
 	return 0;
diff --git a/drivers/staging/fbtft/fb_upd161704.c b/drivers/staging/fbtft/fb_upd161704.c
index c680160d6380..7fe2b556e17c 100644
--- a/drivers/staging/fbtft/fb_upd161704.c
+++ b/drivers/staging/fbtft/fb_upd161704.c
@@ -32,7 +32,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* oscillator start */
 	write_reg(par, 0x003A, 0x0001);	/*Oscillator 0: stop, 1: operation */
-	udelay(100);
+	fsleep(100);
 
 	/* y-setting */
 	write_reg(par, 0x0024, 0x007B);	/* amplitude setting */
@@ -60,7 +60,7 @@ static int init_display(struct fbtft_par *par)
 
 	/* Power supply setting */
 	write_reg(par, 0x0019, 0x0000);	/* DC/DC output setting */
-	udelay(200);
+	fsleep(200);
 	write_reg(par, 0x001A, 0x1000);	/* DC/DC frequency setting */
 	write_reg(par, 0x001B, 0x0023);	/* DC/DC rising setting */
 	write_reg(par, 0x001C, 0x0C01);	/* Regulator voltage setting */
-- 
2.34.1

