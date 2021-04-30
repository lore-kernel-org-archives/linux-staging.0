Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDCA2F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:29 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id zg3so24103914ejb.8
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=PphH2/8H+P5cJwJ14m73i6+FlL9/uCpid2PmcjUMBcJPbe/QW09FtekQJqCqMgVn5s
         fRDy4tQLC0MQJzdPL2wEZW5wePq1uhJmC3GJuHJvp0eig36ZFXOnES9kZg/uAUkUINvh
         oO06EBMwT1Tz3kXksTZUj5/rUTNHwsfSH22Jm+rmsY5QbEJkB2cXMp9FkcB4ubO2qs4G
         /V9+DvTvD2bG8SRrMgPPgVLcurwoOf0iFu5XrDN2uifHtEaL/ZI5ccdpDZnmpXAzNhxJ
         tZQVWnwJ47BsODUd8PJq6T0D6rAjJ9mJqrCEQ/LhrCXIOVbaa14EfvUYygr5zg4SEZLk
         h0zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rmk90qSfuSLmAzINt8x7JaHcuQoCwpmT2qAtZaxL5BQ=;
        b=p+ByyDHIwK7oca2mvl295L+obVIdv6cmIfDKgriEzXY7YFtMehI1bQXqFAlwhjqdFV
         Xxm1SQMDiL9p/GT/JajlngP3+wgeShkHgwXjjFonyC4zOO0Ho/pdGgJDO9bsomz7u8wB
         btq0mc4HOyzTV6Bzv0biaSKi1Yclk0yYy4H3fM+iBY8Nzr5//TSbOh7vhVTNthHHg9Oa
         GAH2cRt1vbVhlVzKmRsLeTmJw0ahDWQLClH2gzMkO+GDPZoLhZXAJUsNUGz2+ycVe6vW
         0dYKTvOz7yjNAC3Mxa4JKVGKOA7InCbEHmlGVsU+mEl5j+k1Aijv3BPumVI6TnHU5cis
         SRkA==
X-Gm-Message-State: AOAM533AW7FI5o866UevK37YgcW5flke7XZr0tuKKBc2ZHiBk8Zb/nVT
	ObT7CP1mqGO9IH28f66IURo=
X-Google-Smtp-Source: ABdhPJx1mZfvolsLdk0xnF8EG8Nh2WG0bKiyCqdf0SW3r3uiK38G2R9XnBNPSC/xL73KWYtkasaz9g==
X-Received: by 2002:a17:906:7806:: with SMTP id u6mr4634207ejm.130.1619794648021;
        Fri, 30 Apr 2021 07:57:28 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id dk13sm1560764edb.34.2021.04.30.07.57.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:27 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 13/43] staging: rtl8723bs: remove unused ODM_dbg_enter
Date: Fri, 30 Apr 2021 16:56:35 +0200
Message-Id: <b52f307265b7662bc6a02eac56dec92b3613a58c.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove unused ODM_dbg_enter macro definition.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm_debug.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm_debug.h b/drivers/staging/rtl8723bs/hal/odm_debug.h
index cd68c583699a..7c9a87fb8e51 100644
--- a/drivers/staging/rtl8723bs/hal/odm_debug.h
+++ b/drivers/staging/rtl8723bs/hal/odm_debug.h
@@ -97,7 +97,6 @@
 
 #if DBG
 #else
-#define ODM_dbg_enter()					do {} while (0)
 #define ODM_dbg_exit()					do {} while (0)
 #endif
 
-- 
2.20.1

