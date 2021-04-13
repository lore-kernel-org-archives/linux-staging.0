Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A8671
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 14:10:58 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id m9so3887265wrx.3
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 07:10:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=StmWosAqmPvyTpA5E50Wou71XRa8HdKzDscM5ABNr55qfv8aEjc2BPOffT9X2amJhb
         sgBJCLuHUVVf9QQ76RbD6uBdoAllOKyWok59IPUrnqz35qpESAQbs15fbeKxdCrrmAlE
         +aaqvtWdoPzfAP9zh5pa+z9x+ERvylFuTGozBccJt+5pY/K8yLfqB0p51hK5gYVtUc2R
         9Lqu9rphDH4blILBRJa00Ska+1Q4wbRMLEmQ/mekNv1cglMpcbRQ9kL4E0xx1ExPZcGP
         5j7rSUJ+O14RGpKVBKpgH/QQmrQKi6drlJU6aL2DMBqskajrBaPJep1JIcq8+iKW5YKG
         lwfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZHxXKOLbXXf4jCbvUXo0q9HvS5LSluPLIgJqE3tNdY0=;
        b=WBOTr/FZQk6eJl1kdoMqB3DBtBQBD1LN0hrdHYaVSkwLUXSvBDyUsJuGyKrz7NayaW
         +UG9wzwbfTDcPKTNX2kJpBbqCxxdeAP+bgAOErmvOZA9+wPgXWSViehE9TInKsXXL+Iy
         RHpht3Di8n/E4ELuDgzGJukbyqKD0S8ql0RJvVpYMacA90iDaQYVOvMuu8fOUCJk0QeL
         Ovm6juLA8IgZdydyYy/wcTOLNrTajuxinzXa5Y7J/2N2DnCjT8uRkwMckhwGrKjPW9Zv
         zKLA+Nw6qldPzQIGk1ymsxkWTT71WqPh772PrJvQ5IbYKRmXnCv+V/opHeTdikjdyRyO
         t+GA==
X-Gm-Message-State: AOAM531gBNFYX0k9FBQzZBIdh9aLPdzPjIKXEGTQ+fBcUCjY/iBno9i1
	uWwinas4corz/e+gddbYKpU=
X-Google-Smtp-Source: ABdhPJyZ3r7quLihI/5dLMrLQxHkuI1Sn0dinWQuzqJuxaHf6fgOZMim1uOtoBdV0940OBObvuyojA==
X-Received: by 2002:adf:fb0e:: with SMTP id c14mr38174219wrr.140.1618323056943;
        Tue, 13 Apr 2021 07:10:56 -0700 (PDT)
Received: from agape ([5.171.81.171])
        by smtp.gmail.com with ESMTPSA id s83sm2610974wms.16.2021.04.13.07.10.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 07:10:56 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: 
Cc: julia.lawall@inria.fr,
	joe@perches.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 7/7] staging: rtl8723bs: remove unused argument in function
Date: Tue, 13 Apr 2021 16:10:42 +0200
Message-Id: <c1924d9369d4b2ba6224b3d280d6087f2a281e5b.1618322367.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1618322367.git.fabioaiuto83@gmail.com>
References: <cover.1618322367.git.fabioaiuto83@gmail.com>
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

