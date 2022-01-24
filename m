Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0493FC0
	for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 22:44:40 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id s18so16363648wrv.7
        for <linux-staging@lists.linux.dev>; Mon, 24 Jan 2022 14:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=ptFZ/MGN5iTUclqldWK8yRdVKiYO5Un+VcwO4DgjfA4TluzTbiidROQZmsG52CfD4N
         zgBB1PAlpLRfC3/ROysfGEI3GxYrvKwuHCFwtlPHE1OOVfsGMqFVLUy8HvdUUsojS08Y
         TLSQX4jFe0cQ/X25xRj+VN1yPe3I9BsW4jvjW9f95YxO/y9HieedO3WH5Svr4ZD1UGxI
         Zs2pgqldHOgojdp59t8YJRkEPCHLuiSpUqKlhQzAy3PrvPXUEqLOYi7lUmMuuXedjbgz
         dk5S4dDyHzDgZrae0Pyavcb5JDrfys/pYexWxeuHqQuEUV+BNxYf9qZtmbRuXSoKGID7
         hI2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h/tZwH09eYlURsU9ovNUrKKrqJAZOzfkUhLGHlZxAp8=;
        b=HdTptDZF1XTUPzymFU+msDReHocTwfSMIhAbzNcGrGTGM7qnRYp2ZeYQlX4C58tani
         yXnoUUpIs6Fyk33iwLa4GW4qvmEMaYuwoF10whgyWSiE2ULoReWqcD3sAxV8qfneNYJj
         SpFHBCmIvLkZKvlEMpyzs+pnD9U0qjLe5SjcCd2Tr3Nfj0J0KEc7CH2JGg3nCWLPYQ5l
         5nXizhM+co3Lttap9SxWXpYaUaBtpxWpJskxiDFTngPJL1ONLd2O0Oj5P5E98oaAEyz4
         0XUsQa095EwpG7s7UdpwBAExfZWhF+yf5HiP+Z7knsen9Q1tNcc8zqWwpzJte/inD/nY
         jqsA==
X-Gm-Message-State: AOAM531y3MVfI+f/zlaL5oPCSpy51E3gsT8u85nRLQ7CskDK2ud03CYm
	L2lzaTph1vhZVNrVvL2F9KlofA==
X-Google-Smtp-Source: ABdhPJy5PWoq5xnwSnDuR+TdcNRfbKgEO02CCgU6iLz39soj9kdjN4AaH8rBrMGny2wziNhoXFQV5g==
X-Received: by 2002:a5d:5046:: with SMTP id h6mr15929372wrt.167.1643064279187;
        Mon, 24 Jan 2022 14:44:39 -0800 (PST)
Received: from localhost.localdomain (d.f.5.e.6.6.b.1.e.6.2.7.e.5.c.8.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:8c5e:726e:1b66:e5fd])
        by smtp.gmail.com with ESMTPSA id i3sm15010613wru.33.2022.01.24.14.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jan 2022 14:44:38 -0800 (PST)
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
Date: Mon, 24 Jan 2022 22:44:14 +0000
Message-Id: <20220124224415.831-10-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220124224415.831-1-phil@philpotter.co.uk>
References: <20220124224415.831-1-phil@philpotter.co.uk>
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

