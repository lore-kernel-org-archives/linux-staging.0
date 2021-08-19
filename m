Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CF336D1B
	for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 08:18:16 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id c17so5168828pgc.0
        for <linux-staging@lists.linux.dev>; Thu, 19 Aug 2021 01:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6MVAcGAWVJZY+dW4MAhBQUW0lRs4hWBqQtrXxGIoLlU=;
        b=qj2x8hx9Z5DZ/HaOQDyzzweWcrBY8cJ6PXWP+JMOVcsWWGvdFimyysOLUaWYfOAa2P
         5hXylvlvQRkWBAvB7RiZP3XLXej9rXG7wA4fAtlKVcwniA2BHLW8lXLzq7uSJb/mTOh/
         X6xHAIu8THNYZj8CvLgl0EW+pM9lfid4kEjEapR0ANHnm47MimsE8fkPmmvy6A7C/HfP
         YLYgxF5IkLVju8dL8PQfQS6PICH/kKqZH8Q0UFGAIUHkbkleb6ws9eSqEyrNKST9sZmO
         o6dAhVZtbDGN8K/cy+z3RjGBWNdgqpVYF/hBW3IcSEDbxjCCPb4BFoo7OZmgTWPiE8SL
         F4bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6MVAcGAWVJZY+dW4MAhBQUW0lRs4hWBqQtrXxGIoLlU=;
        b=nfZ8G8FEhXhdcuUgtSUqEZCxJqxQj+GIUMTil3nCdBmGeeqnKZ1d9CjHdtffxqmAN8
         3ekmfxI3KDy7ZCwwAElQTEJ8mEt+jtPN0VYTEdUNCyHRqSzuQUvQl9RZ5MZwFg15S6bc
         +AE4Z508MCSXa7zeQaLQdaBcq4ELAOnkKeEW3Sj4qfH6YU6FSOwCvaiA/D/4giv3rTmZ
         LeSp9acQMCalM0k1YKHXVo58MY3MEPDbzavMkiFLcqG7wc1YX6VZR5GoITc8jK9ZS/JJ
         yCPQiyLtVDtvhVXKaQXtd64YHgUCJhylMvwdDOChUqoO4AHigVvCLVJrZpjQYr4jCDRb
         qA1g==
X-Gm-Message-State: AOAM532MG9PdCjuLN72L2w0Zr3xEzMfCsy3fd6zcR/2Potd7L/hJcWCW
	Tw5Bv5NE5J0bji4wiWPsy5I=
X-Google-Smtp-Source: ABdhPJwVgRdqe4ny//bPUATMYZzbb6gwHcn4niyvHD6nH63rnETbCVpIwMrphbuunD0qIwP5ErGxnQ==
X-Received: by 2002:a65:690c:: with SMTP id s12mr13052807pgq.401.1629361095914;
        Thu, 19 Aug 2021 01:18:15 -0700 (PDT)
Received: from xps.yggdrasil ([49.207.137.16])
        by smtp.gmail.com with ESMTPSA id gb17sm1531129pjb.26.2021.08.19.01.18.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Aug 2021 01:18:15 -0700 (PDT)
From: Aakash Hemadri <aakashhemadri123@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/5] staging: r8188eu: restricted __be16 degrades to int
Date: Thu, 19 Aug 2021 13:47:56 +0530
Message-Id: <bd63137c645ecc20dc446a6cfa7f7d3461a642d7.1629360917.git.aakashhemadri123@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <cover.1629360917.git.aakashhemadri123@gmail.com>
References: <cover.1629360917.git.aakashhemadri123@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix sparse warning:
> rtw_br_ext.c:839:70: warning: restricted __be16 degrades to integer
> rtw_br_ext.c:845:70: warning: invalid assignment: |=
> rtw_br_ext.c:845:70:    left side has type unsigned short
> rtw_br_ext.c:845:70:    right side has type restricted __be16

dhcp->flag is u16, remove htons() as __be16 degrades.

Signed-off-by: Aakash Hemadri <aakashhemadri123@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index d4acf02ca64f..14b2935cab98 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -674,13 +674,13 @@ void dhcp_flag_bcast(struct adapter *priv, struct sk_buff *skb)
 					u32 cookie = dhcph->cookie;
 
 					if (cookie == DHCP_MAGIC) { /*  match magic word */
-						if (!(dhcph->flags & htons(BROADCAST_FLAG))) {
+						if (!(dhcph->flags & BROADCAST_FLAG)) {
 							/*  if not broadcast */
 							register int sum = 0;
 
 							DEBUG_INFO("DHCP: change flag of DHCP request to broadcast.\n");
 							/*  or BROADCAST flag */
-							dhcph->flags |= htons(BROADCAST_FLAG);
+							dhcph->flags |= BROADCAST_FLAG;
 							/*  recalculate checksum */
 							sum = ~(udph->check) & 0xffff;
 							sum += be16_to_cpu(dhcph->flags);
-- 
2.32.0

