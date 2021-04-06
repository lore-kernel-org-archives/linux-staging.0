Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBB259E
	for <linux-staging@lists.linux.dev>; Tue,  6 Apr 2021 02:32:45 +0000 (UTC)
Received: by mail-pj1-f65.google.com with SMTP id t23so3854933pjy.3
        for <linux-staging@lists.linux.dev>; Mon, 05 Apr 2021 19:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=MQjkCNA0ARaI3+BBDoCvhZ6gKeUVeHPj810XjZy2HGQ=;
        b=GMc+KqIWnN4Hg00WTSr0Elcj15axXHI8s8YCEvrknTeNA9W1QR7G8MakUmqK60v7Nc
         X7taWapNxFLSlcpP840bo692TzfiLog6Kaxr+u7VW3w5Y7tqdy55DrQnCg1MIc5Kk3W1
         0audgYvAW038bQiv+KkTSz5OYmRT5wmUM+UKzvjiAQL47TogVzHRqXmlOXOldF6KUZm9
         GdhQ6P+77lt5QT/07qnrg1s2D/5MoA8LFJQjTKS3uNGI+zXaoumIYjsPOa/72R+gGnr9
         eolzpQZyTTSKdSTaDsIjBvjDUSJH16o4kzQ+A3LycGe2mDlg6J8isx+r6BITJcnh1+nq
         mk0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=MQjkCNA0ARaI3+BBDoCvhZ6gKeUVeHPj810XjZy2HGQ=;
        b=gXFVpgAlT7FIIiIrMjnwTheURKuxXp3IIlEitVxbK6EX8bSdz2PJCoaw+D5q032HE0
         zI3FMf3UcOTYq4TOIzJMHOT6HHRie/1LQNsjnLCtzrOc84m0sWUlTSXYlySiuLm16ipP
         poPjLAKR+UwIR4nrpzGL6+6IKfgLFIsrOvQbsuTenXZIRMCZWCflkug5DdcGg/ok9MoL
         tWuhZXdxqA7udkPlWwESQshltLDto5gu8HQl+rdaIdXSdCied6r/aeGzwgeSVoXzG6UP
         vTpYOygiI4h2lZ2HyXdI3RyxJVkIzZ1nFIhUr6IoDMo07hCkRlA+ycx1rgrRAOVXda9O
         0E8A==
X-Gm-Message-State: AOAM531WtcsNHdMmwSq/RDxuSqj5Won/4rscl5UIXiYWkaJIhcd5aEAQ
	DhPSoFGrf+wdXxG1bM/nEyc=
X-Google-Smtp-Source: ABdhPJzwsszqTalK9OyFF3ZL274qb3dmq1mR3MzKWc3uWXaHhgKsHVHZ5xJJ9Zg7prEqItK8J1wo0Q==
X-Received: by 2002:a17:90a:3905:: with SMTP id y5mr2130349pjb.91.1617676365039;
        Mon, 05 Apr 2021 19:32:45 -0700 (PDT)
Received: from djbComp.hitronhub.home (S0106ac202ecb0523.gv.shawcable.net. [70.67.120.89])
        by smtp.gmail.com with ESMTPSA id e7sm281196pfv.107.2021.04.05.19.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Apr 2021 19:32:44 -0700 (PDT)
From: Deborah Brouwer <deborahbrouwer3563@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com,
	Deborah Brouwer <deborahbrouwer3563@gmail.com>
Subject: [PATCH 2/4] staging: rtl8712: remove a blank line
Date: Mon,  5 Apr 2021 19:32:18 -0700
Message-Id: <81801604460c8cad8770cb2e1290e1587bf88075.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
In-Reply-To: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
References: <cover.1617674639.git.deborahbrouwer3563@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>

A duplicate blank line is removed so that only a single blank line
separates two functions. Identified by checkpatch.

Signed-off-by: Deborah Brouwer <deborahbrouwer3563@gmail.com>
---
 drivers/staging/rtl8712/rtl8712_xmit.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl8712_xmit.c b/drivers/staging/rtl8712/rtl8712_xmit.c
index d8a366338a2b..4be81c2546fe 100644
--- a/drivers/staging/rtl8712/rtl8712_xmit.c
+++ b/drivers/staging/rtl8712/rtl8712_xmit.c
@@ -317,7 +317,6 @@ void r8712_append_mpdu_unit(struct xmit_buf *pxmitbuf,
 			 0x0000ffff)));
 }
 
-
 void r8712_xmitframe_aggr_1st(struct xmit_buf *pxmitbuf,
 			      struct xmit_frame *pxmitframe)
 {
-- 
2.17.1

