Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9763FC4
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:04:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id u9so22046082wrg.8
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:04:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7cHO6aqtFRbZaEb7acvE6qfuRagtWYmYRLazF/3j2zU=;
        b=bWyFtFnHHjK8N5LINhXpO5V3C0m0KdSkeYA3TTx+KkVlXtL5XGvjxzJMm6kDXOBaXE
         WybishoDoYgk8dTPTDUFFS0qMs0IVJJ3X3Cb2rsUwpJ7hXgkY82oO5BmF7ovVg84xXm8
         Q6ZSQsy3/qGldC0zxV/pCNeQlBc700JVr6E7gKAe7QkeqE+5qBc/165ltqUaoWZpshj9
         099eoGWZqOd/jtf7k0B4fOV/Fg7yLIUiBMcGSL0FUBt8GPITfjTYbb1nXQdarYdE/o6z
         /gIyCDQfUmPEKP803LWDSkr2BLEM2bV9BH3qfgFSy9cgYZF2GIgyMPXtAutEHwVdkpgL
         bF8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7cHO6aqtFRbZaEb7acvE6qfuRagtWYmYRLazF/3j2zU=;
        b=hBu9GaMsCD46lTy4ZmeLZZ9qjas4ojrmFNa0lYgb7+6ZMjT90V916oPwR1eunQqESk
         OOqNSYE/DAgCW72HtJknlSMIyyzqvei2QYqOtzDMD7v6z5wz4jprX9iwKfStjNWKh40f
         rsfs4WvJ8xo5ZzFDnntQasIJK8C89I8ZsBm1y7oJymnaYSCeGG9dc9KELgDqGy7DnwcD
         kjvCeRcEpj6o6z/kVioM3VPq9Kr4Avk5tY5Wlq7iBZQuKtN2/reRkEStNYhmbEW6hiER
         q0lhjw4Q70zKcQUhbGP2/yecAYZeb9mtrFnRhT29++L0yrfvdd4Ma4FbGJZC7nCa12nF
         /tHg==
X-Gm-Message-State: AOAM531T4xs0lAwgbdnavsCNpFSRZTNX8iZmoJA7WILvx+Ib40gSGHTt
	njVyik6X3YH0DY6GCpLo3pw=
X-Google-Smtp-Source: ABdhPJwiBuUyFGWfYSjEo5IDqa0vudhK/f7vP2BgXGWxW56ilyvmOd40MUy+ZpDyKPkNMc5v1uWolQ==
X-Received: by 2002:adf:f943:: with SMTP id q3mr26062268wrr.118.1630325078298;
        Mon, 30 Aug 2021 05:04:38 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id f18sm13184195wmc.6.2021.08.30.05.04.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:04:37 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/8] staging: r8188eu: use random default mac address
Date: Mon, 30 Aug 2021 14:04:17 +0200
Message-Id: <20210830120420.5287-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830120420.5287-1-straube.linux@gmail.com>
References: <20210830120420.5287-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use a random default mac address instead of a fixed one to reduce the
likelihood of mac address collision.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index 35a548e1c92e..370a710ab7cb 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -1033,15 +1033,8 @@ void rtw_macaddr_cfg(u8 *mac_addr)
 	}
 
 	if (is_broadcast_ether_addr(mac) || is_zero_ether_addr(mac)) {
-		mac[0] = 0x00;
-		mac[1] = 0xe0;
-		mac[2] = 0x4c;
-		mac[3] = 0x87;
-		mac[4] = 0x00;
-		mac[5] = 0x00;
-		/*  use default mac addresss */
-		memcpy(mac_addr, mac, ETH_ALEN);
-		DBG_88E("MAC Address from efuse error, assign default one !!!\n");
+		eth_random_addr(mac_addr);
+		DBG_88E("MAC Address from efuse error, assign random one !!!\n");
 	}
 
 	DBG_88E("rtw_macaddr_cfg MAC Address  = %pM\n", (mac_addr));
-- 
2.33.0

