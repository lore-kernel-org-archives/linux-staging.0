Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6B02FAE
	for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 12:27:21 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id v10so21597001edj.10
        for <linux-staging@lists.linux.dev>; Thu, 30 Sep 2021 05:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=S0kPemQvYyWPRiMxwk9lRwARw4Dkv4jXuFkeqojHeV4=;
        b=Vn8t1W/jTLGQVIAhhXNrjMZTytr/0doXtGzd3pVMgQJ8Z/LY05QtrndKgyNRZvAnz5
         IV2a51XASBuR2nwGNtRwzXoKmnUVw/0kKmFosDceydabt0lxckNuNcpsnnSpjRJtX2/b
         ycOdxyAxmGuHUwC8iwgd7i+/5pCxzFYx9kZVv8PcqMVZyY0Sd/0GZ6Z2BCb5PGG8qNro
         VULdsrJ3CEU5RiFSvqsdtIbB0LNmPFIj+WtmtvsRN4uuZ5+USc46gXBhp0gLKJ1YxvTj
         fad375nBcMV1qeGQPv9M7tiyrt1QxVp0EFD+7mQ6U+s/L4YD+YMldIGEHoY90QhgYfAc
         9SDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=S0kPemQvYyWPRiMxwk9lRwARw4Dkv4jXuFkeqojHeV4=;
        b=XnXwy1nXtUBPAAli4g3rH0Ez4Jzqx3LUrPuVx5pRqV0yQ9cvU9WNg0GHoFDpwscM3c
         FHlzZ8SfRks+bcQR7XkO6S/OM0ljwvZZ+PT84tKHT95mVuOtv7jk6pSNFfOlowIVvbu/
         tj53KV5RieK73bwLbZ8oTpu/W9JMxlyobt7Rmbis4uKS5cgMBPX3+/zNrmUrBihWLHvr
         ulGgS6EDpSjQdZmEIT+NUADcffWt8MLpmCgZsObnsuIB89oj/85evKmvaUcOweFVeib3
         4hhtsle8TFoYUr/lH0ls6WRp66y4TNGaO6BpbXHJcIdga2KqZ8ZjEwqsfPJCZ+/4q66e
         kSlQ==
X-Gm-Message-State: AOAM532/fvHu9RpnR5fQEY5oOOazsGHRlCKI0LEZlxRXcoHr8MIe8zEI
	dHFR88GIJEjfnr83rLV5dSs=
X-Google-Smtp-Source: ABdhPJwMe94yRoglqWS5X8k/OrQ9yagaSW0SG3zEeeayVL6WuE9ornanXLe85qtpGEyAGC7/6lMPJw==
X-Received: by 2002:a17:906:5e4d:: with SMTP id b13mr4039917eju.428.1633004839233;
        Thu, 30 Sep 2021 05:27:19 -0700 (PDT)
Received: from kkobus.whirley.local (94-214-33-179.cable.dynamic.v4.ziggo.nl. [94.214.33.179])
        by smtp.gmail.com with ESMTPSA id u18sm1389634ejc.26.2021.09.30.05.27.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Sep 2021 05:27:18 -0700 (PDT)
Date: Thu, 30 Sep 2021 14:27:16 +0200
From: Dawid Esterhuizen <desterhuizen@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8712: Statements should start on a tabstop
Message-ID: <YVWtJDOVInwQoHss@kkobus.whirley.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This path fixes four checkpatch.pl warnings:

Statements should start on a tabstop

Changes since v1:
	- Removed the volatile comments as they served no purpose
	- Fixed the styling with corrected spacing as per checkpatch.pl
        for easier reading

Signed-off-by: Dawid Esterhuizen <desterhuizen@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_xmit.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.h b/drivers/staging/rtl8712/rtl871x_xmit.h
index 2e6afc7bb0a1..cdcbc87a3cad 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.h
+++ b/drivers/staging/rtl8712/rtl871x_xmit.h
@@ -182,11 +182,11 @@ struct sta_xmit_priv {
 };
 
 struct	hw_txqueue {
-	/*volatile*/ sint	head;
-	/*volatile*/ sint	tail;
-	/*volatile*/ sint	free_sz;	/*in units of 64 bytes*/
-	/*volatile*/ sint      free_cmdsz;
-	/*volatile*/ sint	 txsz[8];
+	sint	head;
+	sint	tail;
+	sint	free_sz;	/* in units of 64 bytes */
+	sint	free_cmdsz;
+	sint	txsz[8];
 	uint	ff_hwaddr;
 	uint	cmd_hwaddr;
 	sint	ac_tag;
-- 
2.33.0

