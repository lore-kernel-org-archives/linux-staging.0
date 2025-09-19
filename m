Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24D35322C65
	for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 19:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311777; cv=none; b=Z+wR+y15vyyZEu4FziXEtBefrP8JMNJyxF3Vxt/JqQWDVgCAERcBqsQnVJKB2jEC2HQi1B/H6gDmB2+mbg3WM8xty05TqkhPBVz2kIV/cN8n+UaouNsDwPQLnSDs+mpJObFw4lePLRCdNeX6jBU491gDro5TUPJlLrzgrc9qCCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311777; c=relaxed/simple;
	bh=dDkSkpwtoZrTlkFZMAI0mqnwSlbEy/nA428w4GDe7w8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzDk8ZKtY3CEYq3G2kOyz3FFCl4ssqVcW+PeXCaG8y85x58z/M4Jy5dlYKuGmZl/wxFx1sb28luffYAQyHHJ8BYFpvBNajdx7yVgOwDfytU39cISeuRUtI+GhMJJGdWheAt0OGb0cW/+HrzBrSWCvXORymiaLXXZv7cYmWf0j2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GWB9S7kl; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GWB9S7kl"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45f29dd8490so23798115e9.1
        for <linux-staging@lists.linux.dev>; Fri, 19 Sep 2025 12:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311773; x=1758916573; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPY2Tn2Mb7JuAb06hN2e4t/ofroDDllAnh7eFZOr6yY=;
        b=GWB9S7klpii8zH+jp1FIYI4l08ofY/Dy5hOPmmQS0K3Y7Ad3m8JO9u8tz/cWbU7sZA
         qf65v3ZlVSo6iMMRLyB9zPZQGefCWrdph7c6K9CgFLX2/ukg5iMKa3xRlKkCu884rChf
         dWEfhd3gtPCH1oR29pHWWM7UowfJuQG9fk2unK0ob7kQWOKukax4P2lfPNmCBL/NEMf8
         NGV6yVZ1spCfH9MGtIqepa06SJ8KIAEgLsZ1XhjF2dQ5kLbPWhAp2fYbNLCPVjhEzcdU
         Y4t7TZ8R4jFXrGudcsj2DbouBHSdVqpr+X9+y6sEDliH8oSLMycrH7iQTkg5nVTdJx+6
         UlTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311773; x=1758916573;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPY2Tn2Mb7JuAb06hN2e4t/ofroDDllAnh7eFZOr6yY=;
        b=Tp/NHduJPq9coTCR1/djjDsRItirz16v91tUzenU+CQfjl3/3O37g4Mqd1+Hplyde4
         aJUYVBJMq07d7p3OEVPplKsi5mtTJD5h3hW1t1fcTIDrBV9fl/AQLLVo56f4+IwFcPDY
         ptppEIBmOhRKEhO3oi+BkNNmICQxs83fifFP+lxxC6FQyGBHIMxeO8Z/U918jaYTdHXN
         XUjyo6x8vs+DFXgBDPhWGMes3hnXOIVfbE7YoSnnZIiEsJcmt6HPD30CTagifdrthTaY
         FPNE0fK3L/LsVGPZCLWxPMxD/baBPu14zWcRFT8PYGya3CGd9YwFMOez+7AwiecnqG19
         8CQw==
X-Forwarded-Encrypted: i=1; AJvYcCXMaUpSjp+Gt1aX22fJ942H1Y0qtUSBASeTpoiE1sIeGqr4GiPmUxqkbi9fQmxvstrOEYDe0ScTifuH4VDc@lists.linux.dev
X-Gm-Message-State: AOJu0YziTWSc5X10gQ4anSeDERrV/N2Sb67be2MU7u5ytdPyats+Ae5+
	km518NtYNc4aK3MB5GSOK6h/PTOrc4JNXMNzJeUs783e1LhS0gh2oLVo
X-Gm-Gg: ASbGncuT/t/JATmLkPZ9tSKgCDbAp8AM8AqEBoffx73flhuG797EXD+0zc4qY4u8uLv
	761r9JvJ1W5+7b1IIJ0njL0oT4mcvptD9vgEUJsT2i/RaVf7tT2oUxMuyZOnwYcpgo1A+Eh+tQn
	PFFlSzK5pqedXKHN3N1y9s3x+YYlHimc/nGy2L9EMGP1B/xBC37JB+0Hm6dPpNzDfFkayJ8FWML
	hwkuv8rlofybILO5/IIOnXeUGBmyrIWjKNAURWvgflcjgfZbE+pHBJqgWN19E/8NeOcndBuC9kV
	yamZgwr5cIR8zAR19MdPoLJWlGmyQ0xqM1xYaUP+fOPS6v1zk9y75mwNgdi7N0y+WPmVpZb5ezu
	9KZnzOu+yWSFOh2qj+0b9AsjFqWOZ2dsa7x3uMBk5ulHX
X-Google-Smtp-Source: AGHT+IEgTiTJuz94ag+tJSft9FOBLt7CZgjwjCyLiyY35QFZoa70BQ/zWgPe1wUsBzivSfwUjFP2YA==
X-Received: by 2002:a05:600c:4baa:b0:45f:2962:5ad9 with SMTP id 5b1f17b1804b1-4684c13ebf3mr26459675e9.6.1758311773308;
        Fri, 19 Sep 2025 12:56:13 -0700 (PDT)
Received: from ws-linux01 ([2a02:2f0e:c207:b600:978:f6fa:583e:b091])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-464f162726bsm97025485e9.7.2025.09.19.12.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:56:12 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 6/6] staging: axis-fifo: drop debug print of remapped base address
Date: Fri, 19 Sep 2025 22:54:00 +0300
Message-ID: <20250919195400.3180039-6-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
References: <20250919195400.3180039-1-ovidiu.panait.oss@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The probe function prints the remapped base address with dev_dbg().
This message is not useful and printing kernel addresses is discouraged,
so remove the debug print.

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 881abd61cefd..d15e2bcbcacf 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -594,8 +594,6 @@ static int axis_fifo_probe(struct platform_device *pdev)
 	if (IS_ERR(fifo->base_addr))
 		return PTR_ERR(fifo->base_addr);
 
-	dev_dbg(fifo->dt_device, "remapped memory to 0x%p\n", fifo->base_addr);
-
 	/* ----------------------------
 	 *          init IP
 	 * ----------------------------
-- 
2.50.0

