Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6991F7B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 19:43:00 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id z14so8504620pgh.0
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 12:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1QG1QV5jcE/qCLfJfakMMrZfmCDBIgHiC1TqIeZ6eiw=;
        b=Bg5wNP2vtH4T5PvHSN81HgF4Uq+0i1xgkp7/rVE1jy1X7tSe1mgVoMRU34u5KY6iMP
         XMYUI5pRSUiHRzHyYcXZyP+5PmaKwWlA/owFceB9cXDNkWntzekvzSDCpbvFqaJcNyhp
         zzvYj/jDCf9PbS7McbEgvyEgSf7afOhu+tZXwFWQIPocHx720KDHhGMpDvcwRvfosY7s
         uWNdPZtMOGsKtT1bqJZdSqwBaPi5IMvm/6flXaE8T7hPaSRf5hHMVZg570GWmcXmWQD7
         H1yLXbefH6NIGPYxYyr959h/+CJjY8H0EfikLjQLkCqUd2VCgm15pCkrLSglyi0Y38vg
         Qs0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1QG1QV5jcE/qCLfJfakMMrZfmCDBIgHiC1TqIeZ6eiw=;
        b=oQcZwzd/goQ0WD5TylZCa0mZ2+SREOzA3iB3Nl5Lcs39s/qK3N4FAD/wJywL04Goc7
         WtM07i8UFXH6RJYmrCWYYZhsQcZCQzNm83pYK13UYnQkgQ75Q9PGqKUorRdgrPGcQ2Vr
         Hwt+9qhqlXTAvWZDFqe8W8p6ittri6cUy3ORbTPEpjpD8YTRxdgLeu4jmciAj1Ld9zbE
         7OuWcSJWF5/DHgOXnHNxbgdqhAgQ9MuCY23bZzhJW1dgkerUJSXggV03yKZgnzw6WCfm
         wBh44n/it+7/PZZB5j9l4rwUaNGXIhu6yhhZPiume4d7q/Mwghz688K81LPbu8+K0wC0
         J3xA==
X-Gm-Message-State: AJIora+ndEwIlUcucq7FY0ADJpdf31woUneUaQHvbr3+MP6WOV8vRYC3
	MG9nFlTX3KRQ03Z1rs74aIg=
X-Google-Smtp-Source: AGRyM1vZOBA2oL/DgQZnkKqx/28nVDqd8GC8NhYH4bNg9UxNtjFJlAKA+akFEVtuVNGCjb7xRWETHw==
X-Received: by 2002:a63:7d44:0:b0:40c:8cb1:eeaa with SMTP id m4-20020a637d44000000b0040c8cb1eeaamr6450551pgn.597.1655667779852;
        Sun, 19 Jun 2022 12:42:59 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id i185-20020a626dc2000000b0051bf9159d2dsm7406414pfc.208.2022.06.19.12.42.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 12:42:59 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	paskripkin@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2 5/5] Staging: r8188eu: core: rtw_xmit: Fixed a coding style issue
Date: Sun, 19 Jun 2022 12:42:31 -0700
Message-Id: <e938a8ac0ff3a9d777754a081c7a08026aaae253.1655666628.git.marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <cover.1655666628.git.marcus.yu.56@gmail.com>
References: <cover.1655666628.git.marcus.yu.56@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Moved the constant ETH_P_IP to the right hand side of the comparison as
per checkpatch.pl

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_xmit.c b/drivers/staging/r8188eu/core/rtw_xmit.c
index 6797335f7855..943422141c8b 100644
--- a/drivers/staging/r8188eu/core/rtw_xmit.c
+++ b/drivers/staging/r8188eu/core/rtw_xmit.c
@@ -443,7 +443,7 @@ static s32 update_attrib(struct adapter *padapter, struct sk_buff *pkt, struct p
 
 	pattrib->pktlen = pktfile.pkt_len;
 
-	if (ETH_P_IP == pattrib->ether_type) {
+	if (pattrib->ether_type == ETH_P_IP) {
 		/*  The following is for DHCP and ARP packet, we use cck1M to tx these packets and let LPS awake some time */
 		/*  to prevent DHCP protocol fail */
 		u8 tmp[24];
-- 
2.36.1

