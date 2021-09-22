Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80893FC8
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:36 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id t7so10279561wrw.13
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+tX+tSWqrqfKGbOTZFpi65+Rb/F0bC4ddpqsmevyBtA=;
        b=JvJYtmVPlo3ZyRjebVwZQo/atvNnPUmwOUs7hPE3gSrHUvrQUyw2grwl0A63PgqlvS
         Jk1a1IumVfg3alXBln1WJrq5rZ/FTseSD7UROJDeWb662fWWwqF2J7dW2ZIXxpgpcqjd
         zdbgIOIwB/Kn1wBqBABJmUQTFwpX166/CjMb3JLqv4+34fm0ShLlX3lMYcojgCbZp7zC
         sYwTMPPcqr2oTbeBYZijo0r3vurGYc9YgNtPQSmksWqxxceBI4+ODHnYRLa1fesME5Un
         ZIHMkeflFqdlQGkuFR3wg0RYGFZPJxEDdxGYoBNMBw5LEHp1/+NcBgTKo0BCYLKTMaxF
         BB8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+tX+tSWqrqfKGbOTZFpi65+Rb/F0bC4ddpqsmevyBtA=;
        b=6GuYm+cr0VjINzrXziKkHqGNxEDi0/yoWfmKh9PYlV4DXx+0Az0sYZh8glmpKEuu6q
         aivpXA6wi7bhoOvsiXq0sFcVlQZPpurX5ntjLBkMe9LGFOuEpUIVnJh664uQp+wpiwJA
         NY63Yw/smWN1plsTcMT6e7ZxjxNfsvvm7ccP5FdYg5ajo7i9nTNh5N14FDCMaPRxBFWu
         awlEuGqAkmIuecLTbrBUFl7sNGghY9JmfbzC5GK416kY4VlwJUKB/48BL1LLPNILoQwV
         IRtWtoairSh3Pw2IAnW69O5ImoSzIIPoBw7xnygCuNDinX/zxkYfjXJXND2xUd7z06uX
         zVgw==
X-Gm-Message-State: AOAM533MGvg6+/fG3daFuKPW/GXwIYdb26+xsPRsXrEx6050zDtrD2G6
	IMLwYd3oV5q2p/MZUEesOE3EP9JiI8BGzw==
X-Google-Smtp-Source: ABdhPJwP2tEIGefXVF7kAwJkhJECjpul16GHEZsooTWUZILyBaib3+HGtaOmunsjYHkpxP06oiBG2w==
X-Received: by 2002:a05:600c:19ca:: with SMTP id u10mr12573608wmq.167.1632341135138;
        Wed, 22 Sep 2021 13:05:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 11/47] staging: r8188eu: remove rtw_get_timestampe_from_ie()
Date: Wed, 22 Sep 2021 22:03:44 +0200
Message-Id: <20210922200420.9693-12-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_get_timestampe_from_ie() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c    | 5 -----
 drivers/staging/r8188eu/include/rtw_mlme.h | 1 -
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index fb5952d5f1e4..456933475c16 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -290,11 +290,6 @@ u16 rtw_get_capability(struct wlan_bssid_ex *bss)
 	return le16_to_cpu(val);
 }
 
-u8 *rtw_get_timestampe_from_ie(u8 *ie)
-{
-	return ie + 0;
-}
-
 u8 *rtw_get_beacon_interval_from_ie(u8 *ie)
 {
 	return ie + 8;
diff --git a/drivers/staging/r8188eu/include/rtw_mlme.h b/drivers/staging/r8188eu/include/rtw_mlme.h
index e0fec3ac55de..9dc9f9b94850 100644
--- a/drivers/staging/r8188eu/include/rtw_mlme.h
+++ b/drivers/staging/r8188eu/include/rtw_mlme.h
@@ -598,7 +598,6 @@ void _rtw_free_network_queue(struct adapter *padapter, u8 isfreeall);
 int rtw_if_up(struct adapter *padapter);
 
 u8 *rtw_get_capability_from_ie(u8 *ie);
-u8 *rtw_get_timestampe_from_ie(u8 *ie);
 u8 *rtw_get_beacon_interval_from_ie(u8 *ie);
 
 void rtw_joinbss_reset(struct adapter *padapter);
-- 
2.33.0

