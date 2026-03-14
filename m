Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E1B52D6E66
	for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 21:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773524852; cv=none; b=fsGfoC4dkAyz/Rb7JdrpI7zWQHGIOT+XnsA7ALCVhwiO+CWZ8xs974o4BqJXMlRzpqH31P8791AOBWxVbpsMlWVei47WRMBYdwHUJTSLt/qR1h3Q1Rts/jv8V1fW6LjcNOnCvhcCQsYKuyRjAu28HcI0Iq1gQq0H39ZNBTuq678=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773524852; c=relaxed/simple;
	bh=4bfBXQfPbkU7JmL1qRRsnrm3Pf4KvJXqpjwGHWRNqyg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hwZtjnHPnIcYoztxj3ljNWsUE79AGTKyEmbomVxj6N8g61AE+Nf9EQO7Qpaxxfy3bJdI94rTLwKfEEqysh1eD/fLxK0VHxJQ6KYIucIal6e09i83RUMKmHD+QSt+RiX4gnV0lPuVokx3JSbQIh0GjWZo+n1AOPtaZW1qWP1hF9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPYPYb4t; arc=none smtp.client-ip=209.85.217.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPYPYb4t"
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-5ffbd778410so938876137.3
        for <linux-staging@lists.linux.dev>; Sat, 14 Mar 2026 14:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773524850; x=1774129650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=alGyACKRVvN5aaPDRz/bs51HwfBDN0Y0PQTNwWDzjFc=;
        b=mPYPYb4tbyExZfbeQGhT0IZTt4WRGkR8cEjQ6BstVTo71buUgRlOQ9S5+aOxscqkje
         iU486HCE9yh42Hx+K/0A9klDNJoN4ninVNmiBttVN3DTrvrYycmNZ0reoSj6X/suDtvR
         YdSh4qcCX1NqJqnBTx5fZGWrUjUcva7ZzpY3qiBxVlcu3/xWyb5RMi70rqQMz9AeBLUj
         sx8ZZl9sPD6F+GuG2nWMmFvdGndYKX+p9yes0n2O01V4S6dQ/pXpzFcTtnMo4uOsf4Qh
         mTJLMVXyVTw8jzFxf5Qx6IkrZNMlHbSl2jSxXRikqEjxHoibMPuhPs+Rtv5rfPn/CAXW
         QUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773524850; x=1774129650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=alGyACKRVvN5aaPDRz/bs51HwfBDN0Y0PQTNwWDzjFc=;
        b=SxNUTJEKW/grkk11to5zqG2c/cXM15QA4H5P8H+Wy9nrDTKXu7FjRTCdg1FcJboCjm
         qhKNkA1YqwR83WQN0qxSQn0fidinMTN/HRqh/ct/j7ckFDaC6Xg8MqImNfFlnEWgC2do
         RxcElbx8bN8GRVrqP5/jxcdisT5Vqgn4KQbuarfW5XXJ94qjucuJQ3dubuse3rDH8HWd
         JzieOr77Q3lacJ1u/xU/fo2varKwAlKLY8GZuIoHwtZj/SdxmdsKpDWSunx+2jDpeygf
         0Z+m8DF9FIVHG9ir9LrYDrnyUWa1eOBBDa345EXZ7F7bQCtZ3ugUE6CdbpY+EuzJivO+
         q6+A==
X-Gm-Message-State: AOJu0YxzQDojvbqKrJU8hNvAvloGBfJF4+xtoJvHp+6uBegP1bAHZGH1
	+DrahCcWJiIvYvrfWlsI/c0ELDbomHB5dWxq1Oa5FeKXyIJdiGt2rJZ/
X-Gm-Gg: ATEYQzwLLQ51wtX3meQucLyTumQBEjSJTA0bAnG/dvRbnIJlEl8tlcmt4+/FUgC/x8b
	nD6foBUlOKvnHtHvzhpNeXzxOonjM/RwiDBt5WJ6p+y5K/30X36rOgXvdd7Ax/bsUyBb8LrgDOT
	NC3BTAFK/gPwjRldCMZ1xsm5J+Iw9YQx7CjbYai+YyRG4IWlTldSyZBoNwFNSF3p7i/p7+Cbfeh
	l6aoALyG9uD0sXmpWA93PU1HF9Qv9HXEMmVdJGrZlAVw27/Th6ugULrNLQlr7SiRDBcnwyRHaxY
	fTfC/JLeDjNuSAFAhC+LEdYgMH/oaK1RhGFXB43iJdK/D6U5EBxFpycVto1JeOGqgo48VpAXAVC
	94gVo3f+O4n2l5YagbOxv0EaFTdLnPMh+wyr2yI0Y3/9a7BRdhVqiQ+YsA4IRED+N7KvnxrcQ43
	Nu/qDm9XkyiPv+2yIyDxSEPkH347er5S4CmfToEmU4ACHFlqs=
X-Received: by 2002:a05:6102:6cc:b0:5ff:2391:45c0 with SMTP id ada2fe7eead31-6020e5a1084mr2725732137.31.1773524850635;
        Sat, 14 Mar 2026 14:47:30 -0700 (PDT)
Received: from mjmachine.localdomain ([131.255.96.240])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-94ecfc4ecabsm4319988241.3.2026.03.14.14.47.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Mar 2026 14:47:30 -0700 (PDT)
From: Marcos Andrade <marcosandrade95963@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	ethantidmore06@gmail.com,
	Marcos Andrade <marcosandrade95963@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Replace network magic numbers with EtherType macros
Date: Sat, 14 Mar 2026 18:47:19 -0300
Message-ID: <20260314214719.45853-1-marcosandrade95963@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace hardcoded magic numbers for network protocols (e.g., 0x0806
for ARP, 0x888e for EAPOL) with their standard EtherType macro
equivalents (ETH_P_ARP, ETH_P_PAE) defined in <linux/if_ether.h>.

This change improves code readability and aligns the driver with
standard Linux networking definitions.

Signed-off-by: Marcos Andrade <marcosandrade95963@gmail.com>
---
Changes in v2:
 - Changed include from "" to <> for linux/if_ether.h.
 - Sorted includes alphabetically.
 - Removed unrelated usleep_range/delay.h changes (will be sent in a separate patch).

 drivers/staging/rtl8723bs/core/rtw_xmit.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 7b18be891..4062fe0c1 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -5,6 +5,7 @@
  *
  ******************************************************************************/
 #include <drv_types.h>
+#include <linux/if_ether.h>
 
 static u8 P802_1H_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0xf8 };
 static u8 RFC1042_OUI[P80211_OUI_LEN] = { 0x00, 0x00, 0x00 };
@@ -2026,8 +2027,8 @@ inline bool xmitframe_hiq_filter(struct xmit_frame *xmitframe)
 	if (registry->hiq_filter == RTW_HIQ_FILTER_ALLOW_SPECIAL) {
 		struct pkt_attrib *attrib = &xmitframe->attrib;
 
-		if (attrib->ether_type == 0x0806 ||
-		    attrib->ether_type == 0x888e ||
+		if (attrib->ether_type == ETH_P_ARP ||
+		    attrib->ether_type == ETH_P_PAE ||
 		    attrib->dhcp_pkt
 		)
 			allow = true;
-- 
2.53.0

