Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E9F1383;
	Tue, 19 Apr 2022 18:19:49 +0000 (UTC)
Received: by mail-qt1-f173.google.com with SMTP id ay11so1321668qtb.4;
        Tue, 19 Apr 2022 11:19:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XSg9NHRu+GinF4s8/icuB36rUFEij5QIkSvezyRfTkQ=;
        b=kyt7keqdox5sCDgMehjinLNgkpUGGZ8Db0wu4OjgV5ZdSGNuAwqfsgFqJlHysFdfi+
         HLT23tQu7IZYDF/kPQDUNW9vNa5o9/LQkvwusOavQdf7zG/4wmmrJJQtN0wZ6eSPl7HN
         AaRt/09ZvYj09MVEZOTK4D/Zh8HsMz74RH1OYwC1LlsMyQdKYLFIY7Ynxjk83FX3MjwF
         RjHqcm9UKv2/n5b/+ZweuOE+d+nnocJub6eXLhPXyfTlMI/Ldo0LY4N/CCpiRfYvUW9S
         cHO2j7JkUbax8D1Ux9i1GdfzK9laHU/STcGCt8fJbHv8OC+qP/7C11QuhYnPcptcyC9Y
         aVdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XSg9NHRu+GinF4s8/icuB36rUFEij5QIkSvezyRfTkQ=;
        b=ewaK0J7Pyw2cWx/ynmEWrY/cWLa53CKvBz05ErCQzE4K1lqhjnQ50PLRAOhDOBf74V
         /pHpsvesIJ9NULkHli5ScjXgvqkgvpN0GdLNsxrqAjqHUfejrqNaiaU24kieQwQ8VX2U
         KUCa6SB1yk9JdeVUCmM5/5BEr2H3haUjwFzIt5uGgL1AZo7rD7vDfsVRS6J7zUTyIzIn
         6i9/TNbjPklTiBinlhMT+LQRSwZaWEE08+TWdoV9lgirv2rhfz3XiTtARTWEYHneBqEk
         stErXQrmtm8B+czgp2nDSCMAAdymjomt9BAngGI0lMbHv2c5h0pRXtss7V606UreyuQs
         WpZw==
X-Gm-Message-State: AOAM532KETjhzXIn+bwr55Oh2WpPkhjKgtDoXxKCpJQK7zFjeP4nBD8Y
	yawIevHluiMe4aZ0qrdicE8=
X-Google-Smtp-Source: ABdhPJznnjG2Alx/CXED04SbSCzRXNOHcagsZnIEhYgl2TeoeWGFAejCFvsjZiVGqKG38ckdNL3QNA==
X-Received: by 2002:ac8:5f8d:0:b0:2f3:3f9a:d5bb with SMTP id j13-20020ac85f8d000000b002f33f9ad5bbmr62282qta.314.1650392388318;
        Tue, 19 Apr 2022 11:19:48 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id e126-20020a376984000000b0069c86b28524sm373334qkc.19.2022.04.19.11.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 11:19:47 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH v3 2/7] staging: r8188eu: remove spaces before tabs
Date: Tue, 19 Apr 2022 14:19:33 -0400
Message-Id: <5e16b9df1b5ce3a754a8f71c35cf4d55777e19cf.1650392020.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1650392020.git.jhpark1013@gmail.com>
References: <cover.1650392020.git.jhpark1013@gmail.com>
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
index 8af11626a3e7..72963ed7b665 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -555,8 +555,8 @@ static void rtw_add_network(struct adapter *adapter,
 
 /* select the desired network based on the capability of the (i)bss. */
 /*  check items:	(1) security */
-/* 			(2) network_type */
-/* 			(3) WMM */
+/*			(2) network_type */
+/*			(3) WMM */
 /*			(4) HT */
 /*			(5) others */
 static bool rtw_is_desired_network(struct adapter *adapter, struct wlan_network *pnetwork)
@@ -891,9 +891,9 @@ static struct sta_info *rtw_joinbss_update_stainfo(struct adapter *padapter, str
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
@@ -1616,8 +1616,8 @@ int rtw_restruct_wmm_ie(struct adapter *adapter, u8 *in_ie, u8 *out_ie, uint in_
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

