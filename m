Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A550E3FC3
	for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 10:02:56 +0000 (UTC)
Received: by mail-pg1-f174.google.com with SMTP id u18so9219344pgf.0
        for <linux-staging@lists.linux.dev>; Fri, 17 Sep 2021 03:02:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=px6g63+FWM02o2XFrJusr9ULh6BtbU2yNZkDpWVUktI=;
        b=p+C+uIIDNT8ekPB5dFw1M0P59Zpt53V9WWsD0bc1xmbj/DkMCX2igZ0nH3pL2mWyZ9
         R3YH9giXxQglXgwbrLOpkC6YuUnmPj52usd37gMguP0fvwjJrLxID/zJKfB1WGcVwveb
         63pxgWUO+vhiHhG4DkJoAGYjr9xxoC/YPTEIdJvERftT0HdBKjG6cd7ZxW+cYMl58VCW
         gD8z1hw5zs7b/qMAevWfbD7adSbgU9W0eAQegSr2zhdAXlPEIf414CcjYASu8x6FN0XW
         /7O0eOMsAkQvN3Q39bGU3hQr49aIrYmXkJQvNEgLSswGRThiYYJmM+l+ijPHfzLQ0Zb9
         YgLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=px6g63+FWM02o2XFrJusr9ULh6BtbU2yNZkDpWVUktI=;
        b=3k4xIuNV2AnIz5nFWHVNl6ps7DNH2bAI978++bp6dZN2s7SWOpd0xiaqw9rZxlV9Ot
         PR6haAAD7snghC+uwA46gI0qCyP1HElUIC+z5LoYgc0ScTdwK5pZxw/awodqMlaOKGvU
         98k/VrJrzS3Sigfn3I1MRazYF8u3rCll8bWaZXYdJksaq1WniogTQMsNQ5HJoxyn1nKS
         Bq+7AGwiLMowZftXEAbbXG9JHoieV/2CMKi7tdtiGLDIA/iDiIUHqy05dhR4CexoroF8
         FRvM16ESIAjkBZjDCpHcR3N25ONhBEe21Q3dRVG2i14W9/FRVFu4pHsL/A4I1HAMNoG9
         G+5w==
X-Gm-Message-State: AOAM530FNgPf1p71G+0apgcCGoDf6b5mQSOv/nhtYxXtvD3XZ7ZdjOnY
	y1Snc9qpt8salde1EsOMKMQ=
X-Google-Smtp-Source: ABdhPJxqNEeGPI37hs2MV6DCLYp6Mr/5jTrkhYpZoSGk6BwJA9S97cIWaF1tiRqb4xNme5BjdUWlRA==
X-Received: by 2002:a63:6544:: with SMTP id z65mr9126289pgb.325.1631872976128;
        Fri, 17 Sep 2021 03:02:56 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id h13sm6102604pgf.14.2021.09.17.03.02.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Sep 2021 03:02:55 -0700 (PDT)
From: cgel.zte@gmail.com
X-Google-Original-From: deng.changcheng@zte.com.cn
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	nathan@kernel.org,
	fmdefrancesco@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] staging: r8188eu: use swap()
Date: Fri, 17 Sep 2021 10:02:38 +0000
Message-Id: <20210917100238.232576-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use swap() in order to make code cleaner. Issue found by coccinelle.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/core/rtw_wlan_util.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_wlan_util.c b/drivers/staging/r8188eu/core/rtw_wlan_util.c
index 26106dd06d56..3d1d8c198e53 100644
--- a/drivers/staging/r8188eu/core/rtw_wlan_util.c
+++ b/drivers/staging/r8188eu/core/rtw_wlan_util.c
@@ -584,7 +584,7 @@ void WMMOnAssocRsp(struct adapter *padapter)
 	inx[0] = 0; inx[1] = 1; inx[2] = 2; inx[3] = 3;
 
 	if (pregpriv->wifi_spec == 1) {
-		u32	j, tmp, change_inx = false;
+		u32 j, change_inx = false;
 
 		/* entry indx: 0->vo, 1->vi, 2->be, 3->bk. */
 		for (i = 0; i < 4; i++) {
@@ -599,13 +599,8 @@ void WMMOnAssocRsp(struct adapter *padapter)
 				}
 
 				if (change_inx) {
-					tmp = edca[i];
-					edca[i] = edca[j];
-					edca[j] = tmp;
-
-					tmp = inx[i];
-					inx[i] = inx[j];
-					inx[j] = tmp;
+					swap(edca[i], edca[j]);
+					swap(inx[i], inx[j]);
 
 					change_inx = false;
 				}
-- 
2.25.1

