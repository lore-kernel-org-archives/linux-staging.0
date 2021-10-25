Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C82A2CA4
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:23 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id d10so9144911wrb.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bFyJ2L3s6j7dSuTLK7kekavdGRbGtq40Furx3B47yQg=;
        b=UtZQS3f3IVHe1e63LYR2ja/AvtuqYK9Q8AEv3iq0yzUkJqwqCqlsMbuvZcIR2ejLOp
         vqJpp6tjw4w6PWCPCup4eGDsScsvalZurSDM9+ABMfZhGgiOC79e7xbfBwynZuzDPwtl
         CrF4boMvWDPGYo2HTR49jP1OWBLeEa3z5CX7RnKxIkKTDFctNe2xQb+csYt1g46/wdiE
         LJMrLBKMsS78cECFAXzTXraYPuG0rsROyPy1ZHeGbTklnPiPRH6LH2Ajh4RTlKNcFYdR
         4/LwJlR/Zi1tam2514viwf849X/9e1ry/zQI2WHRni5fKVazNa3X7EM20QX3lFlcbIQ6
         Sx1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bFyJ2L3s6j7dSuTLK7kekavdGRbGtq40Furx3B47yQg=;
        b=Eqhu1CQX0u6tA7PuTo2Dj6AZkM4ZgCIq4MSsUN0IhaHDdRz0vO6XUaAoBR8oV/z9jh
         NtssJeD8feXSbGdywZi2ZUcR0o2KGBDn1xMSaBdtvumEfpINIk1iE9piSRqTsNf5ryS2
         ZhJUGpP1kOKOFRaN0Gm456WAoS6A90BdxiEXkOXC107MkxUzqTv3Wzg37Yoiy5MV0et7
         ebsD5Ltix3tCjS/0KRVb06qtcie6lW7RawgLHVcQGcIcnQbP0R2RH2szu0v5bAF1cslK
         eXwtJvMVN93s6GY3lVAlJLl//NoBqLkvCR22/QxsGjzqMbJKiv/skaKpFBVbdFAQsN1N
         PFew==
X-Gm-Message-State: AOAM5304XQZ5IOIZHHzdLy7qpWU3PBT7tgOkWYmsBzC6jrnBcqNUYb6V
	lDDe36k6UJB/sJ6/vKOlzD8=
X-Google-Smtp-Source: ABdhPJx0EFbTXUT3CZfrosXLAVe3d1smwOJiHrAHltBb3q0bMnu9q66cbG37LY3vV4MHN1uPUBmCJg==
X-Received: by 2002:adf:eece:: with SMTP id a14mr20768403wrp.79.1635172341816;
        Mon, 25 Oct 2021 07:32:21 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:21 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 5/8] staging: vt6655: Rename `dwAL7230ChannelTable2` array
Date: Mon, 25 Oct 2021 15:31:31 +0100
Message-Id: <055bde0a3206573209b757a22ab150c02f50f007.1635171519.git.karolinadrobnik@gmail.com>
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
  CHECK: Avoid CamelCase: <dwAL7230ChannelTable2>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 4dac3ad1abbe..a5c8dc5875eb 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -327,7 +327,7 @@ static const unsigned long al7230_channel_table1[CB_MAX_CHANNEL] = {
 	0x02AAA100 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW  /* channel = 165, Tf = 5825MHz (56) */
 };
 
-static const unsigned long dwAL7230ChannelTable2[CB_MAX_CHANNEL] = {
+static const unsigned long al7230_channel_table2[CB_MAX_CHANNEL] = {
 	0x7FD78400 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  1, Tf = 2412MHz */
 	0x7FD78400 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  2, Tf = 2417MHz */
 	0x7FD78400 + (BY_AL7230_REG_LEN << 3) + IFREGCTL_REGW, /* channel =  3, Tf = 2422MHz */
@@ -465,7 +465,7 @@ static bool s_bAL7230SelectChannel(struct vnt_private *priv, unsigned char byCha
 
 	ret &= IFRFbWriteEmbedded(priv, al7230_channel_table0[byChannel - 1]);
 	ret &= IFRFbWriteEmbedded(priv, al7230_channel_table1[byChannel - 1]);
-	ret &= IFRFbWriteEmbedded(priv, dwAL7230ChannelTable2[byChannel - 1]);
+	ret &= IFRFbWriteEmbedded(priv, al7230_channel_table2[byChannel - 1]);
 
 	/* PLLOn On */
 	MACvWordRegBitsOn(iobase, MAC_REG_SOFTPWRCTL, SOFTPWRCTL_SWPE3);
@@ -726,7 +726,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		i++;
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable2[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

