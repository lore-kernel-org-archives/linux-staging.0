Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFA23E275D
	for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775834730; cv=none; b=VVMKiimF9xJPoCcWm4BaLmR4y2m2kZnI9bTMk/axsT8aveClIl+72+EO5gnFRd6Bn9ReVAE2tpqQ3eyfzDcxV91IA077KsC5Q+lbnIvOZQhEmJe4PIbhrgkQMxHOsEW0o5L/G33GWaA3RP424RzEcUu8fFPqFjhqEoOtmF20m+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775834730; c=relaxed/simple;
	bh=41Neor7tSLrmgihGYhIlmf6oXzMPazdCBeClFzMAnzo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Oo4DoXeo77wL7Mzpg196sBgOSgQSFyXFtcjtEUrv0ChNWIYfKeP8VnqJJA+QgqCtu5tDRAEjMLPU2MRS/asi9W/PUjTuqMTF9XGb/s7Z7OCgMHtJAD7w47podJVrdgRyIB0ZEalTpwQ7FrHa4ZAjmrLsw2noCFzaLp7etmo6vMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OixEqqwq; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OixEqqwq"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43b8982c2f4so1319847f8f.2
        for <linux-staging@lists.linux.dev>; Fri, 10 Apr 2026 08:25:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775834726; x=1776439526; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=g5E/qGGytHyyxjtH+nmK60xHIAvqtE0J+wOflAMG2XA=;
        b=OixEqqwqkpZ/ACWvDXX0O8ge+VfToXWRHgOlUNWGBjqQS2wkqACau7upxvN7Yj9uuJ
         5WEa89tWOQUzHU7hm1ThSiFIDvNaW2zX/fxpTtBHy3t0xiOpLzdkcp1imWKr8jbfSODM
         KIosDIJcnida9shwIjgx2PCziaMMB1vTiGTCW+HQbhis0gKf1OjACHeRMRmxOhhH84yX
         PwnVH4C6SfvAQXz+DYFzr0QxSZiJxsYqGr7eZt5MgD0GFRWq8g38LLMOZWUTMYyYFHUs
         Bx4IE5pelvCyPYa6ntIYaHfHQAqREO7h0AEc9RcsXzAbeOlrsuwyamkvVEt7+uYCv5tw
         oZYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775834726; x=1776439526;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5E/qGGytHyyxjtH+nmK60xHIAvqtE0J+wOflAMG2XA=;
        b=d8qCetZZpcM4lEyoqjCD7lhcwW8pdeP6JmcUt1WcJtj/ZNStzBtJc24/zEu7dUHgc9
         mgIVo7tOhle7geDPBZbz25mm4w+Hy0RdM1sp8szZ8NkVsMgjoDtTSzKDjDpzHL5kdyeG
         iBeTVFEVK0uaTbEd+7JJX7jkc2wRTE9l5Ng2z2D64t8FMN5vJoJ50oF9Nuld7vDUYwaf
         cXrw2DYU+CMHSFqTfpyqGUyIhpE7RVNAgt5LYwun6rk1NnNUh0php3xxo+FTA1QspLe/
         v5DNmVY49rGXUiieqh3bNlLKmzYW4OtHYckcz/kc/3faUj95awP5lDXV1SPIczzJ6RIx
         1QAA==
X-Forwarded-Encrypted: i=1; AJvYcCXYgVKov+869ckHPAyDf3g4+fwzO31JnlGOecdOgk1ls5gsHvC7FCMSdUbdyEMUtbf+10kiej3wjRMxd+Ei@lists.linux.dev
X-Gm-Message-State: AOJu0YyalMJ8OTRCjcKAbeeiXaHqXhEAwIn2mN0ykIKX0YpHlZuJFv0d
	lGpaVAJjDWfbH/2gpMwpr4tSV8JU8B0onaYSiAbYCZBhTDIAOv36uWIESIthwn9mHYk=
X-Gm-Gg: AeBDietjOC2txIBGgtNyTme1UoLDBHMH073y3i3V3/zQLHPkcrC627C4N1GMqLpZvKw
	/wSJmc7Dgwm+rinB/Yv2sF893y30H565AJNTEnKJKTkUFDCrWbhp2pwv/F09/e84LuGuW/z0G+L
	QvdttxUwvun5MAm9UzXoukym5whKuTzV3aaW8RuczASs8k8bhSbidRHYwswQ+7f+O5glNCUsEAq
	Jd3/Ug7rbDEDcQiIkl9QEGygvjW7NeXW6ElWInKNiSCQdql/xTxgyKh1n4T+QeOtimvlQLOHYQX
	r+orIWjJBKsiI/jTLTl1XdCC5++LNZl0C3j+96y5xvhbBY9FOpow7jtGsAFKFO6pzGIUu2R/guq
	AyxhIXUf7stKbeUEyh1ze1DIZPeH6epK4swtpqgoRP2/Tht2LnPii0S54Hmikq2CpvJ7a2rzw9B
	V8Wogok8SpbbiojxpzaqhQZJwvZ6UZGix1AFe3lcIunVdn1pKjCi9tkydqXoYGb1Kd4r/0xIZhH
	VPLYaPLyPyI
X-Received: by 2002:a5d:588c:0:b0:43d:578:586f with SMTP id ffacd0b85a97d-43d642b8e06mr5498182f8f.25.1775834726385;
        Fri, 10 Apr 2026 08:25:26 -0700 (PDT)
Received: from fedora ([2a00:23c5:4a5d:3701:b24c:c1d6:5c61:a2ed])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63de2e4csm8722033f8f.2.2026.04.10.08.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 08:25:26 -0700 (PDT)
From: Josh Hesketh <josh.hesketh@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Hesketh <josh.hesketh@gmail.com>
Subject: [PATCH] staging: media: av7110: remove dead code from av7110_hw.c
Date: Fri, 10 Apr 2026 16:25:02 +0100
Message-ID: <20260410152502.25310-1-josh.hesketh@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove functions av7110_reset_arm() and av7110_send_ci_cmd()
which have both been disabled behind #if 0 since the introduction
to staging. Code can be recovered from git history.

Signed-off-by: Josh Hesketh <josh.hesketh@gmail.com>
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
2.53.0

