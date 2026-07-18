Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FB132B116
	for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 18:55:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784400921; cv=none; b=LgVEbDBOFODf/7KPlRB9Fi6L6JVbQ9Paanj5WdWJmXO4pNYhu7dcG8IsY0vvpT5uhUUUUA4+p/Y3RFjfj1oYrRrW8OPXeqY4YS27NqzuiilDgmcpkYyAGdILTJno7TL5nTr3Zfxpg7wjE7LJed1CHdkM8ihTUZ6he7wjEaCDNZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784400921; c=relaxed/simple;
	bh=7igi6JgfyV7UtI5KhWMltwcUSiXutkp84qo2icc/bR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uxborPxV8dXxWXAgpcjkGKMeuHsNxrDeIA97/aRhKBygM+rkuOCys6qnTnQ1jxewn6nbqrbGU/tle6IHHIa+r2iEPMUw7SCy5q++/P1nH/cq7RBDJmpfBQyHqc4xbx01qnX2jkNAnEri/wXloZfiHDm73lqpS37rree4jB7t+RI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HLM2kZi9; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HLM2kZi9"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c15f020a223so1171481566b.1
        for <linux-staging@lists.linux.dev>; Sat, 18 Jul 2026 11:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784400919; x=1785005719; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amhXqSP3saN85/NqS6GeuPvXXhbdKvSiHBtrXRJeyQM=;
        b=HLM2kZi9FgSwkC19vHkfeaYL8HpxGp43nS/nfhwwEnyM9/QdR1+laRz/nDs7zSn+gc
         AGNex25ZEDS56EphmsQKbikRe0Nao/0a3PMdrX9fMRqCKw3Z8TS8qqB1p+JI7MctXh9c
         cx1n077Rh0eQiTwzTzXX8hHmkqVhcplsFD1B42NubzSicURwTeXiqayaWb87ktOO0J7f
         qOxYWok4LNcRwb+bjVM2/DXLkXqbQtqhCounM+NIGrgDUOIs0KBcSv5rlXnYSMZiY2kp
         6D4JQKwa3xawxnsr019QFzx9+5EKLvzwwCOowCEkSUG6YvoY2PPCiU8dOod/LROV7V2z
         8zMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784400919; x=1785005719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amhXqSP3saN85/NqS6GeuPvXXhbdKvSiHBtrXRJeyQM=;
        b=RKriK0Kt6miB+Jv3M5dEzKHJ2Ps7rz5mn3MU59ya0RGeOhjttHYzFx4hAwwdO3RrlJ
         4NXt3ITH/H4L2zzZEarupxifMd09LEZ3hQQ6uymKHZX2/Q4jCbqQSiWLZCaSRPNjpf1J
         p+dLbVzvld/t2cyV8uCG5RZykONZ9VkqKQl1UYkjnyk3LZHENMPtHZdMPjE+I6l4gNBE
         +ZaxIbl0Qp0rzuqV7KTBkNKhIVYW/itKlxSJhKZNb1zi1jauIm2ttzpU8Bvw+TZ+00tf
         kdWQGjDw6ZZZjcnvLR4O9jvEAFwPZFgCzp/+zpUKbgLFrNCj66e1qBdRsXqJxsBunXWE
         Zh1A==
X-Gm-Message-State: AOJu0YwQsow/MehObOTAGDEImD0HeNZ5OaKD0KZQCxa9+k4VeHo/xkSZ
	K6hDJ8TXB1yFTof074+mbMVM7X2UijOZA+HFlY92K6JuteZmbswOX7fpsM9VSUi0
X-Gm-Gg: AfdE7cmtGO7LSI0IaSAypWtPgse8hhsBiYAxERhY1hT4rXddYVbyNqLOyqURopM79P2
	ilbki+InHueH+Da55FiHuphaSeKGh3egt/VWWbtnDI54IvOJ70MzR8tnVENvOASIVvFy49TdPb0
	TfHzN6w+M+YtQVEMoBd5kTLXNPtDlkKpz3uR3CwqCC1rjk09FdYtEdyhujZ9IhAMfNKk7+LyebY
	C/MwiZ6mVCQaOhI1+GbP3XEykDpKTWnl5aMHEfFPrCad40+QhBt0Fx95JU4f7k1BPwXvZgBAuOk
	5my71w7MQbCG14FLNqpa3YmyBuvDYmx4VNvl9RuCVd+z5iCDbZVcmQJkfKqxYEnNlktESohl3Ob
	JSxUwhb/wLPm66V1JpcQdEkjyiRH9hiUCNGYK1MU5ylfvTpl+LoXmvJcb3IaebSYBrFeISVlvbj
	cFhwrZwgropfcVuvwPeKo4/GT/+8E0bHobW6WIiaDhqAzOyqnWwayyMFw=
X-Received: by 2002:a17:907:960a:b0:c16:abdc:5605 with SMTP id a640c23a62f3a-c16b46ade56mr314311566b.3.1784400918663;
        Sat, 18 Jul 2026 11:55:18 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1712a5f837sm249151866b.32.2026.07.18.11.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 11:55:18 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH 3/5] staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
Date: Sat, 18 Jul 2026 23:54:43 +0500
Message-ID: <20260718185445.63070-4-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260718185445.63070-1-meatuni001@gmail.com>
References: <20260718185445.63070-1-meatuni001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

rtw_action_frame_parse() takes a frame_len parameter but never
actually checks it before indexing into the frame body:

	const u8 *frame_body = frame + sizeof(struct ieee80211_hdr_3addr);
	...
	c = frame_body[0];
	...
	a = frame_body[1];

frame_body already points 24 bytes (sizeof(struct
ieee80211_hdr_3addr)) into frame, so reading frame_body[0] and
frame_body[1] requires frame_len >= 26. A management action frame
shorter than that (e.g. exactly 24 bytes, the minimum a malicious
peer can send) causes a 1-2 byte out-of-bounds read.

This is reachable from rtw_cfg80211_monitor_if_xmit_entry() and
cfg80211_rtw_mgmt_tx() in ioctl_cfg80211.c, both of which pass
attacker/user-influenced frame buffers and lengths straight through.

Add the missing length check before frame_body is dereferenced.

Fixes: 554c0a3abf216 ("staging: Add rtl8723bs sdio wifi driver")
Cc: stable@vger.kernel.org
Signed-off-by: Muhammad Bilal <meatuni001@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index be374d222c55..e02b54131633 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1145,6 +1145,9 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	u8 c;
 	u8 a = ACT_PUBLIC_MAX;
 
+	if (frame_len < sizeof(struct ieee80211_hdr_3addr) + 2)
+		return false;
+
 	fc = le16_to_cpu(((struct ieee80211_hdr_3addr *)frame)->frame_control);
 
 	if ((fc & (IEEE80211_FCTL_FTYPE | IEEE80211_FCTL_STYPE)) !=
-- 
2.55.0

