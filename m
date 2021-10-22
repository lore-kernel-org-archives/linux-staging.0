Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3ABB72
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:46 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id l38-20020a05600c1d2600b0030d80c3667aso1945307wms.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V57x0MEr6fuE5L3vURExVJ6RMqS7xwkhHXyJYTkcluM=;
        b=d3zqbzBkMTaMN+TQfvkijPPkv8G4hEufMVUiYKmqQaecIbqqDBlf6sdbonICXPubU4
         FCSbsdbrLOhcZYVnI0fLzr4QL7/ReF/4vCRNHL+bgLeBJvzJpMUqv0iiASu51wqzmrAq
         QzbCFzT5NKnuygO8Mkje4BuN+GoHLUkdoktjcePMkt+dwTmKDct52Gb9TQRytCVKHx9C
         0K0snlfZ4qQyGt/GiZK4i4p46utLgbXX4HX9eujI1oNxCXq26urPotJ5w2FDtLTOaZTG
         EIX7KEXB9QyG5NE7kH/xXactMiTCY96YLBIWIK8+TjAM8dNoVn1ILEjTRjeuBEh7r3tQ
         J4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V57x0MEr6fuE5L3vURExVJ6RMqS7xwkhHXyJYTkcluM=;
        b=0aLQrwBtRx9085qd5pphNg0rWN88NlM3RRKsPFYs79Vr0oW1xAKLoiEjwAo4ykZZlb
         RMIAgKd/Rnv6CDmBC+TSJahhkme0qJ/sWyE+7vKr5WwckpdLpy+A/tB++dC9S+Scpi/4
         SyAR+AwniOmLQj7WbNWG8oxYx62QgO9yY4uPCf+t9Zxvn1fCJswa3QemY53yhxuiuo0J
         hA9WPNZxpnmsTtu381r/iT0vvygIvb6tTC0tv3gDEpkF7hTd+tDjbbOjcmwhvKKejDxo
         wGwsIQyXH75vfbU5+WA3rwCPzFWgGXnWjQd2rE4Rfkx+d+iPe55+Hee0VOcA4HesDz0D
         5zDA==
X-Gm-Message-State: AOAM532HPpwO39+8qYxnDoiMJSUZosVCm9UgzoHke3k4RnY3p1Yyq73k
	Ldr/vYSqFMy8JzIZLLlBQ7c=
X-Google-Smtp-Source: ABdhPJw2JLJdPg0xXxRj0dg5M4UGggmy7+sYiLaZ/OCLeXTKC+xuDK4xkvnVPg9VM9GIlFD3mSkE2g==
X-Received: by 2002:a7b:cd15:: with SMTP id f21mr11130877wmj.87.1634895465474;
        Fri, 22 Oct 2021 02:37:45 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:45 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 1/5] staging: vt6655: Rename `ii` variable
Date: Fri, 22 Oct 2021 10:37:14 +0100
Message-Id: <91591b7ca0aaf05d2de1e5ae9477ae3b8f13427f.1634826774.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1634826774.git.karolinadrobnik@gmail.com>
References: <cover.1634826774.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Drop Hungarian notation in the loop counter `ii` in
`RFvWriteWakeProgSyn` function.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 6bdacf8fbc27..7e441309dd9c 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -680,7 +680,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 			 u16 uChannel)
 {
 	void __iomem *iobase = priv->port_offset;
-	int   ii;
+	int i;
 	unsigned char byInitCount = 0;
 	unsigned char bySleepCount = 0;
 
@@ -698,12 +698,12 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		if (byInitCount > (MISCFIFO_SYNDATASIZE - bySleepCount))
 			return false;
 
-		for (ii = 0; ii < CB_AL2230_INIT_SEQ; ii++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), al2230_init_table[ii]);
+		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
+			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable0[uChannel - 1]);
-		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL2230ChannelTable1[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable0[uChannel - 1]);
+		i++;
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL2230ChannelTable1[uChannel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -715,18 +715,18 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 			return false;
 
 		if (uChannel <= CB_MAX_CHANNEL_24G) {
-			for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230InitTable[ii]);
+			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
+				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTable[i]);
 		} else {
-			for (ii = 0; ii < CB_AL7230_INIT_SEQ; ii++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230InitTableAMode[ii]);
+			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
+				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230InitTableAMode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable0[uChannel - 1]);
-		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable1[uChannel - 1]);
-		ii++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + ii), dwAL7230ChannelTable2[uChannel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable0[uChannel - 1]);
+		i++;
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable1[uChannel - 1]);
+		i++;
+		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), dwAL7230ChannelTable2[uChannel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

