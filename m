Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514236108
	for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 10:06:19 +0000 (UTC)
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-24e25e2808fso2887653a91.0
        for <linux-staging@lists.linux.dev>; Fri, 19 May 2023 03:06:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1684490779; x=1687082779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=OfozACIZTPXj9YjAsiMEiLO3Q/qKKBGE8rtNvdksLde+azMBz5+doNg2LZOfAHVxtH
         MRlnTiIdVH153ZXN5nvS41Gvl39HVN61+bScsf+5e60vWyq7Zvi6wIHDudFLTbw1TUll
         TNDXB3MoUE0cfRb/EP9Zvh7hjeea144WRARZ6HhbnyIGM6zTwlcTfHC7ZQhDhvnsZzF7
         h6tJNQwfdPQdg31Zg586DGhLLvUB49P76VeLxNG65bqIF/aj5UMD7715dHk9Rl01gNGE
         VnjbwG+fyfTE5ybWcOAR5BGSL313lZ4TMInh0e4ug1+B9vxo/AX/ktvrlXVUb0ol4z+d
         +9/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684490779; x=1687082779;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bzq3Pqk8pZIS4OBKRNMcHxRAHqoQcIGGMgWTxxeCr8o=;
        b=Lva/VHW5gRAoBYmNgJtDQrfAxZuQse1wi5GCAzUpV82Z2ciDJq00g4H3bnMKVlZCfi
         Hrhqd1W7ywLNFBkoA0IFig8qbjeqUmhMY20L+twiFKd3zQpcgOOMgZRhUDSCXB3rd6SF
         nSBLduR0cS+2ssduDAJETzx4KZmCPIKF7OYfPpjuu0HbDQKwfmYyQRJSD9A2N6s+sWzM
         l7pM5ekpAaCtE51R6Z7hj/j4WfZ8PHrYGXJnKHvwmLAhTjaGhppH2xNCB3NRRnYkKdub
         9MV1pdhLOLmEgGejxeW2+iyJ7eB2+1B1720hKrXfLpM4QsNZmoZoMIWNSuK2RAGTNFJG
         nkYg==
X-Gm-Message-State: AC+VfDyP+3orVJ0LOci5t5FhuJ25S5YaDPDCHr/JXMY8XlgKBMNKfbtO
	evZZHiQzA7+VgNC+psCsPuw=
X-Google-Smtp-Source: ACHHUZ5OgbbTMM3fdz1ZNdvURBWY3YC++eRXCDeFU27+aPQjNh27NYoQ9MAxOBOE4im3k7Z4lnMWCQ==
X-Received: by 2002:a17:90a:a602:b0:250:bc78:9828 with SMTP id c2-20020a17090aa60200b00250bc789828mr1621173pjq.4.1684490778763;
        Fri, 19 May 2023 03:06:18 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:682f:3808:92bc:26c4:ce02:816b])
        by smtp.gmail.com with ESMTPSA id ev23-20020a17090aead700b0023cfdbb6496sm1163733pjb.1.2023.05.19.03.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 03:06:18 -0700 (PDT)
From: Deepanshu Kartikey <kartikey406@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Deepanshu Kartikey <kartikey406@gmail.com>
Subject: [PATCH v2] [PATCH v2] Staging: rts5208: rtsx: Moved else statement to same line with else if
Date: Fri, 19 May 2023 15:35:59 +0530
Message-Id: <20230519100559.26173-2-kartikey406@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230519100559.26173-1-kartikey406@gmail.com>
References: <20230519100559.26173-1-kartikey406@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved else statement to same line with else if,
this warning was given by checkpatch.pl

Signed-off-by: Deepanshu Kartikey <kartikey406@gmail.com>

...
Changes in V2:
    - Moved else to the same line with else if
    - Moved comment on else statement to inside of it
---
 drivers/staging/rts5208/rtsx.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/rts5208/rtsx.c b/drivers/staging/rts5208/rtsx.c
index 2284a96abcff..47dacef0aaf8 100644
--- a/drivers/staging/rts5208/rtsx.c
+++ b/drivers/staging/rts5208/rtsx.c
@@ -399,10 +399,8 @@ static int rtsx_control_thread(void *__dev)
 				chip->srb->device->id,
 				(u8)chip->srb->device->lun);
 			chip->srb->result = DID_BAD_TARGET << 16;
-		}
-
-		/* we've got a command, let's do it! */
-		else {
+		} else {
+			/* we've got a command, let's do it! */
 			scsi_show_command(chip);
 			rtsx_invoke_transport(chip->srb, chip);
 		}
-- 
2.25.1

