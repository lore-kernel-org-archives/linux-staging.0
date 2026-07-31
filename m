Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C031233954
	for <linux-staging@lists.linux.dev>; Fri, 31 Jul 2026 00:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785456115; cv=none; b=CUFKaSJncdzD82SJkyPJL0sPykdeqTeBROi3kOGtpLA1xsvMMY5cCYMYKeKRPHYphNY8ynSSPt0J6sMvbzvir39vdhAIzgtLz//ek459Fsbiw8X8oIv3s8vmScB8boJIKFkXrjvzXPX3XWMrpMmT+2ZfueBBFAgyic7a3jSNlWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785456115; c=relaxed/simple;
	bh=9ZRwQjPCaizQ4bN+gZRfSXmYVFs2bqgBTDrFloTFsnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=h+UbL3xvBJkVHfwJoyVAJxtxNOmB5aKHb2UB6qh0hM0afWQ97D+bcH0hp1GtThOp0W/yu9JnC2r4luLk6QHDRaze6ySZDm4hxdSd7ryNUK265wyLzBXQ/ngsV6F2PXi8x6UoDP2oyvnwimD7C9N0EwdkVWX3OFP9qRh7Xd30JSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJDbSfsB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJDbSfsB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2ceb096e675so4675005ad.0
        for <linux-staging@lists.linux.dev>; Thu, 30 Jul 2026 17:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785456113; x=1786060913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=nE9dZ9awcdUrGQCJeMJn5hlWnAUsMViLR5JL6xcAB4k=;
        b=MJDbSfsB+EHIuaKrV8TmbeLGuaf+VFRkOw/Dml/re2DeMETQGOGIK7L22ViTFNKgA2
         Bebs0Ls/bAvMQK3AiwZ/KZnnVTNAHL7WH6DXutgc25FmezylsBUp0QbO6unIJCijyFsM
         QsjtbitjHdVzLJQfSQnfhuJmGnuXmVmZLRJTlqElcOUecIPFTHldUnQberTxTXTlkyYo
         46beMka4aQd/RuybycN4BLPh2CghGRHoJ0/sZREkG0h1moIQqKLy4OU7vlUhh5qKyjdZ
         1P88gshfWMzjxtwLShyEMrBwbZLnBSnrBP4skvNKXVMLy0Ar49y/6P7EXpoxv7AM6xPu
         li+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785456113; x=1786060913;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nE9dZ9awcdUrGQCJeMJn5hlWnAUsMViLR5JL6xcAB4k=;
        b=iRW0uvjiCbf/TQizwstNhGlmA+oMTphFqE9jEAku0UMX9UPbm1PHYjbe4TDfC28d6H
         DdoVm7PGDo9Rxfh+YussI/FillJZbpDjKWgt/TBw72JrJxK7AkmUBzrdbnwgWxQ6T4ta
         L0OM7fsBx+2iwm5EbiU4v9ukBA4O1FOlWhI5XAfjKkTHqmX9WO+58VsRSpLfYOOj6Qjc
         7u4XPNqekjFLJCgQqvspP0xbhz/pOlTW4bgXvYXeVPndNdZqMa6zl0MNTv98aaFWe6G0
         zXp5GwM/2lot2gyoiDwA8jUbSVpZAX9YDq9yQSm2eK2b8FNfGFLrPb+DRJJUwvIIKGhL
         azFQ==
X-Forwarded-Encrypted: i=1; AHgh+RoBXEDKK8AbbDhzC5g3XiKDrECj2Z22dE69c1Eov/J7lHQ/PHUDRH+ngai1rHtAT+vc7o7dflhsc1zf3SRa@lists.linux.dev
X-Gm-Message-State: AOJu0Yyty+yRi41rbkyV5oaIhgbVebwu9zdbI5i/aVgp/LONYitdUkSR
	kb2tJMqmNPQ+PlOPodCoTJpIlGYFDwLkowFQSvHmRPIMPXgOckbrEGSh
X-Gm-Gg: AR+sD109hst5Me3dvhOIRAsJym0pqInkTtCNKdv80VQ1oipJbUi0ICuzrMsoDTORh8c
	fpjiscauGRgPXbCflsG61xzmdSnVOA+nMg+IWiwulDSpv4w+PXXfLBWS5Erdpwv2wgdxdgtbX31
	LFUhJghWYAfAsZSEB59nB312LtoO2OfxYk+FeqAMjsTzwkjTMSGSG849lCK2bG9Vo3gIYSZ9OZJ
	u5IBc1lDOTkS/6nML5/btlyjPBqYdiIwTWcmxqTBy7eP1jxgbVlk02lXtI15HsbjfrX8yV2Yltc
	AaswlgkJ/li+sOdzxinqaTR9K3ygdJTQwfoJaAt2a8hSIbHsKWKPvwNfHE1uNRuDtiSN1z7Jdou
	+zpIbi8QwstmhJSSXH1TXr6nKzdEQ6ffFrxAdRzYc+gNg4SF0Ab/Ticg1HNNFz93DaFy+rpPW7V
	lO4Ev5QZMnbOlamu5X0CGgggpRT4wb1N/iLJVpEZMSsvDNEPrPxNQlcx3J5tttkWPHy3UE6Nbg8
	NuCQOt7HhO7cVOcWcDKxSKBXBxFw9AsQU/Qtu/aGT3cglb1nWcp3uG/36FSQG/XFe/kQhR2
X-Received: by 2002:a17:902:f60f:b0:2ce:e75f:b713 with SMTP id d9443c01a7336-2d046e8688cmr128935ad.23.1785456113179;
        Thu, 30 Jul 2026 17:01:53 -0700 (PDT)
Received: from bloom.localdomain ([2604:3d09:178e:e100::6868])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d022bf39cdsm33069015ad.55.2026.07.30.17.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 17:01:52 -0700 (PDT)
From: Ivy Lopez <skunkolee@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Ovidiu Panait <ovidiu.panait.oss@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ivy Lopez <skunkolee@gmail.com>
Subject: [PATCH] staging: axis-fifo: validate tx_fifo_depth from device tree
Date: Thu, 30 Jul 2026 18:01:36 -0600
Message-ID: <20260731000136.96707-1-skunkolee@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

tx_fifo_depth is read from the "xlnx,tx-fifo-depth" device tree
property with no lower-bound check. It is later used in
axis_fifo_write() as (fifo->tx_fifo_depth - 4), an unsigned
subtraction, to bound the size of writes accepted from userspace.
If tx_fifo_depth is less than 4, this subtraction underflows,
defeating the check that exists specifically to prevent a
'Transmit Packet Overrun Error' requiring a reset of the TX
circuit to recover.

Reject tx_fifo_depth values below 4 at parse time, consistent
with the existing validation of the tdata-width properties in
the same function.

Signed-off-by: Ivy Lopez <skunkolee@gmail.com>
---
 drivers/staging/axis-fifo/axis-fifo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/staging/axis-fifo/axis-fifo.c b/drivers/staging/axis-fifo/axis-fifo.c
index 3aa2aa870ea9..66845f919375 100644
--- a/drivers/staging/axis-fifo/axis-fifo.c
+++ b/drivers/staging/axis-fifo/axis-fifo.c
@@ -413,6 +413,8 @@ static int axis_fifo_parse_dt(struct axis_fifo *fifo)
 				   &fifo->tx_fifo_depth);
 	if (ret)
 		return ret;
+	if (fifo->tx_fifo_depth < 4)
+		return -EINVAL;
 
 	ret = of_property_read_u32(node, "xlnx,use-rx-data",
 				   &fifo->has_rx_fifo);
-- 
2.55.0

