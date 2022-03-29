Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 451A9257F;
	Tue, 29 Mar 2022 17:21:24 +0000 (UTC)
Received: by mail-qt1-f182.google.com with SMTP id i4so15861871qti.7;
        Tue, 29 Mar 2022 10:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=Kf1v8hS8vyA7Y5W9J43n/PAPUIUn4eGCoQYkh6AdKJ0=;
        b=Aa/bMcJenjtxFF5mhNT5iiE4M9JTC0iCsIzerOh5vuhT2TOu1A0cg7mP0Cly9SodV2
         1sfMfIIv5yxlIzS3b2XjQXxA1qfklG08+dQ8Uh2nIqSPX5g5MFT6oZ+VH4KJXzBUsgDZ
         tc0oUyCIOW3XL++hTPLa5WRZnog1dp3/QPxwgG8Vij6MOyXe2/0Xw5VVtFo3vlXqOogy
         3qyJDw8++eNDXTqH9XjUAmkVmkmS1IfjdoH0hzCyuT6Wzdioo8/59H+lZfGHHCZgqe2A
         dt7Olf5cRk5+BZ5K99oi+NaU80jGDnDRXhCJjPYNLCQ4H/Y9jmwpeukOvdiF0Jb8yXV8
         VSZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=Kf1v8hS8vyA7Y5W9J43n/PAPUIUn4eGCoQYkh6AdKJ0=;
        b=flnfwT0deOQw8qDaj8276vR9HnKf/0oagdBCA9pHj8W/kLEz+V0Cucks04ODOm8zeC
         4/RAjdrxXVmSrXdl4maEFdxJ2VnULndIGYJU5856koNRcubOhXS5khdWSqsrD67U4fO6
         ONY3r1eVTEWQWYcBuo+IpcOiVkqIoL5GtRgLK+ZPGPae7YvamQrP2T+dNCnBGyjkATD/
         tQP06+xAzTtZfDv9dFvrs8l3g5o7I6ezPSvq6Uqcl9mDlcueqLmDilYNmHSmkovl6J/5
         w5YsGE4Dlh+EhlZQHeNF7/IJc9xenZATAYe5eW3/VhbStGTRz958o46JcUGjAgNcswLM
         Vprg==
X-Gm-Message-State: AOAM533h0WC/nJ0lY66CJDfc69t14e2mojYtizKzs58ns/t/YdIWIZnn
	xmkKC6f8M7H7CSEAO+kPhhCNJUZCzSZ4dg==
X-Google-Smtp-Source: ABdhPJzd+TvCfuNO8xYNBI86wdS+kYFzzEDJm5od6F+y3VVnDsW2sUTNvvOelHDWj5ejtlr0wtf54w==
X-Received: by 2002:a05:622a:1994:b0:2e1:a3dc:23dd with SMTP id u20-20020a05622a199400b002e1a3dc23ddmr29120672qtc.203.1648574482441;
        Tue, 29 Mar 2022 10:21:22 -0700 (PDT)
Received: from euclid ([104.39.252.111])
        by smtp.gmail.com with ESMTPSA id k73-20020a37a14c000000b0067b316a4161sm10082583qke.120.2022.03.29.10.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Mar 2022 10:21:21 -0700 (PDT)
Date: Tue, 29 Mar 2022 13:21:20 -0400
From: Sevinj Aghayeva <sevinj.aghayeva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Fabio Aiuto <fabioaiuto83@gmail.com>,
	Lee Jones <lee.jones@linaro.org>,
	Muhammad Usama Anjum <musamaanjum@gmail.com>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH] staging: rtl8723bs: Remove redundant braces in if statements.
Message-ID: <20220329172037.GA208840@euclid>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patch fixes the following checkpatch.pl warning:

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

