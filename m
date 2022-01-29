Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 574C02CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:29 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id g2so8048351pgo.9
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XPVQMO6visW/k5DSDZIWEQ4IZV34Wlm68x5zMJm/R0I=;
        b=WSDNrWKl8naM+RFgkzSqxqTkKDc1jpU7DZOBA/NEBqu/I/rykIr9Yyjj2OBwDb5oLg
         Hf446toFtvEF3ub5mBeQYpLxbztATMtEsqE8aSDBCvkD+yuPFYtsQG+V89Qh4N6zOqxf
         vSjB6N7BtsMUp/JuNcqLI+QHYX6z7zfd6zbiOxkbHv4+HVqeD68zMYbag2bOCMNTG8di
         jb7RCfqjDFDftbr0nuNC+7QqxZWDvzYysxMWdKB6lsgfKoXXIUwR5MwynE+yBFrQeKDZ
         PDdp0VkzGxMFOwEMGiA/LPo/mtjIQ5UPr02BC1DSt94Fc8ldIDX4JPif97C109OEj5LK
         yEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XPVQMO6visW/k5DSDZIWEQ4IZV34Wlm68x5zMJm/R0I=;
        b=WxBlo/ZcN9BAlml+qkppFtuNuDJaPq9rYzEwPQSK7o2Sd6LeABmYLsWn/U0msVCkuU
         ngXA14HkrygRxVHPD2zaH0AUmU877cZEDt9ubI44HPOd5sToA0NpdlRQYrw9iM77hiJU
         8M8KmOScAxbun1+tmTlJYkjErLmS9DrXI8NDOAb63LjzTmiujewp+BHw0vPKRg1WGPRd
         Uabj9xouQHY7TN3ciJQUUjTAiCuHr/Yi+AIu+Wh1wxE6d/YAynRCP3IK6jKw9b0Qkoox
         Bnjnt1yqO8EbJO5ouzFcHsoWXoDpqvp22ZZje0h8vBLhp4R4hWCVj2DzuDW5Y9NYViOe
         FAVg==
X-Gm-Message-State: AOAM532KpTqz5tiiKuiyLAMMGW7tiVs/gHkdm8fMhZ2lshH2fXkWuLFH
	EOj3Y0gEVp3cVLbw6/R0E6JMytcCwFI=
X-Google-Smtp-Source: ABdhPJyerL4RXYIUlTQj9uW1X/4hRF6FpxS55GEMsr3DNoFwOBFgWPe+ixX32fFaLTsXMJLuk/9rGw==
X-Received: by 2002:a62:8183:: with SMTP id t125mr13046503pfd.41.1643473888852;
        Sat, 29 Jan 2022 08:31:28 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:28 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 05/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get_go_device_address
Date: Sat, 29 Jan 2022 21:57:57 +0530
Message-Id: <26a84fbef7e06d518efc29d2cd9e3dd685c96e0d.1643466748.git.abdun.nihaal@gmail.com>
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
index b0f78673d9b7..b093430ff744 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2687,7 +2687,6 @@ static int rtw_p2p_get_go_device_address(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 peerMAC[ETH_ALEN] = {0x00};
 	int jj, kk;
@@ -2763,7 +2762,7 @@ static int rtw_p2p_get_go_device_address(struct net_device *dev,
 
 	if (copy_to_user(wrqu->data.pointer, go_devadd_str, 10 + 17))
 		return -EFAULT;
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get_device_type(struct net_device *dev,
-- 
2.34.1

