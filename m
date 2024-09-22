Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4511B64A
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 19:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727034080; cv=none; b=ddEvYKEhqak+YnhzfMppREihQvMh2B+DY+v92bdMJkP9rIgfUdKUGVdY9ui7nbPmpoQqaeH73h4DSDAwD/6QqksVxB8mYbY+3TRpdGNqHjazFm+/rx1kzS0FoQrgh5Dd6Fuk0gMIYQl7ZGJ4ud5uPKwYHR0T35Ccfr0nT7xKzQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727034080; c=relaxed/simple;
	bh=pse7K2BaMu2aE5LI1j2rQa3cafHBfIlygb5qm7lvpxQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NKKOlQSMWcwvglRT9+iVOdE1stN0boMcJ7XMGccpOEcO9GJd5EeW/gSenigBrO3xOfQj65o6ZKDJivg7Ij8fe3z2DAzeIoLaP0A1LpL5xcICsDYcrYse9JLMiwXpuoYl/nZP6ZkQC2a1QZ/R2P7+WTBrDfCps2NCoxmEMjcGsTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=atMaKTZt; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="atMaKTZt"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-42cb6f3a5bcso46892905e9.2
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 12:41:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727034077; x=1727638877; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qdOsRVJOv+qCDZ5vFVWSC0So4+sCV1euWD4zZOd815w=;
        b=atMaKTZtT3P9KslqD3ygN5b9yaSsnd7j/V9Uu+D7ZPIIjjUDZ8vDhabbSYQnwX6THW
         cETiCj6uqaUIkmB/ENR0F2nuBubOosVBxqYS6UEh3PcMS9B9tBT8IeCHDw+dLA289Mq6
         IhYAGKcGC+nPV1zXKc3+GfrjNtk3nWilz3QoKNTMJ9aH6lxg2MbvSHMYhzA1MPmRdv/k
         PgvU1fEAqDDkwhFqjLtakiEKkowJwSpv/b/AiIyREEc0raQFmFQtx7j+2hqwKSu56eHl
         mh/N8hQ8yV5071iBI1zW1YSEpRnIBKMq+BhvR/MsmMl6JkVxViwWVNXH+X6CWinGJ11g
         SKTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727034077; x=1727638877;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qdOsRVJOv+qCDZ5vFVWSC0So4+sCV1euWD4zZOd815w=;
        b=fct0Fje9FfovtMlZ/5AX22AiC7GDiUTxlAqXagSWT8pTHn1TgxClI6XCEMWt/Hshwj
         5U/+uWZBYzPkug28/jyRenYpJwxd6xtAxj5MIDj4QnG4VlcSKxKgkGkieOSlqqX0YIYu
         TZ3qbEJ4ycOV+ZImTu9QQAmwgbggW/e0tiQkCrFgHBBd5Iu88oGxs0c2ECGg3KlBOo1d
         p9MhOWLcvxJWbPPs1wg0HNRa268YGCVHN02dZ0nc2nPs8UBTgIeUjXKf569yTGJZmxP2
         X2a1xa5Z4B1dFIFOYc0rtjT6Dh9XaKyFtMfciEcx0KCqLqnjq53Ndmj9VNlBEUJlnFNq
         EEzg==
X-Forwarded-Encrypted: i=1; AJvYcCWSD5T63r0DsJjSLn9L34LaViFrfk3lCKMCjfLzqUjnpQe28ZktFWgqd9ZZyQObOzI3SPvyfStfWlktHd02@lists.linux.dev
X-Gm-Message-State: AOJu0YzjU0+G0pd1tCncwUwzoykngg9EwqVFB74U783z3niODEJrKpQz
	qdYC/QjiinqGrYQDIQWqtbgfKgwWqPRs6zwtCU2sIHDxMQZdESLJ
X-Google-Smtp-Source: AGHT+IFrDmRddqyKmVVU/VMVZubH681CkPHQIvvZAySlGFypDBscZvtqR9eBRJfDHu1Szn35ZtOvdg==
X-Received: by 2002:a05:600c:314c:b0:42c:bb58:a077 with SMTP id 5b1f17b1804b1-42e7ac30863mr97223205e9.14.1727034076607;
        Sun, 22 Sep 2024 12:41:16 -0700 (PDT)
Received: from redaops ([79.115.63.226])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42e7ae5fc75sm82341015e9.9.2024.09.22.12.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 12:41:16 -0700 (PDT)
Date: Sun, 22 Sep 2024 22:41:14 +0300
From: Tudor Gheorghiu <tudor.reda@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Philipp Hortmann <philipp.g.hortmann@gmail.com>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Linux Driver Project Developer List <driverdev-devel@linuxdriverproject.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: rtl8712: use kmalloc_array
Message-ID: <ZvBy2lB_ok_OCmVI@redaops>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Adhere to Linux kernel coding style.

Reported by checkpatch:

WARNING: Prefer kmalloc_array over kmalloc with multiply
+       pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);

Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
---
v2: Update patch description
---
 drivers/staging/rtl8712/rtl871x_xmit.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_xmit.c b/drivers/staging/rtl8712/rtl871x_xmit.c
index 408616e9afcf..a0f29fab3dce 100644
--- a/drivers/staging/rtl8712/rtl871x_xmit.c
+++ b/drivers/staging/rtl8712/rtl871x_xmit.c
@@ -117,7 +117,7 @@ int _r8712_init_xmit_priv(struct xmit_priv *pxmitpriv,
 	/*init xmit_buf*/
 	_init_queue(&pxmitpriv->free_xmitbuf_queue);
 	_init_queue(&pxmitpriv->pending_xmitbuf_queue);
-	pxmitpriv->pxmitbuf = kmalloc(NR_XMITBUFF * sizeof(struct xmit_buf), GFP_ATOMIC);
+	pxmitpriv->pxmitbuf = kmalloc_array(NR_XMITBUFF, sizeof(struct xmit_buf), GFP_ATOMIC);
 	if (!pxmitpriv->pxmitbuf)
 		goto clean_up_frame_buf;
 	pxmitbuf = (struct xmit_buf *)pxmitpriv->pxmitbuf;
-- 
2.43.0

