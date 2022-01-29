Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95732CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:32:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id d18so8887974plg.2
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:32:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VBYOJsyQo0pB3WhiZOo7z3RxhrzkZJZf25jJVH/qEs8=;
        b=bU0csZXhAShQ5Mt6KL1xFYVQo0e1TbiTW1dlUovLLfZsYO1YbjGwMgQ67WxCu1dNtD
         w3MuG5YhCVScXkKIB5iiBnK8Y8mWF7PygPQKH0LM4r+H5cuUFCSaZvzGAj1ibWOZWXwy
         whtC4QoCHf+GfiEt2KtKShj59gjQx6LwxXCRtxwHHG+k39EgvvIiQtIVLVPoFWFkmvA0
         AwEkAPNmvG/9Luo27HcanC+dJn/QWAdAvGVkuCfhk58uV4XXp28Fuh3fT0O7K8MF5qju
         Bo3tK11V500KVJ7mdm23ch01hTCf8FDSFX+uRYACgvTje7fjGrwLuAydq9wXqWEO8LSM
         p81g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VBYOJsyQo0pB3WhiZOo7z3RxhrzkZJZf25jJVH/qEs8=;
        b=SLjpcUHYl+dOs+1qvxSq1/FXQk4jSDM+p2Ysd9jNbJQMJFrchCnBgDqxgBRBIJXFqQ
         7gOsr45oVeymSXMeh8ApiLtekMh1bQLlPwzXoc+v8sVHollMwOJ3t3v1rA8gJ4HatDen
         fhAzqWaIFUDnjKOouWIcGjr1c1FRMlq+/iZrQziBtnOFTkdxm1s4wEA6D4E2aKQW6cOm
         OWxT9CVdzq5GdawLQX8L8M2ZUqqsenwauLqW0B0vQEfEcYrmVuJb8BaG94uEjO4OgmGb
         QwMuypCW5ZI1zqhvOHsGb6sEZEu24QOS7Lmyp2d8UOCbAAsDTq96Go5doYK9JZ1e2dx+
         Cv+A==
X-Gm-Message-State: AOAM533gzIOWAf9H9GAxUuPCeK1KWJkhf+vhmCWaNHFKTrjyg7IRON6t
	G6vxjHb1JiaHO3pjyXNcs2g=
X-Google-Smtp-Source: ABdhPJwd9x7z5p8k1SYwXF6Kgtt4b67Lz+PACdx3SAFvvaLqdjz5YlrBmMpslukdZw/Q/OH3VsaPoQ==
X-Received: by 2002:a17:90b:3886:: with SMTP id mu6mr8528799pjb.231.1643473931209;
        Sat, 29 Jan 2022 08:32:11 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.32.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:32:10 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 16/23] staging: r8188eu: convert rtw_p2p_get_peer_devaddr to return void
Date: Sat, 29 Jan 2022 21:58:08 +0530
Message-Id: <cc077a7d11e4bda521294499c42164db7358b2e1.1643466748.git.abdun.nihaal@gmail.com>
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

rtw_p2p_get_peer_devaddr always returns 0 and it's return value is not
used. Convert it to return void.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 1f89f4fe4d8e..dfd19a649803 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2531,12 +2531,11 @@ static void rtw_p2p_get_peer_ifaddr(struct net_device *dev,
 	wrqu->data.length = strlen(extra);
 }
 
-static int rtw_p2p_get_peer_devaddr(struct net_device *dev,
-			       struct iw_request_info *info,
-			       union iwreq_data *wrqu, char *extra)
+static void rtw_p2p_get_peer_devaddr(struct net_device *dev,
+				     struct iw_request_info *info,
+				     union iwreq_data *wrqu, char *extra)
 
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	struct wifidirect_info *pwdinfo = &padapter->wdinfo;
 
@@ -2546,7 +2545,6 @@ static int rtw_p2p_get_peer_devaddr(struct net_device *dev,
 	sprintf(extra, "\n%pM",
 		pwdinfo->rx_prov_disc_info.peerDevAddr);
 	wrqu->data.length = strlen(extra);
-	return ret;
 }
 
 static int rtw_p2p_get_peer_devaddr_by_invitation(struct net_device *dev,
-- 
2.34.1

