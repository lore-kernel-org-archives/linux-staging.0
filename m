Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E2068
	for <linux-staging@lists.linux.dev>; Mon,  1 Nov 2021 14:32:27 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id 77-20020a1c0450000000b0033123de3425so2248090wme.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Nov 2021 07:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LfxA9nhm1Dx/kkwpIe9uFG+16iITntyVepiTy9U8Klw=;
        b=MhX7lPGREXxIJG7p11NFBd2VhFk6C2/qiM/p0J5CFzwu2LRWDA7F9FBfsO7PrfLXLv
         7G4H9fTFEcLy9E/Hhu3tSMWzUdCvmhfZu2vvUfYARLW+rK+LcwiSKMrsM+ZjRx/Cgvkn
         TG6iKUMcykNqoeJ6sg8wYGV97EqjPPy/H1/VyiF6yXd6qwghXs/pA6zC42EDnvCX7UMe
         +0H28td9yN+elw0UAJNlGGxROb9ULHmHwB1/Zj/vDaKI/poYqvZjAkGzc7sojrEM3AV/
         M2q94QbaD7+Gy+19fcKqZ0ykvXUXbSKdcpTAEXVN8bMWY/IWi20V7Vei3X37Ym2Shcqo
         PNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LfxA9nhm1Dx/kkwpIe9uFG+16iITntyVepiTy9U8Klw=;
        b=0IKoGUYwKi2x6IU2ssQzBn1iYb9pKjseUzT1rGk+6AgFBTgjBloSz7aha+xfSKKBsy
         YB9V/MeNkiXPbikV6bNgR0y0vWGPhmhtm3WqRh82vGxLktrkaNnl2FwL7xcxzZ2rv9Pp
         DW0J8JVoNKCPitE+HvTwjfyxGfWXUth3oOYGzl9RYDaf9JBiB2HqI6O+3phlySAVm+Zv
         7s1pOD8o5hK1GxKya7laJPNh4geii75eS5GGvPPfAWW0z6yZHQuGEpKmiXRnCn8yaBUI
         26E5ttUhShrA/eM1rECubrmSBvFpP3E9Q9lRV2DRpOJ19qSFEqcw1v36bFRmdOai7CVF
         0Fsg==
X-Gm-Message-State: AOAM531bsxTNGsReXGJ24kTeR7LodZW4PExtTsdTWRFhm/Xye8dHpMcD
	mp5jHqSE0VA+Fm2N1s9xuL0=
X-Google-Smtp-Source: ABdhPJzZqwsl5DxK8U69mMfGGRIjDCrKbw73/0R1jmeIdjLOuZf/HpewGuj3rf9XdWqy/Jj5qI5u0w==
X-Received: by 2002:a05:600c:3b8f:: with SMTP id n15mr17881716wms.180.1635777145986;
        Mon, 01 Nov 2021 07:32:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id l8sm17157721wry.43.2021.11.01.07.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Nov 2021 07:32:25 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH v2 4/8] staging: vt6655: Rewrite conditional in AL7320 initialization
Date: Mon,  1 Nov 2021 14:32:02 +0000
Message-Id: <814792bedc4f693c0d43f8e1c480f00c5988129a.1635773680.git.karolinadrobnik@gmail.com>
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

Use conditional operator to determine which table for AL7320
initialization should be used. Introduce `init_table` variable
to store this value.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 12 +++++-------
 1 file changed, 5 insertions(+), 7 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index ea74701917e5..e7672da39a82 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -684,6 +684,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 	unsigned short idx = MISCFIFO_SYNDATA_IDX;
 	unsigned char init_count = 0;
 	unsigned char sleep_count = 0;
+	const unsigned long *init_table;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
 	switch (rf_type) {
@@ -714,13 +715,10 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
-		if (channel <= CB_MAX_CHANNEL_24G) {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table[i]);
-		} else {
-			for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
-				MACvSetMISCFifo(priv, idx++, al7230_init_table_a_mode[i]);
-		}
+		init_table = (channel <= CB_MAX_CHANNEL_24G) ?
+			al7230_init_table : al7230_init_table_a_mode;
+		for (i = 0; i < CB_AL7230_INIT_SEQ; i++)
+			MACvSetMISCFifo(priv, idx++, init_table[i]);
 
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table0[channel - 1]);
 		MACvSetMISCFifo(priv, idx++, al7230_channel_table1[channel - 1]);
-- 
2.30.2

