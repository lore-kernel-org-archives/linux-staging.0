Received: from mail-pj1-f68.google.com (mail-pj1-f68.google.com [209.85.216.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8ED6D0D
	for <linux-staging@lists.linux.dev>; Thu,  1 Apr 2021 22:16:28 +0000 (UTC)
Received: by mail-pj1-f68.google.com with SMTP id a22-20020a17090aa516b02900c1215e9b33so3769270pjq.5
        for <linux-staging@lists.linux.dev>; Thu, 01 Apr 2021 15:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=YrSMleKSbg2hGfW2GjIs965FPlWSY5ydLUSNL+d/gGc=;
        b=Q6WvExIF3mEG2FTk9zpl0eDPMJoz82Yll3FVTAcJMcDIULymyfPTggVRR94Vb9sD2L
         DyDs6wV1F8HPEwmz6iplTCGJL9GspIjA4buhneeC96oYjHpkuyQf0T8YVEddnyHehs1J
         at4V4Lo2BsMvl+tHFD/KTQLTupYwz3hHbBvV69gng//N6h82iHzJGczyCFjuKhBRdT3L
         SfP3nGWzNaDTTNs+nVH9nDWeelJ5RtrnaiXH7WtC8sQX48j/zeIjzYxFBn0FK8+mfmxO
         HNuKLzQJ+MfEQfjGUoSkT2DnmRrX+mjXLsLx9Eg/Ixi47u2qqc4LHup6Q4v35hI3R1rf
         XoEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=YrSMleKSbg2hGfW2GjIs965FPlWSY5ydLUSNL+d/gGc=;
        b=h8quaoqwFap6BxKBQmzO8SIFC975CA/RQXIc4Zg5WlThGqy6sSG+4ctlkT+U3kObjK
         FgoihKLv480KGLYYgjSBPTUZqc7Y0Zj0sPn/OF5bwUSruvCLq2x/5LqwTyG7LsgxRxR3
         0OkcQdwqtcTv5b8++exg2Ivkvicz9Ye6r+TjowNdcLiDkE9C1292wvxGWFAR3PL8Qyzf
         pvHssyO5XS0Z3VRJ1919uLU9w6MnPwSMAt+ZMD3yd7rGdM5cDOkZXMWb6zHsQwXr+lbj
         /Bg5ULiCIGkOcORo927jI0DCL/4GMon8FJeAEKw4Q7LUMeCY11XBuUPTRaBRpiTiJ2TU
         UKjw==
X-Gm-Message-State: AOAM532phD9PF6LLqcF2f3yV6cuJCUdQe3D1QDantCaZsgdjlv8CUo5F
	0LF0Zbj79LOyL0WMpRP5qac=
X-Google-Smtp-Source: ABdhPJyxNG1J4XEWyiZFQG5e9ZWuhvHqYlGg6gJKplzDfsmDOJYi9BDz4JDqtzLaxADh1ybRleJIVg==
X-Received: by 2002:a17:902:8687:b029:e6:5eda:c3a8 with SMTP id g7-20020a1709028687b02900e65edac3a8mr9588989plo.59.1617315387700;
        Thu, 01 Apr 2021 15:16:27 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id d13sm6671494pgb.6.2021.04.01.15.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Apr 2021 15:16:27 -0700 (PDT)
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
Subject: [PATCH v3 1/3] staging: rtl8723bs: core: add comma within a comment
Date: Thu,  1 Apr 2021 15:15:40 -0700
Message-Id: <dc7ba26949bab3eb09dac4e4ebf2b87dd242b566.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
References: <cover.1617314121.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

Add a comma to separate repeated words in a comment. The comma preserves
the meaning of the comment while also stopping the checkpatch warning:
WARNING: Possible repeated word: 'very'.

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

