Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CC403F4DE9
	for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 09:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792315631; cv=none; b=ELzeTMyaXlzaIALSzJ2aU+2GepNaeH31mr0IYAJMFXlpqJuYx6OiRB/aCTqfcZD5XUl8R7n3+QcBJi7/y2jlE2nK5ajqExw8NBKFjPRUmNZi/tBu9HZttK8PMIJ70PBElfiDgg+HQT/cE8phyb9watVhw3r5/M6O3j5CyhZJO1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792315631; c=relaxed/simple;
	bh=Wsa1/xhWCYq2/IBwiWNMt2tj93MBzhsZUygXRpg69xM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TkXaio/afCO0crU4nl2aaHZXBcX4ojQvWWo74F0gKUgQm/kxzx1QGC2gz65lXwJQw+0/TaJuE2xExgLr2x7if03OXWY8cednoOdH5tDGVzmZ9cfajk0ecK212JenTThkt9H2YrVWmc20LaGwbQgsoWanM79ksP10+edwa3MI/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y7C9Zqke; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y7C9Zqke"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso2720399eec.0
        for <linux-staging@lists.linux.dev>; Sun, 18 Oct 2026 02:27:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792315629; x=1792920429; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r6jUk0an0lKrrWdJXHLKdAJiipusBLjsQVAGLXI1SyU=;
        b=Y7C9ZqkeJc/IhG4Yrjq233w+fKTstGxFnNR3NV55/OaHuAwHq5zKb70A9D8lb7UgiM
         6VavZbFGdVMhRYvvGDe69QwdnTJfBA8Zqmcrz1lRJX3FiNTbtFBOSwrXqflShtZloLFN
         Idv24xRN0fWY2B2PzdFRlp/+E0jRcKWycMuOEZrjPxQbAVo4suMNKSWFTjZ43bZbzoJm
         Z4JkOn9j04dEWqNjq1oT30/eD5M/cP/Yfv/pFQXL36sB2cIqZ6F6lt4Su0JIMCq+0EMQ
         kdk7xosW3Fk4ruBbksZFfcl9cMO8aKFKh7K2YO/HDfu6hx6LzoNEoN4KNXJPIdteVu5D
         I0Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792315629; x=1792920429;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r6jUk0an0lKrrWdJXHLKdAJiipusBLjsQVAGLXI1SyU=;
        b=MCN3XggT+1oqXrqzcZxZImKxd7m2rGQ4xk2VsMK5Q3BmhdARrfgiRuhUAuTXrZkiCE
         I1BfrGc99Ze6BPbJdA6OeQSfT6/UjFFWbKMDSF7sD+suScXUZXEPu78KGVC/S4RnuRXh
         0ynXCQ3iZBRxNiRr5LBlmAA2mywuaL/zMT/YCAge/Vpn2ahdBH5YImwaURSiLD4070dX
         Ou1BuW5TpmrGYHWwjD0jQ8hamR7Rb8HZ0Q0xPFeFx93sZNgnDuXzCplvtdL6eeCZI/pD
         +QIXKoG5d2DohuZ2pgNinefLavWrSFb/phKdNOZBJZf7myNujegLT4f9ZErvnwdzgfVC
         jy2Q==
X-Forwarded-Encrypted: i=1; AKwUvBzaMwc15p0NtaJjqGioKHoe1UdqVLgCfy39NjPbOSRNC6I1k9CxhZlV+lH7NFdLXKhwEKFGRarP3VQ3Roiq@lists.linux.dev
X-Gm-Message-State: AFq9FYIeimHfGHetsiX94PyQdOh0b7OwEwwFSa/zRFrYmM/2PzatQ7nz
	r9KDPQKPfJdL77a7MLdf6HDecP8fStgb4JeFXFwraGLYpfFjEBz6y9dr
X-Gm-Gg: AYBFou0BUcdqs2AP85QLh+OztGpxtNv6gaqQGnNwYi5maUPlzxYqP71jE/Z+aZxttmA
	2zLoEhjaA+O2CmDJHnzqGjX8qL2ItCiEKBnIiPoSB3DBQ7BnrqbmaV1ca60+UtT6zYIViawDjcQ
	8xDIhkMM0ds2E0HtXNHUl0LHiU5gulib3zkxmR29dpSHW8r0O8uluGMr/vRi2IPd+T+oOO8SX4x
	Y0m60VML/7I7P5LHJbq6LdsFYwQ+dWW52jKjnArhGnP3n2qxbxJAqe4pjUwbpxA57HwG7uCRW5Y
	Mo1hUK55sZcPKm/kvDriApWNmpaYT9u0meIjC+2UjEfNO2UUzdS0esjfseTmX6Ynr97lyLGNck1
	/T3JkudlqDpb9FCFfaFOLmyBd0n+9dZbBy7xcqk9K0BrJqISMmjx059QYKHMnOmKBjdfiCTlIPM
	hsi+m9ftOPDFI1oWLzNLAeZ2jYO5rFHUYMpXZ4o3lT9HtV0uQ4ZMYcnxUSXRz/HofkP1jTf6ykN
	ldD1dl6Np2e2QiqvQ==
X-Received: by 2002:a05:7301:b13:b0:360:dfac:6817 with SMTP id 5a478bee46e88-361a18632fdmr6512862eec.18.1792315629172;
        Sun, 18 Oct 2026 02:27:09 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c2c:5bac:6f4f:b477:6604:1f68])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360826875b3sm23637101eec.21.2026.10.18.02.27.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Oct 2026 02:27:07 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com
Cc: gregkh@linuxfoundation.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	himanshu bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH] staging: sm750fb: Simplify M2XCLK divisor encoding
Date: Sun, 18 Oct 2026 14:56:51 +0530
Message-ID: <20261018092651.49924-1-himanshu.bakshi478@gmail.com>
X-Mailer: git-send-email 2.56.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace the switch statement with a macro to encode the M2XCLK
divisor in the corresponding register bits.

This is my first Linux kernel patch.

Signed-off-by: himanshu bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/sm750fb/ddk750_chip.c | 18 +++---------------
 drivers/staging/sm750fb/ddk750_reg.h  |  5 +----
 2 files changed, 4 insertions(+), 19 deletions(-)

diff --git a/drivers/staging/sm750fb/ddk750_chip.c b/drivers/staging/sm750fb/ddk750_chip.c
index aa78d0bc1..2cb849dea 100644
--- a/drivers/staging/sm750fb/ddk750_chip.c
+++ b/drivers/staging/sm750fb/ddk750_chip.c
@@ -109,21 +109,9 @@ static void set_memory_clock(unsigned int frequency)
 
 	/* Set the corresponding divisor in the register. */
 	reg = peek32(CURRENT_GATE) & ~CURRENT_GATE_M2XCLK_MASK;
-	switch (divisor) {
-	default:
-	case 1:
-		reg |= CURRENT_GATE_M2XCLK_DIV_1;
-		break;
-	case 2:
-		reg |= CURRENT_GATE_M2XCLK_DIV_2;
-		break;
-	case 3:
-		reg |= CURRENT_GATE_M2XCLK_DIV_3;
-		break;
-	case 4:
-		reg |= CURRENT_GATE_M2XCLK_DIV_4;
-		break;
-	}
+	if (divisor == 0 || divisor > 4)
+		divisor = 1;
+	reg |= CURRENT_GATE_M2XCLK_DIV(divisor);
 
 	sm750_set_current_gate(reg);
 }
diff --git a/drivers/staging/sm750fb/ddk750_reg.h b/drivers/staging/sm750fb/ddk750_reg.h
index fe412ead7..b796e32ab 100644
--- a/drivers/staging/sm750fb/ddk750_reg.h
+++ b/drivers/staging/sm750fb/ddk750_reg.h
@@ -312,10 +312,7 @@
     #define CURRENT_GATE_M2XCLK_112MHZ                (0x2 << 12)
     #define CURRENT_GATE_M2XCLK_84MHZ                 (0x3 << 12)
 #else
-    #define CURRENT_GATE_M2XCLK_DIV_1                 (0x0 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_2                 (0x1 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_3                 (0x2 << 12)
-    #define CURRENT_GATE_M2XCLK_DIV_4                 (0x3 << 12)
+    #define CURRENT_GATE_M2XCLK_DIV(divisor)          (((divisor) - 1) << 12)
 #endif
 #define CURRENT_GATE_VGA                              BIT(10)
 #define CURRENT_GATE_PWM                              BIT(9)
-- 
2.56.0

