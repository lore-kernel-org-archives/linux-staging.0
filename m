Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 441B315665B
	for <linux-staging@lists.linux.dev>; Tue,  9 Apr 2024 18:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712686170; cv=none; b=La09I4NG8M4gyrQIs8H8YsEwyLotgmqY2vgYfgSWkzsMylxXuNzAFEns33A6u7SRqZcwuWjtFKd8X4TExL9jtBS1endxrKahmo4QCwp2HVCQ7ioiYdgUmGTwTS/Ll/zmgtw+QY4enTn6ONsjEWE/AXZiru/V6zMAQyhdjGCXejU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712686170; c=relaxed/simple;
	bh=iVHlsCCMfWKpWuWRbfli6O0Bxz4j4Vs+tlKNL1UZ+G0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mZstQWN7izYs5l5uiiTyPbiG58J7OltFf+zy/VTsvwkBTFR3ElgtyUVVV2glBBF4MmIbIoOF4+eENdiCLf1MF1kZdaMTLil25+/CEkdEEFl1LmLN121n8q4vXLt0YvRQETzZepxkc+lvfjCdcUC8J1NzB0TA1UaHZETiebfuna0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7XWEGwe; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7XWEGwe"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6ed3cafd766so1902658b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 09 Apr 2024 11:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712686168; x=1713290968; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NVXVzzWFiRIl6q29OSH9GKi8POQIM0rOmoVWIGbW5Rw=;
        b=W7XWEGweyA80+k/l4mf8sCsTdfP0tMX/PVEDGqJzF/eI2fNmleD0NZXkcSp15VbOOx
         1wi828tZTTZNwq6wzCzwe75O+7IsXxA7jgSyO+qyAgr+myw6RvrgB7JfJ26c07qCx/z7
         QPSE9GiIbRiyXoe1j7XFL+yPNmqbQbs9+tF+qkfYgcWTcQNm1OkCKsuPkclFqxyi/YqW
         yzHkYAydGOdJRboZW3CfyUlWMCmuI2ZPiZaAthZwNWJx1gMWWqMgtdbfbHEakgy7WHQN
         yMr7sRKIOY+ib32mqZdEWuYTFs7MzC7dvfjoDC46gbmMeNTyii/Zhp4FLTbT/V8o3VOl
         9sKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712686168; x=1713290968;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NVXVzzWFiRIl6q29OSH9GKi8POQIM0rOmoVWIGbW5Rw=;
        b=ubM13AIaHPDWsf2Mkbovz/mUxakdgxFxeiUhcJqZMZoLvdqFUpo37Jg4jJikuEwKp/
         aoFtBAypKIeTZf+UmUv6gZ4rudq2YTUEOyKvfUrboHMG0trRQJyHz8Q1LGAtJDTHYDmu
         7vVnkFb2OKuBBQFsMM8HNslZRv/YmDJIYo+/OfNAeFacKoQsl3q+reWI+/WnV2UvGDgy
         ez2D+cofBCJ1z1w/Rvnmlu/ieLz8tPztkLEZNI6bHpjvkPVjxv3aVGDdNNDqNlCqGG7s
         6lyZNYuBq7W2artA2b/3gA9SMWIzMTvTvQW4E0YlaJ/CjbNUQnW6ab9fc21J1qZXg+Df
         3nlw==
X-Forwarded-Encrypted: i=1; AJvYcCU6M9katwUVEpOi+uJwsy4DxJzrQ9ocfUFo8GfwMhVces49zq3cbYyAr8OtM6utGcJk498bocK1tdghIPgGQXG8hjJzn1gA4epnkzWxUQ==
X-Gm-Message-State: AOJu0YyP3zI9lKNr2Bmh5rz0y4+3Hp7GZXEoszrQypG7rDqZdvGFgs1j
	W2BShzy/x6U6paGnpgo4UOhiODPD5iAuGe15jINmmkUIrLZme8A2
X-Google-Smtp-Source: AGHT+IFfFzJvldQjnVnnEpBO8iZdBO93LTpcMA44O3DKE0n7hsIP4ENWytzlu6xvr4g+hUv52FZokQ==
X-Received: by 2002:a05:6a21:6816:b0:1a7:6416:1465 with SMTP id wr22-20020a056a21681600b001a764161465mr734294pzb.32.1712686168384;
        Tue, 09 Apr 2024 11:09:28 -0700 (PDT)
Received: from localhost.localdomain ([172.93.220.120])
        by smtp.gmail.com with ESMTPSA id gr6-20020a056a004d0600b006ead007a49dsm8644901pfb.49.2024.04.09.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Apr 2024 11:09:28 -0700 (PDT)
From: Yuguo Pei <purofle@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	purofle@gmail.com
Subject: [PATCH v2] staging: fbtft: fb_st7789v: support setting offset
Date: Wed, 10 Apr 2024 02:09:01 +0800
Message-ID: <20240409180900.31347-2-purofle@gmail.com>
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

For those who use screens with offset, they only need to modify the values
of size and offset, and do not need to a new set_addr_win function.

Signed-off-by: Yuguo Pei <purofle@gmail.com>
---
v2: modify Signed-off-by, fix explanation of changes

 drivers/staging/fbtft/fb_st7789v.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/staging/fbtft/fb_st7789v.c b/drivers/staging/fbtft/fb_st7789v.c
index 861a154144e6..d47ab4262374 100644
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

