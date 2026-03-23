Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B633B27CC
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278534; cv=none; b=e8/csnCHcYul3ydznDBQQebdqHt9vNNy6ZMJc1Cz+lgEvZeTSzi/LGxOYSRrFYbpF4yPG9ipLJxQmyEzAXc6bICGdy3RkbB2GSiiFmhKxaR8NVt9wuwPmnsl/E1fGBLbZOAuxxs/fthYGSJ9L6SFdVfuRWbMf9YeCLQ6MCvHxW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278534; c=relaxed/simple;
	bh=7EB3PZFxFOOVjFJcLB73Utpw4FfrX+75x5bNmbgOtRI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ayF8eoCMgD66PpmRCGp7wzUe+F6zLB73EX3beY0my48te7eNNbHtGHTk4jjgSl1gJY5vvfQt6Wee0EWTyyaH479qIlKprvkpk7P0ZZOZQaCnP/UkVhX0mej2dp6jBxI0Yul/eyAbJlfmw5qEao7co7SRSfz591FRfcJ+SU7hwgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L4CnymLg; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L4CnymLg"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-79a7109f568so26144547b3.1
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278532; x=1774883332; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XRk6NtXR4+eSwt+9G0oczGM1jp8Qzua1m8bN82VET/8=;
        b=L4CnymLg/75kCHXwM8beBgVysUWDiSN06S9osITUVgDTceqz71UaJPWR+T9x5KzkUG
         tzjo/695t6ectS7nE3fxph04R0Delxtfl0OvRzN6Ytcs2PNEmp8e4JFmwrh+6eJWujhy
         gOWgWPU9CfIEbBcPB2SE55iHkCW9aC2QEPlJv3J1PUDuWHpwRGRJz0QgglkvFzs9WXAy
         DhEbNHDQU3arAe3Q0JNJMk4ypv7BdTVR0DYg8Rn3Sie+0fYQuC7Bq27ZxswlNXhs8WZG
         yKupWPSjUE+gc8539XDuriG1v9gBI2CXGkdwFPKe9pa8rs411WobEMBwC9DomWw3wuDm
         Xzzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278532; x=1774883332;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XRk6NtXR4+eSwt+9G0oczGM1jp8Qzua1m8bN82VET/8=;
        b=ijkdJTL5+RpktWj+gkJaPbDBTbJ5J4KyFKP4C8u1zG5GbTYM7Q3yINZvNa1Cug/dXI
         5RRNH3NfIsNpdxN7wTtpi2ihQorBNBE2eGHI3/hF0qdTOhDtvxGUF6cMh5TMzuFQaxZ9
         odBqK/7BpdCyYIObktaLFD9LRmdj/x5uwOjjxRIyEaplGfa94WfkAZCt9HY4/Rw8YH+x
         AJ0eAcQHH+2STuHuQYV7TDegDSRFxgV4wz8fAukjxoztzDRBljYCVeRO2fSe3L+g9rFp
         0a8/oIQRCmE9IYqovLBK+I3jizfpNfBJfKnTmhLmrDWJjgsxm7ALdR+irlu6gAmTFBpo
         S5Mg==
X-Gm-Message-State: AOJu0YwdVgjKeeSRUa7Ipicl+1uN+0Kwy6bflZxA+gbuWdFvMwwmQ7UT
	eOhqbYMQLsoRKbnl3mUkt2m3fFpArqMCWC2WcmBJYG1ebCt5sHMU3hY4
X-Gm-Gg: ATEYQzxxBLE4VwIKQ3fpaN6qfeCTaQ3C3nxwNndPjYG80w8bSdewHKDgoSEPABdSqMF
	7O/o5SIjcEXwIsvvQkhI66roR5rLjzQ8vxD/3viWD6bQSmVpMSLH4jv/yWOj+ufcwm0EN0zJeUF
	bf9K+eSZFy82WmyqzxLC8P/sseW9woGNAAkzk7I7d8ETsvRlI9Or6kiXSzG/HPnVOk3LbM7gcS2
	7FR9/xZhs/tP6WMRcFCvyrIOUsZO/sRLMvoq7Bd3bxwWgugf4+OB1pOUBZ2m+Scih2HFGtdsVkY
	MV61qHILqt1hfwZSiM8fvyUNM4JZGZQe8DHgDERRFbyseVg9jdcVAMYsxGfm5mKtpxuOPm0VpkG
	q4BtxfSbsLzD+ekEZsAaCTerkbqvvvJWgMVkV8W/d8e9Azi9zWoagbNjDZGa6dZrsBHuv0vAsqC
	mVixtWBj7U/psNvXEyIi8pWQ==
X-Received: by 2002:a05:690c:ed5:b0:79a:b9a5:9e81 with SMTP id 00721157ae682-79ab9a5a5a5mr24504877b3.15.1774278531883;
        Mon, 23 Mar 2026 08:08:51 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:51 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 4/6] staging: rtl8723bs: remove custom is_zero_mac_addr() function
Date: Mon, 23 Mar 2026 18:06:06 +0300
Message-ID: <20260323150650.7168-5-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323150650.7168-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260323150650.7168-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the custom function is_zero_mac_addr() and replace all calls to it
with the default kernel function is_zero_ether_addr() to avoid
duplicating existing code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 2 +-
 drivers/staging/rtl8723bs/core/rtw_mlme.c      | 2 +-
 drivers/staging/rtl8723bs/include/ieee80211.h  | 6 ------
 3 files changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index eb4a32a998ae..c20a143ace4b 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -11,7 +11,7 @@ u8 rtw_validate_bssid(u8 *bssid)
 {
 	u8 ret = true;
 
-	if (is_zero_mac_addr(bssid) ||
+	if (is_zero_ether_addr(bssid) ||
 	    is_broadcast_mac_addr(bssid) ||
 	    is_multicast_mac_addr(bssid))
 		ret = false;
diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 5516593bc8ab..43c2c3afa81e 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1694,7 +1694,7 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 		goto exit;
 
 	/* got specific addr to roam */
-	if (!is_zero_mac_addr(mlme->roam_tgt_addr)) {
+	if (!is_zero_ether_addr(mlme->roam_tgt_addr)) {
 		if (!memcmp(mlme->roam_tgt_addr, competitor->network.mac_address, ETH_ALEN))
 			goto update;
 		else
diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 14c806a22b38..37b9b363c073 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -518,12 +518,6 @@ static inline int is_broadcast_mac_addr(const u8 *addr)
 		(addr[3] == 0xff) && (addr[4] == 0xff) && (addr[5] == 0xff));
 }
 
-static inline int is_zero_mac_addr(const u8 *addr)
-{
-	return ((addr[0] == 0x00) && (addr[1] == 0x00) && (addr[2] == 0x00) &&   \
-		(addr[3] == 0x00) && (addr[4] == 0x00) && (addr[5] == 0x00));
-}
-
 #define CFG_IEEE80211_RESERVE_FCS (1<<0)
 #define CFG_IEEE80211_COMPUTE_FCS (1<<1)
 
-- 
2.53.0

