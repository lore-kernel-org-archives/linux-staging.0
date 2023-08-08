Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B702613F
	for <linux-staging@lists.linux.dev>; Wed,  9 Aug 2023 09:20:38 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-3fe4b95c371so3928365e9.1
        for <linux-staging@lists.linux.dev>; Wed, 09 Aug 2023 02:20:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691572837; x=1692177637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjGqHv3jPMmZWsr3YV2CNvMjKi5/yIr3XsV/bXdCpjo=;
        b=nGfPM+uT4+rq1cirZDf2iqldyWLzu6R2ibKkwtCv5bHkF8uZi4owxiaB+YoPTFzu3T
         Z4xx9BgDsl7nQYr2hRXlkdHfCLeaAglUk9Y2PQFyXxX/nsBvFGtKs+BOsTwcZtSbBnVT
         Ej6VM5DgWwuMd0kjNTfBWVmP7jlwf1OGzumWPOn2xDePiKNfUEab79AvGOndurY5V993
         l1USvNo5ZiqDmM7bWlK8vepPqgfBTMoazApN/WEvC7MwSSKef/P6c7xhyNA7keOybupA
         g4VRcsBpp9l04/jPcKm5j6a18aQasp1TZ+ZfaryGu6dgFhVIu5NiQXR04v+gydU2ijx3
         S32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691572837; x=1692177637;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjGqHv3jPMmZWsr3YV2CNvMjKi5/yIr3XsV/bXdCpjo=;
        b=S340KYLOSzSP1J4FFqjnIdZekX0YBfmMaFAH3FGfjPoKgyVoWH+hV8uTnxRCMzhdIQ
         UAaMFA/wI6sfkYvrHFS3rJWgx1n//LMIMTUVmV+5j+QEn2w9fBaro32FjvSTvI/cIoWe
         ZxAbPFq/LZ3LR3WWXE2u+qPaMwgQsEblALzhm0FeKkAsc7Lmzr2FfMKsIPg/IMu6ZS0S
         pp0w/sMA4gnmqnr3xbkIhSOjTzMXJ8yCHgvyNJcr44aBBzAmXacR89msuHtqX60Nm9eH
         zPcvZBo9bF9Fc+j2xKxVmGK9P4Lrj9N1/sovIfFZ9z5N8QgsSgc3YNQ2237C5YGapGx8
         7W9g==
X-Gm-Message-State: AOJu0YwsMAZVBzfM27Do0RemTmv2tI18GqrcCXOF1tzY3CLYk+ssFJPO
	XiOAtAJafD/xrnU6gS/JFRQ=
X-Google-Smtp-Source: AGHT+IH9WJcEmnbaXYTQ+Vh4luEUtFYqUswZdokF/AgUlI1zGZDW3R8XdxP78cDXg3DZKPfd9YQdiQ==
X-Received: by 2002:a05:600c:209:b0:3fe:215e:44a0 with SMTP id 9-20020a05600c020900b003fe215e44a0mr1923902wmi.18.1691572836802;
        Wed, 09 Aug 2023 02:20:36 -0700 (PDT)
Received: from archdev (pa5-84-91-151-142.netvisao.pt. [84.91.151.142])
        by smtp.gmail.com with ESMTPSA id q12-20020a7bce8c000000b003fe26244858sm1373182wmj.46.2023.08.09.02.20.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 02:20:36 -0700 (PDT)
Received: by archdev (Postfix, from userid 0)
	id 162541A40AE; Tue,  8 Aug 2023 23:14:24 +0100 (WEST)
From: Diogo Silva <diogompaissilva@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Diogo Silva <diogompaissilva@gmail.com>
Subject: [PATCH] staging: wlan-ng: cfg80211.c: removed unnecessary parenthesis to match coding style
Date: Tue,  8 Aug 2023 23:12:36 +0100
Message-ID: <20230808221339.2667-1-diogompaissilva@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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

