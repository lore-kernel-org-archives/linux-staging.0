Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8262CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:23 +0000 (UTC)
Received: by mail-pl1-f172.google.com with SMTP id x11so8860969plg.6
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7YT3Q4CQUgdlYmGODWsqMTkvALuQeDNDukSqX/SKoEs=;
        b=UJ9gHF+mZhKou88TjeyQUzHoDkNLxfp5fo2k8OhyxVsJWI6Xhl9ucMZhNJcIZ4CC5E
         /fZK/VH2++EuTiOSuQevZE37cLPg9I7tHUVJlLZulJ++wwu3W1Xq3KVY4MS+wa3unclo
         /MDnXfXWJX13tOMsp/IyOWwH5cC0DmQcSPSEW81vFk+5oecEUijY3Ir28Mp072ZCDVcL
         q4z2gQeHVM1YltwR6O7Rx/spxNekLZDeuwvR7R/+3W290AZ28LTs/AcrndGWNoAHsh+U
         t5XvMlEr5vlySue0Vw/he0eIsUgyhEHoQCie95Nu1jnaYtLZWYUp76svAUdfInP4QmIX
         6q2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7YT3Q4CQUgdlYmGODWsqMTkvALuQeDNDukSqX/SKoEs=;
        b=Hwh6BcKkRMWH4GLPcpozScvzS9yT/dZWtrkive5xoGbnBH8L+OMltq3PeAgTVXCc5G
         OvQaKKXJlz5Rv+ChZrlWNVUOg+66h/C4/Q3VghGlgKrdm6kviDql8puVThpS5aFpxld/
         BV3jww4e0AvXHR1xYEIEQ3/rixoK4YbavWDJZb8KUy/uQFbfAH4Oa1d9kj8+69NBgYyK
         lVrXcrMbdUvunC8n1s97GpQa9k4NOtMnoywv35xL4vENYVIPaaqpMIxK5fundIxJ4tcD
         MJVbQm8TR1TGnKWMPM5XlTtUIIr5rKrelhLn5sOeyhMUPruPCXo/XvGR+k9Tp//q0+8e
         3H+Q==
X-Gm-Message-State: AOAM533ga6U8fPu+H1WKu+jHo4sWZ7JXAtuvPVoVEo7xSgNdorkDZ3Og
	Zaj5hl4lCS+TW3ZJyOV4IFo=
X-Google-Smtp-Source: ABdhPJxowfEqLA8zSYaQUOWqpgaObNqnKf143vzS75ugBMx1F8ZqDp8AlbsLF5VwCLq3T2W7sT++OQ==
X-Received: by 2002:a17:902:8d81:: with SMTP id v1mr13593010plo.20.1643473943346;
        Sat, 29 Jan 2022 08:32:23 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:22 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 19/23] staging: r8188eu: convert rtw_p2p_get_op_ch to return void
Date: Sat, 29 Jan 2022 21:58:11 +0530
Message-Id: <c94caa66e738f254b7b1d967b3016975aa0df5d0.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_op_ch always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 4c47e9bb7fc3..f533f709ead5 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2580,12 +2580,11 @@ static void rtw_p2p_get_groupid(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_op_ch(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_op_ch(struct net_device *dev,
+			      struct iw_request_info *info,
+			      union iwreq_data *wrqu, char *extra)
 
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2593,7 +2592,6 @@ static int rtw_p2p_get_op_ch(struct net_device *dev,
 
 	sprintf(extra, "\n\nOp_ch =%.2d\n", pwdinfo->operating_channel);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_wps_configmethod(struct net_device *dev,
-- 
2.34.1

