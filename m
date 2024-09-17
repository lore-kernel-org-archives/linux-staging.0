Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0094B14A60C
	for <linux-staging@lists.linux.dev>; Tue, 17 Sep 2024 05:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726551123; cv=none; b=ZvIRwgkoPxlkCs1t19o4G7GiB1kisA0WZmAw/R96NcfM9MENSv2bzxKxBfNgw5kuSORixGzIdvVbSv0U/LKaDU55YhlzEmUKj2VzjGh6AVkKXE6inAXYbyguhWt+OLxcFaWum2olYMB3lyD7uVu+PPDK4wxZokLTrXI4ViSFIio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726551123; c=relaxed/simple;
	bh=sZKvR71ldawsze0JADOPuPZo2EgNqxkqX5a28FxyXJg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RoXE7HO+2fR7Xq0Bdoj3DXfBK7OGEMb4AVaP7MCYAQq45E/nzpON3J4Ei0r3lTWjMZMx/p/Uk/V/lwIjM+zCP6nI8cqZCu5AaIB6iN9nExPHOYGokiReoXWZt/ocpxkU2qcv65pby/xLICcoQszuDoBncsjOoD1WvO34rPdEqpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net; spf=pass smtp.mailfrom=darkphysics.net; dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b=Iy+ffoDw; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Iy+ffoDw"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-7191df6b5f5so3653433b3a.0
        for <linux-staging@lists.linux.dev>; Mon, 16 Sep 2024 22:32:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1726551121; x=1727155921; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pue5cYUVUdCVtWaMNLqOU5DyP6NH1weXbYhUzVPJXbo=;
        b=Iy+ffoDw9MgNUb3dUlUNQhnKUZ4sCE+iBXz1QhXT5BqsTPa+Qry64YWfP3i5OzN+cX
         S0laJ/FzauMWX2PaaKWokPRPiRwM4Dhx7Cp6/ahUWj87v8i3PBiS06SvFRs7EcH4Y9dn
         SzYMk4vq+KeBUg+p9fCPBT9CCXwz2/eKym6z0hMJloCZhpf7HeoCS3gy95QXP6i+ZtoY
         qK0ZRZY81VBaA+Atxc25mdBXY82NzA7ZIcXcLkQsQCBfEIXQtxpxxZxErMJjas92H1r2
         01KcdREq6uU8DcIoAOr/9xLkOsQuCuZAs0YQRRNZxMKMYgmgiaWY752U1qrkZPkeCveZ
         +2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726551121; x=1727155921;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pue5cYUVUdCVtWaMNLqOU5DyP6NH1weXbYhUzVPJXbo=;
        b=oWNPTV4aw5dkNa6kXRsKkFRxg2ghb+68uzp7dopY6DzR1zG8hTKtV9X1iopGLgMNDW
         MJMMlXArnr/iJfdUJyVQuk1RKUu5S119aRIOfFUfLWb+5DWRlvfKUGwtVsC+0JT9xyX5
         NC88swCsFpyr8zDGn9+1CZBI+5tP+qRJeEdXty4aS9RzHu97UPZsaEyvQ/rBMzp3Pgpe
         8QZ6FfOJqxa6brpZJX7NnDTLzRNK49gq5fzVqaFrWfPZyxjIZblkbKeK8aVdaseluqED
         +THrqFm4SZTtYBIf6lKselUh5/9aQ8WEXXsc8XgDsUtgvAWaJnkZwbboKRiAIGYG+QEA
         9CTQ==
X-Gm-Message-State: AOJu0YyKkbdwCK3ONaNEPdYL/B563HoAb+GMULm1SND/VnTTezuDjX0u
	aysfnt0/xzbvuKW0E8OGiNAsvsn0HB13Xr2WX5XDiS0+UUB1JzlQ4w+em5imDRE=
X-Google-Smtp-Source: AGHT+IH5imF1uaZ/NVYxBzjkFnbv4gJE+ngHUSuhcwjMjG06uQ0wy3S0dV8vfB8JzEj1Hz4kqRYfJQ==
X-Received: by 2002:a05:6a21:38f:b0:1d2:bbfc:774b with SMTP id adf61e73a8af0-1d2bbfc7bfbmr12305115637.37.1726551121245;
        Mon, 16 Sep 2024 22:32:01 -0700 (PDT)
Received: from lunchbox.darkphysics (c-73-83-183-190.hsd1.wa.comcast.net. [73.83.183.190])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db498e0607sm4392328a12.8.2024.09.16.22.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Sep 2024 22:32:00 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 08/18] Staging: rtl8192e: Rename variable FwRWRF
Date: Mon, 16 Sep 2024 22:31:42 -0700
Message-Id: <20240917053152.575553-9-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20240917053152.575553-1-tdavies@darkphysics.net>
References: <20240917053152.575553-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable FwRWRF to fw_rw_rf
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c | 2 +-
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c     | 2 +-
 drivers/staging/rtl8192e/rtllib.h              | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
index 8d645d3296d2..003343e75f0c 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_dev.c
@@ -613,7 +613,7 @@ bool rtl92e_start_adapter(struct net_device *dev)
 		priv->rtllib->rf_off_reason = 0;
 	}
 
-	if (priv->rtllib->FwRWRF)
+	if (priv->rtllib->fw_rw_rf)
 		priv->rf_mode = RF_OP_By_FW;
 	else
 		priv->rf_mode = RF_OP_By_SW_3wire;
diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index e9ca5a8768ad..c19522885d41 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -747,7 +747,7 @@ static void _rtl92e_dm_init_tx_power_tracking_thermal(struct net_device *dev)
 {
 	struct r8192_priv *priv = rtllib_priv(dev);
 
-	if (priv->rtllib->FwRWRF)
+	if (priv->rtllib->fw_rw_rf)
 		priv->btxpower_tracking = true;
 	else
 		priv->btxpower_tracking = false;
diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index c6a9cc0b2760..5db03fe9269d 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -1371,7 +1371,7 @@ struct rtllib_device {
 	enum fsync_state fsync_state;
 	bool		bis_any_nonbepkts;
 	struct bandwidth_autoswitch bandwidth_auto_switch;
-	bool FwRWRF;
+	bool fw_rw_rf;
 
 	struct rt_link_detect link_detect_info;
 	bool is_aggregate_frame;
-- 
2.30.2

