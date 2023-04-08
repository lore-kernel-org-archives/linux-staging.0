Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57A0C2E4
	for <linux-staging@lists.linux.dev>; Sat,  8 Apr 2023 08:18:37 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id ik20so576244plb.3
        for <linux-staging@lists.linux.dev>; Sat, 08 Apr 2023 01:18:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680941917; x=1683533917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=bVLjHTnOtdfrJmTguxNf65pHe59NsHzZRHirsqU2kkI=;
        b=LAkalLbOacgneAq/9b8eeeOoWRMpWZze5EjlrBhbPhcJu8WyMkwdeaBsZfHX+WNzMD
         dz60VvUvcmOQoLrqDopgqWu+mtWYcqPHmaKFZh6gIgVIS5mgiZIfczY1SRXgPV2SobAa
         3eYpJfNCkhxRQoZ62c71hVvEcmZSMdFk98VqqTPaKPSMsfjLmoxHX6E2V0O/Gzmso0W5
         Pxd3kwS0pi5f2esDq+fSIGIpLqW939GitYraC8A85/XLgRLnURCPhE5QV6/Qxqz+a01y
         onWw2G55D96NGWu98LyYc93v37bITK4fBllZRVitQlyvdYTzWjCrQTShJrlQrldetbC4
         w2Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680941917; x=1683533917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bVLjHTnOtdfrJmTguxNf65pHe59NsHzZRHirsqU2kkI=;
        b=nwo8tJc1d5oFYg7HO8pBAz1A8RMgAkD8gPuJst9r11S/SBWC5K6vOLc554whxJgktR
         mjd+GDsyxtnFqhnbozXY6wS+FWDQQYOd3Y4xlE1euS1QPW0qI5JFVfMWmcx0+mTdJvAi
         fJkgE8sWj5n77CoPiKKxDCryADn56oT/kLkboNmrYxdGgCibt0JM7DOEHrf9qnsE6G5o
         WLPsMkVdbmvI//ZchoWC0FSETEUTEPdfDb+KsXyyufTikC1oB1TfCTTrsy5Z0QITIFH9
         Ngb1Mkf+tN4tJ2YfZjBc0oSGOBEgfIxuOMspm1DXsaC8imBQNelpzR0An66kUFZIxYIR
         qd6g==
X-Gm-Message-State: AAQBX9ehBz3v6NCoFqqp1e7dpvpgEQViqa3eg2WDaPY3WF7u4rIqr1cX
	Hc8FIoV8jB36z3ODxqtNX+o=
X-Google-Smtp-Source: AKy350bL0LN8dYz+jJU6fEe9hPwD6r8Q52aLOrCDPnHNJ9uC8agiAAXug61dMxZjdY0aZTUZ5aK/dw==
X-Received: by 2002:a17:90b:3b42:b0:240:1e0b:a7b7 with SMTP id ot2-20020a17090b3b4200b002401e0ba7b7mr1780396pjb.39.1680941917202;
        Sat, 08 Apr 2023 01:18:37 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:8475:d375:707b:4600])
        by smtp.gmail.com with ESMTPSA id 14-20020a17090a08ce00b0023f21584dc7sm3796658pjn.55.2023.04.08.01.18.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Apr 2023 01:18:36 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH] staging: fbtft: fbtft-bus.c added params
Date: Sat,  8 Apr 2023 13:48:17 +0530
Message-Id: <20230408081817.81562-1-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Added cpu_to_be16 param in define_fbtft_write_reg

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>
---
 drivers/staging/fbtft/fbtft-bus.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 3d422bc11641..228a5430c1d5 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
-define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16);
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, cpu_to_be16);
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.25.1

