Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6110A2FAD
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 17:29:24 +0000 (UTC)
Received: by mail-pg1-f179.google.com with SMTP id e22so1520184pgv.10
        for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 10:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nftD8Ovn49TMt2VJgq8EIyq7dzikLLs6FMzeX6li7D8=;
        b=VEXXKYydQ3YbaIKTVTGtXwiu4Dmw56ffQvv3qQ49w/K65BOT/YfnJ7v/0SoV8Im9Hc
         2797jqlLW7VwScUMQ3Qxj0AtWygZ3XU70iHewx6Vad6ao+Yqn7DC4GdBkyZ151kvELww
         Ch6dHGjA59ki6nhZNX3Ids477h7FzI3g0bT+tYdRTsXSR+tB540Iad1V03fTudGkGal7
         TfKQpHtmyJAWiH2LZh3sYVEMCtt2jjSTZdu+AKK8DgqdPYVSdaalv0LghG9knzVOMQQh
         Gd63Uq/QaBasvX3mKkHh37wb6IYmF5QFUrXD5t/IisvOEzpb8hTqRMb/HEBkSMM8VNXF
         Oe1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nftD8Ovn49TMt2VJgq8EIyq7dzikLLs6FMzeX6li7D8=;
        b=QRcUwyiD7QSV5o0bbqLHVXPCSMWXtuUCMHYkZYsHaEgGbyxv5OIA6ua7PbMOWhinC6
         FnAiDZwFdbUneYxJgol6/WaNOMIJSKe7B5Rt7uQ8CEB//c/1JsHsV2FHX4BpjfTcKoN3
         m5llQx/TTP2aaypfVVIJ6XY5GoySHrRq/aAMn7M4P+bxABJM43fpO94G88zBos0B05d1
         LGZeO2oC847SITevcEuMlgyc/mONmgivn9DldoAQM8cKwnvMisQH8dfLFI4M5c210dVU
         wgKD7sLzIfCKUTTVsHKTl+NRQbI2K86tZThhg1zMDGU5mLi6IwgzNgpRehOejsYMJVsz
         YiVg==
X-Gm-Message-State: AOAM531VhZCwynaZvoVwvVhJI3gyk/ncAV8yCYcjEdtBW8Nlqilt2pCg
	5lG7bUdWDnXAgJhq8iks8pY=
X-Google-Smtp-Source: ABdhPJx6V7sAr9IXgDsXzlHtizpo+MyWdxbrD4Nr8RkJU9Z/CUM1/6dvMgtn3yU0h+wuOE3N2LlHiQ==
X-Received: by 2002:a63:6c9:: with SMTP id 192mr26453695pgg.39.1622050163749;
        Wed, 26 May 2021 10:29:23 -0700 (PDT)
Received: from localhost.localdomain ([106.77.36.0])
        by smtp.gmail.com with ESMTPSA id h9sm15230876pja.42.2021.05.26.10.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 10:29:23 -0700 (PDT)
From: Piyush Thange <pthange19@gmail.com>
To: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	john.oldman@polehill.co.uk
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Piyush Thange <pthange19@gmail.com>
Subject: [PATCH] staging: rtl8192u: Fixed warnings of coding style
Date: Wed, 26 May 2021 22:59:00 +0530
Message-Id: <20210526172900.56093-1-pthange19@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed coding style issues with comments.

Signed-off-by: Piyush Thange <pthange19@gmail.com>
---
 drivers/staging/rtl8192u/r8192U_dm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192u/r8192U_dm.c b/drivers/staging/rtl8192u/r8192U_dm.c
index bac402b40121..725bf5ca9e34 100644
--- a/drivers/staging/rtl8192u/r8192U_dm.c
+++ b/drivers/staging/rtl8192u/r8192U_dm.c
@@ -2876,7 +2876,8 @@ void dm_check_fsync(struct net_device *dev)
  *	When		Who		Remark
  *	05/29/2008	amy		Create Version 0 porting from windows code.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 void dm_shadow_init(struct net_device *dev)
 {
 	u8	page;
@@ -2915,7 +2916,8 @@ void dm_shadow_init(struct net_device *dev)
  *	When		Who		Remark
  *	03/06/2008	Jacken	Create Version 0.
  *
- *---------------------------------------------------------------------------*/
+ *---------------------------------------------------------------------------
+ */
 static void dm_init_dynamic_txpower(struct net_device *dev)
 {
 	struct r8192_priv *priv = ieee80211_priv(dev);
-- 
2.25.1

