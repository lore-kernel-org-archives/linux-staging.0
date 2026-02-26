Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F45395255
	for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 10:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772100276; cv=none; b=XZko8oMpiRqBzwOQ7Iq4Q76sGgHqxkV20UXQJ1V2MXnNtyNdqF5rQfmJUW2i3kzQhYp58w2ZJvTenOJNmbERJyG52Nb7XHRXCeu8IJcCrZcRoKe/MRzlbuid5SzzoqWIub+cEHm3kK63a+UgrYh7spVMf++uAr+ZTyVEGEIJ6NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772100276; c=relaxed/simple;
	bh=TpmRMTrSt0AzkCoIxOcR/WuJU5gZqo/9E6675P/b9yY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a8jGA2EzhLs/hWDJcIvkO0oA49acZT9ggJ/j/ia/geV+1HSE6Yg8xCvMxEaJR7vHFdm36FU4v5NclflkTrhVtC7qQQvjK09aSp1NTJy+cYM98Pdwno7TaNLY9RmXj8FEjYMcroWiMlc81ieuGcXDKzSmObTsh+6O5+mSnEkYh98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AqVtOgsV; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AqVtOgsV"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-43985ddb926so38458f8f.1
        for <linux-staging@lists.linux.dev>; Thu, 26 Feb 2026 02:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772100270; x=1772705070; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mJy/BQM1aAvC6E7KNzIu7Vnd1pVn8NPr3vRBjc1culU=;
        b=AqVtOgsVZsiJ8b5/tIF9E4yiyVaOj987l0qcB7ydmOkEiSyNXhdW5uwfla9m1t2luK
         KDJJ5L1zkxQ8HDILz/driQwgRWwWOvKoTJBqaCAgUNBfVgcmXddBmE7eczguDjz1HBdS
         X1O1Mca/PLmzuOPQdmJaWhRgyZFIa5GQhjCkAm+x9p/Cfpwvb4wAfVh3MdE8EE8GUkev
         EO5qz6htWn1GZdb5Csr20Ued1FV4wpGEfiP3UF3yd9RJcGUu7W9PqEb0xgQjrXNol7CB
         B6XQG8KoztOeiNQoXve5XmjEr1iUYvFmhPTe2urxqam8uXR5apbP7RH1qN2cjvPtT7Bv
         nRhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772100270; x=1772705070;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mJy/BQM1aAvC6E7KNzIu7Vnd1pVn8NPr3vRBjc1culU=;
        b=Ox8jWGLx8WQSY0jkZsdlb8IguLzC7/45r9gVEq7P/lSN1S1cSzaZxQsNOeDb9A347P
         w4lYtJhlfz6e/mO7irkK4cZUACSMN+KSvp9ju8VXjsqWr2zoPUuWqG/fOkafhU46tw06
         mcqEOB4mm0NGpFGilAgh8k/sEMtZRe4d8XlfEpeZJIwdAjRtLx19Zk6wRRd5TH6dLDYT
         GVl+aQ+WAeUDozuXy8G2YjzGhHpJhnQ+dUS+lRRnYSV9jYFR70EP1tTsRS+BiryaltLP
         ia/DUdsUdEO2lOwXu63VCqwJrvgJWMh14XJ+P8BY7q7rVt9lQXeoS4k5oRQ3b3jCZ3aY
         F2tA==
X-Gm-Message-State: AOJu0YywnD5dI9y27oX81/cGYixI5LyJy2wAteDZrXkfcqDIo2afbFft
	yMxp8DhRFPCheOQ/L4us6P9wFrtvUoM8tiQLdDHSwHx3im3WGztG5QRP
X-Gm-Gg: ATEYQzz8L9BbmaGUoSKRogG+3VabiNCEfihru5mQM/N2BwIWwLqUNAQcLShaJZtgj/u
	FGhL+nrLjdQeFIfP5tQElX5dCi2aOA6yPHKg9XMdVqOwo4W58SkvWRdBGfFzQZ0WF8IpA6eCxgv
	+MlFATdV7Kl0gGoqM+IGDJsS3PQS/NVak9EXatIZDgXs+3DZGzUEn+HCEtYd+Pox7OddcYVeXzX
	xQoyrUxOBgu9COoCAuFmccPWMqfav6biYH3dH9caTOBp2qdCYhSX7mHc4LmBsXkdiexDL9ieNZi
	wm0wj5Z63Kfh33La23NyZJKZ6y+9qyMsu6XDfN0Lj04qC7HDr/f2yBGKtvcE11YKc+vwhdHOIkW
	ersJiOXjtZ8cpO+qPnUQO04JBYleih8NkZ2pLyB9DwdL4EtqHs5iFBro6+Nof+G3OSJnoZdcYF1
	hIVhZlzcZBUEGsuz8COoUxegcn1rUJWtfRnMavThYaPDbF1FYHHeUiGqnoh4IU633q5RTpPkws/
	DWqvIovYRuzfmCsNXaownGBkdSTFqKHQFDEq3CyYs7y/duzJYAZ
X-Received: by 2002:a05:600c:470f:b0:483:7d93:9fb7 with SMTP id 5b1f17b1804b1-483a95ec6bamr196979485e9.2.1772100270280;
        Thu, 26 Feb 2026 02:04:30 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43994da2584sm7127026f8f.12.2026.02.26.02.04.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 02:04:29 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH 05/12] staging: rtl8723bs: remove unnecessary casts in rtw_recv.c
Date: Thu, 26 Feb 2026 14:02:49 +0400
Message-ID: <20260226100255.167059-7-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary pointer casts in memset(), memcpy(), and memcmp()
calls. These functions accept void * arguments, so explicit casts
are not needed.

No functional change. Object code verified identical before and after.

Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_recv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_recv.c b/drivers/staging/rtl8723bs/core/rtw_recv.c
index 337671b1211f..6f27d50c5f5a 100644
--- a/drivers/staging/rtl8723bs/core/rtw_recv.c
+++ b/drivers/staging/rtl8723bs/core/rtw_recv.c
@@ -17,7 +17,7 @@ static void rtw_signal_stat_timer_hdl(struct timer_list *t);
 
 void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 {
-	memset((u8 *)psta_recvpriv, 0, sizeof(struct sta_recv_priv));
+	memset(psta_recvpriv, 0, sizeof(struct sta_recv_priv));
 
 	spin_lock_init(&psta_recvpriv->lock);
 
-- 
2.52.0

