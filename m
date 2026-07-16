Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 950FC3F1AB6
	for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 08:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784191149; cv=none; b=W2UTxvWYsTfxhmY/LLQJ6hAJkOeu56h9fgDL3QN28790yvxGkAxRQEpz+gPVDrd+a9Sk68HKgcm1kc5jLaQyd5mOQkIzbFdfXO8V0eQEnjP8Qmtmg9K+buNVH4fHZvXW1AdZxsOiQPioluE6dzHPBpRjZbKYlyYZBswwlV4c4nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784191149; c=relaxed/simple;
	bh=6w1aFKENJ6dw0MgnMkbvcdMXN9gjX/3TR2mc0pCoG4o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeGZ40xfIC+7YarjawXVNF6piZy07Ifj4lduDyGdtNveZSlfAipVi4lMeHWI2Ohk5BWko+2lSw8m2jOZEjTJetiRmLkDlX93LlmqC/Q+IFo8YqqgfcGJwbP/5wR94KpBzjRgdPHfGWGdsrveWej3P7H3TVHMOTUzfAj/iS4+HgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B1+wIXvp; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B1+wIXvp"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39c7ac9b8c3so28301471fa.0
        for <linux-staging@lists.linux.dev>; Thu, 16 Jul 2026 01:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784191145; x=1784795945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fSN7+6Fal8dugoHe5tu1FqihQojJTmJBwjlyE5PG8WU=;
        b=B1+wIXvpSADytBvXb1BkGEgfDSV/i3eZ9d/+7AA1h8JVGOLgkKJNscR3+Hk+Zkqnmj
         iHFREQeem4nx3RI3vUh94CB9mHKOzvkbyz57zqDAtoT0CM1NEq2LJdf7w9GNj1JeNhLo
         wmlJdSxGsPNWQ9++g3+SnM6e8Nnv/MYmWM/T7lpa4ifpyoe85Vixsb/CTPSQ5tcbe4cu
         V+GyiWh0SJnEzv3Iz5BirhK+3MKSBqcJvsxCiE+fLeCaLZ/xCVf9wBZFMwpMGPt23h0l
         FGP5MqMXlsIhY89260hn8QCewU6FaSQPE8r/KbFIBCFGuA/9LFBmUDVZYMb8IFT5qkvU
         3eIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784191145; x=1784795945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fSN7+6Fal8dugoHe5tu1FqihQojJTmJBwjlyE5PG8WU=;
        b=RHuucWgYBVlNCvYhbw3joYtbbpFiBQ39gedydYneGsFCaq4pO/T83v3TukgRlEbi1e
         P7HDmTMwHvJYhO9lzIRszYCfv8FWl4POr63iHfu+01TkUU5pdW98iqAEUARdkl4BhVRX
         r/hJMSpUnrQ45QKRGxI032hY2Oj8YMP66hO/hqXmMyYBiW7I/Qoe/x72r5SJsrBpbMwU
         0vUnvGKl0LwfCURc/22LC1PEYpjzPeZa4NvEzlmLvL1nvumqDdGLh+lvk2+rg6dNovF7
         p3Xylfrocwf6UjjeylDAOo52Tarfh1O6nrH/Vltm37tonvVGfE66w0+1yHBvQc8lPIua
         aQYQ==
X-Gm-Message-State: AOJu0YyYC4sACCQmeFYewlZafD7sobrbSs/Jo1A9KRXHIcYamjALzqHV
	b0Zmv8QX7TCPzMDp0VzGG76ni94VenZj93FqujAqEgtsKe0BTmJ3ZtRjHrWClJB3He9/hA==
X-Gm-Gg: AfdE7cmD6y41KMSRLd1qO/4eqL9ti4EN764Ho9cmVFIyY2xTLFKlnM8+mfL8ZpwxtUm
	NLGiG6mjkXegoNATRTtNZ7FH2YHUTkqzqfHC85aDQK+gJmQr7ZFYCJO48KHfGYRWGEjHotp9PDV
	bqsXoj57vLRp3VHemb5SJf4+PzPWCo4tQN4aHl5TP9ARWOhuQ1qjSFClPYOis3fr5LU9Mxw61Td
	TBza1LChPAocdTHt+DWaqnkv8YTZ+0aeH7TNXjOtQXAbyVhTe9XMESVJmnucSBYs0UOS4LStfPL
	BJWPkU/grPgj83VQBccTRmNtTYLnpm5LrWe0NIGc3ToAluD8Hx3pV6CRqfpaWPwsT0Eer7r82iA
	sR1Q8qem+6ShB5haJDJIGeGTPSFWOgsfquTMEuSEkX5kDG0BCudsffxT4LfYxxOFieChqKZ5R4c
	mgCKuyUS9fSuI+TwqP2GVZxtzJK8c=
X-Received: by 2002:a05:6512:6699:10b0:5ae:ba93:9116 with SMTP id 2adb3069b0e04-5b02356142emr2946023e87.2.1784191145229;
        Thu, 16 Jul 2026 01:39:05 -0700 (PDT)
Received: from DESKTOP-PGTNBU2.localdomain ([178.131.96.94])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b01ca4f90csm4865554e87.21.2026.07.16.01.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:39:04 -0700 (PDT)
From: Amin Madani <aminmadani112@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Amin Madani <aminmadani112@gmail.com>
Subject: [PATCH v2] staging: rtl8723bs: Split multiple assignments in _rtw_open_pktfile
Date: Thu, 16 Jul 2026 12:08:22 +0330
Message-ID: <20260716083822.2898-1-aminmadani112@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In _rtw_open_pktfile(), multiple variables are assigned on the same
line. According to the Linux kernel coding style, multiple assignments
on a single line should be avoided. Split them into separate lines to
improve readability.

Signed-off-by: Amin Madani <aminmadani112@gmail.com>
---
v2: Assign pktptr values directly to variables instead of chaining them,
    as suggested by Dan Carpenter.
    (https://lore.kernel.org/all/aZ_0OratIkUBNHmy@stanley.mountain/)

 drivers/staging/rtl8723bs/os_dep/xmit_linux.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
index 4260ed5f4..ea60320c0 100644
--- a/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/xmit_linux.c
@@ -15,8 +15,10 @@ uint rtw_remainder_len(struct pkt_file *pfile)
 void _rtw_open_pktfile(struct sk_buff *pktptr, struct pkt_file *pfile)
 {
 	pfile->pkt = pktptr;
-	pfile->cur_addr = pfile->buf_start = pktptr->data;
-	pfile->pkt_len = pfile->buf_len = pktptr->len;
+	pfile->buf_start = pktptr->data;
+	pfile->cur_addr = pktptr->data;
+	pfile->buf_len = pktptr->len;
+	pfile->pkt_len = pktptr->len;
 
 	pfile->cur_buffer = pfile->buf_start;
 }
-- 
2.53.0

