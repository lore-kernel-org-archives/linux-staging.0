Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB23D34A3BF
	for <linux-staging@lists.linux.dev>; Tue,  2 Jun 2026 02:12:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780366341; cv=none; b=V6OR5FJh0rnLHssVCWzHcqXlUNxrcMEiSXRY2LcH4JJ9EwrQCQHxavwjQ2KsueDs4iB+N0y5U1OYGC530Cm6ab7Ici6NOkbfiTzB1QFegEVQtxERotPvMET+3gnXgBj+knqWnZPFlkEkGCK9AYsv0vTrjllVCBWVJWhoAYGqS9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780366341; c=relaxed/simple;
	bh=wf/Tk37nbq/peNqLyDFCZP6yanc4XzxUnAJaltP01xg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RE0RpvnBJcQAm5Re5ngqmrigXXm8FTy0LYOYlfbMVHY82qf9DT0PE/6Oi787O/cBem8xI3XkXD/ku8ccsL0f0IWOaph4xevAEKqf9d5spm19puyODzCJn1WX8GpAds7U5dhb1/7XgEqf5lAMjtT7n4u1T1Yj3ncNjIApg/noeAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Wd5YIcpu; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Wd5YIcpu"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-36d98b9aa9aso1866545a91.3
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 19:12:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780366339; x=1780971139; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yD+SU8WL23LENwZ9rMPspuomjTKLBSTSnf+u+Jse5Lc=;
        b=Wd5YIcpuee97dED5hVh1WqT9yCw5DQ1A9dLiGQF8Pqfxwmd3jdSyayOL/11el95nxr
         +M1XX2WsoZIaaufVVPWONW8U7wYI85o3ft8NHeDSQhjdg3MZAo3+TV1LeMTgCZk/QX3p
         Rn2cfO3AsEBnligszeV3fFSJtPj3Re004c7M8e/Ksp1CUbIO+9DFQBktsKP5QRQoOZGn
         Ar/Y0dnbCj/sGB2ZsM7PpzdAmFuYX4pNzorFf7WPPiKVb+A/KLZcDtQnH8Rdsa+jMffG
         OnI0XJuSyePBrgwbqQzaT1d5Apg+rHwodd54+Epzhc7i+bEr9hHZBOt1srO6QNZ3gfv9
         bhyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780366339; x=1780971139;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yD+SU8WL23LENwZ9rMPspuomjTKLBSTSnf+u+Jse5Lc=;
        b=ljJKsVTxsOATUfVa1jgG9Mwt3K+zN3MmbHLHvFrC0Sk8szZhwzuDcACK5gVm+oS2SW
         hoXHBBcGpy07mKxQTHCmYZAt5LyktSEBsAanPFZBPFBzZ+h26/rsu1fdXZFUgNg3INwH
         AY4IP9v04px/eKErP+Cyz1DlodW8zZX4HiC+1X22FjhX+hvSymOznPCmxLAJpbG/u2fG
         J9K17DYRkEk71eDHf+J216riP1iBvPFhElqDRnrDGjw9xmnSOphZ613K2v0lFs9wjczZ
         3CMbK4/8iMOryGGvTrWytSop23vNYlRtleudTdyCXCMs8Ts5yMb2iCDSJuiCLfs8OZF+
         JEoQ==
X-Forwarded-Encrypted: i=1; AFNElJ+cw81EJeoLgmQaqpFmEYa8rXQ7VZ+lkQg9hBQ30xkS2jKDZyipYzpzNEow7QRv4plAngyLw8kpJ/UNeOgJ@lists.linux.dev
X-Gm-Message-State: AOJu0Yxqwisht9bu7Y+OqWzu4rScP/UHWTOe9/fHrGam0e3q36Ka6tML
	ThFm2xeII/FviP7IIrxejiebSJF8dy+zXCvay6vJJcsn7PvE4yC4SFAA
X-Gm-Gg: Acq92OGG/wA9kW4COqrd8H5exzIg8plA2dUoqdbsqJIgQp45e5tzivtZEvnBwiv7E+y
	IqFajvW6ukaoFR/Xx6LewrpBdg0nktfUtWAVOA9mtjG5A8c7VzNZPTF1VxItInbSrHIYZTCOMUc
	5EO1uM+xSa+2Fr9xyOVlSL0EueEPh89lpZYiBg0zNOryM5R3CHKewJWu8rVXZ/qA4a0mxY1b141
	RTqA9XZsG14X1D/xY3+Sz+rzwKRBOlIfPpIfHqBHl7iRyqBiTGTd54cwE7/EW3GvGPLL2ijGG5w
	Sbr5cvc0sIi90E4D8lMtBPTF+WbAc8WoaVIooH1KTRv4DhDFPtbVrYBnyi7IN1YAUqcZNNgMdU1
	gTgG77Dp5MITe4+zG8DXwpLjevwNqXB0SHuwkQ+K+yGmbUmUVtr06/V0wyMY8wbWjGLwpepdy5l
	bLPoo2UI1bO/to9vqhVM2VgBGby+rIpqjbVei/WFWlYw6Cabs=
X-Received: by 2002:a17:90b:590e:b0:36b:211f:fa75 with SMTP id 98e67ed59e1d1-36c4ff4cfd4mr15269083a91.8.1780366338907;
        Mon, 01 Jun 2026 19:12:18 -0700 (PDT)
Received: from localhost.localdomain ([2604:3d08:2474:4800::7698])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36dd95095aasm875733a91.17.2026.06.01.19.12.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 19:12:18 -0700 (PDT)
From: Brock Haftner <brockhaftner@gmail.com>
To: gregkh@linuxfoundation.org
Cc: mchehab@kernel.org,
	hverkuil+cisco@kernel.org,
	preyas17@zohomail.in,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Brock Haftner <brockhaftner@gmail.com>
Subject: [PATCH] staging: media: av7110: remove unused dead code wrapped in #if 0
Date: Mon,  1 Jun 2026 19:11:43 -0700
Message-ID: <20260602021143.39442-1-brockhaftner@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the av7110_reset_arm() and av7110_send_ci_cmd() functions
because they are wrapped in #if 0 preprocessor blocks and so never
compiled or called.

Signed-off-by: Brock Haftner <brockhaftner@gmail.com>
---
 drivers/staging/media/av7110/av7110_hw.c | 46 ------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index 49ce295771e4..b0bd7666d48b 100644
--- a/drivers/staging/media/av7110/av7110_hw.c
+++ b/drivers/staging/media/av7110/av7110_hw.c
@@ -95,29 +95,6 @@ u32 av7110_debiread(struct av7110 *av7110, u32 config, int addr, unsigned int co
 	return result;
 }
 
-/* av7110 ARM core boot stuff */
-#if 0
-void av7110_reset_arm(struct av7110 *av7110)
-{
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTLO);
-
-	/* Disable DEBI and GPIO irq */
-	SAA7146_IER_DISABLE(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-
-	saa7146_setgpio(av7110->dev, RESET_LINE, SAA7146_GPIO_OUTHI);
-	msleep(30);	/* the firmware needs some time to initialize */
-
-	ARM_ResetMailBox(av7110);
-
-	SAA7146_ISR_CLEAR(av7110->dev, MASK_19 | MASK_03);
-	SAA7146_IER_ENABLE(av7110->dev, MASK_03);
-
-	av7110->arm_ready = 1;
-	dprintk(1, "reset ARM\n");
-}
-#endif  /*  0  */
-
 static int waitdebi(struct av7110 *av7110, int adr, int state)
 {
 	int k;
@@ -498,29 +475,6 @@ int av7110_fw_cmd(struct av7110 *av7110, int type, int com, int num, ...)
 	return ret;
 }
 
-#if 0
-int av7110_send_ci_cmd(struct av7110 *av7110, u8 subcom, u8 *buf, u8 len)
-{
-	int i, ret;
-	u16 cmd[18] = { ((COMTYPE_COMMON_IF << 8) + subcom),
-		16, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0 };
-
-	dprintk(4, "%p\n", av7110);
-
-	for (i = 0; i < len && i < 32; i++) {
-		if (i % 2 == 0)
-			cmd[(i / 2) + 2] = (u16)(buf[i]) << 8;
-		else
-			cmd[(i / 2) + 2] |= buf[i];
-	}
-
-	ret = av7110_send_fw_cmd(av7110, cmd, 18);
-	if (ret && ret != -ERESTARTSYS)
-		pr_err("%s(): error %d\n", __func__, ret);
-	return ret;
-}
-#endif  /*  0  */
-
 int av7110_fw_request(struct av7110 *av7110, u16 *request_buf,
 		      int request_buf_len, u16 *reply_buf, int reply_buf_len)
 {
-- 
2.54.0

