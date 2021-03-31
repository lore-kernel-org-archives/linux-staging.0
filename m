Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E195F
	for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 20:06:30 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id q6-20020a17090a4306b02900c42a012202so1848757pjg.5
        for <linux-staging@lists.linux.dev>; Wed, 31 Mar 2021 13:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=ys5Gh541Ca1Dy5AHML2SDPDdvxPboGDXHtvxkAdx0CY=;
        b=h62FU0J+qTb2wc2qPCi0mkO2oQ++3iRTgKjWRo/cHbSz2uNh7WugNdr71JNhINeH/9
         xCwID1Cd2/qnn1Lz7fJ0dxebb6xrZVaiLO2jm+xFZMy1uuVqDb/AIFSLallUIM3MB8mq
         oqJSBXgI1+RJvGM2U3d1TV8F8BbnV7P2sq+Hh/ylTV+bNPE44kkC6Uml6+YC9xF9Rxi7
         8BVbYj61hmtF1Z3EHdG4ppZs7RoDvuPuUcpysnpHLxDRD6I7zj7neuxd3SzxzkU/hx8m
         I0uZuUr3lVh7AnvKM5Hfc0t5YgTYa2IQO6yDzuUyF4FwNGQE/0AfC566ZCtWwwE3/uVg
         nWQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=ys5Gh541Ca1Dy5AHML2SDPDdvxPboGDXHtvxkAdx0CY=;
        b=mPFkcSg3eJpLVtBHLnJBZpCEK+lud0VtrmmdKeB8xZKCVe9ytBOSkByzhGYeQ3IZ6V
         7TjVudrGRnBAGrt/HZL+IXRjW+Pw3sUvTEVgEZfwY7ifcbsLv9vkKV6Bm/4MVsvLfVNW
         lofShuPrAlI1aeZn9jkRemPFMfWQabjrYgW1hvnaGimxiaBgevQ27D6j7E4Ev2gRZNBn
         QakU+HB0CkkExWTLMgZsayw3y+USgQVi1jKilBVzkdyKeVwBy8UMFyjWPEOiYf0FJD2p
         cUs2lYj65ubfxATjcikWcs/MzO/63P/2129HxTeyjw98TPaS/N8ZUTEXiMcNNxYtDgrs
         2mYA==
X-Gm-Message-State: AOAM530G6tMwSMYJXqYRJUukgJLob0HYxWN7peLg0edy2Pks60m0Nmwd
	52xZLfqEQwCIApSOKGz3+9U=
X-Google-Smtp-Source: ABdhPJyssv0lbv3cXtVlbWOKemcnIqgFXt+xZCEVGw40+9WDm7J6uVpYy7AfoA3Y4PQYEidMhsCKEg==
X-Received: by 2002:a17:902:dacb:b029:e5:b538:9ce6 with SMTP id q11-20020a170902dacbb02900e5b5389ce6mr4636548plx.8.1617221190547;
        Wed, 31 Mar 2021 13:06:30 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d22sm2985668pjx.24.2021.03.31.13.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 31 Mar 2021 13:06:30 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: gregkh@linuxfoundation.org,
	ross.schm.dev@gmail.com,
	marcocesati@gmail.com,
	fabioaiuto83@gmail.com,
	dan.carpenter@oracle.com,
	phil@philpotter.co.uk,
	amarjargal16@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 1/3] staging: rtl8723bs: core: fix repeated word warning
Date: Wed, 31 Mar 2021 13:05:35 -0700
Message-Id: <14c1a1f1f0a34fb821d47ddab6e7e63800ec2736.1617221075.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
References: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
References: <cover.1617221075.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Fix checkpatch warning:
WARNING: Possible repeated word: 'very'

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
index 2daf5c461a4d..3878caf0b56c 100644
--- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
+++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
@@ -1700,7 +1700,7 @@ Calling context:
 If we turn on USE_RXTHREAD, then, no need for critical section.
 Otherwise, we must use _enter/_exit critical to protect free_xmit_queue...
 
-Must be very very cautious...
+Must be very, very cautious...
 
 */
 struct xmit_frame *rtw_alloc_xmitframe(struct xmit_priv *pxmitpriv)/* _queue *pfree_xmit_queue) */
-- 
2.17.1

