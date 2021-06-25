Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEB5B70
	for <linux-staging@lists.linux.dev>; Fri, 25 Jun 2021 00:08:31 +0000 (UTC)
Received: by mail-qt1-f169.google.com with SMTP id w26so6223353qto.13
        for <linux-staging@lists.linux.dev>; Thu, 24 Jun 2021 17:08:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CtxaWROpfO0bcAlJuni6gQt7KMZIbHvkYw12HLaO8Lg=;
        b=Z3tEldslfajBlOBIvZcga1zFWstbQUobxVYa2w6QENTLa5R84xxlLWDyCTJE/WqOX7
         0s6RgLxbYiA10yc68rUQ3BVxni90/MPezY4+CohHWPEocwNe3GhrNId9sxVJWaGeu/UO
         mZe2DZQ4Xlw6SNrDYrPugPK/HcP/G6GVCM05muX1HTRud0edL/e586uKp8E9H2K/xmU7
         LW6+xeLwA1Tmg/PDaWSfHxOzGKYPoVeuUuvUlRy16O1OuODiOefwNDxBo50b9+2p1RYV
         sCMR3IEHNcN/E6r4BFvF/g5llgQ1hznQwCt1USj5+GaM5F1PmtyEtEXaTC9ek2POI7h7
         xAsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CtxaWROpfO0bcAlJuni6gQt7KMZIbHvkYw12HLaO8Lg=;
        b=JakgdEXZwugxeR+/K6dsEDXdj07eEWVmo0mB89uvbKOvmc7GFdwpknzLw71MzqTrOc
         aQbZhJq6yk93mrl0yFrHgrBaaP6cfdN9kEROHmtDparcimcy2ZjyxXsfl8F0VhZQ4gNR
         Ef9mqolkgO1B4O20pBcQaWhnV9cAGDLRPW0yZ70kyHnxN2VFZytk/pv/Dm5A4SnYNssj
         L3kEzGR8/79yMYlvnk3ADSHASWCyBQlOnFmPY07/X8gczWDPUfM7c4Hk1t4c5RZ8FfxK
         +rTqJCuR6RIUO/y6zJb6wqhdJF+z4IM55vpzGsRY1afg7TYV8hYyA+9gHpRdy5xYAHmr
         9f1w==
X-Gm-Message-State: AOAM533Wwak1bamNO24v7DzsqDwCeT2E7LOpmibbq5NENWbr20kr6qTr
	Ky04CjZNOIsCGReL888Wdk703Q==
X-Google-Smtp-Source: ABdhPJxUwanW+ZIwpK+FVZgJOnbteFLIgqWu8+GVW9mv913bhiQHu7favLbhVfOy1N0EIKtQrkK8qA==
X-Received: by 2002:aed:2162:: with SMTP id 89mr7157614qtc.182.1624579710864;
        Thu, 24 Jun 2021 17:08:30 -0700 (PDT)
Received: from kerneldevvm.. (5.6.a.8.a.a.b.f.c.9.4.c.a.9.a.a.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:aa9a:c49c:fbaa:8a65])
        by smtp.gmail.com with ESMTPSA id m187sm3629014qkd.131.2021.06.24.17.08.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Jun 2021 17:08:30 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 20/23] staging: rtl8188eu: remove RT_TRACE macro
Date: Fri, 25 Jun 2021 01:07:53 +0100
Message-Id: <20210625000756.6313-21-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625000756.6313-1-phil@philpotter.co.uk>
References: <20210625000756.6313-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove RT_TRACE macro from include/rtw_debug.h, as it now has no
callers, and does not follow best practices and kernel coding
conventions.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/include/rtw_debug.h | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8188eu/include/rtw_debug.h b/drivers/staging/rtl8188eu/include/rtw_debug.h
index 72a18ec3ee32..88575c4a4633 100644
--- a/drivers/staging/rtl8188eu/include/rtw_debug.h
+++ b/drivers/staging/rtl8188eu/include/rtw_debug.h
@@ -58,13 +58,4 @@
 
 extern u32 GlobalDebugLevel;
 
-#define RT_TRACE(_comp, _level, fmt)					\
-	do {								\
-		if (_level <= GlobalDebugLevel) {			\
-			pr_info("%s [0x%08x,%d]", DRIVER_PREFIX,	\
-				 (unsigned int)_comp, _level);		\
-			pr_info fmt;					\
-		}							\
-	} while (0)
-
 #endif	/* __RTW_DEBUG_H__ */
-- 
2.31.1

