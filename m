Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8CDA2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:19 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id e16so8070445pgn.4
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VpVRaJzkm+JbIjqlEl728sQqMfSlR+afyO5cWMLCT/U=;
        b=ZZQAq/ag6BwNihmNPCYUtvhU11+52KEkNN0Gqs6Q/mrsVMdpr/RVp9bEOEnl7IgWNH
         EIgA02xreBYGRLTBtAnKgXO3RIVM8sTeUQ6BVRTdFQeFpF7fZw1JJFeeT1xVVSFs4A8f
         zD+E/mGoQvNX1Y1Lcslyejr1mvHULEquMkjiSxSMmtsRTMMtl4NC9s0wsd5lUn4RaB1z
         IRGo5WB7gYRfrOzTOJB76AN4T4BWi8EyodgP+KojS1yCu+0GUSQoFwS6uo3HvQ0+FDup
         rJwAND2V5r8AbprT89qgQ/G3TWYDf7ieNwKhwZ9HBTG2KqU9quTFT+2zyAGuhyMZYicM
         cTnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VpVRaJzkm+JbIjqlEl728sQqMfSlR+afyO5cWMLCT/U=;
        b=BC9ZeoNuqa5o6980Bv5+T8ugTv7mBjzJUuVHb0FnH5HXCAh8tAkBEIaWbsxJJzkYpN
         h42buDbsiLRIUz6S4JMuage/S96vvqWbXLnhoBrGJjBwGCwyGnBRIjdeSAO1HtwWdiP5
         oSWNgBdyc/I/VCanI2TdTzEayns/vVmHNyrqXGZF6PonyDBD9GMmYTE78l9V5W7/B/8s
         irqDeTBOUkUrjQZtU45ecMtaPQGlnE+VPXbDbOFRVm8HYs0iYPNNLVMNB8tVd2t+oUNA
         c4B3a0c4uv9hYf0xwcTrweqflUt6S+UkTKq8wg0nQ08rqA0Z5EU43faLcP5T85wPZEMu
         iL5g==
X-Gm-Message-State: AOAM533ifUmm8ixdhNUdNdWOB8n+ew0ohDzLfhCkFofZpjjW+Dfitsl8
	V2tHRCQUZPNf4FMVWtxmkE8=
X-Google-Smtp-Source: ABdhPJyZgPBeUbsqNw8SEUrpjXlSFPO2IQ+BX9zynOH5EahF7aZT22Ef7+6ytTWwooExE48tL8c6HQ==
X-Received: by 2002:a65:538e:: with SMTP id x14mr10615001pgq.58.1643473939501;
        Sat, 29 Jan 2022 08:32:19 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:19 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 18/23] staging: r8188eu: convert rtw_p2p_get_groupid to return void
Date: Sat, 29 Jan 2022 21:58:10 +0530
Message-Id: <be08b2d84a7fc836db5aa008d906dee1b282fa54.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_groupid always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 9ee647de5ba7..4c47e9bb7fc3 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2564,12 +2564,11 @@ static void rtw_p2p_get_peer_devaddr_by_invitation(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_groupid(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_groupid(struct net_device *dev,
+				struct iw_request_info *info,
+				union iwreq_data *wrqu, char *extra)
 
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2579,7 +2578,6 @@ static int rtw_p2p_get_groupid(struct net_device *dev,
 		pwdinfo->groupid_info.go_device_addr[4], pwdinfo->groupid_info.go_device_addr[5],
 		pwdinfo->groupid_info.ssid);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_op_ch(struct net_device *dev,
-- 
2.34.1

