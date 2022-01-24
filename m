Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C682C82
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:59:54 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id s18so16417428wrv.7
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:59:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=2T+hohDmYoqKFEv3Cv8ZgMQ/mKlBK/a8qNahYuYbb1KIy1ff+H7NPM5NU/qqMnh1nm
         //4lCh+8o4FQSiEge38h2NQSPwbd9gv5iK42Ro+jCgnNkMMkwu+L3qKNcCoQiRoNycYC
         Zke4hjtQnFbhjLblnbWF9+46jR/Fn/gM11g0itXYbO0z1YQBjVgPJCCS4SZqc8kDsKfW
         5wmLXZskPAyp8NPOH4SXftDPH1XejxkYq6Otj3iJt6dfnMahe84KAWWUzzkhZrfxdmV0
         tx6q9FGcodrGjLlTUbBfSYTvBvUYxzopL+0wmxFAvE08M+DOsz2R0ZjsRWzblckfAmaS
         hBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=3LaRAtV6M7PK7og0PUH1p44GhiAa0EMXZlr2tsanxj4GFigvuHdwc3OhIgTf3Cf1S2
         4cjFWGxNgcyS32hOrcfTn61eHI35OVu9Cdixrhcco+08Td5yODNc9yY0nT9z/0UEgeh2
         GSih4rol+avd0xwpSuJljwRyFy66dQIWPXOtdbst4pnSvxyi/eDY/+mIsysKdTi19idZ
         +Yo17CI0RV7j5ce9EA5OQoPGXMbdhzYhf2+pmXNm+YRF/SWDzZzYJ3ioHMKZacu4uh9J
         hH3s3inKaW30cCg2sMIBki9nr6Qy8wpm+ubW2crzfWN2VvmnGLHVXIyTSUHxymkffaKQ
         6PHg==
X-Gm-Message-State: AOAM530Emau8Pp4FHxUQh4KgSigYGa2BZhUTawZMs2cl+/GBGtYrltIz
	WJSBVOLllIHE5yBL2LUnaKziRw==
X-Google-Smtp-Source: ABdhPJy11Hr0agn/tCEO9xF86BR6hvSBFE0Vp1eHDkwfZat/mTq+ZWfsDfHBlXjBjUggWwNbAeoKIQ==
X-Received: by 2002:a5d:508a:: with SMTP id a10mr1377854wrt.719.1643065193425;
        Mon, 24 Jan 2022 14:59:53 -0800 (PST)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id b2sm7705113wrd.64.2022.01.24.14.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:59:52 -0800 (PST)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@oracle.com,
	Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	paskripkin@gmail.com
Subject: [PATCH 09/10] staging: r8188eu: remove DBG_88E macro definition
Date: Mon, 24 Jan 2022 22:59:49 +0000
Message-Id: <20220124225950.784-2-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124225950.784-1-phil@philpotter.co.uk>
References: <20220124225032.860-1-phil@philpotter.co.uk>
 <20220124225950.784-1-phil@philpotter.co.uk>
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

