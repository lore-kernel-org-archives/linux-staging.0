Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AEC97ED
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 08:49:38 +0000 (UTC)
Received: by mail-pj1-f54.google.com with SMTP id b11so1510713pjp.2
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 01:49:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=blmSZ/5kJFI3zeITciWHkokHSMBiiI5BLOjMr13YsbM=;
        b=iD20G/+v1fWUxk/brs0rDpv3A0OKoznryR8gJpQ2Ct1RWo4GGVYbhyXumEsi0qtzsD
         bu0avEXUYwBBOq078+q+NKFflJCxd3fIRQE141D+nojSgq6MMDUIPOpJGd8ndQmdkE+j
         sliQXQZnyHyaTM6NPFDG18Yk+qdkkL8wQiVzPv6kJywbOUYcl53N9MLEorH0zUcmClsc
         LktkWjzILnbKoVh7fjwQzv1zG8W/gOlymJ/awVLz6SvHkKt8Dk1TXNDm0J1I4sF4o5l2
         68PCrolAVXSJqK9JuVHgJXxowqctXmXE4voyT0nIm1Z0ca+WcIQZyZQw77L4y4IY1DNI
         gRXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blmSZ/5kJFI3zeITciWHkokHSMBiiI5BLOjMr13YsbM=;
        b=OKQFvyoYRgeYKf9Ez5A15sdxS9llsCm+6dGfIGUbp9ShzRd5bv1/vbvTWg5NrJltOx
         q5gI1rY1iVf+OQSlm54UVf8zY5elKPb3Sph7jP8HT51huChN/+8e+1eDoIgWws0a1xBU
         ER33zHTmivKNvZ22U0OJ1mri9FkRwkf/q5+LvjjSNH6XWhPskZxR8EuitMbpeuRlFODJ
         DyV/WBaYcD+/aMGC6YmDbjfo6UuL4Q1+2BWGFmSpOcS2YgNRidsw4M15sQ2Oyzji2KT9
         dhwYqn/Ma00pJkSrq+jZQhCZ2+AAwVmtvWo7wkK15sH8kFfNJ8TpSEv+ECOmRSFMqoBP
         LqgA==
X-Gm-Message-State: ACrzQf3eDwGYtqatIpNOHUn/ttNctFyvq8ndpfoe3UPtIKRHtIYNRpOl
	NlrIkRX2Mgtl39u/4Ue8HKk=
X-Google-Smtp-Source: AMsMyM5aYq4JVmyu990he+dAyalPgz9Z6iKvjICG1HRHf+BjVQ5Rczv+OanEopUJ0OpP5ta9aAHkkg==
X-Received: by 2002:a17:90b:3e8a:b0:20d:4632:e487 with SMTP id rj10-20020a17090b3e8a00b0020d4632e487mr37883228pjb.78.1666601377670;
        Mon, 24 Oct 2022 01:49:37 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id r2-20020a63a542000000b00434e1d3b2ecsm17245124pgu.79.2022.10.24.01.49.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 01:49:37 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v2 2/4] staging: r8188eu: make amsdu_to_msdu void function
Date: Mon, 24 Oct 2022 17:49:23 +0900
Message-Id: <20221024084925.262289-3-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024084925.262289-1-tegongkang@gmail.com>
References: <20221024084925.262289-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This commit makes amsdu_to_msdu into void function in order to
prevent cocci warning as follows:

  Unneeded variable: "ret". Return "_SUCCESS" on line 1516

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
Changes since v1:
  * made function amsdu_to_msdu void

 drivers/staging/r8188eu/core/rtw_recv.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index bb5c3b3888e0..a0d7cf08f933 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -1404,7 +1404,7 @@ struct recv_frame *recvframe_chk_defrag(struct adapter *padapter, struct recv_fr
 	return prtnframe;
 }
 
-static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
+static void amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 {
 	int	a_len, padding_len;
 	u16	eth_type, nSubframe_Length;
@@ -1415,7 +1415,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 
 	struct recv_priv *precvpriv = &padapter->recvpriv;
 	struct __queue *pfree_recv_queue = &precvpriv->free_recv_queue;
-	int	ret = _SUCCESS;
 
 	nr_subframes = 0;
 
@@ -1512,8 +1511,6 @@ static int amsdu_to_msdu(struct adapter *padapter, struct recv_frame *prframe)
 
 	prframe->len = 0;
 	rtw_free_recvframe(prframe, pfree_recv_queue);/* free this recv_frame */
-
-	return ret;
 }
 
 static bool check_indicate_seq(struct recv_reorder_ctrl *preorder_ctrl, u16 seq_num)
-- 
2.34.1

