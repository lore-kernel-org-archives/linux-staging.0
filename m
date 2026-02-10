Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9312FFF90
	for <linux-staging@lists.linux.dev>; Tue, 10 Feb 2026 05:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770703147; cv=none; b=I8NNWSlFOYCEkxDCZAyytz+NlS08jJyWeXlg5YQbBE7BxrpTzARHXvhBurQL6pYxUPPOi/nJuqJSFpUwmkmQQHHpktl4j0R8ShmGM9WI60WoDxMJtp4J7Y5zOAB2L4po1RPx2voC26hCBbKURvJPLeGmq1okW8ysFLOCBofRuko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770703147; c=relaxed/simple;
	bh=APPF23ss6IDnSuxKY4DCdYDymtd40+X0AYAXEKW2aY4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i3miGAnOqhzJAE7QYa9zWygNqQeA3CV1PaWvBndnzpgWPmgN5yrulNzUxH+FjbUhYsgnM0vLpRq0iR3Nu/bxlpG/5L9lXlM7CGKp030vs8i++RHZn3N3kDnhPfsI7UjlAlMqAsgE2euXEvWA4glmlEAMmqxm6A+aGp076NYX4Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jh7InbfV; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jh7InbfV"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3562212b427so214077a91.1
        for <linux-staging@lists.linux.dev>; Mon, 09 Feb 2026 21:59:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770703145; x=1771307945; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Klhx1f/3gXC7QwHtbKlGOg8wYTA1TfFRE/gyT6MyjAI=;
        b=jh7InbfVA8VT/ZQgg/2P1nZM93gBRuIEAtKQQHdcmgsYsSFiAnJTHkjzNg+Fic9k5D
         abkAGt0LcU5ig8Rq4ciOZUBT3uKQxQknbcLeXH6czEcZRe6kbKi2RKkwUrCdGvyYUhjs
         cn3HjOCnkHc02o/8b9/qhJz8behSfM8flD8pV+6nHtfk8bQhu9LCS0S1nw7UUP9Iw48N
         337fmdPIBNtoAMGa0vbCq83sPsaHLajAMI8mPAd2i7lMZMYWEFvyQYKfuBCAz6bs5bnn
         qdf0or9mM2RCoPOf5959dEzCG9KuWDMJPLqbsbP4svnjalktFvgq/tpWoRK6D4wVo49p
         3qBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770703145; x=1771307945;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Klhx1f/3gXC7QwHtbKlGOg8wYTA1TfFRE/gyT6MyjAI=;
        b=uaeVKQFrU9k+XXW9tIKW7yCD7OBOtfT7rMJNNBqygwawXoSz4SMAdiKqwQAf/lxl9X
         8iFaS5SeXlhsWKPf/ktuS5rRyS2Rp7sfW2sujbDAwbwNrfNPBUpwrZOIyWlXx0GlGh2v
         02nxb2RREYQtkvl6CRgdsc4uMoxPkHhW5OTexQQl8dhwtRLOFBBVJ8OTeg3Czl7aVWa9
         60wA+F2iI4wT09rYw+Cg0jK/CHRhSqqA9f+igpQ6XzmOawYfTMUWlVbu1J+b7i/448cU
         NVWRXmsOup8wwfPVOGrsJ8kf5hgHd5woG/sk1M7ImtuMEeeaLGRHEjrv/6YkjZ5znri2
         6OWQ==
X-Gm-Message-State: AOJu0YyzH+8jtM6Ym+XT3mXC4U8HVtIfOTEN6+E5VciRTGYOG3N2Av0v
	T+D6s9Abokl1ayZWAhesXZQqsXvJTIx/5P+cTBeGsc+YWVEJhThe85B5bqB1sA==
X-Gm-Gg: AZuq6aLkvIoXA9glwWQ8S+wIER733wAz2YwPxJ5HTQGHHg5uO9HBrpHY9ckpzyV/4k4
	dK7XoyMW931epE69tpr8WOqalEv1YbmJZ+a49xW6R69wGdPSMLwAEKlovL1tIMCtWSSVqrvU/Ms
	VoiYFC15TaM4BgrHxMtAmnX9XBFRsQdvxIZxfq9fZisK1tbW5N9VnAWTSAwbVuxOUeWoPDWQ9zX
	ZSuUhMjQvZtn1e1phfI/cb+shs7gmqllQqCfVNybpSPrU8Ilc7ymveHrGmXRbzXTfdgBVhewiDv
	XUyKqTCdvfbBtTP0e3R4NoNW8rsk56/VKtkhyVuddSWGPEGjlCN4uIeOZbhQibiGIonmJTmoaF0
	NHi3ErVU/Sz9Uo0EZzxCtRPO3OmfaJ1s/dC6OlGtGbbarYiSInjNpNMfNDtySGMyHtdnn6mLjsk
	ouxXPCIeiCrx7i4UIZcm354Q==
X-Received: by 2002:a17:90a:d40e:b0:340:bc27:97bd with SMTP id 98e67ed59e1d1-354b3c84050mr10540519a91.9.1770703144829;
        Mon, 09 Feb 2026 21:59:04 -0800 (PST)
Received: from cong ([112.197.171.165])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3562141d591sm4936473a91.4.2026.02.09.21.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Feb 2026 21:59:04 -0800 (PST)
From: Vo Thanh Cong <thanhcongvo079@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Vo Thanh Cong <thanhcongvo079@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range
Date: Tue, 10 Feb 2026 12:58:59 +0700
Message-ID: <20260210055859.1273923-1-thanhcongvo079@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range() to provide better accuracy
for short delays (< 20ms) and to resolve checkpatch warning:
"msleep < 20ms can sleep for up to 20ms".

Signed-off-by: Vo Thanh Cong <thanhcongvo079@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index b2e7f479f72b..3f5b3ca2066d 100644
--- a/drivers/staging/rtl8723bs/core/rtw_cmd.c
+++ b/drivers/staging/rtl8723bs/core/rtw_cmd.c
@@ -214,7 +214,7 @@ void _rtw_free_evt_priv(struct	evt_priv *pevtpriv)
 {
 	_cancel_workitem_sync(&pevtpriv->c2h_wk);
 	while (pevtpriv->c2h_wk_alive)
-		msleep(10);
+		usleep_range(10000, 11000);
 
 	while (!rtw_cbuf_empty(pevtpriv->c2h_queue)) {
 		void *c2h = rtw_cbuf_pop(pevtpriv->c2h_queue);
-- 
2.52.0

