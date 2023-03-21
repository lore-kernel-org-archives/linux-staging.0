Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF0DED505
	for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 19:01:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1679425297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jDgIhgp53F4LHTSbzXO+YUJfE0aKRCAlyTc2/nXzqFQ=;
	b=IMSdwHIxr1QmX58w4JQWtyhpwvFRiCXjc9xbGwH5Ma+EvoZ0jea+jgfn9wmVmoJiMgZ1jc
	JCp24tOktbHhjeFqvaXwE+ZLECfogaIHMDcamxwPu70IqyEUX53HifuhRASgO7XH7JUGPr
	KBkDBuY195drkQ92yhd3l4byjO2m1uA=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-kQt52VxKPiCQideU9odU8A-1; Tue, 21 Mar 2023 15:01:36 -0400
X-MC-Unique: kQt52VxKPiCQideU9odU8A-1
Received: by mail-qt1-f199.google.com with SMTP id i24-20020ac84f58000000b003bfe3358691so9347079qtw.21
        for <linux-staging@lists.linux.dev>; Tue, 21 Mar 2023 12:01:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679425296;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jDgIhgp53F4LHTSbzXO+YUJfE0aKRCAlyTc2/nXzqFQ=;
        b=cu/Mth+nQUenLRUOSFJiiSBijOgtGqlM9jQepTuqtxYXGxTcPX0VPNafJIwdgfQaLj
         FA+J+1nNXVyRdEw0UzgL9m25Qmzq5pUE+lWUstFdZiEQbfNqFZ5eOgCryBGgwS1MT1RF
         +Tz9Gj1T8Q+y2A2CKb1H6Zz4kWqJbkT1CUupqRSA5mDLOOei6+aMk63c3J9/oqgWYMbX
         z8fHNXz6/BGOjhZU3OyKcArHNPemzWFrpgLa+aSJr8aIHJCttGb2w+OvYGR0m5Rac53l
         OVBgTc6SqEx1vcCFD5G8PZBQsk57jlav1GAKM+OztujRbNTgF7bHBKA0RqXooWpmk+Vw
         tdGw==
X-Gm-Message-State: AO0yUKX07CT+BEbohO7KKC8jHZW9WcpVz81jJM0+FvdNEJwc3tvvA9lE
	Xq9FDQy/TSyzuCu9cfGMGwYwz0awpvqqGJrGCoXvwE1h1ObadjjdkQzniPQ+sHAw7TutLWRK62u
	dt2BHG6w8b3cZ0BGvwSi59Vcbkg==
X-Received: by 2002:a05:6214:d07:b0:5cc:e059:efa3 with SMTP id 7-20020a0562140d0700b005cce059efa3mr1487152qvh.23.1679425296007;
        Tue, 21 Mar 2023 12:01:36 -0700 (PDT)
X-Google-Smtp-Source: AK7set9UtNWa/XtHHXbYeSxWPiA8fhZvXtBktHVWK/DoCGMPKvnMpcnYyKocZiXKb0EXFRGGYKumwA==
X-Received: by 2002:a05:6214:d07:b0:5cc:e059:efa3 with SMTP id 7-20020a0562140d0700b005cce059efa3mr1487112qvh.23.1679425295618;
        Tue, 21 Mar 2023 12:01:35 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id v127-20020a379385000000b0074230493ccfsm9847029qkd.73.2023.03.21.12.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 12:01:34 -0700 (PDT)
From: Tom Rix <trix@redhat.com>
To: gregkh@linuxfoundation.org,
	nathan@kernel.org,
	ndesaulniers@google.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH] staging: rts5208: remove unused xd_check_err_code function
Date: Tue, 21 Mar 2023 15:01:27 -0400
Message-Id: <20230321190127.1827703-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true

clang with W=1 reports
drivers/staging/rts5208/xd.c:34:19: error: unused function
  'xd_check_err_code' [-Werror,-Wunused-function]
static inline int xd_check_err_code(struct rtsx_chip *chip, u8 err_code)
                  ^
This function is not used, so remove it.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/staging/rts5208/xd.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/staging/rts5208/xd.c b/drivers/staging/rts5208/xd.c
index 42cab93982c0..c0af378ada71 100644
--- a/drivers/staging/rts5208/xd.c
+++ b/drivers/staging/rts5208/xd.c
@@ -31,13 +31,6 @@ static inline void xd_set_err_code(struct rtsx_chip *chip, u8 err_code)
 	xd_card->err_code = err_code;
 }
 
-static inline int xd_check_err_code(struct rtsx_chip *chip, u8 err_code)
-{
-	struct xd_info *xd_card = &chip->xd_card;
-
-	return (xd_card->err_code == err_code);
-}
-
 static int xd_set_init_para(struct rtsx_chip *chip)
 {
 	struct xd_info *xd_card = &chip->xd_card;
-- 
2.27.0

