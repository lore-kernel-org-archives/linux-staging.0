Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF737263F44
	for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 09:56:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787046981; cv=none; b=Zj58I97KNFj30OFpRBaD73Cr4o36d/vtpcnEcXYaprvxa9ru9Bfhrc+xufPIrLkXXRys6LnXsQcjER8NS+kyAIxwZnb00mfS2TMeS3jmMUIr96b89lbBydmdH81jW3Cv2OjTAt5b/OvVBILu0YDhjMWnTxH904b/PiESrvIrw3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787046981; c=relaxed/simple;
	bh=Idl2H9MkBTY4cPiJmoVKjWFQWTntt995XDquH+MYN2M=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=j7OTfx5/e44hj0fVy0w3XxJK85zhwZ+TupU626I62q8yTNgzUlYu/nC7SWHBibnGPwrbJoo0OArL6mMdAgSRCLHjSeTGRRRqfHunMBvZW5TMeriOyS8NBnv3nFTJI0C6I+VMGy3GYrvAudocwHAr3n++3Lscrguuh0qwKkMxQQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEiOYjY9; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEiOYjY9"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so55755765ad.1
        for <linux-staging@lists.linux.dev>; Tue, 18 Aug 2026 02:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787046979; x=1787651779; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lrDhPkcegELEVtqOdzCVdMJZ0V+FN0J4cNM1n2gntOQ=;
        b=GEiOYjY9tHob0UC5uRS3ru0RNiBblBEJ62nQnjnJIEMcZkIz7Y4hu0bEnzczXtPCg3
         DGlDiK6qgqaRQsVZpXZkEoCYIunsEkU2lsg9rH056n9n+N5TOlbgxyeT3XYVRBvt97HA
         FI0KTOUIjdSxdJLCKBl3jIIkW1nFxFwlsutzL2bVhXjMJqYpPCEYgFLh84vKQUKTnW9/
         oKHGdKad5K/vWBnmbuha6m0oUm/Pk4oOhj7y2Cl75gk5lu5jpiLsuPlt6zIojn7VUM93
         bmYOzs9Kp1BDDbii5t0FYRV/g5DH/V53jUEEYuI6hlbvpFj1xyeR8GjPza+INccOcWlS
         mGWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787046979; x=1787651779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lrDhPkcegELEVtqOdzCVdMJZ0V+FN0J4cNM1n2gntOQ=;
        b=f9VAreJIiw0h1aNyK997NBtCxRR5+nKbTLI5PW0bw6GFNTNQsVlwA/L2/EMR2vR6l0
         aQsOMmQ7zz7R+GCoiUwouzdnrJIPjNf03WTqwd4NuD88HG+Z7yjgsaC+zgyRmSB5t6NC
         t5ObflffElE+7Jwn8jvLpiTBQdyUGogp9VxF8daczsOtcuXzfPy7ADiBYUBt+udMrDok
         ORMuMDZa14yUM4fKvUkPYhe8MCEAe4EE437sPDVYQEHcNh56UAkQllS8LT6cROZ60Dok
         vJhryOz+0vHioK3ZzyrLkU4Enq/LMN1UiRy/gyOViyijfop+LJi8R1ivcox6sydel3pb
         a5ew==
X-Gm-Message-State: AOJu0YxTB3h2yDC4gADhSDIgJNAMNDv1gopfOttf7+PdrDziLRo65INk
	n4cg2nTBdTbo56LPOouJj6Zt7qDOuZbD+1pq3jXUwA6Mw+BQuLe2HPuW2UTsdg==
X-Gm-Gg: AR+sD11NpEM4xSW14YwtuK3dnCYR1TwDdYtMRkaOvefW6k1J/6PGYUU8oby3NIQ5yjM
	Bnm3Dmxg0OZRUdNhSk/JCiGg/upQSeEb3+BKKwsVOQlfd2ihDxG8kw06hKm/3yh0LRIkMzwwl8N
	Gb8D0btXp6JLezVZM/GqWRXacZyVBSLF/dwFDsKxwgJKI0O2AmI5XVwepM1uP4aGtn+HYboWP5r
	k2Bv5nOpw6ueE3QgC0GIoG2F8to5vyXDjza+16SCi+PqvrtERSPGmYrs9HQ6obZXTOmMhcDnwsw
	HO4jNnXfvyH+awwjdUDvzx55NuguDXyCY6ZT/6hD2OA9kSzJ4hIsFkJRJqyJmTmOPdboVbZYeMx
	kjOhZrENvyTOSVd3CXPPHzevNVp8+VC3wdn3JYBwE5+lFTM4CPUm8PqZvlzo3jllntF1qgeFkHf
	iziOPX2je64jFycrUcoPmhmQZee2LpbpClPfb4fUtthv73pdwiFDgdt9l+wIczlt5ZXzzjatpsD
	Jj2qtnBWrLJxeIZ9Rmn0ccK3rY=
X-Received: by 2002:a17:90b:48c1:b0:38e:2517:5d1f with SMTP id 98e67ed59e1d1-3933b792c20mr37888076a91.9.1787046979310;
        Tue, 18 Aug 2026 02:56:19 -0700 (PDT)
Received: from amd.ban-spse ([165.204.217.251])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1415305a0afsm22096004c88.4.2026.08.18.02.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 02:56:18 -0700 (PDT)
From: Malathi A <malathi.a2000@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Malathi A <malathi.a2000@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: remove unusual 'NDIS_802_11_RATES_EX' type
Date: Tue, 18 Aug 2026 09:55:35 +0000
Message-ID: <20260818095535.1230025-2-malathi.a2000@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260818095535.1230025-1-malathi.a2000@gmail.com>
References: <20260818095535.1230025-1-malathi.a2000@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the 'NDIS_802_11_RATES_EX' type and replace the variables of this
type with an array of 'u8', which makes the code more understandable and
gets rid of an unnecessary 'typedef'.

'u8' and the 'unsigned char' the typedef expanded to are the same type and
the array length is unchanged, so there is no functional change. Also
update the comment in wlan_bssdef.h that referred to the removed type.

Signed-off-by: Malathi A <malathi.a2000@gmail.com>
---
v2:
 - Rebase onto staging-next. v1 was based on Linus' tree and did not
   apply, as staging-next already reworks wlan_bssdef.h.
 - Use my full name in From: and Signed-off-by:.
---
 drivers/staging/rtl8723bs/include/rtw_mlme_ext.h | 2 +-
 drivers/staging/rtl8723bs/include/wlan_bssdef.h  | 6 ++----
 2 files changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 179fae4d8fcc..deeaa9e46086 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -253,7 +253,7 @@ struct FW_Sta_Info {
 	u32 status;
 	u32 rx_pkt;
 	u32 retry;
-	NDIS_802_11_RATES_EX  SupportedRates;
+	u8  SupportedRates[NDIS_802_11_LENGTH_RATES_EX];
 };
 
 /*
diff --git a/drivers/staging/rtl8723bs/include/wlan_bssdef.h b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
index ff2cee2f3b99..9137057726ef 100644
--- a/drivers/staging/rtl8723bs/include/wlan_bssdef.h
+++ b/drivers/staging/rtl8723bs/include/wlan_bssdef.h
@@ -14,8 +14,6 @@
 #define NDIS_802_11_LENGTH_SSID         32
 #define NDIS_802_11_LENGTH_RATES_EX     16
 
-typedef unsigned char   NDIS_802_11_RATES_EX[NDIS_802_11_LENGTH_RATES_EX];  /*  Set of 16 data rates */
-
 struct ndis_802_11_ssid {
 	u32 ssid_length;
 	u8 ssid[32];
@@ -48,7 +46,7 @@ struct ndis_80211_var_ie {
  * ETH_ALEN + 2 +
  * sizeof (struct ndis_802_11_ssid) + sizeof (u32) +
  * sizeof (long) +
- * sizeof (struct ndis_802_11_conf) + sizeof (NDIS_802_11_RATES_EX) + ie_length
+ * sizeof (struct ndis_802_11_conf) + NDIS_802_11_LENGTH_RATES_EX + ie_length
  *
  * Except for ie_length, all other fields are fixed length. Therefore, we can
  * define a macro to present the partial sum.
@@ -140,7 +138,7 @@ struct wlan_bssid_ex {
 	long rssi;/* in dBM, raw data , get from PHY) */
 	struct ndis_802_11_conf configuration;
 	enum nl80211_iftype infrastructure_mode;
-	NDIS_802_11_RATES_EX supported_rates;
+	u8 supported_rates[NDIS_802_11_LENGTH_RATES_EX];
 	struct wlan_phy_info phy_info;
 	u32 ie_length;
 	u8 ies[MAX_IE_SZ];	/* timestamp, beacon interval, and capability information) */
-- 
2.43.0

