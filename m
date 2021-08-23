Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE57D3FC8
	for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 12:02:23 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id v10so14691407wrd.4
        for <linux-staging@lists.linux.dev>; Mon, 23 Aug 2021 05:02:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6c7Z3O8KmF7jzxCw0cKrH/VztUsnx4zaAeDumG/PPWY=;
        b=I7LrdSe2835qbknOvS9fsw6otV9T46YseAG+fdRtcLWdYCxR1g9Ei2ck1iTG+GnSox
         kLpDEdfigO7espyHhsVeATKu6y7IqDgtkLwMfToXFSHnQ5DS/AzPDfeZYXGNgIV3NoYv
         U4AarAF17FGZ33trE6Kvx2YZaU286b5lursSoUrp6vU6mIU5fwOWxn5kWhPEXkG5c1E7
         Rz1hNJpE44gwshk1ifE76s7xcDWHhmm3xDlokZj9gEkuX5B+plwdUy6CMmY9a+zeZets
         mFUH0YRVTb7zM7X/bWBbS37ckJL0NZ88crWLYdPIcZk2aw1mCmKcXuROkc2QwpoV4geA
         zqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6c7Z3O8KmF7jzxCw0cKrH/VztUsnx4zaAeDumG/PPWY=;
        b=rl8iOAqNEiJVvQ50tisu1TTxP5cmKSBl1K/U9VabvJFMSPZDqHfc7CYShQDKW0hrQE
         FaYhbfhyZNJS8V8F1ACvLc5RcYAuY30BwEIcJ8+jXY3w1IuVYcNO/aQMn133lOeM7wHX
         g0NGPoAwvDOkPuEZo2EAfxPFseMwYyU1ujqFRhkuqhjCBvzJruaQYa9r2lDLq34qzE8s
         evqUSQWFx+2Beid6vAE0QK0VTOJiwnajszZ2gWku2Y3+yLMukK6lkUucCWv+5QFNcAhR
         JM+6EcCWngOF6rLydaVseKLnIdZnSvIB9kWqPitujKRj4fQnMQTFabOCwppSN59IPoGR
         Qirw==
X-Gm-Message-State: AOAM531LMBAxoLL85dAKl+biVpomdc1h5faXLe6T6eYBE4joe1o3LHFo
	+0vLyl8AP9kyB1LDqGy86Mc=
X-Google-Smtp-Source: ABdhPJyUdaNYGnluWOd/CbjSDM+UiQAUhhzt6pbY5Tw21BQ1SKjC5HvXWmE5hjnbN1PVWPWuBnIibA==
X-Received: by 2002:adf:f704:: with SMTP id r4mr13532100wrp.389.1629720142236;
        Mon, 23 Aug 2021 05:02:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::3c39])
        by smtp.gmail.com with ESMTPSA id g5sm901332wrq.80.2021.08.23.05.02.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 05:02:21 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	martin@kaiser.cx,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/8] staging: r8188eu: use is_multicast_ether_addr in core/rtw_mlme.c
Date: Mon, 23 Aug 2021 14:01:00 +0200
Message-Id: <20210823120106.9633-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210823120106.9633-1-straube.linux@gmail.com>
References: <20210823120106.9633-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use is_multicast_ether_addr instead of custom macro IS_MCAST, the
buffer is properly aligned.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_mlme.c b/drivers/staging/r8188eu/core/rtw_mlme.c
index c41312660054..1115ff5d865a 100644
--- a/drivers/staging/r8188eu/core/rtw_mlme.c
+++ b/drivers/staging/r8188eu/core/rtw_mlme.c
@@ -2121,9 +2121,9 @@ void rtw_issue_addbareq_cmd(struct adapter *padapter, struct xmit_frame *pxmitfr
 	struct sta_info *psta = NULL;
 	struct ht_priv	*phtpriv;
 	struct pkt_attrib *pattrib = &pxmitframe->attrib;
-	s32 bmcst = IS_MCAST(pattrib->ra);
 
-	if (bmcst || (padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100))
+	if (is_multicast_ether_addr(pattrib->ra) ||
+	    padapter->mlmepriv.LinkDetectInfo.NumTxOkInPeriod < 100)
 		return;
 
 	priority = pattrib->priority;
-- 
2.32.0

