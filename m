Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487CB2C9E
	for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 11:54:57 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id o12so15123605eju.13
        for <linux-staging@lists.linux.dev>; Fri, 28 Jan 2022 03:54:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=13iP0ysAJRd0WBFMaQVUlv7Pu203h1+BnMCWYbYB0eM=;
        b=hUY0ajqp9CexidLtdobTizYGbUTHqr+Pzq28rusK1pHK6Hnj9cIlVYSemM4JhiZUEH
         7bkRl4CGtNJSgG7wyqlRJON0rNBNZtpGvZAWp0I/vVF4tfgD+l0eeYSyI/w2/Wzny4QP
         f9l57FPZfPOAGY49L4XEfv3pTm5QuKF9dN6PMwutT933a0rBgqMa7V9ajkwYwYw9UrZc
         UWxZXrlRUPZi0nYQoQg2yVo0vxCmTHSQ9w+XUtkmp3qwcpT5A+yv1Z1jS/kk6DEHgATY
         AJGeJMkwgBDRWGefniyI1NUSztzXmC3tNDjKqqzcWhpT94h4cWXU6XKiQ/TPH4I75mMD
         JJCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=13iP0ysAJRd0WBFMaQVUlv7Pu203h1+BnMCWYbYB0eM=;
        b=mTmZnAYw0xQOP01UL/SurTNQKI1IQGnKJElmiGNjmfvIz9YafsEw753kM3i3DdCg/T
         MjtX9YDkuOqZpHzf3oaMc9MBZmaEOI/oijtdFqzS7tfkbT6Cf8eCnRXUBX3daPfykA6d
         YiX47w4qKr+GX1fukowkRJjlkpVyl4SWxcaLXz99rMSIU0Fw24XK2dzCKga8kFBfpbQ7
         YtwO9jFszSdS+C/s89fb8j88YiRnFWm/WBasPR5TA7jbKLjANifYr3ZcX7lrbbiYcx+d
         XaZVsa2Mnv/k7XRMtOvbBL+l6RTK7KYqB6CfplEd34V2TmiyfwIBA/l6Y1jPBPkWUAmR
         Geqw==
X-Gm-Message-State: AOAM5323Z82MetBjWpT/ZHD4HsWpezRk0Pe7txXfC1vGUKs4oMcbSryZ
	+D+/P7+neQbA1tARtyHBTTI=
X-Google-Smtp-Source: ABdhPJzx05Ym8i+8QSQXqIYrnHP7zRS2uFfPyNTCJqUjWh41TBla9I6r+wGF74m4tkIK/zCsfhieFw==
X-Received: by 2002:a17:906:d551:: with SMTP id cr17mr6320553ejc.27.1643370895696;
        Fri, 28 Jan 2022 03:54:55 -0800 (PST)
Received: from localhost.localdomain (ip5f5abb9e.dynamic.kabel-deutschland.de. [95.90.187.158])
        by smtp.gmail.com with ESMTPSA id h20sm12494261eds.9.2022.01.28.03.54.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 03:54:55 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/6] staging: r8188eu: remove unused cases from GetHalDefVar8188EUsb()
Date: Fri, 28 Jan 2022 12:54:41 +0100
Message-Id: <20220128115445.6606-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220128115445.6606-1-straube.linux@gmail.com>
References: <20220128115445.6606-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

GetHalDefVar8188EUsb() is never called with HAL_DEF_DRVINFO_SZ,
HAL_DEF_RA_DECISION_RATE, HAL_DEF_RA_SGI and HAL_DEF_PT_PWR_STATUS.
Remove these cases from the function.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/usb_halinit.c  | 21 ---------------------
 drivers/staging/r8188eu/include/hal_intf.h |  4 ----
 2 files changed, 25 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_halinit.c b/drivers/staging/r8188eu/hal/usb_halinit.c
index d654d2f01c78..4bb1812f5ae7 100644
--- a/drivers/staging/r8188eu/hal/usb_halinit.c
+++ b/drivers/staging/r8188eu/hal/usb_halinit.c
@@ -1622,30 +1622,9 @@ u8 GetHalDefVar8188EUsb(struct adapter *Adapter, enum hal_def_variable eVariable
 	case HAL_DEF_CURRENT_ANTENNA:
 		*((u8 *)pValue) = haldata->CurAntenna;
 		break;
-	case HAL_DEF_DRVINFO_SZ:
-		*((u32 *)pValue) = DRVINFO_SZ;
-		break;
 	case HAL_DEF_DBG_DM_FUNC:
 		*((u32 *)pValue) = haldata->odmpriv.SupportAbility;
 		break;
-	case HAL_DEF_RA_DECISION_RATE:
-		{
-			u8 MacID = *((u8 *)pValue);
-			*((u8 *)pValue) = ODM_RA_GetDecisionRate_8188E(&haldata->odmpriv, MacID);
-		}
-		break;
-	case HAL_DEF_RA_SGI:
-		{
-			u8 MacID = *((u8 *)pValue);
-			*((u8 *)pValue) = ODM_RA_GetShortGI_8188E(&haldata->odmpriv, MacID);
-		}
-		break;
-	case HAL_DEF_PT_PWR_STATUS:
-		{
-			u8 MacID = *((u8 *)pValue);
-			*((u8 *)pValue) = ODM_RA_GetHwPwrStatus_8188E(&haldata->odmpriv, MacID);
-		}
-		break;
 	case HW_VAR_MAX_RX_AMPDU_FACTOR:
 		*((u32 *)pValue) = MAX_AMPDU_FACTOR_64K;
 		break;
diff --git a/drivers/staging/r8188eu/include/hal_intf.h b/drivers/staging/r8188eu/include/hal_intf.h
index 726e60fd7273..231badaa9cce 100644
--- a/drivers/staging/r8188eu/include/hal_intf.h
+++ b/drivers/staging/r8188eu/include/hal_intf.h
@@ -75,12 +75,8 @@ enum hal_def_variable {
 	HAL_DEF_UNDERCORATEDSMOOTHEDPWDB,
 	HAL_DEF_IS_SUPPORT_ANT_DIV,
 	HAL_DEF_CURRENT_ANTENNA,
-	HAL_DEF_DRVINFO_SZ,
 	HAL_DEF_DBG_DUMP_RXPKT,/* for dbg */
 	HAL_DEF_DBG_DM_FUNC,/* for dbg */
-	HAL_DEF_RA_DECISION_RATE,
-	HAL_DEF_RA_SGI,
-	HAL_DEF_PT_PWR_STATUS,
 	HW_VAR_MAX_RX_AMPDU_FACTOR,
 	HW_DEF_RA_INFO_DUMP,
 	HAL_DEF_DBG_DUMP_TXPKT,
-- 
2.34.1

