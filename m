Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C799771
	for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 12:31:17 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id 22so2750293pfv.11
        for <linux-staging@lists.linux.dev>; Sun, 16 May 2021 05:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=x0xy6PuUkITlQEfoESlbsWn5gMjHl7FnBihh8mzNu6Y=;
        b=s0wviXk7J29exHWufG/uNNIOdvGY09XnUQ5x82bdMbQp4sekj42F1o5BcwswmDkE/O
         Lfz3MRYdNpAzFBryF0SntQWSEoGmnJ7YD9MDlmjL3J8uTe1Q1iG4qR6wBjRw9JAr4tnZ
         8w6wbNPXMT0HnLQLTJ3jyMbV2J4IlISs9ADKHKY3LBenoy/J3d6jwzJ0aBBX661uD/98
         n1XpSAPvbHt/nQRWJJ55J9k3VLqszrYg+0+PP+XkdNchJh78NjZZeLbCczHHQeHAX/WZ
         luSrsSWQFP/c4Jct0/MVoHZfsKBdwofBw6UB7DfpkHByVHzBRdZHlZKD2N4m8riTgrcA
         qlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=x0xy6PuUkITlQEfoESlbsWn5gMjHl7FnBihh8mzNu6Y=;
        b=KaC2o01thwlld/ktE3CLnv5qGAVWsLEebRQgVrsTp/yXAB4leH8NpULqm2naOv19wt
         AHGc5YpTZpH3nYyHN+cPFkdFHYSzLoTzZkIsIQMvX0tIhkjAr1rbEx7TzXMjmGYvd3/l
         YdApggFysV3puuC2cgBxt32zgBpH3JDwu/squ6A4DNJAa4+dB5o14aobTwXf1kOzBM15
         S6G7sMb7AP5W5dMHfM/7L6IvwYC3/wEz/N6xxoMfim8bekXHD0ma+Wyi05EUN3CxHU1p
         m0EO+NCmUNyWWsIsY5WmRXC5Hoco+tm9d3MqRi+ulLFkHxf93JXop3PPMeyaO0Ltl4i6
         xwIg==
X-Gm-Message-State: AOAM53305wMp8MowKdnILCdkFYrGb5K/7UI/1QACZzEkNORqzZHg2uQ+
	y33iDgNlc7e4O78RLXsdXUY=
X-Google-Smtp-Source: ABdhPJxPq4HzW12Ya8whpnivanq2aAPrdMRCl7um6mnlk7hqM0KMJHtih/MYIonSSJ+A8X1G25nt+w==
X-Received: by 2002:a63:7e46:: with SMTP id o6mr37834009pgn.38.1621168277199;
        Sun, 16 May 2021 05:31:17 -0700 (PDT)
Received: from localhost.localdomain ([111.223.96.126])
        by smtp.gmail.com with ESMTPSA id k186sm8004318pgk.82.2021.05.16.05.31.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 May 2021 05:31:16 -0700 (PDT)
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	fabioaiuto83@gmail.com,
	fmdefrancesco@gmail.com,
	eantoranz@gmail.com,
	hdegoede@redhat.com,
	Larry.Finger@lwfinger.net
Cc: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH 7/7] Staging: rtl8723bs: fix block comment in HalBtc8723b1Ant.c
Date: Sun, 16 May 2021 08:29:27 -0400
Message-Id: <20210516122927.1132356-8-desmondcheongzx@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
References: <20210516122927.1132356-1-desmondcheongzx@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit fixes the following checkpatch.pl warning:

WARNING: Block comments use * on subsequent lines
+		/*
+		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \

Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index cc7f558903ac..87156b2cd1f0 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2511,10 +2511,10 @@ void EXhalbtc8723b1ant_DisplayCoexInfo(struct btc_coexist *pBtCoexist)
 		CL_PRINTF(cliBuf);
 
 		/*
-		CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)", \
-			pCoexDm->errorCondition);
-		CL_PRINTF(cliBuf);
-		*/
+		 *CL_SPRINTF(cliBuf, BT_TMP_BUF_SIZE, "\r\n %-35s = 0x%x ", "Latest error condition(should be 0)",
+		 *	pCoexDm->errorCondition);
+		 *CL_PRINTF(cliBuf);
+		 */
 	}
 
 	/*  Hw setting */
-- 
2.25.1

