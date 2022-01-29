Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7C22CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:59 +0000 (UTC)
Received: by mail-pj1-f45.google.com with SMTP id o16-20020a17090aac1000b001b62f629953so6437490pjq.3
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3R4owqSK8BZyMrVti/Fku5/LEyT/MxkNC0b3ePI8Qs8=;
        b=l+/M0MUhMI5QsI0GpFoQHwMBb4SgBKO+/mxajCAtm1jCQ1dNRzJNbXwYihGCBDFU7F
         9TZVsu7EkDDTltV2A9NsxPXPJN4SXjK5dsqgH3oRClEGnYPrxpnmsJCqviSnPKrPd31Z
         sqlz8eLKR5O00hpwc05vAl8/lqUIICxWPkK1tV+Imm8FPLDZkckMEhs41N7b1mF+jry3
         U11MwbRJYDGFdcx/hTj276sdVHAWBSyMRCfsGmJPbf3+vzCE4J+LfTDgsj/ZfWQR6qk3
         XO1VtRBCKsNhaeU4htYhDrxgwyofBmaB1LITsj6WCmMQzLIpA1zDV1Ry4lMkUayPrgcs
         767Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3R4owqSK8BZyMrVti/Fku5/LEyT/MxkNC0b3ePI8Qs8=;
        b=mbRzdGRQGKdG15pWXFKpOezZMnqsBSJxmu1kgWLR9sfR8thEfOQrZuopp86XR/f0ny
         zHZO1m90+T2YQ3D9P/muCjV1MHMCIn/mvmuLUuuYmi0eVpeUKUNP8ua24hgK2DNb+C/K
         fqASv3MrbmcnSlmOWfFkBV6iVLGUiLefAdg8py5m1gojnU7OzRf/gh4CRI0UaLJGsewo
         x9XHMpwLFxU6+6cCAiQZmPINrTnlX9zt8zhO7Kf6y8AnvzdtMgcXURMm4Llj6DmM2lG5
         2rK7ilvmyuIuw31W/tRvKZJSvBHacJ19khPY8/hSSQbx6nX+f4NGeoLu4lzEVNOCGKvj
         UpPw==
X-Gm-Message-State: AOAM531P3cTuXmbsI1Xmrxe8plWGq5DL+OnANfIVVdxDlx3lYj+sOruH
	R5oyJEW3L0vqE/3TWBgp66dNW8QI9sw=
X-Google-Smtp-Source: ABdhPJxv7jM9zR68yPUTZ1ABwepRcoIi01irtYsmbM5yehKnXPibQnNeXxRQs8j5IpLbKm+DAHmtvA==
X-Received: by 2002:a17:90b:17c1:: with SMTP id me1mr23507307pjb.182.1643473919419;
        Sat, 29 Jan 2022 08:31:59 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:58 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 13/23] staging: r8188eu: convert rtw_p2p_get_req_cm to return void
Date: Sat, 29 Jan 2022 21:58:05 +0530
Message-Id: <a5940e6778431a4ce2d2e67543c59aae90464604.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_req_cm always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index d2db2117abc3..ba0f42ca36e3 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2490,17 +2490,15 @@ static void rtw_p2p_get_status(struct net_device *dev,
 /*	This config method description will show us which config method the remote P2P device is intended to use */
 /*	by sending the provisioning discovery request frame. */
 
-static int rtw_p2p_get_req_cm(struct net_device *dev,
+static void rtw_p2p_get_req_cm(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
 	sprintf(extra, "\n\nCM =%s\n", pwdinfo->rx_prov_disc_info.strconfig_method_desc_of_prov_disc_req);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_role(struct net_device *dev,
-- 
2.34.1

