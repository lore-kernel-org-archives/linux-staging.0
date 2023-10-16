Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2708AA2D;
	Mon, 16 Oct 2023 07:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7Eu8Woh"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4056ce55e7eso41384045e9.2;
        Mon, 16 Oct 2023 00:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697442183; x=1698046983; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=82ZZk+PdVHD4SgeMSwIuwPbebfsYW2eoRNAUDZyb4ZU=;
        b=E7Eu8Woh0yHR3A2Wec5rlPs47wdjaO6ljh304lY0Qb46lZJTlv8tmw5LA7c26DYwsR
         6e7JVU3MhonecACg5/7m93cmNPIXxPMH/wwKmOMbrYM9sVkAqXO70q6gjIFu17u/cucM
         BrYgr7A8EIUzpnYdKquq61paHeXlatslYUC5NCYe+u16ZqOlh6SUmNKAqS3IOA/y5Dma
         RSpuwOxK35BOfxI8XBqK+N80FPhFl25AnaE3BpFZg9wRtP7SwpGwMTAiM8QpfZp9IOPD
         mRtOf3Is4deMOiEa76qm6+xSjw/F7aU48VeortfCdCjGLDBkRTgCuTQz73FQtzUNBmgs
         Ij/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697442183; x=1698046983;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=82ZZk+PdVHD4SgeMSwIuwPbebfsYW2eoRNAUDZyb4ZU=;
        b=TFbl/Yz5bauRKhVrN3rdulnnRGKSUWX1SW+rXSWMrqPLaokQtdq7MGeMqSgZW4Z/rU
         e65R02HNeAqd7o2slg9Eb9KOZYRTrgMkpcG37vf8R4y4UCgg1Ci2nJXIKIpqEKgH9xWB
         0vvsVpJUtQqPNJl+3ya035lrl0IIppiKJvgLwLlIn60Gsl3+2tJJKnDWW92ikiRrU9+a
         WikuBMrhcCQursBSaxGQ5M2PwkH5/A9tfnukhu6DcvA0k+0YfWLqfikpgR9Ihym4YGrK
         pkPbihbaCl8TEP2xzxZJhadgzYk1emDcm9HCumPuyB7uZs3fFA1Ilw5ITVqQr8edMOot
         heRQ==
X-Gm-Message-State: AOJu0YyeEZy8akoZgYhmzuXEJw7ySzf97d+4ALZfSRc09mOMTcEp6KLq
	nyPRC6Gy9O9/IzuoWEkrZxQ=
X-Google-Smtp-Source: AGHT+IGiGMf1Qjq+nmSCG42rGlFyIuIJ6x7MSy7vJ7i9u/Hq1ziL0XDZYoa3a1ZD5JCV5mtlWPR9QQ==
X-Received: by 2002:a7b:c84d:0:b0:3fa:934c:8356 with SMTP id c13-20020a7bc84d000000b003fa934c8356mr29857003wml.10.1697442182984;
        Mon, 16 Oct 2023 00:43:02 -0700 (PDT)
Received: from lab-ubuntu ([41.90.67.11])
        by smtp.gmail.com with ESMTPSA id e28-20020adfa45c000000b0032d892e70b4sm12398417wra.37.2023.10.16.00.43.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 00:43:02 -0700 (PDT)
Date: Mon, 16 Oct 2023 10:43:00 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: gustavo@embeddedor.com, outreachy@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	Calvince Otieno <calvncce@gmail.com>,
	Karl Relton <karllinuxtest.relton@ntlworld.com>,
	Dan Carpenter <dan.carpenter@linaro.org>
Subject: [PATCH] staging: wlan-ng: remove undefined function
Message-ID: <ZSzphFeckE7dM5g/@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The function p80211wext_get_wireless_stats() is declared in the code
but has neither been defined nor referenced.

It's definition was removed 13 years ago in the
commit cb3126e60ffc ("Staging: wlan-ng: Switch from wext to cfg80211")

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
 drivers/staging/wlan-ng/p80211netdev.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/wlan-ng/p80211netdev.h b/drivers/staging/wlan-ng/p80211netdev.h
index f5186380b629..485f2c697f5f 100644
--- a/drivers/staging/wlan-ng/p80211netdev.h
+++ b/drivers/staging/wlan-ng/p80211netdev.h
@@ -114,9 +114,6 @@ struct p80211_frmrx {
 	u32 decrypt_err;
 };
 
-/* called by /proc/net/wireless */
-struct iw_statistics *p80211wext_get_wireless_stats(struct net_device *dev);
-
 /* WEP stuff */
 #define NUM_WEPKEYS 4
 #define MAX_KEYLEN 32
-- 
2.34.1

