Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCD13AD500
	for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 09:52:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776419523; cv=none; b=IIHA3OtGIM07B+bWtjsibSRbLPOcKl1Ex7zvMaWiI2dKHEJMSqGkaWmdPhkJMBWxwRLPe8oYwwzdjibiBQBt+ynvcaQwucaDQbYafca9q75HVp+lolShCu3Gyb6nFC+55+tcy42vKBsD5p2hf/NHrBdZOkueHM47ZaiY8MkJNc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776419523; c=relaxed/simple;
	bh=8j2fuJ/CobaU+zoZaxoI8vwpmOcljoawjn8zh+K7DA8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZAaN1NKQ3qW3RQApQcxvWcZL2MTkVoUTozCF4uhYlbm17ZQ0fO2fDmBqwD4tEIUNhp5PS43VVGDA644YUNwWYMN4lTkr/HueQBgHn3h2gTi/8pbIunU5ycyoSAUGKz8T6IUn5xtn89xbIbtjZBM8ryJaJ+SMnKTWglR/g1pAVK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RTjta+gF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RTjta+gF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-43d64313c39so403326f8f.3
        for <linux-staging@lists.linux.dev>; Fri, 17 Apr 2026 02:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776419520; x=1777024320; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6McsDPyH8QnKBdehE+9TN+kQ+OgryRDimxxkla2LXI0=;
        b=RTjta+gFVO6wxPriBUIb5e1cxxt6iFvdnNL2Cfaujw/F9f9p08y5404bJn9YmRkWD1
         2fN7vsc6xOBZ1gjSUN/qLf3TNUhCvykhu228Y5RSOQlOlQIioDqP/hqdRexfHrMYm3cD
         XM+1zZzhl3axfXzIXknvKa7PMs5f3XwRCtzh1rNX6YGVgpTNKpXA09G+zsR+kezKpIGO
         RovUAxYubWz6hRckjDXF/oKsB2jH47jecXcr0TmsUCUJ4nQAQx7k6WupbslA1mkMCK4a
         3sXhCK/j3HpeZp0wuZqoNZCGxbt6qdaxhOGCaoFy8Of+GzKKsuHYuEzaO1LoHbBQAYqz
         RHVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776419520; x=1777024320;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6McsDPyH8QnKBdehE+9TN+kQ+OgryRDimxxkla2LXI0=;
        b=FJ2RTdq6/yd4KLEhWTI1JuOWygVroDth0qPOq6RRFwsDV37NkMhuk8Nvjs9wzG/mXH
         ZY3wqTyr4FgcMNxWYQyYmkhVknEeLmgHitmFOzRutMICeg96qlI1u5WZjTDU3j3BaXNO
         1GQK7q8GTIgSwiBsms+MwgjfMliBd+ASebSRh3PKc5/PtQK7/QrLrb0y88cs0avgdBQw
         T2uubK0ENq8v1v6K3WJ/mQgj+EllHg5MEMK2mlD1QR9TrnVDK4WERp14A4lugJ4ZWQFF
         soN0yVqpyICV5tzUVDRCWTmjUx6dwCJqTO8B6PCYa2P0PlW31jq85KQcLGGLCp6EQ+9+
         QvyQ==
X-Gm-Message-State: AOJu0YxhY67gTaXWwp0wisNWcMnYmzER9npL5Zaae6kF6giAjRbFye6M
	GVrwbdwDpZbK+ys8ito8LJaqTZ5cILyPWmlp9F3m14OzfDyPlIV5c9F3
X-Gm-Gg: AeBDievvCq334WW6EQbfRrrrlhtoQp1JBGWIa+OhLiy2mEpkkda9K/HNuBWPkCdrXGw
	/5H9xYK/hVsXuFB5VaeSVwbWSZpy98O3x+IVZSwlP6zFINLOcQyCZLcEpC1Ztuv2YrEQ5XtImtc
	pjqTMCMe/hplECaDIGgAEVO5hENMkLM+OW+STfZHbdOVtcyvcspUMLmuo9Xorki9/UK4oRrtA3E
	fQou9hcv8XRcTSvKtmbwTj/oVj6GMnEpctV1/IkEARa9nIUJcqZO8fDfbAQZaoZhC5//00wDaRr
	RimM65lcxaX+DWCGaaim24dpL0wvVXIi2isCUnms5cAg7OSGiiJJ+ybHXl0aYtWOmFm+tiAOA4+
	B9wq/WDt0pV9T8H0YN2gm0wqwuiAVOnQKzT38qgdr5egSMF1ALkAnccBvJOwOQJ+JGn9SWDw/Wt
	ExgVE4aXwlsEujWwh6Uu5GGM+NoFVk
X-Received: by 2002:a05:6000:1acd:b0:43b:4aba:8f38 with SMTP id ffacd0b85a97d-43fe3e14242mr3173828f8f.47.1776419519622;
        Fri, 17 Apr 2026 02:51:59 -0700 (PDT)
Received: from moxi ([178.134.243.189])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cb1365sm3356783f8f.7.2026.04.17.02.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 02:51:59 -0700 (PDT)
From: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
To: gregkh@linuxfoundation.org,
	error27@gmail.com,
	ethantidmore06@gmail.com,
	starpt.official@gmail.com,
	straube.linux@gmail.com,
	sameekshasankpal@gmail.com,
	arthur.stupa@gmail.com,
	luka.gejak@linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maksym Pikhotskyi <mpikhotskyi@gmail.com>
Subject: [PATCH v2 1/2] staging: rtl8723bs: fix stainfo check in rtw_aes_decrypt
Date: Fri, 17 Apr 2026 13:51:18 +0400
Message-ID: <20260417095119.22948-1-mpikhotskyi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The null-pointer-guard was incorrect, returning _FAIL on valid pointer.
Invert the guard, so it returns _FAIL on invalid pointer.

Fixes: e23ad1570028 ("staging: rtl8723bs: use guard clause for stainfo check")
Reported-by: Luka Gejak <luka.gejak@linux.dev>
Closes: https://lore.kernel.org/linux-staging/E4BF62EF-C6F6-431F-8EDC-77C1E613E66B@linux.dev/
Reviewed-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Maksym Pikhotskyi <mpikhotskyi@gmail.com>
---
v2: rebase on staging-next. Split into a series of patches.
v3: add Reported-by, Closes and Reviewed-by tags.
---
 drivers/staging/rtl8723bs/core/rtw_security.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_security.c b/drivers/staging/rtl8723bs/core/rtw_security.c
index a00504ff2910..f467cb5b1dca 100644
--- a/drivers/staging/rtl8723bs/core/rtw_security.c
+++ b/drivers/staging/rtl8723bs/core/rtw_security.c
@@ -1212,7 +1212,7 @@ u32 rtw_aes_decrypt(struct adapter *padapter, u8 *precvframe)
 	if (prxattrib->encrypt != _AES_)
 		return _SUCCESS;
 	stainfo = rtw_get_stainfo(&padapter->stapriv, &prxattrib->ta[0]);
-	if (stainfo)
+	if (!stainfo)
 		return _FAIL;
 	if (is_multicast_ether_addr(prxattrib->ra)) {
 		static unsigned long start;
-- 
2.51.0

