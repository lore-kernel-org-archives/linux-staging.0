Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9470
	for <linux-staging@lists.linux.dev>; Sat, 31 Jul 2021 00:39:49 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id r2so13421592wrl.1
        for <linux-staging@lists.linux.dev>; Fri, 30 Jul 2021 17:39:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Is39HpL/PKw5LqFK5S/i54PTBc1QGMOiWY+feaoJszs=;
        b=uyw5DlBzwYquXNo1Or1KlLUY0TDMfamSRHdV+L0ry6cI0YXQV0FC08uwWn861AOwIp
         Kt1hbv+T1N9eusNDNN3/nq0xi33LP9OLy83QBHGVkJYRXmbZX3+gpQDxzeVMXPc2I9cN
         g9faXc5Hbs3MDV4GgOtTvQm7toa405OeWCTL3b3n50IZ2q1OX4XRYjC3WZTqqjwDxbz1
         vT1CiP8qSclw3WWVHF5/Co5D1qqeIvQKZiLRvOx2wgdusbZWMxIFsL9Ock6s3csJB5AG
         lSxQwxh6nwbx8NN5o+gPHR9hYtZlQYmEkmglAyGrnDe90VLYt/KZ80D4V+WPno564G9N
         Reyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Is39HpL/PKw5LqFK5S/i54PTBc1QGMOiWY+feaoJszs=;
        b=IOG1rEv0nfziR5GAgzuh5L9xrPeb8QIv4tPnR5rvUUAXUTalornHNwp3Lx/rWL+rEA
         qX21IHMUmmYLV0xUeHTtnZIKbDwLsF+h0QusP5uq7Le7i+5ADAQrDg+Gh2gB0FxCG6oA
         AebbvQtz9YT3qq7D0GiF9xd7/QkfoRZQM3nyodNsSyZbvwbG6MjCMt7hROYVhs0cZAxo
         NJ7TgvIJGrou60V+9uwcYRwMwlXZVK5jTJA2dqj9mK+oCDrKNpJO+2eQE5rlClnnVl1/
         50lg63p8MVTk14kjD/CTlqAWpxDxTky2E3RALxERkggFnzz652YorehZA1tO1Es6z7kl
         MHtg==
X-Gm-Message-State: AOAM533fsrxwmjqbfTXi8jOruiZ0tROw2KyFW8dCBE+XY3YqvESi2qck
	YXSDQP3V+OUn/dSWi3jMNJGiOg==
X-Google-Smtp-Source: ABdhPJxibR1f2TrksAdj0dHtepfYGxKH15hvhfMlW0xjUIMP2Ot6sGUe3ZyZiiAICtVMq4gdCqRThA==
X-Received: by 2002:a5d:6043:: with SMTP id j3mr5708597wrt.417.1627691988182;
        Fri, 30 Jul 2021 17:39:48 -0700 (PDT)
Received: from localhost.localdomain (3.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.6.1.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:df16::3])
        by smtp.gmail.com with ESMTPSA id g138sm3829614wmg.32.2021.07.30.17.39.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jul 2021 17:39:47 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/14 resent] staging: r8188eu: remove ODM_RT_TRACE macro definition
Date: Sat, 31 Jul 2021 01:39:35 +0100
Message-Id: <20210731003937.68615-13-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210731003937.68615-1-phil@philpotter.co.uk>
References: <20210731003937.68615-1-phil@philpotter.co.uk>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove ODM_RT_TRACE macro definition from include/odm_debug.h, as
it is called from nowhere and is therefore superfluous.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/r8188eu/include/odm_debug.h | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/odm_debug.h b/drivers/staging/r8188eu/include/odm_debug.h
index c70fe73e3339..38b07664b07c 100644
--- a/drivers/staging/r8188eu/include/odm_debug.h
+++ b/drivers/staging/r8188eu/include/odm_debug.h
@@ -68,24 +68,6 @@
 #define RT_PRINTK(fmt, args...)				\
 	DbgPrint( "%s(): " fmt, __func__, ## args);
 
-#define ODM_RT_TRACE(pDM_Odm, comp, level, fmt)				\
-	if (((comp) & pDM_Odm->DebugComponents) &&			\
-	    (level <= pDM_Odm->DebugLevel)) {				\
-		if (pDM_Odm->SupportICType == ODM_RTL8192C)		\
-			DbgPrint("[ODM-92C] ");				\
-		else if (pDM_Odm->SupportICType == ODM_RTL8192D)	\
-			DbgPrint("[ODM-92D] ");				\
-		else if (pDM_Odm->SupportICType == ODM_RTL8723A)	\
-			DbgPrint("[ODM-8723A] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8188E)	\
-			DbgPrint("[ODM-8188E] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8812)		\
-			DbgPrint("[ODM-8812] ");			\
-		else if (pDM_Odm->SupportICType == ODM_RTL8821)		\
-			DbgPrint("[ODM-8821] ");			\
-		RT_PRINTK fmt;						\
-	}
-
 void ODM_InitDebugSetting(struct odm_dm_struct *pDM_Odm);
 
 #endif	/*  __ODM_DBG_H__ */
-- 
2.31.1

