Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A1991118
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 09:52:40 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id z2so1984672edc.1
        for <linux-staging@lists.linux.dev>; Fri, 02 Sep 2022 02:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=I2CMut/xLnohqiOeRPhToMpVupJG8sBwirkVo5Ugtp8=;
        b=XPkVhpajSgeOl3jthw2K/4L0o4HgIOYtqKy89UewAW8VI7GJKiow4qs/dz4Hxni2MP
         tMBMJRJIt2LVZvILffAhp0Jvbp6lF3aVP6Xo4HqlNP5eJAlkGhfgNUuU4Q38tNCHMpHf
         +n1WyvQg43+bIF41LzjxefD7G46+CGaob1A0/17TgdzVq+GrYMJHiR6zRvazTIrYkny6
         lN2sHhFnrG29giXrwrZxDJUCIvK7+zUddzSOdvG7/+CE8nEeRjwkG8xryAxroTU0EWok
         5M+E5TX5mrlDEVQ85DHFKD3u3P1HJ2LsJ8PSge0zkAAd8vhVELM4JhftxLqio6TSuDgs
         nmXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=I2CMut/xLnohqiOeRPhToMpVupJG8sBwirkVo5Ugtp8=;
        b=ppFGjgIlmncBUmX3ghFjlhtHBH3VQvnlWKIDFE7tav2SFFOZdrbsSp9Z63sKkPZJS3
         KAdzJduerk8qmCo0TvvWHPF0WraUV9+REApDeyio607b5nqiiBKRw/bQ0BVaqPa2asK5
         dZBHZkH1UE9aEDHF9u6jQ8D3/RMI4XnyVKxPMFTQCo98KT0/ngWfdoJJIkVruqf1rXnH
         s2LXDknj4QWYl8TBmpb7WKwzgLNa2kYGP/QyeWVLqkcjKyKR9KsMXM6wGq2xtnB8EjcF
         NE7raLiQ/Nhqf6uq+bEeUPHEyNrBhEKoLJhURVSCgrm1Zqm7Om/VN1YJLa6DhRq4cMM4
         0G3A==
X-Gm-Message-State: ACgBeo1E3JgR1mkgLldq1ImoRs/uX2aC+UucxiUeUrVzUF0wZ6ez6QYe
	6fmmv0VDk3/FGo/pB+RWaRg=
X-Google-Smtp-Source: AA6agR7p5DBC0WFY2HjkeGarebVEyMN8s5tyoWDQRslbSRMaLvPkWm5S6dMsnJ2VWitJzSCtcSCXKQ==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id et15-20020a056402378f00b0043ad3f579f2mr32546430edb.338.1662112359933;
        Fri, 02 Sep 2022 02:52:39 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id h6-20020a170906828600b0073d6234ceebsm959601ejx.160.2022.09.02.02.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Sep 2022 02:52:39 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry.Finger@lwfinger.net,
	gregkh@linuxfoundation.org,
	hdegoede@redhat.com
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 08/10] staging: rtl8723bs: remove rtw_hal_is_disable_sw_channel_plan
Date: Fri,  2 Sep 2022 11:51:58 +0200
Message-Id: <4398fec06b0f8defaa7da9d6abbc155cbb7ae630.1662111799.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1662111798.git.namcaov@gmail.com>
References: <cover.1662111798.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove function rtw_hal_is_disable_sw_channel_plan because it is not
used.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_intf.c     | 5 -----
 drivers/staging/rtl8723bs/include/hal_intf.h | 2 --
 2 files changed, 7 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_intf.c b/drivers/staging/rtl8723bs/hal/hal_intf.c
index 94ecefb9113d..6bb0ff8d7c78 100644
--- a/drivers/staging/rtl8723bs/hal/hal_intf.c
+++ b/drivers/staging/rtl8723bs/hal/hal_intf.c
@@ -400,11 +400,6 @@ c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter)
 	return adapter->HalFunc.c2h_id_filter_ccx;
 }
 
-s32 rtw_hal_is_disable_sw_channel_plan(struct adapter *padapter)
-{
-	return GET_HAL_DATA(padapter)->bDisableSWChannelPlan;
-}
-
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid)
 {
 	u8 support;
diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 45bebbadb7ca..5cffab2d06ff 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -353,8 +353,6 @@ bool rtw_hal_c2h_valid(struct adapter *adapter, u8 *buf);
 s32 rtw_hal_c2h_handler(struct adapter *adapter, u8 *c2h_evt);
 c2h_id_filter rtw_hal_c2h_id_filter_ccx(struct adapter *adapter);
 
-s32 rtw_hal_is_disable_sw_channel_plan(struct adapter *padapter);
-
 s32 rtw_hal_macid_sleep(struct adapter *padapter, u32 macid);
 s32 rtw_hal_macid_wakeup(struct adapter *padapter, u32 macid);
 
-- 
2.25.1

