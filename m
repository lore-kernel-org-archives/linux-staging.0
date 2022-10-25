Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DB37479
	for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 17:06:39 +0000 (UTC)
Received: by mail-pj1-f47.google.com with SMTP id h14so11439962pjv.4
        for <linux-staging@lists.linux.dev>; Tue, 25 Oct 2022 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=lVs5bh8/oQHRESDcFisg9lo7D0bWmjFZK7WMEzSUE/Wupu20lHGa8ZZ0swCrET1kp6
         EUESeWrnWtmUczokeCku2Lr6VYmVHBfWvEb9AjdujPeP5FWQz/wfPM1mBxqBFLyp+zG3
         tLdkucVzgvsuzHpY21/fbkCzppL7mgsVOKUNs8QShrobxdhOxu+aP3I3Z5M8EzJzeR8r
         ufvTd81wt8hru+wiQ9PiTEVDHyq0MsvGHh+lRCkGiwaODf9MwuD4t5GpQzt4khykYs9R
         Do8MaGZ+PJfMrwCItQMoDnjkQR7/Mwga5iEScE7wceQzXWKw+U7Iiv0DTJ0N0G6pXXAd
         PlMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NnolCiMBjl8qX8ASTYaNnJALNGKZaQCXHfWumAnTsTM=;
        b=ISt289wIbr+/qbDad4h7R+ZZWajlD0KUWmwlSOlDsJL0WIaCAavDY2XBwkHkgbwsLV
         klYxOG3+PmdNpEGyDpISAuOyUh/t+j3pBYW4sZcEV2w1BIXKnniuEMu0oDinbTeE38s8
         E9ow+7NNDdOv6Z5+iv49LyQ0nOd+wCAHbhuU/FQWXAxFZVJETKjrD7Y4NC+tGsBqHB9h
         45rwX4qkzcnvbD6FwcUyjF8ag9Kc6hKjRF5b2b2epaIR0QABdi2z2weoIO7k58B3Le76
         yeSBkS01hcuZBIDBgPZ0XKsudo9+0gkPAP+9JQ9K3vsATLxhrot3lhj1/zqZoES0T074
         r57Q==
X-Gm-Message-State: ACrzQf14OVsGNfLD7p5OzU1otlNeZJmQkqTiqZCDkey85doyOk7J8kNf
	yXB9sui2rFsuW5ZzSXnQKBTAke5g20vF7tb6
X-Google-Smtp-Source: AMsMyM46RVO00ix50JydjeIEAt2SD42HXOx4aWmmfYUD4jW0NJEXO4dyTBPbyt8gECZ5QFcE/GYQlQ==
X-Received: by 2002:a17:902:e750:b0:17f:71fa:d695 with SMTP id p16-20020a170902e75000b0017f71fad695mr39684804plf.105.1666717598588;
        Tue, 25 Oct 2022 10:06:38 -0700 (PDT)
Received: from uftrace.. ([14.5.161.231])
        by smtp.gmail.com with ESMTPSA id a1-20020aa794a1000000b0056bcf0dd175sm1592373pfl.215.2022.10.25.10.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Oct 2022 10:06:37 -0700 (PDT)
From: Kang Minchul <tegongkang@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Pavel Skripkin <paskripkin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Kang Minchul <tegongkang@gmail.com>
Subject: [PATCH v3 3/4] staging: r8188eu: remove unnecessary variable in rtl8188eu_xmit
Date: Wed, 26 Oct 2022 02:06:20 +0900
Message-Id: <20221025170621.271903-4-tegongkang@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221025170621.271903-1-tegongkang@gmail.com>
References: <20221025170621.271903-1-tegongkang@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Return 0 directly instead of storing it in a variable.
This can prevent cocci warning as follows:

  Unneeded variable: "pull". Return "0" on line 298

Signed-off-by: Kang Minchul <tegongkang@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188eu_xmit.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
index 8e4a5acc0b18..6d1f56d1f9d7 100644
--- a/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
+++ b/drivers/staging/r8188eu/hal/rtl8188eu_xmit.c
@@ -149,7 +149,6 @@ static void fill_txdesc_phy(struct pkt_attrib *pattrib, __le32 *pdw)
 
 static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bagg_pkt)
 {
-	int	pull = 0;
 	uint	qsel;
 	u8 data_rate, pwr_status, offset;
 	struct adapter		*adapt = pxmitframe->padapter;
@@ -295,7 +294,7 @@ static s32 update_txdesc(struct xmit_frame *pxmitframe, u8 *pmem, s32 sz, u8 bag
 	ODM_SetTxAntByTxInfo_88E(&haldata->odmpriv, pmem, pattrib->mac_id);
 
 	rtl8188eu_cal_txdesc_chksum(ptxdesc);
-	return pull;
+	return 0;
 }
 
 /* for non-agg data frame or  management frame */
-- 
2.34.1

