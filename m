Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34CA53C196E
	for <linux-staging@lists.linux.dev>; Wed,  4 Feb 2026 15:39:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770219578; cv=none; b=XZP3u80eGc8lq+TBFS1X9KQBd7r/OYTipZHGhM437JRaFuGrg4tOxw7DSH6eaNcV/UViwqUCnCW2hLpFTOCU6Zdz/ka6iZMUDz6SfHINJlU62xlN0NobvvRKFgZtZgoGIbzKy5GxxfTEdpruIRFnZdbpqZjCpHcwJl0KnDgVuk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770219578; c=relaxed/simple;
	bh=yNyoJ5AhNfMEoR0z+MIXzwexmhFP/LF1Uj0/9f8QB7I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d+/OscEBPuwcJMSXbvjyIb1JqL1nCFBYTI5QleKLQXpg+d3KCMu6DOwvQyNYFd77pGlZgUK7Ibhsxev8QnnedICwtoj3JnBIeplUn9HMNehw7u0K8jyL4k53ztQKTUKlZenIlgAdKkVlWIHj9HMfxCHO192uysGD/U7r129My9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vs7m+Xbg; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vs7m+Xbg"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-480142406b3so52913865e9.1
        for <linux-staging@lists.linux.dev>; Wed, 04 Feb 2026 07:39:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770219576; x=1770824376; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jk10eGunB1uJKb8jAOCmTCvnvS5rA0nvykd8EFnZG7Y=;
        b=Vs7m+XbgWTxFEHE+AoEiDfunM2F7U1Z60kJaeFI5OjLjcZaPJsQVl5I6aGjHkQeLMt
         9tZ7gzemvSf5v5Ik5sEhJnLBpeyupe3epwpNULpvu5BWmNqC8yMwdHoA0SLc+aEKfFol
         lYYeuU0lHwReHR8i+mynRXdj6VFPxcQ4k+Mw8l/5gy3VyyI5mk9T4Mc3mwjA6YdBx9Oa
         50tfjfcPdJQZf4WmCgeJXpPfiVriQU+SnLxphQzFxei5NJ5GaTa4Gp11BiRxTTq4k6/n
         H/dijfIAPQ0Y11q/sQMHMaAgw+wYQhaORHlPsOecJTVT5Yc91gXDrlqTnkLtsJKuEztN
         Vy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770219576; x=1770824376;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jk10eGunB1uJKb8jAOCmTCvnvS5rA0nvykd8EFnZG7Y=;
        b=gwp18dLtKDunZUPaNS8twxNsGE4dQxfl3Uk9uzcIG78HVsdx/wQkzeg/m4wkbyUQAY
         pL1lWnd+21BjKEraKoUl8JNbOBF/Z0Q3/WfRWQVCbu1prTN4OoQ8/TSYBJbTHiB6fTn7
         YMRqkqITCmeyZCcCFDi2ifxf7BEDhAjvUd1pn+dapMC9Xv10nj0dDAOX76OrKJb5URNz
         RMVQ2oYFxLMNotrwNdqda2P16t+PxISG2HhiFD5XoH7/S0geaQZTcYu/cxPU9/fzHPwi
         FyBi2QWagpKQ/kn41mrveHarmva/GEpk45RZnXjb9YKQxL/269grxf1ThjeBWaQcIbee
         tHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUE4D28G9rTTnkVDYIWcwBDZ3xartD7qY6jMiKxUYMz7mfgeGyOWaKQ63QvpBY0FI615fubfjVRan/wEeze@lists.linux.dev
X-Gm-Message-State: AOJu0YzEQnxqgNA/OMA3SVikNNN/FOMCgS/j0/4fQ0hi15L5y2/jpUpy
	e1OKY9Ck49x51EBRfvxf3KwOSJydJ5lsJlM45BFoPbaOtgbnUtgbsPE3
X-Gm-Gg: AZuq6aJ8Ik5MdfPUMYFsoYyO+E0UCaPiPAwYdg5nEJ4DkoZGvGTTEQ/JXRroL3CQYtx
	KYyL938H4e5RCeqOJRj4L6XiRci6FLK6BLZqjdhb3JVXayxCGYKSooR2CsZMJ1yDc2Qd9EoU/k/
	oCzqRSTbBsavubu8Yy5J1RGScb8VW3Wqy5hdm+r2rKczJGCtWyh8glTxC89D6cUcB8UZZ/ClbOi
	BDA5+CEtp2cMu6WQRVRvrYojnrHRHsrEjX4D9gtKFMf7zw7dNKe+087ktCUxLTanmMK7eUwpIoJ
	+NySOrMfnSUoXEeq3CJtmrK/jXrhfyunu/q6gibFLsdbJ3Zgr80bgB5hQOvoTDU/5IaUswISiRj
	ws8tXVAmMDuFxA90t/jwuJNrZfpWEXLkxOzFCpEWOKR3GtAcbM4csy+qNj5H42/lWhkfJFXQrXn
	llglup43rJaxWu
X-Received: by 2002:a05:600c:c163:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-4830e988f3amr50683105e9.24.1770219576301;
        Wed, 04 Feb 2026 07:39:36 -0800 (PST)
Received: from ubuntu.. ([46.31.101.12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4361805813asm6930407f8f.27.2026.02.04.07.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 07:39:35 -0800 (PST)
From: Sarah Schwartz <sarah.schwartz025@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sarah Schwartz <sarah.schwartz025@gmail.com>
Subject: [PATCH] staging: sm750fb: fix CamelCase warning for dBase
Date: Wed,  4 Feb 2026 15:38:56 +0000
Message-ID: <20260204153856.23277-1-sarah.schwartz025@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable dBase to d_base to fix a CamelCase warning reported by checkpath.pl
This aligns the code with the Linux kernel coding style.

Signed-off-by: Sarah Schwartz <sarah.schwartz025@gmail.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 046b9282b..c77b0fe3b 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -136,7 +136,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sPitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
+ * @d_base: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
  * @Bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
@@ -148,7 +148,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int sBase, unsigned int sPitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int d_base, unsigned int dPitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (sBase == dBase && sPitch == dPitch) {
+	if (sBase == d_base && sPitch == dPitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -241,7 +241,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase); /* dpr44 */
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base); /* dpr44 */
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent lines).
@@ -304,7 +304,7 @@ static unsigned int de_get_transparency(struct lynx_accel *accel)
  *	      and -ive mean button up
  * @startBit: Mono data can start at any bit in a byte, this value should be
  *	      0 to 7
- * @dBase: Address of destination: offset in frame buffer
+ * @d_base: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
  * @bytePerPixel: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
@@ -316,7 +316,7 @@ static unsigned int de_get_transparency(struct lynx_accel *accel)
  * @rop2: ROP value
  */
 int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
-		       u32 srcDelta, u32 startBit, u32 dBase, u32 dPitch,
+		       u32 srcDelta, u32 startBit, u32 d_base, u32 dPitch,
 		       u32 bytePerPixel, u32 dx, u32 dy, u32 width,
 		       u32 height, u32 fColor, u32 bColor, u32 rop2)
 {
@@ -345,7 +345,7 @@ int sm750_hw_imageblit(struct lynx_accel *accel, const char *pSrcbuf,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase);
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base);
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent
-- 
2.43.0

