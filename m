Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08A6C3FC2
	for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 15:15:05 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id r17-20020a0568302371b0290504f3f418fbso22195303oth.12
        for <linux-staging@lists.linux.dev>; Sat, 21 Aug 2021 08:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BkGMZ34uMM076CqdGEC8S8YY15+qTIP2Tw/OLNLYTmg=;
        b=mcKvIw9yRGBgXT5GXZOPFt2skeigfvum9BkdU3kIKKPgqfCfWX19WZd7sJ+rmTUimw
         5jRmhN06NVSEi8DN3GDJFaR//YwBFOvRaao4HeZicSeZCFiUMcmPiN6wtkaHRfcK+cRI
         Vtrb9yGPzIBy4aSZ0BeePZqEN1yEL4U9o+8j2U+uhxNxsTIocMUTS/KQirkgVOf3OJe+
         j7V4TiZOt8zCoE+YSXlzz8oATGoCnm7orTJuw8DsSauUROWY4eII7VdCmDQerFrQsguY
         F9aC9/Zh7rSKqOCGS0TFSMX/KU2tg4pkUKKSP0KXaNHGwju1PRFO+syvW2HvM7f9riJS
         xJxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=BkGMZ34uMM076CqdGEC8S8YY15+qTIP2Tw/OLNLYTmg=;
        b=oKJweTO8i38MTB+FE8eUDJ1uTWE8C2Xul8MaIZN0q6JiztophGDvSIUv6fBA1QfIl4
         mLHbSI0jdzerwUGRkugaOaa7Jljv4rG+B22aaILSolOVld/zntARKBBM5/4SdLaAK+U6
         Z9xGCs9psMpLIroL3m/k7H5N5Tsszv9okpK9yVv1N2TwYP0v/xo+uROM0zoKyP0AyTWv
         Mkl7sFgC3tFcmLWruQda6gXhDlPhtozahZneAzD6a/pXeICrMkqbxZWrqtA0nHMTLvHs
         irzBxjsmFeUdlbVXxyVIyLNu1ffiq4KXADNXkESDeycqstMUVN0ZS56g+mD0SO6VmK0y
         fZnw==
X-Gm-Message-State: AOAM533rALUKJDaa0sPsqCi3zWBJpKNGiI4esFu5lBRFbav9TbY2oTAo
	WvjoA5ewUIe5Bge4SHPv4Mn8PACXKN8=
X-Google-Smtp-Source: ABdhPJyggAEmiw3FC6imvIiDWMlqQhavkFEGcST1kyML3a6WN60sILSwH9g8rc7qcFitKivh8BqxfQ==
X-Received: by 2002:a9d:1b5:: with SMTP id e50mr21789096ote.76.1629558905296;
        Sat, 21 Aug 2021 08:15:05 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-1023.res6.spectrum.com. [2603:8090:2005:39b3::1023])
        by smtp.gmail.com with ESMTPSA id c14sm2326897otd.62.2021.08.21.08.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Aug 2021 08:15:04 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>
Subject: [PATCH] staging: r8188eu: Make mult-byte entities in dhcp header be big endian
Date: Sat, 21 Aug 2021 10:14:59 -0500
Message-Id: <20210821151459.26078-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 16- and 32-bit quantities in the dhcp message definition must be
big endian.

Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
This patch will set up all the reset of the endian warnings,

Larry
---

 drivers/staging/r8188eu/core/rtw_br_ext.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index ee52f28a1e56..62a672243696 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -640,16 +640,16 @@ struct dhcpMessage {
 	u_int8_t hlen;
 	u_int8_t hops;
 	u_int32_t xid;
-	u_int16_t secs;
-	u_int16_t flags;
-	u_int32_t ciaddr;
-	u_int32_t yiaddr;
-	u_int32_t siaddr;
-	u_int32_t giaddr;
+	__be16 secs;
+	__be16 flags;
+	__be32 ciaddr;
+	__be32 yiaddr;
+	__be32 siaddr;
+	__be32 giaddr;
 	u_int8_t chaddr[16];
 	u_int8_t sname[64];
 	u_int8_t file[128];
-	u_int32_t cookie;
+	__be32 cookie;
 	u_int8_t options[308]; /* 312 - cookie */
 };
 
-- 
2.32.0

