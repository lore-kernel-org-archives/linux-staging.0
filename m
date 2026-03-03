Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43374377001
	for <linux-staging@lists.linux.dev>; Tue,  3 Mar 2026 07:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772523816; cv=none; b=ct1LjJJK0GOu8efBYEa98FG9nyVrDd69C3cDdVJjI30d9/N7WIejOaw4kCl49PSczJXMxAQYjMOfiKMjWkyeAkrW1s0MPczB91B21QGPvAjqp8ET2XZyXVioB1AgqfJstquxIb05CLzui92YIfQ6u1WwmaXM+h18ih+0uv4oSDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772523816; c=relaxed/simple;
	bh=Yz1+AEutUDTekHQrKImpqFd+mGgUhoDDRRVLQ/eeEKk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qQDmHoG4Sl6+sUetWB6F5D6R8SUYiR2qHCYv21s43uZ8B81gB6Mlyd/IW49pseINOinPpMkUTZxmwiP1BPwkr7tZsotNS0rH46w+DOoBsvCkmp9qwr6QUnd3WTZ30RqwsB0SsCboGVbD1se/ehENb+59hfavWP8oB1vTI68Lgg8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cu7Sl9mY; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cu7Sl9mY"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-3598e7155bbso1220002a91.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Mar 2026 23:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772523814; x=1773128614; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Tzi5okh4ZKztKgz4cUZFXAgl/qLuS+vAFF1Q7OA1qTo=;
        b=Cu7Sl9mYf+UJDn/IaNnIfUfWMRUHT7p52GVjAMTRDluGhOXQK81bc/txeVaGn8dExK
         jVXzJkGxlglNNJfUJIpvagvQrj5ir9/tELICYkAyx59CV+sxDALibFUhy3Nc20+9fmhv
         fmLqSAGatuRP/CUaA8nE0Jgjs1XsEEMWcaNbe12LZlR9sktLL51tsnoZdRc+wkGFHTWs
         PVTMeVJGpfJdF73YZ9db21E3AEF1Z2TwtR+ZicyeEa6ZMcydrmTK9/wUBpXxi39NQJKD
         x9vVGslAuj3vc4oZQHb0pnUYRuzG3kbR3xrERPkyHfEN3n1eH5zi0PyxW3nYFngrP3U4
         uORg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772523814; x=1773128614;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tzi5okh4ZKztKgz4cUZFXAgl/qLuS+vAFF1Q7OA1qTo=;
        b=r75KIPWC2N15NKAgnSIWXtrHx/9rcuAdZqdYPBEg2Nefv7AvWps8iqkhErgD5ak93g
         AyVIB9osIZWn9Ayi2VwlNlbgD57WHDD6hdlgvPEH9p12+6s2FkufZXndNBO7adQWG42s
         NBuJAb7IdNz/lc1yN1pr2wbLaTJwjgNu+VgAMk6XIUBYjoWbSWTQxS1vFuYlAOaemFyz
         +r0ZSwotQG87dj3nm55wjjX99PtYtpsBdVYDcTuMMX7JjmhLCDjeglnjecVKjUMOLSgP
         SOdzkXjc8gBL//kaxxVBaPOvv8Q9CgGmNkiNQsZf+bhddNdRMh9PZaj/gS1g94WZ+ALt
         XAqg==
X-Gm-Message-State: AOJu0YxXYjxh2cRJbLwcBY5vb6poQDwfWMKLrFmk+4a4pd50OjVeBr8v
	2sQ5g3alauChlKRjDPtSNDGUuOiVC9X0pjV+j+4f6j4Fpc6gx9MvJdZE
X-Gm-Gg: ATEYQzwiT+qe3BT2irpZ/ipxufV5IEGTWWLMNO4fXdWMICwko73YGgJlvoG+hlGcM3l
	XAlxfLQFQg4UKfjNyI//E+OmhU3yXFk09MURVyyH2YejucprMq0w5pbNpTNEQ7YYME3jlgsCM5L
	O12m0sq12v3b7vXPJ37h20deRlMVfv5c6dOYSCw9ksQnp9EzgBIznqTfZMEuaf1LuX1kI6rqOUp
	WyJ04nngKSWJzrEl7sBSSprl3KTSIjqIc4eS8TLbAeWIpTyJKfW8I8SANfU1cSnNd7In4vGay82
	w6tEKYSj7DjzDKJ8ZYp/fE6L6upTlz1EeRYbRjfhJNeNsAui0x2KnwKIh2PBCr85LHiK5D5EQnL
	3ktiGiJRExeVXPdhNqovJarofgtimBZrRzAGAR5b5crOGCl/QPgFLpmt9sC/nI6qTkwijseL56W
	iLFsWftE5C79HSrcUDxPiiZaW70Fe3acSH9FU=
X-Received: by 2002:a17:90b:3c10:b0:359:9158:7459 with SMTP id 98e67ed59e1d1-359915875a0mr4850715a91.0.1772523814450;
        Mon, 02 Mar 2026 23:43:34 -0800 (PST)
Received: from mx-instance-int ([47.15.229.246])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c49eb5bsm1315716a91.11.2026.03.02.23.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 23:43:33 -0800 (PST)
From: Yash Mehla <yashmehla688@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yash Mehla <yashmehla688@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep(10) with usleep_range()
Date: Tue,  3 Mar 2026 13:11:24 +0530
Message-ID: <20260303074124.25536-1-yashmehla688@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

msleep() should not be used for delays shorter than 20 ms.
Replace msleep(10) with usleep_range(10000, 20000) and include
<linux/delay.h> for the declaration.

Signed-off-by: Yash Mehla <yashmehla688@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8ae..7818e8819 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 20000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.53.0

