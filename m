Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571361FC8
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 10:37:27 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id bq8so14361055ejb.10
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 03:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=E7AklIE8B1vYygpUOxvh3w3+3byLOzac1fnd/Uj/h2s=;
        b=NNifbRwg4S4cxDrYPUEDGKfpijweCcI/DZLG/ft6bUUna9Wv9r1MFcZcUXu4PWeeWg
         zsKBJsogRpnKDxxUn/FcEGuXKsx+Woymlp/qy944kB+N9+GgLL54rl1WWH441lrCUpav
         LLnfKYaEfpwMf/Wxejz+qB73H5TKAI8IQ//0uGiE9ze53KCu78DjSuztiwiQB5KM5mAv
         Q/gmCfKutPKIXU8JClYdhHLFIgSjiYDAMQayGb3L9QJta9P6RM22QWTa8/UI5euKeoJl
         4mGeQC+ObMAqBumLDmReI2v/G/7AZT9vomUMm7qz9kv5do9utzjRaq5BoJ8ryg9sW0gp
         qpFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=E7AklIE8B1vYygpUOxvh3w3+3byLOzac1fnd/Uj/h2s=;
        b=Lh4fL2t+KqJr4kw+8nJx/NVIysFy95qrBBGces2BtvffaPtTCjcGas8rsbVgFUXefS
         uaUCB57hEymHHg+90lCLk9sNxvMWMfjZScB7e9/kKh8aNkjohKpRLyhEpb7NShezxlic
         Bh3evt8Nv3ovOj3PXwDsiDYYxqI9ZQQL12MEiH9VGIf5RECs1zE7JJBtIfiIpJUjEkLt
         JWJPhB7WXu5AA/GuMX9QGwOkJbKuShAqd2lFs8+ojJcGhARXdB1E8qVa8N9tMKhPuqqM
         Wa0C0PYzekuCwE72imXLEQ2mjceWPLLRaBU0NX2HfwMg2oIm1FeZCKwAwwP0dUtUU4Aj
         HO+Q==
X-Gm-Message-State: AOAM530LN+5G7B9PnoHP/Illxe8rn04kWFP1q1eMLW3+meNqhwJ5Z6Qa
	cYs/8/Oj6vwdHEaK9TzKHLcfgOqApP0=
X-Google-Smtp-Source: ABdhPJy3LW1iCrohUAkw/yg8t/AEStCsWy9OScO6T4SDi1PU9JJw0z9ucPSrULegT+7ruB2vQlUmfg==
X-Received: by 2002:a17:907:9705:b0:6e4:b769:286f with SMTP id jg5-20020a170907970500b006e4b769286fmr6585311ejc.728.1648982245655;
        Sun, 03 Apr 2022 03:37:25 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b006e1382b8192sm3130751ejc.147.2022.04.03.03.37.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:37:25 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: remove macro rtw_pwr_wakeup()
Date: Sun,  3 Apr 2022 12:37:12 +0200
Message-Id: <20220403103713.12883-4-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403103713.12883-1-straube.linux@gmail.com>
References: <20220403103713.12883-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

After previous cleanups the rtw_pwr_wakeup() macro is just an alias
for _rtw_pwr_wakeup(). Remove the macro and rename _rtw_pwr_wakeup()
to rtw_pwr_wakeup().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 3 +--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index ee324c18a1b9..6f97c7a879a5 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -352,7 +352,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter)
+int rtw_pwr_wakeup(struct adapter *padapter)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index fd301a9f117a..4cc365aa3fa7 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -121,8 +121,7 @@ s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
 
-int _rtw_pwr_wakeup(struct adapter *adapter);
-#define rtw_pwr_wakeup(adapter) _rtw_pwr_wakeup(adapter)
+int rtw_pwr_wakeup(struct adapter *adapter);
 int rtw_pm_set_ips(struct adapter *adapter, u8 mode);
 int rtw_pm_set_lps(struct adapter *adapter, u8 mode);
 
-- 
2.35.1

