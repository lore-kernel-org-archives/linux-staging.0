Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456C92C2368
	for <linux-staging@lists.linux.dev>; Mon, 29 Sep 2025 06:51:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759128661; cv=none; b=SVTt7hFjIeEHEiNShHp+QmVHw9WhqxEG0GzYYiU2YFxhjHgMfCn5raQ2M7EdceatLhF6E5ww+hNJBV44WHgH2D3Xh9BS+2ywHUiKqfGtb6F2vPbScwJxNx+UdPnJQdKoEyyOdl4EK56hK6ZRDlxO07YHKhtvaxLx8pFgkZXLz6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759128661; c=relaxed/simple;
	bh=hlBg88LfZ7H7EOnBcqiE2fUhnBsLoaYZcovb0B3orxk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=djtfYdaifPr97fSNjeJmZH0/NFDeMJrc8uv0Kn9tk1K8Sw0+gNjoY5IZdWg1WticoxXihMST/ohPP7GG1MA9FmPfNUjSJtRSqs94KE7PbSUlkFnqGNHzoeDRSSC9z4eYYfIH+pPQVr4PXy6OREOCYoEUDThkXNhwi6r2SO+/cIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O8wZABjt; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O8wZABjt"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-4d9f7a34daaso37092441cf.0
        for <linux-staging@lists.linux.dev>; Sun, 28 Sep 2025 23:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759128659; x=1759733459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4JMHaL/3qlwAM3Nlr5OLy2kZvghpJrKREkBmQxw/Ls=;
        b=O8wZABjt4Qm0uouSd8/PuwJyzZeKCM3JLBw2vVw+xAYquTJi+lHh9Wlkj6WqhMEF+2
         wsY2FgV7X6SsEVtOoHyfQAHwXi9R9RutPMXgBXJgVxSO3LeHxQ1giex99uTO7brIpeME
         5lp+HgiSKJMGD1qqheXahjge98q6cZUgwExl7kvTFaLygmbGv7B8nabhpUYjk+jx71x9
         MgusIfm9v74uvpUikr7CUwdd3IMA5grkYhtBY8gpdA4wS8e0ImB9tRsMVG7G3BMw4OXm
         nnuw4KGiNbhAz3/Qz7NGL7PKhlCEruxUpDdz8EdgpeOfysPVJpfxuBvMoroHsGVS9YUQ
         TLAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759128659; x=1759733459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D4JMHaL/3qlwAM3Nlr5OLy2kZvghpJrKREkBmQxw/Ls=;
        b=g1jgHiYXMYDfcOozuJH2vWTC+ZfDJOBHprt8kDwoLN8dIF2lujHOsftLY9WX1Kmtx2
         c7A6/LlqmdAIRRqDizkTR7o48JO4X+oEUlaXbT1NwXeiRv3sdtbc8LbM7NP3SxrtfXd6
         CgJMhAVqTJPKyuJRTfnhBQBALqmisFs9FuiHVdrEDVSKgPh4/Mg/zQI+b2NTwwMQKG+V
         lIHKzH/uoL96cTz2va8DTyN9xzawaqNQXPLS128ENTbBRnGSM6qpPUV3zPIZywhbzOXo
         lm7llqQ+dOGVvyNt5xFupDH3Z3CqeEQV3QNzUxToBG9vcNtSillQxws0zv94nx/N1v5H
         bWKg==
X-Gm-Message-State: AOJu0Yyv123cJTt/lMnSz1lAoUSzRzQSEP8Ncn29D1JruUDYj22X1gCN
	RO8Do9Umd+zefO47rSqcJ05vuY6S+bppyMdclx+qOPDyjfLJEPSJ4PcM
X-Gm-Gg: ASbGncsFP2tzwZoy5BHddJRt3aSrxRtlWnzDGVu6imwETVvZfUN/P6PfVwhTHGMrXVE
	dX8WEJZf5VbKR8YQlY+XVa2mmY7Ja4J+RwrsgSVcuD74xc6P7WTraK/eDKZbxrlcgUxwtkQ2/yp
	+unOmvk4625GBDNISeJiVqey/tVnfyE0xswWTXvKdOl5zwmY8/DvjqHxG7CnBeQeSmZE8g/vblV
	DBlSsAkv4SL1LWkFpOpMacZf+fkNNPGkI6VA5dAUcCvxFfu3meEKQUEwhc5w9dBTJRo4XyTomp6
	sfEfbWVSMwjZuMIwmHmBGgI5llfJoq8vVBXSeVgjTFzUd25i4xalRhIXYe4vMpU6QfZgby/RHzn
	ZK7CITtY8+QVJwcbzPWYvilqJCxAnISypIte2b6KSFt6g3n8AjYQ=
X-Google-Smtp-Source: AGHT+IFrlukycj2XG7B/juAeJ1Nwg/8icH4BSqgTZCKc8FYlYRVX1WVmUtczR3TgVBZ+nHu95Vqjcg==
X-Received: by 2002:a05:622a:4e0b:b0:4b7:ad88:45f9 with SMTP id d75a77b69052e-4da4744f7a3mr228793711cf.7.1759128659246;
        Sun, 28 Sep 2025 23:50:59 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4db10874bb9sm69517671cf.24.2025.09.28.23.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Sep 2025 23:50:58 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH v3 14/15] staging: rtl8723bs: place constant on right side of comparison
Date: Mon, 29 Sep 2025 06:49:59 +0000
Message-Id: <20250929065000.1010848-15-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
References: <20250929065000.1010848-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reorder comparison to place the constant on the right side, in
conformance with kernel coding style.

No functional changes.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 741c7dc83873..d9483594afdd 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -776,9 +776,10 @@ void rtw_surveydone_event_callback(struct adapter	*adapter, u8 *pbuf)
 			} else {
 				if (rtw_to_roam(adapter) != 0) {
 					if (rtw_dec_to_roam(adapter) == 0 ||
-					    _SUCCESS != rtw_sitesurvey_cmd(adapter,
-								&pmlmepriv->assoc_ssid, 1, NULL, 0)
-					) {
+					    rtw_sitesurvey_cmd(adapter,
+							       &pmlmepriv->assoc_ssid,
+							       1,
+							       NULL, 0) != _SUCCESS) {
 						rtw_set_to_roam(adapter, 0);
 						rtw_free_assoc_resources(adapter, 1);
 						rtw_indicate_disconnect(adapter);
-- 
2.39.5

