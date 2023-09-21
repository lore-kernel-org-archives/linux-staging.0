Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F281C06
	for <linux-staging@lists.linux.dev>; Thu, 21 Sep 2023 03:21:29 +0000 (UTC)
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-690ba63891dso350168b3a.2
        for <linux-staging@lists.linux.dev>; Wed, 20 Sep 2023 20:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1695266488; x=1695871288; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=StW5zsKeSvz+DEv2OOBJ7Wx1dEbg+TZgl1CucyYuVng=;
        b=cjNdzxOyEiMonI/3vWv7FBa5pUdffRE/B3xOysZRgsNl0TcGrE2iL/Rec7S2Zkxd0i
         dQtRjFNCewepQHv1XtH6TK8rYsu/KS0nt9zBcSF9ly2TZFXUgoRL2fN6rKiqz/yabuDn
         YwbInz4vT2GTfk2IDxdlXq/mLwet9XNSIz9O+2dF5Zel/tAAhwlfwmi/e6gK2Z8goh04
         CKNclhSavqZp9Y+UkBSE4+yhJZJO5KTxDQK4TzX4/P2Svf5xY1tuNJnsymNr1r/Okjaf
         LBa51LxuM8iOsC50T/EfyjZl/SA/36WTImSwT4tS1Qv+ceT62W8kvLkeR/9yolffoyaN
         uMjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695266488; x=1695871288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=StW5zsKeSvz+DEv2OOBJ7Wx1dEbg+TZgl1CucyYuVng=;
        b=QnCjx4PG9iNMmnZWXEzpo5n7L9N2mB31JP/H0XEVqFbZxRhgWfQcmQOTn+hnnbHBGV
         Gm0lHpqVLP5Lgi33GOi67Vv5f8RDeLyEsr3T+0cTFM4Kn/Bm5azQmhnxYOr3YKX9GPPE
         N2jgxhcS8RZN3ShNal7kJBkPR6ltKVUVUO8KIG7YIg4k7/wGY/NydWL5GUYxoj5VZdPX
         cdcq6BNaA7MMAKxelioxg24gKaDOI9WIf0AIKa36mLMorazq/xaYmA239nKTVqhvFqb+
         LPYM4oMD2pizhgtNEFEM5epgCYB7Znlb3yE6CyBYi3BB2v8wPtkIVaKgCK+91uamM2QK
         aBAw==
X-Gm-Message-State: AOJu0YwA3QY2nzPbayjslN6CctYBzGBMV6BnZl2U/sITT95PXu75ZMum
	RuV8A1Hw/UNjqmSJ7I24257F+w==
X-Google-Smtp-Source: AGHT+IFOT40v/uD29kHC/ebiDvSyvsTMBnwVUwjtjyjzT5dTl1h815XNxDrPhOQmNYU+Bax3F8yvYA==
X-Received: by 2002:a05:6a00:1347:b0:68e:3fe6:2c82 with SMTP id k7-20020a056a00134700b0068e3fe62c82mr4404882pfu.34.1695266488559;
        Wed, 20 Sep 2023 20:21:28 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id p14-20020a62ab0e000000b0068e49cb1692sm237324pff.1.2023.09.20.20.21.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 20:21:28 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 03/11] Staging: rtl8192e: Rename variable pPendingBa
Date: Wed, 20 Sep 2023 20:25:07 -0700
Message-ID: <20230921032515.96152-4-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921032515.96152-1-tdavies@darkphysics.net>
References: <20230921032515.96152-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pPendingBa to pending_ba to fix checkpatch warning Avoid
CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index a12966cadbca..5642e7788e42 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -26,11 +26,11 @@ static void deactivate_ba_entry(struct rtllib_device *ieee, struct ba_record *pB
 static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs)
 {
 	struct ba_record *admitted_ba = &pTxTs->TxAdmittedBARecord;
-	struct ba_record *pPendingBa = &pTxTs->TxPendingBARecord;
+	struct ba_record *pending_ba = &pTxTs->TxPendingBARecord;
 	u8 bSendDELBA = false;
 
-	if (pPendingBa->b_valid) {
-		deactivate_ba_entry(ieee, pPendingBa);
+	if (pending_ba->b_valid) {
+		deactivate_ba_entry(ieee, pending_ba);
 		bSendDELBA = true;
 	}
 
-- 
2.39.2

