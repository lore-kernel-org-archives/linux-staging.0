Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CAB72CA1
	for <linux-staging@lists.linux.dev>; Sun,  2 Jan 2022 13:12:02 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id o30so17481340wms.4
        for <linux-staging@lists.linux.dev>; Sun, 02 Jan 2022 05:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h2Wgv5+h6GkK0yvQzGrFoIs9n84Jg+EZtpnr/gveYGk=;
        b=LPaNYgMwLimHQx2Rx+2wiEz+1Q2OFGbl7Qwb3B+JZNtvKZ59eCi2VS/O68QvhUpVqr
         zGdfHKiuBxk/sgKUNVGV3R+dlogQ/OMJKq5gB8vCPHTeBNmwgRj2LLq4bTEPOcPsuhxl
         S7a7gwe4ASEbt1LGXsQorpplIFVWaEiNC/YIU2xjEme3rLAajjutetyx3C3jRKD9gTjM
         5hPKlUzIN/ZXQWuH6a9rxvfroOZrDsTwtrTy+Kj0YQZL6ssypPFTpWkhoq6fPb/TWVKS
         HO/xzb1GGCnfqik3bPBV9ShVToAJZf9JSbuBW3VMcPtz3Wm5pK03T69YHCt+Jhk9Of5G
         phQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h2Wgv5+h6GkK0yvQzGrFoIs9n84Jg+EZtpnr/gveYGk=;
        b=G9s8T/HEeLOvHJv+HsOqwSwckRc2UKTGidaMS97isy+dt3SscveBp7UfhFbWtlzL3v
         bmeL4s75cDQuMCBQJk48Plv+7uVD2nUO+iDogMbt6MxgfCKtVEiBsrhtcfCnefQIMQhi
         4jAOQ4AMIPBDDsl2CVqCzYHLpASx9tCs/nXXGHF+u1cRqmrXMpzTClsYM0boWLQ3+S96
         wcagL+qtFePcCFF7gOq6BXQOowiuCBhM3CtQ0mYe3rkmxUdSvbarLslr1XPK7E4KuF1G
         ZvdeBCMDme5yr5ERjD9GEwfNxYjjfA7NFBwfRrkXhZAUd803q+pU7mu+ZZlVvo26muQg
         5u9w==
X-Gm-Message-State: AOAM531lNhp+nMIwW/+xgQyhEjkzRmv+4HYxneZ0J8TAaRZkKnjTT52k
	DoYAcDtXBXI7HJCCt2aP6tw=
X-Google-Smtp-Source: ABdhPJzXrDJ1xfuTMXZ5i9fgSc+eewr/EqNnwIbFqucWjPniEFYY3k8kz1Wc6NBLGqPw+O8kVKSQWg==
X-Received: by 2002:a05:600c:3ca1:: with SMTP id bg33mr35890695wmb.80.1641129120951;
        Sun, 02 Jan 2022 05:12:00 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id m35sm65640044wms.1.2022.01.02.05.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jan 2022 05:12:00 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 10/11] staging: r8188eu: remove unused defines from Hal8188EPhyCfg.h
Date: Sun,  2 Jan 2022 14:11:40 +0100
Message-Id: <20220102131141.12310-11-straube.linux@gmail.com>
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

Remove unused defines from Hal8188EPhyCfg.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/Hal8188EPhyCfg.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
index e01de2ebb75f..2517a08bc95a 100644
--- a/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
+++ b/drivers/staging/r8188eu/include/Hal8188EPhyCfg.h
@@ -4,12 +4,6 @@
 #ifndef __INC_HAL8188EPHYCFG_H__
 #define __INC_HAL8188EPHYCFG_H__
 
-#define LOOP_LIMIT			5
-#define MAX_STALL_TIME			50		/* us */
-#define AntennaDiversityValue		0x80
-#define MAX_TXPWR_IDX_NMODE_92S		63
-#define Reset_Cnt_Limit			3
-
 #define MAX_AGGR_NUM			0x07
 
 enum rf_radio_path {
@@ -26,7 +20,6 @@ enum rf_radio_path {
 #define MAX_CHNL_GROUP_24G		6	/*  ch1~2, ch3~5, ch6~8,
 						 *ch9~11, ch12~13, CH 14
 						 * total three groups */
-#define CHANNEL_GROUP_MAX_88E		6
 
 struct bb_reg_def {
 	u32 rfintfs;		/*  set software control: */
-- 
2.34.1

