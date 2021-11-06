Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4202568
	for <linux-staging@lists.linux.dev>; Sat,  6 Nov 2021 23:16:41 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d24so19860038wra.0
        for <linux-staging@lists.linux.dev>; Sat, 06 Nov 2021 16:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IZ/mVLnVEjcxSgetrmyGMYqsYZyZaCCXV6KwPJ0Xu2s=;
        b=RkqL8VMOgBhResrdZPpHrKB3aNjdst8n+rhc7Dv6QdsNNiwglICXJzRqfuxY0yp9EN
         duORt1qV5ebIpDxwS9gpdlaI7YG2RMXX8o+BKKXJu4hfc+rZoOc3GBvX64LNTHRyWC67
         Iym1sqE/95FRJGbmkknoqTCh9Qv4E9bmfOUCP/9GpkVaFDTWeDnlOadd3g1+Fyq2KNJa
         PC9TCpfrZ5pgPSIgW0gACFvrYhbC6ZLd8F5fcpNKaGmAsy5h5NflnhovcxSbLW65qSNA
         RPWAXbCDupTRix68ASj+7LI5RDe317s/kvjN5Ef5RKP1J0xJYZ/fC5v46IJJOpy6XA/w
         LlOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IZ/mVLnVEjcxSgetrmyGMYqsYZyZaCCXV6KwPJ0Xu2s=;
        b=p4NA2surIg4TKuFkhp/PXqDdBHkYqfkC4B5T/KRwb5jqxwLuK7tt21KLBBKavcTQdd
         ufyGu4PNkGzxyQPbNJeDaKGNziOYxKwvAWTQxyyH++d9F1LIwfzvcySS2oxZVkhVF2NB
         Y8YF9LOhC23c1yxM//Is0dEUmw5qDg0zEA4qbVmaHcmClTp9H1E6hlXaRf30TN5LOw/T
         iTFOjVR8DDyhrDgUxJEV8nNOMJ8xA19G/vHF/68qEn0nX3YSvCvnKC8uQwjnbh41/VjS
         NZAchbmqoAvQnlSHnnFR+XGIprSeKigHvS0p9L2+Y1cQJZAi7ViX4/ActbHO/Q7jM915
         M7Cw==
X-Gm-Message-State: AOAM5321VUVRp6OblSsp0fN0oWxBiqBIQPx5jtC2AODZQd8/X4hoDZQL
	3po7ORdzdhHThw6u489F6jmGQw==
X-Google-Smtp-Source: ABdhPJzzTMAz+XqQ3CuJCZFA0d5RS+rno4KgaxH2kXOJ+4jFW3qdhJjNFP+Sj/m7CQk+yBWtI97heQ==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr69651962wrv.102.1636240599736;
        Sat, 06 Nov 2021 16:16:39 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id 4sm16320389wrz.90.2021.11.06.16.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Nov 2021 16:16:39 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@oracle.com
Subject: [PATCH 2/2] staging: r8188eu: remove MSG_88E macro
Date: Sat,  6 Nov 2021 23:16:36 +0000
Message-Id: <20211106231636.894-3-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211106231636.894-1-phil@philpotter.co.uk>
References: <20211106231636.894-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove MSG_88E macro from include/rtw_debug.h, as it no longer has any
callers within the driver.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/rtw_debug.h | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_debug.h b/drivers/staging/r8188eu/include/rtw_debug.h
index 0a77e3e73a45..39b69b9ad0a3 100644
--- a/drivers/staging/r8188eu/include/rtw_debug.h
+++ b/drivers/staging/r8188eu/include/rtw_debug.h
@@ -66,10 +66,4 @@ extern u32 GlobalDebugLevel;
 			pr_info(DRIVER_PREFIX __VA_ARGS__);		\
 	} while (0)
 
-#define MSG_88E(...)							\
-	do {								\
-		if (_drv_err_ <= GlobalDebugLevel)			\
-			pr_info(DRIVER_PREFIX __VA_ARGS__);			\
-	} while (0)
-
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.31.1

