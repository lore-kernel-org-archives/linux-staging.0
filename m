Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719141DFF9;
	Sun, 17 Mar 2024 19:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710703567; cv=none; b=j0bfuVllxJVrz896mrB7oP7lwAAnxZOE3wCPa1TQO4GOADsEcpNTbSOJ4owndvgZljXgBy8KPkMZOVzz0JRsIB8sRuLsC8IjqdSdkzOkbmI8QU3WtYcMfDPp5wJQ7Yp2Hl7E5nM/VMI4Qd9L24S6kuNDCnBSwV7Ymq/U/hRrwB8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710703567; c=relaxed/simple;
	bh=eLV0CSNLZVxwDb61FAEDUHSpvfXBaoJw6TBhaBomd1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WVX/6GDg2SegHSKz1fTAvd9jtb2mVonqfVAgNq5REQD+Y7RaWzYQ0fyJ7hUgZ5k0tIY4+SVG8JDjzan5BP2uxa6a4C3s6ye8FfROHARo8+ZIAbqlD3kiN6sGqXiqjNcncdeCqEpNMkCGrh57xHe0QvZIu/JMovfZqAfrYEe2/mA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NSSp+m29; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NSSp+m29"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2218da9620cso2544752fac.3;
        Sun, 17 Mar 2024 12:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710703565; x=1711308365; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uhlA0khsXTr13PWQMJChrTc0wcbpicVimWfo8/ANB2k=;
        b=NSSp+m297MavvfCqS7fN7/D2780x4/D2xWpWFMP1roVgYQL/et7J7nmEm8NwJFrNZj
         AR7vmSX0a9R1tNqJQMHYt8CqRU6wAg8LnpN4OEoQS95NiI/uvYeE1jLskxpWV/TB7ehL
         SQyG5oXYu3oNN1YCdPTUgLsn4+teIYmRyU6Zyd5zTK2Yd89C3+cfTlzqmbrvS4c75GKC
         9waPA80rw/E7K6r5a6oqp0iados+NBuwxSGeUYk5da16OJZJPWIsSFOOjN9V1Bs0GXCE
         V1xJ0buOHeau0TEctJUMhG/N9RKi0Ryom+La1bj0TOXa+cDx3AyARoLadMq3zRQwYXAu
         RB9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710703565; x=1711308365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uhlA0khsXTr13PWQMJChrTc0wcbpicVimWfo8/ANB2k=;
        b=dLykrjhya+jXMwnjmy0Tvhg8jIt5zbuLosopmHOuWjctVGQ9wNUKZD99W5ZM7Le24m
         SAeRCI9foi59fBRIuJUu+EiFpR1lWYfzhzZJkdcgbkiEQiY2IQJTfSnoPNCfEkD4/+kI
         eFfpKGIVlC0g8IwKgyPOOizHVdQjbnar7TFn+hsHMrM1pcg/glDME0vTGl43RDT1RX5x
         VKjjC+n7cjsE01o4wDByYnEJadfqS3ICEaj1HhW4e041S7I+G/mK9ksAb06rS6d14ZrT
         MnoCXN9WPg/hYmxyCk/0y/0B903WAfP2iUNsy8x4kIudBLVGEeEHvGzCvnUjkQw2PtZI
         mMXw==
X-Forwarded-Encrypted: i=1; AJvYcCXW35zePcEZtPizbfnLX5EY2Mu+FXEJ9tD1fCBtHk7NB5ZbWW5ZlzK2Ue+8XI6OEBUHMv6uPheubjctxKaYBXZdJooDTbvfM6JHIty0jQ==
X-Gm-Message-State: AOJu0Yzi8d/KP39R/tTu/8qMRlKQEzB3lQmLIKQ3+FdlLL4P/NjsVV5m
	OAjY6aulH0iRoZrXOxxz28r3/fZG6/Ptt69fFY3AUcWgfLHMk4mJA8/AU4RuR88=
X-Google-Smtp-Source: AGHT+IEeatJjLah63pbaUrOCPXVFpqa9d1LONam7ODwmgRFtkiYcWQKSaZi8G2acq0WEmh6RY6Ugyg==
X-Received: by 2002:a05:6870:fbab:b0:221:30a9:e481 with SMTP id kv43-20020a056870fbab00b0022130a9e481mr11479762oab.36.1710703564223;
        Sun, 17 Mar 2024 12:26:04 -0700 (PDT)
Received: from ayush-HP-Pavilion-Gaming-Laptop-15-ec0xxx ([103.6.158.65])
        by smtp.gmail.com with ESMTPSA id kt2-20020a056a004ba200b006e6233563cesm6474347pfb.218.2024.03.17.12.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Mar 2024 12:26:03 -0700 (PDT)
Date: Mon, 18 Mar 2024 00:56:01 +0530
From: Ayush Tiwari <ayushtiw0110@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: outreachy@lists.linux.dev
Subject: [PATCH 1/3] staging: rtl8712: rename backupPMKIDList to
 backup_PMKID_list
Message-ID: <10336a70a7d1b87857664e9733a419791e0e2ada.1710703217.git.ayushtiw0110@gmail.com>
References: <cover.1710703217.git.ayushtiw0110@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1710703217.git.ayushtiw0110@gmail.com>

Rename backupPMKIDList to backup_PMKID_list and remove extra spaces
between RT_PMKID_LIST and backupPMKIDList to address checkpatch
warnings and match the common kernel coding style.

Signed-off-by: Ayush Tiwari <ayushtiw0110@gmail.com>
---
 drivers/staging/rtl8712/mlme_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/mlme_linux.c b/drivers/staging/rtl8712/mlme_linux.c
index b9f5104f3bf7..a8cda81f4240 100644
--- a/drivers/staging/rtl8712/mlme_linux.c
+++ b/drivers/staging/rtl8712/mlme_linux.c
@@ -84,7 +84,7 @@ void r8712_os_indicate_connect(struct _adapter *adapter)
 	netif_carrier_on(adapter->pnetdev);
 }
 
-static struct RT_PMKID_LIST   backupPMKIDList[NUM_PMKID_CACHE];
+static struct RT_PMKID_LIST backup_PMKID_list[NUM_PMKID_CACHE];
 void r8712_os_indicate_disconnect(struct _adapter *adapter)
 {
 	u8 backupPMKIDIndex = 0;
-- 
2.40.1

