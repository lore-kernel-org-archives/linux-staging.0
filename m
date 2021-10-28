Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D4D2C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:35:59 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id z200so4457007wmc.1
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:35:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ccxJHQnZxwCRL5ALIeLwb3BTgkZUnkc6gC/ao5xjt48=;
        b=gV7VI4mX3pwtcf/Alsr8MQkZKI8NXZeWkwWgiHPJklFk1is8HdzPxEN5JWEgGffT72
         904acUeHt5rUn9cTaf1eq6++7wGJ+0HcKg6pDDUm6Z3ViTxlfokPTn+hz3CUIpB5VfcY
         GCqbTi473jBvB3CuhzlEG//TlQt7YN6DXD1y2myGUX8ZH6yG9ueCCqzc4uxcj2IDTpsP
         pxIf7I6lg1CxZM7uscQbd6SGaeW6c2g4FOYbfA5tLz1VC6Xc+v3BfFuEOXhWIkZF4iNB
         neVXtnWEPHYm7FC/mi/VrPyu+dPK35V2GpgPGlLdjrapXeMGhXV74UG+7/u0nBx6v+K7
         4bmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ccxJHQnZxwCRL5ALIeLwb3BTgkZUnkc6gC/ao5xjt48=;
        b=wYj1onco+Tw13daaiipp8SGfqGFlzxE4Z08Er8JoEMnDw3zSmyUHO6Ta+hGVXlXVZ6
         YnNj4VZu0SFHuc+GAEg9GBLevalltCm3o6SGoq35I0aB/e1B9nU50DWwjVy1Rydo5CDd
         0ftU3fdeX4eS5smfNRqzipQjaHVOzqTXD/wEf/9kWoTxVsT7njTcQhWlZK5IJKEWiHGU
         xhOlC47MqjbAheDbzwYQVoqxtPovyxsi+jWW8wcnaoGWF2vvvGmW0tzrpCp6BjUfD9mm
         ufpLbHgutsK+g3Z1ixpAbPIX8Fp+7C3ilr85lXMh3frfJjOFs63xnLh0GetWIrEN/J9c
         F+3A==
X-Gm-Message-State: AOAM533QAjOE1vyyE3EGUXWJiG/8KOCXb5iMj7aEmEKh/VN1oUOjsnua
	E9L6r5Eia6BXWwVAMOGdz0Q=
X-Google-Smtp-Source: ABdhPJx44nRJDXX//9FTvonuvJfg3H56W1xivwDLJQMgsetriJw6XNHTXTolN6qEk63mFajNcAZCvw==
X-Received: by 2002:a1c:3bd5:: with SMTP id i204mr3569575wma.46.1635417358324;
        Thu, 28 Oct 2021 03:35:58 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:35:57 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 3/7] staging: vt6655: Remove unused `i` increments
Date: Thu, 28 Oct 2021 11:35:33 +0100
Message-Id: <79a4f03c8f2bfa555ea149ddd1c0f938dd431a0b.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit c569952d92ba ("staging: vt6655: Use incrementation in `idx`")
rendered the incrementation of `i` outside of the loop unnecessary
so it can be deleted.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index c07653566d17..ea74701917e5 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -703,7 +703,6 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
 
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
 		break;
 
@@ -724,9 +723,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		}
 
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
-		i++;
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table2[channel - 1]);
 		break;
 
-- 
2.30.2

