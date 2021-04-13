Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9E2829CA
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:56:48 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a4so16794254wrr.2
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=IaQucwZ/k3wSgPemYP4hvYCtorTRGTw3JOwACKfee61xAFKbl6wbZLJ+byB6w0RpZm
         WSkN7ayAZwJZKUFlNBZRC1yFkeUAukF+0R2GLKLKXp2BGdJtVQp4TpnlcvYS1lCyh76t
         K19h8SNi01MpRRQ+LjSKsgQUgwaSQQ1Fyze64li9rStXcvongVuotKJc/6WslyKsl8LL
         X040IeLRvg6EICSRY9ySDVWhztvPWMojQwb5ptg4Hd6omsEGsAA5trdT3MBP2OGZoaRu
         nVxUHU9luWmIIqyKJW4LvNc/6H0rSSXKbWMJCtTdTU335hCA1aJ5ncJXdO4g2051Q3fl
         LKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=FAlbAFU8hqHT63TQF4Bjmw4U0+5hJtRPe0G2tBM2mxDCzqri5/Aq02ObXIpjQP0ARg
         wcITcP52rJFeqJUGS4P0h1kPdvuZIUs9FT+Gw4X95GnQZDq5oFiJTFpTuFdUxedVLXdJ
         XiGkEGEOb7K2CkNGqX5Xhd1QykO2c81TvYmUA+63b8FdJoftaXsd3m6PkrlXaxyOfOdd
         BKgAB9iSLC1Lie5Yr74IXcIWZFdGUya1JAXWaDPxn8Dy0uRTGZmqlBlVYwR+ACFWjTDD
         u+UDUK/hftQwMvx2OAnsYtURsBmklREnY5FKbQZ2d1a2VJjxXImOaJqry2QqY1lC1K9m
         yfpQ==
X-Gm-Message-State: AOAM532RiODxWLYBvzM7XxEb7AznJ9DwoBX7FVq9NORAaOyXM6hkc+sI
	YXoc/Bi6FTImu7QMTEZFfxo=
X-Google-Smtp-Source: ABdhPJz9jimvvAHP9OzWZqVK5vg0l7p86IDh/A5NdAGdxir2lBd7fVKvLtCcULUQGi5T8ppSEcnleg==
X-Received: by 2002:a05:6000:1acb:: with SMTP id i11mr37844029wry.68.1618325807413;
        Tue, 13 Apr 2021 07:56:47 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id f9sm2753104wmj.38.2021.04.13.07.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:56:47 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8723bs: remove unused argument in function
Date: Tue, 13 Apr 2021 16:56:35 +0200
Message-Id: <df29f5bb5799b96cd8c4557249ca972dbc7c99cb.1618325614.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618325614.git.fabioaiuto83@gmail.com>
References: <cover.1618325614.git.fabioaiuto83@gmail.com>
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

