Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D474B17E8
	for <linux-staging@lists.linux.dev>; Wed,  6 Apr 2022 06:19:17 +0000 (UTC)
Received: by mail-ej1-f45.google.com with SMTP id bg10so2128611ejb.4
        for <linux-staging@lists.linux.dev>; Tue, 05 Apr 2022 23:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XRSeg/Lx0QJPiA9N9HHqOiU0JUD3WFJS5KpLC8e8al8=;
        b=hAlKLpwqlxQfWYv8WAtYio5MqemQ+ZxJp68y8dLhZnbhPVsvdI5OwQ8eH8e2TLqsB/
         K+0pv/feOiCVp44t+pTuKjMELYjGkkYB91tC//gM+bMZbVOXcxIyBlE7xEIF7ZSKIkxA
         nIkIjRFvuAhoW86ZvcE5VDgYsa1z/J08GNO9OJQ1h7L7oS54oHCLUbT04ibs/BZJiaVK
         emQAa1w0yRPxwJHvZSdhi12NiuS650Nlv3FJ7tmtv/+Nnl1cgiMGSJwuS/0ltx+HC+RW
         8DChNYEgRgQvSYcKdUNqnSmGyMMcUDqT6GbOyJ6tiWrOencTJo7uJHoVPkfpiZ0/ut4z
         mTog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XRSeg/Lx0QJPiA9N9HHqOiU0JUD3WFJS5KpLC8e8al8=;
        b=DaHHOlQ3lfkdWk9T5FKf8/DFuynOUlcmC1IedkVtO/MWVKeBdzJytPE+8HtML5lm1J
         Ql4wu+IbKLZYmkIjqGmsyt6vj6TqpAsgK0SFicDQuVzP2ocwgNyVZUbs/oA4jvLWFzKm
         WskNcTLV4CIeBfA14DwTGOrrCWxAdDg4rbpeOplS/9wfg9ZUQ2yreVhsmIdx4i/BhTqU
         HVxpjBOOZIl0/aXPM15wjehk/vxc/7A6kVfaGlx2FTe1+IsNDAIHnsIxqyhYnNh+j35K
         WV8WAMOz3ZVjrU/bTMQ+P1bvpFCk5pkymWAJJLKDFEkpxMOtfShzZm72Vr7vVOJtNw0f
         aDLw==
X-Gm-Message-State: AOAM531qDHDDJPFssOd4dpZanX3F3HdJfh0XobjZFYliCorFlOZUOFLe
	J47lu/l2tDDfJznvcmDAdPg=
X-Google-Smtp-Source: ABdhPJzVASTH+rw+vBWafl7Vx3lSBIUK0lzuB9Wzg1uKkED1RFkQZt+lw06cgao2WU3AdEDbF7/sMQ==
X-Received: by 2002:a17:906:a046:b0:6b9:20c:47c1 with SMTP id bg6-20020a170906a04600b006b9020c47c1mr6779846ejb.615.1649225956258;
        Tue, 05 Apr 2022 23:19:16 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb55.dynamic.kabel-deutschland.de. [95.90.187.85])
        by smtp.gmail.com with ESMTPSA id q3-20020a50da83000000b0041cdd6e92b1sm2475251edj.27.2022.04.05.23.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Apr 2022 23:19:15 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 5/5] staging: r8188eu: remove unused _RND* from osdep_service.h
Date: Wed,  6 Apr 2022 08:18:59 +0200
Message-Id: <20220406061859.9011-6-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220406061859.9011-1-straube.linux@gmail.com>
References: <20220406061859.9011-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the unused macro _RND() and the unused functions _RND256(),
_RND512() from osdep_service.h.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 .../staging/r8188eu/include/osdep_service.h    | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index f6c55f6c9e1a..f1f3e3ba5377 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -94,24 +94,6 @@ static inline void flush_signals_thread(void)
 		flush_signals(current);
 }
 
-#define _RND(sz, r) ((((sz)+((r)-1))/(r))*(r))
-
-static inline u32 _RND256(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 8) + ((sz & 255) ? 1: 0)) << 8;
-	return val;
-}
-
-static inline u32 _RND512(u32 sz)
-{
-	u32	val;
-
-	val = ((sz >> 9) + ((sz & 511) ? 1: 0)) << 9;
-	return val;
-}
-
 struct rtw_netdev_priv_indicator {
 	void *priv;
 	u32 sizeof_priv;
-- 
2.35.1

