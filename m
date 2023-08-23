Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFAF10E9
	for <linux-staging@lists.linux.dev>; Wed, 23 Aug 2023 01:40:18 +0000 (UTC)
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-41090ef118eso20490941cf.1
        for <linux-staging@lists.linux.dev>; Tue, 22 Aug 2023 18:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692754817; x=1693359617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zraoR6noj6EHn4OxAsMlxddazRXBRd6htkpsGGslKZU=;
        b=fWg0LeIFzL2SjtZ/Zs08cqTOtvQLhPzigv0rCgI0QES9ET0nvcE3j9xRxQGjTfDjeu
         56W7LVAGAZN1MrSpR/9D9ssPgKTXKpC2dSA5RKkfBLbKbpBX+6klmsZzSiK6Oj6YyzGA
         hOqTm8Rvq52+cyZkX8cDkskknPAkVLKKt4B0rfPAGMgLzq2uDBvuvgvro9dB+TtRQDtd
         ChJRbb+uRdRjNlqVUsUn3EqLerZi+gDAU9+mzFmuZ8z6o0WrncX08N6cbqrB/E4IX5gK
         ENYmhROjLyFBFdbt83U2hMByqlFM8rh8oj3iAGWzz+bt9NNLsPNLcyqFHjfTCrwNbKIh
         dLxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692754817; x=1693359617;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zraoR6noj6EHn4OxAsMlxddazRXBRd6htkpsGGslKZU=;
        b=goDfBrrE6yOCmj5h8poZykVZPHPIKqdig1d8dOEHHrEgYmdF/ol9SOml2Z+LG2kqyS
         KdAbrc+ECbVf9EUvG2mklwuO0Y82FJ+4D58RWGtsIv/WT6sqF6zs4PRB9O7qLBXS6DAV
         w7feUSpvz7OkyKnITeOn4edZFrquG5lOo5KHhDtiXOVoqSL7BfVLjzev5AbSXA+Z1rPr
         FE/TkRdjCQwKWWgS2EdAYJZgYfJ4QqhldBi4VCj0XQUVx9ovm5DpGsA6FiwcFf2Z5B3F
         0n8tjsMuyrVaoJwvEk0PgV/WRZPql73FdxR6NlWdOYzSWK406dguYU98cqN2lVMUnYn0
         +99A==
X-Gm-Message-State: AOJu0YwYHbtWA5ec+psLeZYpb9gLJB/mz2nICONfxJEywfQUUeJfPpsw
	Wl/XjsWpob2N6ZcBldoUNAI=
X-Google-Smtp-Source: AGHT+IEehiBC36QHK7hjy0nsRp/qMs3yoSpmxdLVVILKewOE5Gvwq/5sDUAMm3sNn1wuiqhAhMaSwg==
X-Received: by 2002:ac8:57d0:0:b0:403:a91f:7b79 with SMTP id w16-20020ac857d0000000b00403a91f7b79mr16650881qta.20.1692754817432;
        Tue, 22 Aug 2023 18:40:17 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:86d6:7871:f7e9:8a15:865a])
        by smtp.gmail.com with ESMTPSA id t5-20020a05622a148500b004116b082feesm40149qtx.75.2023.08.22.18.40.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 18:40:17 -0700 (PDT)
Date: Tue, 22 Aug 2023 22:40:12 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check unbalaced braces and
 misspellings
Message-ID: <ZOVjfKUWsSAkbpZG@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed all CHECK: Unbalanced braces around else statement,
CHECK: braces {} should be used on all arms of this statement,
and CHECK: 'specificed' may be misspelled - perhaps 'specified'?
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index d0366dd3f2b1..1e11047acf54 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -1620,7 +1620,7 @@ EXPORT_SYMBOL(vme_lm_get);
  * @callback: Pointer to callback function called when triggered.
  * @data: Generic pointer that will be passed to the callback function.
  *
- * Attach a callback to the specificed offset into the location monitors
+ * Attach a callback to the specified offset into the location monitors
  * monitored addresses. A generic pointer is provided to allow data to be
  * passed to the callback when called.
  *
@@ -1655,7 +1655,7 @@ EXPORT_SYMBOL(vme_lm_attach);
  * @resource: Pointer to VME location monitor resource.
  * @monitor: Offset to which callback should be removed.
  *
- * Remove the callback associated with the specificed offset into the
+ * Remove the callback associated with the specified offset into the
  * location monitors monitored addresses.
  *
  * Return: Zero on success, -EINVAL when provided with an invalid location
@@ -1866,8 +1866,9 @@ static int __vme_register_driver_bus(struct vme_driver *drv,
 		if (vdev->dev.platform_data) {
 			list_add_tail(&vdev->drv_list, &drv->devices);
 			list_add_tail(&vdev->bridge_list, &bridge->devices);
-		} else
+		} else {
 			device_unregister(&vdev->dev);
+		}
 	}
 	return 0;
 
-- 
2.41.0

