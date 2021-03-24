Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5825F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 15:50:52 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id x16so24941697wrn.4
        for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 08:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=G1l/7GKgxC7z3LCn+ZLNkyBsm6JDNMcpMQeWILgYaPA=;
        b=NeIspziNKd3CbXe6b+FgHM9e6pQTnnSJJidiFBjXj3//O/y2gJhLgjArQGeu4DMLL6
         mYOQJVfBAERgZdz7mjY3HbjVJm2+r0FOWrrDGb/b816eeayn900ULP8p8AjgGjw10oFO
         jJnjqktQm240XySnr0RnLGYqDDcvvmQsAO0JY0jHTy2Y7yPYLZKPOEKH6geI132ddzXK
         Ydvd72fy//89OwouThjOubdkKEQciJiJTiCy+xYNkDTzj4IKes5mAPBKr32JxA6UbkCB
         cv0azkG0pTm7KDzH57QRVz93fEEI/INTg3IsxTa0JCIEph9tQOWDch3q6wiqeIPPhGxZ
         pdsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=G1l/7GKgxC7z3LCn+ZLNkyBsm6JDNMcpMQeWILgYaPA=;
        b=C8VGAPTVxrlbDRLH/j9tzkKi6euMJKMb9IEOslIxG1R+M7rFZlmSqz7DBR5/7vIUtu
         q+lxS553ccoU7q0frnTsRkMR0u1DwqLNJJ3Y8CSbfwMW33ZM54KvDAtJozaQHDED+q4e
         VQ4YGYTR5zkxbiJtI42XW3Ewnu0wFRVN/0Y+YfhtMkLwsTfvHL0ny16SJC78+3jEbcdz
         EssFjOyGWungXae2VYI5e/S+amjVfUJq7778TK43WfZziVCGfpucaYGZRYGhGfZU+ApP
         tvRoTMOMXrRl7+W9OThRRBavOThis6KQvrzUPkc8+eKyPTupKjQySpbe3FHfBtxeFZcO
         8+/A==
X-Gm-Message-State: AOAM530qVTefsQQyaI36040kIqjYI/lTcmTsML+OQUuDe9740a6oloIk
	PWctsuqlS5WXT7RSqTWqQMd6z8tKNWA=
X-Google-Smtp-Source: ABdhPJz3j/PjU7fzF181XjNCu86wiHgkViX0UUQ5/OfaGedQbY/q5jXJE2nXs+YSFLZFZaiUoUh3lA==
X-Received: by 2002:a5d:5051:: with SMTP id h17mr4186559wrt.80.1616601050936;
        Wed, 24 Mar 2021 08:50:50 -0700 (PDT)
Received: from agape ([5.171.72.168])
        by smtp.gmail.com with ESMTPSA id j30sm4105046wrj.62.2021.03.24.08.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Mar 2021 08:50:50 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: remove assignment in condition in core/rtw_ieee80211.c
Date: Wed, 24 Mar 2021 16:50:34 +0100
Message-Id: <8e784a7e1407924724c97398af8e5aeb23460612.1616600897.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1616600897.git.fabioaiuto83@gmail.com>
References: <cover.1616600897.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fix the following checkpatch warning:

ERROR: do not use assignment in if condition
1118: FILE: drivers/staging/rtl8723bs/core/rtw_ieee80211.c:1118:
+		if ((addr = of_get_property(np, "local-mac-address", &len)) &&

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index cccbea555a32..e931afc3ba22 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1115,8 +1115,9 @@ void rtw_macaddr_cfg(struct device *dev, u8 *mac_addr)
 	}
 
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
-		if ((addr = of_get_property(np, "local-mac-address", &len)) &&
-		    len == ETH_ALEN) {
+		addr = of_get_property(np, "local-mac-address", &len);
+
+		if (addr && len == ETH_ALEN) {
 			ether_addr_copy(mac_addr, addr);
 		} else {
 			eth_random_addr(mac_addr);
-- 
2.20.1

