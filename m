Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 466183FC5
	for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 09:58:03 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id d207-20020a1c1dd8000000b00307e2d1ec1aso8483932wmd.5
        for <linux-staging@lists.linux.dev>; Sat, 18 Sep 2021 02:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7P045dEU7nb9Dn+sQy4wSUSI87UBpJSz893JclonIw=;
        b=bCKCXfmE6IM316LMsRbAD29MOdyh0Wy65zxUN9K3t2Vz5k2f8YPWyaDUub/YbxqNqj
         Rh34bDdK7uZxLtTyHghb0B4MLj8aQ5VaJ9UGjSymf9RBOezLdlY1jQFmG0hYaqRnAz9k
         ZsPbJBkcJBZGhEG1uB0ADqzBRVL0H9J9EYRKQn1jPvR/4m1huyIbH+/hsCparVI08fbs
         4jTtAgOb8mubOIWQ8fskmArwKqWYz7t36UD2S7Bo0MAayMwLg1QZisPeJVOdLbkuYaDD
         kvobkDUzbI1ZIUHrTA33NnjM7EyXDsWMVuUsP05c30QuSXX5RlnutZuMTIZeMxsFd0P1
         qURg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7P045dEU7nb9Dn+sQy4wSUSI87UBpJSz893JclonIw=;
        b=H0HlC0HcpHRgUihImkHkNnLfCUBLVqEtnf1qacBJqS7QExB7Q0ppLL5wSzn+ZLEt/T
         ZDeMVcVRUjOGYjkol7qddRhlwRPfAQEuZMdRtJhhg5SroyFN7YhU4q7a2KanDfNcBziP
         AOLi6TIoHgZBukRqqLEiFtQFLi/fYQhqitK2T0D0c4ycJx9aQ60s+yaBPah0FA71fQV7
         rDHeaKLa7V0dym/bxdljGVAM7PEnGe2j2lPbv3rZp2LMALGlkOnyr+9iMK8EFk3zBnxj
         symQseDsWClRjJUyCiUKL3UqspceQAxfdC7hpiQN/VYxcv7HYhXWh7/McHnUsxVfZSiq
         KxNg==
X-Gm-Message-State: AOAM532doz+I2IkA4XASDCac59XdYX8QfMWkRgcdrPbdDLoC1zuPLuww
	DMJ20H6sQ1AfyFuShHtcSMU=
X-Google-Smtp-Source: ABdhPJxthwx+gq1M4zpjGXsn0otM1mjjj2fIkb9Yle8g7PfzKpfH1WGoZl7xMxnO6Ix4swH7n9uXzA==
X-Received: by 2002:a05:600c:35c8:: with SMTP id r8mr2756694wmq.71.1631959081709;
        Sat, 18 Sep 2021 02:58:01 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::ae40])
        by smtp.gmail.com with ESMTPSA id o26sm13013287wmc.17.2021.09.18.02.58.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Sep 2021 02:58:01 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 7/8] staging: r8188eu: remove rtl8188e_set_rssi_cmd()
Date: Sat, 18 Sep 2021 11:57:26 +0200
Message-Id: <20210918095727.13591-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210918095727.13591-1-straube.linux@gmail.com>
References: <20210918095727.13591-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtl8188e_set_rssi_cmd() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 15 ---------------
 drivers/staging/r8188eu/include/rtl8188e_cmd.h |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index 6cdc2e40aad4..6450c2c32f8a 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -109,21 +109,6 @@ static s32 FillH2CCmd_88E(struct adapter *adapt, u8 ElementID, u32 CmdLen, u8 *p
 	return ret;
 }
 
-u8 rtl8188e_set_rssi_cmd(struct adapter *adapt, u8 *param)
-{
-	u8 res = _SUCCESS;
-	struct hal_data_8188e *haldata = GET_HAL_DATA(adapt);
-
-	if (haldata->fw_ractrl) {
-		;
-	} else {
-		DBG_88E("==>%s fw dont support RA\n", __func__);
-		res = _FAIL;
-	}
-
-	return res;
-}
-
 u8 rtl8188e_set_raid_cmd(struct adapter *adapt, u32 mask)
 {
 	u8 buf[3];
diff --git a/drivers/staging/r8188eu/include/rtl8188e_cmd.h b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
index 626df5f44fc5..01404b774ebd 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_cmd.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_cmd.h
@@ -91,7 +91,6 @@ struct P2P_PS_CTWPeriod_t {
 /*  host message to firmware cmd */
 void rtl8188e_set_FwPwrMode_cmd(struct adapter *padapter, u8 Mode);
 void rtl8188e_set_FwJoinBssReport_cmd(struct adapter *padapter, u8 mstatus);
-u8 rtl8188e_set_rssi_cmd(struct adapter *padapter, u8 *param);
 u8 rtl8188e_set_raid_cmd(struct adapter *padapter, u32 mask);
 void rtl8188e_Add_RateATid(struct adapter *padapter, u32 bitmap, u8 arg,
 			   u8 rssi_level);
-- 
2.33.0

