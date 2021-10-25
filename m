Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CF8429CA
	for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 14:32:13 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id o4-20020a1c7504000000b0032cab7473caso88667wmc.1
        for <linux-staging@lists.linux.dev>; Mon, 25 Oct 2021 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzmjJR83Mq8sLxKS+Zvwh2MK6xScKamcoG/v2jZNovs=;
        b=gqywJxW8I0uDtenXHo1rguWZX6y7WxufxjY4ch/n3YF/XEO3AilRVywdiSoAAaZHh6
         hL2ufWE+1kiRdFTlJfd/zH7c98cK/3VIwTKXGBis+TG0HnC2InV/5MN/2qPRDb4rMIKP
         TIuZwypt2AFALvuOm/H8mfz7gG1fhxP0hIcZxLqJmoW6a2YG/OdpeyxDVjrBEi5lyzJC
         jszETBk5wYm9SenYM0ayeIKEFOQMV/8kMZqduCRtNQEVCSUjBa/ajUTj3cb6xjqZWDJf
         DQuFqcWZUTJS4JW0lWUX0SLQuGorshxvcur0vwIYxilpyi1S+9Eco2E+bvV7Rp1tr+Q+
         rKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzmjJR83Mq8sLxKS+Zvwh2MK6xScKamcoG/v2jZNovs=;
        b=yVda2BA0Ss5zlBrg2rciAOmTYpXY5idl0YjHqDgl2HNDljNRUWASGg9oAVzMvlEtC7
         iXMwiHP2J8MY08NgmznHmID1WljFAsOVpkPhpsY/Md7CbQItoR2nKC5T4JNiOSETd13J
         TRkOiTHyUvDncgZhbz2oRPfIP+avaHXEMbSsHiXUVL8tvLfwmRh4Kvk96GRq2QFr39bt
         pnlwk2Ew3FtlU66zpGh04PQr3DeuHvlS/Orx2X2VX0UVDfnrCWNnyvdntMLK5HmfjHBG
         P5If6YQdXM4SyUV5QqgOBxhKg8VlJTuAARSARtfAt9xP9XR/FT/bbR4YLzeBoGaLHJmV
         xLPg==
X-Gm-Message-State: AOAM53223t3IeXQGZ6P4AWZhx4mYkIbEYi74mKPXdVxmxPI016qUs81h
	YVi19Mz10diZFsqSOvbxQ7w=
X-Google-Smtp-Source: ABdhPJwoEeplyO+dotdkMw1o2kGFKTmfpzSXVhDxhSuaRvsv0YZFkm9MW3gCbwC4aCkpGDowS3SuKw==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr21025866wmi.13.1635172331416;
        Mon, 25 Oct 2021 07:32:11 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id x8sm13011500wrr.53.2021.10.25.07.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 07:32:11 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 1/8] staging: vt6655: Rename `dwAL2230ChannelTable0` array
Date: Mon, 25 Oct 2021 15:31:27 +0100
Message-Id: <6232fd38f5e803dc01d528a76dd16fcce74ff9bd.1635171518.git.karolinadrobnik@gmail.com>
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
  CHECK: Avoid CamelCase: <dwAL2230ChannelTable0>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 3f57834901a6..bd6927151120 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -51,7 +51,7 @@ static const unsigned long al2230_init_table[CB_AL2230_INIT_SEQ] = {
 	0x00580F00 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW
 };
 
-static const unsigned long dwAL2230ChannelTable0[CB_MAX_CHANNEL] = {
+static const unsigned long al2230_channel_table0[CB_MAX_CHANNEL] = {
 	0x03F79000 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 1, Tf = 2412MHz */
 	0x03F79000 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 2, Tf = 2417MHz */
 	0x03E79000 + (BY_AL2230_REG_LEN << 3) + IFREGCTL_REGW, /* channel = 3, Tf = 2422MHz */
@@ -577,7 +577,7 @@ static bool RFbAL2230SelectChannel(struct vnt_private *priv, unsigned char byCha
 
 	ret = true;
 
-	ret &= IFRFbWriteEmbedded(priv, dwAL2230ChannelTable0[byChannel - 1]);
+	ret &= IFRFbWriteEmbedded(priv, al2230_channel_table0[byChannel - 1]);
 	ret &= IFRFbWriteEmbedded(priv, dwAL2230ChannelTable1[byChannel - 1]);
 
 	/* Set Channel[7] = 0 to tell H/W channel is changing now. */
@@ -701,7 +701,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
 			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
 		i++;
 		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable1[channel - 1]);
 		break;
-- 
2.30.2

