Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794204756;
	b=O4V3BHtPgtXWE1lpWjC6QCYBzLAANymbsy4zabTUMD3sJeFV02lRUjQ+MkEaM6K0IY0B
	 IrjSIZvgq9C2oUdcnQqFBlCqiutmDLTl5szwe4nu5iSBag8o7YJvKNxea2t/Y6SKf5uAo
	 EOSB49OaDE05DJnsywb3HgLmdQT03j9ScbNuZ6m0zWw+mbW5O0do9azvvhnNug+OwCaru
	 OpmijgbxXXdDMMZAzvfBtSbTBBRIG/l/vPSSbaxT8eFxtXozzVjNhtTWIb+Wop/qMyBuB
	 mVNB/mmguN6KDJpan8FXiyPa3L2qbOJeje/UlYsbOTUVsCmaQ+AmX3XdIblWBXnYhDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794204756;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
	b=D9QpEncchjEQPxNU7o0Vc3Nf82t76syHVHgkiK+/PU10UNkE1hjOcv6cFnxaVq7BGSHG
	 S40bf2c0sa/GtTpcc2G2LWU6iz9oNsKzO5c76bYZAAgyDru1ttVndPnqO6u6Zo7Ih7wbF
	 zd/KlMUSj0XVQcT4cqhguHCceWz0P50MqMQDDg0nC9WxGqCr+AoFzTb+et+tsFeofmZkY
	 QfYdK1WhU6Huv3+YT/H7U3zFuTeBozapadc5e1QXvIUWqYbrFUFHGwsE5H6ZJaY/vTqRv
	 xYgPkp7nGBufGnfvIk1TEWl1+BeyZ5vpX0hpnZpgmVTVTiIm2HydXrjZXo8UeEglBVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLd0clmY;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95291606A322
	for <linux-staging@lists.linux.dev>; Mon,  9 Nov 2026 06:12:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95291606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=lLd0clmY
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-36e99cf7bb3so936646eec.0
        for <linux-staging@lists.linux.dev>; Sun, 08 Nov 2026 22:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794204756; x=1794809556; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=lLd0clmYzHmGIfIQQEkaB5NXx9CcP02GRGYBvWokhxBNPqiTNq+pk6Raoa+6qjno5W
         r23OUKQu2vNGx6L8eqqugUibI4XoDES0IsQVkob8BCvnY8nsqVoinceXUABOSU4ovqWL
         hGOZfgk3PAE5K/hDLRlmWUb0XBirWSocB/4/c737I1wG+ewnapiZOlPn7YrM2YBPeWAe
         LY6VY5fHYQ5Kr0PxrdjDcrWhhXuwlXgPnC8rPEXyOv7biSXfX7yJyFMnjQ+I8QmPZkSG
         IHajixPmoZP1b5a6PVkeQ+SKcFSPKbGbmI/bPxbQFo+lS9j+op9DbBBHx2DTXUY7jPdp
         wEow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794204756; x=1794809556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1UcMxn0eRaSO2tdKlZvKawz2XVhbWZCZbyW9cb8JhqU=;
        b=YXHHVoHaF0cd2qHUeNglEzjHcMJuq3PxH8BE/9svq+PrZg6tB2Qsdak76scAr1b1Tf
         0oyir1UCvQOxfnS5IVt6p2/PY6s/CwsUk18bTtVTjSCsTMvq3og96Grwxj1qTsVv2WD6
         5D0hDoZ4zCe03GWm+VGUMTq9n53OUEboJt8J30Rde5CqkPUiE906U18ynzb7AY5BrA7y
         GRpFbvteycfGBmJfrIgks13hkqjMtRLR3XBdRJ5qWKeNYHOqkOZNC40s3ilIpB7xajDY
         zfEBHhVpHVMjY6lZDPsoQVmV8Hf5xPDNdnx3T7Mw5v4wtT7ljs9sovUPaaLkkMKuou/9
         z7jQ==
X-Forwarded-Encrypted: i=1; AL+hErGinSt3NqveudUSz77jOA1f7Xj0z/HYQjpb8W/pvkBLfxdFRR/76lDJ/pJjLUwKJ3/A82WYoxN4Mq1WZk4Z@lists.linux.dev
X-Gm-Message-State: APuU4Z9Dt/y7XsD1WASyPRBmbw5CRCc1bT0vDg/X/hUahecsQEZgOIQ/
	05I0yodATSKOF4gYezeD1HsS9TbE3+x1nOTL9d4WWj8zg7QvTykfejXk
X-Gm-Gg: AYBFou2w8FtTBAMLYKLcZTL9bQvQQfxApzbvMTV32qKxSziaKAuyrby+tw/TGr+Fhw+
	DThA62UAbJmaTkXAXKsTryfwGLeV9nTIJqX0nHBLh7hAY9ew8f6/TlgQ4Uu6qhb+AvvhrmvAuLA
	AbJ2Vpo8Y66F/+gVrHxACBr64LVGt3nfhC55/IsfI/NKZFrV4ybpR2gjCTY4X7swO6F3vIHhOMY
	HijqrtnuOKYDicRbsgcge758Fj5T/pEMcljiaKdJFi0oKyZ0eP85xdko9zzLzCoFZD9PNiMlSjU
	W9oJuU/vVBu23pTxcLFXmmQAQZ4P33OforNFxVnP6pnS93U/NOnt1kRHZvnb48cD51aO1VYZWPN
	cd4WXsUyYJW9c97zwXUIEj7SbPpuD/yW0dIsAcCua5WR4Pbs7xyk+ZpDgLOpjieRuQZMsz0MC7D
	pwsLhNAEuDaHF1KmZh647bITEW/Zj9jT7yMvirEDPpk4UP0jSf1jf0h/ah54oiUu/8QzQX2BPtO
	6yc8xC0AIbpmEgt7SgEgQ4TdRh1UZYEmwbdQEZsbNkVWrmQ6mAFyL0IvpOy/eEJkFUDt2OMi05Z
	3Ib4ErROf4WqDsPO4kg/ShCLBCIjB2PgIVL03w03g9C6DpaNbqYEtqs1UG5JJQB8CZWoyQ/GD46
	V0ezsBWQRNK2Xpgu26pEOJbnoh3gw5mC6zw==
X-Received: by 2002:a05:7300:d20b:b0:36a:7b3c:4e0a with SMTP id 5a478bee46e88-372571d7f02mr4839228eec.24.1794204755480;
        Sun, 08 Nov 2026 22:12:35 -0800 (PST)
Received: from codespaces-88e7e5.mimvmn1ww3huhhjmzljqefhnig.rx.internal.cloudapp.net ([4.240.39.203])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37265a16c49sm9835409eec.10.2026.11.08.22.12.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 22:12:34 -0800 (PST)
From: Lame Morupisi <lamemorupisi12@gmail.com>
To: hansg@kernel.org
Cc: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	andy@kernel.org,
	gregkh@linuxfoundation.org,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Lame Morupisi <lamemorupisi12@gmail.com>
Subject: [PATCH v2] staging: media: atomisp: Clarify MIPI frame layout comment
Date: Mon,  9 Nov 2026 06:12:23 +0000
Message-ID: <20261109061223.17144-1-lamemorupisi12@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261108122840.85622-1-lamemorupisi12@gmail.com>
References: <20261108122840.85622-1-lamemorupisi12@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clarify the description of the MIPI frame memory layout by
explaining the meaning of optional fields and payload words.

Leave the frame layout diagram unchanged to preserve its
existing representation.

Signed-off-by: Lame Morupisi <lamemorupisi12@gmail.com>
---
 drivers/staging/media/atomisp/pci/sh_css_mipi.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/sh_css_mipi.c b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
index 971b685cd..09c2b1286 100644
--- a/drivers/staging/media/atomisp/pci/sh_css_mipi.c
+++ b/drivers/staging/media/atomisp/pci/sh_css_mipi.c
@@ -130,7 +130,8 @@ ia_css_mipi_frame_calculate_size(const unsigned int width,
 		even_line_bytes = odd_line_bytes;
 	}
 
-	/*  a frame represented in memory:  ()- optional; data - payload words.
+	/* Frame representation in memory: () denotes optional fields;
+	 * data denotes payload words.
 	*  addr		0	1	2	3	4	5	6	7:
 	*  first	SOF	(SOL)	PACK_H	data	data	data	data	data
 	*		data	data	data	data	data	data	data	data
-- 
2.56.0

