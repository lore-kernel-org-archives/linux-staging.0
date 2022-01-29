Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449EA2CA1
	for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 16:31:25 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id v74so8990148pfc.1
        for <linux-staging@lists.linux.dev>; Sat, 29 Jan 2022 08:31:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=p/iheAiKRNX/zYagp3+t2KC4OOAuSnRdRHqutW+clxo=;
        b=nA9IWgTDotqfDmoKv7jAI40+lzrUkh+z9+by6wqMk3ljCJWHMfYRuOKbEgxC3QXYNU
         cLxIFWe3VDoFvyXN+NEnEeXa5PGl/JhZxp1uL9qyXgBwV4Gc4JaeZJg701RiSJ1Brmfm
         c4c6tghq3u47UHWKPJ+dhriE+YAsbkcuZvAQraS3a32ctt7gzXEswiEWiuGG/FRDzbUB
         9mZ4GQ/xYJtzqxzd/AxDefH/6GzK+IeSVogximlCfD6mroROHp7F2KS5HsMS4IqRvB5Y
         sotf/jQ52nBLP4A0ulProHB9hFZpUF5x/CbW7Jr6zegbWyW5EmRcreszwX8wYZNg/YNl
         5Blw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=p/iheAiKRNX/zYagp3+t2KC4OOAuSnRdRHqutW+clxo=;
        b=pSX+GqpqlXRHbinZPPVEX1jYNJsv+0wt4fK/0IWLcv1WnNc//ivcihyDLy8xF4VeYE
         P9Mn452Wb6SV5tuBy82uzYU+gVK7d6ptJsh+nuZrVTu6CCmQtcWcSEWmXs/1WUNaeMRv
         o0Jj7BtK5yo4m9KTK+Bq38w+5yRhTIEMpf3JrQotkljqorxIX0AfWq5gdGt8UfN/aJov
         YJkkdFY9ZXHYp4qiQHWkmTwB2cc5h7Ur6E4gY2CodL658IQS89Gl5i4xSXea5tZtssXb
         a2UiOgMvy+gJzWbFZAGaMYdP0PrEHk3Rkk6LhiAYmBlQojzHBShrSu4a18eO/pMNkc7d
         DYZA==
X-Gm-Message-State: AOAM5336T2FFoibC9H4TbMuUZGmI1gokQ9l5NCD4Upuu9bu4Tcrx2IiP
	+EQyxC6/rBMWgSnRcAFpv9g=
X-Google-Smtp-Source: ABdhPJzZnyEB0ENS44pWvYySVcUEPE95WuntkwrZCiIALKslTQeB6dmyt4rVhh6TwqCRfbnEiQHhRA==
X-Received: by 2002:a62:1643:: with SMTP id 64mr13019916pfw.55.1643473884798;
        Sat, 29 Jan 2022 08:31:24 -0800 (PST)
Received: from localhost.localdomain ([171.78.146.184])
        by smtp.googlemail.com with ESMTPSA id q13sm1893528pfj.44.2022.01.29.08.31.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jan 2022 08:31:24 -0800 (PST)
From: Abdun Nihaal <abdun.nihaal@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>,
	Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 04/23] staging: r8188eu: remove unneeded variable in rtw_p2p_get_wps_configmethod
Date: Sat, 29 Jan 2022 21:57:56 +0530
Message-Id: <ae35e6f6f603ef83c2bad685ac247273041bd138.1643466748.git.abdun.nihaal@gmail.com>
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
index bc5c8454ebcf..b0f78673d9b7 100644
--- a/drivers/staging/r8188eu/os_dep/ioctl_linux.c
+++ b/drivers/staging/r8188eu/os_dep/ioctl_linux.c
@@ -2620,7 +2620,6 @@ static int rtw_p2p_get_wps_configmethod(struct net_device *dev,
 			       struct iw_request_info *info,
 			       union iwreq_data *wrqu, char *extra)
 {
-	int ret = 0;
 	struct adapter *padapter = (struct adapter *)rtw_netdev_priv(dev);
 	u8 peerMAC[ETH_ALEN] = {0x00};
 	int jj, kk;
@@ -2681,7 +2680,7 @@ static int rtw_p2p_get_wps_configmethod(struct net_device *dev,
 
 	if (copy_to_user(wrqu->data.pointer, attr_content_str, 6 + 17))
 		return -EFAULT;
-	return ret;
+	return 0;
 }
 
 static int rtw_p2p_get_go_device_address(struct net_device *dev,
-- 
2.34.1

