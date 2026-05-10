Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7830A28A72F
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 17:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778435563; cv=none; b=tcoi5AtcIZkiXNgPoVw/Hz6Rtt5YqibDJnDqHD//VYHUpvD0U0uCb0T1tBlmMn/l7cMoi7YJtxN0QXa01ehrr3tqiOoi3Las0PZMBBUJXzxCwIdpOii+kStTt1pGMMKHSR6FtNqiJzweYpLiz0KvHp/Vkt5TSsLNH/JNMjsCbVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778435563; c=relaxed/simple;
	bh=ntV4bbIZ7YyfVbHUH4iz/+HU+UBaUjJlGU6cCysgYXU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mLTgQ7/TU2aYMDshh+HWxWGZUodNysglqnTRljAG/keCzUPrgScYAcU7ugxV4zf/WbzI19XWAqbCeIlF4gNuDLNt0+W7mcV9cK23mv3zkPDPKLaB1CAImpYKTmH0W06qr/OyvDaieqkAFmIoxFSGktkOdNI6jKsv7c0rlarzqN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fIxo/Hs5; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fIxo/Hs5"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b9705613ddso21671525ad.1
        for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778435562; x=1779040362; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9HP4mHIWZaudzLmTmCsRDisT9DtTeZR5e/g4Q3kazt0=;
        b=fIxo/Hs5fsYTp0tpk+Fd/Mzfjo+hmkmFLOPvG78EAm+0oHwzs+RMeFgeyi+Rw1bvNO
         ockyvpzpVlj5KvGStS4gtinyGOzNkUuiC3Przl+mRYWXA55S2q3+VQuFYBZPYNmzutxQ
         bTqQ/nXcJy8Y+YZWsulgdDvjaxDs9wL4GGlaniBftKb4enLRS+iiwzQfjq4aoSej0XU/
         m6oZjXj7sZkJmuk6K5dfOFlyxnk6QpczXkBv3qCJ5vROTJZlIszMUUflQDldxGh1LHXZ
         bdPpIzKueKhNQWjh4eHuXKvVlZVEw+Gla3M5eaRQrAGyEXUb0w27PLesmJJdjfX5T2Hi
         vqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778435562; x=1779040362;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9HP4mHIWZaudzLmTmCsRDisT9DtTeZR5e/g4Q3kazt0=;
        b=m0K+zBzf3ta0vVCiXnkgCKYs2JujkV0Ih3e60fYjS8Hrt5v3iyWlYgSNDe1A5STS+D
         FaBVSi4T7SZL4hX6LrTdnUA3RSfCiloy89yltjR3nP4u2xf9QdS0jAAx3xaH526f3W2U
         C32Cnq7/ZMB1hqTWN8ygHevmLghhnhQ1UiQexNKQWWdEWapt3B5HAa+xEf3LId+zePqd
         JQMt0vZ95pkFz0gO2kguLb9+UbVLJm1p48+j4x51IizQlL7qF7iEU7dCaIZ/gOVEs8Qa
         VOlqdp2PiHqw1hiLnf8i/lGlGtOTeLLudGajlFrqU2siaz8/yoedlG4ons9jb41LKYzg
         D5sQ==
X-Gm-Message-State: AOJu0YzqQj73QMgNijKFc9mVTbw3yfYlFu+EXZaqwOIB/xRcrQU57vWU
	C62twVAAYzLpzDPDNWLDZYnpn6ZLk9i6YzJnVSCM97gf+8ZRAHxmMo19
X-Gm-Gg: Acq92OFwksWUVps1m5HqqfxQ+qEXbnE0WmuNh3O4o5gpKwnIvUVhCZVS9fvuJczY1GC
	YoiBSKyAKD4+EhQImLjbGxqrTlzM3HPITrAjrUv51/NVmKGqDu9twqu2j6F+VjDh0eBq8p+kyUX
	BLnaHfGdokLxT9kV0OTAr7ftgp86gFiihtM4QT8CEHT0pXdqvTgef8J3YSlTHCR0d0mv3JTyPzY
	wd3WMCbpVS+LRMhUYp3dh7mvO7ShAma1sp2LwGuFJCZ4yQZlVztQuJ/LdlhrdLbtfdku7FRcH1v
	wgUicKvHqbuh1hFnP128qTL20jrCPjlDq2O6SoLf3H4nVIuUYAGWXP+8SWlYsVZNjealjkO48rN
	Z3tIRPv7t5FcaBZDHmeQ0Imj/VNNiyS8FlhjhIjkt5PQ+t1kqdylttl5cy1CluL69Gkccski6l3
	qVJlfovdW788Ebkgr/xGGfku8LR2B5uwHDe4UqujiL+SO+wB5/9CAOFvb5RykXeQ==
X-Received: by 2002:a17:903:3d4b:b0:2b0:608d:d8a8 with SMTP id d9443c01a7336-2ba78f5005cmr156737915ad.1.1778435561714;
        Sun, 10 May 2026 10:52:41 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d008:80b:a00:27ff:feb6:42dd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2baf1e374besm83169715ad.47.2026.05.10.10.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 10:52:41 -0700 (PDT)
From: Pramod Maurya <pramod.nexgen@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nikolayof23@gmail.com,
	Pramod Maurya <pramod.nexgen@gmail.com>
Subject: [PATCH v2 3/4] staging: rtl8723bs: Fix block comment style in ieee80211.h
Date: Sun, 10 May 2026 13:52:06 -0400
Message-ID: <20260510175207.563378-4-pramod.nexgen@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260510175207.563378-1-pramod.nexgen@gmail.com>
References: <20260510175207.563378-1-pramod.nexgen@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move trailing '*/' to a new line in multi-line block comments, add
proper ' * ' prefix to comment continuation lines, and consolidate
the OUI_MICROSOFT multi-line comment into a single line.

Signed-off-by: Pramod Maurya <pramod.nexgen@gmail.com>
---
 drivers/staging/rtl8723bs/include/ieee80211.h | 46 +++++++++----------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/ieee80211.h b/drivers/staging/rtl8723bs/include/ieee80211.h
index 11825ace95a9..beee37041eeb 100644
--- a/drivers/staging/rtl8723bs/include/ieee80211.h
+++ b/drivers/staging/rtl8723bs/include/ieee80211.h
@@ -402,12 +402,14 @@ enum {
 
 /* NOTE: This data is for statistical purposes; not all hardware provides this
  *       information for frames received.  Not setting these will not cause
- *       any adverse affects. */
+ *       any adverse affects.
+ */
 
 /* IEEE 802.11 requires that STA supports concurrent reception of at least
  * three fragmented frames. This define can be increased to support more
  * concurrent frames, but it should be noted that each entry can consume about
- * 2 kB of RAM and increasing cache size will slow down frame reassembly. */
+ * 2 kB of RAM and increasing cache size will slow down frame reassembly.
+ */
 #define IEEE80211_FRAG_CACHE_LEN 4
 
 #define SEC_KEY_1         (1<<0)
@@ -433,19 +435,17 @@ enum {
 #define BIP_AAD_SIZE  20
 
 /*
-
- 802.11 data frame from AP
-
-      ,-------------------------------------------------------------------.
-Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
-      |------|------|---------|---------|---------|------|---------|------|
-Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
-      |      | tion | (BSSID) |         |         | ence |  data   |      |
-      `-------------------------------------------------------------------'
-
-Total: 28-2340 bytes
-
-*/
+ * 802.11 data frame from AP
+ *
+ *       ,-------------------------------------------------------------------.
+ * Bytes |  2   |  2   |    6    |    6    |    6    |  2   | 0..2312 |   4  |
+ *       |------|------|---------|---------|---------|------|---------|------|
+ * Desc. | ctrl | dura |  DA/RA  |   TA    |    SA   | Sequ |  frame  |  fcs |
+ *       |      | tion | (BSSID) |         |         | ence |  data   |      |
+ *       `-------------------------------------------------------------------'
+ *
+ * Total: 28-2340 bytes
+ */
 
 #define BEACON_PROBE_SSID_ID_POSITION 12
 
@@ -469,7 +469,8 @@ Total: 28-2340 bytes
 /* MAX_RATES_LENGTH needs to be 12.  The spec says 8, and many APs
  * only use 8, and then use extended rates for the remaining supported
  * rates.  Other APs, however, stick all of their supported rates on the
- * main rates information element... */
+ * main rates information element...
+ */
 #define MAX_RATES_LENGTH                  ((u8)12)
 #define MAX_RATES_EX_LENGTH               ((u8)16)
 #define MAX_NETWORK_COUNT                  128
@@ -499,11 +500,11 @@ Total: 28-2340 bytes
 #define IEEE80211_PS_MBCAST IEEE80211_DTIM_MBCAST
 #define IW_ESSID_MAX_SIZE 32
 /*
-join_res:
--1: authentication fail
--2: association fail
-> 0: TID
-*/
+ * join_res:
+ * -1: authentication fail
+ * -2: association fail
+ * > 0: TID
+ */
 
 #define DEFAULT_MAX_SCAN_AGE (15 * HZ)
 #define DEFAULT_FTS 2346
@@ -557,8 +558,7 @@ enum {
 	ACT_PUBLIC_MAX
 };
 
-#define OUI_MICROSOFT 0x0050f2 /* Microsoft (also used in Wi-Fi specs)
-				* 00:50:F2 */
+#define OUI_MICROSOFT 0x0050f2 /* Microsoft OUI (also used in Wi-Fi specs) */
 #define WME_OUI_TYPE 2
 #define WME_OUI_SUBTYPE_INFORMATION_ELEMENT 0
 #define WME_OUI_SUBTYPE_PARAMETER_ELEMENT 1
-- 
2.52.0

