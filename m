Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5644E3890E5
	for <linux-staging@lists.linux.dev>; Sun, 10 May 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778420610; cv=none; b=dPVrk7J6lq3z+o5jwN6irmQxBJLP522qiMEq0e2f0JvNB4v7KkFc5n68oOuwHhf02PojhmcMy4gpr0nQDTkxQmX6jaCi7C19pofNYrBYT4lcjF0CC0MqMzSY0MK3D6OwCoRA6cCuTDIFUpCcT9hGqsmKXb/u4EZB3kdb7hO7NR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778420610; c=relaxed/simple;
	bh=GfZ30fFUnebx3f8B0OmJ73iK2+I8HAT7gA04xFQjoIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H1ATRArwkI3Fgeh6co3mqxxZjGh1GBsuAiyhaZyjRW9C9wjO7fizdocgWcV2QXQNwEjOSCC+PxMqYD+EIcAedpDG3PFvaj1tL8oB5VCyNDzkUoyNpoi71gWckHjTU18a+5VLf88NL44nu2HNgbmSb5HZVe1R8uB6aLzSgFKSdwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=SEs494wZ; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="SEs494wZ"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [10.196.197.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4gD3wF3Jsmz9tRM;
	Sun, 10 May 2026 15:43:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1778420605;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mrm6ALM0TVXefXtdMJyBFt0cKbh1STUgMHi7I/dq1tQ=;
	b=SEs494wZOnBmXY+E+ranDOY+//lZBV5zmzE/O42Fbma+uRynJMzDHOtEnn2XXXP13xn2WU
	d5p/H5Wrv3zOYohpa8ijv5WmHocPuUvV34B2YanK4opZ+Hl1wpAL8FGaxcCS5XSRe3rmI2
	tYo73KdZlg0mLx5ZqKaVV+UKFMfh29FLb6vuZya1O2hJ2BS6KCgfVRERdsNwh9rwRvdCZz
	PpQMndM9XF3/T68Avh+lAhXIWhhR8Ip8T0IhOfUGZDdDjosdTka3Fr2d8cJmCXaIVDUAw9
	blZLeVctKFi40cGNmZAAJqGyQhj0wibbzqIjj/R44SzGNwVh/l62FDxbP9H/yA==
From: Andrei Khomenkov <khomenkov@mailbox.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev
Subject: [PATCH 8/9] staging: rtl8723bs: remove commented out code in rtw_mlme_ext.c
Date: Sun, 10 May 2026 16:43:14 +0300
Message-ID: <20260510134315.64295-9-khomenkov@mailbox.org>
In-Reply-To: <20260510134315.64295-1-khomenkov@mailbox.org>
References: <20260510134315.64295-1-khomenkov@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 689d5e079e841dda1dd
X-MBO-RS-META: h7zdidwn9yc1464jsa9bwjzqg73toigq

Remove commented out code in the site_survey function as it is not used.

Signed-off-by: Andrei Khomenkov <khomenkov@mailbox.org>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index c966527c0ca5..7ac23ccb39f7 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -3741,10 +3741,6 @@ void site_survey(struct adapter *padapter)
 	}
 
 	if (survey_channel != 0) {
-		/* PAUSE 4-AC Queue when site_survey */
-		/* rtw_hal_get_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
-		/* val8 |= 0x0f; */
-		/* rtw_hal_set_hwreg(padapter, HW_VAR_TXPAUSE, (u8 *)(&val8)); */
 		if (pmlmeext->sitesurvey_res.channel_idx == 0) {
 				set_channel_bwmode(padapter, survey_channel, HAL_PRIME_CHNL_OFFSET_DONT_CARE, CHANNEL_WIDTH_20);
 		} else {
-- 
2.47.3

