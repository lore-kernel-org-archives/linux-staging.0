Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D96529DB86
	for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 23:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782169495; cv=none; b=S3jrfygn0v5avsUwJD+ETtkWdCWsdCeCyo6sc2lg+UhKW40cxa90VCytPOw79fXTvY7x+3lBN4W8h3Mp08ad26xPXSPK8pey7z0ly3IEEho6Nx7UbdV0QGyCr6C6fNwKx4JOGcy9VRrQl90MiFHeNgzt6vT7E4/NVXiXawnwqTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782169495; c=relaxed/simple;
	bh=e6XqK9MU2LKJCD85rEqfteDcgC0Xnpj4etmsMR6CffU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ODpFt5ksuXzgKmfXgprNfk0fjuoPD70G9AMvtMyTDAF9dzjloF5iynEkhK8bmdmsD0zgTLFknhNeTZ/eJ5q4hFW2Z4SFM6SxqgEOVSD4hj5DCbIh6gGtzehiMvT+3i1u0qT/+vaqJVFiDd3swbQhu1S8AOH11ef4kYuMYXeGhpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NAMpvOoM; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NAMpvOoM"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49222fb062bso52040095e9.1
        for <linux-staging@lists.linux.dev>; Mon, 22 Jun 2026 16:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782169493; x=1782774293; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=0C8B5CywjgF9ZPTIkHDu8dM/V21pGTSKDvMIJT0sdEA=;
        b=NAMpvOoMS0dJRoyXC0PxSmDGzDIVp8tu4NkO8OX8oyGEyZc/QONr0J7t+q/xdUoyTA
         C7ObfdxnDeIceLfDrY/4ZC1/NVgsGdxxz9qlVMcxXlFYpzsMYKQQpaNe2TX8AI2Q/X5R
         Tt+oNRDXGmxGBl/3VZRzOz/5MjgRuJwrh8SxTso6XtKv+2K2WzvrTsOe9/uB8vXtXVtp
         QGXzq+aeUoW8e2arLJr7ioKGxNMs2zYxwmXTQrs9a37Po5Rm6M8IXZ/wc/DplEy1gUSC
         +iWKuVfrOu6EjcLHOQBLMIfnt5dpW6inmH+q2bIbrrSn4m6ARqSe1iWZcbuoxfWhr6S4
         7W/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782169493; x=1782774293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0C8B5CywjgF9ZPTIkHDu8dM/V21pGTSKDvMIJT0sdEA=;
        b=OowKwsfAMR+dYnIVfVXMais+/lgstHuX3r97LwJjdhBp7dLW+IsqMm8MR36VBZtlqH
         1j5xtz57sE6IVTknNewYiPnkxBZ5NbBGDCbsuIxOnlvem9FKwxfX8cXLXc6X5Wgo+sIN
         PLrOi44JS183lBFvYVwtCIKFSDgFMeqcdzCf7GxSAjCm3m+26fXGRaL+HGRCTkq0VOVQ
         Czt9xDdTiymxn4mujwzVf7DsNLBexy6NlnFmQlv+LL8twY5YSmg9pTOouA/KbtJ4s9Im
         sL9pFEnLeH5gAmCicnV3taawMz0ualT1ep3CyleVXwhbeytjXrJZQ2GlO6Bfs9XrOUcz
         6UVw==
X-Gm-Message-State: AOJu0Yxu2QwH2DWLdw4GWQHjZ24IpkuwhYn0XYbB7IL9n9ypb5QKn1ga
	av69/h3eRX7+r6rCYinjr1D2Cg/WfRBwZMlSWtFH94mJ+eAaHW5PUarc
X-Gm-Gg: AfdE7ckCv/Hnn+D6tldUWR7UvKnXMHLE3CRuqNvAzZQHfNpg3wpHLTLgXi3eF+fsVZh
	HfIouZWOritYdFoACG0lJxwGICjGiNuhrb95hDFhYbY/dThpMmcQar/pbYVH/nI9xQj7kIBls9U
	GaLwML5dIYH1iM1rUT49XdBHEkILU3IcXFAn+vYEP1v6Zz8gqZtDhoe76jx/tlov81A8ahb/8E3
	1dzqriIIqNnAeD3i1jMtryXRy2vl9C/BGLjt/QwTnjoxjH3PSz7JosJrOEEQd+LHBAPoN0XVeEt
	JPG2hKx5LMEBorJ9u0dxjIpraOSdPdQ6eCaKGG03FXi4Jkx4WMoeCFU31+2Kx9vA9RUayFKzt6A
	PBE1kbPvteByElgA6px4I328MVj4V/S0KEk5Uf5WkYDQvsYbrzSVEfUp2gUWfiQWiWY1KOkYIBF
	7FTo6k+L443OXbSVJL9Yy8fZZkyX4=
X-Received: by 2002:a05:600c:8b2e:b0:490:e5c1:b8bd with SMTP id 5b1f17b1804b1-49240dab540mr299031845e9.0.1782169492671;
        Mon, 22 Jun 2026 16:04:52 -0700 (PDT)
Received: from localhost.localdomain ([86.2.40.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4924923914fsm256832275e9.6.2026.06.22.16.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 16:04:52 -0700 (PDT)
From: Ganesh Harshan <ganeshredcobra@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	khushalchitturi@gmail.com,
	dennylin0707@gmail.com,
	Ganesh Harshan <ganeshredcobra@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix timer rescheduling in rtw_cmd callbacks
Date: Mon, 22 Jun 2026 19:04:48 -0400
Message-ID: <20260622230448.4138-1-ganeshredcobra@gmail.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ensure scan and association timers are deleted before being
rescheduled when command execution fails.

Without deleting the existing timer, multiple timer instances
may be active simultaneously, potentially leading to duplicate
timeout handling or unexpected behavior.

Use timer_delete_sync() to safely stop active timers before
rescheduling.

Signed-off-by: Ganesh Harshan <ganeshredcobra@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b932670f5d63..967c3258e0b8 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -1801,7 +1801,9 @@ void rtw_survey_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
-		/* TODO: cancel timer and do timeout handler directly... */
+		/* Ensure timer is safely rescheduled */
+		if (timer_pending(&pmlmepriv->scan_to_timer))
+			timer_delete_sync(&pmlmepriv->scan_to_timer);
 		_set_timer(&pmlmepriv->scan_to_timer, 1);
 	}
 
@@ -1829,7 +1831,9 @@ void rtw_joinbss_cmd_callback(struct adapter *padapter,  struct cmd_obj *pcmd)
 	struct	mlme_priv *pmlmepriv = &padapter->mlmepriv;
 
 	if (pcmd->res != H2C_SUCCESS) {
-		/* TODO: cancel timer and do timeout handler directly... */
+		/* Ensure timer is safely rescheduled */
+		if (timer_pending(&pmlmepriv->assoc_timer))
+			timer_delete_sync(&pmlmepriv->assoc_timer);
 		_set_timer(&pmlmepriv->assoc_timer, 1);
 	}
 
-- 
2.47.3

