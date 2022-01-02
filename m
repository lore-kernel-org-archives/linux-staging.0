Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C7782C9D
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:11:56 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id k18so28166732wrg.11
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+FcuxhwxA5QMteVz+dapvBt2ioof0RJo+WgQY+1qaFU=;
        b=ClqFVtQ27afGBtsd9P8NRcZtFgbUn0GbZhBhHzTVxdstKryiIvu3h2esV/ovl5qULA
         7Gz1maecuVRHyUhJboHzKsnVL/Oso0g7mmMrUtg8MOQtvMBr81KvlkUb5OFiWche0l3X
         UQ1wdu9SwUDCWBekC6lQJTN2LvKWyGSjZEdbjVq59WQqpYD0WE8qZ2Gmzf01HQzyo+LR
         Jh6jytQBi6wpPm/pawhblDgkXsxj3EpB8734WfGe7RmybNi+FVxAbD/n9FDsZKZrSLUL
         vJYGKVP6YmodCqpnYzTdj5DTXLOj+nM9ORJVSMhwEQ33xETx/hBf37GXGA8TVgR8sE7K
         c5+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+FcuxhwxA5QMteVz+dapvBt2ioof0RJo+WgQY+1qaFU=;
        b=gNzvwgHMoqKrjOfgSqzpBvuCPsEYPXj5iEqxXoMVw+Ne6bEHH+spJAJN6yHhaJHE3/
         pCDIE+Nyka+WGqS/XRuIzaPgUdqvHViKqeLeyVab5g0RlSHWZfq4TTi2Hf5gBwyH6YFk
         i4t+pYcoYyDa0qaG20TAWfPEVywaHHrGOWATUA8CdN5WksKtYpdOOuaCo1r49wwxn7S2
         uQ7fiiFKLkMGJuf2K/biCY1Nirpy5mgzCOPizWLzzFDdfm55l0NV6dVE51sh3fph9D4n
         Pk4BMZKSffGSrECXMlZQsVA5SkaZ1/xik/EpFRbcppN2PYBATh+c0FC0DJ3/u5FCCJDr
         bIYA==
X-Gm-Message-State: AOAM530tpQ9QORbU3lbInwxjPqLOs8+1Uf/2ZZaXJ2YK3FwR5hwuZ5Gw
	f6/ESmrRd3PN3y8zu8DXMrE=
X-Google-Smtp-Source: ABdhPJxoRV57zkp1eGgtUzwoslhlQLTzAUyiQDEENopv32U4gWm2YKTKIN7n7XO3nKn8rNbUbG9a9w==
X-Received: by 2002:adf:bbd2:: with SMTP id z18mr36540919wrg.118.1641129114538;
        Sun, 02 Jan 2022 05:11:54 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:11:54 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/11] staging: r8188eu: remove MAX_CHANNEL_NUM_2G
Date: Sun,  2 Jan 2022 14:11:31 +0100
Message-Id: <20220102131141.12310-2-straube.linux@gmail.com>
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

The constants MAX_CHANNEL_NUM_2G and MAX_CHANNEL_NUM have the same
value. Remove MAX_CHANNEL_NUM_2G and fix the place where it is used.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/r8188eu/include/rtw_rf.h       | 5 -----
 2 files changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index 5b307ad3afa5..afdbc5e28fca 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -163,7 +163,7 @@ struct rt_channel_plan {
 };
 
 struct rt_channel_plan_2g {
-	unsigned char	Channel[MAX_CHANNEL_NUM_2G];
+	unsigned char	Channel[MAX_CHANNEL_NUM];
 	unsigned char	Len;
 };
 
diff --git a/drivers/staging/r8188eu/include/rtw_rf.h b/drivers/staging/r8188eu/include/rtw_rf.h
index d0a408b903dc..2308a00b5dec 100644
--- a/drivers/staging/r8188eu/include/rtw_rf.h
+++ b/drivers/staging/r8188eu/include/rtw_rf.h
@@ -19,11 +19,6 @@
 #define RTL8711_RF_MAX_SENS		6
 #define RTL8711_RF_DEF_SENS		4
 
-/*  We now define the following channels as the max channels in each
- * channel plan. */
-/*  2G, total 14 chnls */
-/*  {1,2,3,4,5,6,7,8,9,10,11,12,13,14} */
-#define	MAX_CHANNEL_NUM_2G		14
 #define	MAX_CHANNEL_NUM			14	/* 2.4 GHz only */
 
 #define NUM_REGULATORYS	1
-- 
2.34.1

