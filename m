Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D1AB7EF
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 10:38:16 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id f3so874689pgc.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 02:38:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=M2lPZXNnYaZfXCBCRIUyZWDNQjylf0hbf0UBlJrfz/k=;
        b=M5jMNnZc0kpzh1W89vr2cSHx8iB0ZQMi+Baymvf9KmFoLsJSqN2hkuhM6brjFdTl2r
         4bQJPCkGA2+9oYxQd0nLa8YA25Dx4R8RJ/538YUF3Jkv1AISb6Z6F7X2ihtWDFnrVtM6
         Qqkx4SJ3f+qcJ3hwVLq65KeokAReyOXjCDeQCL/BJ6rgQEakT3yhQq4OoC8RBEZGlkxn
         EosExUB/j/o2l13labvD/uY/viXxVTN0JfhxOChDjiwxf2FUqkmnH+EPI7gAgAJKhx6m
         KRSDx/POoxAfZvqtn6DtfPrHVpR9tG0kzn85Tv33S/8bA6AHfbbXfpOHZ8WYd4R9/w8q
         KLdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=M2lPZXNnYaZfXCBCRIUyZWDNQjylf0hbf0UBlJrfz/k=;
        b=yjcKZlAOZeycFeu6ryDOL1M+tGpkDl238KMK4UA7IcQJATMmhY7XKIDSedC6VlddTm
         Cip9npKvgx7xYk9USU8jPpN4el5TgVnSt75k3w0RDyJf+XIaoJSLepwVwssvjXw9t3L5
         10XBgLQgNx355cJbDBFTauM7yVkGeN4HNBlMZbsvfkR7mtRQVkUQRXmVcpqi/W2HbtyL
         yDWUqDSu4DYFls4YYN+hbijD30i+dvarLypmIicCEQURmW0VmwdqkqTgxLs/A9H17Lb8
         B47njUkCagoSNBvgWR1+IdLkizAoQq0tk2QD8ddiQWnIQP2agEMAO0VNz+7kzWKoVIju
         +7lQ==
X-Gm-Message-State: ANoB5pn7UkjSfLd07CrSdeVLOqjC3sgiLmtpXEOksZxso0/CZAmK622g
	WT+HXk93GJ/84zAgMywoWtPat01x6ahlbM9C
X-Google-Smtp-Source: AA0mqf5d4knrkzHV7pR4E6vi1T2RFlGiHzlkJi+n9RWFS7YMv7uW5ascxTlKX05fa2mRIswMvBD+Jg==
X-Received: by 2002:a63:5762:0:b0:45f:97e8:d8a7 with SMTP id h34-20020a635762000000b0045f97e8d8a7mr85227822pgm.426.1670495895851;
        Thu, 08 Dec 2022 02:38:15 -0800 (PST)
Received: from zoo868e (1-170-0-91.dynamic-ip.hinet.net. [1.170.0.91])
        by smtp.gmail.com with ESMTPSA id f14-20020a170902684e00b0018699e6afd8sm16214054pln.265.2022.12.08.02.38.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 02:38:15 -0800 (PST)
Date: Thu, 8 Dec 2022 18:38:13 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <20221208103813.GA100066@zoo868e>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Add a space around the "*" at vme_bridge.h to clear up a checkpatch
check.

Signed-off-by: Matt Jan <zoo868e@gmail.com>
---
 drivers/staging/vme_user/vme_bridge.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme_bridge.h b/drivers/staging/vme_user/vme_bridge.h
index 0bbefe9851d7..e17a8f7de165 100644
--- a/drivers/staging/vme_user/vme_bridge.h
+++ b/drivers/staging/vme_user/vme_bridge.h
@@ -4,7 +4,7 @@
 
 #include "vme.h"
 
-#define VME_CRCSR_BUF_SIZE (508*1024)
+#define VME_CRCSR_BUF_SIZE (508 * 1024)
 /*
  * Resource structures
  */
-- 
2.25.1
v2: Resend the correct patch set, noted by Greg Kroah-Hartmamn <gregkh@linuxfoundation.org>
