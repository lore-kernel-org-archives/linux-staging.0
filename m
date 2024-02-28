Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A91C24A07
	for <linux-staging@lists.linux.dev>; Wed, 28 Feb 2024 07:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709105178; cv=none; b=Ai4cRruH5kIrtRd5zF9TeJXjqUK6o7CHhj/mSRf3agnsNi0eMDQXetFVloeSRwlZH6Crm4H1klp7+io8pMpAHIvec4iQgfD0kbu0sksITBdszSmpN9KD6ifkHYxKcxaPBxDVS9Ye+1edBWTOQcqMon+H2kvNdrBJCADAbf8JvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709105178; c=relaxed/simple;
	bh=asjFfwYuPjymOdYYLQoZSQr0W4mVkOPufOpRClHRK74=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BZp6l5ZhVXVJRdbUayR+yZU21c73OWELgjbRz9/mYc9Tia0G0iGmNd0JeqkJBPNS5iRXGIp40mV+3Yo6gDAjSx+xZjVV46BKGq4D+O+0RbhsCXqrsKc8j4N7ojn+I7cX4fX2laoywRbe1i+NTyFex04LiKxOaVz3KnRA+kOCAfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TfE4Nc7T; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TfE4Nc7T"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-412b68d1a42so2905e9.0
        for <linux-staging@lists.linux.dev>; Tue, 27 Feb 2024 23:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709105175; x=1709709975; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=O4qmpRXQDJZ+dKyhU210IX58ZV5gg5CCPG3QCEGwT80=;
        b=TfE4Nc7Td0PX33crOH2nR7P/U8PhdFHc5pGtNcOn+tLwg1JEObtFf3EE6SfCN1y9++
         Pac8kHMldS09lOqJKxkYWMGTc0NWQskPFqCBure48jNMRSaQ3n4GWeLy/KzX5+1Le5fS
         lgeUwrhjgVHFc4upU92BPV6c7fPDIJNkROUtfV7kbrETaSBnOHBBVKeD4k6X4YePOGcN
         7vNXyLoImGdcPTbja/ST1XZENj81SL6eDJ/RqXQGgn4A3ZjOzOMxZK21JdfnpFkhiYKy
         amfs+zG8c5TOZXF8hlLQ4v/0a5rYJwFUHo8d4b1Ip4z/tTcxvhJNrFeWvpMxdnx5z1TS
         6bFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709105175; x=1709709975;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4qmpRXQDJZ+dKyhU210IX58ZV5gg5CCPG3QCEGwT80=;
        b=q+iTVDdJdU6/Ad+QWHGlt/OMoXeMGtI+pHHK5p8jzB0tyYcj/bgAUGWFohngcUItIv
         q4QoZNslkWUW0fjo3Mnyh+4hOpObLjyGqM0ht6bl2VxQm0qTuBmFFMgB6+t+ZZNVeztZ
         MZgzIBlN76qlGf1zldpuvtcEtABuIw1+O0k3ODbceeLDlFeCXjdODRmXVFfttDtC7ea2
         x9WBSTmlMrlNayjoo/iQkSav7IaOL1vov7UsveM14z7mBspbX88+8DBjvjugIgJ9v6dg
         4sfnwrNAYBXewI56HvWntfKnBiSPeEojXOk96O/g51qwuT/MJv5KHS5htWbogWVmfYJw
         g/RQ==
X-Gm-Message-State: AOJu0Yz3MBj1r1OVz82kD3UpquERggWmcsdAG/Gi7rQnRqkq3vW+CiP/
	K/onZ4JgMO+naYuP6xY5rJAh8An0cu0oTbKoTLpl+KOo006FabP6
X-Google-Smtp-Source: AGHT+IGqgAcMdec3GgCn6K3wUoxK78jFOqYzkRWw+67awvXsZwIBcMadsUraraDWAGDT9sIxLJKbrQ==
X-Received: by 2002:a05:600c:a0b:b0:412:892c:7eea with SMTP id z11-20020a05600c0a0b00b00412892c7eeamr8674264wmp.37.1709105175155;
        Tue, 27 Feb 2024 23:26:15 -0800 (PST)
Received: from ubuntu2004.cynet.local (vpn1382.cynet.com. [84.110.53.106])
        by smtp.gmail.com with ESMTPSA id n2-20020a05600c4f8200b00412b56aa46bsm663566wmq.13.2024.02.27.23.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 23:26:14 -0800 (PST)
From: Ariel Silver <arielsilver77@gmail.com>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	yogi.kernel@gmail.com,
	dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	garyrookard@fastmail.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ariel Silver <arielsilver77@gmail.com>
Subject: [PATCH] Staging: rtl8192e: Sparse warning regarding variable declaration
Date: Wed, 28 Feb 2024 09:25:53 +0200
Message-Id: <20240228072553.11740-1-arielsilver77@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed sparse warning: "'dm_rx_path_sel_table' was not declared. Should it be static?"
As dm_rx_path_sel_table is used only in rtl_dm.c it should be static.

Signed-off-by: Ariel Silver <arielsilver77@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
index 92143c50c149..850ee6ae1f02 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_dm.c
@@ -144,7 +144,7 @@ const u8 dm_cck_tx_bb_gain_ch14[CCK_TX_BB_GAIN_TABLE_LEN][8] = {
 /*------------------------Define global variable-----------------------------*/
 struct dig_t dm_digtable;
 
-struct drx_path_sel dm_rx_path_sel_table;
+static struct drx_path_sel dm_rx_path_sel_table;
 /*------------------------Define global variable-----------------------------*/
 
 
-- 
2.25.1

