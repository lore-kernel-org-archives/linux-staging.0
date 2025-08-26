Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03E3E301460
	for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 10:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756205061; cv=none; b=grEbvGKZpLt0O5FqSysd+FCF0EUk8A327t/F1Ple6G5VwpARD8YkvxMpq1JpgImUGnx4fZao0xUYDeawubswUGS+WYWhHo8ciJgsru2g9wdUEdw5er/ZxcksHgm0ol6yB+rnbNsK6HL3bGsdjd1hodtqHTEZn+kRiV7F9uyaz/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756205061; c=relaxed/simple;
	bh=+zgQX5n/d2mC/6kdAop8Z5+A1NphGNuGv2qbP0kj7Zk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PziHT0VjVmJJa4WhvJMZDARHmILshJa2PBmUE188NZ6otG1Pb847bn/OmitGToLnC2BzYkStQibUooLxkBFH22+FA2tKd9AaAzuDtrsYWAyEtrRCmoKR0/lounqvpYIONsSTVDmuEztoWaH+bfmvfqK/ZO4/ONxmnwM1ENfT1f0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MfeIpr5T; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--abarnas.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MfeIpr5T"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-61c6d735e9bso1555115a12.0
        for <linux-staging@lists.linux.dev>; Tue, 26 Aug 2025 03:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1756205058; x=1756809858; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1d+AuaGuysupl4KsAvy+4lVzdrzPQOBrGdufkysul1k=;
        b=MfeIpr5TtGubXRT3mJPzBQmrqHG18atc6d7Ta2aIZTCp5cHTsDWoCfuXDQtNzXN3PQ
         I2tMr+DgiqZa3iy3rZol28f9TytQqVAAPhT+GcjAkZR8byAI6XtGAaQ0NDhwjDJ5+HPH
         zeF4w9NCjllgiObOnyI/h/4EP/QXrkufXyG/MBfF88nrCVnPvnetPZgEUI/ntU5oWwrX
         4fV4WzgilJV4FwkRZeb5q0qYAtELQzTHvOjsjPY2lpZOx6BCvsRpT5J5+j9/Uy9GW4by
         IQpWJWwFpXgD48J95mJEhrCHthKobz9WeJ2RJlB6785NhKrrot2dcPCAKIUh/et4f/Ez
         ehXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756205058; x=1756809858;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=1d+AuaGuysupl4KsAvy+4lVzdrzPQOBrGdufkysul1k=;
        b=MDgHLrAyE7qreQqJmGAmNsIVJP/VDVZPUQPCc9DuzqlDuKNo8vBbkiBlRoDdcnLo+Q
         nSdp6HTDNhB5v94+bYdBaedH4vwvBwGQ2TUYJBM6sR+vvSaxJm4bqnYLix/VWZ7/2fUo
         ciCYiqdpi10MWnl8jxXdSkf3D8JN9yVRRk+mYnB/stuBKo7UtKFTB0OKLE33lwCjs8LK
         xgXJoW3h5sVtM0MNBQ7P9A/tbcrL7JAeMtxddSOsrAEIitKyFu74uG8BDq6sdMKOZ+i9
         j6/l/vvIUm3cDEdPlFQidoOkweboCfAZIWc4e+OThz6/tkdZXTlaNIT/NsRXyD0WMT/j
         EOyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZ+jdvPoT2UFjz9IuHRBi8B8yDTPRpL7b+KGB/SMLpohT2Xqxi1PHmgAE9jrVda2ENBFK25Zbnuxm1Tnhz@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Q4Nr/KIuj95Yu86prOG13hA0lIgMD6iUxCE72srrCo7Tu096
	jeuFphAlRCTnHNUG0dX1zaKUAxOa0ye5ZmmMF4hWiCKIdwOaCEU7+UnKRC9XzhQlMWGK5x5NNmA
	122U6/bSurQ==
X-Google-Smtp-Source: AGHT+IGW2d5HOG1vvQXD7LSZIWdEs/a8jnStvfjxZvWkliuplh9wjO/ErDhVGp/Da4SncqAtNWjCZrsUKWc4
X-Received: from edben18.prod.google.com ([2002:a05:6402:5292:b0:615:6fff:ecc4])
 (user=abarnas job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:270f:b0:61c:6968:d1a5
 with SMTP id 4fb4d7f45d1cf-61c6968e6b3mr5267129a12.25.1756205058336; Tue, 26
 Aug 2025 03:44:18 -0700 (PDT)
Date: Tue, 26 Aug 2025 10:44:12 +0000
In-Reply-To: <20250826104414.2817514-1-abarnas@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20250826104414.2817514-1-abarnas@google.com>
X-Mailer: git-send-email 2.51.0.261.g7ce5a0a67e-goog
Message-ID: <20250826104414.2817514-2-abarnas@google.com>
Subject: [PATCH 2/4] staging: media: atomisp: Whitespaces style cleanup in fifo_monitor.c
From: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
To: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Andy Shevchenko <andy@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev
Cc: "=?UTF-8?q?Adrian=20Barna=C5=9B?=" <abarnas@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Clean up coding style whitespaces issues in
media/atomisp/pci/hive_isp_css_common/host/fifo_monitor.c.

Fixes include:
 - remove unnecessary line breaks
 - correcting spaces between types and names

Signed-off-by: Adrian Barna=C5=9B <abarnas@google.com>
---
 .../hive_isp_css_common/host/fifo_monitor.c   | 23 ++++++++-----------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fif=
o_monitor.c b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fi=
fo_monitor.c
index c5f78c5cf04c6..76762fc0929cc 100644
--- a/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
+++ b/drivers/staging/media/atomisp/pci/hive_isp_css_common/host/fifo_monit=
or.c
@@ -49,10 +49,9 @@ static inline bool fifo_monitor_status_accept(const fifo=
_monitor_ID_t ID,
 	return (data >> (((port_id * 2) + _hive_str_mon_accept_offset))) & 0x1;
 }
=20
-void fifo_channel_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_channel_t		channel_id,
-    fifo_channel_state_t		*state)
+void fifo_channel_get_state(const fifo_monitor_ID_t ID,
+			    const fifo_channel_t channel_id,
+			    fifo_channel_state_t *state)
 {
 	assert(channel_id < N_FIFO_CHANNEL);
 	assert(state);
@@ -504,12 +503,10 @@ void fifo_channel_get_state(
 	return;
 }
=20
-void fifo_switch_get_state(
-    const fifo_monitor_ID_t		ID,
-    const fifo_switch_t			switch_id,
-    fifo_switch_state_t			*state)
+void fifo_switch_get_state(const fifo_monitor_ID_t ID, const fifo_switch_t=
 switch_id,
+			   fifo_switch_state_t *state)
 {
-	hrt_data		data =3D (hrt_data)-1;
+	hrt_data data =3D (hrt_data)-1;
=20
 	assert(ID =3D=3D FIFO_MONITOR0_ID);
 	assert(switch_id < N_FIFO_SWITCH);
@@ -526,12 +523,10 @@ void fifo_switch_get_state(
 	return;
 }
=20
-void fifo_monitor_get_state(
-    const fifo_monitor_ID_t		ID,
-    fifo_monitor_state_t		*state)
+void fifo_monitor_get_state(const fifo_monitor_ID_t ID, fifo_monitor_state=
_t *state)
 {
-	fifo_channel_t	ch_id;
-	fifo_switch_t	sw_id;
+	fifo_channel_t ch_id;
+	fifo_switch_t sw_id;
=20
 	assert(ID < N_FIFO_MONITOR_ID);
 	assert(state);
--=20
2.51.0.261.g7ce5a0a67e-goog

