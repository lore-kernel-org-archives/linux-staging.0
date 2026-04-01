Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F503305064
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 02:14:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009646; cv=none; b=jyJGx0bbp4dP8NOZB/rVS3B2N6RneA2BJEvUIUOYbaXNyG0krIWb32C62IJyEf2S6elDsIWsgfQk1g7z0wbM4vLD3Iejw09oxPTo7kgSNKyjRCh+/h8m65ngxpugnpQQDZJKF8WGEpUr4mUZdQJBrNYowkZ/+IVXcNf8J9z+FfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009646; c=relaxed/simple;
	bh=GQRNMXDrkxWrYPr4MgpYIy8PqFwqBNyfd4lpXiZZjEs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aD8Cd1FeU6A9SUehHpuuBLaS/Qj5+V4dfYsBxt2T+rl8OMPDpo4N9n2lbVV/L6uc55Ho3o+ookxV2T5nPTQzCyXaYh90cnV358HaD/yn4Q9gr+iu07bPnjYBozRnLWm5maCMX4AoyR7wxmKif4GRTyLeMeeg184EfoEcmLtweQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YFMRvDNt; arc=none smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YFMRvDNt"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-64ef161129bso7898554d50.1
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 19:14:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775009644; x=1775614444; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q1acBTrh2rzeeLIEi8W0W4rzMgKlSdFNlITO+uS5EGY=;
        b=YFMRvDNtK7B8YQeCF8nvxtQWO14Umiof3RFqit8qGC06l50qhLRDNA6oX4XoWjl1Bn
         HqjkFlUIFormYog2DepDVNaLqN8atg2yVW7VBZU+Zy9tIQQvXmJwv46ih3ksaiLfrTLn
         fsJ2cOwRUVWBQ4zb99Ml5S2jZ6b/P3PLe+WFcAWSBg7O8yzFhBs/2sCRjB75NsREiZcJ
         q31rFpPOqodKWlI36N5OlLsmHS1xNrOeKg9SDNCAnxkyhE+t8I0pE72VkU2768pFv116
         eYDbnC+2HQSkYpkU8ElyAduyJ1LoraagdCUpb0vv6WN6IzJJrVBNrVIe89DLS+Sgu2b/
         YMDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009644; x=1775614444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=q1acBTrh2rzeeLIEi8W0W4rzMgKlSdFNlITO+uS5EGY=;
        b=JJPlfCcYL1f0E43PH+BEzKChEUrzMAGqBlu1M4DlyzYO8XcYGSEW8y7+qe5qCqfMmY
         p6tVx6ruqUy2G3gE0k4i+QlIbPEq7zA2cyc8pB99vkUJu+cUP8jD5cPfkd4a1d6mDwpG
         TfYv4H7XYetYEygRhCMfdXFRxQc+ygwjwHGMXBkDe/FL39m0EKatUQ2pXERrt+5GPu/I
         +VV619YMNM6ZjwCdqrZ91lWMyoHsz7fsKQBlv1WjN8GbxrvbM1YYxhVGRzJimeVFm9w6
         OV5BUth8StXPsiHyS9RoblthfsSaQCKWWSKmUD41ffrYl8uLy8k7Ie9TRrVtAQpksus8
         9sQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmUKWzHSrd+b1eKydsJoclJMVyn3occTV/yeXhHG9CqIx3kYN9FlnvyueTKiKRdQUiUoAYTaFnSNb/9vBP@lists.linux.dev
X-Gm-Message-State: AOJu0YyfYB2B/0TSRQSFGjNkCNcJsrJXw+sw7VRCzhr3Dhvw0XuHL9wK
	PAP4t/i3Y9Pe+pyGyThQ5CAnM2g/hgyp3/SZSyOojYxGc8KCtYKUpPU2
X-Gm-Gg: ATEYQzz4M/gdoVkZWIAc7z/xKOH6bpKL4RMPiIVXeaX6Xd0I3sGnltnQmMco1O8tWmS
	6cUGOjD7nRK8vxKl1e4BK3Wz2eRTXUmyxmHPat6uXm1JGwyCZbJmSiNBKBw8SRbfhEaq7dD1hsJ
	jWM38gYgqiKxuuTHif09GYMVaQGJvUIS3cJ9CQLnPZ7G/bMoMimjYQCpbdn4+lz1u0XG7d68hqh
	AYIm32RdRDOa6K8beNgNQrhqVUOMxXPpytl3UOZQAUqrRvanRECmRCHkMRb2q90TFrFZob5VQDc
	n1k2XGZbAOFP3UM17qaeTJY1+jakgrhVa1aFJqTsCj7WpQd5Ueoqtd9HPTGJmjAA6m4vsxcxHmw
	0CHj7VciekpVXqfw7l/Jv8wDAeUxhz/VEDSIV8eu4hloj8rmZXYQC2XOiOs64zscCRduHyj8fUO
	RXCy+A3ga52FRk/Y05ohGFfWO00c9zZMVp5kmQE6EZry7KNCZFY+mtq/iQfRoj1xDx6DI0/PShk
	k8vdw7aypxFmCBH20nPZVFy
X-Received: by 2002:a05:690e:1349:b0:64e:9d15:d717 with SMTP id 956f58d0204a3-6502fea505cmr1698150d50.70.1775009644514;
        Tue, 31 Mar 2026 19:14:04 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65009326eddsm6398951d50.13.2026.03.31.19.14.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:14:04 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 2/2] staging: rtl8723bs: Rename pHT_info_ie to ht_info_ie
Date: Tue, 31 Mar 2026 21:13:57 -0500
Message-ID: <20260401021357.1176600-3-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401021357.1176600-1-ethantidmore06@gmail.com>
References: <20260401021357.1176600-1-ethantidmore06@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert variable pHT_info_ie to ht_info_ie to comply with snake_case and
to remove Hungarian notation.

Signed-off-by: Ethan Tidmore <ethantidmore06@gmail.com>
---
v2:
- No change.

 drivers/staging/rtl8723bs/core/rtw_ap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ap.c b/drivers/staging/rtl8723bs/core/rtw_ap.c
index 8d1a35de037a..5eac16a7614d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ap.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ap.c
@@ -754,7 +754,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 	int ret = _SUCCESS;
 	u8 *p;
 	u8 *ht_caps_ie = NULL;
-	u8 *pHT_info_ie = NULL;
+	u8 *ht_info_ie = NULL;
 	struct sta_info *psta = NULL;
 	u16 cap, ht_cap = false;
 	uint ie_len = 0;
@@ -1007,7 +1007,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 		       &ie_len,
 		       (pbss_network->ie_length - _BEACON_IE_OFFSET_));
 	if (p && ie_len > 0)
-		pHT_info_ie = p;
+		ht_info_ie = p;
 
 	switch (network_type) {
 	case WIRELESS_11B:
@@ -1038,7 +1038,7 @@ int rtw_check_beacon_data(struct adapter *padapter, u8 *pbuf,  int len)
 
 		HT_caps_handler(padapter, (struct ndis_80211_var_ie *)ht_caps_ie);
 
-		HT_info_handler(padapter, (struct ndis_80211_var_ie *)pHT_info_ie);
+		HT_info_handler(padapter, (struct ndis_80211_var_ie *)ht_info_ie);
 	}
 
 	pbss_network->length =
-- 
2.53.0

