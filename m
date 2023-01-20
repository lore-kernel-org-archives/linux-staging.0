Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C343613A
	for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 20:18:23 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so4516779wms.2
        for <linux-staging@lists.linux.dev>; Fri, 20 Jan 2023 12:18:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uiygPQ43h/TyrnBCK1EPAnMPnfYQRYi9ihjA+N7LKWY=;
        b=qwAu39Da47bxut80nQTtpUUoYBrQQ9MJzqE01elmxTr8gWBx5gjJVcBR/sJ13pdigo
         yjODR4EgK9UzG9LShkfKFoiAifSKwHjDLvPse3hd7R1FFit+ICidg0FHixWh/R7tdg9x
         53T/lPbeYRGmt4JAJ7lLTholZ1jL3tUTGQbMx9UMgmNglSXed1WcDE1LtGpd44y0YPUg
         8lGjSY/F3xznmNQ9Mq3hbG+wUYryTN9hCVDY1qy+Nvc+oPdAv/y0ewwOZ4PFmyAijQ7r
         ZxDQ0ChjjwyvJLlqIVfzdkLzuWXyrYQmjZRzxYimHODSys+sd6bZsCrGnfTQnS+S/6rY
         td/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uiygPQ43h/TyrnBCK1EPAnMPnfYQRYi9ihjA+N7LKWY=;
        b=O0+WxkSllA2jNUbtI3X79MErVvbrkj7hcH1fXt7it/9JW1le/U/E47l+xdyzY0TDsc
         PhW+SkbGVc8j5ESYVBIMKGWGw3WRCYtR/pv1Wge+C27eErHaf6TquoClh1FdwB1XKOzQ
         T3zXurYZWkucpkQBAKYFpCFNMEsIAWbZdIseEajLwgxHmrKpl2xvrfJVy4idkGUZkH0f
         JxU+gHQlRv8kdLnIBudwVDGZlCL5EoRTDfZzT7Q2t/a0xyc7IG8GVYxAqXZGBK3qvb9N
         eE+ZLqoaH9WN1nP8o0yc8rKuKBirNCZlMCBnpanJl1D+eOq7Hbm/VLPVENbxlC8udzZf
         H7/A==
X-Gm-Message-State: AFqh2kr05iPUgCFXqbOtsjnKwUyiRmsIoefl+sOGY+2WFBD8brW0C/mr
	a9OVJZ0DJ6YfwIuucVSt1Nc=
X-Google-Smtp-Source: AMrXdXv48gBvnjsBa3XXFkAgQH+M6piUHkXjo2/aUtj/gWWxMn7P8yQxRxOIe1tqUJFaBy1/ulivhQ==
X-Received: by 2002:a05:600c:1e22:b0:3db:2063:425e with SMTP id ay34-20020a05600c1e2200b003db2063425emr1959885wmb.1.1674245901642;
        Fri, 20 Jan 2023 12:18:21 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p57935ca5.dip0.t-ipconnect.de. [87.147.92.165])
        by smtp.gmail.com with ESMTPSA id p19-20020a1c5453000000b003db09692364sm3203653wmi.11.2023.01.20.12.18.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jan 2023 12:18:21 -0800 (PST)
Date: Fri, 20 Jan 2023 21:18:19 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] staging: rtl8192e: Remove ant_pwr_diff which is always
 zero
Message-ID: <a550004dcdeb9e0b716f69033a541457c1f12c86.1674244819.git.philipp.g.hortmann@gmail.com>
References: <cover.1674244819.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1674244819.git.philipp.g.hortmann@gmail.com>

ant_pwr_diff is set to zero and then masked which will always result in
zero. Remove ant_pwr_diff and use zero direct as it is just useless
code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index 33e3435b50b2..c969c40c3979 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -586,7 +586,6 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 	u8	powerlevel = 0, powerlevelOFDM24G = 0;
-	s8	ant_pwr_diff;
 	u32	u4RegValue;
 
 	if (priv->epromtype == EEPROM_93C46) {
@@ -600,12 +599,8 @@ void rtl92e_set_tx_power(struct net_device *dev, u8 channel)
 			powerlevel = 0;
 			powerlevelOFDM24G = 0;
 
-			ant_pwr_diff = 0;
-
-			ant_pwr_diff &= 0xf;
-
 			priv->antenna_tx_pwr_diff[2] = 0;
-			priv->antenna_tx_pwr_diff[1] = (u8)(ant_pwr_diff);
+			priv->antenna_tx_pwr_diff[1] = 0;
 			priv->antenna_tx_pwr_diff[0] = 0;
 
 			u4RegValue = priv->antenna_tx_pwr_diff[2] << 8 |
-- 
2.39.0

