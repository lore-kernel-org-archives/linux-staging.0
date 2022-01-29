Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DC6E2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:37 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id d187so8961729pfa.10
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=o6tVV3EV5GZ5J/+KxHkNVwDUV3xfQLU/3YBnbUf4aGM=;
        b=hCgYXrv6DRbcOuxqv2dfwWHpSTMEEg8Mpui5vyFv4gqzTslH62lPPj3eU3lPodSzzj
         20JNikaM7qrs5UqzNvhdJl2HKidG0ehRxcTX/Szw1ZtFQ5eonVSrc6SM7qd7TfYyN9R4
         fMswRD1VjIl6WZoJ9U4Uo5szk31jVCfL/Rp/9JpWcfJvZZyAg+4ZlUqF2yqBAx1vJJ8Y
         6ETl1ssSso0uV8KSoRFJBjFVwlgfb7s+Q9v33Ezd0zAM0tfa7JlB8qwxU9X6fYc+VJK0
         pIklOaTv6E2+//ppXK5jjQRBlA8xXkGg5zvqXaZk1eHptON7+6cW7DWRsSp1DrGq4xIq
         sYGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=o6tVV3EV5GZ5J/+KxHkNVwDUV3xfQLU/3YBnbUf4aGM=;
        b=OXfhpQZvVUCcKk6xpzyOJ3oabJmMAvuUHGaXnqxquPFGwuzoCqEJYN1dT21y3TAVck
         aRWLOJQ8pgUiZ/UqxKAhBvYWChYqo/eq0HuXfMLCUBP3yXT/K9a++iVB5EcsIpqNog4G
         TbhxzdozKwl2gODx4otbK5jSMe6UItrmLWsaO5LrGOARafTvxO0rY50hyUK1RPeiUD+i
         jPU71UeuA7/LkPcI22enenn5SfyR45oQW7AsWE08GXnP4x0AEApgOQHLRalhqSvImaOi
         3EgsfBwinSK9lGmugq/V/A66z7w0iwMIRvJSLstbwhAnAqOFU5xBT1NoebtIUhxTUvig
         b9gg==
X-Gm-Message-State: AOAM5320p1OsGstBD53+m5ZCU5u5zHdWAGVjAoaP6IC5fG0lXf3Eq/+5
	PPpipHcw8PVVsEsIdbOJFlY=
X-Google-Smtp-Source: ABdhPJxvSzeza5iycL4aC4oHZRG2A7r2dKzZSFqF4ywHytGL0mAiZoaR2F6CsnK03S0PwkJr7xmO5A==
X-Received: by 2002:a05:6a00:1ac8:: with SMTP id f8mr12890844pfv.7.1643473896998;
        Sat, 29 Jan 2022 08:31:36 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:36 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 07/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get_device_name
Date: Sat, 29 Jan 2022 21:57:59 +0530
Message-Id: <d94c3029128b9c094bf4e0b2e4574a177aef46e9.1643466748.git.abdun.nihaal@gmail.com>
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

Remove unneeded return variable that is initialized to 0 and not
assigned after.

Found using Coccinelle
Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
---
 drivers/staging/r8188eu/os_dep/ioctl_linux.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/ioctl_linux.c b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
index 6d72b15541ab..33fe8e944df4 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2844,7 +2844,6 @@ static int rtw_p2p_get_device_name(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 peerMAC[ETH_ALEN] = {0x00};
 	int jj, kk;
@@ -2903,7 +2902,7 @@ static int rtw_p2p_get_device_name(struct net_device *dev,
 
 	if (copy_to_user(wrqu->data.pointer, dev_name_str, 5 + ((dev_len > 17) ? dev_len : 17)))
 		return -EFAULT;
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get_invitation_procedure(struct net_device *dev,
-- 
2.34.1

