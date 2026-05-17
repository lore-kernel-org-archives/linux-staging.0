Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE66A171CD
	for <linux-staging@lists.linux.dev>; Sun, 17 May 2026 00:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778976627; cv=none; b=Q4zqROtyXxXlBzO5oWRwV3yIPl8oww+GUvhY9MVawfGPpXftkQyeVljkeSEAyGAbkZRnS13tCoe0ZcKZ76dqtT0RSaMK3JHK3RVWprE8a8hWULyDdpfS4SKsUVsGssc4QZPhvYdHc/dkE+ZdM3ZwGU3nWln65qYZYwUTsSrq4Uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778976627; c=relaxed/simple;
	bh=so3l/ZXwqA9gRedDQzmArQtRoCB2PyKRYxhFD2oE+PU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=heD9yaYHe1m5k6AkM4v76Ufb0nbC8ACJVQutWw8gLlYIqN/3f09JQ4hJ7ylYStuU8daXN0MU9A3IljJugwzpU6XPjtnkZTRd1ooQEzV1jedkzECIMa8NZS+4TxpY09H4X3n7SkO0mqxF/WkNgIB+cyoBb+6khsUSN40xjNnra2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cc+kOHEi; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cc+kOHEi"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1332772f6b3so1118787c88.1
        for <linux-staging@lists.linux.dev>; Sat, 16 May 2026 17:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778976624; x=1779581424; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NYjB5ItjJwBA2QnUgQXobdHdVXxofi1geMOXI862b0Q=;
        b=Cc+kOHEiQtRrPfD/lFnIGpilCy/IE1RfWRCNM7I6llou/vsftnJ7F9elDJ9rf0STLb
         7dk99f1WSHODcNh61kqNw6PPLIHgzKhL4YN3lZ40eoM3VfD97SdHzvDwpQW9BYg0WEdU
         5zenng0KhThOZtT01Ar1aDrehl8+WfS1aJmSs0cZ76e5ATYTeG/Jol6TULZy85EYNoyG
         PjTy0A2JgcqcJOsJyS/NosBSCTz3SBcCr5hkqPOkSfvZ9VD5pQWUdR35aRLSgDM68BEu
         QiFBmwa5zz1JjnK5JFdceB6XQfQ4CCKXogDwq7pLwJ2VUojU3VCxWUrxMuLZYATplJR2
         a1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778976624; x=1779581424;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NYjB5ItjJwBA2QnUgQXobdHdVXxofi1geMOXI862b0Q=;
        b=gu3UNttOUBKC68kjIu3XPMUgUQVObXrKKNKcy8ajkFlicLFVmpAQqD+zKZqVpfmA8q
         xBWG6lUXJ1mE11CknWPQ2+D9zXECU34I2C4RqQlbNmHlB3oQZjWCV5+sDClv0eLg9x7B
         dGFrgr0vqx2iLQN6e5yjwWDg3odK8wsnAuVkMSGOX5S+Q8NF4AND/mlLEl4bufE/koQk
         Zf9urX7hOlAUctZlfZ8+cxhXANT4HUyTijv6yNlZ/DD0ZKtAxNUxhoKeJevvMk0V/ll3
         8iRFWSpKrnbE3JTul6zOyboL3hGz9JXglAWAse7obCGk7rtzihuTS64zby/7w+EpknBq
         VFLw==
X-Forwarded-Encrypted: i=1; AFNElJ8raEv8bDwfFlb0qf3IZV8tkk/CrmVxaNpFhR56OvdqzpxRUd11knMBlxXMjbh/1yG6PL48nqXIUtl+QNUr@lists.linux.dev
X-Gm-Message-State: AOJu0YwkuK8SF08TW22LfvGNixKc93K65V3+xPsIJ9cgbE1uqHQnQZSf
	u1Thy9JSpSzPUWH4T++LGUOBC0jKsiUXDRetzdF2ey3R5vtyEq1vhvMdyPby/D7bjRE=
X-Gm-Gg: Acq92OGn42iqdG8aA+weuAnD0Qmg7zPm0/dQ1GB6K/N+JdhpcrjvKyDhnAPZ4NWJdZt
	NbWD1ZnCJUbBjdvD/UJ3tRuJLJrsC5rexE5JJVb1zHT2rthiLwG2PgljgXkUx73ggG3rYc7m7zm
	7yb9WeNdI9VjI8joyAuIb9ghrhrPKT2l03kwLYn+jVO8JgIWJf8n8Q9+8FMsb+FZssrtOrBtqWA
	7j+JeWkb3f1QJB/+7kiycYgUKucvqautfo5qKU8wrUihstXr1QY7uFP3Pi1cyeCvyR+Pk1bujec
	+dfjXuTNuzLuClk9hxDqEigs6u/2xA0vvJRH2kgpkm8vouUjGyNJc+Xdi5z/ZTBtgr/Jyp613xi
	pHmnqER9ERUg1B2X65ra8jlEQrNBRC1KIGjCyZP7jIIm2b2xFJtPSvq4Zj1V1RLU2n/7h4TV3ik
	vZfk4zjUS0QDtNwkl6/ALdOchiTIRN
X-Received: by 2002:a05:7022:689a:b0:135:26e2:9b73 with SMTP id a92af1059eb24-13526e29c4cmr3433024c88.5.1778976623873;
        Sat, 16 May 2026 17:10:23 -0700 (PDT)
Received: from localhost ([2601:644:8982:b70:a1cd:95fd:8cb3:63db])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm15692261c88.0.2026.05.16.17.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 17:10:23 -0700 (PDT)
Date: Sat, 16 May 2026 17:10:22 -0700
From: Subhang Mall <subhangmall.os@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: remove comparisons to true in
 ioctl_cfg80211.c
Message-ID: <agkHbiHcjT2mHIdl@subhangs-thinkpad>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

There were multiple checkpatch.pl warnings in
drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
relating to explicitly comparing a value to true;
comparing a boolean-like variable to true is
redundant.

Signed-off-by: Subhang Mall <subhangmall.os@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
index fd3bae31b0e..dc871076ca4 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_cfg80211.c
@@ -1033,7 +1033,7 @@ static int cfg80211_rtw_change_iface(struct wiphy *wiphy,
 	struct mlme_ext_priv *pmlmeext = &(padapter->mlmeextpriv);
 	int ret = 0;
 
-	if (adapter_to_dvobj(padapter)->processing_dev_remove == true) {
+	if (adapter_to_dvobj(padapter)->processing_dev_remove) {
 		ret = -EPERM;
 		goto exit;
 	}
@@ -1140,7 +1140,7 @@ void rtw_cfg80211_surveydone_event_callback(struct adapter *padapter)
 
 		/* report network only if the current channel set contains the channel to which this network belongs */
 		if (rtw_ch_set_search_ch(padapter->mlmeextpriv.channel_set, pnetwork->network.configuration.ds_config) >= 0
-			&& true == rtw_validate_ssid(&(pnetwork->network.ssid))) {
+			&& rtw_validate_ssid(&(pnetwork->network.ssid))) {
 			/* ev =translate_scan(padapter, a, pnetwork, ev, stop); */
 			rtw_cfg80211_inform_bss(padapter, pnetwork);
 		}
@@ -1634,7 +1634,7 @@ static int cfg80211_rtw_connect(struct wiphy *wiphy, struct net_device *ndev,
 
 	padapter->mlmepriv.not_indic_disco = true;
 
-	if (adapter_wdev_data(padapter)->block == true) {
+	if (adapter_wdev_data(padapter)->block) {
 		ret = -EBUSY;
 		goto exit;
 	}
-- 
2.54.0

