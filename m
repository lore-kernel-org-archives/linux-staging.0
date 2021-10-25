Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC1F2CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:16 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id 84-20020a1c0457000000b003232b0f78f8so13408579wme.0
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=FoRrI/ixSraN3mS0iMWX+7EoDluMijUSgMuujW8zXZ4=;
        b=PN/or73n3nh1F/9Pw6w9aWByTFLQTjikp+yPEd7f1yb/zsVtGMfkOwui8zVJf3Ngl5
         /37yVh2f2AsKX5cTVXIIU6s08JP/5Iz7etrT05h5eHNm4FTd4qwMn+8ELiaeP2YY6ZJ2
         euP0c+3V3FOpEXJUghbCWWzHX0fX5NMqVxQ/T6xvL8wVtqgZNFY4Zdcnh+L1iam4bQJD
         fbumAf99RCRfSXos0bhVtw0y8becFmJDrO2+C0FKUZbT6vYqRGQKqbk7BG1/ODkjz4pt
         x6HyA9bReXaDWjxvqIFwvHQrSIHrW8l0sDbha4QGn9VXMEECCDG4irvfnP7YbzO19Jlw
         +GBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=FoRrI/ixSraN3mS0iMWX+7EoDluMijUSgMuujW8zXZ4=;
        b=a1DHg6qvtArQUzIcwkJ/iLVdPS8h62J6lzt7+v4VqRmeTUPCwlN/ksbQMT5iR/tXkS
         nUChzxHidMppyxGS6FyHUM3zV1MxlR/2pkIMFtUFRjFphaBFarY/3bp1kIU/X7qbH9N0
         RUuN/UW+PSiInT2+4mzLH4xzw2aThcofA3WrS4NmxZwhT/HPOtX2NV0N8BPBOtfAR+YV
         8tECcNk4ZEEox/CYADv3s+vgYyzylmom10t5mEdW1GAgxkUCDmrh7uKXdQIoAIPW92gE
         xAbOz5vb5aGjZjWOeAMoSLMqP3QdBYXs9e3xmiyAa0AviU0ibzX39dUDKCftR2I1oD11
         DkXg==
X-Gm-Message-State: AOAM532janpBoVAwpNE2fEOOWosr5iMoDj+dAep61cEEsPGolvLbvenC
	cVxTaEA1ogBLjnCLMtw8H7d2aBKPme005w==
X-Google-Smtp-Source: ABdhPJyvcpHWsUahunSfKfyOrdfCHAj3AazZh8hXbyCTJQAtavFC40AYvhCXwoNC54IPhErVenBDLQ==
X-Received: by 2002:a05:600c:22d3:: with SMTP id 19mr15179803wmg.85.1635172334641;
        Mon, 25 Oct 2021 07:32:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:14 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 2/8] staging: vt6655: Rename `dwAL2230ChannelTable1` array
Date: Mon, 25 Oct 2021 15:31:28 +0100
Message-Id: <18e1857c02edd1dbc81ef7e5b00e42e7cbce4710.1635171518.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635171518.git.karolinadrobnik@gmail.com>
References: <cover.1635171518.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To align with the kernel coding style, remove the type from
the variable name and do not use CamelCase.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <dwAL2230ChannelTable1>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index bd6927151120..866734ce6195 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -68,7 +68,7 @@ static const unsigned long al2230_channel_table0[CB_MAX_CHANNEL] = {
 	0x03E7C000 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW  /* channel = 14, Tf = 2412M */
 };
 
-static const unsigned long dwAL2230ChannelTable1[CB_MAX_CHANNEL] = {
+static const unsigned long al2230_channel_table1[CB_MAX_CHANNEL] = {
 	0x03333100 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 1, Tf = 2412MHz */
 	0x0B333100 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 2, Tf = 2417MHz */
 	0x03333100 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 3, Tf = 2422MHz */
@@ -578,7 +578,7 @@ static bool RFbAL2230SelectChannel(struct vnt_private *priv, unsigned char byCha
 	ret = true;
 
 	ret &= IFRFbWriteEmbedded(priv, al2230_channel_table0[byChannel - 1]);
-	ret &= IFRFbWriteEmbedded(priv, dwAL2230ChannelTable1[byChannel - 1]);
+	ret &= IFRFbWriteEmbedded(priv, al2230_channel_table1[byChannel - 1]);
 
 	/* Set Channel[7] = 0 to tell H/W channel is changing now. */
 	VNSvOutPortB(iobase + MAC_REG_CHANNEL, (byChannel & 0x7F));
@@ -703,7 +703,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable1[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
-- 
2.30.2

