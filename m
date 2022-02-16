Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 435F41847
	for <linux-staging@lists.linux.dev>; Wed, 16 Feb 2022 01:07:21 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id d14-20020a05600c34ce00b0037bf4d14dc7so506832wmq.3
        for <linux-staging@lists.linux.dev>; Tue, 15 Feb 2022 17:07:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=unwxR8WWm7ag8THNs5ELWKzhcrTV9g3QkZLSvlnQSBwpWf8FaRJ1P5vPfGhvb03Bxm
         qiV6dRd4sscYsoEZlK51aPyFdgEnI5TA3ryd9NVIOp6ELHa3Je8Wx/MgKapMxnX8+zFC
         tha9Z8j9kzhBLQx4kkhPeEhUy+to683FyHf4YhF1ZibderZdFs1w1Tcq/iG3Ap/F0CLs
         /6C9l7+d9Wf7X9iljmgol9N+ZQgf2sFqDMgFPGggs9N2riO1rBpHFrM8IXx9u+21GtnH
         8mkzdy4e/EGxdp3Q9XWUft2+8Cjt2X+M08ztZRy2yvvEPNMa1XuWnWeulULXYS7gOEmj
         PArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=OaYOs0u10AjMXW75dsHEtQV5TCT0BQgR9BACYocAVQ74haRfOidmW3tnOHxgSQj3cx
         Bui+PG7ss3IzzHpuvDSEkjhaxL+cxPHctziejOwR9IS/BOLlEFDA4ASbccKjvxIXp0D/
         EDpyKin3MOfPCiLSG8sTw1a2QQKw5uh+HoUsVFMWOig6gFrg/eMNyZCCzWqnyplftFbk
         pfpLhUdQ/YJc+g/WCV6rIhHPYlmJF9rWxiD0+/jFTrbx5Bsk8KOaJqCm+VBOikwSvalC
         BC0+RsfRwEKUOZLlMfxfTvgYVOZuTYc5lZGJnwifDhHxGsgiIIXREq0bqVcAuwpYTp4s
         K6gw==
X-Gm-Message-State: AOAM5328ovV+JAQlM8oWwH4QjqWXIY6EjMCQhlBg6k+MUD15g052jO8r
	P2LoaTaoDniyo2Dlca6OCintMw==
X-Google-Smtp-Source: ABdhPJwmgkc8Pceapw6vfah49O7mao+Bg49sp3kmyHae27wH2ipTs30Lnt1yFrFLfJCN6TBCf9TrXw==
X-Received: by 2002:a05:600c:3588:b0:37c:306a:9eb7 with SMTP id p8-20020a05600c358800b0037c306a9eb7mr4872102wmq.107.1644973639777;
        Tue, 15 Feb 2022 17:07:19 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id m8sm10551185wms.4.2022.02.15.17.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Feb 2022 17:07:19 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH v2 10/15] staging: r8188eu: remove DBG_88E macro definition
Date: Wed, 16 Feb 2022 01:07:04 +0000
Message-Id: <20220216010709.791-11-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220216010709.791-1-phil@philpotter.co.uk>
References: <20220216010709.791-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove DBG_88E macro definition as it has no remaining callers within
the driver. This is part of the ongoing effort to cleanup the driver to
use standard debug mechanisms where appropriate.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 311051757715..959fb6bd25ca 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -54,10 +54,4 @@
 
 extern u32 GlobalDebugLevel;
 
-#define DBG_88E(...)							\
-	do {								\
-		if (_drv_err_ <= GlobalDebugLevel)			\
-			pr_info(DRIVER_PREFIX __VA_ARGS__);		\
-	} while (0)
-
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.34.1

