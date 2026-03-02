Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633211F16B
	for <linux-staging@lists.linux.dev>; Mon,  2 Mar 2026 19:06:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478378; cv=none; b=KH8eClWk/SAIG9N+p4SPmi5AiyBT/yiozARHYHrF0s9hiZdShkRKaSmw47qDUc6K1Y3J15uX0cNYxZk6qqPSUPDUKuw4c+122RBiku80isLq4YqFlKjidx18cI7H/4f3Lk9FITte0rkYgoqbe2UsFyGXDbNGw7TXCnikQdUlge8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478378; c=relaxed/simple;
	bh=vdQQP1VXllR5llwXJIJNBxZumMpC9xuePnfwXpParOA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UPVtIUxsGzepBevSk41sgZ+yYThveUCo55w4QqFcYnowPJFa4CZ1H7FkmiI8/KeuAaIQ2r1MJz80eO7OmvXzJap31qgp8PgDrcPwIkylgl0cxrf9i+GRTdn9QkBkkCspg3Q2K8DxkgRA8da9tgrnjFtqx4uoiUVV1NyfSvVJ54w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MTekXY5m; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MTekXY5m"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806f3fc50bso52367705e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 11:06:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772478374; x=1773083174; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+EfoVdCPW/qa6Sdu+ZSlk8OUJ552E/SGn+JeOwvKG1A=;
        b=MTekXY5mKiFqYLtfjZa5J/OyehGPvQ946uXKvP/WfrYPpA7BIija2bnSKelWfDxanm
         Gbe5xasRcyQOui+GOZuRpE/yHrePnXPbvNV7vJEHWZ5DIIcUvV62aSOIEj0iym9kdwzC
         awsVAbYuSaa4+vAQlM1RM5XE7gxQw9tyFYxk/ZXfg8X09D7MOUwgiLa5C7pmSL9UIDC3
         Y6WJTx7bDVA2/dA4EedjacEtdDDOtGbMBXtkyKwUuajXvR4XbV5bQQeVM953sr7Oo6e8
         ZcWmha2+acqqcpGfoeS0ODjaJqV5xedp+bieHK0qlwVDJ9AgkuQHEHEjrVC2w3f4A6a9
         kLNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772478374; x=1773083174;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+EfoVdCPW/qa6Sdu+ZSlk8OUJ552E/SGn+JeOwvKG1A=;
        b=U5kh5bvtQ880+yoyJ2gMgfDxniIMYLB0db0zIb+FUFO+0Q1gq/OI2rBut2juMCMVHs
         oLZ6EZv6NqyY2hiNZe7zeIgBISP3okJfpMg7OL4n2GnPt8CiXfW3KYsyU+mHo/5OXf3t
         YzOqz1FwakKHOsaF9PPOW+5dbrkcaEjQRHNvT1PzO+nAGAnIfdnyi5yVx4KqG7X5kUZM
         3YSFSC++oHIwycSJA2Q4STNNtQ57KbNFAmE4Jmq+Fb/PEeIt8D6Kr+CkjnNfPJSQ+eQL
         irkGnHSlZ7oPElPsQHQhnfwMhlsouDUv7IXzCs3AyB58JQPpjgeZVHtUHD162L8Hc4gm
         a/+A==
X-Gm-Message-State: AOJu0Yzki4b5JrreLQggdOryvWTzQFhvPiMWi3PIcuFfDXvOjv3AeVx8
	0n4nsNSuVzVlWXNDg80Wk0lFtpLGJMTnS2D/CIBU9WeINDnPcjvOEvM3U+fD9urumG0=
X-Gm-Gg: ATEYQzykfqnHEahbYuxV+ASev49QhqAeUYV0Uu05IMaF8ceEcI83so3Zcf8JbuY82/Z
	mybccOwFbnTt1K0Xq2W5zYRWkCWA98yX+oOQlvEumbECvbRSfycSEJajA11dzPzWBB+3O4loZuQ
	WJqcEj2zKJwyNcmZtl743KawoRhVkcLlHLjjy8vRQl2/aPulRWrUuT/Ul3eYLlXtds5Lq25caxk
	MN4kJx14Cp0qlmDvp9B3Kr0rHNFBPjvhOgvMWyhssypnfpyV97d63hKjF4RSNkAMxVWQHQYThNv
	Gq/5g+JOOSa/sNvpLFxohP8vnM5rTEdCncHtkeHnPFhFw0z40GzQ1LRJnGOiEAlgIMuWPiRZ6s4
	zvCybwDbD6P941PX0cuQlwUPNw5tkuz04Z/JmCUeSXtEix/cyaNk4TFjmVbrwF7XizY3jWCUDjr
	nPaXJ9xd6Dlhfeaz2RhueIL71+Gt4TqKJ53C8nFS8=
X-Received: by 2002:a05:600c:5306:b0:483:6d42:25c6 with SMTP id 5b1f17b1804b1-483c9bc4210mr253522415e9.23.1772478374362;
        Mon, 02 Mar 2026 11:06:14 -0800 (PST)
Received: from localhost.localdomain ([83.231.69.9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bfcbf894sm138801525e9.16.2026.03.02.11.06.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 11:06:13 -0800 (PST)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ethan Tidmore <ethantidmore06@gmail.com>,
	Navaneeth K <knavaneeth786@gmail.com>,
	Nikolay Kulikov <nikolayof23@gmail.com>,
	Bryant Boatright <bryant.boatright@proton.me>,
	Tanjim Kamal <tanjimkamal1@gmail.com>,
	William Hansen-Baird <william.hansen.baird@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8723bs: fix bitwise OR operator spacing
Date: Mon,  2 Mar 2026 19:53:28 +0100
Message-ID: <20260302185340.61540-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spaces between bitwise OR operations rtw_action_frame_parse() for
better readability.

Signed-off-by: Jose A. Perez de Azpillaga <azpijr@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index dbd4bcc8cd28..446e4051b9ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1123,8 +1123,8 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 
 	fc = le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control);
 
-	if ((fc & (IEEE80211_FCTL_FTYPE|IEEE80211_FCTL_STYPE))
-		!= (IEEE80211_FTYPE_MGMT|IEEE80211_STYPE_ACTION)
+	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE))
+		!= (IEEE80211_FTYPE_MGMT | IEEE80211_STYPE_ACTION)
 	) {
 		return false;
 	}
-- 
2.53.0

