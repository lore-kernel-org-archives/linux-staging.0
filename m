Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81E2823A6
	for <linux-staging@lists.linux.dev>; Fri, 23 Aug 2024 00:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724371764; cv=none; b=TcpXgpMihXgBzU0UwfjgBScluPO620eKBHetDUKn/q+zo/bjYmQrHqyx4zC/tx1Sas3VKtO99NLGE9cBu8CMf6pFRjW+sS11p3VCsuWTHoIPOg5InFId8fM2DsPy+W2NpTGBilyI8b/dOCtIyL6IeqDwf0DymOCW0lNFSo4zaP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724371764; c=relaxed/simple;
	bh=hA27Acavu2EyyJ2z4AyZaycmGEzHi0d+myJUi+8/jEU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=G3Pnz1CX1YV991cty4+YC1p/mG/U2khUVX2/7WeI3fRmn3VCS91DBV0bpgk+2/ZgPrnXyCtzJfAvUdCdtakiDYv+BVZMYv8N7WAJ6z6G3auNt7fGdzdhfJnzF0Ku9CCKFlAtUAWamOqSCqTh/hUnEIjwOy/+0evtAaXLSC8Umh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HOXsmGug; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HOXsmGug"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-1fc611a0f8cso12264765ad.2
        for <linux-staging@lists.linux.dev>; Thu, 22 Aug 2024 17:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724371763; x=1724976563; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vvt0ex9BegEGtLMzUiCGOFHSA3hOaJJE3WEIXWRzp1k=;
        b=HOXsmGugyt6qFAjihVdy58zPlKgoJh0mwhlPf11wyA2Yk8Vxnkgam8vyGR2WPfCZ5u
         uaS+bTI5/NTjIKwmM+uMOJyg0Mp9dMrIw89qRVSCb2LOW/ynr3XJkTbAihcVePcgN38J
         IfRH1FlJoUEmL7twywURacnAwYQy4S+ILVlyRj1HoV9+qxNG3HrejBPAneLJ76vD0Gvo
         eH6ECKjXrmR6y6mc2hRYBjMBtVz18t1Ckl/zkaieF2yahMRVVJcuzZ+hSZ22AIJsIl0b
         UZ9rsy5qmN95nyrN4hDNHzQ2+lW41t5LUJRXGSco7oJnmVu+aIxcmd47fmAtxLTzbbIB
         39EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724371763; x=1724976563;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vvt0ex9BegEGtLMzUiCGOFHSA3hOaJJE3WEIXWRzp1k=;
        b=YLLRggstqTHkP60QvxhAutcH4GozU4yZBxVVOl2X4NaWU2p+HaK/WE+gufVOJbBgXe
         Q9PyO054g05o8eW/IjUZ+eFCkHHkyYmZtiskzjFDZ0vPL5spLLZXMAXSipjo1XOCwKen
         V3bbodhYlwxcqQzfeZD6llfUTzmVlgBvfO2mNevOPC9xgtSeFnDFnqMGV0BxANRDboLw
         dhrnw1H3kqKXjB7YQ6EV4o/93IlDOE6gdZ16ewAMSrmIBV7H6z9PQ7rqkEaifkW/wHmF
         rkQO9RujhUO60uVz9hPkbXhJ45W0D3x1QzMCXZdy7ptHBcxIpfl2/rq7qJGxoxUDcJSE
         rElw==
X-Forwarded-Encrypted: i=1; AJvYcCVKec96Ek8khLFmWy0vIrh7km8je0eMTFpUmnc7KBvJCCLgMv9d4K7bTWeGZNE3CX+1X9ztXIakH4DC81fj@lists.linux.dev
X-Gm-Message-State: AOJu0YyG+sjjjrAFYThIABAMd1xEKHkjb5EMS5DV/uVEtZE0RgMlsmX4
	q7EwZkyzB8MqtNdZ/TuDahDDg72f7T5Qri9m/nE86bpctYQQZAVX
X-Google-Smtp-Source: AGHT+IFR3GD/p1xWhPkLV53qi9g6xLAFAvfUm95HTxI8mb9LaOVf9w8Eu+LR2bkAB8iJkium3I0K6w==
X-Received: by 2002:a17:902:8541:b0:1fd:aa8d:ace5 with SMTP id d9443c01a7336-2039e4d7dd2mr5450775ad.23.1724371762670;
        Thu, 22 Aug 2024 17:09:22 -0700 (PDT)
Received: from localhost.localdomain (dhcp11819.ime.unicamp.br. [143.106.118.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385608eb5sm17929185ad.188.2024.08.22.17.09.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Aug 2024 17:09:22 -0700 (PDT)
From: Gabriel Maciel Raad <ffunctor@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	~lkcamp/patches@lists.sr.ht
Subject: [PATCH v2 1/2] Staging: rtl8192e: Fix parenthesis alignment
Date: Thu, 22 Aug 2024 21:08:37 -0300
Message-ID: <20240823000838.8207-2-ffunctor@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240823000838.8207-1-ffunctor@gmail.com>
References: <20240823000838.8207-1-ffunctor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix parenthesis alingment in rtl92e_leisure_ps_enter to silence the
following checkpatch.pl warning:

CHECK: Alignment should match open parenthesis

Signed-off-by: Gabriel Maciel Raad <ffunctor@gmail.com>
---
Changes in v2:
- Split the changes in two patches
---
 drivers/staging/rtl8192e/rtl8192e/rtl_ps.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
index 5aac9110bff6..1f881c27d4b4 100644
--- a/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
+++ b/drivers/staging/rtl8192e/rtl8192e/rtl_ps.c
@@ -204,7 +204,7 @@ void rtl92e_leisure_ps_enter(struct net_device *dev)
 					&priv->rtllib->pwr_save_ctrl;
 
 	if (!((priv->rtllib->iw_mode == IW_MODE_INFRA) &&
-	    (priv->rtllib->link_state == MAC80211_LINKED)))
+	      (priv->rtllib->link_state == MAC80211_LINKED)))
 		return;
 
 	if (psc->bLeisurePs) {
-- 
2.46.0

