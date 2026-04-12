Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA3FA2C11D6
	for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 16:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776011787; cv=none; b=cxq5Z7e1bCrWFaO4GOo+BUVn5oOGW2quL4pFG6sHVcgAJ7UHxMK0aCS5F1lDsfCd+G9BCKZxO9UA+EGidtQo0LNFS4oPkR6cVWPrfk59qIwZhV9+sb/8ABd0XNHY8TN1q8mP2nT7E/Qyqar8qu5m47bAafnWgGnqRCD/lEGubbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776011787; c=relaxed/simple;
	bh=QrDJhhk0twAoCgQb0RphuWTv0vbxFxQEpBvzjFSkNow=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=SIc7K6QrqDs0nDNepE3Rvh4slspq2Zu5YAgPp3pk9OteHU4KR0wjNkNsH+CahuuEUQ6BoPBPghXBnUree6oe0i/AGuT5RpfwtkMS6EWWMu+9Fbf7OK913uS+zbfcyMPmde+DDvpg/fniOB8EoIJQ/Jpi5j1PGTqPw+k6LpYWvro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cQc+zONa; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cQc+zONa"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-1273349c56bso4663805c88.0
        for <linux-staging@lists.linux.dev>; Sun, 12 Apr 2026 09:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776011786; x=1776616586; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=cQc+zONao2x9yngM01qZcDAesw/6xsw4WlFiLRNa/0SYoxnq+Q2xcRHbBWgXCLBCZq
         rTc2Na1e0m4j+sba64AWNYAkB++fTl94RMCR32kWuqILlt/6cNNiJjWvmWLsSOoJ9v/i
         hJJam6Ot1XdVf/1XdIgtqr9yPF84Of7EnLkSdVAyIp5eK65aMseMfnDhSqs7r+0pjwCw
         OhbmcTps08aIBTyrhzf8q8d83DNuVtgTNHltz4i0MbpLzZAOBt5/uXk6rJS3iwrp8sfx
         UHQifGiiWY/Q43bu1DVKyR49UdeFOrr8ERKlnTmCB+4s69LxEdppNDR2CkLbUTFaphOX
         GXFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776011786; x=1776616586;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9Q7XW5fCWd+W/KHOAvk90/HILYyws38daEBVyb/sVw=;
        b=P2TDtQVzySP75K3LvzyDDLndgt9tJGL+lnE8eJL5hrIMC/K3Y4LleN2nVt/FCuFQWH
         XJDbVcLapqfoji8p9WlTC/oLEClxwZ3fAwJFrAZvQmTOGNL2PqmA5KLXPPNuHDMv5vDG
         CwTvp40wpbVeRlinspjbAgEaK0gwSfLy4iCfebZLcuLzUrS0tVpa+mPzm8fqgfB10OBA
         P9NqGeIdPCFCFnI/F06d8/GFSej9gWPRwLkzIxQqPX+0Jer/4oAX6LdrCbB+b/jxW6ED
         yPDpycEKU3ldDrLTnhVuPy+jpMweiluNoYVM47eKGicKmfyhDidI3Z/4tGpst/8MVZZK
         fNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+vARdciuqMgE2LbN4z69O29rA8fxHKzQBb8uDNnNY3hR7pyhfBzlh0/S6N1v7B2MVdsTxpZrzWDvVcAeB@lists.linux.dev
X-Gm-Message-State: AOJu0YxMDSzECmwwfA6+PUtw6byw8IXQkJHKuo+mpAhXyH8VhNXs2Yfw
	UPrMaLeXiyaIr0j9FC+EzCkInEO6fYChVdQWc9Ph44QKh7IqwBMLTnIg
X-Gm-Gg: AeBDietrcJr/qxLWg99VLuH7mfFnlmzIPovIDyXAHupo9Efp7VskUuhvmeLg4pKzMVG
	vvT3Ejy0HAM/MwHgB6FresGL6+wJxacmGU92iyOOGC25goUhi8d6HTUNX06gXZquPIsX9BV4dfk
	vS2FOKW2hW/kmrE20rytl3WYroZgENAIM/mj8FZ3h6wHigDtqNgYzY0sNWnuhp5iUNMX67T6BjV
	vO4F7hZ11ww1UyPo82fslWCgS/sH6rjIcqIVcdxUdPVZOiBDICTjnUenrKqB4WgsDxrzenFer8x
	G9yS+SjT6ef0LLCxOuL3iTqPIOtGzm7ydDlG6ghnWB5oo7Nek7KFL8razVfuwc3FrAiMkMrZwRv
	4I0sRX5N1YfSTt3MYXG5ElkViy40+1GuxnOtxQAJTLM7pJwvLbvjG/PBqkF8bP/mjnHOWiuO7Sc
	GDqP7aqtA9nekkv8wOAPEzHzVogcQxKNw1vwYJlrRl5KrTBiORWtZgyNU=
X-Received: by 2002:a05:7022:6a9:b0:123:3488:899f with SMTP id a92af1059eb24-12c34f14188mr5695800c88.32.1776011785777;
        Sun, 12 Apr 2026 09:36:25 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c34acb077sm10201730c88.6.2026.04.12.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 09:36:24 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	skomatineni@nvidia.com,
	luca.ceresoli@bootlin.com
Cc: mchehab@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH] media: tegra-video: tegra210: ensure PHY is disabled in pg_mode stop path
Date: Sun, 12 Apr 2026 16:36:00 +0000
Message-Id: <20260412163600.29925-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tegra210_csi_port_start_streaming() enables the CSI PHY regardless
of pg_mode, but tegra210_csi_port_stop_streaming() skips disabling
the PHY when pg_mode is set due to an early return.

Remove the early return so that the PHY disable path is always
executed, ensuring consistent teardown.

Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/media/tegra-video/tegra210.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/staging/media/tegra-video/tegra210.c b/drivers/staging/media/tegra-video/tegra210.c
index da99f19a39e7..57b5da11da93 100644
--- a/drivers/staging/media/tegra-video/tegra210.c
+++ b/drivers/staging/media/tegra-video/tegra210.c
@@ -1095,11 +1095,9 @@ tegra210_csi_port_stop_streaming(struct tegra_csi_channel *csi_chan, u8 portno)
 		 (0xf << CSI_PP_START_MARKER_FRAME_MAX_OFFSET) |
 		 CSI_PP_DISABLE);
 
-	if (csi_chan->pg_mode) {
+	if (csi_chan->pg_mode)
 		tpg_write(csi, portno, TEGRA_CSI_PATTERN_GENERATOR_CTRL,
 			  PG_DISABLE);
-		return;
-	}
 
 	if (csi_chan->numlanes == 4) {
 		csi_write(csi, portno, TEGRA_CSI_PHY_CIL_COMMAND,
-- 
2.34.1

