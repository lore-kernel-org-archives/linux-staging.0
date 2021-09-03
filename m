Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0DC3FDC
	for <linux-staging@lists.linux.dev>; Fri,  3 Sep 2021 19:05:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id g18so67580wrc.11
        for <linux-staging@lists.linux.dev>; Fri, 03 Sep 2021 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JGbmNNalbr+0cEXhwNEc9zJ5EBVfAOBKHrUSQH81oqg=;
        b=NUqcmH7tkkJUcvokrQL2+dtXXqpMI92FMGo8W6Uti26j3dqLpFvMF52rvsD1ceRCvr
         Z22wrC3blIdzhlyWt2mmY8S9+fxx32XZ4TMYTsRLLbMoNn8VeLqmk7SNP1r4r69mVdrG
         6yt7+svdGbdpSxIVA50SDHfYPyX9qp7ppAtz9TcQRE9X+alWgfmbHcViku1Zm/2Bnmxc
         9VJXvsdM6S28ipgTKgrqLyMCZ0VxzLaWXLJqN6uzVp153hztmIbxBgDKMG78BpU9ROI/
         Ssj+Ypt3Lbj6AMwrbqEEBkiLAir6pyXzOALldyOxOjeI0eMlaE/YS6xr3GBEXwwA4w+3
         Rmyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JGbmNNalbr+0cEXhwNEc9zJ5EBVfAOBKHrUSQH81oqg=;
        b=dHJDnANcbWc4w/tebj12HHvujWkbyh7l0rKXLZ/Mim8eHhn2W8j8y9ifSfyLH2NsAu
         XQ92WiCFq+1pkmueSCDoj3Mt7a9Ngd/4ewnyUgbJlkdBIkPcQTKeo5XNMhYNXSM7xrZa
         HlbMaEdjm6D+NXu7/HoFYGt7l1QiDWXEMtF4hGG1SH3XF608DqHQsvzH8dxNCSQyHWBn
         ai0CsTaVhcYZA1iOqFV+mCYhN/3wNTiusrg105Zq6/gjyGVoFuZTJ9jZPmeuP2vmqHl/
         5P5WoZpqGLkILTatr05Ais0Ov2xMYd1mU5WOPMLJVhDfCKHdMAHmO3K1LvUj0x6VLMLm
         YY7Q==
X-Gm-Message-State: AOAM531l9mLUqbUv20xBleU0d6X0jDikdJA3CSDv6iDuf4clP3+5TEfv
	aM+7bOjr9X2JwaxmQIUBQcQ=
X-Google-Smtp-Source: ABdhPJyj+8Z2u14LC/Ahj2kqd8exxSEdWXcsYuNl3hdDOw8lrWoFAEfwz5ejaVEfY7MYyP2kpNErNw==
X-Received: by 2002:adf:f7ce:: with SMTP id a14mr580456wrq.174.1630695900944;
        Fri, 03 Sep 2021 12:05:00 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::848c])
        by smtp.gmail.com with ESMTPSA id u25sm229291wmj.10.2021.09.03.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Sep 2021 12:05:00 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/3] staging: r8188eu: remove unused constant CRC32_POLY
Date: Fri,  3 Sep 2021 21:04:42 +0200
Message-Id: <20210903190444.15585-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210903190444.15585-1-straube.linux@gmail.com>
References: <20210903190444.15585-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unused constant CRC32_POLY.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_security.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_security.c b/drivers/staging/r8188eu/core/rtw_security.c
index 48f77c6cf43c..d0586af1abad 100644
--- a/drivers/staging/r8188eu/core/rtw_security.c
+++ b/drivers/staging/r8188eu/core/rtw_security.c
@@ -10,8 +10,6 @@
 
 /* WEP related ===== */
 
-#define CRC32_POLY 0x04c11db7
-
 struct arc4context {
 	u32 x;
 	u32 y;
-- 
2.33.0

