Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA2D92561
	for <linux-staging@lists.linux.dev>; Thu,  7 Apr 2022 12:10:46 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id ku13-20020a17090b218d00b001ca8fcd3adeso8704606pjb.2
        for <linux-staging@lists.linux.dev>; Thu, 07 Apr 2022 05:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cs-iitr-ac-in.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=aqpPueWPNxzXBHHxJyXiIz6ra+hEX3sVHFaudIBqTWU=;
        b=2DL2TMXKvODXCmBbujyS6l/pZDnDTZc+ey2Xnf1zD2wEV4IlFyH8lvtx01eKv9x+rG
         aD1N4AxqGK60pgBuRZ58NSTZx2eif3LUcDa6VRNUUMKEkdT/WL3aJ3XNDWZkeW5YlP4E
         NlQXsptgN3eguxnvyin1IuUbY53mboBwxfArTY6MvXZgvDvcg8zo/QBDXEk58i2jY90u
         +E9gLXAG5efmwlHs9OiKpUsf56h8TH0G3ZrE3wRGusLay/pYz852c5kbLmjYB/2ixEAw
         7rSYxvH2ZGjm5TY/OPSbC4ikUIwTlTawealj7jFEI2czS7lTw79w+peUvUEhIynlFNgi
         XOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=aqpPueWPNxzXBHHxJyXiIz6ra+hEX3sVHFaudIBqTWU=;
        b=tkiK6D4A/u8bKhLTkOupNyEwRQfG8P8wvkZ+yGEeYLkmh/MudF2D1czu/vHsyNUV/f
         CczERUOW1reWsXEYhwUazED0sl9wH60L4uWbckZzpIj/5KXtzL/w9ZMvtDQ1WkLbWKNm
         2Ur+7RQb/T4uNpPn9bp5z6p+K/UHb7USFydnBqqu0fqYcxuCjkIGxWGPOfFoH0+5krk/
         lVQelFG0CACMJcuPh7ikubGO/+nuJSCmUJFy4oeTpgD+W5UiiSLjh9DYLTXx+MC8JWGN
         0hXynhAkuExOHGKIsS4WwAednekbAF37gqoo1IxuRpZwi/IYbKN155aIVRMl1yfq0kf+
         fOAA==
X-Gm-Message-State: AOAM530bGmagNZ6U4D8GdgETN2ybRic3mMBsFmzeB32BiFBqVl1rRBnA
	UrbzLWhxhuJh6ClCKrTBHGQeGw==
X-Google-Smtp-Source: ABdhPJxygEAgUieNSz9kdAgidLjC5IHFf7mloWvF+BsA1T7rAwdhmOSZZQSW29M5jes+IkmxOj1RDw==
X-Received: by 2002:a17:90b:38c7:b0:1c7:6afb:fac6 with SMTP id nn7-20020a17090b38c700b001c76afbfac6mr15455966pjb.198.1649333446047;
        Thu, 07 Apr 2022 05:10:46 -0700 (PDT)
Received: from mahak-Inspiron-7570.iitr.ac.in ([103.37.201.168])
        by smtp.googlemail.com with ESMTPSA id t14-20020a056a00138e00b004fb1d833668sm24095458pfg.33.2022.04.07.05.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Apr 2022 05:10:45 -0700 (PDT)
From: Mahak Gupta <mahak_g@cs.iitr.ac.in>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Cc: Mahak Gupta <mahak_g@cs.iitr.ac.in>
Subject: [PATCH] staging: rtl8712: fix camel case in function r8712_generate_ie
Date: Thu,  7 Apr 2022 17:39:45 +0530
Message-Id: <20220407120945.31030-1-mahak_g@cs.iitr.ac.in>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Adhere to linux kernel coding style.

Reported by checkpatch:

CHECK: Avoid CamelCase: <beaconPeriod>

Signed-off-by: Mahak Gupta <mahak_g@cs.iitr.ac.in>
---
 drivers/staging/rtl8712/ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8712/ieee80211.c b/drivers/staging/rtl8712/ieee80211.c
index f926809b1021..7d8f1a29d18a 100644
--- a/drivers/staging/rtl8712/ieee80211.c
+++ b/drivers/staging/rtl8712/ieee80211.c
@@ -162,13 +162,13 @@ int r8712_generate_ie(struct registry_priv *registrypriv)
 	uint sz = 0;
 	struct wlan_bssid_ex *dev_network = &registrypriv->dev_network;
 	u8 *ie = dev_network->IEs;
-	u16 beaconPeriod = (u16)dev_network->Configuration.BeaconPeriod;
+	u16 beacon_period = (u16)dev_network->Configuration.BeaconPeriod;
 
 	/*timestamp will be inserted by hardware*/
 	sz += 8;
 	ie += sz;
 	/*beacon interval : 2bytes*/
-	*(__le16 *)ie = cpu_to_le16(beaconPeriod);
+	*(__le16 *)ie = cpu_to_le16(beacon_period);
 	sz += 2;
 	ie += 2;
 	/*capability info*/
-- 
2.17.1

