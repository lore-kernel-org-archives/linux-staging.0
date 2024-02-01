Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77416158D8A
	for <linux-staging@lists.linux.dev>; Thu,  1 Feb 2024 08:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706775526; cv=none; b=WvQ0qmvNA84WYjgfZ1D4LY65ApiMxz4VPn1loUrktTkcqAxCexfPfJ30hE1ZujBZIzOfgAoU9o3Z/gaPY0Ff2yE7e/0XVItYG4JkAxo+kr0NRqOxfZ5yqVczmci1xNvWr9nsgYCVuImUYETLb4usQ55pqEUc+l5j5aAOdguVIjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706775526; c=relaxed/simple;
	bh=FETEX9eqmzzdwsflyz/twcnhehtjGEh191nHrECpPkg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oyFNUyH+Jfz4dG6jRqOXutDFQE8u6xaqqyh8nLC8uQ7Qw6IR9p8hbqdnnNa2wQlfvCY2xNgM22aS5+KPOx+A+AlI2EvzTsNItXelWio7lYy9nm2Rs2qbdBBn4b4yZD9lxWaZcICcJGGZ4cpBN9lVhPjkcWg8Jb4ab6xa4Np/fYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B297kp3H; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B297kp3H"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a366ad7ad45so65949266b.3
        for <linux-staging@lists.linux.dev>; Thu, 01 Feb 2024 00:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706775523; x=1707380323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OOlyK86/Jl9rG4TqRWXLT9mehwaragdtILIuDCfPgVU=;
        b=B297kp3HF4q/V4L/FeNrrKQHtEDyvxhdgPECyAl9jmA7FFPH5Uhp+s2iFpTSKDO2uV
         NOG5CmCfWrlGxcrLEu6Ac0NG+oR0xMbBiM/BV/q0KYm5Hu8f2HQsXmUcc9Fh7nNJQHwF
         1G3nnoXDuwL76I5hJVMUCAQkapwBYLpElyDD4tnN8GjZcGL8N/BETQEfJdIKW/ePrfvj
         vNIL1W3nCxD3gN5IBfXCgRLSZDsxml+byCuzNDaPPLfFELmDAdxaXGeunCc6koVYOYNg
         ULS4wrO2PDWQ4RVbkrv72xMIA2+pVgZfPde24BWEv29A2ae8SWRPR3E6IVL+BN9Hm/bh
         JGow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706775523; x=1707380323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OOlyK86/Jl9rG4TqRWXLT9mehwaragdtILIuDCfPgVU=;
        b=U9FHx9yWUl9OG8PpCPbVkO0zxBA6ioJNEw5g3uW3XKUW5cq/rZz5Yv/6X4Zoq8RfyH
         o6KmICciGYO7HlVJ+DSpfHhUbWDRrExdi8H1gjHhZwj+fnbQpvyA9DDdmez4ih/pTWiC
         lynNK9b0kc4ufCq2O537S9IHUY0r4bGkGnlfQaFpjXJoPcNBuOkFwTpnp7dvRzcv6zxN
         Ws5r4eW5t3QgYLntFX5IktCi1hQNaQRYWfhnxk31Pq5AYphAeTZF3wj5taValLBmlTIn
         cSa1a1fIThl7aB24758hCfNPov5tua7ioJeSt/UdvxNZfen5o7CLsNp2pbEFRiNT0//M
         6DOQ==
X-Gm-Message-State: AOJu0YyEjmJWLGSjVCsDxPz4t/HBf4NxSBknCo7NNKVQMZDrV7/Jl5ea
	fxYNT1oKBwY9kS44N6Wf4rXKN5U1y314GmxmEcszwztmA4AT9oFs
X-Google-Smtp-Source: AGHT+IF0DhWGDbjBvEh7CKTzLrlHoDnGtWXn+a9/CbtlYL68LP6YIumtsg3AmOrxZ96DJvfC8AF+cw==
X-Received: by 2002:a17:906:4f84:b0:a36:6dc6:d9c7 with SMTP id o4-20020a1709064f8400b00a366dc6d9c7mr2625892eju.4.1706775522544;
        Thu, 01 Feb 2024 00:18:42 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXWJSrbehShnkDAJ8GlYl5l8hM1r2LrNh5MxK8BEZPmjmmDhtv++WPsuj6qw2GT5UyL7FAznpseI0+qqFtGrVnv0tpPxEEsmd9o33fDFBtVkyqLyofTO2K76H8+YQmHvzf/uflqdWEPb9oFySBHNFA8tvN3AkTM+/lUNbQiqMV4D50UApM=
Received: from localhost.localdomain (ip-77-25-34-59.web.vodafone.de. [77.25.34.59])
        by smtp.gmail.com with ESMTPSA id p7-20020a170906784700b00a310f2b4b91sm6954069ejm.48.2024.02.01.00.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 00:18:42 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: rtl8192e: remove return from void function rtl92e_set_channel
Date: Thu,  1 Feb 2024 09:18:23 +0100
Message-ID: <20240201081824.6998-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240201081824.6998-1-straube.linux@gmail.com>
References: <20240201081824.6998-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove return from the void function rtl92e_set_channel.
Found by checkpatch.

WARNING: void function return statements are not generally useful

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
index e1bd4d67e862..18b948d4d86d 100644
--- a/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
+++ b/drivers/staging/rtl8192e/rtl8192e/r8192E_phy.c
@@ -714,7 +714,6 @@ void rtl92e_set_channel(struct net_device *dev, u8 channel)
 	if (priv->up)
 		_rtl92e_phy_switch_channel_work_item(dev);
 	priv->sw_chnl_in_progress = false;
-	return;
 }
 
 static void _rtl92e_cck_tx_power_track_bw_switch_tssi(struct net_device *dev)
-- 
2.43.0

