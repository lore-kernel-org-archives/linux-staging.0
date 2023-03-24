Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED17728EA
	for <linux-staging@lists.linux.dev>; Fri, 24 Mar 2023 08:43:46 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r11so4909316edd.5
        for <linux-staging@lists.linux.dev>; Fri, 24 Mar 2023 01:43:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679647425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hoF1dEts5ZEjp1FZMKp6l1BB4iGLDqqZHFHPN/cDT+w=;
        b=Q2VJ6600mh7wJmjZ84lQ+DLwBgjP/ZkP4WG27uAKbRDfk1tllcRibWV7wshgCtm7oo
         Su11VKIashAdjwci+IPkcdpp1rAp8VJ8Wc65gIEFwMzqQRIeDYOEnZrgyze3dbnj0AUw
         ATs0FmLx3rBffOTbS1qsxi+DUOsnHG5I69RLu7papZ+9u9iSOeP+YlsSoGVpBtLrhIfR
         hV6yhGiKenwGfzaEiAem4TT7Px47IlWhh3m6O7S9ueqYzblYlSDYFjCdy5QuRnuqjrmC
         b4b36nDqPnPQtOdzgdcxo7Gug6Gk1KFoBi4FLl4snqZ/jYw+2BlcEh37deY8TBPu5a/U
         REpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679647425;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hoF1dEts5ZEjp1FZMKp6l1BB4iGLDqqZHFHPN/cDT+w=;
        b=eljlPuNG+3eU2asNArRIzVqJ6vMj14/rrYE0KaJRv4FCKwJ0dMfgv4sAFXyrnmwknm
         GXKXymk3P33kP7tB/lKPIGpfeG8nAg8Z1uGJ7gz7Qy2+eAEJ+j7TSJMagO0bRxVMGTng
         7lexfajzQitO90tbeJY1EeX+Dgv20A0QOb45a69bTolYOJPNHpufmZ0rGpcScvwvGZHh
         7ngZx9Ty9R1ui61ezVHQlYAFKjJU3y1pGsmnYx0yFXULSVvMatzYlttzag2wjuJu80d+
         TJSHRTzI7/n08g4EqvObQpE8lh2Uh8jRWrmi3HxWiuX65fOQ0bITdto+nw4ny2cWzA/+
         EsBg==
X-Gm-Message-State: AAQBX9f6hVkuYzBmxvFmJPGCB+VbgmLppUtbUwzyYB/T0CWyn15u8T5w
	hjOqAqV7K2W51b4MHkKyHFU=
X-Google-Smtp-Source: AKy350ZW6xqQvOqO/VfaeFxStYTGjKxp2uX44My6oX33yfrkeNHAhpBEVBsgERp49fRxigRk1ts9gQ==
X-Received: by 2002:a17:906:4e0a:b0:931:829c:9d58 with SMTP id z10-20020a1709064e0a00b00931829c9d58mr1792963eju.23.1679647424996;
        Fri, 24 Mar 2023 01:43:44 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbaa.dynamic.kabel-deutschland.de. [95.90.187.170])
        by smtp.gmail.com with ESMTPSA id m2-20020a50d7c2000000b00501fc87352fsm3541841edj.13.2023.03.24.01.43.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Mar 2023 01:43:44 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove hal_btcoex_SetChipType()
Date: Fri, 24 Mar 2023 09:43:34 +0100
Message-Id: <20230324084334.12183-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.40.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the function hal_btcoex_SetChipType() as it does nothing and
produces the following gcc warning when compiling with W=1.

drivers/staging/rtl8723bs/hal/hal_btcoex.c:1182:30: warning: variable 'pHalData' set but not used [-Wunused-but-set-variable]
 1182 |         struct hal_com_data *pHalData;
      |                              ^~~~~~~~

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_btcoex.c        | 8 --------
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 1 -
 drivers/staging/rtl8723bs/include/hal_btcoex.h    | 1 -
 3 files changed, 10 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_btcoex.c b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
index e36f8c369a04..e26b789b9cdd 100644
--- a/drivers/staging/rtl8723bs/hal/hal_btcoex.c
+++ b/drivers/staging/rtl8723bs/hal/hal_btcoex.c
@@ -1177,14 +1177,6 @@ bool hal_btcoex_IsBtDisabled(struct adapter *padapter)
 		return false;
 }
 
-void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType)
-{
-	struct hal_com_data *pHalData;
-
-
-	pHalData = GET_HAL_DATA(padapter);
-}
-
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum)
 {
 	struct hal_com_data *pHalData;
diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
index 0fcae6871108..c3c1b49674d3 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
@@ -2304,7 +2304,6 @@ void Hal_EfuseParseBTCoexistInfo_8723B(
 	}
 
 	hal_btcoex_SetBTCoexist(padapter, pHalData->EEPROMBluetoothCoexist);
-	hal_btcoex_SetChipType(padapter, pHalData->EEPROMBluetoothType);
 	hal_btcoex_SetPgAntNum(padapter, pHalData->EEPROMBluetoothAntNum == Ant_x2 ? 2 : 1);
 	if (pHalData->EEPROMBluetoothAntNum == Ant_x1)
 		hal_btcoex_SetSingleAntPath(padapter, pHalData->ant_path);
diff --git a/drivers/staging/rtl8723bs/include/hal_btcoex.h b/drivers/staging/rtl8723bs/include/hal_btcoex.h
index fb167642da01..525cce3574fe 100644
--- a/drivers/staging/rtl8723bs/include/hal_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/hal_btcoex.h
@@ -23,7 +23,6 @@ struct bt_coexist {
 void hal_btcoex_SetBTCoexist(struct adapter *padapter, u8 bBtExist);
 bool hal_btcoex_IsBtExist(struct adapter *padapter);
 bool hal_btcoex_IsBtDisabled(struct adapter *);
-void hal_btcoex_SetChipType(struct adapter *padapter, u8 chipType);
 void hal_btcoex_SetPgAntNum(struct adapter *padapter, u8 antNum);
 void hal_btcoex_SetSingleAntPath(struct adapter *padapter, u8 singleAntPath);
 
-- 
2.40.0

