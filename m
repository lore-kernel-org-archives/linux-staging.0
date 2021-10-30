Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82F8B2C82
	for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 07:19:50 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id j21so23338130edt.11
        for <linux-staging@lists.linux.dev>; Sat, 30 Oct 2021 00:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=QZsM46YrGJm/5fUEbq2ujELrMf3Xsmq+YBPh/ii7lZ0=;
        b=WU8bqgaGoAJAfNKyJ39WCqStI+gp13hnO9XXyQD0I+7mMOyTtULBxVCj8cM7P7ztzR
         wUjtFtRwjBSSO5f2IIW7Cu0czwiMSlFYR+5KMjZkMxxoxaegix69T87m0jBIdaPv0xUP
         R2tQMLSJAhusotg9kZXOapml/i6yObm+xZERZ2rqT2iqPtHvb2fw5ew8sm7Y5rW+riT3
         qzOoiqsomRSN6AYS9bECWonzRjobXvJg9TqB67nPSs5Gqc9YiAo0PfxofgfGautQs/bq
         uqJ4A9h++4IeSxd+q3Wr0ncz6/NC4b5z3pHzviAuodXirBi97ZvcniyUwiAv7XCeAWn8
         1E0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=QZsM46YrGJm/5fUEbq2ujELrMf3Xsmq+YBPh/ii7lZ0=;
        b=b6yd49v0IpzP36KGY/NwbHzKvDIpvOZpl6uc/21Px01l+CD8ti8tSCOHN8+hgOtLC+
         IaAZtXnw33w7BKN0YJjRGv4Nqr3hBNFqASAouhDZOtRO1Vs3NtaAMiZWTR4g/ZsDdnTC
         bSHOFxE6TWGK+d7k6j9iCd1Wp9Zu3njag0OJkiy3x7qGX9OK3sQ8NtYiCEdIQaXh5X7r
         pPArv9UbQhz9AylyAMdSEzEEHm7xtGhW0zINaziNqjA361bCJFwjdASdKhCRv0vT6l5q
         c22hdzT2UVbXoBLL3PmMMlZfShavbjI2v3lNPOmRg90JGXn4cmeXrrLZzwVMqjOizWt2
         vZig==
X-Gm-Message-State: AOAM531KeTc5pQAKXg0UWLZHPw2uogVPqddkeIYVGZMS1IN7nEnLejPI
	8nuDqS7O9aY0hUlqzx7CgzfwQ2fjOoCeInLh
X-Google-Smtp-Source: ABdhPJwv+gx9YmD+fjrJL7aLyZtiNT5uh/CfXNnYiw3KuIkwSr0tGwduObJ1EiWqs4ViIz5xtt190A==
X-Received: by 2002:a17:906:e011:: with SMTP id cu17mr20299891ejb.244.1635578388567;
        Sat, 30 Oct 2021 00:19:48 -0700 (PDT)
Received: from desktop (mob-5-90-201-67.net.vodafone.it. [5.90.201.67])
        by smtp.gmail.com with ESMTPSA id f9sm4890001edt.7.2021.10.30.00.19.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Oct 2021 00:19:48 -0700 (PDT)
Date: Sat, 30 Oct 2021 09:19:46 +0200
From: Gabriel Goller <gabrielgoller123@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev
Subject: [PATCH] staging: wlan-ng: formatting cleanup in cfg80211.c
Message-ID: <YXzyEpmz1RZP4Ssw@desktop>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed bracket alignment and line-length issues.

Signed-off-by: Gabriel Goller <gabrielgoller123@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 7951bd63816f..b394afe8c3d7 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -324,12 +324,10 @@ static int prism2_scan(struct wiphy *wiphy,
 	}
 	msg1.probedelay.data = 0;
 
-	for (i = 0;
-		(i < request->n_channels) && i < ARRAY_SIZE(prism2_channels);
-		i++)
+	for (i = 0; (i < request->n_channels) && i < ARRAY_SIZE(prism2_channels); i++)
 		msg1.channellist.data.data[i] =
-			ieee80211_frequency_to_channel(
-				request->channels[i]->center_freq);
+			ieee80211_frequency_to_channel(request->channels[i]->center_freq);
+
 	msg1.channellist.data.len = request->n_channels;
 
 	msg1.maxchanneltime.data = 250;
@@ -369,7 +367,8 @@ static int prism2_scan(struct wiphy *wiphy,
 					  msg2->beaconperiod.data,
 					  ie_buf,
 					  ie_len,
-					  (msg2->signal.data - 65536) * 100, /* Conversion to signed type */
+						/* Conversion to signed type */
+					  (msg2->signal.data - 65536) * 100,
 					  GFP_KERNEL);
 
 		if (!bss) {
@@ -476,14 +475,13 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
 				return -EINVAL;
 
 			result = prism2_domibset_uint32(wlandev,
-				DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
-				sme->key_idx);
+							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
+							sme->key_idx);
 			if (result)
 				goto exit;
 
 			/* send key to driver */
-			did = didmib_dot11smt_wepdefaultkeystable_key(
-					sme->key_idx + 1);
+			did = didmib_dot11smt_wepdefaultkeystable_key(sme->key_idx + 1);
 			result = prism2_domibset_pstr32(wlandev,
 							did, sme->key_len,
 							(u8 *)sme->key);
@@ -589,8 +587,8 @@ static int prism2_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
 		data = MBM_TO_DBM(mbm);
 
 	result = prism2_domibset_uint32(wlandev,
-		DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
-		data);
+					DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
+					data);
 
 	if (result) {
 		err = -EFAULT;
-- 
2.30.2

