Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D092E6CC8
	for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779632623; cv=none; b=Lh20SlYsK87iBt5X0e06WxpojW6Jm3dCjQGHXP2DQRYnuXec61jcpvbU9KuJMzIgXC/oo4fDGRE8Qaxtvt7/y0OgG5Uq1PD6/MpznuOgoSTFvaoSweRvun75W6BquORUh5eEAmBwg4ldIO8284Z8AYjs2rH5srySNzSm/+6sCUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779632623; c=relaxed/simple;
	bh=Ods/E3IYPVbZXtOinZg9MlcY7QUO6JuDhbUi2reXwrw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JAkYZDCwwtMsI+Ru6fInO/V9lHcLW1tvCpByYOemze0M6gyLxPmkyXxpybGJjyc0ia3rcIM872cxHepcnsHbFnc2XHadvE3CDO+2rim5LIsA7TFhvrQlJcT+klwmupvygAR/pF2ieafoRKQPXN4gOev3TEBF6px7eyyjIQZ0Kzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ThFb503F; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ThFb503F"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bab82d75fdso43899465ad.2
        for <linux-staging@lists.linux.dev>; Sun, 24 May 2026 07:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779632621; x=1780237421; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aATl1PBfk9VOOTSSn92eYyNDuSPnM7YddHpNswQCo0Y=;
        b=ThFb503FjqNyoqDyTaXdrs+BHKbw+/Ihwgld8l5b4hw+AyPBr/XyB7ezeRRM09h1j8
         C5n1ny8VrrN0TsECy/qRV5EMpE7zxlmF21ad/dVjSOnkF4Oi9zRgSPiqwEOdW/Y1jC1V
         MpyUVe26Buy1x0NamWjoCYBhhKLoSDPm9D2b/eaL/Jsdfj1Xw9YV7mZxs9NrWTsWCdHl
         c/mmINZ8l3ZI2s1M/q7zc9WKLVTD64Ra24KGumYxXhXm1S0bbBiyxiMW7RzDLGZ811Uv
         2i5Jct/p1vrRga8JSh6/p29BnGnsjccCFVm2PGrTqkUwAr9oYoD9+uMbp3h5IakkE0Gg
         VVFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779632621; x=1780237421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aATl1PBfk9VOOTSSn92eYyNDuSPnM7YddHpNswQCo0Y=;
        b=gzKaS92lfsFpTNETwVqVz27c+fJG9M701K48nbKIAb2Z1UHmxlTSI16fh48tAnPphc
         oTjnXC+n9mkXwdL8MF0nbXt48Vfxp2koOMKACemEpUeJluqtrCFABhWNBbJBtYP/RiYt
         Wc37GCwQuK+kkLW1eCtGrPacQI3NwiuaUO6fgqlogkPb3MMfq0AirdJcZ0tqhSS4ZHLr
         dKfmab6nJ3wM4WFkzlIoNItij3EWuQbKehUA5MniAwHW8500jhq/ByHYnAbcPGwHd9yf
         hT7HSbJ9DvNvhQeTu+mrhBGHOe0uWZKVo9Q44gz+J+X5whlfJtpUGoZYdf0OtzBfby7r
         ZHug==
X-Gm-Message-State: AOJu0YzKaa4sEisbiTC1QNnDgmbIw/f3tBA4mlhndESvJZLmNe0CaDGK
	i1u7FvkyQnvpOJJGGKegX7sZ4ytg8fvZlpLV1LY8sOwTveP3yOrrVDRl
X-Gm-Gg: Acq92OG2nnbgMxO6AqGhywe737wlhAHdwir5qqvi9Y5hfQUWPaxkiLNPcTc+0BUV8Ez
	KoHgLpkINfuKF6NdRnt04DV3nS7nt9ow8XF4aCNzfn7gvsyTKCUG3ktM2fq0XlMERhbq15lT3Og
	fOyMI0SuQQHCrX2O0sbhp2r4wbtd28hrhizqVVU/DXSW0AIUhcvotaJ+Zc6G0zUcbqhuXMKIPmH
	VH2ORtu1toQGnhXdMf3JubMmfbwbmI1sJuVA6PHywugr0Xrd180yFWIbeoBzUPEmB3DUUr7zpVK
	4kbtJQiC8W0TwROn1pvaSfxoztkXtRKZ6QCA/fQTvdu+CaHoaBF4LeOjnkZKtGgfFnXUiFZ4tFA
	09Q6CDQXK52W4lNIqAKR1zEocGUBrzFoUj+q7MPoZUBi0xg8/Z4RN8s6Hl1yOmg3KJawVyl9hRw
	jRNH0LKgWKEy+nGsiwKURSJXTM33A/
X-Received: by 2002:a17:902:cf0e:b0:2bd:ba87:40a1 with SMTP id d9443c01a7336-2beb07ffc75mr121530695ad.29.1779632621400;
        Sun, 24 May 2026 07:23:41 -0700 (PDT)
Received: from grand ([2401:4900:1c6f:a535:c48a:f219:d7bf:1717])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58d9fe9sm67133535ad.65.2026.05.24.07.23.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 May 2026 07:23:40 -0700 (PDT)
From: Anirban Bose <boses156@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anirban Bose <boses156@gmail.com>
Subject: [PATCH] staging: rtl8723bs: rename camelcase variable bAllow
Date: Sun, 24 May 2026 19:53:09 +0530
Message-ID: <20260524142309.88007-1-boses156@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the local variable 'bAllow' to 'allow' in rtw_cmd_filter() to fix
 a checkpatch CamelCase warning.

Signed-off-by: Anirban Bose <boses156@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..aa4a810d8322 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -299,12 +299,12 @@ void rtw_free_cmd_priv(struct	cmd_priv *pcmdpriv)
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj);
 int rtw_cmd_filter(struct cmd_priv *pcmdpriv, struct cmd_obj *cmd_obj)
 {
-	u8 bAllow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
+	u8 allow = false; /* set to true to allow enqueuing cmd when hw_init_completed is false */
 
 	if (cmd_obj->cmdcode == GEN_CMD_CODE(_SetChannelPlan))
-		bAllow = true;
+		allow = true;
 
-	if ((!pcmdpriv->padapter->hw_init_completed && !bAllow) ||
+	if ((!pcmdpriv->padapter->hw_init_completed && !allow) ||
 	    !atomic_read(&pcmdpriv->cmdthd_running))	/* com_thread not running */
 		return _FAIL;
 
-- 
2.54.0

