Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D59280332
	for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 17:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365899; cv=none; b=gW7Wno3moP+H2E9Vy/vEe6B5ZP5mJAvOkFnhhqkt0wCJQE/CUKGwMKpo6BalTv2sNc3i/HVPIq7oMiFSEWOg1fLhOTNrbcONqdZmaWK3dN5qYHqTWJ7DE3arYxg+Uuglr6nT02ldDRmhHHal72vznJpwjnmM2sKJvSZ18oxCDDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365899; c=relaxed/simple;
	bh=Bvf5XzmK1C7KFxHxm1e5k5vvsnilhL9xB57W1UxAvJw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PcynnNQIA7PJnVibjrGai0X+xY/NjYTdm1OH2FJyaFSVyB2YqFrMvYwkXxWzZ11LHi9o2OS3oYqkOKI6rLG7IoPZX5buP3FhIa73ZBi+IG8csTUwrtGrneavNfXS8psTY5US4ydKz0KIg/1G7YAs1e+Sag4CSKf83r87Oxyqv/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C1NfKZ86; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C1NfKZ86"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742c620e236so2553090b3a.1
        for <linux-staging@lists.linux.dev>; Tue, 27 May 2025 10:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365897; x=1748970697; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6I084BRg7r6NYSuT/XB9CcOlGWZUT2LEK0eREcn7WlY=;
        b=C1NfKZ86IwoQLnc1+IPkwxLKV4ft6g9AVeRmXMml9dDzQuJDxaOCJZYqZL89N0e9nI
         i3OabGI09hurgnxR6EezhPTqwIcwY/uDcoz8Xy9TYi1TaGXz7bDnNML3i6xXAzKglbeS
         Gzm/N44DnUcpmFYdDRi2nXc0lLfZFM/4kY7sy714gjgu2ItoCGl9Cv4edpnHCy0+MMhu
         dWQmHOqxTsBOQe5t1aD7Fa5B7xu6RLvf+DaKjRrwpfL6VZ25VDZq5/tQJsKzCzVIdjP3
         0HOZN8Vyx0wO8wxdDLet3TbOuxp/+lxu2d7fU6vc9hRmOALZh0Bdq1giefSfm8SNTvnD
         1ENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365897; x=1748970697;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6I084BRg7r6NYSuT/XB9CcOlGWZUT2LEK0eREcn7WlY=;
        b=u8ln7wKI3OFH3pHPFaU/xjeptBxIHyXYLCe2rlVoTkO7KuNr5MgpEuH3VeEDCsVGws
         y87hwEvk1fTTt/J1UFJeBlOaBkk1OTb1uofRDG3epmyCOG0kxN7WjFrwRI1y80965ZYb
         lNmAK/O94FcOT/N7sKS4NfSG6LKuRdqhoha17M0Al5ykhR2K9VxpPNoqtqm0fWuYIMTT
         gJy9jHZGlMlL2uvU3bDLZLG6r+07TNBz0+fAzSi4GY0VYF3FEfj5WOmzyW4j+JVNxqPQ
         4id1PZ8oMetzwz/CokrxTNBkQfU24QuDdr6Ox3IvkLsYJGcv76XA02fxyKmivnAjXScc
         /XTA==
X-Forwarded-Encrypted: i=1; AJvYcCXbILRW/y0miy8AjMWxqHCL23v/Qa78+XTXW4x7ukYpC4y9TC868o+HcgLBdphaZh/SyiOo7Ye/7OwjTwR+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw75vc55cTWibJXZMRnjgT7TXDM7giYYzD/CfzJb/y66Tr3+VkR
	UUMOsLyJHnwkIMETe0NIXFa0XMec42LVs3ulJU7GLNeR92FUV7jyQuleNHAWd6sjlO/VplYJsxs
	V+fBqb7/7YSTpGyya4Vcsyw==
X-Google-Smtp-Source: AGHT+IGZJsWT+MI+7toTUBwc8TwoPdXf5QX/ZfY+HuOurMgYLS6kCgj3PSDcttemfwybHe/5BIi9lzwqWp0FaNq9
X-Received: from pfbko5.prod.google.com ([2002:a05:6a00:4605:b0:740:555:f7af])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1822:b0:742:a5f2:9c51 with SMTP id d2e1a72fcca58-745fe084addmr20441201b3a.16.1748365897406;
 Tue, 27 May 2025 10:11:37 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:26 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <5250c76b824f133c04135b0d82b18d85cd958852.1748365488.git.ericflorin@google.com>
Subject: [PATCH 4/6] staging: sm750fb: rename `dPitch` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dPitch` to `d_pitch` in `sm750_hw_copyarea` to conform with
kernel style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dPitch>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index e5f1f021768b..ea64e10d4814 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -137,7 +137,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
  * @d_base: Address of destination: offset in frame buffer
- * @dPitch: Pitch value of destination surface in BYTE
+ * @d_pitch: Pitch value of destination surface in BYTE
  * @Bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
@@ -148,7 +148,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int d_base, unsigned int dPitch,
+		      unsigned int d_base, unsigned int d_pitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (s_base == d_base && s_pitch == dPitch) {
+	if (s_base == d_base && s_pitch == d_pitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -249,7 +249,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((dPitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((d_pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
 		  (s_pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
@@ -259,7 +259,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((dPitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((d_pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
 		  (s_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
-- 
2.49.0.1151.ga128411c76-goog

