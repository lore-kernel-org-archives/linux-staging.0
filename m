Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B3871
	for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 12:30:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id i94so23426543wri.4
        for <linux-staging@lists.linux.dev>; Tue, 22 Jun 2021 05:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NzFrqHGl0cYS27Ypm4XF1HD4hXM1cpi1KCAV815SAkE=;
        b=rWf1PgkIwW2d1mw2Y8MaIRSkO1MvPeeeSK0nX+NDlNPZj6LTv6at6z3hqi00tbgSzC
         SExs778Ar1nGZbaZPyuhSV0BCTraDAJtc55UqJwETLm0wKK+/9/HjWPv+C5ORY2B1rzA
         sVSk4Hwe+sQO+SfsxV88maJPQsVe63FrQ11y4hSQIRqOcUV1qlFJPPpHK80VBN9r+0MT
         8Aih8r9+foSLEfD0HiFPfu7BLolc+mCHc72SRK699juj0r6NIvd2dokSJRdliK5gzVhp
         ZdN14FDTLLLLzFwzk2RDeL6Oc/ScUu946+gWtzdLUDmom+IKCuwh63Al2aKCJBZp6MHN
         KrPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NzFrqHGl0cYS27Ypm4XF1HD4hXM1cpi1KCAV815SAkE=;
        b=qq07j0mT2qHznN3dvHnPMtJN6t8O6MzmiVV6xMg3NhPXFH4iKHTettWC9C7elp2r3G
         aCe7oxFnWnasmp7+6j/tHUqrqI9a2PielKGmHnyZwxAw4LixU3uZBQm59QpH7XPmZyvq
         FFeMwzI4dF/xrGB+BfWdm16cPQgc0nPoCQbcbEud7Zjn2o562QcfTW6LD/fw2mTE8Kc/
         uL+u9B5OEt8ey2Ux7+g3CPn0bpp/3y1ChyxZ/H5k1qFOGno+AZJ9xFeD7K9iODMK5ysI
         89NfL/aj8AnRx9Ix8BDVxrEnGrrYIL6LYVmwFuWGl6cBsZzjfPqP5SbS1YhaJL2d2Y4a
         8raw==
X-Gm-Message-State: AOAM5333z29QwYFD+J6zz1mJBStb2xod2AmEJwD26iiRga8EqflPp6sz
	fopM5g8iG3rcBkeoee90SVA=
X-Google-Smtp-Source: ABdhPJxR2iNkaOgY2c+VioOQiZFd57iTiWefau8tUV4SF4MMar0qojvxbwFVxXgTTHJuVdf4vxxOeg==
X-Received: by 2002:a5d:5907:: with SMTP id v7mr4536429wrd.342.1624365006485;
        Tue, 22 Jun 2021 05:30:06 -0700 (PDT)
Received: from agape ([5.171.73.108])
        by smtp.gmail.com with ESMTPSA id z6sm16794608wrh.65.2021.06.22.05.30.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Jun 2021 05:30:06 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 15/17] staging: rtl8723bs: remove obsolete 5Ghz comments
Date: Tue, 22 Jun 2021 14:29:40 +0200
Message-Id: <4d7fb487902f6c60db751b58642ffa48d3f2d74e.1624364582.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1624364582.git.fabioaiuto83@gmail.com>
References: <cover.1624364582.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove obsolete 5Ghz comments.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 2 --
 drivers/staging/rtl8723bs/os_dep/wifi_regd.c      | 4 ----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index 8514cfb3d7e0..427f0b88abd7 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -202,8 +202,6 @@ rtw_cfg80211_default_mgmt_stypes[NUM_NL80211_IFTYPES] = {
 
 static int rtw_ieee80211_channel_to_frequency(int chan, int band)
 {
-	/* see 802.11 17.3.8.3.2 and Annex J
-	* there are overlapping channel numbers in 5GHz and 2GHz bands */
 	if (band == NL80211_BAND_2GHZ) {
 		if (chan == 14)
 			return 2484;
diff --git a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
index 0084589499b9..5eef1d68c6f0 100644
--- a/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
+++ b/drivers/staging/rtl8723bs/os_dep/wifi_regd.c
@@ -44,10 +44,6 @@ static const struct ieee80211_regdomain rtw_regdom_rd = {
 
 static int rtw_ieee80211_channel_to_frequency(int chan, int band)
 {
-	/* see 802.11 17.3.8.3.2 and Annex J
-	 * there are overlapping channel numbers in 5GHz and 2GHz bands
-	 */
-
 	/* NL80211_BAND_2GHZ */
 	if (chan == 14)
 		return 2484;
-- 
2.20.1

