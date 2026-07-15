Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A54303368B7
	for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 12:49:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784119779; cv=none; b=rUZA4PUxeHN66keruuL4lVzvKh1w/3VHQGxcNwGInXDlf4u0wGAtWGOocOGG5i5zgrCGa6eOJiTo1n5pn2VDfygJzzB6x2ikOZ5AZf3uNC7PZdBGXTEGJYUzIvFefSm/R8cVAATa9RMpusQw3yG2J18+b19kX/8bIhn+ShysCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784119779; c=relaxed/simple;
	bh=/LJKCIO04dSaGL7p4czn4Eo/pq61LGxuabz70pZKyow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bavi03hWkIi+PdnLJdkriIe1221BLF7HN+nIyHodFY2odoQ8h5nZGjFR6CjnD+uWfgo+rzzrMUheShG7+WCWXUHM3St9BMHMLT0vCUJxeU7n5gBx9fkRTrooJ7W5+WGePslJ4MjIYfzuruFw+xZb7ktZuBBAzqZNyrTu5c0RLxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBDM588G; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBDM588G"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so5626377e87.3
        for <linux-staging@lists.linux.dev>; Wed, 15 Jul 2026 05:49:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784119776; x=1784724576; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YUQCIbej7stm8aLt6hPSaaqQwT1L5yVkeI52z1hhfUw=;
        b=HBDM588GwseGjeJ84z0hHR9UZJTVsuG83mDpxec1mxC9TUNVg22FuMY+OtYgOinNtG
         WuKttYK+AwkgRL0vwjN/auTiVqWgYh++U/D4q2rwI0Nnpu814sD958tqNJ7zxv49yqwo
         j4AF/kl40XDPxZP+TzP5vvJR48Le49DNgC/58u+6ZDnvrXcJSfUcynw4jmwPjstRBINn
         ncku4uCg1vxG2DmAP+JfaOaE8otSHrMmABywyW4P7ksY9nPj1nBmWPM/mfFZMGAXbGS8
         weVH+dAxGwzdNu3zynOYADTr6ZyHOPtgkmpQPBe5iuVzWeB6cpHUbhlKpGPMx4lVcq5l
         v4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784119776; x=1784724576;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YUQCIbej7stm8aLt6hPSaaqQwT1L5yVkeI52z1hhfUw=;
        b=NQorlUNsxqHuJ9dVYidb/iqDmBpZLR7WVH/nhSV7xzBJewwP/b2XCNaHfVsWLfj+kq
         wlX7HVJXFklcactzXtajGTEhwC4NPmOTlqsOA84mTj2gPrWdAUqES3njabDF34Qz77Lz
         pqFWAfbgy7oT0Up9K4lC+UcpRFPzoZ0BZWRADgI+p7gtNKwAfcnDSqMkJ1B46489piSY
         tDKgNqnXo1AWGclIZQ8jSsX0KDQgg8hdvfzd+HgD1BsDU0xDzhWRJVThZK+eTifgOIqg
         KuHL1JWYbHiJv/lg4zzgyueHxDM2IPtqPAU4AZk/y6jBH1bYbLTv6/F28QuzFIS1BjRs
         L8PA==
X-Gm-Message-State: AOJu0YxaLPnBf31Nqla30L7vMURfNDL9yKbI7IJnQzrUv7QBw3zopYQw
	afj1In74pb3PXwUMRJxZE5iK8/XZM/+nX3YRQ2Gll/vkx8HNaebudEjo
X-Gm-Gg: AfdE7cmlnl4cSjw1Zt1Il1R2IxLSZG6UUDT8lddXU4lZUj+Ob4LGQDwBhhILCtGo5n6
	D6kG0mE0mum/I0330w1g/hCJhbi5eFT5zgemqA52RkqITPY/kA9os8RFfuN8XbipekXAsNgQBIf
	zHo8wNTv2N+khBIoiGvzBO0fucJ12zE/N2CWhy7IEi56l25kY6pZIiINyEAeMLKrNXLrm3Nkep9
	W/6Fkf7lxP9BFXKEaIElebhuThqEtHOMLPPO04BsEEpQpPEYxVpSM9TDf321D0TYTSryiVc65H/
	LgD7MIyxKQ3RqugcrVVl7w8dJ4N35cotziOd6lzqxrbM5+hEe0vV7euvqUSnGGjvPKEsABqSVsA
	QCc5jfRRLbD0EKrl3GYu13wqT7LXChx7/u+sj+XbdhwXfQUT4A6w7GU+xDK24zZxvDJHAZVHenJ
	OjhUlxmkvVD0OoFW9N5d040ptoa/IHnrBR1xTeDaHcJf8IMhIDzypuoPNCqAWAchJ7LCiQFGpG9
	Cpv7QHLaJE4Yw==
X-Received: by 2002:a05:6512:3410:b0:5b0:177f:beab with SMTP id 2adb3069b0e04-5b15d7b2cc0mr694248e87.44.1784119775452;
        Wed, 15 Jul 2026 05:49:35 -0700 (PDT)
Received: from archlinux ([94.180.44.28])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b022fac999sm3404042e87.55.2026.07.15.05.49.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 05:49:35 -0700 (PDT)
From: Arsenii Pashchenko <ulijg308@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ulijg308@gmail.com
Subject: [PATCH 02/61] staging: rtl8723bs: replace is_same_ess with rtw_ssid_differ
Date: Wed, 15 Jul 2026 19:47:30 +0700
Message-ID: <20260715124829.90290-3-ulijg308@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260715124829.90290-1-ulijg308@gmail.com>
References: <20260715124829.90290-1-ulijg308@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The helper function is_same_ess() is only used in an inverted context
to check if SSIDs are different. Flip the logic by introducing a new
static inline helper rtw_ssid_differ() that returns true when SSIDs
do not match.

This eliminates the need for the logical negation operator '!' at call
sites, improves code readability, and optimizes the check to
short-circuit early if the SSID lengths are not equal. While at it,
switch the return type to bool, use the proper 'rtw_' prefix.

Signed-off-by: Arsenii Pashchenko <ulijg308@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 1196ec011..b1a268728 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -340,10 +340,12 @@ bool rtw_is_same_ibss(struct adapter *adapter, struct wlan_network *pnetwork)
 	return true;
 }
 
-inline int is_same_ess(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
+static inline bool rtw_ssid_differ(struct wlan_bssid_ex *a, struct wlan_bssid_ex *b)
 {
-	return (a->ssid.ssid_length == b->ssid.ssid_length)
-		&&  !memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length);
+	if (a->ssid.ssid_length != b->ssid.ssid_length)
+		return true;
+
+	return memcmp(a->ssid.ssid, b->ssid.ssid, a->ssid.ssid_length) != 0;
 }
 
 int is_same_network(struct wlan_bssid_ex *src, struct wlan_bssid_ex *dst, u8 feature)
@@ -1673,7 +1675,7 @@ static int rtw_check_roaming_candidate(struct mlme_priv *mlme
 	int updated = false;
 	struct adapter *adapter = container_of(mlme, struct adapter, mlmepriv);
 
-	if (!is_same_ess(&competitor->network, &mlme->cur_network.network))
+	if (rtw_ssid_differ(&competitor->network, &mlme->cur_network.network))
 		goto exit;
 
 	if (!rtw_is_desired_network(adapter, competitor))
@@ -1774,7 +1776,7 @@ static int rtw_check_join_candidate(struct mlme_priv *mlme
 	if (rtw_to_roam(adapter) > 0) {
 		if (jiffies_to_msecs(jiffies - competitor->last_scanned) >=
 		    mlme->roam_scanr_exp_ms ||
-		    !is_same_ess(&competitor->network, &mlme->cur_network.network))
+		    rtw_ssid_differ(&competitor->network, &mlme->cur_network.network))
 			goto exit;
 	}
 
-- 
2.55.0

