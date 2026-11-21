Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795268375;
	b=QdxKiXUKawNqJjvah6UNEMrqNpHcnBm7JU3Pm0rEfQgTPFcKN8BV9kBSQ9iURYMp9f2Z
	 7unirqfUE9M7WOMdZRzk9gTyGSWEzgX7/sRkT1UN9HMgGZkm0qPNPq8aR69kz59Aud+9i
	 vkYN9fLiBtPIOx3O7aoOo+X7AyYiLcqeoNTqnZ2RXJL9rVz92jEI+UgE/q5JXwdIWT1X1
	 0DPO8M2VZuibiCzkdJW6xOHJTZs9AxxuhGTmzyxvjJYJASvKjmVcnUGmRbTw4KrBz0uU9
	 LUSOjXKrb5GaxSNi3DG/O9tqXdgMBexuyFiMLP5icMwAf4CKPdu5bO8lHjTcT9plxhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795268375;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
	b=KMmsn9A90WcLH0+Fmqkvstft5VR2EUI2bfDl7H7h7j0fgZ9XdOLjspr9VOeGCKGNLMwM
	 5HYqpGd5dTOD58s3YRYMN5UVN+vodC/gHQJ+NlD4LxqEACv58/qgSGxoLIRuML5kM0HSq
	 FeGuVo/C5Z85ohvyk9gWHw9/q1YG2d4FjoOPKdRaXsU4e6SpluH+jZXJmUN0JeMN9JTmr
	 HuCFyNUityvTWODCuV4J+snZLq+fQlOSnLSTpwQrm6xFtllwBEiXOw2kt15deD6aQd8PO
	 ZncnS6lg9dgWjwxRnfNq3LflcAKLHT2UXNHgX7VFbSBcN+/sCrf+t6gdSmdI7IyQ5Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlPQg+Wo;
	arc=none smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EE1F606A32A
	for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 13:39:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EE1F606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GlPQg+Wo
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2f037bc348dso16127915ad.0
        for <linux-staging@lists.linux.dev>; Sat, 21 Nov 2026 05:39:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795268374; x=1795873174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
        b=GlPQg+WoMOg9wlmSQ6RiCE/68KoVSopM47DQrJ6R0ISVXuo2WfOK+xZ/CxLpQDve/B
         N/7V/9uNuPyWr5U9ym1LkxvlLzfZQLt3Kl0RXij614YNNXKINjQtCgedNVA3aV180WKr
         vcl6WrGhTb49OxOu3prjlbaSxs74QPA8E1+VNHe0DnrwaKcHJDZGZ+0tZa52fYCm9+G0
         hzs57xc8klGJ9icCbPjrRjs/mbKlhLD8g/ggjm4C6S48HGpvq+6Np+ldJ9+9gSPoCdiA
         jqmQotygdTNji17T2nD7a4wX/dULXc1tIQIB4QucWsuBfdlKfTBvF6m54/BQ24tHQKXZ
         T68Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795268374; x=1795873174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jpAB7bN4jOX4zDM3zWu+BqiTANE8OqvGyHkfG0EgWp8=;
        b=AjySv1qhLEIgvTfHULWe6CQT7VQcTTMFZ19sfXeO0yv5x/fezMQmkd5UOwu0d2O1Ik
         mzXdUy8pP5klkf0WA6XsBAtP6txT4C6fGJzMBG0Lsuq0FJhvxVdERpb8CdAGrC/fXF3m
         z8yp+DdwiEqpK9wtZjOeUqMm3BpJImozjw/Cm69bcIWJPN8zwSnVPrin5ZFyj5v0H8Fh
         sBovbKEoLA+wUZ6EeKk7F7VoN1vyXA+D426OLtsd31rJlTsbDDPCVjHmG97vKWcFs9pc
         f6PxvPEF1JzQbjREvm9lDqjWBiQ1vgxpsikfwTbov+/nZPv+21bKsYGHUq1gQPeJsnbq
         iVqw==
X-Forwarded-Encrypted: i=1; AL+hErGeZKvV3SD9CbPo6EPIbqRizh82K+CT4uCSmDcIlCqEwXK4fEG+IjEqIWIcZfwr0HaqJLtjG2EY3rR+Zsr3@lists.linux.dev
X-Gm-Message-State: APuU4Z9Z1Y98ehtlAm4BjajgQd7gGsQvDaIr8if5K+3C10kgIuEgqJ6k
	vIHgBR+Gfr8oTC6fpOmeq9ik95oXjQgIpgdffXjWupenNfn2WqEeteIw
X-Gm-Gg: AZFdTZfBSecJwZknMcT+3XZmsI8ivnhofiAN1t6RALUsW7XFP8T2bstLU0snvMi86q9
	jl3zZ1Gy9tBRN1+3bfDip2OJpfOEeuSQhndTA4QKVlS2IBIoKRKP3IOpRVsTEDsp+EPCTDKis8b
	67RC7A8J9XX/p8nTink7BffRp5oDvnk0Ab+A42cuoOEClMjEjR2VHTvcBv3KIdoiXUGFHN/q4Xh
	upVDD5bFD/bII2+8eyxNDDcvLRnSzgueZdOs24Xm8a1svQusCQ6yCaGR/XlkaXLMWefidN5awCb
	zSKyiQ+FpepDwP5mItOTIi1PZ5uKecRgCvraWcLn4pEBK+d8KchOyJ4Nu1e9UC0WgDrJvvo8j4g
	eIiNwNfz++mGp4yWCfFqCg/wevIH7ZzX0BYizK72Cos+nb39HwAdPCcXNKN2b1CO49dFBaQEaBg
	Zz8f1omMuXEbL6ruC9AtvzNae24wAlVf+0giPO9X6WWMrgpmXfOcerNtuKmF+5seif2eJl8nbr3
	av8pjvL9lYb/ucurHYppH6bCnk7FGsryVCRXUz4Xft7opvnyF47wk5rkuJXbPoBhzVKS5dyawJx
	Q2ihmFuB5M3ypn0q2TOyM/vh2kMW9zuGs8Thi6c=
X-Received: by 2002:a17:903:98b:b0:2df:aed3:2ac0 with SMTP id d9443c01a7336-2f03f1cf5ccmr67862115ad.10.1795268373920;
        Sat, 21 Nov 2026 05:39:33 -0800 (PST)
Received: from omarchy ([14.139.177.146])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f03f0de00asm26621375ad.35.2026.11.21.05.39.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 05:39:33 -0800 (PST)
From: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
To: sudipm.mukherjee@gmail.com,
	teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org
Cc: linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vaibhav Chahar <vaibhav.chahar26@gmail.com>
Subject: [PATCH] staging: sm750fb: Use str_has_prefix instead of strncmp()
Date: Sat, 21 Nov 2026 19:08:43 +0530
Message-ID: <20261121133843.127718-1-vaibhav.chahar26@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using str_has_prefix() is cleaner and more readable than using
strncmp() with strlen(). Also avoiding the possibility of errors due to
mismatched string lengths.

Signed-off-by: Vaibhav Chahar <vaibhav.chahar26@gmail.com>
---
 drivers/staging/sm750fb/sm750.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
index 99d410e18..658e93b27 100644
--- a/drivers/staging/sm750fb/sm750.c
+++ b/drivers/staging/sm750fb/sm750.c
@@ -854,21 +854,21 @@ static void sm750fb_setup(struct sm750_dev *sm750_dev, char *src)
 		dev_info(&sm750_dev->pdev->dev, "opt=%s\n", opt);
 		dev_info(&sm750_dev->pdev->dev, "src=%s\n", src);
 
-		if (!strncmp(opt, "swap", strlen("swap"))) {
+		if (str_has_prefix(opt, "swap")) {
 			swap = 1;
-		} else if (!strncmp(opt, "nocrt", strlen("nocrt"))) {
+		} else if (str_has_prefix(opt, "nocrt")) {
 			sm750_dev->nocrt = 1;
-		} else if (!strncmp(opt, "36bit", strlen("36bit"))) {
+		} else if (str_has_prefix(opt, "36bit")) {
 			sm750_dev->pnltype = SM750_DOUBLE_TFT;
-		} else if (!strncmp(opt, "18bit", strlen("18bit"))) {
+		} else if (str_has_prefix(opt, "18bit")) {
 			sm750_dev->pnltype = SM750_DUAL_TFT;
-		} else if (!strncmp(opt, "24bit", strlen("24bit"))) {
+		} else if (str_has_prefix(opt, "24bit")) {
 			sm750_dev->pnltype = SM750_24TFT;
-		} else if (!strncmp(opt, "nohwc0", strlen("nohwc0"))) {
+		} else if (str_has_prefix(opt, "nohwc0")) {
 			g_hwcursor &= ~0x1;
-		} else if (!strncmp(opt, "nohwc1", strlen("nohwc1"))) {
+		} else if (str_has_prefix(opt, "nohwc1")) {
 			g_hwcursor &= ~0x2;
-		} else if (!strncmp(opt, "nohwc", strlen("nohwc"))) {
+		} else if (str_has_prefix(opt, "nohwc")) {
 			g_hwcursor = 0;
 		} else {
 			if (!g_fbmode[0]) {
@@ -1073,11 +1073,11 @@ static int __init lynxfb_setup(char *options)
 	 */
 	while ((opt = strsep(&options, ":")) != NULL) {
 		/* options that mean for any lynx chips are configured here */
-		if (!strncmp(opt, "noaccel", strlen("noaccel"))) {
+		if (str_has_prefix(opt, "noaccel")) {
 			g_noaccel = 1;
-		} else if (!strncmp(opt, "nomtrr", strlen("nomtrr"))) {
+		} else if (str_has_prefix(opt, "nomtrr")) {
 			g_nomtrr = 1;
-		} else if (!strncmp(opt, "dual", strlen("dual"))) {
+		} else if (str_has_prefix(opt, "dual")) {
 			g_dualview = 1;
 		} else {
 			strcat(tmp, opt);
-- 
2.56.0

