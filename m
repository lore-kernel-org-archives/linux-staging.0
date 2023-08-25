Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14266101E9
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:17 +0000 (UTC)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-68a56401b9aso806745b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972377; x=1693577177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7BuzSgv+mV1XgYmM8KKw4E3Wmr18hM3/dmMAvH4FIg=;
        b=Bj7OWyCmjpTyzAG3Z5hNbC0NmbuodJ7j+VUJ4kdJW8rQzR1A80UnFgX/ARmAjkacfY
         mr5htT9mwrw+58SleD8l++DqdjItLH25+6phCFdZLLUbqsxk3cJ4pyodziDjJV4ruPgn
         SZ3JPpbfauid7bfRHGD1Mooq0/ljcbTyb0MBXtQ3qAOuFBFZWo2f2p+gkAWyyLlABChO
         cuQEyo+9r3ByqWJTktG+AZCdezw3QvVM7eF+sDOKAwn8kJk7/3YN5akbGnzMvjDiQCoU
         AzBNbOz4FsYxOxn/Se4DLzSU35LGNa3GxbdnLaWkZc8/VJqRQEKeJNHS84LSEhRwefLA
         N5yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972377; x=1693577177;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X7BuzSgv+mV1XgYmM8KKw4E3Wmr18hM3/dmMAvH4FIg=;
        b=XXH0Pxd5J47iA2OmcqpgwI2g9pjH9h86e0fSNZDE4P0y9LI3xeGYYVt0dNuwDBP/4C
         kplr8elCcUqIcNsPXQGpd2A48fXet+/ihpPl+l4rkyiJtMo2JRHWY9Z1Odvmwp0fLgp4
         O6aUEKduwcLcn8pRRSA0nJYyOjUe9qoltR2HRUPaf7mnX7JJ2xtpm0ULCFmXQWwQfseX
         gvN06l3nvgvFliPBhio1DfK/GTy86i+FxQpUME+xAvqnOovSv6Xt5kOD4kJa37zIDFXu
         V31Gv/Xo1EbflVXjOm58qf7sPO87iAhRTyyK+mnfAgioLj5KSViDRd41dPJ0HyQq83Mi
         dK7Q==
X-Gm-Message-State: AOJu0Yz2q4I+gnMdCg7X858BhgO+gchBSxXtHOdwbbOVcbelUQ/TkS2y
	DBsr7nJe0LyzJe+p3FbR6bCaNw==
X-Google-Smtp-Source: AGHT+IHFjPmazLN9TKXBJHjpSBbOGbQOCMalqzkwNPATG5eN2Xdd6Zyw65eD81dmEyAH64op4N6rRw==
X-Received: by 2002:a05:6a20:948a:b0:13f:8855:d5a0 with SMTP id hs10-20020a056a20948a00b0013f8855d5a0mr13376475pzb.50.1692972377069;
        Fri, 25 Aug 2023 07:06:17 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:16 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 01/16] Staging: rtl8192e: Rename variable pRxTs in function rx_ts_delete_ba()
Date: Fri, 25 Aug 2023 07:08:32 -0700
Message-ID: <20230825140847.501113-2-tdavies@darkphysics.net>
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

Rename variable pRxTs in function rx_ts_delete_ba() to ts
to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending as v4
v3:Resend as 16 patch series - no longer throttled by email provider, fix commit msg
v2:Resending in smaller patch series
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index 0e3372868f97..da29163f3022 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -41,9 +41,9 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
 	return bSendDELBA;
 }
 
-static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *pRxTs)
+static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *ts)
 {
-	struct ba_record *pBa = &pRxTs->rx_admitted_ba_record;
+	struct ba_record *pBa = &ts->rx_admitted_ba_record;
 	u8			bSendDELBA = false;
 
 	if (pBa->b_valid) {
-- 
2.41.0

