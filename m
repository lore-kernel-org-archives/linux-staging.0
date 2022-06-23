Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE44043D8
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 05:14:36 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id k12-20020a17090a404c00b001eaabc1fe5dso1452165pjg.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 22:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ls9hvwuUqtcL6CqYob/ByEfPEYjTHPxmgj5hdQsgzm4=;
        b=kyfmQSmCpsjYYdL7jn90nALrRXSCuqzIsFH3u2VRXfKfeCKSf7QIvbbq3cus2lYWd5
         8jvQ1JU+g1AcrYhHP7TgB5k2LO7jlQ6Gkt9oI/AKK5nfD307Uv7hkm1hVwQsNP0Ael8P
         P+nAYmmb+4MulutY3BZ/fLsAM1nrnfWJ2cbS3qdvUxKV+eXxigVxA7vQbjW6CjFpJpkB
         QI0KyfnoZOZEivz324whZRrj4bJxjzFZreYfV5SX5qkNlzaeYeWHreuoFvHpHVGhHmxJ
         nmuNOXEEONtBu2wtDUlPZJeVWNFdSc0/RDb9/rqJPVJq7IMG/75zSAZTd2fiXWiZW9i0
         uwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ls9hvwuUqtcL6CqYob/ByEfPEYjTHPxmgj5hdQsgzm4=;
        b=6YzaBdkj3h0KQUJFfdLj9sD3YRoRs05y1ABWEG7vGznxGFHwOAl+ZlCjpdE/S3NAyh
         1umIP10yOE/u7fwVon/sdyM6w//CUNpNU3VoZe0ebOHFCCdiWm6zqz2M4nJ1IjxRWf3E
         M63FCBiOfE7cc9SIlNcEIHIDUaIm2MklFug6apJtUDoXnujsgdRF2YQnx/M3V+flJwAv
         LcnMBaiimzjI3qMd0YM7ocSm98fpIzf2814ArXBnlvfQl/WL4gU4cBWm/NeEjg6MkW9W
         c0pgaa0oe1oUlZzba1lDhrwqE1mVByFs8MGj+Y8DGb86bnGuUYIuOra5nOtC+5yEn1SQ
         suSA==
X-Gm-Message-State: AJIora+JCw19Nw/JCQzvY6TR/DFI8KQrtHU3hnIBBiIlIQuVX828+/pE
	GnvqppHtualzlMBnjusBjicZ/tl5D27uSA==
X-Google-Smtp-Source: AGRyM1uAxPHhfCJYCgRNEaq5XQtzwprlgYiOK6tmeNSOFsF0j8QXUgWcrmWLJtU8glJWlEDWMSrpzg==
X-Received: by 2002:a17:903:2347:b0:16a:33cd:5308 with SMTP id c7-20020a170903234700b0016a33cd5308mr13824497plh.122.1655961276305;
        Wed, 22 Jun 2022 22:14:36 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id w22-20020a1709026f1600b001676f87473fsm13735730plk.302.2022.06.22.22.14.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 22:14:35 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2] staging: r8188eu: combine nested if statements into one
Date: Wed, 22 Jun 2022 22:14:04 -0700
Message-Id: <20220623051404.410632-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220623031515.402691-1-marcus.yu.56@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine two nested if statements into a single one

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v2:
Added a pair of parentheses to make operator precedence explicit.

 drivers/staging/r8188eu/core/rtw_recv.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index 6564e82ddd66..020bc212532f 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -166,10 +166,8 @@ int rtw_free_recvframe(struct recv_frame *precvframe, struct __queue *pfree_recv
 
 	list_add_tail(&precvframe->list, get_list_head(pfree_recv_queue));
 
-	if (padapter) {
-		if (pfree_recv_queue == &precvpriv->free_recv_queue)
-				precvpriv->free_recvframe_cnt++;
-	}
+	if (padapter && (pfree_recv_queue == &precvpriv->free_recv_queue))
+		precvpriv->free_recvframe_cnt++;
 
 	spin_unlock_bh(&pfree_recv_queue->lock);
 
-- 
2.36.1

