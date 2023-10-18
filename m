Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA16A23;
	Wed, 18 Oct 2023 08:05:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LLPP8ysD"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5079fa1bbf8so6092636e87.0;
        Wed, 18 Oct 2023 01:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697616308; x=1698221108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OMNVGJeJs6tC6fM9RWBX9uPuEFgE2XkieCrcZbldbM4=;
        b=LLPP8ysDuJrpWzFgUwXc+t9j0LEOgYPx77LRdPKkYvQzcw1Z9a3x3UcBRro2M+u4s8
         ofKIzUAh53x17pRswhr5ld6+UiTEvRK0pIouUj4WstchdLoUBTm+sD+6An9+dSOJdON/
         1dBbKlv5PDU+GfblntVdKsTylaRnD5/voxHNr9Wqm0xOPtPdH45ob4YvTlACVEHdM5q4
         X8u9EKPdXVRFgGwhOpi7oKs8pBx4f0eZ4sksKBIW2q9K3eyVOkaDSODVsIjdhCBvh81e
         6UHc0WH40+8FzlLStw7+aN0KOT/JNqToNinC304GsTnd3RSHyTjBU2MkqHMVIK0CuFE+
         bjvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697616308; x=1698221108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OMNVGJeJs6tC6fM9RWBX9uPuEFgE2XkieCrcZbldbM4=;
        b=POpoZhi1iemsGyqdYtbYg+0paW39ucXm6C0iQsZTRXTC8TTgpZYuDjSbKbFYv+Cr/C
         ASlBP8Mw7rTbe+7itZzmi7xnM3zai9ePKEfFifxZET/zKee+xB+tHT35rUvfnYE/BgcM
         k+qg7fA7ybsn4paNEV9p1phlOmFoZYPlGEP/uP4EOTJ2vo8DVcyog5QooLVbL2SLPegN
         00FQD4zdgrcnwAoCvWuzqOf0/U6jHcGVirwC8XGpPFJMJUL+ds+0TRAinYzVK6T64MW7
         h5dYnsuLma5+qP3jOQp8tM55H2CUMwt8beQpXlv7Up3rJi9Jq8nuSwF5EsRCtmTDLTCZ
         T90A==
X-Gm-Message-State: AOJu0YykXICSnS4kJCpQKRbx/Is6LaIZBoTX1Cut6ZSJHTarAKKETk3I
	h3qfXHNi4l51ur7oKDkEEw==
X-Google-Smtp-Source: AGHT+IEOoxnYTOtBclV4vk36arcwft7QKDtzgJRUNRHK+278x59Pnk7rzDUe855MTH5QEDI9sLxiLA==
X-Received: by 2002:ac2:52a9:0:b0:507:9618:d446 with SMTP id r9-20020ac252a9000000b005079618d446mr2950797lfm.61.1697616308093;
        Wed, 18 Oct 2023 01:05:08 -0700 (PDT)
Received: from dorcaslitunya-virtual-machine.localdomain ([105.163.0.227])
        by smtp.gmail.com with ESMTPSA id i6-20020adfe486000000b0032415213a6fsm1484548wrm.87.2023.10.18.01.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Oct 2023 01:05:07 -0700 (PDT)
From: Dorcas AnonoLitunya <anonolitunya@gmail.com>
To: 
Cc: anonolitunya@gmail.com,
	outreachy@lists.linux.dev,
	julia.lawall@inria.fr,
	dan.carpenter@linaro.org,
	andi.shyti@linux.intel.com,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>,
	Teddy Wang <teddy.wang@siliconmotion.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] Staging: sm750fb: Rename display_control_adjust_sm750LE
Date: Wed, 18 Oct 2023 11:04:08 +0300
Message-ID: <20231018080416.25931-2-anonolitunya@gmail.com>
X-Mailer: git-send-email 2.42.0.345.gaab89be2eb
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename function display_control_adjust_sm750LE to
display_control_adjust_sm750le. This further enforces snakecase naming
convention for consistent naming style throughout entire file.

This change was suggested by Andi Shyti <andi.shyti@linux.intel.com>

Signed-off-by: Dorcas AnonoLitunya <anonolitunya@gmail.com>
---

v2: Correctly spells Andi Shyti's name

 drivers/staging/sm750fb/ddk750_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_mode.c b/drivers/staging/sm750fb/ddk750_mode.c
index f3f354831617..bcdd291d25c9 100644
--- a/drivers/staging/sm750fb/ddk750_mode.c
+++ b/drivers/staging/sm750fb/ddk750_mode.c
@@ -14,7 +14,7 @@
  * in bit 29:27 of Display Control register.
  */
 static unsigned long
-display_control_adjust_SM750LE(struct mode_parameter *mode_param,
+display_control_adjust_sm750le(struct mode_parameter *mode_param,
 			       unsigned long disp_control)
 {
 	unsigned long x, y;
@@ -125,7 +125,7 @@ static int program_mode_registers(struct mode_parameter *mode_param,
 			tmp |= DISPLAY_CTRL_HSYNC_PHASE;
 
 		if (sm750_get_chip_type() == SM750LE) {
-			display_control_adjust_SM750LE(mode_param, tmp);
+			display_control_adjust_sm750le(mode_param, tmp);
 		} else {
 			reg = peek32(CRT_DISPLAY_CTRL) &
 				~(DISPLAY_CTRL_VSYNC_PHASE |
-- 
2.42.0.345.gaab89be2eb

