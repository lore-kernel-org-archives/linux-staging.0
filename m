Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026D6100B6
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 10:20:40 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-3fe4a89e8c4so40370645e9.3
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 03:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691576439; x=1692181239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gsYLfemCDR3/R1OmOhG/J3IN0SL/2dsEeDv4LiZM2ak=;
        b=QeyVH5qvWhQI6SNu04rR8TU75B5jlX7waD+AxXoTZUGBLl02NVKTSfDztBgpLL9fFW
         xD4wuWN2AhAvmxKQd8KAiIZHrNDwhcbmJpQ1dg4gN442dbw08a6BhnRQit7hbnJ7zI0R
         WScQcU6R6WVcj1sN19cV+3mEo7lNbfYsX31zdwbl/UwpzoQzeKi4TpabUOlLRa67PN1h
         /N/dycbaf8GT7hFiLYrHWsXmnny2wLkSaQPDIDuBasR2SLCrN9AroskYqzRcC5vmkmr3
         JkQAXyZ8aBNLQ5kpVU99rS8oi21Zy1gRuzweDmzD4EnmwQPiQQeSTEBVQdeaE1eR77RU
         OiPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691576439; x=1692181239;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gsYLfemCDR3/R1OmOhG/J3IN0SL/2dsEeDv4LiZM2ak=;
        b=JzVvTnkcsI8aYJrcTWtTzAYWgsore1GUMOtt1yPz966UeZ5S9qRTMo5IfU0dd/aAM+
         K2AjCe2DsN5UydDHBGe4mUanFVDVPo5qYIj+8ObXXMSrSLYaRgii3XjoKOpbNjzYBTqH
         bZBNss4t//E0h6QT4WplvfZnQKR2V5KjfUnz5uRCGsPKio1SDbqunaAaDd6KwkZ+t3ng
         4pRpBCKF675tdtkX9fWYhwJyHnDDLRHIhRRVp0mAOvSgfTYXGLAa94krXOs4yOzn4DFG
         qw3dybchZm9KK/NtFplShMa22HBZb1Oc0Eh03qtBS16x++UgWYzNJi/XTi5U7TjjbYX+
         J9LQ==
X-Gm-Message-State: AOJu0Yzj+kSg0WB8opAhScZlcl0vI9w6aneNmZWWLRQRBHJ2TZyul2o5
	LsqhIikO14Qw2CVOwyKlZpryPAxhGYkWTg==
X-Google-Smtp-Source: AGHT+IE5wchFXx9HMqNH7ff60Rs2b0MNZRBtR1xt/ZEPu2aDA2yeCx4egWKx+Vp7x8pZRMcKghEwEQ==
X-Received: by 2002:a7b:c3d1:0:b0:3fb:b34f:6cd6 with SMTP id t17-20020a7bc3d1000000b003fbb34f6cd6mr1761740wmj.41.1691576438805;
        Wed, 09 Aug 2023 03:20:38 -0700 (PDT)
Received: from archdev (pa5-84-91-151-142.netvisao.pt. [84.91.151.142])
        by smtp.gmail.com with ESMTPSA id u10-20020a05600c210a00b003fc02e8ea68sm1555616wml.13.2023.08.09.03.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 03:20:38 -0700 (PDT)
Received: by archdev (Postfix, from userid 0)
	id E7B0E1A3960; Wed,  9 Aug 2023 00:14:25 +0100 (WEST)
From: Diogo Silva <diogompaissilva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH] staging: wlan-ng: cfg80211.c: removed unnecessary parenthesis to match coding style
Date: Wed,  9 Aug 2023 00:13:20 +0100
Message-ID: <20230808231424.3270-1-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <2023080951-escalate-unnamed-e6d4@gregkh>
References: <2023080951-escalate-unnamed-e6d4@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed unnecessary parenthesis around some conditions to comply with
the checkpatch coding style.

Signed-off-by: Diogo Silva <diogompaissilva@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 471bb310176f..57c16afe8773 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -247,7 +247,7 @@ static int prism2_get_station(struct wiphy *wiphy, struct net_device *dev,
 
 	memset(sinfo, 0, sizeof(*sinfo));
 
-	if (!wlandev || (wlandev->msdstate != WLAN_MSD_RUNNING))
+	if (!wlandev || wlandev->msdstate != WLAN_MSD_RUNNING)
 		return -EOPNOTSUPP;
 
 	/* build request message */
@@ -351,8 +351,8 @@ static int prism2_scan(struct wiphy *wiphy,
 		msg2->bssindex.data = i;
 
 		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
-		if ((result != 0) ||
-		    (msg2->resultcode.data != P80211ENUM_resultcode_success)) {
+		if (result != 0 ||
+		    msg2->resultcode.data != P80211ENUM_resultcode_success) {
 			break;
 		}
 
@@ -459,11 +459,11 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
 	}
 
 	/* Set the authorization */
-	if ((sme->auth_type == NL80211_AUTHTYPE_OPEN_SYSTEM) ||
-	    ((sme->auth_type == NL80211_AUTHTYPE_AUTOMATIC) && !is_wep))
+	if (sme->auth_type == NL80211_AUTHTYPE_OPEN_SYSTEM ||
+	    (sme->auth_type == NL80211_AUTHTYPE_AUTOMATIC && !is_wep))
 		msg_join.authtype.data = P80211ENUM_authalg_opensystem;
-	else if ((sme->auth_type == NL80211_AUTHTYPE_SHARED_KEY) ||
-		 ((sme->auth_type == NL80211_AUTHTYPE_AUTOMATIC) && is_wep))
+	else if (sme->auth_type == NL80211_AUTHTYPE_SHARED_KEY ||
+		 (sme->auth_type == NL80211_AUTHTYPE_AUTOMATIC && is_wep))
 		msg_join.authtype.data = P80211ENUM_authalg_sharedkey;
 	else
 		netdev_warn(dev,
-- 
2.41.0

