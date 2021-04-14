Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DCC76D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:41 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id g17so24105846edm.6
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uPY48LgVqI2utWj0VZYqCdnlNWMGEkPsCBhBUz6MH0g=;
        b=ChQbWOKEmcf97Co+SjHDFIRjrMi+yzGQpu0BFtXRohhGFZufWyPfBb6qQQq1mzrMnP
         KeRiihpfd+NLoGH64Oc/h65Py2sW6JRTeP/yK+cyxrjeVmx2zO+uzwekbfFj1R+ee0i3
         Qi9jFDUAJN9elQW7p1LzhqCAlVdvNwYLrj+fAzItBZkoWsmJABl54OGMbdQQA2ex2l8k
         TVFRw7y1B3n05KGLDYubK2B+J3K/J/P+d4lAC9zBj0OhnbDnhL+HWsd0lilFnQEx86xT
         dl9eXISTsjgBHgKm/sAj4elY7tdjAWgcK0yy/DmYC9NYvN14k4oP9fHR5F0AWRjJ4Bxy
         M3cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uPY48LgVqI2utWj0VZYqCdnlNWMGEkPsCBhBUz6MH0g=;
        b=fsKmsi3ANA8jj9w9HLwv5bvNF4d9wdi3iuEtIXsf8nC1T8TXETrebDllGHFaIuC/yw
         hl0sIEMcpnJj3DlFiQ8qgz9J0IaV9+6uNS4uNwxmgy3J53A3Nulv//MmxXBLP+F7KRfw
         Ln0MYcnybAupibBKYTxetW8i6m5RaH6QnTy7DQ3Tg0dE0r6BkvPZiUsvsFBRd0BD00C+
         V0qMrCWnW3ntXsHaCPGhseKWA3auN59v1rV4o1+QCIZE4u98iXkHIC+/ymHPYGnMOn6u
         NEguuqyXc9IngwApWuxyNrtbjajJxobLYk1Z/r38i2YE4K9MPVa1Z1MbpLQTxmtL0J+E
         ba1A==
X-Gm-Message-State: AOAM53170qrbX77eOBCxs4QGE0xJBPozYklOBqPBZTtSTqIcCXlZW08k
	tmx4jyY2vi0mknhxzK1BZfnB8w==
X-Google-Smtp-Source: ABdhPJyQ6B6Q6/p/pq4RjahrDxBOoVdrXArixDxcMTZRRjHriAxS7uB5XaThx3wHn0bVjslB8a8Lsg==
X-Received: by 2002:a05:6402:b9b:: with SMTP id cf27mr213521edb.60.1618423899984;
        Wed, 14 Apr 2021 11:11:39 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 05/57] staging: r819xU_phy: Remove some local variables from the stack
Date: Wed, 14 Apr 2021 19:10:37 +0100
Message-Id: <20210414181129.1628598-6-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/rtl8192u/r819xU_phy.c: In function ‘rtl8192_phy_SwChnlStepByStep’:
 drivers/staging/rtl8192u/r819xU_phy.c:1328:1: warning: the frame size of 1096 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Michael Straube <straube.linux@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/rtl8192u/r819xU_phy.c | 48 ++++++++++++++++++++++-----
 1 file changed, 39 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8192u/r819xU_phy.c b/drivers/staging/rtl8192u/r819xU_phy.c
index eef751d2b12e6..37b82553412e3 100644
--- a/drivers/staging/rtl8192u/r819xU_phy.c
+++ b/drivers/staging/rtl8192u/r819xU_phy.c
@@ -1185,14 +1185,32 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 				       u8 *stage, u8 *step, u32 *delay)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
-	struct sw_chnl_cmd   PreCommonCmd[MAX_PRECMD_CNT];
+	struct sw_chnl_cmd   *PreCommonCmd;
 	u32		   PreCommonCmdCnt;
-	struct sw_chnl_cmd   PostCommonCmd[MAX_POSTCMD_CNT];
+	struct sw_chnl_cmd   *PostCommonCmd;
 	u32		   PostCommonCmdCnt;
-	struct sw_chnl_cmd   RfDependCmd[MAX_RFDEPENDCMD_CNT];
+	struct sw_chnl_cmd   *RfDependCmd;
 	u32		   RfDependCmdCnt;
 	struct sw_chnl_cmd  *CurrentCmd = NULL;
 	u8		   e_rfpath;
+	bool		   ret;
+
+	PreCommonCmd = kzalloc(sizeof(*PreCommonCmd) * MAX_PRECMD_CNT, GFP_KERNEL);
+	if (!PreCommonCmd)
+		return false;
+
+	PostCommonCmd = kzalloc(sizeof(*PostCommonCmd) * MAX_POSTCMD_CNT, GFP_KERNEL);
+	if (!PostCommonCmd) {
+		kfree(PreCommonCmd);
+		return false;
+	}
+
+	RfDependCmd = kzalloc(sizeof(*RfDependCmd) * MAX_RFDEPENDCMD_CNT, GFP_KERNEL);
+	if (!RfDependCmd) {
+		kfree(PreCommonCmd);
+		kfree(PostCommonCmd);
+		return false;
+	}
 
 	RT_TRACE(COMP_CH, "%s() stage: %d, step: %d, channel: %d\n",
 		 __func__, *stage, *step, channel);
@@ -1201,7 +1219,8 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 		/* return true to tell upper caller function this channel
 		 * setting is finished! Or it will in while loop.
 		 */
-		return true;
+		ret = true;
+		goto out;
 	}
 	/* FIXME: need to check whether channel is legal or not here */
 
@@ -1227,7 +1246,8 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 			RT_TRACE(COMP_ERR,
 				 "illegal channel for Zebra 8225: %d\n",
 				 channel);
-			return true;
+			ret = true;
+			goto out;
 		}
 		rtl8192_phy_SetSwChnlCmdArray(RfDependCmd, RfDependCmdCnt++,
 					      MAX_RFDEPENDCMD_CNT,
@@ -1246,7 +1266,8 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 			RT_TRACE(COMP_ERR,
 				 "illegal channel for Zebra 8256: %d\n",
 				 channel);
-			return true;
+			ret = true;
+			goto out;
 		}
 		rtl8192_phy_SetSwChnlCmdArray(RfDependCmd, RfDependCmdCnt++,
 					      MAX_RFDEPENDCMD_CNT,
@@ -1262,7 +1283,8 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 
 	default:
 		RT_TRACE(COMP_ERR, "Unknown RFChipID: %d\n", priv->rf_chip);
-		return true;
+		ret = true;
+		goto out;
 	}
 
 	do {
@@ -1281,7 +1303,8 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 		if (CurrentCmd->cmd_id == CMD_ID_END) {
 			if ((*stage) == 2) {
 				(*delay) = CurrentCmd->ms_delay;
-				return true;
+				ret = true;
+				goto out;
 			}
 			(*stage)++;
 			(*step) = 0;
@@ -1324,7 +1347,14 @@ static u8 rtl8192_phy_SwChnlStepByStep(struct net_device *dev, u8 channel,
 
 	(*delay) = CurrentCmd->ms_delay;
 	(*step)++;
-	return false;
+	ret = false;
+
+out:
+	kfree(PreCommonCmd);
+	kfree(PostCommonCmd);
+	kfree(RfDependCmd);
+
+	return ret;
 }
 
 /******************************************************************************
-- 
2.27.0

