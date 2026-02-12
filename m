Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C58C2DEA7A
	for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 10:58:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770893933; cv=none; b=hjv8560dG4edjyK05FudJZKBRA7DwaKPPEL/PG6Vnjx9jI4FSieBo4nUS+nSy3ELF/Te6LZUtUmDt1J2VeQrS5kl9oxsVvvS6uUc+hFW7PGds+aBjxMORqRdBGV8jfqe+47L/9uSKSDXjA6k6ZAijuHc563B/tXhm94qA+eBaB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770893933; c=relaxed/simple;
	bh=a1z+97/vHRcASw/OXKag7SrB2RfIJ963YDrikpkR0xQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9w/miGqgT192ehDoW4LpsyToRG3RYfsrWNp+xwlmz+fzjmkgZqd0YYXMIRQiCl4B6f+dsy4Rf/TxklanEQbYIPTC7uVMBkHkiCoeD8rRi3RGXkyCMExebNhTg2dFJAlPwWHSi6EywLw+weNy51GE+f0MxmhJpZepkp1vdZOdp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VEJBKCTV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEJBKCTV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-435a510c211so481273f8f.3
        for <linux-staging@lists.linux.dev>; Thu, 12 Feb 2026 02:58:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770893931; x=1771498731; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=K80USFJkDxuG6oGVG6r4p5kSvqwQuXJSDqWSf0wkVrI=;
        b=VEJBKCTVN9qEPENARFONNM1ME57CmwGA+UlKOBnOS+m69HIgTIDPNWV4VK2nP2k2re
         X05wH+812ipJwmBBO38QORBvNrXvrYRrEGelpiXwbgebWFistlxaCo5jhPFwRcjk4bDO
         4H9ZY+7M1n9oTRu9pLI35keRNCY/UwRELNwVTFh7qMur+cV9tgpNqK5r9Kif/qRGGm1j
         CjK7Vd672XwAKYUXVv+dsiUEZ6z93uWhv0yPMXMESJGtUAtH4MXZMEyzseX0/Tuu404T
         N01SPH8s7eKhfw59/kEiyfER+fpRoxkR1r3NJIQpe7dulj2XRZgaKFDHF7zMQVwkvD9k
         1gdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770893931; x=1771498731;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K80USFJkDxuG6oGVG6r4p5kSvqwQuXJSDqWSf0wkVrI=;
        b=GcAgV5qyD0LHTTzrIvxaSLo8sXNFwLufU85n5egoe3QqvFwYk3w2ttGGnuLn2cXogu
         LS9SOBPW612LUC0RGBE24Xh3uszJy8R/aLXzSWgPHo2+ZA3SY8etOG2RlpxfWMRysrvE
         PFRgIP1fIEEmyYh54ZwHwzMsKrJuzPgeGbK3+w80+xgEKECBMeaKmF0FzMYheJC94lEh
         TAbipiTAq5v8L/Xsl4G34SV2SpM+YQrAVzJvPo4Kohsw984HWSVvN3SlBfeWolCGPtoM
         YDQubyMtVgEygDtWzOg1NyxbX06KyGMxa+vxTU/KwNbvkhm8U/eheyCDl9B+PKjc64fr
         Lesg==
X-Forwarded-Encrypted: i=1; AJvYcCV8Hb6ZX8qEQHJrgDQjiE0AgT1rqZ7REpjXQ0II8DsfFhjyWknb6p1lVfQQeycDyB7CIF9kc2ZskPr3sgp6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4AYsV/uoOo1/s8t0Z5O/KiPSFAL+Wbs+3BUAmaSa0fzmSze/b
	+bN2oRV6dwcw+/OKcFB7RBHkZxtmct+aPnF3+3YiRQDtXDtnqYt6tXqk
X-Gm-Gg: AZuq6aJtMcLynBY05YaxnCiqHp34gc2HAvqBCUSkFG0oZYAIJ4Tdje0QZ7vNFNkmj2J
	ScvH3aPW+67RTrK1mpSntMicIXq66EbXATlRJk3szmdmsQcL7NG/eAXImBGfde+0/louvD7DcKQ
	hi72jQ26Vx6PLLGRP4/jq3G7BSXvs70yUekXZgai2wB1KAFbK2Wlro8OgIxLL0W5l+hEMJEPZdD
	0JOX8t9MCMQnJAgRj2QjzmuCQakQxRE4Rm4oV1JFmYI9VYKLUA8EHbsAFfulToOlGD8fL257BdM
	mzOMuVnqI6cS+Gj9yJzovudEmegp3iaX4LQNsOULJ/eVGI1CPW1yZBa44toGzxMjTsrjSrGwLxn
	QMfEmQxu/Fs/YGfQaJkOp4bkuyUrACTLWnUdbpfdLujZhtfibvUyOzKHxO/QeO1JGlNwK5Pb/md
	e6jaqXkl9JwpTJ64gLQQRr5oNisxw/rWQe67RR95Riq4KZzex6rrr19O/VyMYV4BEoPIPVbNTap
	dJe0WHwTzeB2Ixb2vUKC+Pr
X-Received: by 2002:a05:6000:1445:b0:437:76fe:abfc with SMTP id ffacd0b85a97d-4378ac71805mr2181903f8f.4.1770893930749;
        Thu, 12 Feb 2026 02:58:50 -0800 (PST)
Received: from rachel-VM.. ([31.44.137.237])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43783e5c550sm12089778f8f.36.2026.02.12.02.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Feb 2026 02:58:50 -0800 (PST)
From: RachelOvrani <rachel.ovrani@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	RachelOvrani <rachel.ovrani@gmail.com>
Subject: [PATCH v3] staging: sm750fb: Rename nDirection to new_direction
Date: Thu, 12 Feb 2026 12:58:42 +0200
Message-ID: <20260212105842.36431-1-rachel.ovrani@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the variable 'nDirection' to 'new_direction'
to fix the warning reported by checkpatch.pl

Signed-off-by: RachelOvrani <rachel.ovrani@gmail.com>
---
 v2 -> v3 : Change the commit message more appropriately 
 v1 -> v2 : Renaming n_direction to new_direction

 drivers/staging/sm750fb/sm750_accel.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index e1877e5d0..c796d410c 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -153,9 +153,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
-	unsigned int n_direction, de_ctrl;
+	unsigned int new_direction, de_ctrl;
 
-	n_direction = LEFT_TO_RIGHT;
+	new_direction = LEFT_TO_RIGHT;
 	/* Direction of ROP2 operation: 1 = Left to Right, (-1) = Right to Left */
 	de_ctrl = 0;
 
@@ -173,7 +173,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = BOTTOM_TO_TOP;
+			new_direction = BOTTOM_TO_TOP;
 		} else if (sy > dy) {
 			/*  +----------+
 			 *  |D         |
@@ -185,7 +185,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 			 *	+----------+
 			 */
 
-			n_direction = TOP_TO_BOTTOM;
+			new_direction = TOP_TO_BOTTOM;
 		} else {
 			/* sy == dy */
 
@@ -198,7 +198,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = RIGHT_TO_LEFT;
+				new_direction = RIGHT_TO_LEFT;
 			} else {
 			/* sx > dx */
 
@@ -210,12 +210,12 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 				 * +------+---+------+
 				 */
 
-				n_direction = LEFT_TO_RIGHT;
+				new_direction = LEFT_TO_RIGHT;
 			}
 		}
 	}
 
-	if ((n_direction == BOTTOM_TO_TOP) || (n_direction == RIGHT_TO_LEFT)) {
+	if ((new_direction == BOTTOM_TO_TOP) || (new_direction == RIGHT_TO_LEFT)) {
 		sx += width - 1;
 		sy += height - 1;
 		dx += width - 1;
@@ -277,7 +277,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		  (height & DE_DIMENSION_Y_ET_MASK)); /* dpr08 */
 
 	de_ctrl = (rop2 & DE_CONTROL_ROP_MASK) | DE_CONTROL_ROP_SELECT |
-		((n_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
+		((new_direction == RIGHT_TO_LEFT) ? DE_CONTROL_DIRECTION : 0) |
 		DE_CONTROL_COMMAND_BITBLT | DE_CONTROL_STATUS;
 	write_dpr(accel, DE_CONTROL, de_ctrl); /* dpr0c */
 
-- 
2.43.0

