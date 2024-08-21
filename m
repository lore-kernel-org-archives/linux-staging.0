Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F8615747C
	for <linux-staging@lists.linux.dev>; Wed, 21 Aug 2024 03:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724209745; cv=none; b=oXWkeumvJt07G9WR5qgDYkXitsEdNPGBgjVJjFb/RIY5zNtV7Ee0c+OR7gBimUDHQoabLkrAlBqc/B0n9gZVSwkPtQlmyGZQ4515LLeb4wP/ZThv+giD0fVu2Ka3WzkXexO95QXkd5EQEtEoBgQDhLvGrL6KZ/cSgWAiQ4sDdHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724209745; c=relaxed/simple;
	bh=OgupjbwZxJtwbKs8uwIgnJXa3XgsICYOxW25vliQ/JI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XGf1OsHCZYn/lWnBRbG89N8Xr6rbhnGqEaZXFGKraRIVCNHUQidi6zYbBpj7MbctX8r6JfC9LE3EngifLMjrEi1cBFDkBXVwdZBCc/ELBb9gcWhjIbUe1vEiH07RJ2LgfeqWQ2DQN5EkxPAdEYZJ+NQi0HeuPWfzgzgBmtbFYqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=lIswJnWw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="lIswJnWw"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7105043330aso5037626b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 20 Aug 2024 20:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724209744; x=1724814544; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMswoQdcQDB+68kNQFHdjIqBsXKdVKD5NmR3GsOvbvI=;
        b=lIswJnWwXrLngh+1DqW911ivMUL7M6I57Ap7ldS0YxooEuV2aKb+vwr2lTvCZMgdzq
         bIXVfQrQKSeJ1sDbn/2qTVC1jTgvyJmO2yYKfOx9/XG2CJU7J2UGmusoPP0NiJkW2uP0
         h/xqOdKCHtjksExur5rMXKBletk36V+7qy7mX+fAq0CYvCf1hyCsrD0BJHGtmsmtw+2V
         pOr9QkwNcH0wmoUv/r8mv/OBz5G8ULredrSo6MoiBfLbQ+bvOokKP0n+c9l6fzTItMo8
         f0l9EN9K2+JOyZIg5WB6igOiAhwchYWPSg65r7NTqGVTOleKbdPiyP5QbpnePGKVib0Q
         b2QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724209744; x=1724814544;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMswoQdcQDB+68kNQFHdjIqBsXKdVKD5NmR3GsOvbvI=;
        b=v50VrJlkVOglzRJgdFvr+phxle/yqZAIbGRC/eTXOkZmgP8lYpb64qFvUuIaD4MrX4
         rpXaf+VLbmk1FvREhat/VAQCFzHZktVpUe6g3wZPVrS0/cZdmCayLiCBsacKDvppDG6j
         qpwoKf79O34tErP4S9gnLCqRMGPLcg0vLu43QyhcbydR2PFtWPtQUDeVWBa+KoOhm1VR
         WuWFLf4gxD/yGzzjAx/JZ712nx/UZCadIOSVHLbFp9csErJ5jeWeF3n5BY0Av0HulWj0
         rrNPrwjHSyeYwF00Mint5CnHw7UxiVaLBqFgufU+e4vHQ/ATOhCgYW2cgzjwGPshqmRd
         eOvA==
X-Gm-Message-State: AOJu0Yx2xY2qaS/WcAkX9lqmG/1Vzs9fau/2AFU003t9KZIfQKGe864r
	pgmjTguxHP3q4F/wKeRM3X1hiuuZ9SMifqAsd8E/9gye0xem9Q20B9wzF9PVn6w=
X-Google-Smtp-Source: AGHT+IEacPOhcvQcCJ0bbOFyFdborzVEZdw5GH+A7eKbynNMSnx4cscTCzOKbeAk6wNWl+ekKes5OQ==
X-Received: by 2002:a05:6a00:1788:b0:713:e3f9:b58e with SMTP id d2e1a72fcca58-714234b1550mr1460422b3a.17.1724209743649;
        Tue, 20 Aug 2024 20:09:03 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7127add75dbsm8934404b3a.44.2024.08.20.20.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 20:09:03 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/6] Staging: rtl8192e: Rename variable CmdID_WritePortUlong
Date: Tue, 20 Aug 2024 20:08:54 -0700
Message-Id: <20240821030856.57423-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240821030856.57423-1-tdavies@darkphysics.net>
References: <20240821030856.57423-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable CmdID_WritePortUlong to cmd_id_write_port_ulong
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e82e992dd139..8a1aac7e10a2 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -616,7 +616,7 @@ static u8 _rtl92e_phy_switch_channel_step(struct net_device *dev, u8 channel,
 					_rtl92e_set_tx_power_level(dev,
 								   channel);
 				break;
-			case CmdID_WritePortUlong:
+			case cmd_id_write_port_ulong:
 				rtl92e_writel(dev, CurrentCmd->Para1,
 					      CurrentCmd->Para2);
 				break;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0eaca4be4f15..65b2929b7bc4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -156,7 +156,7 @@ enum sw_chnl_cmd_id {
 	cmd_id_end,
 	cmd_id_set_tx_power_level,
 	cmd_id_bbreg_write10,
-	CmdID_WritePortUlong,
+	cmd_id_write_port_ulong,
 	CmdID_WritePortUshort,
 	CmdID_WritePortUchar,
 	CmdID_RF_WriteReg,
-- 
2.30.2

