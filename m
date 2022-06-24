Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63213187F
	for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 14:46:06 +0000 (UTC)
Received: by mail-pg1-f169.google.com with SMTP id 9so2616751pgd.7
        for <linux-staging@lists.linux.dev>; Fri, 24 Jun 2022 07:46:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=P2/ZUB7oMjRi4mWz7GISV//OG0C6Rw4pa93uJjRJoLE=;
        b=cv9VFUtYV8T4e+mp175bx7Pp36y3ZFRfAd9NS/h93UDVgSqUgMkoL4ciTDunw+KHf2
         OM9zvPx5Vc7iNh/YsP9smHPncTfprachdijQaqcgjksFYdhZlMOSPiecL/cIAlkn2b4n
         2uMOpEsQpEoPAfcYDPoLc6MB8LVMjrbMxwA6NqiCiaj6jCCFAc55mgXyT8Fmr3asI6Xr
         aGCVquLmSOkdGucSO8WE3/WH4uIV4kj1+iBDRYEaGDK9qeSGj594CUXo6t1oPVunpDc3
         EpihAHwmyn6W81eFQIzOq7YxdItnsmBDCGy/xSdNxtzvaNhHhoQ92+bdF4Ls3mkqMy15
         WJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=P2/ZUB7oMjRi4mWz7GISV//OG0C6Rw4pa93uJjRJoLE=;
        b=ewfHM0YFWS4E08uPh7t3nPcuJO91Pt8AQPLave0XWk8S0OvNzq+LZVcAi1kZ4hu74m
         tHY/MMtpiC0lZifp90iUyrBFqhokKW0eQj1V7E8kmpiMtkezWUZe+D9vEZeMPkLYjtK+
         JWzFoLqUMLFh31G+lQdXkkKuK4EgCoh6Sr5WMDFM38lkCx+qiw6dHaeiEtYgKBRzoQIC
         3p0GWkiOAsmHUnbSESgfiUMKYkoVoOUricEfzPagtBonHIiH0wnIi+4DckIXJq/wOcJo
         oP6BhCgmJrpMO8zO1sGVFkdqXMHXGSWc6NRM/1zkIDXzj3ys12GlfIH9Xrtr23cBge+g
         jEeA==
X-Gm-Message-State: AJIora8KtKEq8/Q4pwB/bACXTEgrS0ZqlBrRjp6SfvXuHjcBWgOw91am
	4RNJAD1R7dasLGWkn9aA60k=
X-Google-Smtp-Source: AGRyM1ttyBiwFUVc/hayeCduTn6f5RWPpfxphjBVZoYPLPit1q6tiZ1Utfb86reVfJj8ASQ7rojRFQ==
X-Received: by 2002:a63:7848:0:b0:40c:a54c:f60b with SMTP id t69-20020a637848000000b0040ca54cf60bmr12363315pgc.411.1656081965726;
        Fri, 24 Jun 2022 07:46:05 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id s7-20020a17090302c700b00168e83eda56sm1928868plk.3.2022.06.24.07.46.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 07:46:05 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v4] staging: r8188eu: core/rtw_recv.c: clean up nested if statements
Date: Fri, 24 Jun 2022 07:45:26 -0700
Message-Id: <20220624144526.437322-1-marcus.yu.56@gmail.com>
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

Combine two nested if statements into a single one to fix indentation
issue and improve readability, as suggested by checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v4:
 - Added missing change log and resend

Changes in v3:
 - Modified subject and description to be more descriptive

Changes in v2:
 - Added a pair of parentheses to make operator precedence explicit


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

