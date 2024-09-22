Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A925733F7
	for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 17:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727027204; cv=none; b=k1VrEY4MDUzIoQch6PZcmQVjfMyjUeHzF8qbd4al81sFuwgkdFMaWLThNI19a/handUGi2sINR0U2GhnFv5vY04R5xfq9Pwullin7e2q5kX8LFMsLDJZE5hAPDAG/DJWjmtRvWX2z53mrGVBciNq3XlWghIoeCXqsxGn3ssj3ko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727027204; c=relaxed/simple;
	bh=yT+e9cLg5KAO0dTu4tupxiWtJbh7rtcCL19uffi9RgE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Fyh6gs9n5sJcMfSooOZmmuNNqwZiW+ngLkop0nTwSgXbh4uHD2gw5/d7wIUL3WodDec3lk5y0XOpEQEJDQT/K1HgTf9J2h4s4RCMTQKisGLf19IbdZq/o9dxk6mlEEblPlRZzuDoLapUw6PrGcdmR2Ad9AZVoY3KswcoZSDihGo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Pb3JDqTY; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pb3JDqTY"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-42cae6bb895so35571375e9.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Sep 2024 10:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727027201; x=1727632001; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gnvWdvuJww5fvZzybivqOBV/MrLD4R7C4eLuYWt9SS4=;
        b=Pb3JDqTYkosNqEOLhQ/K0XUx7fWWVySsIJdRdwKdC3uDCLCc4uQbwpIqvuRUQnXWMy
         Rzx0BrYLhsGfz8KvcQKyzeAYXP5jSyDzRFDG9ZITwXywjIWUJpJU1iUoQMSOJ0LvE+WE
         2BZUrOZ/RdFdYQOuw6La1xisQ7CYkmfbdWnOzfsyqE2vKgW4H+j2ePVYZ/t0kkrEM20Q
         Xw7iHylbHB5CQp6mr45K5Ve3UXwmhJ9vKbFnyvq/yv2AUNPXSviNN77b6TtenfyWYVS+
         DLlFhx5GoThVaZJ5uILUTJ/ti+zDfaNPhdbAUVI1h0cmKWermgo7NjqBrC4ejPhS6euE
         1G+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727027201; x=1727632001;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gnvWdvuJww5fvZzybivqOBV/MrLD4R7C4eLuYWt9SS4=;
        b=h2ZFeKOyhL2hd1dh0vZmJnXoFtaayak0HDrxiTFPii+lA8lKTXyO/jeEyx3Sse8sS2
         E3uZ81shmQ2SJdegA3yZs2B/ixe9wVY0p/TCx8jjtjw34At+tStNPkB316M3kD8W/bm0
         btIS/0S8NWORoEuiWtr/scHe4SFYijSloN5C+SJWYhJAM0KHG4f9AZcCY5/Zg1dFxOj1
         1NR1ZDruNY074bkx04/eGwalAgtbBTwLH+DnOf2cPLweD3GYmfS1uWS5js1N/r8dbCTG
         Sm96kZNKganhQ8RGdaqrm3uq0T7m9QqikUrG864MOZAh/mh4mnrGC7KwBF+LDQn8tPpr
         7n9A==
X-Forwarded-Encrypted: i=1; AJvYcCWMtJp7cJ57nP8/GWAEzXTS95PWM2S7Tp5u5FUga8JB+eQaVist/BQv8R5RTR8/XaJ5ybtNldIauZvf7HeT@lists.linux.dev
X-Gm-Message-State: AOJu0YynYJFXuLYETzASv/Ba8fab2dSOLvlN0Ff533jvI4JWPpb/gOBT
	9iEZ4N1iJxCwd/HqG5YrskQoE3Xw/ec5ZeoZRfaL7R92Fhsnk8sU
X-Google-Smtp-Source: AGHT+IEAmoezQCA58M7TxZTjw6/mEmIIL64WX7bl++fzagineoSx+pCSZHhasoNQ7HRuUt+XEqcSwQ==
X-Received: by 2002:a5d:4488:0:b0:377:9867:9028 with SMTP id ffacd0b85a97d-37a431ad4dbmr4816905f8f.44.1727027200813;
        Sun, 22 Sep 2024 10:46:40 -0700 (PDT)
Received: from MacBook-Pro.local ([79.115.63.226])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-378e73f649dsm22543392f8f.53.2024.09.22.10.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Sep 2024 10:46:40 -0700 (PDT)
Date: Sun, 22 Sep 2024 20:46:38 +0300
From: Tudor Gheorghiu <tudor.reda@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Linux Driver Project Developer List <driverdev-devel@linuxdriverproject.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: use kmalloc_array
Message-ID: <ZvBX_mugFRQHMq1r@MacBook-Pro.local>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

use kmalloc_array instead of kmalloc with multiply

Signed-off-by: Tudor Gheorghiu <tudor.reda@gmail.com>
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

