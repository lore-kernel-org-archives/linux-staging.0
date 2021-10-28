Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB302C81
	for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 10:36:01 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id c71-20020a1c9a4a000000b0032cdcc8cbafso1816225wme.3
        for <linux-staging@lists.linux.dev>; Thu, 28 Oct 2021 03:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ryVRGAjLsxXO+6wVDsG6ZKxEGX+uqPXEwX9lKO2pYz8=;
        b=oTa74fFIMCJ+x2ePeHlgRabqX0lSx0DtIvQiGY8DPp1l/ybpqDpEkaacD1BSvl9rKj
         9rkIzQKV2A12cQg1fX7IuS3vmpnYg0GLJib6NwOaHSrPdTqbufG78wfxSN6fBpMUBLwk
         iXtzF5vqySnICSmTRBOl0ETw0+HT//jgZo1/p7YLWng3GUXiuc63Pm1XhxO4KiJmL8V+
         Lj3GDpqy4EsY3La1e7Aj6hA9yzs9wlUY7sUe8lrh1WL/sipQ+Mj3LNj59chqSeGqyiXO
         adoY+NZAyqm8JgExediOLtnAr5mVqd+jtibEEcr61BLshlHVBS2GwAz6+rRyQAt7qT66
         Kjag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ryVRGAjLsxXO+6wVDsG6ZKxEGX+uqPXEwX9lKO2pYz8=;
        b=ScJbti1UIHLu1gGu/rUhcu8j7wgaiQdwNItgwtMq+61T6HNlAJHLWGqcf0NKzBMoFH
         /Y6YXTGvMk0GhZydSrqgy0/lwNdnbzBm5xu+Ujm7uObPs8tsHvzBINDDgRS9HVVIM43Z
         umkXP3ckPmkw8Ia/LU7LGDhJ7Afz6VH6YXa0r3R9DJV/rFTc9IP4b5L25hSdvyYR20AO
         KgAMgqElt8EFSR1HQbUoSW9K24EgUymMqyNxMzIKmJp2gkLRxfzvbFpI/xcaiqOwbiub
         bnsmE+GSHUeqFWANstEKyRkQpSDBMjvHvdCNLgCeBxx2+HX7XBtYXCtIh/HH+5jKLUAs
         M2uw==
X-Gm-Message-State: AOAM532/Fsy+AxNUQkyMKXB9iJAqvjBSueOXWdHjeuI+E9++JwA9f+vm
	FLM4vdYaQS6XImdA5MXFRxw=
X-Google-Smtp-Source: ABdhPJwANglesR0yH0tFkE40PA2JedPLehor4ru/Qocl5UtdTFoePTYfby5H/+HXZdSkLf3n7jtehw==
X-Received: by 2002:a1c:6a06:: with SMTP id f6mr3624563wmc.153.1635417360026;
        Thu, 28 Oct 2021 03:36:00 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4b00:f411:e700:e085:8cb7:7bf6:5d62])
        by smtp.gmail.com with ESMTPSA id 13sm3768083wrz.38.2021.10.28.03.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Oct 2021 03:35:59 -0700 (PDT)
From: Karolina Drobnik <karolinadrobnik@gmail.com>
To: outreachy-kernel@googlegroups.com
Cc: gregkh@linuxfoundation.org,
	forest@alittletooquiet.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Karolina Drobnik <karolinadrobnik@gmail.com>
Subject: [PATCH 4/7] staging: vt6655: Introduce `data` temporary variable
Date: Thu, 28 Oct 2021 11:35:34 +0100
Message-Id: <dc72a4c3539aed70569f66396ed3b51818bc2aea.1635415820.git.karolinadrobnik@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1635415820.git.karolinadrobnik@gmail.com>
References: <cover.1635415820.git.karolinadrobnik@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a variable to store initialization tables. Use this variable
in AL2230 initialization.

Signed-off-by: Karolina Drobnik <karolinadrobnik@gmail.com>
---
 drivers/staging/vt6655/rf.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/rf.c b/drivers/staging/vt6655/rf.c
index ea74701917e5..afd202ea3356 100644
--- a/drivers/staging/vt6655/rf.c
+++ b/drivers/staging/vt6655/rf.c
@@ -684,6 +684,7 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 	unsigned short idx = MISCFIFO_SYNDATA_IDX;
 	unsigned char init_count = 0;
 	unsigned char sleep_count = 0;
+	const unsigned long *data;
 
 	VNSvOutPortW(iobase + MAC_REG_MISCFFNDEX, 0);
 	switch (rf_type) {
@@ -699,8 +700,9 @@ bool RFvWriteWakeProgSyn(struct vnt_private *priv, unsigned char rf_type,
 		if (init_count > (MISCFIFO_SYNDATASIZE - sleep_count))
 			return false;
 
+		data = al2230_init_table;
 		for (i = 0; i < CB_AL2230_INIT_SEQ; i++)
-			MACvSetMISCFifo(priv, idx++, al2230_init_table[i]);
+			MACvSetMISCFifo(priv, idx++, *(data++));
 
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table0[channel - 1]);
 		MACvSetMISCFifo(priv, idx++, al2230_channel_table1[channel - 1]);
-- 
2.30.2

