Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C12233FC3
	for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 12:15:49 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id q11so22106245wrr.9
        for <linux-staging@lists.linux.dev>; Mon, 30 Aug 2021 05:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7cHO6aqtFRbZaEb7acvE6qfuRagtWYmYRLazF/3j2zU=;
        b=lYxrfdq28M2UtVN+RGrnP+krx6fmtgoIeqRo/Gn02DZjL+yIPJJKdBdeY7+kodxQb4
         j3Wuyt9lo1QxSwRTldk0cpuct34D1/xIp8KWcTwUb93+QuonfmebnNc8nkToaYRed85I
         ixBWjrqRogTfT3LbiMufX5KrnuFOH59SfoL6g5SU/T1gcStfJIy/077W3IJy4SODeXOx
         XHm6GQ69x+uPOaeGgBHb2gRb5OGE9TlGXBqOaA1az3XgeYcVibOEjZ1pc9z6cFLqQ0U7
         w+pQta/xfALlhR042vQcSM6Wl7rb+kxCU2Apf+xqvtc+rIVTxvumRSdLk5ZgJ2ONik7n
         kDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7cHO6aqtFRbZaEb7acvE6qfuRagtWYmYRLazF/3j2zU=;
        b=ZNP97UnZrJqnzrGFk89GwLVa1MgcwxED0fsw+aec6sR0O6rXDtnNV400qOB05aGFFa
         GP/KGWDJ2OMm4gCNTaa+T2zQJ9Mqsz0lzP1DFwLp1YPydxkHB1hDKqC/WGsi4JsP44uf
         9aPzwCO+A034SDCWHWVGuGLEpten9nkdPN9LrEo0ZlMu+nUmwadwGwioIEF/tEpeK19p
         6IQyqXDLL7233nQZEMNpK4ULHXGZJL3DlzgsH0YvnqQ4hTq0c71587WfsFViy2uwJVCX
         dDtS6p8vxiUnsQj3EPyGaK2H86TTbXWmnGhesNW/ikuQ2LqxKLWMj6Opo/ZOLgbnYsDy
         VnYA==
X-Gm-Message-State: AOAM533Hc55waO8UrRD0h2xxliODBfD/DP2K+ugXpDJ7AUhakPJuAc+Z
	NUdHaCp3bvooge7UJ9xcuNM=
X-Google-Smtp-Source: ABdhPJxMgFCmbfkhv6FbtiLoyu3VL1xeRWrCjjezOABm8MEeZGSDhbE0doMiC6og2V4YwZkdnu5esA==
X-Received: by 2002:adf:f9cb:: with SMTP id w11mr26290535wrr.382.1630325748285;
        Mon, 30 Aug 2021 05:15:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::16fa])
        by smtp.gmail.com with ESMTPSA id x11sm15492116wro.83.2021.08.30.05.15.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 05:15:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 5/8] staging: r8188eu: use random default mac address
Date: Mon, 30 Aug 2021 14:15:05 +0200
Message-Id: <20210830121508.6411-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210830121508.6411-1-straube.linux@gmail.com>
References: <20210830121508.6411-1-straube.linux@gmail.com>
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

