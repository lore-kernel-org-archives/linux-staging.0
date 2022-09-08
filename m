Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E672F43
	for <linux-staging@lists.linux.dev>; Thu,  8 Sep 2022 13:09:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id r18so10686918eja.11
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 06:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=cGFpUSmhQHaWihVu0s0KApe/+KGdqA3knsE2olHsXIk=;
        b=jh9PzIt2P10qdIEkjsUpIYuzKaPb+lvGRiATn6Wb5NEaXcRM3hJAogEw80jCaQYOGE
         zqW0dhp97W2U7RDuEBvbn7S5bbPKk7z8Fm3I/SSvzf4IK2vHbf3etwqbSg7k4suELSoA
         SZDDRPTkgWdb+XBEYwYmNeCreIYkutvO+Tf8NirFDDAPuuOrTj3cl3+bCshQ5LA9EDqV
         /YF4N9WiMxd10KBPLNvV7+5LQNiruts30dLXuk/DPJOGfiG3tz3nqXNVNVIbvEuDNehQ
         nTGfjY2PXQTAY8wWjT0rWu+Zf4JcAWHQ6tFqVwvBkaY3o4fhvmH96OPTDyJrgP6QDr3r
         RM2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=cGFpUSmhQHaWihVu0s0KApe/+KGdqA3knsE2olHsXIk=;
        b=Al6pjp2fC0sVlbQ57ONLJujeXcLpjwrR/rxlZv86gHHZyljmXZZTAfU3OArxpTAExH
         PQ6DpunUMCobeophKs/9Nc/C9+JIv6goxlA0Ct6emmje8o4qfSfcvKX1XeIIH8wQTDPW
         LdzBJLbjA00AxWN2e7MXMkS4ljOvqdx0gE18UEzyV6DYV4Gvx5fyUB3CJIW14gp2FBCt
         dE9KkOeFjB4e8RtlnV+w2Nck96Eu/kvJeCKEWM0Z6jL6raSiS0uc+6pk26RsKBmnjEfw
         bfUfUDz84vWQn7vQcvZaMoUs4xrT43d0lee/Ex3S89i2SEuPX/coR4xKicGOoKZ+iPtw
         1+RA==
X-Gm-Message-State: ACgBeo3aDiWRbVRT31vcM8+t2G9WNZysBKP2AQGiQVaVplQl9taZBvCP
	Gc3DR+eX7h250Wk2BLJ9F+0=
X-Google-Smtp-Source: AA6agR5wjEYXLPTWfEcMIrJUlXxqc2csMgnNhGtg8NOwAomgI/0oEPkMSFv9GejAOxOiI+/2iytfBA==
X-Received: by 2002:a17:906:dac3:b0:748:8cbf:3c50 with SMTP id xi3-20020a170906dac300b007488cbf3c50mr5890416ejb.136.1662642567246;
        Thu, 08 Sep 2022 06:09:27 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id cf6-20020a0564020b8600b0044edf0a2deasm4847978edb.69.2022.09.08.06.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 06:09:26 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: r8188eu: remove unused parameter from UpdateBrateTbl()
Date: Thu,  8 Sep 2022 15:09:13 +0200
Message-Id: <20220908130915.8406-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220908130915.8406-1-straube.linux@gmail.com>
References: <20220908130915.8406-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The parameter 'Adapter' of UpdateBrateTbl() is unused. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme_ext.c    | 2 +-
 drivers/staging/r8188eu/core/rtw_wlan_util.c   | 2 +-
 drivers/staging/r8188eu/include/rtw_mlme_ext.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme_ext.c b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
index 893dac30e8e6..ad8bfc29c4ce 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme_ext.c
@@ -1409,7 +1409,7 @@ unsigned int OnAssocRsp(struct adapter *padapter, struct recv_frame *precv_frame
 	pmlmeinfo->state |= WIFI_FW_ASSOC_SUCCESS;
 
 	/* Update Basic Rate Table for spec, 2010-12-28 , by thomas */
-	UpdateBrateTbl(padapter, pmlmeinfo->network.SupportedRates);
+	UpdateBrateTbl(pmlmeinfo->network.SupportedRates);
 
 report_assoc_result:
 	report_join_res(padapter, res);
diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 235dbf353802..065ab274b0b4 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -222,7 +222,7 @@ void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *bssrat
 	memcpy(pbssrate, supportedrates, *bssrate_len);
 }
 
-void UpdateBrateTbl(struct adapter *Adapter, u8 *mbrate)
+void UpdateBrateTbl(u8 *mbrate)
 {
 	u8	i;
 	u8	rate;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme_ext.h b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
index e092e646c0d2..e70640f1e41d 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme_ext.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme_ext.h
@@ -393,7 +393,7 @@ extern struct xmit_frame *alloc_mgtxmitframe(struct xmit_priv *pxmitpriv);
 unsigned char networktype_to_raid(unsigned char network_type);
 u8 judge_network_type(struct adapter *padapter, unsigned char *rate, int len);
 void get_rate_set(struct adapter *padapter, unsigned char *pbssrate, int *len);
-void UpdateBrateTbl(struct adapter *padapter, u8 *mBratesOS);
+void UpdateBrateTbl(u8 *mBratesOS);
 void UpdateBrateTblForSoftAP(u8 *bssrateset, u32 bssratelen);
 
 void Save_DM_Func_Flag(struct adapter *padapter);
-- 
2.37.2

