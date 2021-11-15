Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D3368
	for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 10:56:34 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso15401561wml.1
        for <linux-staging@lists.linux.dev>; Mon, 15 Nov 2021 02:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+kXGWZLNJVRqPQUIGKsTuVje1twJc/fST86hWxvRfcU=;
        b=Xf/T5GTfjhyxkMIJEKkoJ4OjYdh2ehM7gx2ogBT1PEBBPbfuxnZWjXEFgGmLNzA692
         x6UplMXpWBkZWswZzZ6pZ9XHVcCPxpy1EEsEUk3dZuPLR1VXBGhYCO8d17VokDFnLMFG
         jjkeecujHjMUIq/SwDC78SsVYdD5y1pW6ftvPf9pvJLTPeJhhQ01eE/csyWLqzOkXZxk
         QnzVGz1vtB41GF1vMVUSEWkpUiifxCTnP26KcLi3klZUzOE4uYQbFAQJUZ/+OTUOUw8A
         a9mOsGF/TF4/iPp+KRrVrunDjITzCmqCPDFj8kAVq5CSQ+eYQpOEUIW+LTVEt8tozd+Z
         vSNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+kXGWZLNJVRqPQUIGKsTuVje1twJc/fST86hWxvRfcU=;
        b=BdEjp/1VKehw4exxhFk9ZUHVZii8Yr1WRCwshEgJzwgacksbruNni0iRvG8690pngQ
         PyDHO6nbxyJr9vMAX2RD7E0G3nfzAQANITSCcoHxKfcp0yhmiskI3qyJgAWxM7vNqvsm
         +ijYfH0vDn7o34EH8KlJsDd8pTh3ZhwNS2fJbROSV8DF6XxFTt0SPmtBAuHEChVWjbUO
         PhACEAcryOqkizIP7ck1jiB/xuFLqn1tUw7xJnb0PODlGiqe1v+a/FD7emwS2FHrWi/B
         yU6l3ViYpgeuvMKzMNAAAry6D1ZCgXB4DrZbBCAqkR+8fQC3Xoa810VuzlJs4qqjH/Ix
         EiUg==
X-Gm-Message-State: AOAM533iG8Z+PU7YpcL7qSXeD4TEfWh+GoBbiMxLxxnLyPRYW1lfIg3h
	oWyls71eX0z8L2X8f2NLQIBffymcCvA=
X-Google-Smtp-Source: ABdhPJzacx/myc4TKVhYtHWVCIO8NDAOppxliKOPN6X+iuZrXXJCvR1R133TvPNQFx4Zu6RQRQEkeQ==
X-Received: by 2002:a05:600c:1c07:: with SMTP id j7mr61154096wms.12.1636973793154;
        Mon, 15 Nov 2021 02:56:33 -0800 (PST)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id d1sm13516532wrz.92.2021.11.15.02.56.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Nov 2021 02:56:32 -0800 (PST)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>,
	Mike Rapoport <mike.rapoport@gmail.com>
Subject: [PATCH v3 7/8] staging: vt6655: Delete bogus check for `init_count` in AL2230
Date: Mon, 15 Nov 2021 10:55:48 +0000
Message-Id: <29c758ba58b10bc1da7e864b3a4f377147fc4428.1636729147.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1636729147.git.karolinadrobnik@gmail.com>
References: <cover.1636729147.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove an unnecessary check in `rf_write_wake_prog_syn` in `RF_AL2230S`
switch case. This `if` conditional will never be true as `init_count` is
equal to 17 and can't be bigger than `MISCFIFO_SYNDATASIZE - 0`, which
is equal to 21.

Suggested-by: Mike Rapoport <mike.rapoport@gmail.com>
Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index d4c18d9bfc67..4bfadd85c82c 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -697,8 +697,6 @@ bool rf_write_wake_prog_syn(struct vnt_private *priv, unsigned char rf_type,
 		 /* Init Reg + Channel Reg (2) */
 		init_count = CB_AL2230_INIT_SEQ + 2;
 		sleep_count = 0;
-		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
-			return false;
 
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
 			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
-- 
2.30.2

