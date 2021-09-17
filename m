Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F346A3FC9
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 23:31:12 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id u15so17626682wru.6
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 16:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=DgZ+hqLf0FtG7Wd9/tJWqhkp5dALrXXdBCxii4LerqQ=;
        b=Eds4Vv8GsCjIsiL6IKoHai2iGtELq9WFBq6kvACRQRNRSsRm3g+SQw6VkeYmvDS/Dv
         IgG4cygAM0iuINojJtG3uUvUNsRhfY3bMuV6aSgHl7Mg+4O+qqki78JhfUuZQDUpcm9H
         Bldm5JDI5aQxn1oia9SXTr67lMyjENU1KoYlHP5v0j70EF4QCNS1fFahxPSi1mZCu6SK
         WdJGfM5BT6JmKKRylw/+3kiaN0tuDoRfLjw93S+AioPyxw5yUTF/51B+1UL0MEJopcjt
         RjQheeThV32Tm/IaXQpL7OIuZIj3IpIHyDetMVnXIUIbhSjMh5c0ISx6bueU9JGD0QKm
         7NWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=DgZ+hqLf0FtG7Wd9/tJWqhkp5dALrXXdBCxii4LerqQ=;
        b=wpvtTaRp6g78VBc/Ix1Qt82fzPpINV/ZYX4fSTCQt5i8SfrBYLlnIHG6ejQTw+heec
         LHArzHe/R97JZY51eDq8iUNyUukj6kpbCxyhMBxt+581OOT0Lkp2Ha4uQRr7BItlBDOD
         ALPFdNGt0S6qMr7WnzyDytr61igEgJBMF0SYV6JjiHJJoFtXbv9iljZSO1OvAv/o0Pnz
         GacP7lT+n6P6dwmOYbYYWLPJtoFBBE1DdTYmy1BxE05s0RpN6ggKeS7p8GEXpTg2wT8d
         TWumMrsHMJw3DaF/BbiOtCfBy6lg/6klz130ue6AHyzP3I/D5MmJXf1QbOcqnI/vQYQ0
         zxng==
X-Gm-Message-State: AOAM532kowCBnZhjEy+P43mjhyxjIlBxIc6sAw6C4u3UzDyEebH7LEok
	QO9WXl3TQQHVQxufJwZoBNkB8vMj/lo9lA==
X-Google-Smtp-Source: ABdhPJwXrr4CBwXn+G2GB57hpSHm0UjJPfiOZDYgJQI2cMdVsqW7K77UYiLjdD5t3dFH/tikPT1d/w==
X-Received: by 2002:adf:b748:: with SMTP id n8mr14851986wre.133.1631921471449;
        Fri, 17 Sep 2021 16:31:11 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id w9sm7523148wmc.19.2021.09.17.16.31.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 16:31:11 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 09/12] staging: r8188eu: remove unnecessary if statements
Date: Sat, 18 Sep 2021 01:30:45 +0200
Message-Id: <20210917233048.31677-10-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210917233048.31677-1-straube.linux@gmail.com>
References: <20210917233048.31677-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

(pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) is always false and
(pDM_Odm->SupportICType & ODM_IC_11N_SERIES) is always true since
SupportICType is ODM_RTL8188E in this driver. Remove unnecessary
if statements that check for this.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/odm.c | 39 +++++++++++++------------------
 1 file changed, 16 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/odm.c b/drivers/staging/r8188eu/hal/odm.c
index cb27edf657d9..23ef08fc64cd 100644
--- a/drivers/staging/r8188eu/hal/odm.c
+++ b/drivers/staging/r8188eu/hal/odm.c
@@ -163,22 +163,18 @@ void ODM_DMInit(struct odm_dm_struct *pDM_Odm)
 	odm_DIGInit(pDM_Odm);
 	odm_RateAdaptiveMaskInit(pDM_Odm);
 
-	if (pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) {
-		;
-	} else if (pDM_Odm->SupportICType & ODM_IC_11N_SERIES) {
-		odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
-		odm_DynamicBBPowerSavingInit(pDM_Odm);
-		odm_DynamicTxPowerInit(pDM_Odm);
-		odm_TXPowerTrackingInit(pDM_Odm);
-		ODM_EdcaTurboInit(pDM_Odm);
-		ODM_RAInfo_Init_all(pDM_Odm);
-		if ((pDM_Odm->AntDivType == CG_TRX_HW_ANTDIV)	||
-		    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV) ||
-		    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
-			odm_InitHybridAntDiv(pDM_Odm);
-		else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
-			odm_SwAntDivInit(pDM_Odm);
-	}
+	odm_PrimaryCCA_Init(pDM_Odm);    /*  Gary */
+	odm_DynamicBBPowerSavingInit(pDM_Odm);
+	odm_DynamicTxPowerInit(pDM_Odm);
+	odm_TXPowerTrackingInit(pDM_Odm);
+	ODM_EdcaTurboInit(pDM_Odm);
+	ODM_RAInfo_Init_all(pDM_Odm);
+	if ((pDM_Odm->AntDivType == CG_TRX_HW_ANTDIV)	||
+	    (pDM_Odm->AntDivType == CGCS_RX_HW_ANTDIV) ||
+	    (pDM_Odm->AntDivType == CG_TRX_SMART_ANTDIV))
+		odm_InitHybridAntDiv(pDM_Odm);
+	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
+		odm_SwAntDivInit(pDM_Odm);
 }
 
 /*  2011/09/20 MH This is the entry pointer for all team to execute HW out source DM. */
@@ -218,13 +214,10 @@ void ODM_DMWatchdog(struct odm_dm_struct *pDM_Odm)
 	else if (pDM_Odm->AntDivType == CGCS_RX_SW_ANTDIV)
 		odm_SwAntDivChkAntSwitch(pDM_Odm, SWAW_STEP_PEAK);
 
-	if (pDM_Odm->SupportICType & ODM_IC_11AC_SERIES) {
-		;
-	} else if (pDM_Odm->SupportICType & ODM_IC_11N_SERIES) {
-		ODM_TXPowerTrackingCheck(pDM_Odm);
-		odm_EdcaTurboCheck(pDM_Odm);
-		odm_DynamicTxPower(pDM_Odm);
-	}
+	ODM_TXPowerTrackingCheck(pDM_Odm);
+	odm_EdcaTurboCheck(pDM_Odm);
+	odm_DynamicTxPower(pDM_Odm);
+
 	odm_dtc(pDM_Odm);
 }
 
-- 
2.33.0

