Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734C211187
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:26 +0000 (UTC)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-68a1af910e0so783027b3a.2
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972386; x=1693577186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ye0aiLYQHwIYocZ63gEkhoa8stFG6RRB55RfB3sI6K4=;
        b=T9+DWrQuvWlyPD4Cg/tRBuq8PLK1JO5xxOuVKByPMooBYBgi2nu3zhdT25tNVWi8wL
         Qbrdeh8t1ToBWL3pp3QY7pF5gNLRXf+KsYDpq2x9KE7zn4V+bNb2I1n7Z1SfyTcXwwtY
         bjeHYHssEaehCnI/uJcFF/E6GQ1Eeb9S83JCkzpbVzDte3xL9UvMqzzAUCkpOZe4jARb
         9kKTWWievURqh9flZSjsyjRjhVDpcNNnlwf0yV8mZacfoQ8OtiFepLnjHyBGmHiDhtWE
         Dpqt2fhH4+mh+0JBiBtKxBoFTE/qcxYk9YuTpbhVPLO8ulDw3FpQlqjxDNhwLa9UW6U5
         NXEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972386; x=1693577186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ye0aiLYQHwIYocZ63gEkhoa8stFG6RRB55RfB3sI6K4=;
        b=evMT62kkgOGa36V2mtiUM1afcekX1hxG3hDB3YWX2Jfue/7cHij3P9fdvc+1GKiLjU
         X9mJKLa8+USBGOFI7VQKFvN5dHH6UJPuJVhTBl62eEdO85hE1Hdo1vHY+eg5uG2dMQH1
         moPMf4DsN76i+KIXHc53mgCHVPacbHYWWlWtaBZq6hcJRqAiGYHlJk/E88/czkPTB++4
         SWRqhZcD5BKOGLHG0XzjDXD+xu/nbANEqgZkj6nKRCeUPcpan8aWa1IDcRy8KcrsCGhD
         Xyd93/E9TZC+yxdl/N09dY38UepVryw/Ca/nf4G3laPRaxfmpReL6fPrx8qDSLP9K5lB
         cZzA==
X-Gm-Message-State: AOJu0Yy2btMxAHZVqqByzqLapX67fv7peZ1DapSVL+zDC345xsP2Fszy
	K+Ma25ifV5urmOHz/hatBwYeDg==
X-Google-Smtp-Source: AGHT+IFbYh3cBO1wi6bunDMHE78FQpdVmSAQlp+aQEmmeW9CFfJmQhzWOrS/73jSdFKiSXyAYTaWGw==
X-Received: by 2002:a05:6a00:2ea6:b0:68b:dfef:de77 with SMTP id fd38-20020a056a002ea600b0068bdfefde77mr7321839pfb.25.1692972385784;
        Fri, 25 Aug 2023 07:06:25 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:25 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 09/16] Staging: rtl8192e: Rename variable tmp in function GetTs()
Date: Fri, 25 Aug 2023 07:08:40 -0700
Message-ID: <20230825140847.501113-10-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230825140847.501113-1-tdavies@darkphysics.net>
References: <20230825140847.501113-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable tmp in function GetTs() to ts in order
to make the name consistent with other references of type
struct rx_ts_record.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_TSProc.c b/drivers/staging/rtl8192e/rtl819x_TSProc.c
index ac97b6d627da..131a5d7b4599 100644
--- a/drivers/staging/rtl8192e/rtl819x_TSProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_TSProc.c
@@ -325,11 +325,11 @@ bool GetTs(struct rtllib_device *ieee, struct ts_common_info **ppTS,
 				TsCommonInfo);
 			ResetTxTsEntry(tmp);
 		} else {
-			struct rx_ts_record *tmp =
+			struct rx_ts_record *ts =
 				 container_of(*ppTS,
 				 struct rx_ts_record,
 				 ts_common_info);
-			ResetRxTsEntry(tmp);
+			ResetRxTsEntry(ts);
 		}
 
 		netdev_dbg(ieee->dev,
-- 
2.41.0

