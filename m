Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B2D72
	for <linux-staging@lists.linux.dev>; Mon,  2 Aug 2021 15:58:23 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id x14so25133131edr.12
        for <linux-staging@lists.linux.dev>; Mon, 02 Aug 2021 08:58:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1p33HmH3Rqzb0j02d5EXcRKxYG7aRHOch7Hn00zmgEM=;
        b=Fw9S3Q1mgoh8IYe3h4YdyOjG6cQIs8GICy9Jrb6DTxnswN9Ujnl8jtfZQXjhiBW+Om
         ZNh84SiDpJQqj/KeuLALSGTh0w/NsgFS6yOR5Wr/h9v9+InNO1gEMOdc5adET/DqOnpj
         xppBnAHB0Zgo5hespKNovBAX10Qw3VJo5AjwB3Op6NDQ83vJrXeEd2ECjD/2AEfFMeRs
         5CkxOouJX8S2LxbYfDQuiHv0aprvhb9lkv5XFeziT3iyFM+H7ECFhwgc8TfoVs1PXHjN
         Syj223ofCY/8RZLqX21IVFUuQuv3pJErc+nNQ/ThqDAMe1cWP3fm4W4W+gPHHaPCCyo/
         GthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1p33HmH3Rqzb0j02d5EXcRKxYG7aRHOch7Hn00zmgEM=;
        b=Il2h+ZB7nlRF7WqgrC5TnZF6F4/PwrV5v6DNAR0t1W/ytyPx78qo/YtpNjPjWQpQLo
         2sZU3nWAatqsfBCfelNahKsnoOHsRWEJi7piar7p8kKcdUPRWFRxsIptJSpARw2yMNBA
         Da2FlXlqdfJhA57h+b8TT2QGmWWyJ4b0DbzZ9uzDiB7191Kp/0Y1zxtFNWeen/dBiwWo
         YzvuLthtV5xF0y6+iqdloYQxJ/UEvdNkvLl4dJiN0XMfe9ysjGJkczTAkIrm+Ko9JGg5
         Gg1hIgcUGKzns62P57VCCEzxP1WXKzKRQyilj8qRwyDJHvwXHeRfKNm92Dpw1FClKoNN
         6adA==
X-Gm-Message-State: AOAM530i3BCM4GnzfeRcXKtTZ3CpzN8I3+pO8eZl6Gn/97VpQosAcISw
	9ulNOjZ5w/FpY9yR0GZNWLc=
X-Google-Smtp-Source: ABdhPJzUN/sG7SRSGjB/NaBW8o07Ix3uQ28IDC0ybg4f9j7rEjoYA3FgAnihWsSZCkgJdPpg9y82ew==
X-Received: by 2002:a05:6402:1cb3:: with SMTP id cz19mr5256187edb.206.1627919901581;
        Mon, 02 Aug 2021 08:58:21 -0700 (PDT)
Received: from localhost.localdomain (host-82-51-42-96.retail.telecomitalia.it. [82.51.42.96])
        by smtp.gmail.com with ESMTPSA id f15sm4815590ejb.125.2021.08.02.08.58.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Aug 2021 08:58:21 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dan Carpenter <dan.carpenter@oracle.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: r8188eu: core: Change the length of an array
Date: Mon,  2 Aug 2021 17:58:17 +0200
Message-Id: <20210802155817.8179-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

IPX_NODE_LEN == 6, while addr.f1 should only have 4 elements.
Replace IPX_NODE_LEN with 4. In the while, remove the excess spaces
before the fields of the union.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_br_ext.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_br_ext.c b/drivers/staging/r8188eu/core/rtw_br_ext.c
index 8f434768dd15..c585224080c6 100644
--- a/drivers/staging/r8188eu/core/rtw_br_ext.c
+++ b/drivers/staging/r8188eu/core/rtw_br_ext.c
@@ -137,9 +137,9 @@ static inline void __nat25_generate_ipx_network_addr_with_node(unsigned char *ne
 				__be32 *ipxNetAddr, unsigned char *ipxNodeAddr)
 {
 	union {
-                unsigned int f0;
-                unsigned char f1[IPX_NODE_LEN];
-        } addr;
+		unsigned int f0;
+		unsigned char f1[4];
+	} addr;
 
 	memset(networkAddr, 0, MAX_NETWORK_ADDR_LEN);
 
-- 
2.32.0

