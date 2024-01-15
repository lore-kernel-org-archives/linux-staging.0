Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C801FAB
	for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 08:34:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vyq4DuDE"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-40e8004629bso248465e9.2
        for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 00:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705307689; x=1705912489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zsLZp5AjgU2ikojusqifaSf7hD6PKOOj66CfoLC/Lys=;
        b=Vyq4DuDEtPgq3XGpjlVm916dyF3CToZT0bAXphkqutKsiSYisGdq/9bFiNzyRbakKk
         rqKDn7RVJ+kiTOT8lvE3wFevDSFPCDF/ls0dFkkFB4uks7iAFqRIR6JXf31m4/1kC48V
         ueZWMq4PxfnUIEFBQb6EP9zOj4jaWOgkNw12RLJZt8wJzJtrd+QAg6XXbii+uq4I/VpJ
         XFtJckyTViJL5yqFVNNAxEnO38O3KvsP0QVTVUsTe8nrbSwTB3fQkePi+FJUKOxDdxlo
         /25IHV5bXkPXlLdqNGtRwjzIPA36y5PdpGpJio/Utz1mCx9MfzUtmZMw+HkIuj3p1Hhi
         5NzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705307689; x=1705912489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zsLZp5AjgU2ikojusqifaSf7hD6PKOOj66CfoLC/Lys=;
        b=OnMiqCKoVBWhO+SNVW9C5FA5H4vpkPM+LD6yda1ZylWRC50iVtXzv5eADO9nR7hXP5
         5rHzV4iaXwcp6kFnmQLs/LkrOzSQZ1+vpMG15riLhmjxYMOnhYS2pOkgVl1SQVxu0SZv
         0yAefUhMRhA8IUz2w8sQB26tXsWp81rcMh1C0fHpTq7JkSZ99dMjvowxwFpdip8j8V/c
         t2CBP5cyWNAVy5gz/Zed23MC6M7+XNuIXlMX57o5/n/enkKu3nYt4V0wtrAylUjlFoNm
         uU35KW+Hba8Pb59pKtj0GMnT3hlLgRpZOW3jNEb+KbQpvW6QcmDFk8Wn4UjDJMdkKLat
         kh7Q==
X-Gm-Message-State: AOJu0Yz+FkGqG9ycy2N7bUr60dsrSPpafDbZFDPip1Jy+MaFJ1SgKZYL
	z/F1nTJffgbpoLSKpJvYhZnm0QAT7yRsrJEL
X-Google-Smtp-Source: AGHT+IE4tfUXqymNsgq59LGKZ5TuuZttpDPsYe30flbY31bsQuShVGOXM7XhNIcSthIy8RBdZdt+lQ==
X-Received: by 2002:a05:600c:2101:b0:40e:3796:8cdc with SMTP id u1-20020a05600c210100b0040e37968cdcmr1563040wml.135.1705307689276;
        Mon, 15 Jan 2024 00:34:49 -0800 (PST)
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.32])
        by smtp.gmail.com with ESMTPSA id e16-20020a5d65d0000000b003365951cef9sm11164596wrw.55.2024.01.15.00.34.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 00:34:48 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Mon, 15 Jan 2024 10:34:46 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH v2] Staging: rtl8723bs: rtw_ieee80211: Remove extra space
Date: Mon, 15 Jan 2024 10:34:38 +0200
Message-Id: <20240115083438.108901-1-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning: please, no space before tabs

Signed-off-by: Meir Elisha <meir6264@Gmail.com>
---
Changes in v2:
- remove additional extra space in rtw_get_bcn_info()
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 30e7457a9c31..b89e88d6a82d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1035,8 +1035,8 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	u16 wpa_len = 0, rsn_len = 0;
 	struct HT_info_element *pht_info = NULL;
 	struct ieee80211_ht_cap *pht_cap = NULL;
-	unsigned int		len;
-	unsigned char 	*p;
+	unsigned int len;
+	unsigned char *p;
 	__le16 le_cap;
 
 	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
-- 
2.34.1

