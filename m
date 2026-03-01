Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C163317169
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 21:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772401722; cv=none; b=jRY/CZeDnk/7mVrhToDcvO3Gi1x62Xc8XKuQobtjzIYsUmZQcAsFjxoTfQRWAvHot7xfHypA6xyK+MTPrJqseTQHPadwCs8UhmWC1Cg8csO8BDpq6J5CHMxF9YNtvV58GhhjSWgsLbx32oOvsP/R+G6m5mQdbGKt2spetZp81Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772401722; c=relaxed/simple;
	bh=lW/mkx2vACArB2sTuZKI0zjzBNqCR7VnKMR6hwmJO1I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kJ2dltCGBHAZUNx4/WnOkXNaZq58PeOCvxKgGuJoh1JKYUGYS1SqtQouv4YISW4ThRshrI74rOpHp2bJm7HKu4TjKtGuk5N+mlxLVHhcBzBXErpFe3uP1/bJEvGPfH8WBxY+tQ8w55W/RHzb2YTbNalPdu0yyIbJnck92yqF2ag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoJR+hGx; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoJR+hGx"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-899a5cb04f9so49844306d6.2
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 13:48:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772401713; x=1773006513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TBBLSV4AWNmKnxg+io3XidW2g81aHafZMIfnXiFjmPY=;
        b=BoJR+hGx4vZKaMG3BmIn4AOE8ZhhpRZqM1AG4i+OTeVtbMJRH2pxLE/yTnwNIWFTkn
         rJrmW7kqXMrgrgCD7jH32Ray0+zBuXDe9TRvP8S8hxWYDfz/taizLCtj0h6J+OQ3FdCI
         LdMW3QN5ixw9bfPCJnQDUIF4KuZ85RaXrAlQQRhUMGWAPlO2C19kYIOnANxoYheJ2ZMC
         oW0GUdGdxvz0Qkp7hWvgXKHPZIq5mfftrxuXVW1q949p8BvcMqAYyhOMOiG1ZV9ovWj4
         yhNtmBfXjXN4ZSYj54TAdDcB4SXfRQbIwVOy97j5AxnSKDE1G9V7OMbtcs39plDgQUxc
         pBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772401713; x=1773006513;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TBBLSV4AWNmKnxg+io3XidW2g81aHafZMIfnXiFjmPY=;
        b=VwiPO6l6wcCemgtFGuTo8w86NKvrLVusljofw4ZFa6/GrRW72Y3sRxvkYcbpxLXoUg
         mslqtIWPt6rJWBDJYoFj6zTtGpzwhFNSkdCAr9/982Y0a1eAlPkgKhly5EAuHhdydCrN
         B7JOCXVkUKyCg9XcKLwXsW9GstELkMgQiEBNwShJIjKy0uFb0xYG67c4ocE93LaT3m50
         QtDSjE52GIfa5h6pxh4kT8Hz/OyhCbQGJwjrjnhYGddVqJjJGi4ufUNmcP/R5Fz4vQ4J
         RlznBOuxMKN5a3747Axc4ZWT6GidbNfCdu+LeVg18n4YtpSN62oufeL32d/EAyoKGymh
         wFYA==
X-Forwarded-Encrypted: i=1; AJvYcCWL6KrB6ORYmFsHzAEU1DoeERrbp+/q8hIRAQ5NzHkoViqjT/43wxwN8ZYz/sFZH7l03+dyzQ+bC8JH2B2+@lists.linux.dev
X-Gm-Message-State: AOJu0YxoT+5oI6tGt645vf5q6P+2fyDM9x4HX52BvlvC0T1gGZ4yfFx7
	LFRazGif2dTTErhdwrnZZKcp6bsKJ8Jju3tysMXEMBAS4WGNLNBbYdBI
X-Gm-Gg: ATEYQzzhhA1dMp52JLrNfxBMgVGMr1bLNJPxlRVGBepi9+oTvLk/xGj4cwEWEZS5ZRY
	Hc6DegoDLjh/PXj6sKsJG00GZtZVbpEDTFgsXAfzPptDtmPH0sTdd6GWcxL5vhx3X95NIZl1k1l
	i3Qezq/fkAu1sQtzpvMcJ9Ble7zdodD33K5gkxg7WqMUM1bSleOL5BoEOc2roRZUIDvbPfWe1hw
	pZXiotinj3zFT/ApzGiVEDSBdQM01VSSlsIj8jo1ptSc0H+T1XjIoQAFjllmRtem3bxXNBuwbOi
	ICOB9NCmPEGMhGrwNkuF1F2cAyvkHS5AQb/8tdY8sl7BT5jQHvm0RUEs5jhiJGZxSx8I5QMAg7w
	Ir3zgIvAG/dD3HMpvye/PWDjWDFpaDqBZ9o2DeLXwS2rxF65YRUYiNBZ2eHgRjESovNSbgiALDn
	+XkSOvAXB1dp+xTS3dXdtJiL5SMPcg6RGeVrXRqO97H1VJTpIv77OYEOIO+8RXGvHkYuXYRi0os
	n+U
X-Received: by 2002:ad4:5947:0:b0:899:f929:d85b with SMTP id 6a1803df08f44-899f929ddc8mr24850906d6.61.1772401713605;
        Sun, 01 Mar 2026 13:48:33 -0800 (PST)
Received: from instance-20260207-1316.vcn12250046.oraclevcn.com ([150.136.248.187])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf6f948dsm1006700085a.30.2026.03.01.13.48.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 13:48:33 -0800 (PST)
From: Josh Law <hlcj1234567@gmail.com>
X-Google-Original-From: Josh Law <objecting@objecting.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Cc: Gabriel Shahrouzi <gshahrouzi@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Josh Law <objecting@objecting.org>
Subject: [PATCH v2 10/10] staging: axis-fifo: simplify error returns in axis_fifo_parse_dt()
Date: Sun,  1 Mar 2026 21:48:15 +0000
Message-ID: <20260301214815.2628942-10-objecting@objecting.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260301214815.2628942-1-objecting@objecting.org>
References: <20260301214815.2628942-1-objecting@objecting.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Josh Law <objecting@objecting.org>

Replace redundant 'ret = -EIO; return ret;' patterns with direct
'return -EIO;' statements, and change the final 'return ret;' to
'return 0;' since success is the only path that reaches it.

Signed-off-by: Josh Law <objecting@objecting.org>
---
 drivers/staging/axis-fifo/axis-fifo.c | 20 +++++++-------------
 1 file changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 7ca0404b0875..9aeb16d8a71f 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -403,8 +403,7 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-rxd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,axi-str-txd-tdata-width",
@@ -414,43 +413,38 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 		return ret;
 	} else if (value != 32) {
 		dev_err(fifo->dt_device, "xlnx,axi-str-txd-tdata-width only supports 32 bits\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,rx-fifo-depth",
 				   &fifo->rx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,rx-fifo-depth property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,tx-fifo-depth",
 				   &fifo->tx_fifo_depth);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,tx-fifo-depth property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-rx-data property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
 	ret = of_property_read_u32(node, "xlnx,use-tx-data",
 				   &fifo->has_tx_fifo);
 	if (ret) {
 		dev_err(fifo->dt_device, "missing xlnx,use-tx-data property\n");
-		ret = -EIO;
-		return ret;
+		return -EIO;
 	}
 
-	return ret;
+	return 0;
 }
 
 static int axis_fifo_probe(struct platform_device *pdev)
-- 
2.43.0

