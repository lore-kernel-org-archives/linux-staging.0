Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CD24C9E12
	for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 11:08:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729724; cv=none; b=JDgQvhvLuqtsr/aNIQaw2J/jjvRtWuhmkeNtAGlLkBGqDmU5hH042vEA9MD/EVF4QGfZwKlvl6lLFHVjlXHafttD58NtIB0spgSQQ5aEEJovdzunAc216uEsSwb4bEJsY0ObWfm1ywIbOQtEEAsNITZ83cjkhFl96BzyKCzK/zc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729724; c=relaxed/simple;
	bh=CTynR59BziX2J50wpNmLmLXJ3GpwJvm84Os5HZU24uE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ps4wFoQyf5O5RgZ46Rl2qE/I/Y+otg0L+DtWc5oNC1ASL21w/fQlYVlfeY9ocUwSQGSF0zZMexqNm8nlsJEij+Ko7Qeq1QsX97oNeWeLFt80Sd1UF8sLla2Eug/I0SaxyoOO/oCehJDL3Z/E3141sm5EXYqxCfVOe8fB8WDBDqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lP6ZvdL2; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lP6ZvdL2"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d37b6so2967315e9.0
        for <linux-staging@lists.linux.dev>; Fri, 18 Sep 2026 04:08:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789729721; x=1790334521; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GZN+e+voYt5PknARoCumXWZsLFyIMao9d8Ma+Y4jDI0=;
        b=lP6ZvdL2vhQaGac3qi6ySwR+G5MaaEunfPbGsYHY8bm10SHwD8aqGIWYpdYMV+HHzv
         h0W0KZ51N+nY2XAldae3WR/lFEBtBkRqI/fvPALIuQFeCjKtUgQ/K66bwJRnRvHM0sT+
         u9MFbqTtlIB/8qyInoDsqlXu+GjRWZGHOo2ZmswBBl22zxQF7RGo/GuxlJUqManhJM8y
         /MaOSXUJO4qKZYpkZ425tmGY3NxQV+2J+3BPEldKTaeOxjA+JOKw8MusYw1wmrinuBeQ
         cjga4JaKbsNz6wQKGOAwA38BZA1WJ9Ir5XMOB7t4yuyRqXcqx1rnn3MJ+49xkz73okvv
         cdxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729721; x=1790334521;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GZN+e+voYt5PknARoCumXWZsLFyIMao9d8Ma+Y4jDI0=;
        b=133ZMEVTg4OGLZA8uJNrb5F+ZY0yK1Tt90oEYSFP/pKVGg9851FMpkRzL6yNLdBPKQ
         CgH19ehBsfqU9J4PjJ9tEh+UHJjeFprxKJ6rKUR7AkVW7aZsIy633VdyD5mcmME9YvCE
         jWE6nUDICH17+/8n0lNfqZBuGKcoxXJCxKpY8ClQh2Mx8ERWbPdOmxgukBAYNQGMk7SB
         K8e+A/dTKl2Wf5ccrEZDNs1cuKXwt1A0TOl4ie5GHoll1N6L8/lu06xmJtqoHi8Bx8kh
         AY12vU5CbXXQ/NFU+00Yodw/mlGt3gOHIkVrz0a6MJPpkXntfagN95MbeMESejWIipAM
         oc5A==
X-Gm-Message-State: AFuF++lpMfgYuBGC3Of0BetmkZCYOjFaGDHU1e15NtWpBgJhdpiY07+0
	1t0zS94gmqcXn2YPuF89qc10oHhCzy+Ayxh0aYyhHxZ1POJqpP9z7TPi
X-Gm-Gg: AYBFou0ZiLizo44Tz8iMMaProl2koKeMdzwpR9FoMAtTPd/6xiEnc+i1V1oR/IDi5q0
	pHtpEkcWtuRtCuJzV7GHj8vdV7POLLY95pI3exX+Bjanpr6+zBGGN4Wm6gwK4vj+09vsFYcjPTc
	H7CNfWep48P/sTj8qvX9Co/GyxxNAJeeYMfCWmn7HybRIXpiewrr7SFKL3p6KwUMV8icl7+jFte
	ytvchKGF4xdOJW3IQv92f/rcQ43h+AbTgMJkEizyhTrA6RQd8mxPkyzPEclFgs28/IvUOvHPu1D
	GpcG/Q0QaZfw7rK4tsw//zd6/ihxZlCuZ+BoMQN3uHUFJtqja11VPlXYlJQa6Nd+2hUMnaE0w44
	y/Vg1IvilPyC1wuB0Jhe/CMZkEYym7tYPAEaUzsDaj+Ro5TCwhZZ3bFX2jWcDILkZpaXj4ODjby
	/tqaHHOk1sC/LB8LusKNH/aTmZcUIaUxTttbLPwGeYFAstBtd9NJt0wreHCY2Rj/pfhzhyKsmfv
	P24W712fIKvxiKmi00Iow==
X-Received: by 2002:a05:600c:6211:b0:49f:bc28:e8b1 with SMTP id 5b1f17b1804b1-49fc5735be7mr54409315e9.14.1789729721115;
        Fri, 18 Sep 2026 04:08:41 -0700 (PDT)
Received: from ubuntu-4gb-nbg1-1.. ([2a01:4f8:1c19:b0ad::1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fc7cfd3fcsm43592295e9.10.2026.09.18.04.08.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 04:08:40 -0700 (PDT)
From: =?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Rare=C8=99-Mihai=20Vladu?= <vladurares@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_mlme_ext.c
Date: Fri, 18 Sep 2026 11:08:21 +0000
Message-ID: <20260918110821.1117935-1-vladurares@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 11000) for more
precise short sleep. msleep() can sleep up to 20ms for values
below 20ms due to timer granularity.

Signed-off-by: Rareș-Mihai Vladu <vladurares@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
index e965133d9..f59302802 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
@@ -5749,7 +5749,7 @@ u8 chk_bmc_sleepq_hdl(struct adapter *padapter, unsigned char *pbuf)
 		return H2C_SUCCESS;
 
 	if ((pstapriv->tim_bitmap & BIT(0)) && (psta_bmc->sleepq_len > 0)) {
-		msleep(10);/*  10ms, ATIM(HIQ) Windows */
+		usleep_range(10000, 11000); /*  10ms, ATIM(HIQ) Windows */
 
 		/* spin_lock_bh(&psta_bmc->sleep_q.lock); */
 		spin_lock_bh(&pxmitpriv->lock);
-- 
2.43.0

