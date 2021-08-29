Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CCC72
	for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 18:07:37 +0000 (UTC)
Received: by mail-wm1-f53.google.com with SMTP id c8-20020a7bc008000000b002e6e462e95fso13073765wmb.2
        for <linux-staging@lists.linux.dev>; Sun, 29 Aug 2021 11:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sL3q5BOrUOSwHA12R2JhIzt7TAoia6mkYVfF1Nh53XU=;
        b=YGWWFJs39bbIiiQAw1AJzle4BZkYZ/DTIYm7gcgiPP7eqZndvAODj7R2OsNbXyO6Vp
         AUaSbwzhWW2wHdENqvFX6oNF6Hv1G98OjRHD8jTT+R9o0ZaVp3SdjHUzcZOI2CsuNKaD
         cr42NgvhLk2gbFW5a5kCwC/yku8F0aLxjzVSWtpTHAqmHQtXazsyrv1pv7omNIEMuP7q
         NMJIIyn6c64PO9eH2550wqlmOyVhXdHLw68v6qUB0rf/73znIVCqwrloTjVp7mWERatp
         27FIxLHRY31+H/bBgClrbTuVON7pXLQmHmGabudWesDfVnzzPmGmiMczcCcLyKEekU3P
         UI4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sL3q5BOrUOSwHA12R2JhIzt7TAoia6mkYVfF1Nh53XU=;
        b=Y6od3yTJKnZIpaJJhaK9HWi8aPYEFRiwbO1ylwYjtjVJ9irtp1b5LwMId4h/3IhsO5
         M4dqfwO+Yi9Qa8KiywRyIpOkx0DiQ7DznsjwaNYtihbDZFXqJm8lXmv68ALjLIdNpdAd
         o6UEVWO3dAMg5TMspXSucUVeEGRDqRceApB40aQ2m9mDWoG8m/ruHFzNWr0QgFGfm/Iu
         WagKIcMm1ZfFeeViAI7ff2/GPbOj/3fKNgfMSzJeYtyuovecG30oylQIFdSCGyXKog5p
         nEACUe3Yu57o9FhpsoM3hrQFjyN57y3KDfdmR/iiQpKmgUTpPnl1uq0jkrqySIM45t4w
         75Ow==
X-Gm-Message-State: AOAM5307nSkJiuToD4vKiY6gUj1dkChhN2R9ZJVzii8hfcf7e4FHmYRG
	SD/VDx0dB0H0hwuOev45b70=
X-Google-Smtp-Source: ABdhPJzVA/bsxb3Wf7vRyIaanehNUmwxg3iMzl6iisTzS6M2/BKpe+kyWa5Of4iiCKuyx3Bkf3ystg==
X-Received: by 2002:a1c:7515:: with SMTP id o21mr18808112wmc.150.1630260456344;
        Sun, 29 Aug 2021 11:07:36 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f7sm17124287wmh.20.2021.08.29.11.07.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 11:07:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/2] staging: r8188eu: remove commented constants from wifi.h
Date: Sun, 29 Aug 2021 20:07:17 +0200
Message-Id: <20210829180717.15393-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210829180717.15393-1-straube.linux@gmail.com>
References: <20210829180717.15393-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove commented constants from wifi.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 50 --------------------------
 1 file changed, 50 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index eb07ac9b8943..193a557f0f47 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -114,33 +114,6 @@ enum WIFI_REASON_CODE	{
 	_RSON_TDLS_TEAR_UN_RSN_		= 26,
 };
 
-/* Reason codes (IEEE 802.11-2007, 7.3.1.7, Table 7-22)
-
-#define WLAN_REASON_UNSPECIFIED 1
-#define WLAN_REASON_PREV_AUTH_NOT_VALID 2
-#define WLAN_REASON_DEAUTH_LEAVING 3
-#define WLAN_REASON_DISASSOC_DUE_TO_INACTIVITY 4
-#define WLAN_REASON_DISASSOC_AP_BUSY 5
-#define WLAN_REASON_CLASS2_FRAME_FROM_NONAUTH_STA 6
-#define WLAN_REASON_CLASS3_FRAME_FROM_NONASSOC_STA 7
-#define WLAN_REASON_DISASSOC_STA_HAS_LEFT 8
-#define WLAN_REASON_STA_REQ_ASSOC_WITHOUT_AUTH 9 */
-/* IEEE 802.11h */
-
-/* IEEE 802.11i
-#define WLAN_REASON_INVALID_IE 13
-#define WLAN_REASON_MICHAEL_MIC_FAILURE 14
-#define WLAN_REASON_4WAY_HANDSHAKE_TIMEOUT 15
-#define WLAN_REASON_GROUP_KEY_UPDATE_TIMEOUT 16
-#define WLAN_REASON_IE_IN_4WAY_DIFFERS 17
-#define WLAN_REASON_GROUP_CIPHER_NOT_VALID 18
-#define WLAN_REASON_PAIRWISE_CIPHER_NOT_VALID 19
-#define WLAN_REASON_AKMP_NOT_VALID 20
-#define WLAN_REASON_UNSUPPORTED_RSN_IE_VERSION 21
-#define WLAN_REASON_INVALID_RSN_IE_CAPAB 22
-#define WLAN_REASON_IEEE_802_1X_AUTH_FAILED 23
-#define WLAN_REASON_CIPHER_SUITE_REJECTED 24 */
-
 enum WIFI_STATUS_CODE {
 	_STATS_SUCCESSFUL_		= 0,
 	_STATS_FAILURE_			= 1,
@@ -155,19 +128,6 @@ enum WIFI_STATUS_CODE {
 	_STATS_RATE_FAIL_		= 18,
 };
 
-/* Status codes (IEEE 802.11-2007, 7.3.1.9, Table 7-23)
-#define WLAN_STATUS_SUCCESS 0
-#define WLAN_STATUS_UNSPECIFIED_FAILURE 1
-#define WLAN_STATUS_CAPS_UNSUPPORTED 10
-#define WLAN_STATUS_REASSOC_NO_ASSOC 11
-#define WLAN_STATUS_ASSOC_DENIED_UNSPEC 12
-#define WLAN_STATUS_NOT_SUPPORTED_AUTH_ALG 13
-#define WLAN_STATUS_UNKNOWN_AUTH_TRANSACTION 14
-#define WLAN_STATUS_CHALLENGE_FAIL 15
-#define WLAN_STATUS_AUTH_TIMEOUT 16
-#define WLAN_STATUS_AP_UNABLE_TO_HANDLE_NEW_STA 17
-#define WLAN_STATUS_ASSOC_DENIED_RATES 18 */
-
 /* entended */
 /* IEEE 802.11b */
 #define WLAN_STATUS_ASSOC_DENIED_NOSHORT 19
@@ -552,16 +512,6 @@ static inline int IsFrameTypeCtrl(unsigned char *pframe)
 #define _IEEE8021X_MGT_			1	/*  WPA */
 #define _IEEE8021X_PSK_			2	/*  WPA with pre-shared key */
 
-/*
-#define _NO_PRIVACY_			0
-#define _WEP_40_PRIVACY_		1
-#define _TKIP_PRIVACY_			2
-#define _WRAP_PRIVACY_			3
-#define _CCMP_PRIVACY_			4
-#define _WEP_104_PRIVACY_		5
-#define _WEP_WPA_MIXED_PRIVACY_ 6	WEP + WPA
-*/
-
 /*-----------------------------------------------------------------------------
 				Below is the definition for WMM
 ------------------------------------------------------------------------------*/
-- 
2.33.0

