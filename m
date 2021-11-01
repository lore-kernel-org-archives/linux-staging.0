Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A58768
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:32:22 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v17so28404669wrv.9
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AVb5GC93bP5+2in7SXHaVRcFzvFScW/Z0MhMVVxwoss=;
        b=WDRr+H+iLkn65jUE9yXxqLx6k4x+Vgyx67bzicM5RF+uEvIAew/mp8EVD/TJ8TVS6M
         7Z3vbJhbiz9qomfiJ6zMEcIXzorAJnoxzZvMm2281w1lD8yBALeTsw6VuZq1EoJPwxKu
         wUWC3cSgdaybRaHjx2ku9tGRpCjEMFNKBS/Vt+OGcjLUPy5gXxgfjtguGz2nrtNzaOqb
         UXIYUs5CIMWaLNGKeQJ01YPVP7EhCRJhpwweMTd+9vw0ZNPzYUlbDatPr9vdl6sbZxMk
         HyPaYup2P1+rjvZjhjf8C16cBqLPHQ4guZqHZLlHQmyx7DpcuLlwrvPoueULHJxlBH6/
         Y3KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AVb5GC93bP5+2in7SXHaVRcFzvFScW/Z0MhMVVxwoss=;
        b=sbVvAzFbEl7lUZkAOPZ0m/2omJNmQkk9VrNsBdgsotizg5l4N59VOjD0+n9xgtCZtR
         0Bv8s+Q2aC4v5nmBd2zDR3+QuvCxZSAlVSe9b0dgV4i6qnyIt5cdG1BNBegUyhCngSRz
         8qXz+Wo+sMcueJ1Xxp8F+6hnJuL/VOJ0sKUr9VV1AaAKzYOq1eJ7FkM+VHuKzX9S4mwg
         +/IfXg9EEaB+mrZODBQSz8pNtFPDLzfUSsyq6LNW4R/JcXbs/42uCP06vG1FgFa4QzQy
         L+JacbYtSdHtWDL9xzeHlomhaIyMI8tp/8q2+Pv7q8Xyb7PQgBcoCO33OBX/df7hek7O
         DLPg==
X-Gm-Message-State: AOAM530oGsV3caj31yanmGs/yR7+Dxc8R3Tk7OWNpUXpG9vwNlXb1uae
	rO3SdS/1Y6TcOoS04aYpCK0=
X-Google-Smtp-Source: ABdhPJyI61zW8Zwgex71PL2I+XliNC846EcOEE/D18EkBFvLe/9wkYC6ko12FMOsyhttbUZ7l7pvlg==
X-Received: by 2002:adf:e390:: with SMTP id e16mr38315954wrm.217.1635777140756;
        Mon, 01 Nov 2021 07:32:20 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l8sm17157721wry.43.2021.11.01.07.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:32:20 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2 1/8] staging: vt6655: Introduce `idx` temporary variable
Date: Mon,  1 Nov 2021 14:31:59 +0000
Message-Id: <34bd0e8f42597edf006a950d420345befc4e0bc2.1635773680.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635773679.git.karolinadrobnik@gmail.com>
References: <cover.1635773679.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a local variable to store `MISCFIFO_SYNDATA_IDX` offset.
This change helps in shortening the lines in `rf.c` that
are deemed too long by checkpatch.pl.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index bc4abe77db7b..f195dafb6e63 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -681,6 +681,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 {
 	void __iomem *iobase = priv->port_offset;
 	int i;
+	unsigned short idx = MISCFIFO_SYNDATA_IDX;
 	unsigned char init_count = 0;
 	unsigned char sleep_count = 0;
 
@@ -699,11 +700,11 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_init_table[i]);
+			MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_init_table[i]);
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al2230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al2230_channel_table1[channel - 1]);
 		break;
 
 		/* Need to check, PLLON need to be low for channel setting */
@@ -716,17 +717,17 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 
 		if (channel <= CB_MAX_CHANNEL_24G) {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table[i]);
 		} else {
 			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_init_table_a_mode[i]);
+				MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_init_table_a_mode[i]);
 		}
 
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table0[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table0[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table1[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table1[channel - 1]);
 		i++;
-		MACvSetMISCFifo(priv, (unsigned short)(MISCFIFO_SYNDATA_IDX + i), al7230_channel_table2[channel - 1]);
+		MACvSetMISCFifo(priv, (unsigned short)(idx + i), al7230_channel_table2[channel - 1]);
 		break;
 
 	case RF_NOTHING:
-- 
2.30.2

