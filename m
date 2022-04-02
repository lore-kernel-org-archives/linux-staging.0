Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD307C;
	Sat,  2 Apr 2022 11:37:50 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id h10-20020a1c210a000000b0038ccb70e239so395293wmh.3;
        Sat, 02 Apr 2022 04:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UNK8OhCeK4rmwZvR4A3qAZLXLFUIr17oQ7dG4uqRe6A=;
        b=ELPhKmWuSQKrDY4BEa3MKUAqJF1yY1ZI0idrpW1+DxhhugWw2GK8dy9P9PML4TdVI/
         dNKz/RmqH59NgHuqS7+XHMRxAn/fa0t/j4BRXMsx57S63M7hJVyrJbxkV7JwYcb2e0Ql
         hMeUDFGpTQU7c9YCDW/5aR+4+wolzmmiRcmtY4py0KJ2dbFUxpH0uW/NqOEXMOf4cJY4
         RJa81IFzU/JUIFIAVLPA+O+L8ImbuyTNoJKjzqWZFT+FHRYsg5WcWRdF8ohLgYMKtOhj
         +yFehLsVRUmTq+XvJzKyZ9kGjuVhT4pE1jNNiQaTcxD9Q4tcz30SCyoIRYlpGkz5/w7A
         wsEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UNK8OhCeK4rmwZvR4A3qAZLXLFUIr17oQ7dG4uqRe6A=;
        b=0xBSUCQhf2nTuT04qZYQctxAGdSnJAIMSdK8ZuAPJxEZnRhQ+gMmgg6vnrQwRb1DdL
         7XzR4eCtw4HVFbAxQR+WMZNWC+HMkNifZNsBB6JSa4syTH+h3ywHMmrx+fH8PAh8asKB
         aWV2wWgjeUeVwz5hvO0QyGS5SLGqVo18ljU8dD0IyEVc1/9BFUlxVZezF5e4dkwHjXSQ
         9+6CukYueJRNN8GYlpvIOMffo2Am67EFi2CI4O/xhLyqilrB9ypIXu9ZAlRdZMeQ9H0F
         FugI+fHl1cphfcjHL9p6IQsbGRfa0ej59woDjtn67LZT9GnBYGJpVthRRsfba5Ugut5m
         d83Q==
X-Gm-Message-State: AOAM531fk0HGVkrQCRs/+BwQM4rHW6cyDBZNzxJvLHdOZVzbpiiVnH42
	7pnoiS6dSXR5kM/0yiamg4ZPO1wajsM=
X-Google-Smtp-Source: ABdhPJxYQqilR+RsfX9il5l3P37nHrs4rE4fexyfQ9QHCWriRz+cHYB8jomIVj7JjfJgz++5+wlauA==
X-Received: by 2002:a05:600c:1d04:b0:38c:ba2f:88ba with SMTP id l4-20020a05600c1d0400b0038cba2f88bamr12142174wms.137.1648899468986;
        Sat, 02 Apr 2022 04:37:48 -0700 (PDT)
Received: from alaa-emad ([197.57.138.121])
        by smtp.gmail.com with ESMTPSA id az19-20020a05600c601300b0038cadf3aa69sm18132376wmb.36.2022.04.02.04.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Apr 2022 04:37:48 -0700 (PDT)
From: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.alaamohamedsoliman.am@gmail.com
Subject: [PATCH 2/2] staging: wlan-ng: Fix Alignment with parenthesis
Date: Sat,  2 Apr 2022 13:37:33 +0200
Message-Id: <08641d36aaee60797f8c68683b013ebf0215ba2e.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cover.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
References: <cover.1648899123.git.eng.alaamohamedsoliman.am@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix " CHECK: Alignment should match open parenthesis "
Reported by checkpath

Signed-off-by: Alaa Mohamed <eng.alaamohamedsoliman.am@gmail.com>
---
 drivers/staging/wlan-ng/cfg80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/wlan-ng/cfg80211.c b/drivers/staging/wlan-ng/cfg80211.c
index 69d616f19cff..87379edce9a8 100644
--- a/drivers/staging/wlan-ng/cfg80211.c
+++ b/drivers/staging/wlan-ng/cfg80211.c
@@ -475,7 +475,7 @@ static int prism2_connect(struct wiphy *wiphy, struct net_device *dev,
 				return -EINVAL;
 
 			result = prism2_domibset_uint32(wlandev,
-				DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
+							DIDMIB_DOT11SMT_PRIVACYTABLE_WEPDEFAULTKEYID,
 				sme->key_idx);
 			if (result)
 				goto exit;
@@ -587,7 +587,7 @@ static int prism2_set_tx_power(struct wiphy *wiphy, struct wireless_dev *wdev,
 		data = MBM_TO_DBM(mbm);
 
 	result = prism2_domibset_uint32(wlandev,
-		DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
+					DIDMIB_DOT11PHY_TXPOWERTABLE_CURRENTTXPOWERLEVEL,
 		data);
 
 	if (result) {
-- 
2.35.1

