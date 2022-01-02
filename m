Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B63282CA0
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:12:01 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id l4so19998007wmq.3
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SL33q0T27N+17/iPtiGm4sL345lSNfWeom9DBrdJo38=;
        b=ZRDCbSk53SBgUiOzigZJbHYCxTyT9J9Yx8iamqXNi7DpcCMvubH8vCTY0jEvG2zddR
         nyyCRmn/ovZMLBvkfY0PClerdj+fKC76zMiTdT4ImjHF6HMEDYwWayyb0asrCmZBrzAc
         4V/QACLekgM0iLAjSPYhpnlP2T85cmgNyexwFGc9j5ZdTy8Qv4AWjH8YsVFtVVKFxuJI
         U3jdMbrRG1lSU5s19YlVu7v9wXAzmvbThayB+h7wVlfQpX1ca5H7arFRXu7bSo08Z/TQ
         Q5BfFwczFSH16l4uYjc4O1FBFTYdL6/eHYR7pvgHbXQXGTuHA4bL69VThmAKcxGRDMMH
         1N/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SL33q0T27N+17/iPtiGm4sL345lSNfWeom9DBrdJo38=;
        b=BL12o9w9c0m/XC2nw5NbfSmW3iefmdXwOVH4A5RCst7OHPvvdIjTyzEnhUkOt+aAgc
         wyLuoxJiIXWhmSERV4dvIKI6gJVJer+vVK07aJT0oO2X801fW0TZxJ2v3F5x5jKSYxrB
         7uk8/IsQBOuJerV+rMUOhj0sX11TN4BqyDJYjTYjpE25ZoVrQdOilaXr9gnyolXikSv2
         SZx/mW9bOxvchxNrvX/rB1WMMENJXkGnj/a++Ub22McLhA2/M2uY/Akka5pRWZtUYEIU
         Pe9qTybQXpuF4NCZyZSCHbeQ2loGxmdlcdWXZBMWc3YkVjaDgEas9uPRgM6J3JelohUk
         deGw==
X-Gm-Message-State: AOAM531jO9CQAFxlFNgP37sosgIQmRntkGhNhYTBO89A3NR/0LpHSvPm
	tYx6tJJzuBlA26wF8wv55VI=
X-Google-Smtp-Source: ABdhPJweyl8fyZpYif4tM1g25KKYjjpRvtalMuRQUYJAVGFQz6JG4Wdydv87pnVCxalkCayibHMM+Q==
X-Received: by 2002:a05:600c:34c4:: with SMTP id d4mr36115150wmq.53.1641129120196;
        Sun, 02 Jan 2022 05:12:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:59 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/11] staging: r8188eu: remove unneeded comments from Hal8188EPhyCfg.h
Date: Sun,  2 Jan 2022 14:11:39 +0100
Message-Id: <20220102131141.12310-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220102131141.12310-1-straube.linux@gmail.com>
References: <20220102131141.12310-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unneeded comments from Hal8188EPhyCfg.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/Hal8188EPhyCfg.h  | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index fe6111fe278e..e01de2ebb75f 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -4,7 +4,6 @@
 #ifndef __INC_HAL8188EPHYCFG_H__
 #define __INC_HAL8188EPHYCFG_H__
 
-/*--------------------------Define Parameters-------------------------------*/
 #define LOOP_LIMIT			5
 #define MAX_STALL_TIME			50		/* us */
 #define AntennaDiversityValue		0x80
@@ -13,10 +12,6 @@
 
 #define MAX_AGGR_NUM			0x07
 
-/*--------------------------Define Parameters-------------------------------*/
-
-/*------------------------------Define structure----------------------------*/
-
 enum rf_radio_path {
 	RF_PATH_A = 0,			/* Radio Path A */
 	RF_PATH_B = 1,			/* Radio Path B */
@@ -81,18 +76,7 @@ struct bb_reg_def {
 				 * Path A and B */
 };
 
-/*------------------------------Define structure----------------------------*/
-
-/*------------------------Export global variable----------------------------*/
-/*------------------------Export global variable----------------------------*/
-
-/*------------------------Export Marco Definition---------------------------*/
-/*------------------------Export Marco Definition---------------------------*/
-
-/*--------------------------Exported Function prototype---------------------*/
-/*  */
 /*  BB and RF register read/write */
-/*  */
 u32 rtl8188e_PHY_QueryBBReg(struct adapter *adapter, u32 regaddr, u32 mask);
 void rtl8188e_PHY_SetBBReg(struct adapter *Adapter, u32 RegAddr,
 			   u32 mask, u32 data);
@@ -119,6 +103,5 @@ void PHY_SwChnl8188E(struct adapter *adapter, u8 channel);
 
 void storePwrIndexDiffRateOffset(struct adapter *adapter, u32 regaddr,
 				 u32 mask, u32 data);
-/*--------------------------Exported Function prototype---------------------*/
 
-#endif	/*  __INC_HAL8192CPHYCFG_H */
+#endif
-- 
2.34.1

