Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 938026D17
	for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 09:59:36 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id g138so11177539wmg.4
        for <linux-staging@lists.linux.dev>; Mon, 16 Aug 2021 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=APmtX1P3ja8v/x20+NMdJ4eHxArTdJiEa3lLPOVHS3M=;
        b=cWsutDqGU5kvkAFS/4yhpnZTJF3yrJhPFbzE7FtZ2YD4xqryIGrJAYcMdnldfIimFT
         sQ2wpTi1V38SkfKHUUqogu5GyTdpRzweZh7oeWl9g/DAqwGpvDQOrN95lim0p+WPspJU
         KAUZn1sNDc9D+pFyxpK9V6iMgHlt67PbPQ5jWVR0ie3EVJnnMRvr2jg+B2NHN6LemV9U
         TDmX4yaz86sdDx7BAnHM/D3D6C4ClcvoJmyfK9zldqw9wyez9FkwlPwXw44ujAdsUf6z
         +N9rBMmzcJv3PLPlWF4Vnqbg9+rx5SrhU1nnbnd/+WVXlWG6YDzGZ+NPgQLaxiwkVyNv
         dSKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=APmtX1P3ja8v/x20+NMdJ4eHxArTdJiEa3lLPOVHS3M=;
        b=T1ULzHbF5eZz/vbZNg7Y7nar/1iAQR15jHUxPdSxXT0bbzRCDddMiVownNuhXyAxA6
         pn0ffj2Xu/vZmkY1vk8Dj/Q0lfc2IDmOwg0IwA8wBJBZ62EWRZF1UWj5KJxhesXOBm7r
         lZUUFJedAhWy5+QBjBxxkrSVA+FH5KHVSyvl39dcsxuibex20lSs8XcVaOd/2Oof5KOj
         dBuXYtfL7654xikYHHOzcyciUA6AfSKQrlsQJBzlmIvflFDe42SFXq1CoOPYFc4tc+NO
         Pbg5r3YmFdmJ8y+xkeX74K6mQJ0eQNlvJPZTychRlIdLqUMDq01Zo71h1q9XZOwhiaDP
         nenQ==
X-Gm-Message-State: AOAM533lXiXuliIyXPD02pGBMFBrHmDs9MPCy2bmBTcJtbKJVlWpdNvK
	jUc8CMN4gd7xfU1664cwcChNRSAgXNk=
X-Google-Smtp-Source: ABdhPJwyigbcGOn5B1d77aO/3zYxJYOCbQ9sBEAyfnMDcfh66z01g7dBH8iDqYOhaDi9GJUZY32CZA==
X-Received: by 2002:a7b:c5d2:: with SMTP id n18mr14574569wmk.97.1629107975044;
        Mon, 16 Aug 2021 02:59:35 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::4058])
        by smtp.gmail.com with ESMTPSA id g21sm1946635wmk.8.2021.08.16.02.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Aug 2021 02:59:34 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 3/4] staging: r8188eu: refactor rtw_is_cckratesonly_included()
Date: Mon, 16 Aug 2021 11:58:39 +0200
Message-Id: <20210816095840.24259-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210816095840.24259-1-straube.linux@gmail.com>
References: <20210816095840.24259-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor function rtw_is_cckratesonly_included(). Improves readability
and slightly reduces object file size.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_ieee80211.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_ieee80211.c b/drivers/staging/r8188eu/core/rtw_ieee80211.c
index c8627ad83006..200c90b8ea51 100644
--- a/drivers/staging/r8188eu/core/rtw_ieee80211.c
+++ b/drivers/staging/r8188eu/core/rtw_ieee80211.c
@@ -82,15 +82,13 @@ bool rtw_is_cckrates_included(u8 *rate)
 
 uint	rtw_is_cckratesonly_included(u8 *rate)
 {
-	u32 i = 0;
+	while (*rate) {
+		u8 r = *rate & 0x7f;
 
-	while (rate[i] != 0) {
-		if  ((((rate[i]) & 0x7f) != 2) && (((rate[i]) & 0x7f) != 4) &&
-		     (((rate[i]) & 0x7f) != 11)  && (((rate[i]) & 0x7f) != 22))
+		if (r != 2 && r != 4 && r != 11 && r != 22)
 			return false;
-		i++;
+		rate++;
 	}
-
 	return true;
 }
 
-- 
2.32.0

