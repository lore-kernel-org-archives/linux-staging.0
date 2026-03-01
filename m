Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A35175A7E
	for <linux-staging@lists.linux.dev>; Sun,  1 Mar 2026 23:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772406214; cv=none; b=X3Q4iU04UlSYHxHfxQzzS72EhugoK4Pxeo/objxtOBqgydDRF1ENp8p5vXmwJ6Gv4hgVFjKpFhuYO8d+zfZe1DtgzHnLE3MQomPGzJl2S0fPB5IcI+D+G2+MAOqdEjIxIyDhredI06DGmHO9T3NHZx5N/A0Le7ditR/RwnyP8rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772406214; c=relaxed/simple;
	bh=KCX6FVaCwzZMvWBjW4mn/lFQ6jE8iYv40lLJY5GUmcM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oV2xEoBPpwSCEXzkO64ahxC3FDg6wk9nelfPWjS16uP881xAIpFts2+iC/AfDpjuHEe5EwWFxUrmsYWThF2b+ZMvKgY0VYFq7KZ/qVWmZKbgv+gAi/u8RIzBBMfpCE2DaHdNlIo8vsSD9k+6iNxZaFoFRU4bJn61DhYg5VqHRHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSQel5MZ; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSQel5MZ"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3878de20527so54844511fa.3
        for <linux-staging@lists.linux.dev>; Sun, 01 Mar 2026 15:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772406212; x=1773011012; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oJEe7Gd75cfSR79NZ/GHmd7u1XTb2bnma24PoRa693c=;
        b=aSQel5MZR08TsgW/8GzQvCEhVD9XQU4hqS0Gj7ZQpYWFvYACrm6Bdq/ZU671bxgaCF
         U286xeEPtNyRBOoh/LJipOnnMdYx3zi+ROl+b4E1VK+wBia571tiBrDGjl2xpN9aw3d8
         cb0V3ATq+sTZJoyrWUeIGCXSoteamzdgKZQlNwx2hq0/Q582BKbCTGD0aH9hntWa2v9g
         EvoviduaOoJPIfFb/L8AiHVjIEJXpIy3g6EBqYaGxDycknLTfm/P3yWdX9iopRuCvlJx
         M0ft0+AhWMXnTuOzrwHMf2r3uDsqiu0uA/RBe4CjRUan+eiG+syMVU+odUutqVgVoy/Z
         JiiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772406212; x=1773011012;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oJEe7Gd75cfSR79NZ/GHmd7u1XTb2bnma24PoRa693c=;
        b=qYI3vyapam1i3MuuiFAtX8uzMWY3xJSuM+/sw4BwfXAE8+aYy+EXrIWivRv8D1icRb
         cXncokGnBDofFf+oHP9OLnCpnZfD6yRLMwPV0Z4cltgOpd7U0latTgMY/hX8Nvyo3h/o
         l1PKa/bmz9Wtuz5UkYwD2oj5WUHQr1DYlUDVscz5NLVRf7o8js6w3zETOAvjT0hdPrGi
         kqt0IxpYQOw815pZfmkFI/A7ECww5DCvGfv+YWAQuYP80c7L0FZTFYQMYhQ+HqQu6Twe
         EoYwnUXx1p2AEiXHtM2BKUqN1GDTm7yUJml12uA+X9/qqV/HYemjgeYtwuvCivvvzi7z
         gjBQ==
X-Gm-Message-State: AOJu0YyQcgbSVBtViIez4j1R0FZ6Jqm/PAXXN/Bbp10ZdyOz0pfWVW64
	SydIHpt+tO9/Td9nYbR5f3KQohpQrzRldkgsCrP/Rob5H7+Z5LXTGQLp
X-Gm-Gg: ATEYQzwtSqbQnZf/+iZtKN5usTccNwnlPy1GjCodf9JBwcETbfNMbkLhwaEUV3DKuwB
	Fg3AiO00v1Wy910JpHiboQ2ZiLs14wvcnxOsxd/ZjHmTvrudeVuRZI/FIQs1Dk+JB5265DOqo/k
	iZmWI5TwOJb6UkzEybX/GBznWWJfIZkMHKOVVZuUgFotqLiY1fSUtiQ1zevjW183jfdLxn9xDuC
	J7eINaYSSXWJdJB5qMCod7bKELaxBtLwVr8x9NLzrTL32w7ngTnSTWilfai5NzzvpxPN4pbt83u
	yth0sP6Hp5Vgs/UiwyiY+kTMGvriJ4dNgLsubHaqwumDedRrNQ2DKKIQeiPX075JrrRfgspdERq
	mOEoqGQskqA0W3EJeHQ2uqew68rlU3BPuNl2n2WWXOjwBzDbTGddWk4WeQjx8ft9q+YtAIGBPzI
	Q0I2LE2fzm8//SIGbF1aqe93Q3hJQkf9uuYmr0e34P6r/YbCIswaONEBeT6F63A3X5NQFSwLeke
	Q==
X-Received: by 2002:a05:651c:31db:b0:386:1ce2:1194 with SMTP id 38308e7fff4ca-389ff35b079mr67049931fa.31.1772406211712;
        Sun, 01 Mar 2026 15:03:31 -0800 (PST)
Received: from T6NXCV08J99224A.lan (81-237-238-191-no600.tbcn.telia.com. [81.237.238.191])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a11c857c5bsm571011e87.62.2026.03.01.15.03.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:03:31 -0800 (PST)
From: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Oskar Ray-Frayssinet <rayfraytech@gmail.com>
Subject: [PATCH] staging: rtl8723bs: replace msleep with usleep_range in rtw_cmd.c
Date: Mon,  2 Mar 2026 00:03:08 +0100
Message-ID: <20260301230308.5551-1-rayfraytech@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace msleep(10) with usleep_range(10000, 11000) as msleep < 20ms
can sleep for up to 20ms and usleep_range is preferred for short
sleep durations.

Signed-off-by: Oskar Ray-Frayssinet <rayfraytech@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_cmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_cmd.c b/drivers/staging/rtl8723bs/core/rtw_cmd.c
index abb84f8aecbe..f6293f049c75 100644
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
2.43.0

