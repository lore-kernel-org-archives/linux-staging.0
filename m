Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC5528C5A7
	for <linux-staging@lists.linux.dev>; Tue, 13 May 2025 14:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747145525; cv=none; b=upFxj7YY2/FXTmi+XjMDaoKDYDzykOkx0TgFG2GR5w51NuLgfzUDNpjQ1iovITbe+xQ7BvH4aStip3W/lbaQUOsafA3d5JJZNQjuVpV+1b5a5JEq7/yTJB1pTAR3bHRf7gS6fjRnXLHKApJQS7W60USEy/l8/FjelotaaqhXK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747145525; c=relaxed/simple;
	bh=2xqvN5MZ0cpWW5I2C/Kd63LpkF2iAU47gBCPKJfXWlk=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=k5QRmq+agPnjMAPKal1b2io9p7d43CgocsFvKLAr5gTfC9OxdcuKmL8w+8ffhR+aegohxB6wxIIRHG5DD+MSaNlCJhB+Sc/+eVpbBJYjKBXlfppzO+p9kMw66sxbOtwqgOkBHoXKx9ZlBy5Y1ijzl7IpfJtMsg3JpCEs8DQB/4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P2CpAX4z; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P2CpAX4z"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22fbbf9c01bso46217175ad.3
        for <linux-staging@lists.linux.dev>; Tue, 13 May 2025 07:12:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747145523; x=1747750323; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=J3EOkbiprB+sAgxVEHkLRonbL3H46Q0tOtDWzJ5+klo=;
        b=P2CpAX4zNqkA5ei6HoFYu22+Nw+n7AJohdfBGOzNczVFS9re5dTLEJSxhQgXAxcoMh
         sVvkC2Ptes2fRb9wWzELMeWdrkpDfsvaXLL6ZlxGkwaIlkvUEipdwmwVuzkdXtTz4IvI
         C0pTB91+mtNDCrIQ25biQd9z8XReMFCj1mRO/GaccAx13Vp4nK/DRI4ViX+i2YOzcXoj
         luNpDunE+cWGItmV5SZwB1rv7xXCNkAozAkPprOEmRZzoC+WctoY5RA2WAbCO0zRQXcl
         84jo7P4TtedXxWq0e7z+lHT+FBiaq/AYadt/fEDsRXGJzEOaSPwd41AHnsMjEFJpZOLK
         +8oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747145523; x=1747750323;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3EOkbiprB+sAgxVEHkLRonbL3H46Q0tOtDWzJ5+klo=;
        b=Pjnla2Jvj06pNd2qmjr2LK0FlGeVBZnTYAij1qgNPGe06OHjFUZ/N+4FLSk7+JWPH2
         pNU/St73qXNE+KFlDGVe0wiyA6VAneQ07brjjqiTSRnziIVp8fB3oSnUrhBfCI8LKFeF
         RUbETQvRPoW+CU7pgmbUdlpXw25PuHimlFKGrHpEXC/DjS3cFARS5qnflcyQ41qWH7JD
         amlh90s0zrAJwuh3mFEkbxz1QU5E1GCPz6umYEfqRSXAl9jpNDGjorBn+BV4Byha2Gin
         rdXDPq3PLLyfYKUren6pP2voTS1KsDnl3K4OH7lwl2MOJNjvkmPdOfRCinYaSGJbuRAg
         EZLQ==
X-Gm-Message-State: AOJu0Yxbz7nPq0xuI2cPq11NwRTW2MZBT0lSHMshffGh+xYCZRa869LI
	fAFrys2b6G6GWfU1BlFVuoTihRAf65xYONmOrXE4ZMqMc2U3TM4TGNhwTVOcKtPl3pq3g8RNK+Z
	UZZD/FHWum1iG1cH2pePDwsOk5yY=
X-Gm-Gg: ASbGncs/0ZO/8uoX4dLSN1G587I7G3sU/AIv1FDOd2H3qkPAuV3mWXpb2Gy0R7FXprW
	Fp+xxe4C3FqmCnq/26oQ/8NdzOp/jhXbc7dYtr6ByyQ+mrEJPTHiyrDJctLG+Z9y9p0Ix+T+zeq
	oy5mZyrUbBGuZb+q0MHgJYUJNd5dqynyUY
X-Google-Smtp-Source: AGHT+IF45yksE+sO7g0bsyu+gCHTxSnOl+bOkwMK4/IOhUAdyfs8E4kWcc/D5Rr4ozrDkVRLAQcdu228FsL4WfrKTF4=
X-Received: by 2002:a17:902:dacd:b0:22e:566f:bca7 with SMTP id
 d9443c01a7336-22fc8b5192fmr239873545ad.17.1747145522940; Tue, 13 May 2025
 07:12:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 10:11:51 -0400
X-Gm-Features: AX0GCFvLU5dUzxQd5PLroCq5K8AVhqmL2OxGZEuBaeNQtpjBBfb8ofJBYjgj3yc
Message-ID: <CAPGyJDMb0Ac7KtNc8AUTJ4E-Q4Vw-8JNoKWPMTFSuRU7QiFfdQ@mail.gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 25aa24c7cde7df5901674ec08090992b17afd5b4 Mon Sep 17 00:00:00 2001
From: Tanav Chinthapatla <tanavc01@gmail.com>
Date: Tue, 13 May 2025 00:16:29 -0500
Subject: [PATCH] staging: rtl8723bs: fix spacing around '+' in rtw_cmd.c

Signed-off-by: Tanav Chinthapatla <tanavc01@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c
b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index 1c9e8b01d..98d89e836 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1619,7 +1619,7 @@ static void rtw_btinfo_hdl(struct adapter
*adapter, u8 *buf, u16 buf_len)
  buf[1] = 0;
  else if (cmd_idx == BTINFO_BT_AUTO_RPT)
  buf[1] = 2;
- hal_btcoex_BtInfoNotify(adapter, len+1, &buf[1]);
+ hal_btcoex_BtInfoNotify(adapter, len + 1, &buf[1]);
 }

 u8 rtw_c2h_packet_wk_cmd(struct adapter *padapter, u8 *pbuf, u16 length)
-- 
2.34.1
