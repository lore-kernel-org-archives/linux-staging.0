Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD0045F
	for <linux-staging@lists.linux.dev>; Sat, 27 Mar 2021 00:18:14 +0000 (UTC)
Received: by mail-qt1-f174.google.com with SMTP id j7so5505607qtx.5
        for <linux-staging@lists.linux.dev>; Fri, 26 Mar 2021 17:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pcT/zDnZmKWZEkcWU1Fdw2ETNdguhtXtEAWsERVGPz8=;
        b=Oh/YN8VSH0mjmWJlRzWWHSrachEnaiJZBXtXfGYhG0B9u/RWYkZ+/gN+HlTfX6Dze7
         /4sFNF9PFIq1mGJ2Y3k6wz4YqSLDQdh7mfZgnfsrd4iB95lWdGm/7Vpl/ysChn2RV0LL
         nYBA+apwXYbyjjvhED/P7bbq4CjQEyhHpCf6/m/SWuJlJNBTvMTE7pztE99lSVDxTDpA
         /GQpUBg2nWkhszHa5c9TC9vozQc8pNfLAu9SpUBbwq7ybLkbMH1bCvQ7qwRa7jebt1a4
         YLPyrkzxMchwlxQ/h+WbrCzy/KWbqesGYz4fXZkdGKf3cxz4P87GyayqVIpf+gg5cfyy
         bPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pcT/zDnZmKWZEkcWU1Fdw2ETNdguhtXtEAWsERVGPz8=;
        b=jfS150/Uk/45NVMWW5QWndKI/g05h5QexUIGU/ZVHY7doy5INR8apPMvwMfXP1a2NY
         L0tcr9J3scUM0DJT/+2WnwCYfg7jmAZB5lG1VN9Uu4DxeJFj4Mt2EN0ni2fArsZjxN0u
         d2toFMG/9WihQKFhApGlTycuH8aVnmGEx0argdh+1kMfzjWHesk6DNbxmd+30Cl1ZRDW
         +9GiGKZf3lPuJ3Jd3tgFE8xkRIsyfqpvkxz1oHvbTn5zDOUcSBEb5IDSn2loUC+yr5TN
         5x6cqD/fDNXiU8N5AVo6vj7nWMIS0hknljRVCEaiZkR/mIKbGOeRhyYgbAYoHnbx0MgM
         65XQ==
X-Gm-Message-State: AOAM531siu8gm/o0Aie3kxqT1gdS80T+6c+5exweRrfHWDBQcSMsUQ7s
	50+ww1kmwbvZwRoCs59eE3c=
X-Google-Smtp-Source: ABdhPJx3pGvGTjzF7gSrHxGU58iUHo1oumXLECb05hM0HOimIYQIYMEshFim1BePtHwxKbL6IQfmNQ==
X-Received: by 2002:a05:622a:110c:: with SMTP id e12mr14714926qty.350.1616804293602;
        Fri, 26 Mar 2021 17:18:13 -0700 (PDT)
Received: from linuxerio.localdomain ([186.32.194.42])
        by smtp.gmail.com with ESMTPSA id z2sm8213531qkg.22.2021.03.26.17.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Mar 2021 17:18:13 -0700 (PDT)
From: Edmundo Carmona Antoranz <eantoranz@gmail.com>
To: gregkh@linuxfoundation.org,
	marcocesati@gmail.com,
	dan.carpenter@oracle.com,
	ross.schm.dev@gmail.com,
	fabioaiuto83@gmail.com,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	Edmundo Carmona Antoranz <eantoranz@gmail.com>
Subject: [PATCH -next 3/6] staging: rtl8723bs: hal: remove unused variable in HalBtc8723b1Ant.c
Date: Fri, 26 Mar 2021 18:17:33 -0600
Message-Id: <20210327001736.180881-3-eantoranz@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210327001736.180881-1-eantoranz@gmail.com>
References: <20210327001736.180881-1-eantoranz@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Variable btRssiState in halbtc8723b1ant_ActionWifiConnectedBtAclBusy()
is set but never read. Removing it.

Removing this warning:

drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c:2093:5: warning: variable ‘btRssiState’ set but not used [-Wunused-but-set-variable]

Signed-off-by: Edmundo Carmona Antoranz <eantoranz@gmail.com>
---
 drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
index 621f8181f46d..3e794093092b 100644
--- a/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
+++ b/drivers/staging/rtl8723bs/hal/HalBtc8723b1Ant.c
@@ -2090,10 +2090,8 @@ static void halbtc8723b1ant_ActionWifiConnectedBtAclBusy(
 	struct btc_coexist *pBtCoexist, u8 wifiStatus
 )
 {
-	u8 btRssiState;
-
 	struct btc_bt_link_info *pBtLinkInfo = &pBtCoexist->btLinkInfo;
-	btRssiState = halbtc8723b1ant_BtRssiState(2, 28, 0);
+	halbtc8723b1ant_BtRssiState(2, 28, 0);
 
 	if ((pCoexSta->lowPriorityRx >= 1000) && (pCoexSta->lowPriorityRx != 65535))
 		pBtLinkInfo->bSlaveRole = true;
-- 
2.30.2

