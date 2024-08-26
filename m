Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF092913
	for <linux-staging@lists.linux.dev>; Mon, 26 Aug 2024 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724631456; cv=none; b=iJnOQJeCikI44kJp64noHV8JImQ9991dmHOB7HTv0cIGnv6jKcIgT8gIIsbkcKZO+05ph9eKg33FYdjN8tiWA9Ad/NL90vpAR1eWzWPfZyJ+hwmRjZCTFuFEp9G2rbfkR8OxZGZQ6pykEKSC/iY+cgkS+urFU44ZWgrrKmlPgBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724631456; c=relaxed/simple;
	bh=U8Xm/y50TYb27am9v2OHA9PvMfxSVUOSHwJFDd45XuY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=VeU86jCW7U/9d5RKIQSIGqkwhcx5XJ7qKAH1yvcFcD6xE9I0RsYFoK6lLYyqCixxdDjWjbGi2JLSt59grKqRHmwTZBAvkyPNmSdq+FvXrTqV+SFOy+TphVr5GH/73NlXfWN/2G8B7cBqwE7euDLY5mNJejDYWKLiil+k3AOkkNk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=WVGNt3eK; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="WVGNt3eK"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-201cd78c6a3so25300275ad.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Aug 2024 17:17:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1724631454; x=1725236254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yHz7KjczPD5dDFgUNUfs9FbKXGjP2F/Q4jVorZwSFug=;
        b=WVGNt3eKaxSxZ4hKXq9FXRM6G31TWhX1gl0UqGLhgNviVGHX5dBU7yf1VZhgE9VI5q
         ZujEwXbOVNJN7HO6fPOE6uMTyI64xAkrykj091GjeB5EUx18qZvPJYhprc9tMDQVO4JD
         ikOTObga1hE6aIlcjpXdvfH/zuZMu9g1Hco+pj8oR/AnQI0OvcDWpP7d2ytaMBvJx/VP
         bkV9MUiNw+b25nVMJt1HLHi+L5/n5Jk56IyaZkM6yuSobCSuhvcbdaFOw2y3cjdvcMye
         X+A6p/WSQ/emc8U27Swg4FNBbRrS11SRkhzK0q2EiK7JdqkpwztN2jxmeKZ0MZKW8Gau
         f3RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724631454; x=1725236254;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yHz7KjczPD5dDFgUNUfs9FbKXGjP2F/Q4jVorZwSFug=;
        b=TfTlptUpxcaupAw2MeTjGgl9ce4IhOtzb9mGK4SpxQmMezaug2VNc9xrU4IUN9Vrc6
         IRhnhUGpkDCo3Jrb44vCLA7qWCbr1jbWwHL9GAtPF9RxDdeOoXZCZn5wo/62ik4w5n0e
         RfJHFzAv4zVNHZpRsdhE073guYQ42vgXBPz47omi+4JhUfvo2rQcto0WMlUn7+CdYxR4
         Dtv4z+qSpOB2xMb2gdRqZA/HAAWF74X++5VEk/98SLgf/ud8bs5QBJSSErIGFAxkPkz/
         w4O4du4dvrn+pTc6zaWbEJtLzhqhgpR1UfiQqxKO3+1n9X16lEZyx8A2wPY3uOtDdpfu
         d2sw==
X-Gm-Message-State: AOJu0YzqrkkAhNk6Nh2uWicOn7kfTiEKM+IwIjlCGTzuxEZ58UMsPrQn
	7GtbmhSIIYf3oNOoatW72UeujPrkN2OtpSdEPprXmg5iAl31GS9/n9cUe7rTsXc=
X-Google-Smtp-Source: AGHT+IG6BLml6t4Phbdh6hdqMVF+7TfApMh+gCeN/uuPSdC6h7NSSS9hkB+6SojsGJEQDMvkOuGSRw==
X-Received: by 2002:a17:902:e84f:b0:202:3a75:ec89 with SMTP id d9443c01a7336-2039e4cf0d7mr100653765ad.31.1724631454351;
        Sun, 25 Aug 2024 17:17:34 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-203857051b9sm58695955ad.234.2024.08.25.17.17.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Aug 2024 17:17:34 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 6/6] Staging: rtl8192e: Rename variable bCmdOrInit
Date: Sun, 25 Aug 2024 17:17:24 -0700
Message-Id: <20240826001724.274811-7-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240826001724.274811-1-tdavies@darkphysics.net>
References: <20240826001724.274811-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable bCmdOrInit to cmd_or_init
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c    | 2 +-
 drivers/staging/rtl8192e/rtllib.h                 | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
index 8247f22454cd..533cc4e723f6 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_cmdpkt.c
@@ -42,7 +42,7 @@ bool rtl92e_send_cmd_pkt(struct net_device *dev, u32 type, const void *data,
 		memcpy((unsigned char *)(skb->cb), &dev, sizeof(dev));
 		tcb_desc = (struct cb_desc *)(skb->cb + MAX_DEV_ADDR_SIZE);
 		tcb_desc->queue_index = TXCMD_QUEUE;
-		tcb_desc->bCmdOrInit = type;
+		tcb_desc->cmd_or_init = type;
 		tcb_desc->last_ini_pkt = last_ini_pkt;
 
 		if (type == DESC_PACKET_TYPE_NORMAL) {
diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8ca7eb6b8e75..519cad9e1106 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -990,7 +990,7 @@ void  rtl92e_fill_tx_cmd_desc(struct net_device *dev, struct tx_desc_cmd *entry,
 	entry->LINIP = cb_desc->last_ini_pkt;
 	entry->FirstSeg = 1;
 	entry->LastSeg = 1;
-	if (cb_desc->bCmdOrInit == DESC_PACKET_TYPE_INIT) {
+	if (cb_desc->cmd_or_init == DESC_PACKET_TYPE_INIT) {
 		entry->CmdInit = DESC_PACKET_TYPE_INIT;
 	} else {
 		struct tx_desc *entry_tmp = (struct tx_desc *)entry;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index a5ce3d2b8600..7a1a68317a49 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -102,7 +102,7 @@ static inline void *netdev_priv_rsl(struct net_device *dev)
 struct cb_desc {
 	/* Tx Desc Related flags (8-9) */
 	u8 last_ini_pkt:1;
-	u8 bCmdOrInit:1;
+	u8 cmd_or_init:1;
 	u8 tx_dis_rate_fallback:1;
 	u8 tx_use_drv_assinged_rate:1;
 	u8 hw_sec:1;
-- 
2.30.2

