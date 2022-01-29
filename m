Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BEA02CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:39 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id x11so8861354plg.6
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=HB3rD200TcYiLs5tsvdXeI+ibi+B/S+l18YmlgU5fCE=;
        b=FF2HNd+zuYsbL5g/5i0PUuE/ezTQauFPKnMkcuHyUpOqAdAwCchqRXMueOaHkx0NQZ
         zQa/r14k1efRYzFBX/9va6h7buyryd2qCHowI4pQ6meFEEP9W/4WINrUV0K967c+1b1R
         rFn1Nhq5VLKzmxzBpngECcLDPYMYZWO7GOeP2t+U7l0zZWE5GSF/oCEe0G/jdCCuIVfy
         dkn7BwizAj+c5mvHdKHh9dGzs9ebOrdyR15GDBYGFw9PbsD0dR7TBSQHmA1w0KHb0cER
         cdRGIfuf3ythKCscRz4IkUpseDFmbIMpifltGQCfgJNcttJPr8gmXZK8WxnJppX713V6
         Dzvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HB3rD200TcYiLs5tsvdXeI+ibi+B/S+l18YmlgU5fCE=;
        b=mBp405sTeUPOrYrnQ7XMyD+Sum98ojNWALo9Kd5QTBAxjczK6vSGhm2gi/4CtLwNCl
         5nuCQ5terIydba0uNC3hczy10HCoNX5ij0VAZr+5flXyqwZy3zA606SyUtU0qgXUTtEG
         TSnZrr6I35Thh0mwlIcrGnbX8lMmMjJ30b6GO4PXUsRWT8eSkqXfIlVHbTdlO+FuBsxu
         zjplROtQnL8oJJyAWY7VuLqLeId0PD5YFM7j6NSLPsmhl/WMNUuGKPkucogfsZDGTv3M
         0KdiCd56lw4CEBRAwXOofpMBE7yTxbD0L/gCnMA+fCFqyJg21UZLGY57HSpSr4z3HtVA
         XZ7g==
X-Gm-Message-State: AOAM530UoSIOmdZHy84AMuWtiXI6GqUOCyAq9WHe85XOPyRItdFZ7rib
	T7jYhpr7MZgFwRwWmAgQeIk=
X-Google-Smtp-Source: ABdhPJwzF4IZ8/LW/oEI2adx+41W+RVXEkFWhs93pWHft5RlATLB++QwJKhjwvXdCOrCOg3y50ndvg==
X-Received: by 2002:a17:90b:1983:: with SMTP id mv3mr15877594pjb.222.1643473958680;
        Sat, 29 Jan 2022 08:32:38 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:38 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 23/23] staging: r8188eu: convert rtw_p2p_got_wpsinfo to return void
Date: Sat, 29 Jan 2022 21:58:15 +0530
Message-Id: <f63e236e3a338789265172990fea049216115105.1643466748.git.abdun.nihaal@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1643466748.git.abdun.nihaal@gmail.com>
References: <cover.1643466748.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_p2p_got_wpsinfo always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 1af8b2c068b8..c54ec5602ddf 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -3301,11 +3301,10 @@ static void rtw_p2p_prov_disc(struct net_device *dev,
 /*	This function is used to inform the driver the user had specified the pin code value or pbc */
 /*	to application. */
 
-static int rtw_p2p_got_wpsinfo(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_got_wpsinfo(struct net_device *dev,
+				struct iw_request_info *info,
+				union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -3326,7 +3325,6 @@ static int rtw_p2p_got_wpsinfo(struct net_device *dev,
 		pwdinfo->ui_got_wps_info = P2P_GOT_WPSINFO_PBC;
 	else
 		pwdinfo->ui_got_wps_info = P2P_NO_WPSINFO;
-	return ret;
 }
 
 static int rtw_p2p_set(struct net_device *dev,
-- 
2.34.1

