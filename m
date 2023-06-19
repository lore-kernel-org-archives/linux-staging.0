Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAA118BE5
	for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 15:10:07 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-4f86a7a5499so2201785e87.2
        for <linux-staging@lists.linux.dev>; Mon, 19 Jun 2023 08:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KEaQN5x4Wxywu5DRGerlvVJNwGjReSSnSGgqsLpGfq8=;
        b=RPt8uIPW6Z1I8YsH+/4gGjf0coJJvCyrShdrTfreq02XGa44yMc4IRgwBtAIVfG7Sl
         qwMmN7FMMFw9wCZGht7sIWTqD9T+cFXqNqLVfiGkZcbsmFAC4eNxzTfJYrJoTADVa+cQ
         B9RdCqbWEDDEBrolg3fidkt+ooGT5anjwastHqnb6Eubr8Ff51O6/uuQ7FfSiiynmVHf
         +Azn0Bm82yG/+vPWJUtget0XUxX22Yt7lkfCUn5rCtd8CwBxfH4G4bEJZupfcXZZTFYM
         EUXWFnME/0fehi4NmXwkML8S63PbG3kKJxxvJ7hYnoSYHT8vCLzamjfXTfiuCXNm/opX
         JcwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687187406; x=1689779406;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KEaQN5x4Wxywu5DRGerlvVJNwGjReSSnSGgqsLpGfq8=;
        b=Z2SomkWdoVHsowe0c0DUVY4bFBJ1p4xU+3giZ+b8n5D+KQcVSQ6OsR8uGzxSJIB02/
         pjO4KOrLQRwWJ1KYMX8CXqNqm43fVYqrkpFhew/Dx8ieqG6LVFN9uSRGZLkKMXB/cWIE
         n17cPVb5of5ajIvykz0LBUNARF6MNfdCshqs1TWuizvXOT39HBmPdLvJP2/hTSZCk4Kv
         zZiiLgZDhkkd4ueKwHdSAb8DV/RVcQEPu2fVu4EEw/ETgzYA5MuIdFymkvy53U1v+h1M
         r4bJv8U12sPUGSEJsOUFzQoBn5JAKg8zNMyNu3VwKFfYO7LOqAJ9vjeg6rfFgvtLokbF
         o5og==
X-Gm-Message-State: AC+VfDyKboHekim1LTNjRC1z2baKrsI7qcbxdnskROjcywiVbVaJrjKy
	edIWy/zjf96cgupoQwl17CE=
X-Google-Smtp-Source: ACHHUZ4aQi79GTD852ryOqtRfHZUKyif4wukn1JIVkmcg7rnOJKoGWfxHwWWuUqgnv4t3SLFyR6k5A==
X-Received: by 2002:a05:6512:47a:b0:4f8:7494:17d7 with SMTP id x26-20020a056512047a00b004f8749417d7mr1260966lfd.59.1687187405320;
        Mon, 19 Jun 2023 08:10:05 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abbd5.dynamic.kabel-deutschland.de. [95.90.187.213])
        by smtp.gmail.com with ESMTPSA id p6-20020a056402044600b0050488d1d376sm13297186edw.0.2023.06.19.08.10.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 08:10:05 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/4] staging: rtl8192e: convert else if sequence to switch
Date: Mon, 19 Jun 2023 17:09:51 +0200
Message-ID: <20230619150953.22484-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230619150953.22484-1-straube.linux@gmail.com>
References: <20230619150953.22484-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert a sequence of else if statements that all check the same
variable to a single switch statement. With a switch statement it is
easier to see what is going on. Additionally this clears a checkpatch
warning.

WARNING: braces {} are not necessary for any arm of this statement

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/rtl8192e/rtllib_softmac.c | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtllib_softmac.c b/drivers/staging/rtl8192e/rtllib_softmac.c
index a47614c837ce..7b3cbe28e562 100644
--- a/drivers/staging/rtl8192e/rtllib_softmac.c
+++ b/drivers/staging/rtl8192e/rtllib_softmac.c
@@ -2830,15 +2830,19 @@ void rtllib_start_protocol(struct rtllib_device *ieee)
 	 * attempts does not fail just because the user provide the essid
 	 * and the nic is still checking for the AP MAC ??
 	 */
-	if (ieee->iw_mode == IW_MODE_INFRA) {
+	switch (ieee->iw_mode) {
+	case IW_MODE_INFRA:
 		rtllib_start_bss(ieee);
-	} else if (ieee->iw_mode == IW_MODE_ADHOC) {
+		break;
+	case IW_MODE_ADHOC:
 		rtllib_start_ibss(ieee);
-
-	} else if (ieee->iw_mode == IW_MODE_MASTER) {
+		break;
+	case IW_MODE_MASTER:
 		rtllib_start_master_bss(ieee);
-	} else if (ieee->iw_mode == IW_MODE_MONITOR) {
+		break;
+	case IW_MODE_MONITOR:
 		rtllib_start_monitor_mode(ieee);
+		break;
 	}
 }
 
-- 
2.41.0

