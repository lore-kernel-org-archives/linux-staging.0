Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2FB42CA1
	for <linux-staging@lists.linux.dev>; Sat,  1 Jan 2022 08:18:10 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id w20so50618213wra.9
        for <linux-staging@lists.linux.dev>; Sat, 01 Jan 2022 00:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=df3Y5Bn/VrrxiPw//+w6cx+2LKPl8gWDj/0uHtI1CM0=;
        b=aOv0J6t/QsEzD6fRmR6ObgtEJcbNbQvfK0pEA6WGYf6i8L4nvmpoSjii8r6qsb/fcF
         fuwIK0b6uZayUpQGhOJUGLbr9MzhuVVK7QK1t7s73aXCZyY4AbMbRwziWV8O9tLThlgi
         YXD/ERSTYJQbrZWJ/N1TzjGjWHihfmSKXm76sb8gUQ/Q81r1Q+pAuD/No85HHPLYZXeV
         usy7g3Y49yWmQYXoP1ccA7cyyvm1pKTp/tWuj9Uq4EJs44es6/BCD4g8TYrArS8bbGX4
         f0rAMVVPF4mpUj0Yooy2xiOJrF8AlMF4zQhRwtCEixdLgGRrCriRaP041l+ItUnwPdfQ
         0mCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=df3Y5Bn/VrrxiPw//+w6cx+2LKPl8gWDj/0uHtI1CM0=;
        b=O3CRZz/znq2MaWGh0beeW6IbAhILdU6SIQY5EBpyXQwAAOFiLzofRNmk+SZu8QcRLv
         AWnZmd3tIaBS8fy1uM/SxEndAHLQMMRwJm/C02LagquG7A6JyjPK5jx6KKQjARHZWH6S
         50yNE2BWNLvHJLJ8X/LQnA9Euo07/omVn15hRqvRzOfI4xtuGUASESKYE/+wNPhuB07g
         NEWH9y7PxLPSdrMrjK+4FBzYEt39Hv8r5O7kwv4b4Jt9n+NnZExxu6VyI68H+K+gwLJI
         yKYFEgEG1emOZZLcgftf44ZKE7kwXgCsIrD6XkMcOol4LqrL2azBSMuZ81CwZX8uzrao
         r3sg==
X-Gm-Message-State: AOAM5339ODgcKIgvm4Hh2H7YJe2bcL5DHwUCEVA5CBSlysxkb7WASq2r
	w/3P8TEF0dqG/tRk54Nin9eOvpXI5Og=
X-Google-Smtp-Source: ABdhPJxad99z1MbSk9y/fKaDaVUSYx8S6KMiDGBFiwBOoOTbvVMU66uJ0qyhawudDmYqp0HFKzXN7A==
X-Received: by 2002:a5d:6709:: with SMTP id o9mr31470420wru.356.1641025089198;
        Sat, 01 Jan 2022 00:18:09 -0800 (PST)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::6619])
        by smtp.gmail.com with ESMTPSA id u9sm30693651wmm.7.2022.01.01.00.18.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Jan 2022 00:18:08 -0800 (PST)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 7/7] staging: r8188eu: FwRsvdPageStartOffset is set but never used
Date: Sat,  1 Jan 2022 09:17:58 +0100
Message-Id: <20220101081758.9716-8-straube.linux@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220101081758.9716-1-straube.linux@gmail.com>
References: <20220101081758.9716-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The field FwRsvdPageStartOffset of struct hal_data_8188e is set but
never used. Remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v2: no changes

 drivers/staging/r8188eu/hal/rtl8188e_cmd.c     | 3 ---
 drivers/staging/r8188eu/include/rtl8188e_hal.h | 2 --
 2 files changed, 5 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
index ca24e17c369d..a491c37777df 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_cmd.c
@@ -440,7 +440,6 @@ void CheckFwRsvdPageContent(struct adapter *Adapter)
 /*  2009.10.15 by tynli. */
 static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 {
-	struct hal_data_8188e *haldata;
 	struct xmit_frame	*pmgntframe;
 	struct pkt_attrib	*pattrib;
 	struct xmit_priv *pxmitpriv;
@@ -461,7 +460,6 @@ static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 		return;
 	}
 
-	haldata = &adapt->haldata;
 	pxmitpriv = &adapt->xmitpriv;
 	pmlmeext = &adapt->mlmeextpriv;
 	pmlmeinfo = &pmlmeext->mlmext_info;
@@ -480,7 +478,6 @@ static void SetFwRsvdPagePkt(struct adapter *adapt, bool bDLFinished)
 	if (PageNeed == 1)
 		PageNeed += 1;
 	PageNum += PageNeed;
-	haldata->FwRsvdPageStartOffset = PageNum;
 
 	BufIndex += PageNeed * 128;
 
diff --git a/drivers/staging/r8188eu/include/rtl8188e_hal.h b/drivers/staging/r8188eu/include/rtl8188e_hal.h
index 239d0db55639..25f3c04e81b7 100644
--- a/drivers/staging/r8188eu/include/rtl8188e_hal.h
+++ b/drivers/staging/r8188eu/include/rtl8188e_hal.h
@@ -230,8 +230,6 @@ struct hal_data_8188e {
 
 	u8	bDumpRxPkt;/* for debug */
 	u8	bDumpTxPkt;/* for debug */
-	u8	FwRsvdPageStartOffset; /* Reserve page start offset except
-					*  beacon in TxQ. */
 
 	u8	OutEpQueueSel;
 	u8	OutEpNumber;
-- 
2.34.1

