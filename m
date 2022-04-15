Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650D315BD;
	Fri, 15 Apr 2022 02:48:47 +0000 (UTC)
Received: by mail-qv1-f44.google.com with SMTP id c1so5761742qvl.3;
        Thu, 14 Apr 2022 19:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Jl8cA15AhHC5y4h+FeNERnQbKM+f37jdKRIZJGm/yhE=;
        b=L1WFgpZkQlF23uXoOfCCxu1h881F8755tMZldHEjaZbD4Afdt+/aOmDAZyoSWO5Uys
         TkkLFEGSZV4hhWg9ukWsCrTkJr6ImRLDrpI0OU+sqKadGebIDrEfgCXJZfy23Oe1f1ec
         DF6r1vW8cPZQgbSOWLLdRYaypN5fyVcAdEh+w0VeKgr9pMXAvpH0Ks7oIN6B28/4Cpm4
         NkN2qc6QerfhQyiQRe9DDLXm7qlz0vJgvbxhvClsHNy9ZqlGetQMXtyh4BXjnh+MibPA
         7EVnR+sblEXvRNsNbER9r2sg8DOCLcqc8xgVu2Lusua4LqieYqm6sh1FiYTIuIbUUB2c
         QTmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Jl8cA15AhHC5y4h+FeNERnQbKM+f37jdKRIZJGm/yhE=;
        b=jp/CNeZGVvjKF4E5Z7b7VZhc1K6uXacQBMcG1encprTRz5CxHrI5BMiNxkFQyS/Li5
         NWEpNBPkYMkeMmz4lBLy2hyJZsJ/g9Jt9kpDtqFICKfkGDjQ4sUli9H75CocqV5cJkjB
         23ijx9zRhVWcFQmg7paOP+ppRT3szYb1U0eOpCOLmO3dkTAVr/sY5NIeyx+zxxlv5P5V
         51fbeHevZWV7ihlx+8qe4aaeWY1hMg9HrvTtKgHqWyVQ+EDHLQv74rySaimhg5hvmjbQ
         f0kRSlUlV1f5j1MxGtJ25h20zTMPtZMpcZEP641R9yryunveFWmd0YvMtzSOFVIpfIhL
         ZDug==
X-Gm-Message-State: AOAM533ALVwidzoT8WUFBXZqVaeD2/djAzewFSmKudE4kWiP5SIwpdZz
	PSMlKCIEzGWn+dhK1ddrV/k=
X-Google-Smtp-Source: ABdhPJzlkp+L8XmPEEo671yAb3XgFN78LTs8FO4w3iGvK1FiTeC2Wf7DWE/jJh4wdVsqeqZyg+9bqw==
X-Received: by 2002:a05:6214:622:b0:441:2825:c288 with SMTP id a2-20020a056214062200b004412825c288mr6051916qvx.79.1649990926337;
        Thu, 14 Apr 2022 19:48:46 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.lan ([2607:fb90:1b7a:2349:50b1:5db4:a2d5:7054])
        by smtp.gmail.com with ESMTPSA id p7-20020a05620a22a700b0069c37e2c473sm1800085qkh.94.2022.04.14.19.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 19:48:45 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v2 2/6] staging: r8188eu: remove spaces before tabs
Date: Thu, 14 Apr 2022 22:48:33 -0400
Message-Id: <16fc136092cb89e6a819afe2de69edb96ca7c68a.1649990500.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649990500.git.jhpark1013@gmail.com>
References: <cover.1649990500.git.jhpark1013@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delete spaces before tabs in the comments. Issue found with checkpatch.
WARNING: please, no space before tabs

Signed-off-by: Jaehee Park <jhpark1013@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index aed868d1d47b..1620ca181bf7 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -567,8 +567,8 @@ static void rtw_add_network(struct adapter *adapter,
 
 /* select the desired network based on the capability of the (i)bss. */
 /*  check items:	(1) security */
-/* 			(2) network_type */
-/* 			(3) WMM */
+/*			(2) network_type */
+/*			(3) WMM */
 /*			(4) HT */
 /*			(5) others */
 static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
@@ -903,9 +903,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
 			memset((u8 *)&psta->dot11txpn, 0, sizeof(union pn48));
 			memset((u8 *)&psta->dot11rxpn, 0, sizeof(union pn48));
 		}
-		/* 	Commented by Albert 2012/07/21 */
-		/* 	When doing the WPS, the wps_ie_len won't equal to 0 */
-		/* 	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
+		/*	Commented by Albert 2012/07/21 */
+		/*	When doing the WPS, the wps_ie_len won't equal to 0 */
+		/*	And the Wi-Fi driver shouldn't allow the data packet to be tramsmitted. */
 		if (padapter->securitypriv.wps_ie_len != 0) {
 			psta->ieee8021x_blocked = true;
 			padapter->securitypriv.wps_ie_len = 0;
@@ -1628,8 +1628,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
 /*  */
 /*  Search by BSSID, */
 /*  Return Value: */
-/* 		-1		:if there is no pre-auth key in the  table */
-/* 		>= 0		:if there is pre-auth key, and   return the entry id */
+/*		-1		:if there is no pre-auth key in the  table */
+/*		>= 0		:if there is pre-auth key, and   return the entry id */
 /*  */
 /*  */
 
-- 
2.25.1

