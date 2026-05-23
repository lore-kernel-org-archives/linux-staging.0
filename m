Received: from mout-y-111.mailbox.org (mout-y-111.mailbox.org [91.198.250.236])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B57C399345
	for <linux-staging@lists.linux.dev>; Sat, 23 May 2026 12:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.198.250.236
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779539472; cv=none; b=hmpsDNPiKCnmGZEV1CMA1sdob0MQLV62D7w5a1GYbi939Whbb/CRL3OxgR62fIXkLcZHkQxpDd50vdReT3mDU3MDiY3za8mr2yPqkcCWYzFbfvIPbUuvjV1pFA8lOYE/iP1MEeEavm89RrNl+aoRTL6qmiawW9eHVV8/9ZZ857A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779539472; c=relaxed/simple;
	bh=MhW35WLr9HyDNVIFRiP+I07q4CpysIqc1lNnUGf2zJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZbJoZCslE4uCaQCmDGNpHF6fVCh4AHFGENwq3H233ZF+zeYF3K/MKTE9Eqvz7IMfjqHB4fvMSrPo8R/i5FfJD1nwTvyyDpFOJhpvnzGKBnSeHwEuAtVXmZLigZ7B/yIN+8CpfacUU089W5oKEhzHbkwu1HRYrF+lHIQHgQSW+h0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=urX7ZEVb; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=n2Zd8Pa4; arc=none smtp.client-ip=91.198.250.236
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="urX7ZEVb";
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="n2Zd8Pa4"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-y-111.mailbox.org (Postfix) with ESMTPS id 4gN1hl4qmPzB0JP;
	Sat, 23 May 2026 14:31:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539463;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nDGm+hz3g4yF7ghm3MMTidhLABF9cTKLr/dk9HoGFdQ=;
	b=urX7ZEVbGbh6AzcfvdHvFASrePTGL0L7l26zW9YQpTTU7n/Q4tLHHqHdGmmflIFw3BBbTj
	h3jCP6Y9ZrX3+/ZJl3z13QEHdXt0+nhoJEGvuDTYzWJnhx08wEruwUN312WvINh/h4KjBY
	vpfUDVuXOWOirHLrs12kXoifbeCIn3AFd9dHh0itSYOaXK/pwI5ePFGd7K5/ICJl4Z68Fx
	LNXVDlzkrAVUfQUnAF8ZA+cXGpcBqmfcce8pFqL/rBIKusPrDHtNa7/TeGmVlyLniI7WG0
	xLfok8euePQw/HACaCpcZ9CIMexjUcrzs90MdcEyrDvaqev1/Li/HChIvNsSFA==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=n2Zd8Pa4;
	spf=pass (outgoing_mbo_mout: domain of oliwieriwan@mailbox.org designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=oliwieriwan@mailbox.org
From: Oliwier Iwan <oliwieriwan@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1779539462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nDGm+hz3g4yF7ghm3MMTidhLABF9cTKLr/dk9HoGFdQ=;
	b=n2Zd8Pa4VhQWL3majw8wwDhCFMXL8ELQ9bsMrVXJ/Ksw01KuyuOzlB9efDeKPeLVq3bHMs
	fgPnW9SIppEuh0oVoW9GazvLZkGzX7bY/s1X4f8p9joyimfBZCyG6+SJdSZqfCxmw9+FfU
	F52vzvtVX82u9im9asI+ekfdTUswJkubRSQkfBF8VzhyJjeWqE3d5g3FJoH0EdcM9IyokM
	ilCZI9waGBlZsZ1Mrq3BJx7ZnN8616wMX1EJqVznQDyl0VByJwBj4JGRDYnsvKA40/CxyL
	hWiggInw6IXKB3o4VxydTcQh1EdLWM4tqGD8q8G53s72L2oCJcuMqyFAUZBWGg==
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	straube.linux@gmail.com,
	linux-kernel@vger.kernel.org,
	Oliwier Iwan <oliwieriwan@mailbox.org>
Subject: [PATCH 1/4] staging: rtl8723bs: fix comparison in hal_com_config_channel_plan
Date: Sat, 23 May 2026 13:30:40 +0100
Message-ID: <20260523123043.22907-1-oliwieriwan@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: 54okhkcoitef8wnormix7n4wyfax3nkt
X-MBO-RS-ID: 5d8fa45e0d097069b98
X-Rspamd-Queue-Id: 4gN1hl4qmPzB0JP

Place the constant on the right side of the comparison as preferred
by the kernel coding style.

Signed-off-by: Oliwier Iwan <oliwieriwan@mailbox.org>
---
 drivers/staging/rtl8723bs/hal/hal_com.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com.c b/drivers/staging/rtl8723bs/hal/hal_com.c
index 728a2171fbcb..5473dca13695 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com.c
@@ -107,7 +107,7 @@ u8 hal_com_config_channel_plan(
 	pHalData->bDisableSWChannelPlan = false;
 	chnlPlan = def_channel_plan;
 
-	if (0xFF == hw_channel_plan)
+	if (hw_channel_plan == 0xFF)
 		auto_load_fail = true;
 
 	if (!auto_load_fail) {
-- 
2.54.0

