Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972E4366;
	Wed, 30 Mar 2022 00:52:32 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id hu11so15755650qvb.7;
        Tue, 29 Mar 2022 17:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=+sHB2K20EL//AH+6So4JQczV3z9OH1YB7s4Uv15wvfE=;
        b=Jj5lL1O8uvEtVWKfr5l1tByGRVtJko2A30NFWmU4LXBvjqGKBpv5biPxbO2Ic+Qek3
         WZU21PcjfD8/n2sIDQfKpFvMgSLV8rarGp1zxW4QbskbnV6Ee3ysw835MYA0laLXpveG
         rcfA+RGtz5lAHLb1YC7wn7AxMSv1IkUz141b0XQ+HiNT+Y1IgmurJrv9WGXaLVdei7k1
         jHxNZ3v9mIKyfP+DTRb8v+0uWb75QoUio8ND3XebB1vPL6uxiJ4REpwbVbdS7rpX4Edz
         fo02KAZ1FBPZej+3U72iSvhEb17v817LPtZvS6HOCnUuz+aLs5S1c/CJZGj0tO6ighbG
         56pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=+sHB2K20EL//AH+6So4JQczV3z9OH1YB7s4Uv15wvfE=;
        b=aiFN/9f8/rBLhThOtjo4kObQc3/WSLWtnrklo4isGjQODoRYsX466eNZE+VrCd9ghQ
         GNM6BA9N0y40BXdUh1iu2aWUyZICHR9ALhOH8e2Euxi826iQhqhWlkUf69a/H31sFRO2
         Lbk/pkCQx9aogqA52x07iGHTOKnYJ7hrCXkEJ0RCMV8+Xyux1Dm4k8ZtcpctgsyhkxXe
         fX+hgDHTHCGV9jeU0IHdhnxMPirO0xgc5uk5nFoG0UCZs9GNYRSS0J+IWm1Mof/7mXnZ
         v566pbdrGeHJGsnvmZUm566mkeFhokzgdnnGHCzQI2zkfnJFcaYYsTrTyvnqxQLTPGTr
         5kHw==
X-Gm-Message-State: AOAM530HsBfhJMfizlZdqLXlHbJPliPuAHDSoUS5wumFy+hrhwtxjZ+h
	S+AqhRphtyxmWGi5/irxViTEIGIzFcxJEZ78
X-Google-Smtp-Source: ABdhPJxgOE1NKI9hmwdJ4V0TgoDjzjZaUV1wkMv6NwanObP7mGxtBqkddhRrCrpYVMH9kHpMTNYh4A==
X-Received: by 2002:a05:6214:c82:b0:441:1ec7:a225 with SMTP id r2-20020a0562140c8200b004411ec7a225mr28745677qvr.123.1648601551130;
        Tue, 29 Mar 2022 17:52:31 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id x20-20020ac85f14000000b002e1ee1c56c3sm16759682qta.76.2022.03.29.17.52.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 17:52:30 -0700 (PDT)
Date: Tue, 29 Mar 2022 20:52:29 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: remove redundant braces in if
 statements
Message-ID: <20220330005229.GA318642@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: braces {} are not necessary for single statement blocks

Signed-off-by: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 27de086903e2..68e41d99679d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -335,9 +335,8 @@ int rtw_generate_ie(struct registry_priv *pregistrypriv)
 
 	ie = rtw_set_ie(ie, WLAN_EID_IBSS_PARAMS, 2, (u8 *)&(pdev_network->configuration.atim_window), &sz);
 
-	if (rateLen > 8) {
+	if (rateLen > 8)
 		ie = rtw_set_ie(ie, WLAN_EID_EXT_SUPP_RATES, (rateLen - 8), (pdev_network->supported_rates + 8), &sz);
-	}
 
 	/* HT Cap. */
 	if ((pregistrypriv->wireless_mode & WIRELESS_11_24N) &&
@@ -366,9 +365,8 @@ unsigned char *rtw_get_wpa_ie(unsigned char *pie, int *wpa_ie_len, int limit)
 
 		if (pbuf) {
 			/* check if oui matches... */
-			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type))) {
+			if (memcmp((pbuf + 2), wpa_oui_type, sizeof(wpa_oui_type)))
 				goto check_next_ie;
-			}
 
 			/* check version... */
 			memcpy((u8 *)&le_tmp, (pbuf + 6), sizeof(val16));
@@ -493,9 +491,8 @@ int rtw_parse_wpa_ie(u8 *wpa_ie, int wpa_ie_len, int *group_cipher, int *pairwis
 	if (is_8021x) {
 		if (left >= 6) {
 			pos += 2;
-			if (!memcmp(pos, SUITE_1X, 4)) {
+			if (!memcmp(pos, SUITE_1X, 4))
 				*is_8021x = 1;
-			}
 		}
 	}
 
@@ -514,9 +511,8 @@ int rtw_parse_wpa2_ie(u8 *rsn_ie, int rsn_ie_len, int *group_cipher, int *pairwi
 		return _FAIL;
 	}
 
-	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2))) {
+	if ((*rsn_ie != WLAN_EID_RSN) || (*(rsn_ie+1) != (u8)(rsn_ie_len - 2)))
 		return _FAIL;
-	}
 
 	pos = rsn_ie;
 	pos += 4;
-- 
2.25.1

