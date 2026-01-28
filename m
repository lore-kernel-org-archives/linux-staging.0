Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D57E132AACF
	for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769623014; cv=none; b=WWNw2mguJVLl0Gp7XfaOxjds3KqJYF5yOa5U+SDxh02k7XyKmbf95xhbG7rUbVjdHiJVZVbnBCex2ZyHU2In49dqMNzwURCUjg6g++tKwiQNNZDij/N92edBRVUQe4CjTAnFxUeYihJXm4AUGzYxGTbbdjbyl3GUZvQxqgCOnoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769623014; c=relaxed/simple;
	bh=al5pGSLRhhs6rloCCQJBLVdINCfHsdvPjBrh9Ma/+yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FnWGVy1F2KfGIHJKosRf3WLj1lMx4faJhb4H2CMECUJqx3lZNO/7YexuKpB9/M4sF2xt9F4JQSIe5AOmHT83w2yKfGbSSM1PZ6z+xeZ6AhPXtYM8W48qLVtEZL/qYn4Db+hLuXSSkUHeEnynUz98ILA7DEldL5oVRSOOBmrLfaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iC59D1Pf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iC59D1Pf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-47edd9024b1so932015e9.3
        for <linux-staging@lists.linux.dev>; Wed, 28 Jan 2026 09:56:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769623011; x=1770227811; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZwiBX7LePOaBe3nnlFcjiTqbRsfFcEI7sQ9InvKmpcY=;
        b=iC59D1PfWtM6EfYCdTXHtlMlF4RMUTh4J5HUTg45/rKjtjEHIF3W3u77HO9OB0My5+
         RlRrTUzi7y9VHDR7SAeDLayZaZ2mfiiycDQcJ+SCxTUbTudJQ9BnKEfMdaH9Om+GqIVY
         7aoZoRnLlL4FJXVYgjnJKS32Ho0B+9pXiPdGsHsjiz7DySC1sfjky6sCHYncxp1Q7t5r
         p5+4eNp3bSMZOIKilsxqY74k0a3bhhloMvSEagt9eTLGENRM2S7AwFu0o9h6sKgao+ma
         jM8z+gTA2zpT8SpN3obvROTwwXUOToofhCC2Hwi/6Hpyo0cTUANjMmjiZQCxAXPMXXaG
         JO9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769623011; x=1770227811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZwiBX7LePOaBe3nnlFcjiTqbRsfFcEI7sQ9InvKmpcY=;
        b=KedvvFDoPb2lstkJfo96tWrnCiA10o4Tw2PTz6hO2Qg2zqp62dB47BdFi5KRbwR7JI
         oHtA5wbE6IsZj3LvX1uX2JkBZkRlrlpbMkiQrLx12+HlFBEwfpKfSXbbazSuqiKflK8O
         1WH4tz0rnU6gc8hcRWj3YMiPAMRnlSWHV8SxnfJSMh+ZANh9/Ok/BzEw4x7MNIFDq9E4
         McfYvlshIpKae7fVYbrott5H+Uob794wl/lZyrFXf4Qf2nOq4FTVmEd2VGA1/ZHW2pDa
         2OBiD/MPvJnc8WniCgh9cqc0E6KPQM3sewadW0qFcwvn4jr2IrHLX31a9o0C68yMLAL7
         ImUQ==
X-Gm-Message-State: AOJu0Yx70a7JWPuIYJxhWwQCyWBE3+NoCqqrtYKlEeVnkHPORx1/XH3R
	BZVzVgHdJNxBHd5JNMniuTlPrHsyKFNw4QK3tDBlKuZDy4Q9e1XAdFG/
X-Gm-Gg: AZuq6aJzazS2vsF6YO6qiSoejATPHwOxYLum45wi6BDCoowy+kbXA1tB4KV+UHLE3ds
	jwsC+fztT7RLYm3vSJED4uuB+P779w5CKu+QfTaFwZiUZ18rcJqOT3p1RFVZ8EEXHWe0LLCeJvh
	IHSqGYNwucNKYzlV1HtqzfdnwzxTaL3FwatPqMDO9sBnNdarpiJ3KZoWHjXvJ4mxiXbkpEDeJmR
	CH0BZgGIzqTVAEY7ICygLhvxW5DoGugJFiwnmLX6/WZgBe7eepNsDm4lQ/8bxj5HhgN8xazPOAq
	NahDL1g7Jug4Ndvrspuxg8IrW4uh4Vn/RUo3nsmHWhr5hndiyHHb3O0Wi5h0OXb0nEHSxoJ3M6t
	lOrGAnBfXotfNYbL2L3Vr4AgkLu/qx8Wj/7rJUjFThqvqXcGsWMZB/Rq2+TP3cAuTRxUSOSOGuC
	/ZAmoZYmOE
X-Received: by 2002:a05:600c:37cc:b0:46e:4586:57e4 with SMTP id 5b1f17b1804b1-48069c86407mr80523865e9.24.1769623010666;
        Wed, 28 Jan 2026 09:56:50 -0800 (PST)
Received: from archlinux ([2a0d:e487:62f:1e39:2e68:4b89:fb41:fa75])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806cdd78d3sm80729155e9.1.2026.01.28.09.56.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 09:56:50 -0800 (PST)
From: =?UTF-8?q?Timoth=C3=A9e=20KREMER?= <kolbxyz@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	=?UTF-8?q?Timoth=C3=A9e=20KREMER?= <kolbxyz@outlook.com>
Subject: [PATCH v2] staging: media: av7110: remove dead code
Date: Wed, 28 Jan 2026 18:56:46 +0100
Message-ID: <20260128175646.97863-1-kolbxyz@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Timothée KREMER <kolbxyz@outlook.com>

Remove two blocks of unused code wrapped in #if 0 to clean up the driver.

Signed-off-by: Timothée KREMER <kolbxyz@outlook.com>
---
 drivers/staging/media/av7110/av7110_hw.c | 46 ------------------------
 1 file changed, 46 deletions(-)

diff --git a/drivers/staging/media/av7110/av7110_hw.c b/drivers/staging/media/av7110/av7110_hw.c
index bf8e6dca40e5..b407446c69de 100644
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
2.52.0

