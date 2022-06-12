Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8196DA52
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 08:12:54 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id kq6so5599403ejb.11
        for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:12:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jRyy5hKQd+kqHmg467ZxRJ79p2wfYhLJmjkerJiKcTo=;
        b=EZWh2CfzXf2OHYzHXos2/i9pv35MMrNJlIFIh2ELSCd0L5dRJHCe8f5DSrLNHQQeLB
         Ef9g2xV/rKGJqAF4H+hmSk5Zk0nd4yIMF+5BD83utIOiCqYuiOE1nmKMM2Vjxe9GLeGH
         /uBErmAywS983NwgrXId47TdwnUCM2OougHxI/Fi1FHbTKuQBdQNGNXc3Q4cwkddQG/P
         k7VCJMs1Kq57Sp2lK3rFiGmg8VJDqASCDVkEEyCLp7wLYr60bbcjrLzjYHQmsQerRkbZ
         cLp2PvnMgQHEkPqKEWL1bbMWZGjpFq+IZ3vBR+yIbjk0fr9jWXJMLnLQWiDoFJNlAgxh
         UoJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jRyy5hKQd+kqHmg467ZxRJ79p2wfYhLJmjkerJiKcTo=;
        b=1K2nfNPvpTlu0rSKSLbbIZgio2xM+WupmNadrF5JIyyKwiz2F2ac5d/chQXNPKdAxh
         0strvDPAakaZFQ7OYqb4xu2JtbLHHmVNP61DsSe7b1w9Of1g4BO8u9559F+JSPkSVQ47
         J50iOUGf793F9M3B7mEdSfnakBxtgE0PCoPTYdNBwMaMV5aZpwY2RWSbYjAFBt/O19Hs
         nNWKlFHMROKDevCMAoksunZtmemvTUvEs3rq/yDDHEPPQGTL4zgb1vWg5mZrIzLXObdy
         Y20Uan2KEud2LBz8QLYgIWEQ4KJt5D2mmApTI5bUuUyQbEkKWnJqP2ffwJrAUjMfn5Qj
         mHZA==
X-Gm-Message-State: AOAM532Go8kFeiNA61xaT3Q1RJFcGOc++74FGYILo3iCP4l0aO6y00aN
	CVQuh10qW+Cci4yCSiQf/FA=
X-Google-Smtp-Source: ABdhPJznElZmUF/q/STbgt+TqSWw58seYQ+n7Bl8UR6K9vjD0KVMJHYbspUN0iGR4mpp+A+xfHfzpw==
X-Received: by 2002:a17:907:97d5:b0:706:76ba:f28f with SMTP id js21-20020a17090797d500b0070676baf28fmr46994279ejc.367.1655021572728;
        Sun, 12 Jun 2022 01:12:52 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:bcf1:6e8b:57bb:87f1])
        by smtp.gmail.com with ESMTPSA id o18-20020a17090608d200b006ff802baf5dsm2130637eje.54.2022.06.12.01.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jun 2022 01:12:52 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	namcaov@gmail.com,
	phil@philpotter.co.uk
Subject: [PATCH v2 1/2] staging: r8188eu: replace LE_BITS_TO_1BYTE with clearer codes
Date: Sun, 12 Jun 2022 10:11:43 +0200
Message-Id: <4cdacd703158029c0b0f706e3cf1eb8daf4121c0.1655019752.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1655019752.git.namcaov@gmail.com>
References: <cover.1655019752.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The statement LE_BITS_TO_1BYTE(__paddr + n, 0, 8) is not obvious on
what it is doing, while in truth it is simply reading one byte.
Replace these with clearer codes.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
index 20d73ca781e8..79e4210c6b65 100644
--- a/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
+++ b/drivers/staging/r8188eu/include/Hal8188ERateAdaptive.h
@@ -26,15 +26,15 @@
 #define GET_TX_REPORT_TYPE1_RERTY_0(__paddr)			\
 	le16_get_bits(*(__le16 *)__paddr, GENMASK(15, 0))
 #define GET_TX_REPORT_TYPE1_RERTY_1(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 2, 0, 8)
+	((u8 *)__paddr)[2]
 #define GET_TX_REPORT_TYPE1_RERTY_2(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 3, 0, 8)
+	((u8 *)__paddr)[3]
 #define GET_TX_REPORT_TYPE1_RERTY_3(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 4, 0, 8)
+	((u8 *)__paddr)[4]
 #define GET_TX_REPORT_TYPE1_RERTY_4(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 5, 0, 8)
+	((u8 *)__paddr)[5]
 #define GET_TX_REPORT_TYPE1_DROP_0(__paddr)			\
-	LE_BITS_TO_1BYTE(__paddr + 6, 0, 8)
+	((u8 *)__paddr)[6]
 /*  End rate adaptive define */
 
 int ODM_RAInfo_Init_all(struct odm_dm_struct *dm_odm);
-- 
2.25.1

