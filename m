Received: from mail-oo1-f48.google.com (mail-oo1-f48.google.com [209.85.161.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B1A67FE
	for <linux-staging@lists.linux.dev>; Sat, 14 Oct 2023 04:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="bTorPnXW"
Received: by mail-oo1-f48.google.com with SMTP id 006d021491bc7-57e40f0189aso1489435eaf.1
        for <linux-staging@lists.linux.dev>; Fri, 13 Oct 2023 21:39:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1697258395; x=1697863195; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVgUkrbypDA+3DDbFbDipwVPwWv7bmjtPwc2Y/SU16c=;
        b=bTorPnXWHCeEbmsNqOayYcrtVkZYHf5IabOIDSt8mVUs3pGHZdou1kVH40tT+fKsMq
         jBnfyLtE1LgwaHb0hqo0zd2W303D/eiXzG6QeLMMW7Ywj+tz9ncdMCS0xh+rpdRqRQoH
         T/MVG9+YaUUM17fw0Ke+Ipr7T58x63+bYdfu4XqimJ7Acqmeqc/HntLWiPDG/Vqh0niK
         C01QBJY5yI/PvXRzDTi4r4EI+8tYoeoj6Uufff67/a4XXJP+6sQS6c1mvwaHvdsgE5TZ
         Urg0ZTgxH5euPHFT/sTsvipkuXEXyIVwilFIOBQWO0xqhbOjvawiAxWta06t1I9mwtWP
         GVkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697258395; x=1697863195;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HVgUkrbypDA+3DDbFbDipwVPwWv7bmjtPwc2Y/SU16c=;
        b=DpgvqIS+z6vFXNNpmkLYNcXGZxkvC3XKReVKVeIuIQdc+gLSNT3U48nP7FCKPTxcAx
         TmCQ9a7XnuVRb5swe4Rl4n6nBfv3FecFgnWqSYuGYMjmzTLeDave68tr9ggAdSNuHVyQ
         yZNRnqznJxjnwxP1Yzn40HtA0GJy4L3ybq6OlwxbY9ATw9OyFWHo7By0SI8x3D+gJo6a
         JnnW+/DV+PAIP6RP3qFbZSap/W8Mh3Qa4yQJv0QAP5UU2rpAc/Fw5Z2eQPr4umcglT5k
         h/O7SsKlHSZpngsyFvLykCZq2jMK1wbdEFAnFI4qA/wkM9L5HG/AkMHgI+BGGIYBb93/
         DPKw==
X-Gm-Message-State: AOJu0Yy6RDIr49FT4o+7D96NZK0h1m1lDwSCdL4C2RetToMaZhlDRzkR
	DeE8fyaC+23Wc/hpnUHpmIod6g==
X-Google-Smtp-Source: AGHT+IFcvg5VtOWiIvnM7eGTb7Y2fK1HiILGBSER3lfrwYe/HbiNk0U3pK96XC2jCUpAohP5tAcKaw==
X-Received: by 2002:a05:6358:590a:b0:14c:92ea:b4ff with SMTP id g10-20020a056358590a00b0014c92eab4ffmr32476293rwf.6.1697258394916;
        Fri, 13 Oct 2023 21:39:54 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id y6-20020aa78046000000b006934350c3absm14271926pfm.109.2023.10.13.21.39.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 21:39:54 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 1/4] Staging: rtl8192e: Rename variable pBa
Date: Fri, 13 Oct 2023 21:44:32 -0700
Message-ID: <20231014044435.11947-2-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231014044435.11947-1-tdavies@darkphysics.net>
References: <20231014044435.11947-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable pBa to ba to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtl819x_BAProc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_BAProc.c b/drivers/staging/rtl8192e/rtl819x_BAProc.c
index ec8edfecdb73..a2a0573c3444 100644
--- a/drivers/staging/rtl8192e/rtl819x_BAProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_BAProc.c
@@ -43,11 +43,11 @@ static u8 tx_ts_delete_ba(struct rtllib_device *ieee, struct tx_ts_record *pTxTs
 
 static u8 rx_ts_delete_ba(struct rtllib_device *ieee, struct rx_ts_record *ts)
 {
-	struct ba_record *pBa = &ts->rx_admitted_ba_record;
+	struct ba_record *ba = &ts->rx_admitted_ba_record;
 	u8			bSendDELBA = false;
 
-	if (pBa->b_valid) {
-		deactivate_ba_entry(ieee, pBa);
+	if (ba->b_valid) {
+		deactivate_ba_entry(ieee, ba);
 		bSendDELBA = true;
 	}
 
-- 
2.39.2

