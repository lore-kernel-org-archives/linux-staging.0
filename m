Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E124388E63
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420610; cv=none; b=NuSTR++yfU4OGL/4brbVU6rbgszs172s/NTmE2RS4ksKmdfZwzoI5Mc4C936349CjNW6HupeOsTJZkVoz5lH3i9ITFNUdJDWguh4XXQeMRnY2rbAE89g/ytMKtQ0XCdyEAksCqy4F3jS7x/WWIHgasYagb95YZCwpOIzPahDZBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420610; c=relaxed/simple;
	bh=sMnteM+qwQVPhaf98iyfqBf76e6UiH216sDCqMGKyvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OROmPlXJobG3Yi4e6pFEAqdCX6nbpOKWbGyjmul8uc5J0scy3czW1N6DJYJqjb5s5DZ2+NOSeZAfxZGj+ERj8cB9mCuMCAhhvgLBUgQvP2CLBGiNR0o9NZTs0V3ZwrYKU/ikdYVrmBgeKf1KkAKJ3LSCy0tsoZ8Sh5sn8rtfmd0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=mM8sxsuP; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="mM8sxsuP"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4gD3wG1pT8z9v5q;
	Sun, 10 May 2026 15:43:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420606;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=25ceQTsI5lFIHlxxEleOyFRkOrBXtIrg6cBJOMDXc9Q=;
	b=mM8sxsuPzQuKuKhZa3tURRLY5rvOG6PAgvoBu4AdkCAXHXRQ5k8tvfgznot6UWRceFafcE
	LHptQwMKpzYSVkLQBN+sGiEHm0kw+uogIzek5ebRBjf08Y+KapdosvEpCmCYCZrLzPcU7T
	gCOS+VNyLLmeb922yfrJ0GoDDI441FeAIRpQgjPm3/dKCdhSrgb+qPAHTsinRTfNxa3T5O
	dIQrWqqlWIsYNMl6XAdnbcmYeDeDTXqKsqnvTf51ugzUJNk/QDmZoU04fMKCYmz/7j9Ncv
	KFqeseh/2qUL6+RCPnX8np1SzdQsKEF0Ta8Wjrm5Ao7CMT9OmF0SsYRXxjIlSA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 9/9] staging: rtl8723bs: simplify if-else blocks in rtw_mlme_ext.c
Date: Sun, 10 May 2026 16:43:15 +0300
Message-ID: <20260510134315.64295-10-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 725c5f462fb460fcf41
X-MBO-RS-META: dt68b71hxb8qthxwa6pq4c6fqo7cbkmk

Fix indentation, remove unnecessary braces, and wrap long lines
in if-else blocks inside the site_survey function.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index 7ac23ccb39f7..2667adc30b00 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3741,11 +3741,11 @@ void site_survey(struct adapter *padapter)
 	}
 
 	if (survey_channel != 0) {
-		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
-				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
-		} else {
-				r8723bs_select_channel(padapter, survey_channel);
-		}
+		if (pmlmeext->sitesurvey_res.channel_idx == 0)
+			set_channel_bwmode(padapter, survey_channel,
+					   HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
+		else
+			r8723bs_select_channel(padapter, survey_channel);
 
 		if (ScanType == SCAN_ACTIVE) { /* obey the channel plan setting... */
 			{
-- 
2.47.3

