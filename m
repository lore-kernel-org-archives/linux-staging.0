Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F21D972
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 09:37:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id u18so3813339wrg.5
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 02:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eHPc3N37Jxt/ha1mRXWgFzhusdcNwFGBiIe67sBVlN8=;
        b=FeEQdVMlkj1f+mgd3LmPprz60U9As8acN3sZRT3ZCY9dzNTv7zL2uA/Youp08xl6T0
         3cYHQADkjWAlH9buYpdGfr7TKnkKG0yACywB4EzXaJ163xKF1+9pcpz3JDSGv0LphDCy
         V/uyrTXNk1VXVHIfY+f+HKtlepT34gJrVnSjIGs7u1bkKv5ikuJgewS9oA0pJKmBZTLY
         7EQpGxatqZcOBkB8SZJiRzfw3VufwAlX7tyEmVyyZJuOFDBnyoRSQYf8Q0KDMEuMheLc
         4/xdWK3Xc7Cg0HeB4txEiguNcZEzzQns5w6d54htqWUCJrol5AzIfElHqoDljVIqkcG3
         GaQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eHPc3N37Jxt/ha1mRXWgFzhusdcNwFGBiIe67sBVlN8=;
        b=h/Y38/by4U5HCqSpZebgrA5P1rO0eTnuEmW/h+6ne3G3a8j+5L+InZW3EV3WLPjS80
         7DyfcVQ2KS/Yz30cyEd4kXFzdOSn8ESpiSv3Q3Xeg2SMg7R3c1qsmP4MamJdlz80an3E
         /ViYOy03BGDxAly2CjDJq61v5CdraTh1XWokG0yAxCZtdGHAG4ksTzMRWCX90cGvXc7b
         8CDwMFoZhtK1yW8Ix8bnCaT4Pzx/umDK/F3IFHDnkhnXtifYh5G1YMGa+opWT+0PmlCE
         pxWQAaQUoo79h8N34aBKjWhaI+bFjCFLb+dMtuMwjGx0zht0qXf2E7l7DmMcQyd1b3dY
         PMKA==
X-Gm-Message-State: AOAM5334AQu2bMJVebmV721QBIO1VKWsyJ+23XiMY0P8r8a/+LAKQ6bo
	dOJK2ECyLuP0puOmy5hg1wZuhwWqWd+7F8tZ
X-Google-Smtp-Source: ABdhPJxwCFCJhAGeGCVzv9iMhmbwegiDgaFJCdCYMM3Y/IodHpS1+RkyE/fyFHqPfw2YL1TmTue3QA==
X-Received: by 2002:adf:d218:: with SMTP id j24mr14679201wrh.50.1634895469456;
        Fri, 22 Oct 2021 02:37:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id r15sm1643602wru.9.2021.10.22.02.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 02:37:48 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 2/5] staging: vt6655: Rename `byInitCount` variable
Date: Fri, 22 Oct 2021 10:37:15 +0100
Message-Id: <53430b1183324f6a715999792a15df2ea6a3e206.1634826774.git.karolinadrobnik@gmail.com>
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

Drop Hungarian notation in `byInitCount` variable in
`RFvWriteWakeProgSyn` function. Change it to use snake case.

Fix issue detected by checkpatch.pl:
  CHECK: Avoid CamelCase: <byInitCount>

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index 7e441309dd9c..36708af7d612 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -681,7 +681,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 {
 	void __iomem *iobase = priv->port_offset;
 	int i;
-	unsigned char byInitCount = 0;
+	unsigned char init_count = 0;
 	unsigned char bySleepCount = 0;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
@@ -693,9 +693,9 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 			return false;
 
 		 /* Init Reg + Channel Reg (2) */
-		byInitCount = CB_AL2230_INIT_SEQ + 2;
+		init_count = CB_AL2230_INIT_SEQ + 2;
 		bySleepCount = 0;
-		if (byInitCount > (MISCFIFO_SYNDATASIZE - bySleepCount))
+		if (init_count > (MISCFIFO_SYNDATASIZE - bySleepCount))
 			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
@@ -709,9 +709,9 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		/* Need to check, PLLON need to be low for channel setting */
 	case RF_AIROHA7230:
 		 /* Init Reg + Channel Reg (3) */
-		byInitCount = CB_AL7230_INIT_SEQ + 3;
+		init_count = CB_AL7230_INIT_SEQ + 3;
 		bySleepCount = 0;
-		if (byInitCount > (MISCFIFO_SYNDATASIZE - bySleepCount))
+		if (init_count > (MISCFIFO_SYNDATASIZE - bySleepCount))
 			return false;
 
 		if (uChannel <= CB_MAX_CHANNEL_24G) {
@@ -736,7 +736,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char byRFType,
 		return false;
 	}
 
-	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX, (unsigned long)MAKEWORD(bySleepCount, byInitCount));
+	MACvSetMISCFifo(priv, MISCFIFO_SYNINFO_IDX, (unsigned long)MAKEWORD(bySleepCount, init_count));
 
 	return true;
 }
-- 
2.30.2

