Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 889896D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:11:43 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s15so24837378edd.4
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cYsOMA8TmTYxhtaHQf4Zdy0n6RJpYtiGTFjA+gbKh4k=;
        b=kQu3F0hVw6y20Toe/9oqX7i0HnapuJBRIboRisVj7Fmbr+4Gl53zlmVQHCxEa6MWg9
         PD3EvHQmhCSA6VWI5sEaqRJOxBkI+OklnweK17tikLtFh8BDT0prkDkx4cLhGn6XNgRB
         VBMLeAK5Ce83vEEeWueqa9+PSVK+VJio7bG8A7+tJZ3drBOS/5xJ2ltFsbOEscPzWdfV
         xkNZbEykckx6AaLkj5uoBZRiWVvYORczUmik5axDXs1SDRhGKOX3ndoYydWZAMxwPtT7
         73FIKDiLqeU2uTWdrdN1rxOsJB1DaYZi9Uwv6BOnuEOyoXqUK13UFPNbZJOROvbq/ipZ
         2Nmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cYsOMA8TmTYxhtaHQf4Zdy0n6RJpYtiGTFjA+gbKh4k=;
        b=ARoIG5QSVcrkLCfGOiQVdkb8e4Fv8mfGG6ZIF1u24iSit1uPyMifqh+hDNFFHt/OHP
         KvU5FI6+WDkKR9c06qCPgO8Ym/T21XN/wIdhSD7EY85QogB1XFWnygSxi1MtWkZeJ+eH
         Tt4X+Ii+5uWv744ToDMfoTG2012w+BlUX0Y1P299DQaLrCIyZcweLM6faYelOCK3ZVn7
         G81n5AVE82hjh0AvWLowoICawlGtIcNGIWVI+ZUkp6uw8lQpzSr9nXjfHa5jZQpy91G5
         63ZDY9+DrejLXu0aB1KNLRDTznrBXT+STL3y7dCJBL7ibrwzOmE8STmF8Fkk421iEqQc
         A2xA==
X-Gm-Message-State: AOAM5314/xrzaROZUpjtZdaEN2zH4ROZrDZCJ0TpXAoO6QKrSsQfQXvu
	ns9IbQLfinllkbUKElbxPhZqhw==
X-Google-Smtp-Source: ABdhPJy0SYJ4d/Q+7Ky3bPg/ka4IplgMBqpmObXQU7WJ+3CjfMahKDFd+tKBBKgdMKfT2ib1Vi9iqQ==
X-Received: by 2002:aa7:db95:: with SMTP id u21mr207985edt.152.1618423902139;
        Wed, 14 Apr 2021 11:11:42 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:11:41 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sumera Priyadarsini <sylphrenadin@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 07/57] staging: wlan-ng: cfg80211: Move large struct onto the heap
Date: Wed, 14 Apr 2021 19:10:39 +0100
Message-Id: <20210414181129.1628598-8-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Fixes the following W=1 kernel build warning(s):

 drivers/staging/wlan-ng/cfg80211.c: In function ‘prism2_scan’:
 drivers/staging/wlan-ng/cfg80211.c:388:1: warning: the frame size of 1296 bytes is larger than 1024 bytes [-Wframe-larger-than=]

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sumera Priyadarsini <sylphrenadin@gmail.com>
Cc: linux-staging@lists.linux.dev
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/wlan-ng/cfg80211.c | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 759e475e303c0..7951bd63816ff 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -276,7 +276,7 @@ static int prism2_scan(struct wiphy *wiphy,
 	struct prism2_wiphy_private *priv = wiphy_priv(wiphy);
 	struct wlandevice *wlandev;
 	struct p80211msg_dot11req_scan msg1;
-	struct p80211msg_dot11req_scan_results msg2;
+	struct p80211msg_dot11req_scan_results *msg2;
 	struct cfg80211_bss *bss;
 	struct cfg80211_scan_info info = {};
 
@@ -301,6 +301,10 @@ static int prism2_scan(struct wiphy *wiphy,
 		return -EOPNOTSUPP;
 	}
 
+	msg2 = kzalloc(sizeof(*msg2), GFP_KERNEL);
+	if (!msg2)
+		return -ENOMEM;
+
 	priv->scan_request = request;
 
 	memset(&msg1, 0x00, sizeof(msg1));
@@ -342,31 +346,30 @@ static int prism2_scan(struct wiphy *wiphy,
 	for (i = 0; i < numbss; i++) {
 		int freq;
 
-		memset(&msg2, 0, sizeof(msg2));
-		msg2.msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
-		msg2.bssindex.data = i;
+		msg2->msgcode = DIDMSG_DOT11REQ_SCAN_RESULTS;
+		msg2->bssindex.data = i;
 
 		result = p80211req_dorequest(wlandev, (u8 *)&msg2);
 		if ((result != 0) ||
-		    (msg2.resultcode.data != P80211ENUM_resultcode_success)) {
+		    (msg2->resultcode.data != P80211ENUM_resultcode_success)) {
 			break;
 		}
 
 		ie_buf[0] = WLAN_EID_SSID;
-		ie_buf[1] = msg2.ssid.data.len;
+		ie_buf[1] = msg2->ssid.data.len;
 		ie_len = ie_buf[1] + 2;
-		memcpy(&ie_buf[2], &msg2.ssid.data.data, msg2.ssid.data.len);
-		freq = ieee80211_channel_to_frequency(msg2.dschannel.data,
+		memcpy(&ie_buf[2], &msg2->ssid.data.data, msg2->ssid.data.len);
+		freq = ieee80211_channel_to_frequency(msg2->dschannel.data,
 						      NL80211_BAND_2GHZ);
 		bss = cfg80211_inform_bss(wiphy,
 					  ieee80211_get_channel(wiphy, freq),
 					  CFG80211_BSS_FTYPE_UNKNOWN,
-					  (const u8 *)&msg2.bssid.data.data,
-					  msg2.timestamp.data, msg2.capinfo.data,
-					  msg2.beaconperiod.data,
+					  (const u8 *)&msg2->bssid.data.data,
+					  msg2->timestamp.data, msg2->capinfo.data,
+					  msg2->beaconperiod.data,
 					  ie_buf,
 					  ie_len,
-					  (msg2.signal.data - 65536) * 100, /* Conversion to signed type */
+					  (msg2->signal.data - 65536) * 100, /* Conversion to signed type */
 					  GFP_KERNEL);
 
 		if (!bss) {
@@ -378,12 +381,13 @@ static int prism2_scan(struct wiphy *wiphy,
 	}
 
 	if (result)
-		err = prism2_result2err(msg2.resultcode.data);
+		err = prism2_result2err(msg2->resultcode.data);
 
 exit:
 	info.aborted = !!(err);
 	cfg80211_scan_done(request, &info);
 	priv->scan_request = NULL;
+	kfree(msg2);
 	return err;
 }
 
-- 
2.27.0

