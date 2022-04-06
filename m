Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26D3933C8
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 17:22:40 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id n6so5619979ejc.13
        for <linux-staging@lists.linux.dev>; Wed, 06 Apr 2022 10:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dNWDQ+SBeedDH3/uGrxlIj4RJhbApNvdMlPMyXTlGHg=;
        b=JUeZRMgVMrv8s/512RhsUdmWSugjm2gqZ+/GcQ8VMTZMTPAtIBcYOnHkoNxAPrngnk
         fLSSUpldGFWpovIlXY7nfIQTbYpRmiv8QC0UqqT7Kd01C2JfH0F6ZlEbRiBbLWk09K21
         3gkcYq6n/NBmZr+I0dSNqrNNd1FKVrDARugerNuyyDK3DxV0iCdaCi0RmnkS3I4Ij1ov
         BXabaQFYpbZCiuTPSaiqNMfbSLGQ2NbCCWnfOe49mLdFd49D4vMeBltb0nhJ3IeJaBrU
         DBUMFeK0816mEg1aUntfdkjM3A9+Kk4B1ysz5+n84pfuZDqYwlnavUPe3S8QK54SzwMk
         wgFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dNWDQ+SBeedDH3/uGrxlIj4RJhbApNvdMlPMyXTlGHg=;
        b=t/XgIGexi+wmagc02I6K3BSzWZjbFVkdUu/wzO7K/CI8CDgPdao4uDsjK8cO2CJDy7
         FsYanN1j0axJwTEApHMXF5SuQcu7Od73f49ahu0NBqWpgl04ZhI5AWGppcJQatfsan8O
         ejSi9fzgzQlJ7L0PsCShhNaJXfzys0PIvj/ba7hF8XZ+Grv1s3gd8x/DHJc7v0qPEb1k
         1FRu5/jn4MJdiizybVCTl43PhG6LeyWy/7BTsFzVmy1t5wrcJkvQ0YfueRkoGZxydJSy
         gW810LUgyfDiN1EdAZRGYb+PPoArqhNtxZR6DFHg4Tq1KPM25HZ34af5d6KYXAGbF0Vj
         KtrA==
X-Gm-Message-State: AOAM531bVjnanlVHSvd9cDZf7mgZQiU14V0+h6KKvyiMA9ydZXNYEglq
	nOkuZUXqAREGRfdHgn6RSZQ=
X-Google-Smtp-Source: ABdhPJzNy7M9OZCFmM+qTuEWZIRwC6GxeKgxZQr0qIK3EkVZLFnCHkHBagTMSj4B69FNafpb7Fa6PQ==
X-Received: by 2002:a17:907:728e:b0:6e7:edf7:f0a4 with SMTP id dt14-20020a170907728e00b006e7edf7f0a4mr9489345ejc.497.1649265758418;
        Wed, 06 Apr 2022 10:22:38 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id da19-20020a056402177300b00413583e0996sm7912730edb.14.2022.04.06.10.22.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Apr 2022 10:22:38 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 4/5] staging: r8188eu: use round_up() instead of _RND128()
Date: Wed,  6 Apr 2022 19:22:18 +0200
Message-Id: <20220406172219.15565-5-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406172219.15565-1-straube.linux@gmail.com>
References: <20220406172219.15565-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use in-kernel round_up() instead of custom _RND128().

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/hal/usb_ops_linux.c     | 2 +-
 drivers/staging/r8188eu/include/osdep_service.h | 8 --------
 2 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/usb_ops_linux.c b/drivers/staging/r8188eu/hal/usb_ops_linux.c
index 6a65dcf57112..d5e674542a78 100644
--- a/drivers/staging/r8188eu/hal/usb_ops_linux.c
+++ b/drivers/staging/r8188eu/hal/usb_ops_linux.c
@@ -287,7 +287,7 @@ static int recvbuf2recvframe(struct adapter *adapt, struct sk_buff *pskb)
 
 		recvframe_put(precvframe, skb_len);
 
-		pkt_offset = (u16)_RND128(pkt_offset);
+		pkt_offset = (u16)round_up(pkt_offset, 128);
 
 		if (pattrib->pkt_rpt_type == NORMAL_RX) { /* Normal rx packet */
 			if (pattrib->physt)
diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index ff44c4a37b9d..f6c55f6c9e1a 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -96,14 +96,6 @@ static inline void flush_signals_thread(void)
 
 #define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
 
-static inline u32 _RND128(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 7) + ((sz & 127) ? 1: 0)) << 7;
-	return val;
-}
-
 static inline u32 _RND256(u32 sz)
 {
 	u32	val;
-- 
2.35.1

