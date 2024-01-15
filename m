Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF3333D8F
	for <linux-staging@lists.linux.dev>; Mon, 15 Jan 2024 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SsRFtmCK"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-40e7e0a6ed4so1992415e9.1
        for <linux-staging@lists.linux.dev>; Sun, 14 Jan 2024 23:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705305271; x=1705910071; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4Pv0xl0I8bsyuZAQfNzc0WBFUelC4XXOsiHgb/E75n8=;
        b=SsRFtmCK1Ju/0q73FxwMAQZObE2izqViFzZz3QN+jE1tigTvUhnt4mc6oB07whJC2y
         0AmWQc+T0hcJFSOxq4LIeEUtMSmA2exiN/3HKImX6EMZxsx4mfVEv5nq31u4lr3isxUy
         zcDreIXIjRTG1Zq7AedMf7sj4Q3AMo2Wik2CVhvmXtBgQx57XBqEpMKq7JvdTuLiUQSs
         M1xaeN+YDMxUcQInTd2a7MAnLvy3soWxYlCCK5MSyhaLIfjFpLDQFWFZI8tTjKtysqwu
         BweTAonUJO3Vf0joiwcZWDYSVRov4x8SNR4CQQJNoqxunCxtWbMSiCfkLWAs71mPmI+E
         jm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705305271; x=1705910071;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Pv0xl0I8bsyuZAQfNzc0WBFUelC4XXOsiHgb/E75n8=;
        b=ISX9y2H22Ygbv9J1dzw+I5kuaSwA2f9WtKKXECyfPZB88XZWu6nST1nYP9YTKI103t
         uadMX5vSq3mHlJfqwHmd29Y21trhaLE8yLpkDv9oqPS+r5Hf4jkGaCHcsvVX3qeDv8NV
         n7vdESEdSLXqNTBNBFAApCNmQh4FXnbpx63TFh92aAOH8d1ltyDr293pCYT05wWOcUhP
         pgz0XCQEEYogq/h6GVXS/A3HHbZVJisDr/aMykc5Xe3GPREeBEquoK/rJrGfZvI8tTUL
         jvRv1RJwmReTCKrHucY7jVFbDyn55BVaD1OXFGz6sDvkpD+XrgtrgqFW1qwqZ2FlB8S/
         EgFw==
X-Gm-Message-State: AOJu0Yx031Z8BrIhOIMxz4YWJNsDhNFekr7NPiz1XcI84VDCGju7pWNR
	AykK8uNhEBmblCOGk/NNNQc=
X-Google-Smtp-Source: AGHT+IEqOmYvE2dB5GpvQhT+CFHYwdWtEAh8jObKO0lz1NUgtLKS6c+9RYfDHC5TVJ6cFY5mQibqNw==
X-Received: by 2002:a05:600c:3b2a:b0:40e:621b:639b with SMTP id m42-20020a05600c3b2a00b0040e621b639bmr2680466wms.116.1705305270713;
        Sun, 14 Jan 2024 23:54:30 -0800 (PST)
Received: from Ubuntu22.myguest.virtualbox.org ([46.121.140.32])
        by smtp.gmail.com with ESMTPSA id o8-20020a05600c4fc800b0040e549c77a1sm18870472wmq.32.2024.01.14.23.54.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Jan 2024 23:54:30 -0800 (PST)
From: Meir Elisha <meir6264@gmail.com>
X-Google-Original-From: Meir Elisha <meir6264@Gmail.com>
Received: by Ubuntu22.myguest.virtualbox.org (sSMTP sendmail emulation); Mon, 15 Jan 2024 09:54:27 +0200
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Meir Elisha <meir6264@Gmail.com>
Subject: [PATCH] Staging: rtl8723bs: rtw_ieee80211: Remove extra space
Date: Mon, 15 Jan 2024 09:54:25 +0200
Message-Id: <20240115075425.108134-1-meir6264@Gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch warning: please, no space before tabs

Signed-off-by: Meir Elisha <meir6264@Gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 30e7457a9c31..cfa994835008 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1036,7 +1036,7 @@ void rtw_get_bcn_info(struct wlan_network *pnetwork)
 	struct HT_info_element *pht_info = NULL;
 	struct ieee80211_ht_cap *pht_cap = NULL;
 	unsigned int		len;
-	unsigned char 	*p;
+	unsigned char *p;
 	__le16 le_cap;
 
 	memcpy((u8 *)&le_cap, rtw_get_capability_from_ie(pnetwork->network.ies), 2);
-- 
2.34.1

