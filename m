Received: from mail-vs1-f54.google.com (mail-vs1-f54.google.com [209.85.217.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E589617F
	for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 14:04:34 +0000 (UTC)
Received: by mail-vs1-f54.google.com with SMTP id i29so724886vsr.11
        for <linux-staging@lists.linux.dev>; Wed, 26 May 2021 07:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQqGtYMr2zlLbcLVkcKrC3bk86zDK/4KzT5M92QS2z8=;
        b=js0k+v30ImDal3nu+/B9Tvhdzxml+LpwXVkA6WLASYT7Mug29dZ2qe5dl5t2NouImy
         +Lqx++Xq+upNIti72W3v3QtK2lh1Gzgf3OGidOYsVedDayOylmIDfVMIjtYZDpLpfD7w
         hUbxgUBgK9y958DlbeQMsjZ464wapULJK5RKqvNj9vITzfxsBtU2lfZA61CZpGpFV11V
         N+LwRbMtHPKOW9AYqf8opwM+MxULdhwUk4MUt0W9+VHXYSpgpUdEhmVqQLUC6VO9JSfZ
         zF87yHTc7/GQWwjt4fz845y6qMOYNin08fkirflQeOmKyEjJjaiPgA4HcOE26vjm7mU9
         hapQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uQqGtYMr2zlLbcLVkcKrC3bk86zDK/4KzT5M92QS2z8=;
        b=O0F3lESeFY/1bhCHaDOXO8fh0/5mENDHsgnIEZLA2DuvqK3DGLImRy6+YpCdtL6BG+
         bJfzRb8x29aQ+njZA+Oo5frL9m+CKZ6uFueSkDuwo1zJjInw42hAuCMH26Oj/xkwQmBZ
         34Oq03NXFzpBX5dhRc/CSW2/Ng1yvvWHRwOsQvSXEBMSI58uujJxuwRi7ZCYUb8g5MhW
         L0hwkFTSt7sZLMWJoPGW6jAX7KcKRYVGeECdeROH5QWb8kQzbHiAnWw30klKwpSgwxIh
         cpZggpW+ZfnEgAznbWe8hAiV7rf1TPi1PUa+cXyuREZ0GfY3zsKaPGzjypaapHr1hHx4
         5hDQ==
X-Gm-Message-State: AOAM5308xU8pttKydGVeIViqxNvFzwsEI0VtzwRU/xv2L492TBs0cZqh
	jvkSOO5Ca585A+OSg6QY/PQ=
X-Google-Smtp-Source: ABdhPJxr7d/4yuItMUDK3EeiOYXQRE1LsT4KeRccReNM27n6EYZdsge6foszt+L3iAJUkKN/3MhaPQ==
X-Received: by 2002:a67:1684:: with SMTP id 126mr31603327vsw.37.1622037873952;
        Wed, 26 May 2021 07:04:33 -0700 (PDT)
Received: from localhost.localdomain ([65.48.163.91])
        by smtp.gmail.com with ESMTPSA id o5sm2025488vke.32.2021.05.26.07.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 May 2021 07:04:33 -0700 (PDT)
From: Sean Gloumeau <sajgloumeau@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>
Cc: Sean Gloumeau <sajgloumeau@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Gustavo A . R . Silva" <gustavoars@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: vt6655: key.c: Fix coding style issues
Date: Wed, 26 May 2021 10:03:09 -0400
Message-Id: <20210526140309.23376-1-sajgloumeau@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes were made to comply with the suggestions present
in Documentation/process/coding-style.rst as a requirement for Task 10
of the Eudyptula challenge.

Signed-off-by: Sean Gloumeau <sajgloumeau@gmail.com>
---
 drivers/staging/vt6655/key.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/key.c b/drivers/staging/vt6655/key.c
index 94665ddc36a5..d1470ff55e06 100644
--- a/drivers/staging/vt6655/key.c
+++ b/drivers/staging/vt6655/key.c
@@ -64,7 +64,7 @@ static int vnt_set_keymode(struct ieee80211_hw *hw, u8 *mac_addr,
 		key_mode |= (mode << 4);
 		key_mode |= VNT_KEY_GROUP;
 		break;
-	case  VNT_KEY_PAIRWISE:
+	case VNT_KEY_PAIRWISE:
 		key_mode |= mode;
 		key_inx = 4;
 		break;
@@ -82,8 +82,8 @@ static int vnt_set_keymode(struct ieee80211_hw *hw, u8 *mac_addr,
 			key->key[15] |= 0x80;
 	}
 
-	MACvSetKeyEntry(priv, key_mode, entry, key_inx,
-			bssid, (u32 *)key->key, priv->byLocalID);
+	MACvSetKeyEntry(priv, key_mode, entry, key_inx, bssid, (u32 *)key->key,
+			priv->byLocalID);
 
 	return 0;
 }
@@ -103,7 +103,7 @@ int vnt_set_keys(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 
 	switch (key->cipher) {
 	case 0:
-		for (u = 0 ; u < MAX_KEY_TABLE; u++)
+		for (u = 0; u < MAX_KEY_TABLE; u++)
 			MACvDisableKeyEntry(priv, u);
 		return ret;
 
@@ -112,8 +112,8 @@ int vnt_set_keys(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 		for (u = 0; u < MAX_KEY_TABLE; u++)
 			MACvDisableKeyEntry(priv, u);
 
-		vnt_set_keymode(hw, mac_addr,
-				key, VNT_KEY_DEFAULTKEY, KEY_CTL_WEP, true);
+		vnt_set_keymode(hw, mac_addr, key, VNT_KEY_DEFAULTKEY,
+				KEY_CTL_WEP, true);
 
 		key->flags |= IEEE80211_KEY_FLAG_GENERATE_IV;
 
@@ -132,14 +132,14 @@ int vnt_set_keys(struct ieee80211_hw *hw, struct ieee80211_sta *sta,
 	}
 
 	if (key->flags & IEEE80211_KEY_FLAG_PAIRWISE) {
-		vnt_set_keymode(hw, mac_addr,
-				key, VNT_KEY_PAIRWISE, key_dec_mode, true);
+		vnt_set_keymode(hw, mac_addr, key, VNT_KEY_PAIRWISE,
+				key_dec_mode, true);
 	} else {
-		vnt_set_keymode(hw, mac_addr,
-				key, VNT_KEY_DEFAULTKEY, key_dec_mode, true);
+		vnt_set_keymode(hw, mac_addr, key, VNT_KEY_DEFAULTKEY,
+				key_dec_mode, true);
 
-		vnt_set_keymode(hw, (u8 *)conf->bssid,
-				key, VNT_KEY_GROUP_ADDRESS, key_dec_mode, true);
+		vnt_set_keymode(hw, (u8 *)conf->bssid, key,
+				VNT_KEY_GROUP_ADDRESS, key_dec_mode, true);
 	}
 
 	return 0;
-- 
2.31.1

