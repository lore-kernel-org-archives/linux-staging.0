Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB1B32D249E
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 15:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773848157; cv=none; b=ST89I5XngEhB3a5anxcDtLolJ3e1vn2aswP3RtZWT8AU5j79yph2VQgeLBo+fkD8cPCRO0+PJIjZDGOc1uC29Wu6smMA/wOEtaKinljBppjxC5unlvcL+GYertOH+ysO1NBPQs5D556IreSpIpz5rk5OLQNMl1c0LaFWPCxBmA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773848157; c=relaxed/simple;
	bh=iaksN83zWEpKNQDOG2OZy8DNxJFpaizRVlKar5ELaFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S1M4ib5WB5CLpmmXba6Mw+MsUsc2v1N+eD0YSds3RWISVnb+HO1xIpTC4yMEjVwkZ0IsbtJDWptFoYWBRZ34Nu7JsXEmiLEu+g2cTYfQkio+9Gq4pj533ZrQ2vkARZsuatEsnRetV1dUH1V1ZVuymGAY2YePzJEyytgAnL8GnyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqGTxoW4; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqGTxoW4"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4852fdb36a8so81849185e9.2
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 08:35:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773848151; x=1774452951; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qmLES3JIbLhOsJSy/7lN6UWFmou935gNk2MNPg+KYB4=;
        b=XqGTxoW4QxPRal+7BCRIYMp4eNwt0CPyBGXUPRG00j1ZcjuT93ud0HEw0GrWnHX5u8
         S0jxpxIu7ZY8nrKQB6ZNrfCN3IUs+W0ZFFgxwDswVjkO/UGa9Yt783T7CNFJzHapA7P6
         f+bndDZKPFBqo/lj2NltO8YprYPkXsgELC4cHG65+pWQP138/44plFED897VgWEMTEZr
         OShgyF9qW8NBOsCCLk0s3a5XaML3pRDpCI777MlCu5gTYiYbNIedUO+ojmtu+Hh+rPp1
         7UO6ICeOlNv4Puw9SllrcWqq+V+4ZuON1jAj8/n2hfhLOLiJw1CGbxs8Iz1Uyl9opcBA
         dsFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773848151; x=1774452951;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qmLES3JIbLhOsJSy/7lN6UWFmou935gNk2MNPg+KYB4=;
        b=FEhtj2y8Sd/kP8NpFg6LG8l2eXJo/xUN20itP8XpRJ1SwP7TGHjeAq5OOssTVXjcx3
         ZW1Yq3ut4FALjbE7n/rwxBSCwsPiMWg15zQrsXvlk8oKj01lX68HTmdmxfOoaRadbmBU
         1iYJiyh+uCbtgwBePaKW/xSULEb5I3qT6yj6UywnA9QkYYxy7AyKLakC2TeHELFHa5pE
         cIRueKWSMQYff+kn1Oh8NGsO++T2SW9zdSg/fGF16rjBcOPPmOlr103+mIm5vErTcaBy
         Jv0qPARoKwtbfYpCWd7f563sw+XrwR9K+lD8aG7ZYJGMCdYlFfhgB1A3RqVjmrg8rrqb
         Jw8Q==
X-Gm-Message-State: AOJu0YyV8w1xw60OKfb7PKab4Wd+1h+EccORdNQPWnrs+8Sl57AJuio+
	FCDqBSwP1iDaIGt3N+NeeFdMlLWR3Uj2A8gsufvV99D61hMn3UOBBFhe
X-Gm-Gg: ATEYQzxGvSRciSmem0aysSpAvw+0SvDaidMPHGFmU0GN9BO8wSf0loWHedC/msz0QXd
	i1rRjHX7xTOsHanuKqUvq2enmlR+UwbeeZu2DciaMdPH4UnGGizJMjYQHfm256eH8jn8AEj+yHT
	k8H1M3ufMZ1XuFOkow6xusVF+YCNufDbcQu6408BxZRU326UvirgoeWY9Ansg5do6PDQGShSJFk
	PHyE/7/7cCVYOTysPrV7MOPlhYZnrZaYsxyi9KsP1NA0MEaK0bfcZp+jWKSBph3nVQHRuE+QwjY
	bMvhZKouK/kTnvFi7/2nZD8juTWAI1v9MRZH2+wFt13d5+/HPjHw0Z+DwmadbnjNlUd8iMwvTwA
	XFdznabEjqv1/YVzr6LDIP7dFKHh4TpFdly3jaJkCETCikPu/igR6AjmIw6Q8742Aj8ZztbSfb+
	xG4Gmfj+LoAce++lkPfhczmHWq2WAvVzvMAw7FD0AI27TkwEXwSwdVTg==
X-Received: by 2002:a05:600c:4fc6:b0:485:ae14:8173 with SMTP id 5b1f17b1804b1-486f442e5edmr61614385e9.1.1773848150891;
        Wed, 18 Mar 2026 08:35:50 -0700 (PDT)
Received: from localhost.localdomain ([176.216.150.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4613243sm40620155e9.1.2026.03.18.08.35.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 08:35:49 -0700 (PDT)
From: =?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?H=C3=BCseyin=20Can=20Erdem?= <erdemhuseyincan09@gmail.com>
Subject: [PATCH 1/2] staging: rtl8723bs: replace __attribute__((__packed__)) with __packed
Date: Wed, 18 Mar 2026 18:35:14 +0300
Message-ID: <20260318153515.5071-1-erdemhuseyincan09@gmail.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <2026031807-june-stress-0ba7@gregkh>
References: <2026031807-june-stress-0ba7@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Replace __attribute__((__packed__)) with the preferred __packed macro
for consistency with kernel coding style.

Signed-off-by: Hüseyin Can Erdem <erdemhuseyincan09@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtl8723b_hal.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
index 7ec84304a..32a93653b 100644
--- a/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
+++ b/drivers/staging/rtl8723bs/include/rtl8723b_hal.h
@@ -171,7 +171,7 @@ struct c2h_evt_hdr_t {
 	u8 CmdID;
 	u8 CmdLen;
 	u8 CmdSeq;
-} __attribute__((__packed__));
+} __packed;
 
 enum { /* tag_Package_Definition */
 	PACKAGE_DEFAULT,
-- 
2.47.3

