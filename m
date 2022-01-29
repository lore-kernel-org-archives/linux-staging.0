Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6B52CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:07 +0000 (UTC)
Received: by mail-pl1-f182.google.com with SMTP id y17so8850047plg.7
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k1fC8pgJCKW2AtBxBMf1LhdlL3aFtmP7ejxI3861g2c=;
        b=UaZWcvkx9dAVtN7KfWy0oIgSfqKPRE2rClc31qACpThl9h9edITZpYue6sqp45SIfG
         5hVx/tvB7ovb76LJzfmvtyqrvk6NPGIcz/U0Z+4f/hrYV08laT83kIorCEj5tdBV0zxh
         9/VRkIS8ig6fDWhYa1rxgq6sVdQOpFk6wwIH7q0NDNYzIPHVfd3sfObcaGdKNAoYtRQT
         UFxp/8Jd9FcF4Z7g9ExOLk5utUhiMAVMtvZfovXLALdhE+uSEa27oNGBMutMCTFr3vQH
         nO6CShVQRzisz6UOHsK6GIDxyESb49cWA2stlgYpX5GAiECB2mFE76kF33bYzOYrD+2H
         oxag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k1fC8pgJCKW2AtBxBMf1LhdlL3aFtmP7ejxI3861g2c=;
        b=QXBb8urTDmersWt68IXrLUOlU4C1SAzWoc610UQlXF4lKgP4PTD8bA4M/aYWOIJHDd
         2zDYW52w7qqGeVq6abDswvHJZ5ouVujMDlDcQh1FfeeViDauXzU0gA80iZY67tjH6m5e
         g4M9T9MhCXIonCTFd3uQYTKH7VYhUPE4btXrbRQeFhXjC4Pjsw9/sPkIYPTsWCOtgM21
         yU5SC8+6YXv7Kv6Ol/iUwX9lcExP7YYF5VXwdBEx2aPQX09e1Degp91O/xwAxofko9v2
         dmNABCPIPDnxFMgtyBMTzwG/eVzqnvSOSW3vYxYy9+el4X/0njzcrdep9MtkhO0fUXUS
         y+Bw==
X-Gm-Message-State: AOAM531Bs2EYfhUgBKDEYYaEN3GP8imMeg2J/jk8kIaAyf8jprHPdKes
	6OP26AKG3vQ7Sz98Tg+hvH8=
X-Google-Smtp-Source: ABdhPJzmjnVf1GtaWXbEHiR/JpFr0sMrmNCzNXhzdcRWm/GBgDs9eNIBrK0x2/eOo511US5xXe4fDg==
X-Received: by 2002:a17:902:f205:: with SMTP id m5mr13573098plc.71.1643473927298;
        Sat, 29 Jan 2022 08:32:07 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:06 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 15/23] staging: r8188eu: convert rtw_p2p_get_peer_ifaddr to return void
Date: Sat, 29 Jan 2022 21:58:07 +0530
Message-Id: <4a51963ce86a5f6bed4c07e545cd64091eeb0a8a.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_peer_ifaddr always returns 0 and it's return value is not used.
Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 343b4ad6ce65..1f89f4fe4d8e 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2516,11 +2516,10 @@ static void rtw_p2p_get_role(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_peer_ifaddr(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_peer_ifaddr(struct net_device *dev,
+				    struct iw_request_info *info,
+				    union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2530,7 +2529,6 @@ static int rtw_p2p_get_peer_ifaddr(struct net_device *dev,
 	sprintf(extra, "\nMAC %pM",
 		pwdinfo->p2p_peer_interface_addr);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_peer_devaddr(struct net_device *dev,
-- 
2.34.1

