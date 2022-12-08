Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440F7F3
	for <linux-staging@lists.linux.dev>; Thu,  8 Dec 2022 09:11:04 +0000 (UTC)
Received: by mail-pl1-f174.google.com with SMTP id y4so957708plb.2
        for <linux-staging@lists.linux.dev>; Thu, 08 Dec 2022 01:11:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZT7juylwnKh3T2iugjGE5oqHsZy741d4XwrJwog0DPo=;
        b=iTJu2oQmIIxTq/b0KUP9hOUYl/olqaOeYRfF9fIC3y+Rhih6XLVy3OzYoG5j8ZJj2t
         9oLF6kml/VGVJhkN2zuesCATLot4K53gZtGB0Ap6X/zdn4ZOorJfTR5nFKg3l53qo2Ly
         akiRC5apxR6PMX1ykwe9OJAwHB5d9anrgwzYjVtaAntSaAXLFHAsT4J5XRZdoD7AWoMU
         Sa30dLJTILTIg+ySltTuHKmVhCzl1Ff4ZWEx99DkNXtB/v8ppAuPzm0FZSwRW7CKfAAK
         7dfzJ9WMycWynO6cvWyTajP6Zi90S/NO0JUiZXsLhko+Z1Fs1dc44yzQjU3m6ZpDHFFa
         SSAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZT7juylwnKh3T2iugjGE5oqHsZy741d4XwrJwog0DPo=;
        b=OCzPoVplj5X+OtPVnuoBEEahN1phlXhWkKkwwJX9uJ8X7zw7J4JzGTr8gS0cIG+ckG
         fIBEV/1/KoDB3NbqRzXDywqjqbSsyW1W905amxviIveEhX/S+dtJ6vdfbvVaYjwHf6AQ
         8nDBXScUMyj+0pmU9e21Sa5rspTypUB5csFzNP68qYBXWTk2H1L1g6xaEh/Ne0SP+z5u
         3AWUsW3zl4w2DFfY6qBXQAIDwJnMFBEssuO0jjhhaz+4wX24hE7I1nf6WxNgog3H72ca
         1V3TydrxGKz5o85f7M1A8jBcdcHCH+T61cg45bsykMVj28MAgH6HnG5iL+2v/flhZIxG
         JPFQ==
X-Gm-Message-State: ANoB5ploObSH97DnclH6DDE712mHZHgvw9ROL0OjAN6udb0zQskLAL3m
	PRrmXQ6OyZ0ZQ+AFD7v1jEcPjf4AX9h5jg==
X-Google-Smtp-Source: AA0mqf6zTBj0mVhpKSKEzhQFcO/21lA71JMOJqm2AgiU5mIRyTjlLz4hR7FGtmo37TePCLSda//EpQ==
X-Received: by 2002:a17:90a:ac0b:b0:219:9874:c7d3 with SMTP id o11-20020a17090aac0b00b002199874c7d3mr27001623pjq.221.1670490663653;
        Thu, 08 Dec 2022 01:11:03 -0800 (PST)
Received: from zoo868e (1-170-0-91.dynamic-ip.hinet.net. [1.170.0.91])
        by smtp.gmail.com with ESMTPSA id x12-20020a17090abc8c00b002132f3e71c6sm2430633pjr.52.2022.12.08.01.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 01:11:03 -0800 (PST)
Date: Thu, 8 Dec 2022 17:11:00 +0800
From: Matt Jan <zoo868e@gmail.com>
To: Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH 1/3] staging: vme_user: add the spaces around the "*"
Message-ID: <20221208091100.GA95120@zoo868e>
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

