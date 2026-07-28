Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F25D342A783
	for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 12:55:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785243317; cv=none; b=SqW73NW12lInK6b2ko57FUi8KbidVx/Af225sNdHyLKFAXzjMF3PEHJJt3Twd3WNC3+TDeOsZgToK0qEIo3p7dUyQl+ouKILbSNmoZvFI+oTn7VoWGQHXkeqPN2F5L7KGK6G04nGdWXPtw0AB3ThfJv+zCWaHquLsH3Ib87vPgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785243317; c=relaxed/simple;
	bh=7igi6JgfyV7UtI5KhWMltwcUSiXutkp84qo2icc/bR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fAnStIBPj3U1cJZJeewIrWx16qisyYTdyjxG32WZtpvUovU1XXAUYgbri8HUDhe9T1VaqO5k/2UD+x2mq7VtnLfhqsqM0eDb7P35Fu6NS7G6ZrReJduyFs8QJBZ7bI7HNgmXqnF2yh+2GU4nRgz8O+SLmqIUWMy3LjnAfN9Ze0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L7TYJb12; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L7TYJb12"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955158f26aso24642215e9.3
        for <linux-staging@lists.linux.dev>; Tue, 28 Jul 2026 05:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785243314; x=1785848114; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=amhXqSP3saN85/NqS6GeuPvXXhbdKvSiHBtrXRJeyQM=;
        b=L7TYJb126MMJEANgVfjH7N176SRMYIxHs+pwlSUUjYkKWKemG254co9LCWnGDZuND4
         XJN0pB887ZUC8/3jPaNlOOyPiOzVRpqiqzCe8ysqjfxiuWcwEYKeicz2U0gKgDLXuqEG
         lr945Ev2eetCwwy6gc4YlWc1PtFrYxwbdqoZbh8Owhfcu/h+dCOdSz8FUsD37mxZI/yo
         S/UFl4GvH100O6iHWHiQhsJhQi70xrgnIY/IQANwhO49JtxSiltkmjvKFxJhsSsvmX65
         ARhZbG/84W2/tLq3vTv/zYGEPNoOYuL41faWCL8UVn2kEtzzfqWk5lp8FFS/l0v/fDgM
         RL9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785243314; x=1785848114;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=amhXqSP3saN85/NqS6GeuPvXXhbdKvSiHBtrXRJeyQM=;
        b=fTwierUlGF+ZtO1uQw0v2rQ937Y7A+IAnZpmi2RjZ0c7Itn+sj/cJP+7s0j65wwZJL
         gpRz+iG2BkT9kAKWgBDZZiIBLN/pdrgwNG7fc1CcylUrJ3F5TqBr9uLXNnnz45asnN1O
         7f0HKAInS80JKEPHJJpDh+IemGiWnxNWqewtznCSl8svVv1tjP4/m/20J7LWXw3xLhSN
         nlyPS+SI0Uh5e8fjNUaO6jTysAzo2WqaLJ3psSJTMzM0m4kOTu7FDtTH/uakTPf1FDTk
         js4N1EWdlLfx6skTaMB9YasN+M3xdIOAOmGIBlexQNlSrrUphHMQZbVsaiYWywk+kyFO
         iv+Q==
X-Gm-Message-State: AOJu0Ywfdm6Jby4XJJWrcRV1BLaVdMBOogAceIub/uf7M5Nw/5aDAVHU
	QKJn4btLGM7E9cCCdZfIY1Jw5aAojw5Y4NRVv9SDkdOpi7omvvJI7BTH2Q1vbbJdp7I=
X-Gm-Gg: AR+sD13bAE1BKyYrlM7l4AwJirMaLWQBKrvPfKxhbalfg6T8/C/Sz5cb0yeqQTfN45U
	7LC+W6tFuuW1zETkk8gCAUuiAm+FwJQWsm9Xj3ss5Yk+JOS3wo8mkH6K7zdMZzXBbCtY/Rezt2U
	LZKOieX4V35Oqy/U61IRer2SYJIYc4wpoj6F305WW64lJlkCQimVCzgP43zRTTI7WopVaTcy9X+
	WBUgUiIyjITa1NKzVedSHwTp5kQg4SN291qNd4+4pHgW9NbugOz8e+EHx0Znjui/OuW2TJig+Bl
	ohA9/R9h+Iy3yxEHIzaDiHsFiIfqGOt2zEz3IzKGDW0yLlHrGPpN7EV/dWVgaevQrhUOU3ZTg7U
	LOmoV17QRWHHI/WEe2DNw69JjEpCyM0L3xJSvvuDO+J7BWSxu2VgOb53XMy0msQLIHLNmjx5oCy
	npn+2GgJRFZ/aGCX49kMMM2ej0mjWUnr4EdoSY+47hE20O02jqEN+3jW6i8dNQR5Q1bw==
X-Received: by 2002:a05:600c:6986:b0:495:3aac:1098 with SMTP id 5b1f17b1804b1-496c6591311mr27027405e9.32.1785243314092;
        Tue, 28 Jul 2026 05:55:14 -0700 (PDT)
Received: from fedora ([202.47.63.86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-496c444304esm74096505e9.0.2026.07.28.05.55.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 05:55:13 -0700 (PDT)
From: Muhammad Bilal <meatuni001@gmail.com>
To: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	stable@vger.kernel.org,
	Muhammad Bilal <meatuni001@gmail.com>
Subject: [PATCH v2 2/3] staging: rtl8723bs: fix OOB read in rtw_action_frame_parse()
Date: Tue, 28 Jul 2026 17:54:55 +0500
Message-ID: <20260728125456.32359-3-meatuni001@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260728125456.32359-1-meatuni001@gmail.com>
References: <20260728125456.32359-1-meatuni001@gmail.com>
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

