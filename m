Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793006682;
	b=kMr7OigGgyJj+sxhyqFgoay28x3BK3qs4iqSIbcTGn8Cp4jyGIf+YmCgAIe09Eroh5pM
	 Zzy/wOlcNBjgWqAEmuDOysnh1So73jhPoVs2Hz6F72S9PCg5Bm0F8TN4IXX7GAstVkgEX
	 iIfJmAbM+GGke1hnOVcmZdPw/+uIp262WZOwBFwoVI3RG8hIDmMuOWzpR/VZmszrZtLGM
	 5yd6/SMj+PeObmXW3GHTBu5y+kybT5KOhCcOvJ7WwhA0p5ZfhwisOQfR5SCy/Obl581Z7
	 E1cqHJO/NtKsT2lDnEcYsTzXSrug6oiRLAovoYKuUuTaWVzxvi3jnoixnUU+sJVqfGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006682;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
	b=5LtXWQdywvELTJl2xOUPr8C3a3GgyM5Ofi/MinVd8ABX4UynUlfLKgr9VDL93JY6OooA
	 jt8aax66D5tPWO61xYpgn88yjZU9SDmelv1pDjkk8A4NEnQNpB6u0oLQpepSLfdFxMmyT
	 QnEVTv+qjgkFySIhgwjzOqTwseMpbd38CmkXnouKIMBPI7Fi6sujuX4RHgALBOBtspRFy
	 UNTSICSdHyp2blGBYvm7eUIecbHRe4XRu1o2b/q064LNRH4hPBIgHzsAMpt3aEuyzwuAL
	 kkhdJnndKxXAHU3fcIsfV4XvwO1CpXSgZlq87sDVXc/dETU98+yaP+CMNyj5PT6aUGQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z8wwkcob;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99B87606A31F
	for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 09:24:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 99B87606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Z8wwkcob
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-369f33df08eso2431008eec.0
        for <linux-staging@lists.linux.dev>; Mon, 26 Oct 2026 02:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793006681; x=1793611481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
        b=Z8wwkcobXDOQN491vS68LgSinrMLClhV5qIP/mhwjv4LpEhDycapKNuGv/7Ru79cy1
         Fwb6StVGc0ioXuOdTY9R1MLQNfug89zhcmuK4hiBMmS2u+1NTaEiSQgif6D8LyFDL1Bd
         xr28agq549ovPEOwfyQ/d2ZURSAiO9llbFUh3rs2f1O3VSWAAYWn7bu5FfHoHg2LhIw1
         OHrbVDHZ0sE8OF06nESw7xDKUg6hoW6puLGSQFtmRiBu1KWsVfeLc2veuwOQw+WmBQyu
         8UT0aPKflweHCzo20/QP1bxNr/eDkGUSaBgEW3TyMXekTMyH+epV7Y+p0k+JTvPuRuf/
         Q7TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006681; x=1793611481;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EKnTU2YcJJTvtAtaAZdLOGPL4mJYMsQRUA55KN9Oiyc=;
        b=zInkUJNGa/IkUAd8e4GBldccD8+QoYkl4cbCeNQUa9W9JgtBR87khSNRzNUdan5uoC
         POAu8vkHcnJLxw7QrdY8RVA2bz5v2UKNLjIHNvNObCMDIuxpMVl47PrHdcxe4ZFihFET
         ccwRb4O7m60hqXeZ2jU2f3Q1GFYLhVrsb0zWOemScLpr/H7Nrnm+eUI4qQqCnR0Y/Yw6
         Dqx7rdEywDZRdkyzyRX35nxDeY089RZBB9tjFhZcHKnRTJj3/hjsxv9DLqKXepQCr4r8
         m+oatIGQamr4NpO8/CtNBKUN7H+WjT5e1+GoduRlnmNS/n4Dks8p1B8Or8RbdAIKo+xz
         ILJA==
X-Forwarded-Encrypted: i=1; AKwUvByhIfl9pvaQUME4zyyXDToU5LWp57PNKLxt3JwdJgGL2fT8f/0NLPTXbYe8u53HRBbB4xmxcS1uL3lh9Qsh@lists.linux.dev
X-Gm-Message-State: AFq9FYJSanIA+ZxPEzQAX27xl0ub65g10AEbZahEFO+StOHlE88vYxzy
	yCPxOYTFmPU8b4FslADG1DHRIZGtOBCVt1paFfq5N0vCYtSUQp25Li8d
X-Gm-Gg: AYBFou3vA9p8GmF5TB/3Qv4jEr/xMVxbet/U0uEOyCmOiz+IGmXsvnIgj6NV2q43qww
	HNGwCFnfrmU+uioHY4xhG9rDOBHp02iQYcGvGb2xpRfaFQsozdcdc1CHlrT+qGiCt8e5Jc1DlvG
	badZx+CLex0nOk5nZQ5RSWmC+WorDWvkCngvRulegg/qVSGLugAbgcfTkg5giER5zuqa1h1Lej8
	pdKTGHfrATzGVrHsyQXPxROQ1iCviGu2t1W5X7oue+GnmrPoLOqro7mX2TZdgIB/fQBSFJNLglL
	NBrQFnrlwIE/dRNggkUN0TGtZXUV3v5bVFPNQndDTap9fMyRYMPppiUWhoJMH2mOoK6gkRfvEly
	J7+XSzoePUvzkz/wxUPUz7nqa83Ad1iYmgW/RbMl7ukUjeCR0t3qYSN1chuSW3kA0ynGNvy+QAO
	ulc4uHODnP1YI5rp5BEfaGp8DxjrKl7qPY3alEZEyjokl+0zqP8zHWPavgKvX7ggqMc+wZUsSXK
	8RnsAFzK5nSvXm61wsk58C1HdCQ/cgGBBMn5t6yiIAKkm9pqHx+0gv+fwocrxi1lwHXrXS78+U=
X-Received: by 2002:a05:7300:fa17:b0:369:fcbb:4d4c with SMTP id 5a478bee46e88-369fcbb4e9dmr4419186eec.7.1793006680504;
        Mon, 26 Oct 2026 02:24:40 -0700 (PDT)
Received: from himanshubakshi ([2401:4900:1c9b:1c1b:d646:355d:1105:8655])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8c576ebsm23648985eec.3.2026.10.26.02.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 02:24:40 -0700 (PDT)
From: himanshu bakshi <himanshu.bakshi478@gmail.com>
To: andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: dennylin0707@gmail.com,
	cenzhang@linux.microsoft.com,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	error27@gmail.com,
	Himanshu Bakshi <himanshu.bakshi478@gmail.com>
Subject: [PATCH v2] staging: fbtft: Remove unused fbtft_init_dbg()
Date: Mon, 26 Oct 2026 14:54:23 +0530
Message-ID: <20261026092423.66168-1-himanshu.bakshi478@gmail.com>
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

From: Himanshu Bakshi <himanshu.bakshi478@gmail.com>

The fbtft_init_dbg() macro is not being used, so delete it.

Reviewed-by: Dan Carpenter error27@gmail.com

Signed-off-by: Himanshu Bakshi <himanshu.bakshi478@gmail.com>
---
 drivers/staging/fbtft/fbtft.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft.h b/drivers/staging/fbtft/fbtft.h
index 40a7567df1eb..16459e4e0ba0 100644
--- a/drivers/staging/fbtft/fbtft.h
+++ b/drivers/staging/fbtft/fbtft.h
@@ -420,13 +420,6 @@ module_spi_driver(fbtft_driver_spi_driver);
 #define DEBUG_REQUEST_GPIOS_MATCH   BIT(30)
 #define DEBUG_VERIFY_GPIOS          BIT(31)
 
-#define fbtft_init_dbg(dev, format, arg...)                  \
-do {                                                         \
-	if (unlikely((dev)->platform_data &&                 \
-	    (((struct fbtft_platform_data *)(dev)->platform_data)->display.debug & DEBUG_DRIVER_INIT_FUNCTIONS))) \
-		dev_info(dev, format, ##arg);                \
-} while (0)
-
 #define fbtft_par_dbg(level, par, format, arg...)            \
 do {                                                         \
 	if (unlikely((par)->debug & (level)))                    \
-- 
2.56.0

