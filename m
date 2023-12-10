Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AC91B269
	for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 19:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="flBgZjIP"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-6d9d307a732so2820232a34.1
        for <linux-staging@lists.linux.dev>; Sun, 10 Dec 2023 11:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702237033; x=1702841833; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ocIsk1Z1AgB/fk/jpeDl/jTBcRisWZEz2PlTlirKV9U=;
        b=flBgZjIPc0Sp7+TiB3h4zJ+fabs8M1gxCQggfBbuyWWBWuVZKoUFqq3JsLUUpJj6Mg
         LseUuDa0aCipjNeMoSng9jPD4ppiyh+MjLi+zc/4+wysnpQwrlkjaWl15sDMUNugKaeo
         Ve0nDSv/uZ/KpJzC5BAFNsZ5euuUKq7zOnyYaSRUsdjW0RpfK5t149n+9rSJdnE0J1Y3
         Uddf1itTZHHLqoftuEcAb2ZOHQ2KhTisGxe6EyqZ1jKmaboSBIRGrg8kSSe7QiaiemIU
         6B3Sgun9Q26l3vDvIYq5LEZQd+n2nLrne3prI8PYTnbqm8dQwGMtVNkEJSe89f2eZbbl
         W4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702237033; x=1702841833;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ocIsk1Z1AgB/fk/jpeDl/jTBcRisWZEz2PlTlirKV9U=;
        b=fBmhk7E7K50tlIdGW5HHBPCswyqXHpX9uM4ueOS3Rrhy6h+XXPpVV+mXhZn5KAGSqD
         THtMTimN+zc4nGrOcU08dFjEAv3lI6hW0VhJgoG6WGbLuEZSYicykdVC3HXRlg7AcLl7
         pRD8Wygl0FNjxAnT406/5rKh2BshUkrA1EnVAreS6jDlO/z6h85oaAeagqFLkR8MO1R1
         PmLDiA+HsKL/AQisJsYBudVVOwugynXZY26MKy0aos5qEKHg/0XnvElFswfZJhbwZ704
         pxuy9pbqke1laGtCktTxRzQFTA0g2fhHlHE03DpIKtTL0uFKm9VA0zbXYs9hIiUMQ/Gx
         u00g==
X-Gm-Message-State: AOJu0Yy4EcmUE0fFuaT0xwcrG+ZB8VFHjGXMwaNo85EL5biEEZr/m2lN
	MPiXyV+DrJwwf4mjNAHzqWwbbA==
X-Google-Smtp-Source: AGHT+IH4+QxPwg2ArrCJJTa5iUAYLO7QQ72lGdZ7KViMmjh75qoVK3In1i+Rw1NnXHD538NSMOfPSA==
X-Received: by 2002:a05:6358:c11a:b0:170:6675:a509 with SMTP id fh26-20020a056358c11a00b001706675a509mr4173666rwb.60.1702237033400;
        Sun, 10 Dec 2023 11:37:13 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id k9-20020a170902c40900b001b9e9edbf43sm5117419plk.171.2023.12.10.11.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Dec 2023 11:37:12 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 4/4] Staging: rtl8192e: Remove variable macId
Date: Sun, 10 Dec 2023 11:37:05 -0800
Message-Id: <20231210193705.2131807-5-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210193705.2131807-1-tdavies@darkphysics.net>
References: <20231210193705.2131807-1-tdavies@darkphysics.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove variable macId as it is defined but never used.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
---
 drivers/staging/rtl8192e/rtllib.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 224774b1ba31..0b4a6ded257a 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -136,7 +136,6 @@ struct cb_desc {
 	u8 bAMSDU:1;
 	u8 bFromAggrQ:1;
 	u8 reserved6:6;
-	u8 macId;
 	u8 priority;
 
 	/* Tx firmware related element(20-27) */
-- 
2.39.2

