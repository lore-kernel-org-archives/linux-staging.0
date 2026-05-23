Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F65739A05E
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:31:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539476; cv=none; b=t4Q3z83lvSWItBISnJ84KPVW96Qs3dbqruP2N/j2ozLW/lj8AGaKTRIK/BN2/osDqjfWiD1dFsJ6xwpclWRnzKlUJax99sw0RvR/0n8dQZ+AVy2nw53Yt6LAxCO8265ooJmy7BMh6LVhocQfymd+qW0BlWmspG7dRlF1cW4uUEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539476; c=relaxed/simple;
	bh=QNPiWpEz2Z5XgqNBGTpZ6LMK9c4Y5+kbJVGyrKEgSwA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MzjFNs5Kwy9ut5c1L/ofW0jhtgyxqZUvL0f9R9Uv8U26cKzhfhSugZrTREQKUA4MLNmI6Wk7ZFQhoI8Zu20E0RIsnzG2dzfiOE3N5HBkRjJIv80LKjD5acLvDHng5nnoWWa7ieLPVM68a6h0zmx25LH74WupcnLB9A8BPscOEI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=ULPkJPF+; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=fOLY1dyl; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="ULPkJPF+";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="fOLY1dyl"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [10.196.197.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gN1hq6kDrzB0JX;
	Sat, 23 May 2026 14:31:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLsLXfNBuUEcSb3i6hEXyM5yiB49Lqkxg5QGkTv49XE=;
	b=ULPkJPF+zJ7/FtV0O8dDULMpKXI3w83pr5ZFJoObYx50lwh9VOeJXXnlmSGh/uUJdrgFn1
	O9edCKjrcgKlGFHbcKucM6jGCSzRiFZaCz54HVgh3Z2XTZLKHvbzMvd/nh5FZIKumkiyZo
	u6jCtMHEFAUkESU0qcG0k48uXPFfcaKkk8ddv9hQLFu+kPaNwYbeLo7bTlVzHCvUan0P/f
	RUjiGR4BheX2n8frSZOKFNOaE3JwDg/RdQ37TH4tynk8ihSyUQAKitVxrKAd8vtAfbPCo8
	iusPvQKW5C1ZcVzeqed6qy9nq+RLJF2FiNdUSnVEhNu3INB7xxJuPriVAowpEQ==
From: Oliwier Iwan <oliwieriwan@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LLsLXfNBuUEcSb3i6hEXyM5yiB49Lqkxg5QGkTv49XE=;
	b=fOLY1dyldSnaxes62qc3mf5xVieRRjx/8I6Pb/d5F5/fvoAaWtXg1EMZ+Qg7ZwjfXmta67
	dbEF4E65Xk7X/jIbkKueb+iqALRhDLZCYXG5IVSQYEVk+cEK9NNHeclmJlAmGm1Mh3uUAt
	0G/Vv4/nMXVAJ0ai/O3JZ7ZtIUz/ZL6v3fkSiJwg548CeKRTZ7LMPVXfBzmi/1gmaCSxLi
	fRLV1dGE4kYppc19lI0HCD+TN78Dlnfov9dzkhfdxCpMn5zDu+HR0FcF7k3Bk194txD2Ha
	LjiHwaLGD+iqH2wnNQobbcWGvjW7npzCz8qC+27ocYR+CbaarCLRMmyXGif2+Q==
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Oliwier Iwan <oliwieriwan@mailbox.org>
Subject: [PATCH 4/4] staging: rtl8723bs: fix indentation of closing brace
Date: Sat, 23 May 2026 13:30:43 +0100
Message-ID: <20260523123043.22907-4-oliwieriwan@mailbox.org>
In-Reply-To: <20260523123043.22907-1-oliwieriwan@mailbox.org>
References: <20260523123043.22907-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 6p9s1t8kcdkx76y3ekh3wubbjfcy4hgi
X-MBO-RS-ID: 2a9e95e9b011f5896ff

Fix misaligned closing brace in SetHalODMVar to use
tabs instead of spaces for correct indentation.

Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 665bfec5ffdd..4b4bfa80e37c 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -736,7 +736,7 @@ void SetHalODMVar(
 				ODM_CmnInfoPtrArrayHook(podmpriv, ODM_CMNINFO_STA_STATUS, psta->mac_id, NULL);
 
 				/* spin_unlock_bh(&pHalData->odm_stainfo_lock); */
-		    }
+			}
 		}
 		break;
 	case HAL_ODM_P2P_STATE:
-- 
2.54.0

