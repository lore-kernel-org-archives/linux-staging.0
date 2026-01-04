Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E98BF221290
	for <linux-staging@lists.linux.dev>; Sun,  4 Jan 2026 11:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767524831; cv=none; b=ChNrE0yMI7uvWJBXjtEJWlsmW6p+juHnuKKhFrz87/jmsJROFmkTIzwtB1QdBYeSLqzIWjMOLzRnxv9+UNwKssMNoUb0ANjnHyiNySZzdVb+hJrcGi7M6OWFMSw4hvG9TKU+jDJDjaq5nFFG6/Y/oOEus5GbnWqYKeyYuVx7hkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767524831; c=relaxed/simple;
	bh=F7lcVy2i7sDLuzA2SLiPSPOtp3uhQu1dRJE1zJ3lmwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=inVgmaVGvW0QkVYvIiFmuXTKfcYH+K4lH1ESfX7xjL1iKLDMfamqrQRJZRDNwktcYWn63QPphxMC3yrkQJ5rQWP5rGYBjp7Jl6yjKcHVZoAx18KBwRMtP+oTtDrmoSnaVGysMDhLJTYppIjUXYmwSmHyKEtgEXf6xO4loQxBt84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mVzjoAy7; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mVzjoAy7"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b98983bae80so11724222a12.0
        for <linux-staging@lists.linux.dev>; Sun, 04 Jan 2026 03:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767524829; x=1768129629; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cQ+bmRezJcYlWiXwjZzWnf7vKwJcfmfzRPaQmAd80kQ=;
        b=mVzjoAy7asgrAeEHw+hyY03vX3ZVQYF0/q46z+eEcrhZbM6MGfxuz+XPmj1ALCz0KL
         jRvofc8j4AfYQt0dzyrPjsMnyw9fcfde53wfYrm2ZuU8PH3pbDxryI8DkcqWzChxx4bv
         HSUFLL2MbCRTxadeLilT5tWuwKQtepScMZlQcgkbUF8LQYpISnyT9V5rZ7Mgdzi/DB0+
         zmmfMn/Cug2n+Y/OAHcBkGcvGpJomDfdDCov61YU+EbGQNcdgz49UPCboVfvnonlfsbT
         z6tcxexiDlJmL37GAzhsuNLgM3n0CCRkrfIPQLLN+5uOS3yv53q5bXdgr+XVHDB12Czr
         w2Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767524829; x=1768129629;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cQ+bmRezJcYlWiXwjZzWnf7vKwJcfmfzRPaQmAd80kQ=;
        b=ABfUoYw46ztGpyzDcWAXt6VP9ieCVxdIjUwX0Ey/a7KOstulSWroegXgU3XkhA3C6i
         //gblX4oZCHDUYpXiiGO2YboIcUVhWBSdn3K1CrWmKdTDhQK5SDd3s/wJ5zYIkKNoFhK
         f1XB2dxBJ1pqHGOe5YCYZcwUyhL9nToG54wqMARpzs1D2ez1o3Ll24VscoXNi3yspWZm
         eUfKrQKgrjojiylxJDmu+uTCWyci6YeZNEsB2nFvHAW2Yn0w/lQvjb4JPkdP+g1zB5DG
         4Viil3lPPN9KvP4wad5gvphbZMcw/3kNOwMMY0wtEABa0nlxouBl/B1luVZeiW9zu1eQ
         fiUg==
X-Gm-Message-State: AOJu0YyOhjJD4Ia1kRh2m8+EWFoUUBGYcUhsU2mfLSErzoHBKzvW9r/g
	WUIgeWiHPNbACE1tEFOaSklw0vWt+79DIzmNuwfGfwRL5ALubqIOtsFfc2I6ycLA57XKlw==
X-Gm-Gg: AY/fxX754y7GRAWAvLGtTcjezVb4LqdIb9fow9S8DpSRovnuBavsqbkJ9bJtqLI2LwH
	36hGjLW0G8vXjrED1czOHuNAz5qARfxW92Y1payjSAOFSNj0ck17VTDsq5Sr4i/W9UZtwT5n1AK
	z/hABxSn8jw367eEclgS5ZV2gXWXvrUwNBjJFW9NxjfoTV6qH8UM5/iEkZyyO9qbsf8w5JXv4x4
	Krlp4K9xS0u9cUv0ntuR9dRvA41gIIMyE0F0RfMom/ULmev/eG2KPHNy+C13jlaf/FMA2y/+gUd
	WXjE405OvBo14oXvhXdmDuVFCESu9h3Nguaq7gKOXQaUM7vkdAHbzpQfEjCyb8VHBgNIpRRPjle
	DMdztVPXjmGB5lwRW+3YrM5SrQNsoCysbpDDlbsKgkDvh2FT1xpofQqSP9b4fyfEIDO2wPlsTM3
	HgEQ3INIsqJMIU+UaGRLNQRli97kWNuBGY+0p38MHSXlD1hhpewGsow0HTojdqqxFKkCtctvjG3
	7dV92qDuu4=
X-Google-Smtp-Source: AGHT+IHIyNwefXI8MXb93W36SvT36uYIbrNX+u5iv7qHaTdpUR4A5CUQ4/hnB+XYTX2Eg+hORueIMw==
X-Received: by 2002:a05:7301:a2a:b0:2ab:f56e:bea6 with SMTP id 5a478bee46e88-2b05ecb3987mr27224194eec.39.1767524829190;
        Sun, 04 Jan 2026 03:07:09 -0800 (PST)
Received: from ubuntu-linux-2404.. (108-214-96-168.lightspeed.sntcca.sbcglobal.net. [108.214.96.168])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b140c42e4esm7743509eec.15.2026.01.04.03.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jan 2026 03:07:08 -0800 (PST)
From: Sun Jian <sun.jian.kdev@gmail.com>
To: Andy Shevchenko <andy@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-fbdev@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	Sun Jian <sun.jian.kdev@gmail.com>
Subject: [PATCH v1 3/4] staging: fbtft: ssd1331: send gamma table via fbtft_write_buf_dc()
Date: Sun,  4 Jan 2026 19:06:37 +0800
Message-ID: <20260104110638.532615-4-sun.jian.kdev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
References: <20260104110638.532615-1-sun.jian.kdev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clang reports a large stack frame in set_gamma() (-Wframe-larger-than=1024)
because write_reg() expands into a large varargs call and triggers
NUMARGS((int[]){...}) stack allocation.

Use fbtft_write_buf_dc() to send the command byte (0xB8) and the gamma
payload as a buffer.

No functional change intended.

Signed-off-by: Sun Jian <sun.jian.kdev@gmail.com>
---
 drivers/staging/fbtft/fb_ssd1331.c | 29 +++++++++++++++--------------
 1 file changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/fbtft/fb_ssd1331.c b/drivers/staging/fbtft/fb_ssd1331.c
index 06b7056d6c71..cbe10f191f5b 100644
--- a/drivers/staging/fbtft/fb_ssd1331.c
+++ b/drivers/staging/fbtft/fb_ssd1331.c
@@ -130,37 +130,38 @@ static void write_reg8_bus8(struct fbtft_par *par, int len, ...)
  */
 static int set_gamma(struct fbtft_par *par, u32 *curves)
 {
-	unsigned long tmp[GAMMA_NUM * GAMMA_LEN];
+	u8 data[GAMMA_LEN];
+	u8 cmd = 0xB8;
 	int i, acc = 0;
+	int ret;
 
-	for (i = 0; i < 63; i++) {
+	for (i = 0; i < GAMMA_LEN; i++) {
 		if (i > 0 && curves[i] < 2) {
 			dev_err(par->info->device,
 				"Illegal value in Grayscale Lookup Table at index %d. Must be greater than 1\n",
 				i);
 			return -EINVAL;
 		}
+
 		acc += curves[i];
-		tmp[i] = acc;
+
 		if (acc > 180) {
 			dev_err(par->info->device,
 				"Illegal value(s) in Grayscale Lookup Table. At index=%d, the accumulated value has exceeded 180\n",
 				i);
 			return -EINVAL;
 		}
+
+		data[i] = acc;
 	}
 
-	write_reg(par, 0xB8,
-		  tmp[0], tmp[1], tmp[2], tmp[3], tmp[4], tmp[5], tmp[6],
-		  tmp[7], tmp[8], tmp[9], tmp[10], tmp[11], tmp[12], tmp[13],
-		  tmp[14], tmp[15], tmp[16], tmp[17], tmp[18], tmp[19], tmp[20],
-		  tmp[21], tmp[22], tmp[23], tmp[24], tmp[25], tmp[26],	tmp[27],
-		  tmp[28], tmp[29], tmp[30], tmp[31], tmp[32], tmp[33], tmp[34],
-		  tmp[35], tmp[36], tmp[37], tmp[38], tmp[39], tmp[40], tmp[41],
-		  tmp[42], tmp[43], tmp[44], tmp[45], tmp[46], tmp[47], tmp[48],
-		  tmp[49], tmp[50], tmp[51], tmp[52], tmp[53], tmp[54], tmp[55],
-		  tmp[56], tmp[57], tmp[58], tmp[59], tmp[60], tmp[61],
-		  tmp[62]);
+	ret = fbtft_write_buf_dc(par, &cmd, 1, 0);
+	if (ret < 0)
+		return ret;
+
+	ret = fbtft_write_buf_dc(par, data, sizeof(data), 1);
+	if (ret < 0)
+		return ret;
 
 	return 0;
 }
-- 
2.43.0

