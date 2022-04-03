Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88F3346AF
	for <linux-staging@lists.linux.dev>; Sun,  3 Apr 2022 10:37:25 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id b24so7777010edu.10
        for <linux-staging@lists.linux.dev>; Sun, 03 Apr 2022 03:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=K6tvqdTFA299G8+SEfu7H95L5YODhmmKREl6BdiE8C0=;
        b=NBK9/HAFdazkxZGmYF6Fn6jseabDHnPMzOakAWAPjIKaNZd3XXLfQrZFIX3lPPSSAK
         eSvM2MiyarScp6nDjelzMcVd4wRkilZBvjtYOQE/J3SQ9l0zAoOsiZ6kgHKODBxmihee
         Vv5K1BxjUARzwmmcXpjWnjTHi6/DOg9cAJy1QecKts/fbKchwaELnFkjmHR31D20ra5z
         CXxvrEi/L2sBfoAOeZA7E3J1OX0/bzMqGtLB1IaKcclc0YbQpwjpmG4hNpd+Pm7dEe+W
         j/mvuf5luIGaU7y27OSJQ60CzaqSwthG8GiniphFZgPxaUOdgBiQvTp7Ac8ctaUSJDC8
         b2NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=K6tvqdTFA299G8+SEfu7H95L5YODhmmKREl6BdiE8C0=;
        b=twY3m6DWgYnUTe7LGhpLuLIttjConT8QWYucRYdlTDRwaikEjnLTDmMG7+rAMeKEJH
         6drosx9smi8CZSPXwq66Vtp0A9ux140WskUKn4gP5mEPWz/9VwDbSl+I3m6QoPnC1BdM
         I9lD6YVehHljq8r5J4ue9KAznkEUfmx/2uaxOQeRtro4pfqA39b/n9xCcR6ivMniXpOk
         D6WwgRx7uqLCpBcV43zueLPcjs0lwOgrmqCcWHIV9qI+LeshLUVpod/U86PYopcfyBZH
         mx+hXCAftwnC5Nq5zVBs2qKA9Ac0lMTJdODO1olUtcOHHzl7pHfH2o9+OWoa4vVYPlUk
         /XtQ==
X-Gm-Message-State: AOAM533pB0IwIc4cdRUpdh9A4sZksSM854cJhQ76oHHVx4EbCQeeEYaa
	npUrf4Vz6E2L/pRj8iRboy4=
X-Google-Smtp-Source: ABdhPJwaTtSI8eNsOGZM/dGErV1jUOJ1c1ciYhAcjWV9qLeFQx6qSztziaGdrs531JRjPB2O2YVKtg==
X-Received: by 2002:a05:6402:6c2:b0:419:1a14:8fb2 with SMTP id n2-20020a05640206c200b004191a148fb2mr29041775edy.415.1648982243942;
        Sun, 03 Apr 2022 03:37:23 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id kx5-20020a170907774500b006e1382b8192sm3130751ejc.147.2022.04.03.03.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Apr 2022 03:37:23 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/4] staging: r8188eu: remove unused parameter from _rtw_pwr_wakeup()
Date: Sun,  3 Apr 2022 12:37:10 +0200
Message-Id: <20220403103713.12883-2-straube.linux@gmail.com>
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

The parameter 'caller' of _rtw_pwr_wakeup() is not used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_pwrctrl.c    | 2 +-
 drivers/staging/r8188eu/include/rtw_pwrctrl.h | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_pwrctrl.c b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
index 7beabf82eb92..08e8a5efba5e 100644
--- a/drivers/staging/r8188eu/core/rtw_pwrctrl.c
+++ b/drivers/staging/r8188eu/core/rtw_pwrctrl.c
@@ -353,7 +353,7 @@ void rtw_init_pwrctrl_priv(struct adapter *padapter)
 * Return _SUCCESS or _FAIL
 */
 
-int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms, const char *caller)
+int _rtw_pwr_wakeup(struct adapter *padapter, u32 ips_deffer_ms)
 {
 	struct pwrctrl_priv *pwrpriv = &padapter->pwrctrlpriv;
 	struct mlme_priv *pmlmepriv = &padapter->mlmepriv;
diff --git a/drivers/staging/r8188eu/include/rtw_pwrctrl.h b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
index 7c3cb895c3cd..0a0f7a4c4052 100644
--- a/drivers/staging/r8188eu/include/rtw_pwrctrl.h
+++ b/drivers/staging/r8188eu/include/rtw_pwrctrl.h
@@ -121,10 +121,9 @@ s32 LPS_RF_ON_check(struct adapter *adapter, u32 delay_ms);
 void LPS_Enter(struct adapter *adapter);
 void LPS_Leave(struct adapter *adapter);
 
-int _rtw_pwr_wakeup(struct adapter *adapter, u32 ips_defer_ms,
-		    const char *caller);
+int _rtw_pwr_wakeup(struct adapter *adapter, u32 ips_defer_ms);
 #define rtw_pwr_wakeup(adapter)						\
-	 _rtw_pwr_wakeup(adapter, RTW_PWR_STATE_CHK_INTERVAL, __func__)
+	 _rtw_pwr_wakeup(adapter, RTW_PWR_STATE_CHK_INTERVAL)
 int rtw_pm_set_ips(struct adapter *adapter, u8 mode);
 int rtw_pm_set_lps(struct adapter *adapter, u8 mode);
 
-- 
2.35.1

