Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B8F23A0
	for <linux-staging@lists.linux.dev>; Thu, 21 Jul 2022 03:52:27 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id d7so634353plr.9
        for <linux-staging@lists.linux.dev>; Wed, 20 Jul 2022 20:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QQW5nE25CHVm8VEawfIVGFUrSWUWqh3HmVxegFkvxow=;
        b=AYuJZr9wq2go3piCOFO2k1Pw5/5FV6UFo2QcmlLsio85wLlePB6xgeL5y1mi/ZYfVG
         o8Tu5bvNHfkF66i9EJqK+czFjzBiNdmurhKhAN8YDZbXGPbSCU0ZOVkaUZ4XLCfrKxyL
         3JfBFgFmHa8Jh8f9MP9E6YftNsRHNXrC4loOfvrdwOunuuj8fOnn31yKS16Zz89BXlde
         R4GhLlZdpbJZ686WGgG1P+HaCZ2BZK4WFDFzkZi2lWQrMj1saM79mvJt/ThvjuCrxINm
         ruFsh697yY4X41oZhMX0A77dByb6gVn0m2E9tUfpF5dLTk97a4hAqO7fz8M5KYUm0hjd
         TiLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QQW5nE25CHVm8VEawfIVGFUrSWUWqh3HmVxegFkvxow=;
        b=TV+TzfpJP27XcQRePsWTkJ6I2cm4XEhb1zX9/Ar/UmYVlFn7p+Q8WcIs0JhddOygeK
         A9HksEmpeCrI2Xaxb/S7nbV6XJx1kj9TBuSNJQ7wX6pjyQ8duKBMGil7kF6tcB8F3p4I
         bcyh0mJ+RamwYKricAPWTdC7hOy+9mg0S0Rc8Hzru87dNDGRE/Uomw02yNcx0Dw+r16Y
         MQS31xUpz4woXYAv4x+NBV4tQP0/cggwbNN+ZX09gac2kYd7Tdsat5SNTQ9JTvUwPD2R
         VAwGZXtvpT7pVNOFHI3yRivV8AblN6AAURBRplIHLO83qPviK9D+JnIaJ/XAnnsykJln
         itYg==
X-Gm-Message-State: AJIora9O30L+U2eKhvwZs7BWWA9xSw10bymsBgNdb9VlHOcgpfr+P3SO
	odtTrzG5BTgFVelf7wjLDY0=
X-Google-Smtp-Source: AGRyM1spm/i8vUrmDSn5ax+V2bsi7iLLPEOhGw+xPyn3X77iZ/dLJLvRahYmFO9gCXoJ3sq/kj+4CA==
X-Received: by 2002:a17:90b:3909:b0:1f0:386e:c0a1 with SMTP id ob9-20020a17090b390900b001f0386ec0a1mr8937588pjb.64.1658375546989;
        Wed, 20 Jul 2022 20:52:26 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d01c:7038:d847:8f04:2f5c:26b2])
        by smtp.googlemail.com with ESMTPSA id b13-20020a170902d40d00b0016d231e366fsm373879ple.59.2022.07.20.20.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 20:52:26 -0700 (PDT)
From: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
To: 
Cc: abhijeet.srivastava2308@gmail.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Rebecca Mckeever <remckee0@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Vihas Makwana <makvihas@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: r8188eu: Inserted empty line after declarations
Date: Thu, 21 Jul 2022 09:20:39 +0530
Message-Id: <20220721035146.11719-1-abhijeet.srivastava2308@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <a2747f00-99b8-10a2-edf5-7dd6fd7a1f8b@gmail.com>
References: <a2747f00-99b8-10a2-edf5-7dd6fd7a1f8b@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Warning found by checkpatch.pl script. Resending this patch after
correcting my Username

Signed-off-by: Abhijeet Srivastava <abhijeet.srivastava2308@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index 5b6a891b5d67..6fbf6e4234cf 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -25,6 +25,7 @@ void rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
+
 		if (c2h && c2h != (void *)pevtpriv)
 			kfree(c2h);
 	}
@@ -323,6 +324,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare ssid list */
 	if (ssid) {
 		int i;
+
 		for (i = 0; i < ssid_num && i < RTW_SSID_SCAN_AMOUNT; i++) {
 			if (ssid[i].SsidLength) {
 				memcpy(&psurveyPara->ssid[i], &ssid[i], sizeof(struct ndis_802_11_ssid));
@@ -334,6 +336,7 @@ u8 rtw_sitesurvey_cmd(struct adapter  *padapter, struct ndis_802_11_ssid *ssid,
 	/* prepare channel list */
 	if (ch) {
 		int i;
+
 		for (i = 0; i < ch_num && i < RTW_CHANNEL_SCAN_AMOUNT; i++) {
 			if (ch[i].hw_value && !(ch[i].flags & RTW_IEEE80211_CHAN_DISABLED)) {
 				memcpy(&psurveyPara->ch[i], &ch[i], sizeof(struct rtw_ieee80211_channel));
-- 
2.34.1

