Received: from mail-yb1-f201.google.com (mail-yb1-f201.google.com [209.85.219.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B988568
	for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 11:12:22 +0000 (UTC)
Received: by mail-yb1-f201.google.com with SMTP id n10-20020a25270a000000b005f712b5c151so556627ybn.6
        for <linux-staging@lists.linux.dev>; Sat, 20 Nov 2021 03:12:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:in-reply-to:message-id:mime-version:references:subject:from:to
         :cc;
        bh=y0KeUaf6yAD9mUdfrovGwP2ZmXhum3aoW0pYBqDmMns=;
        b=GtHRmlYpGjadB2YppYLoUO91303KsrP06J5UwfaEqnz96UEdfijeBAEcgadkezpigK
         VcDi623/84zGWiPX4cGw6oCI60UMWHlOhYIlrJn/8JWRX0l1I/F/30PEhLj9s93cS+Ok
         UZdlnMUuJvEjlr+6fnn0x/O9oQl0B29gD7UaieAJeoFgsa8mLdHz8/AhpUicZbzzwZXr
         GFbjiE/JjzkcmfGyM3M+3wKjw5hHua/9l4sTrbVnOiea+NcWhGPZGEIR2+R9e4exCV2Y
         tQ+DjGhIBpqujNgTYwkapRvtP1BHejnWWB2uINaobfRLFQgZkHbwHm2Rq5iG+PsNRNYU
         t7qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:in-reply-to:message-id:mime-version
         :references:subject:from:to:cc;
        bh=y0KeUaf6yAD9mUdfrovGwP2ZmXhum3aoW0pYBqDmMns=;
        b=EyBupdkSB6vLYlcAkzndqMp2aTcOua3vHmGE5HsYWiqVrd4UUmvvZTSPfHRpXLM2UD
         ZH7FDUAAlnP4g6I/IpXgDCZvF4X5YgxnhIyYyzv3mW6rTZSrR4BY7LGyUmoiXWLjJ8Bg
         mi1bLAxdDwlDmIAZfABOmYFz/KnOey+BeuRVW+yJQz1mHkSADQkDSqzGXgZevoyyMMCX
         Nyx/rAHqoCXctbwMLyXGtpWTNTPK1c1G7qt/JRJsqy9oDdNhg/Nh0+G9VRDUSxd1g8rB
         qYdKI7c5FjIhVpMxB/yeJ6mi4O6hhCuyqTQwX4MAig1liiSPXSJ1QI5k+EX8cCE/STAb
         9w+Q==
X-Gm-Message-State: AOAM532ZkjngKSQi+3MjiUJkx1jtmjWBI+gMArS6o9ZGLibDjCuN2doP
	xgg1D589EXnQweGpQZTbFYOjhbRv/A==
X-Google-Smtp-Source: ABdhPJwfrC2hI7KTCTOxBuv0DAf8V5+yxchtiimvYb0Ed7bAykGaLPi8ehRFbLE8Oy5YeoCVkthfS0Or8g==
X-Received: from zoebm1.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:e29])
 (user=zoebm job=sendgmr) by 2002:a05:6902:1208:: with SMTP id
 s8mr49731208ybu.375.1637406741776; Sat, 20 Nov 2021 03:12:21 -0800 (PST)
Date: Sat, 20 Nov 2021 11:11:51 +0000
In-Reply-To: <YZixPDg8kKHZrGJB@kroah.com>
Message-Id: <20211120111151.1086970-1-zoebm@google.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <YZixPDg8kKHZrGJB@kroah.com>
X-Mailer: git-send-email 2.34.0.rc2.393.gf8c9666880-goog
Subject: [PATCH 2/2] Staging: rtl8712: rtl871x_security: fixed a camel case
 variable name coding style issue
From: Zoeb Mithaiwala <zoebm@google.com>
To: greg@kroah.com
Cc: trivial@kernel.org, linux-kernel@vger.kernel.org, 
	linux-staging@lists.linux.dev, Zoeb Mithaiwala <zoebm@google.com>
Content-Type: text/plain; charset="UTF-8"

Changed additional 'n' from variable name. Corrected comment indentation.

Signed-off-by: Zoeb Mithaiwala <zoebm@google.com>
---
 drivers/staging/rtl8712/rtl871x_security.c | 12 ++++++------
 drivers/staging/rtl8712/rtl871x_security.h |  6 +++---
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_security.c b/drivers/staging/rtl8712/rtl871x_security.c
index 4b341074b1b2..529527e201e3 100644
--- a/drivers/staging/rtl8712/rtl871x_security.c
+++ b/drivers/staging/rtl8712/rtl871x_security.c
@@ -269,7 +269,7 @@ static void secmicclear(struct mic_data *pmicdata)
 /* Reset the state to the empty message. */
 	pmicdata->L = pmicdata->K0;
 	pmicdata->R = pmicdata->K1;
-	pmicdata->nbytes_in_m = 0;
+	pmicdata->bytes_in_m = 0;
 	pmicdata->M = 0;
 }
 
@@ -285,10 +285,10 @@ void r8712_secmicsetkey(struct mic_data *pmicdata, u8 *key)
 static void secmicappendbyte(struct mic_data *pmicdata, u8 b)
 {
 	/* Append the byte to our word-sized buffer */
-	pmicdata->M |= ((u32)b) << (8 * pmicdata->n_bytes_in_m);
-	pmicdata->nbytes_in_m++;
+	pmicdata->M |= ((u32)b) << (8 * pmicdata->bytes_in_m);
+	pmicdata->bytes_in_m++;
 	/* Process the word if it is full. */
-	if (pmicdata->nbytes_in_m >= 4) {
+	if (pmicdata->bytes_in_m >= 4) {
 		pmicdata->L ^= pmicdata->M;
 		pmicdata->R ^= ROL32(pmicdata->L, 17);
 		pmicdata->L += pmicdata->R;
@@ -301,7 +301,7 @@ static void secmicappendbyte(struct mic_data *pmicdata, u8 b)
 		pmicdata->L += pmicdata->R;
 		/* Clear the buffer */
 		pmicdata->M = 0;
-		pmicdata->nbytes_in_m = 0;
+		pmicdata->bytes_in_m = 0;
 	}
 }
 
@@ -323,7 +323,7 @@ void r8712_secgetmic(struct mic_data *pmicdata, u8 *dst)
 	secmicappendbyte(pmicdata, 0);
 	secmicappendbyte(pmicdata, 0);
 	/* and then zeroes until the length is a multiple of 4 */
-	while (pmicdata->nbytes_in_m != 0)
+	while (pmicdata->bytes_in_m != 0)
 		secmicappendbyte(pmicdata, 0);
 	/* The appendByte function has already computed the result. */
 	secmicputuint32(dst, pmicdata->L);
diff --git a/drivers/staging/rtl8712/rtl871x_security.h b/drivers/staging/rtl8712/rtl871x_security.h
index 006ce05c798f..1de662940417 100644
--- a/drivers/staging/rtl8712/rtl871x_security.h
+++ b/drivers/staging/rtl8712/rtl871x_security.h
@@ -192,7 +192,7 @@ struct mic_data {
 	u32  K0, K1;         /* Key */
 	u32  L, R;           /* Current state */
 	u32  M;              /* Message accumulator (single word) */
-	u32  nbytes_in_m;      /* # bytes in M */
+	u32  bytes_in_m;     /* # bytes in M */
 };
 
 void seccalctkipmic(
@@ -200,11 +200,11 @@ void seccalctkipmic(
 	u8  *header,
 	u8  *data,
 	u32  data_len,
-	u8  *miccode,
+	u8  *Miccode,
 	u8   priority);
 
 void r8712_secmicsetkey(struct mic_data *pmicdata, u8 *key);
-void r8712_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nbytes);
+void r8712_secmicappend(struct mic_data *pmicdata, u8 *src, u32 nBytes);
 void r8712_secgetmic(struct mic_data *pmicdata, u8 *dst);
 u32 r8712_aes_encrypt(struct _adapter *padapter, u8 *pxmitframe);
 u32 r8712_tkip_encrypt(struct _adapter *padapter, u8 *pxmitframe);
-- 
2.20.1

