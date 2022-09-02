Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329710E5
	for <linux-staging@lists.linux.dev>; Fri,  2 Sep 2022 03:26:36 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id y127so675691pfy.5
        for <linux-staging@lists.linux.dev>; Thu, 01 Sep 2022 20:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=s6bst2A0kCUrqDNhcQ/B6E8Aii0yys2KniBEwPWQ3OM=;
        b=V6tNgyVKRSrrQ0mQrbqdGQWb/KuJ0IygBc8Ge8Fw+9ANh7bRUfUgCIf9pHXYUMKXTW
         CCxrHeif6nsL984E4fJF4jw0vhc1eYa9FfZjczRtcwwXJi6thTO3W8eHDoQlMeR9kpz9
         ra60yV1HeUzvL7GiKX3nmomtmr42wOpGJqIIqMszIf9hkvTPBcXLVa9eO+RFx2QF3Y57
         syifW/LzQOEYCn6zlf6NBNXOgRT8JGxBYoE+VXbOrtw5v+VYrwFXSDG3n5SX+4KB5OKX
         oAhlB9YEtVS6pwcorCxBtIrT1oiesQnlJ571Wj5aGLzsDeL/TrY0TxtQuTH3Q3pBSGFZ
         TQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=s6bst2A0kCUrqDNhcQ/B6E8Aii0yys2KniBEwPWQ3OM=;
        b=QYfX4D040+A3x1BhZle9SAuLdh1iM6pBOD6TMQTVVuSYjqOhjc+ty3Z6PFaijovUYz
         2n8Plts9JaIJj6M0cz8kvbxj1uyhPa/ZcZcBCC+eI2TZWEK5XxjsTcPNTrRn8UDXLVMG
         wt4z9y6DGqIE1jJtlrfGwMOWJsAQrTq9oUDHDMvLN2DY6hT2cuYmV/vXwpLMrJuq0w7X
         xz+MNLFgXqMR7aAU0EsSv5r2c5TiyKwQuDNrnxT+uAD7E5rdMELkEs70opT6ApXEsTiL
         jd64GUO0eh+QL4MW3wKljIwDp+O3Itam/TLyHCOPlEVyb4KIWbqzId3vvByyJnzFjiTP
         CGhA==
X-Gm-Message-State: ACgBeo1tXrGDqALv7dDvIzzG3GxH+F4vY/TFWqCEBvR3ykj8eZ5lez+o
	MEp5gH4NVsStrJw4bZivdFCz0ebISAU=
X-Google-Smtp-Source: AA6agR6cREVojBGB71x07geLCkz3NPUB311Jho7jljv31lYg3l61ezbzSqw7GphLcpVmvUtCBY5deg==
X-Received: by 2002:a05:6a00:2291:b0:539:d5b8:4ecc with SMTP id f17-20020a056a00229100b00539d5b84eccmr15866104pfe.79.1662089196077;
        Thu, 01 Sep 2022 20:26:36 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id k5-20020a63d845000000b0042a713dd68csm306538pgj.53.2022.09.01.20.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Sep 2022 20:26:35 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: lu.fengchang@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	martin@kaiser.cx,
	lu.fengchang@zte.com.cn,
	makvihas@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Zeal-Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] Driver: r8188eu: Remove the unneeded result variable Return 0 instead of storing it in another redundant variable.
Date: Fri,  2 Sep 2022 03:26:28 +0000
Message-Id: <20220902032628.316333-1-lu.fengchang@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: lufengchang <lu.fengchang@zte.com.cn>

Reported-by: Zeal-Robot <zealci@zte.com.cn>
Signed-off-by: lufengchang <lu.fengchang@zte.com.cn>
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
2.25.1

