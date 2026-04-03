Received: from mail-dy1-f195.google.com (mail-dy1-f195.google.com [74.125.82.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A2A3CA498
	for <linux-staging@lists.linux.dev>; Fri,  3 Apr 2026 17:55:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775238904; cv=none; b=KBnvEAhRITAECr8VYRN9TA34gFDJiXuWypBiawzy6JN+sODj4g4r9fSyp9UDSaTob2fKrN5gYogoMK5pbNmK8tY6y4F1qiccemDPjvzaRvsYJhmAlsMzhid11y9bugaMxHlUuLss+3mCjmxXMLtBi8bI+uoheMgBoCpClcsCIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775238904; c=relaxed/simple;
	bh=FHZFoafPVmQ8CtWz+ioWQ2Ilree0nJyaof4T+KKjOe4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=fFO76U0AeqVoZ3PFEakjYqtxIzUkkQfAXwqs5k63Eg/H1lJke9p2aoRHBihvaJcLw/Bzb3R3uqJHF/YvkNIhFUSkGT0nfTytgo9YLqtp/VwI75w/OjcuD2oYZZYlUdMzmOIRq4Wy2KnXVEbclZp3aoot5M8mDKiY/WPJtrdWpnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bsAgyqln; arc=none smtp.client-ip=74.125.82.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bsAgyqln"
Received: by mail-dy1-f195.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so4918964eec.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 10:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775238902; x=1775843702; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abqm6fs27TaKHAGVib64SrisD58cb14E8qBczQXcfmI=;
        b=bsAgyqlngepWJzLBgyA24YNiYi1+kn7acjeH0uekYELEhURIe6lsVyD+T4YlHQjbHq
         zd9EPsciWoHQ38Fg+VI7CsdjBWspegdk2C58mVbVG7BCk6IoGu1q392fWsMt/tkg7JkY
         kGWDestV6fEeFUrHASLcmff9RdO97k7k2IWpgNIbyW3VjUm8uR1Uj1G4fezsaL1ujeSv
         zh2iuDFcewccOAq0teg/tz/i5ZtlYeHXWup+XMbsGF8RqOp5ZssNxvJqcCy4Pjf1QK1O
         zB8VCbSWdUI0MeUzITqVfx5P0VS7uHIh9zPtkRJzybRLP0CdqKhKoYqp4za8I/9Xw3aq
         dalA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775238902; x=1775843702;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=abqm6fs27TaKHAGVib64SrisD58cb14E8qBczQXcfmI=;
        b=j0JXgBCyZ2xiijCKaoVYH4BFQzn+TSTXoK0m3u9fv+s0YW7dRLckU+AxBq8dG47vKY
         EPa7JRu5/u2WSxrVGF8n4+aZxy8xgwPe9QiVwTczByk1xnkIuE8/mySXvyLXOpAvF1dV
         y3p24BMwSYVQ3wOFizt2YDDzBqRNxn6tM4r68ULWyKhXl6Rd2rdRlwiuicB21QMe5MNy
         q6U6uJeRDky6s5oUvDgzvGvH8MChAu4QCUkMyR3g+vOG8z67gTf2H7/Ns3aG3CocdN2t
         /sHqLUTDz2zv1FZ/Zw+pvWzSv3NOTrgHx55yNpkYhKwG6CGH/lbHsXKilMo1FAf5I7hl
         uCgA==
X-Gm-Message-State: AOJu0YxoSpxcnOowQjvV6Lf8VV935MEjrtApDSalbX/rwBpTMszlOjs/
	J8LCAeEOuZ0eN2++kEEtHOHpOfDEepiw/whvseUh2YZ1lzZVFSymGNNN
X-Gm-Gg: AeBDievDOiXsX7UW+Fwmfv11ol27C4pPYIy7k/y419m6LAk1DrXOhypJ59JKl/SGmNM
	OMUm1Pz99ZscpoYqtVj+gZEx3SXRD37lQNBfrjoJvk1aYSKByGG5+kySJSweS07jC9uC9MX9eEy
	C1xQlkrXBowD+gWFCNSCOP+op2PrQIRfHFQWeeYtPuqOhClfmDZ8FEvkJHwZtu8nAd0aqo8O+1h
	2+/85hMry3SNkT99QKVkMUwZv/Zlb+uGZVxRqqT9mWLzudhQc4C0b8Y5AsOmg4601Rn7YIsrlPG
	If5fT7xmf3z/96h1jesWI62gGn6TEYYT86yrPc0YjMJ8h6dr5/1FQyKvhXtNI88EDR/QulhRw4S
	PM2fA9OScjCPMJaQvj8UVaJ/h6cAfq0nmAazZXXY2DRIuDVRqJcva1oPqj4b54pWEHCs7UrGgiM
	8Ez48RLFryMelR7oZ/8zKavhULlXaxTPqassdzm21PZf05CgSdUaKXbp4=
X-Received: by 2002:a05:7300:6414:b0:2c6:7f49:a85d with SMTP id 5a478bee46e88-2cbfbf78835mr2116070eec.22.1775238901240;
        Fri, 03 Apr 2026 10:55:01 -0700 (PDT)
Received: from localhost.localdomain ([76.32.119.210])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca7caeb83dsm8682938eec.22.2026.04.03.10.55.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 10:55:00 -0700 (PDT)
From: Hungyu Lin <dennylin0707@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	Hungyu Lin <dennylin0707@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: use single-line initialization for pframe
Date: Fri,  3 Apr 2026 17:54:27 +0000
Message-Id: <20260403175427.415-1-dennylin0707@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026040340-impish-bootlace-9b42@gregkh>
References: <2026040340-impish-bootlace-9b42@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Combine declaration and assignment of pframe into a single line.

No functional change.

v2: adjust formatting based on review feedback.
Signed-off-by: Hungyu Lin <dennylin0707@gmail.com>
---
 drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
index a1f2cbf2cf55..c79df13b67a8 100644
--- a/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
+++ b/drivers/staging/rtl8723bs/hal/rtl8723bs_xmit.c
@@ -239,8 +239,8 @@ static s32 xmit_xmitframes(struct adapter *padapter, struct xmit_priv *pxmitpriv
 						/* pxmitbuf->priv_data will be NULL, and will crash here */
 						if (pxmitbuf->len > 0 &&
 						    pxmitbuf->priv_data) {
-							struct xmit_frame *pframe;
-							pframe = (struct xmit_frame *)pxmitbuf->priv_data;
+							struct xmit_frame *pframe = pxmitbuf->priv_data;
+
 							pframe->agg_num = k;
 							pxmitbuf->agg_num = k;
 							rtl8723b_update_txdesc(pframe, pframe->buf_addr);
-- 
2.34.1

