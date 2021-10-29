Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2062C81
	for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 13:28:12 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id i5so6825354pla.5
        for <linux-staging@lists.linux.dev>; Fri, 29 Oct 2021 06:28:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=TfnZr21wO2x4C8A4NaAvF/FsdJBBEUzdG7E98MYZoI8=;
        b=Reb/pVqzhYpse/uOgNi08BNakaWVCa75boxbAxAG+/61M1qs7qGT16Rlyk0n83YbRO
         WNhjeK75/IJMPnPFq3G4XnufATsdesbB79xKYxfGsL0jDyZl8gRha+7Tm3W7LvnDC7Oh
         IHDwRBEvVlu1DcNkEgrPhE7n6bJDRuo8a1QKakoTgsb19pzbZbjYDGh52Ui85ZFtOBho
         +qQfR7UrX8mnmQfn/V1y0G/SPXcDR3s2n1Oksa7amrggc3FIvzYldVzroXY2I04xL8Y7
         BFWgIHtcAy+eFi2i41avdGYDWNn6Oemk0ZIKdT8M3MdeKD7wTN0GmexNzDDtm5uNouke
         CbRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=TfnZr21wO2x4C8A4NaAvF/FsdJBBEUzdG7E98MYZoI8=;
        b=eF72d+RiLeWzACz1aCTLcVdYqUafTdHmzPQyOxHnBJD4o5ZGdiBUujXEn66s9jZP1d
         Fa44M/9VoHkPFuEWg1xlhuI9h9m7IcN/rKiyQzOc+lnHWJZawqW7juN+QLJR13shZ5df
         qHyGjmmkOYyOeXIkewICy93w8zD5pFjJ5iKrfkaihoHrZ8+SkM8hDUg3cGuVYuw41Cyk
         XW54iY91h+cFyskPM8T4dQ+dOU+KsFb9ZhJ2eikpiRcGP/a7F1EnPh/ohdPVhuLmMIr/
         7c3WXuw8TENitaw9Ztq5jZsPjHttYseYgfmZCKv+eUZ4QrvJhUta8Th6wzZq6KQIYoMa
         tDUw==
X-Gm-Message-State: AOAM530tJ6OIYqGw0Bk/GsgWgQF0kLOQScFzlQ0yw5WoRUrRv8o3c0Un
	qEO55Uy+V6NjgDOPZ8fK4dg=
X-Google-Smtp-Source: ABdhPJzpIDSdJ7tFZHsaJV/UnX31CAH8okR4ywXV4lx3l8k2NZnVWOFKGgJnnPDPphkQQCCmYPLgvw==
X-Received: by 2002:a17:90b:4ac1:: with SMTP id mh1mr11550427pjb.144.1635514092420;
        Fri, 29 Oct 2021 06:28:12 -0700 (PDT)
Received: from localhost.localdomain ([103.16.71.115])
        by smtp.googlemail.com with ESMTPSA id on13sm6435952pjb.23.2021.10.29.06.28.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Oct 2021 06:28:11 -0700 (PDT)
From: Ajith P V <ajithpv.linux@gmail.com>
To: TheSven73@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ajith P V <ajithpv.linux@gmail.com>
Subject: [PATCH] staging: fieldbus: anybus: reframe comment to avoid warning
Date: Fri, 29 Oct 2021 18:57:00 +0530
Message-Id: <20211029132700.8552-1-ajithpv.linux@gmail.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

host.c file comment produce warning with checkpatch as below:
WARNING: Possible repeated word: 'interrupt'
Reframe the comment into bullet points or steps avoid this warning.

Signed-off-by: Ajith P V <ajithpv.linux@gmail.com>
---
 drivers/staging/fieldbus/anybuss/host.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/fieldbus/anybuss/host.c b/drivers/staging/fieldbus/anybuss/host.c
index 8a75f6642c78..a344410e48fe 100644
--- a/drivers/staging/fieldbus/anybuss/host.c
+++ b/drivers/staging/fieldbus/anybuss/host.c
@@ -1318,11 +1318,11 @@ anybuss_host_common_probe(struct device *dev,
 	}
 	/*
 	 * startup sequence:
-	 *   perform dummy IND_AB read to prevent false 'init done' irq
+	 *   a) perform dummy IND_AB read to prevent false 'init done' irq
 	 *     (already done by test_dpram() above)
-	 *   release reset
-	 *   wait for first interrupt
-	 *   interrupt came in: ready to go !
+	 *   b) release reset
+	 *   c) wait for first interrupt
+	 *   d) interrupt came in: ready to go !
 	 */
 	reset_deassert(cd);
 	if (!wait_for_completion_timeout(&cd->card_boot, TIMEOUT)) {
-- 
2.17.1

