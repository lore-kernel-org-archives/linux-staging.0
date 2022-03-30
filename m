Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464007B;
	Wed, 30 Mar 2022 15:31:06 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id a1so29811980wrh.10;
        Wed, 30 Mar 2022 08:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJz7fYhfJWqCmC2Mcr5bDAKKPMhr/W9ez4DMr6xey+k=;
        b=ceMznRGpwFxnxcArdnMPvl5HfRy3xwhignwESlXi8csYWIHvoOJgFAo5Zgd/QYaJV7
         MgyMMgu7jf1EjzdpvqwE/VKjXqFQEwIjy5oy0T8WiPOG33kxtDrxRmkyVw21mQvd1q8e
         SNb6F9/3Ot8HjzH09hMBFZaJ2SDZVPbI/JjgPF+iBHtv4WPJvP2OTSDslvQrO/Pv8Rr3
         3K+k8g933wH7ED+RGvaewwvAzJpOS4/MuFF5np0jd8FPaDWtbn8r067f3TZ9hpGBjgLo
         YG6uGUp1ZzhAdf4W6UYRgZG4ikloQBt6WRXWtkzhzpgyeBJihtgSUOx8ubhs9gPO8ksE
         kC2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gJz7fYhfJWqCmC2Mcr5bDAKKPMhr/W9ez4DMr6xey+k=;
        b=NnJhv89mXiuUtIgzwMtGcDxwfFeZRTu53xxnS/eXIO4yFlVqoC3CO4Zv7SRdBNG9ow
         sUq9SYja4y++e3vQGtX9crSfDeJsswbG4qo9MSZYnDZLUH0r9TT9nQfK0Jvua094rL42
         eywRm4jJutzL7vQHwN1enFXBOJR2AtSqXj/ek+AzaCu6BA/iogU6EDR5ilO4NTK8kPJQ
         4O66vXiqemfpWWVYSNnfQW5JA6ranSr08J0/Rhsp5vBwVpgFqZHu4KZ7X/9jsqtKzrUq
         0HNuI/JBTFo1BUxsNrRUZ4/uFiXWU51XPhgwxjxgMiYF3RCbBNpJXRlfcfC5KMeMF+EC
         Wp7Q==
X-Gm-Message-State: AOAM530mAe0jnIjJSoK2uf1CKiFcgrBaMfYnv7LkWIdXrLNYbKbEorNT
	raWMvPjpiiosz3KeJXwjBaA=
X-Google-Smtp-Source: ABdhPJxbORWcrgcXzlxBYwb0i9BcaEP/wUxgwjqJd3r8z/OOO2KndntviGQfobOQHpFnLywO1zI5fQ==
X-Received: by 2002:a5d:64ce:0:b0:204:1177:e1c4 with SMTP id f14-20020a5d64ce000000b002041177e1c4mr134091wri.692.1648654264520;
        Wed, 30 Mar 2022 08:31:04 -0700 (PDT)
Received: from alaa-emad ([41.37.132.115])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b00205aa05fa03sm13450509wrr.58.2022.03.30.08.31.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Mar 2022 08:31:03 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH] staging:rtl8723bs:rtw_cmd.c remove suspect indent
Date: Wed, 30 Mar 2022 17:31:00 +0200
Message-Id: <20220330153100.5813-1-eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix "WARNING: suspect code indent for conditional
statements (16, 32)" for line 1240
founded by checkpatch.pl

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 14d37b369273..46e18a90529f 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1238,7 +1238,7 @@ u8 traffic_status_watchdog(struct adapter *padapter, u8 from_timer)
 		/*&& !MgntInitAdapterInProgress(pMgntInfo)*/) {
 		/*  if we raise bBusyTraffic in last watchdog, using lower threshold. */
 		if (pmlmepriv->LinkDetectInfo.bBusyTraffic)
-				BusyThreshold = BusyThresholdLow;
+			BusyThreshold = BusyThresholdLow;
 
 		if (pmlmepriv->LinkDetectInfo.NumRxOkInPeriod > BusyThreshold ||
 			pmlmepriv->LinkDetectInfo.NumTxOkInPeriod > BusyThreshold) {
-- 
2.35.1

