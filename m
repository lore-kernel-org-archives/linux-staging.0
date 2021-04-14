Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FB3971
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 12:18:58 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id j5so18701403wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 05:18:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=gJkkFRfNXLvG4jt+tAedtlI9HMvzaW04dmh3umM3HcL8YBFQ+HkYbIUYSYA2P9GnMv
         1u0CWq7g/42eETBBi5xylMZwd6YsTRCjNW/l4Ld+PNkBzcs+BuJ/nLczCUaGwAHZ2KfB
         UmxMlJOpTDs1KNwP8+QZlKBZTo3Now9+/+3Emb+bX2HylDkKipWSktda+6sPbhK/77aF
         2sSJOgAHyV1Jd+9P3jYmzWvD05vHKyZiVc8Vyb1y/VApvIPJk666HGZnMYRN8Kq2Or3D
         ys1z5kYexo9d9tiosq9ZtQr7YSM8wwe8QhFGPVE9p647Q5RujHhPG4FRUdAVeBUTyMw4
         isrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=AybGkIreOV0N5qSkPzJ2fmDL2TaHRoYFsY/MMbXGCRPdkLq/pvAs1eSUA+O6dIjl+O
         NvCVc20gVdJWJ+DdWh/Q9U3Jbra1yDyiclO746aTFzOdPJVLMsnbX2ucxvuKHwI8OIbd
         dnDTtTvNJMdCT5Tora0q6Lz4WczZBFAXq94ohJNRBwW9k6T2bvvGDeh+D7L4wAuqrUEk
         8lZlxnbxrG7p7qBSXwdVDHLO+8u+d8vxTet+YVnywT7KAcnm7J8sTpxeZStjV0tJT+Jt
         JNwSA7C2miEBIecscg1+XRuDymD4HRSiUXcuOjEGtypx4kxnPR8LX5TNWQkEhcMu3MZj
         g6PA==
X-Gm-Message-State: AOAM533FmAO8aC8BbDh46pC6pZkgSf9uYprwmJQLm5JwMzJVUHeaCiZf
	c5kddVAHO2OtntZuSuzwP+GOPoOX1JD5kA==
X-Google-Smtp-Source: ABdhPJyBJ45HRcrWjomGDuwO2FOKRJs5IPRgT/Iu973clDRIKmdk44+jguGbLV4OapK0PkPplq0FCQ==
X-Received: by 2002:adf:dd50:: with SMTP id u16mr12208810wrm.380.1618402737189;
        Wed, 14 Apr 2021 05:18:57 -0700 (PDT)
Received: from agape ([5.171.26.216])
        by smtp.gmail.com with ESMTPSA id u9sm5237502wmc.38.2021.04.14.05.18.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 05:18:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/3] staging: rtl8723bs: remove unused argument in function
Date: Wed, 14 Apr 2021 14:18:50 +0200
Message-Id: <1bd83b936584432fdb09406f26ed8a8b66cd4c8d.1618401896.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618401896.git.fabioaiuto83@gmail.com>
References: <cover.1618401896.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

removed unused 'void *sel' argument in rtw_odm_dbg_comp_msg()
function, after DBG_871X_SEL_NL replacement.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_odm.c       | 2 +-
 drivers/staging/rtl8723bs/include/rtw_odm.h    | 2 +-
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_odm.c b/drivers/staging/rtl8723bs/core/rtw_odm.c
index f4a0ef428564..f6b73a2a0270 100644
--- a/drivers/staging/rtl8723bs/core/rtw_odm.c
+++ b/drivers/staging/rtl8723bs/core/rtw_odm.c
@@ -90,7 +90,7 @@ static const char * const odm_dbg_level_str[] = {
 
 #define RTW_ODM_DBG_LEVEL_NUM 6
 
-void rtw_odm_dbg_comp_msg(void *sel, struct adapter *adapter)
+void rtw_odm_dbg_comp_msg(struct adapter *adapter)
 {
 	u64 dbg_comp;
 	int i;
diff --git a/drivers/staging/rtl8723bs/include/rtw_odm.h b/drivers/staging/rtl8723bs/include/rtw_odm.h
index 263e92cfea96..94fc68a5c424 100644
--- a/drivers/staging/rtl8723bs/include/rtw_odm.h
+++ b/drivers/staging/rtl8723bs/include/rtw_odm.h
@@ -13,7 +13,7 @@
 * This file provides utilities/wrappers for rtw driver to use ODM
 */
 
-void rtw_odm_dbg_comp_msg(void *sel, struct adapter *adapter);
+void rtw_odm_dbg_comp_msg(struct adapter *adapter);
 void rtw_odm_dbg_comp_set(struct adapter *adapter, u64 comps);
 void rtw_odm_dbg_level_msg(void *sel, struct adapter *adapter);
 void rtw_odm_dbg_level_set(struct adapter *adapter, u32 level);
diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 98c9eb399ba7..816033b6847c 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2622,7 +2622,7 @@ static int rtw_dbg_port(struct net_device *dev,
 				case 0x16:
 				{
 					if (arg == 0xff) {
-						rtw_odm_dbg_comp_msg(RTW_DBGDUMP, padapter);
+						rtw_odm_dbg_comp_msg(padapter);
 					} else {
 						u64 dbg_comp = (u64)extra_arg;
 						rtw_odm_dbg_comp_set(padapter, dbg_comp);
-- 
2.20.1

