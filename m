Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5BA7C;
	Thu, 31 Mar 2022 11:32:48 +0000 (UTC)
Received: by mail-qv1-f45.google.com with SMTP id kd21so16555871qvb.6;
        Thu, 31 Mar 2022 04:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=bc/PXIbfsZzVLQeoRR3CqcpGDJosJWCkO2fVBiONc1Q=;
        b=IuANEAlikqk+/VwxizAK1a+Ql93DgV1MBbrzqKiKcQ6uMpYb+HW9tBrX71WStTgsQL
         ark9m1886ou6JooOdEUxV3R+yAlu3Vb3UtEd9HO/E0JexD5S+/GyMPLze5coFzguUS96
         D2JDmXv/wxVhS4HUcvf+xfRk9PQuNueIOMloGKTZCqlfMs6V8fjpShlajBOue4QV4+nU
         p7ioBtADZ9jKIrXJDS1POSpS2OtBS/HtXvcsyYY+Fxwn/d7BbERl2L/LesgYFXK9ZkGm
         NPrGK40P4wq+nxf73GxvyJFRlsULnWgCJ4JNk9MP8FttHmb2awxZoJA/xTocCI6fpecA
         GHaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=bc/PXIbfsZzVLQeoRR3CqcpGDJosJWCkO2fVBiONc1Q=;
        b=tIxuvjXmB5ZN0AkI5PQhGI7SgubHVbuA3VTEDp3AFh4OzuGOxT9WUpDGo383oHyJ+a
         4tpvSCkIxYUWoQrFm9Cs6wn+28WyPVZhx3ovSOTMBGgR5x1krbtotxdJBSrtmbYyJu5i
         +450UTP6+CMasyLZWuErEV0kXD6jCj65o4en/ChGNN2n3bpLaPJTbem4p3FLpuP8hIFZ
         RUednU94/7xQJBaz80s96gGPoCxzImQxtbCp4iIjWgRC2X9ivrGYrGzjGHaOIYE+XZQc
         4i+P2ytj9S9GAhonbYkm5QN6nh4jchB4UwF/UOJ2x1+XubBA5JYipSzVdHzuDCkX6cc+
         XPXQ==
X-Gm-Message-State: AOAM530y0alaHhDhGgNZunE+24LemphbKv69H7hKrXUxRVMbDW2Hd7ug
	Zc+Cr0fLhRIXkYqEI1nbDLVoV6EgQlHgyLRV
X-Google-Smtp-Source: ABdhPJwZk6l8e5XgH/f35IcfjChMbG+vK++077j9LhGcXMxWN6sv/fSrQ9EjdnlX0JxKc2zNdYlYaA==
X-Received: by 2002:a05:6214:528d:b0:441:4702:6263 with SMTP id kj13-20020a056214528d00b0044147026263mr3373484qvb.125.1648726367405;
        Thu, 31 Mar 2022 04:32:47 -0700 (PDT)
Received: from euclid ([71.58.109.160])
        by smtp.gmail.com with ESMTPSA id bs32-20020a05620a472000b0067d4560a516sm12743636qkb.32.2022.03.31.04.32.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Mar 2022 04:32:46 -0700 (PDT)
Date: Thu, 31 Mar 2022 07:32:45 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: rtl8723bs: remove redundant braces in if
 statements
Message-ID: <20220331113245.GA425141@euclid>
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

v1 -> v2: Rewrite the commit message to confirm to the established conventions.(Thanks to Alison Schofield <alison.schofield.com>.) 

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

