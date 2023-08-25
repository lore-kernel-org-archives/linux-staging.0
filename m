Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341EC107AA
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:28 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-68a42d06d02so816183b3a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972387; x=1693577187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZWXmOFW7XIR7sQz7nqwnwxxF6rABq6U04fiBPGQFaA=;
        b=ZG8zBfh7anm0g3M9FG4Dc9nNzbFg88JOXeg26DKYQWggkvyPZCWYDvY1qSfn5u9nEV
         3ooqLe9VOFoMvZ0r6xMspaUoYfEqr7u/ctxhNiLjxkBApW8Mlw6R4/PGT5vrg2vxZI4m
         9qYLV5IKAopuStbV7qTN+8mY4WWkXxWddRTMu+6ftuKOIfZaQPbdPvQ5hp+o+Y51aM7l
         23P0y52rUsrvdFjtW4uWNj8dmaNPOHzZruBzlzLs46cwlO7bkTp+lderlJ0CUFEY5uBx
         RuEM6Ehz4Z7PftEGVFq9+ugxj2dt9VDe7+hVaXfZxqEO1Sq2CIkzerPNpWbZzDujjAZe
         Ecog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972387; x=1693577187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oZWXmOFW7XIR7sQz7nqwnwxxF6rABq6U04fiBPGQFaA=;
        b=AWIcSG98JTOmCHSCbcRs0Vic+zwxQXTpq/0k6wTyvAHoxYYxCpwvbL9DNQhN0XRQ94
         cTbKGg+J7YbQs1kjDeq4ONgQ6jEscg6gr12kujkL4rZAl51KAOjxNJYAtFvAxQOKiBb5
         pusxKUsioH9oFNbfPpXEO3yrAZsm29EjU2a5yvyv3Fe9ZjFMRP0XfgR8asl1Q60BFe/i
         xGnaFRycQGe/ODTeK6HKon9d/LUREEr0F/wU3E5px+4OJvSZ8cZEOAs1eC3osaRSdnBZ
         uhZ+pRUFWfAUIBcXFSGQJhroH7W0INSDO5hZv+P8fXyhUN0TEk/sMX6OwI81eFHn30j3
         kMjw==
X-Gm-Message-State: AOJu0YzJ6VbhN4wOxzwwq5QhH/fRJ+itX1ssDNCQKJkICJw5T0mj8YBO
	iQ2R/HNMmulk2jVLUpcJN3sTxI0UEm6ZIG4d8iUClI/L
X-Google-Smtp-Source: AGHT+IEaOooGftcc4wT7bB4cMAu+91Apz/XETquR+YmaObwZipLUG68TraK7rQrUbNNmUHr6Nz83OQ==
X-Received: by 2002:a05:6a20:4324:b0:14a:ac45:d7d8 with SMTP id h36-20020a056a20432400b0014aac45d7d8mr9002025pzk.31.1692972387593;
        Fri, 25 Aug 2023 07:06:27 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:27 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 11/16] Staging: rtl8192e: Rename variable pTS in function prototype rtllib_FlushRxTsPendingPkts()
Date: Fri, 25 Aug 2023 07:08:42 -0700
Message-ID: <20230825140847.501113-12-tdavies@darkphysics.net>
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

Rename variable pTS in function prototype rtllib_FlushRxTsPendingPkts()
to ts, to fix checkpatch warning Avoid CamelCase.

Signed-off-by: Tree Davies <tdavies@darkphysics.net>
Tested-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
v4:Resending whole series as v4
v3:No Changes
v2:No Changes
 drivers/staging/rtl8192e/rtllib.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtllib.h b/drivers/staging/rtl8192e/rtllib.h
index 0c812eb02ba6..9c2817e8a5d4 100644
--- a/drivers/staging/rtl8192e/rtllib.h
+++ b/drivers/staging/rtl8192e/rtllib.h
@@ -2039,7 +2039,7 @@ bool rtllib_MgntDisconnect(struct rtllib_device *rtllib, u8 asRsn);
  * ieee handler to refer to it.
  */
 void rtllib_FlushRxTsPendingPkts(struct rtllib_device *ieee,
-				 struct rx_ts_record *pTS);
+				 struct rx_ts_record *ts);
 int rtllib_parse_info_param(struct rtllib_device *ieee,
 			    struct rtllib_info_element *info_element,
 			    u16 length,
-- 
2.41.0

