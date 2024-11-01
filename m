Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A45E1CACE4
	for <linux-staging@lists.linux.dev>; Fri,  1 Nov 2024 17:47:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730483265; cv=none; b=X5R6gAm4ZYPmGOsnUuLy5JyKFwD3HgMnjpdRiSbkbi3ACaWsa19MnDA6IW5PS/uji2hE/hX7aj83dK18u3q2/LSsxoLc4TtKoFjKIUQ68cBAytfSZVrx4DUNNJuYEaoA5te0/oZfrxa0dTAcGBohoFky4lqR9T2Ju2hf1/LMnUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730483265; c=relaxed/simple;
	bh=KxFLCYeLJza2wbtJq3ncvPACnBNOfSsUAesffJ457fo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E5CUubEMTCSnfw6zf4b/fZzuFkvAw+dB2xCIlCIn0idqpkH8sMnKMiDfDZJPSt5poUVWcQuvtG+KEaNLeSxbPudrgBEV15sRL4FTjwegJtcAEp5MLQ4axipx2kBtm5nK4m6MBYKs7+EYvprPhbxr/0yGCmykwLWEs7B4qgx0nAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kYyBjIdJ; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kYyBjIdJ"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4315839a7c9so18865075e9.3
        for <linux-staging@lists.linux.dev>; Fri, 01 Nov 2024 10:47:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730483262; x=1731088062; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GaiHnwo8DRW+cYed7a1HEMqLUzjFX++R0qMPfhF5vLM=;
        b=kYyBjIdJZXaVjZlRNGM+6IpE2HXnHuRgAuxJp6mt0rs7cts8jKoZLEQqedr49cQsGJ
         EUxGUved9NIAMt8rLnj1WTzsmnqMycJcEpZ3O6fN3M9Of/J3Bl5CXBikmCKNzjAjhkXk
         gf+3lv4kjt6DzCIkNv6uQCarrfPp6uQdaWUKWemJuRyFOyzC/MMAXFJYk+Y1XRYWzz1r
         16vNlvFgj9KqgY/5s5PlR9nP7VXgmf0tHn1M4HVkUZufgn019xPVmmKPabCoYm9yWU4l
         CCKLSZ7ZhK5mCVUplmJS0g719Z3uQjiROHiGaxQ0YsGaXV4/nNRWyx5khgBcBVXPviz1
         uTuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730483262; x=1731088062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GaiHnwo8DRW+cYed7a1HEMqLUzjFX++R0qMPfhF5vLM=;
        b=rxdoHc/+XhUK2J0hncDmDvtRlaR1R5hQlWA8+0vsx1ZNWg++T7Zx0qXG+qAi2zhoms
         9Bq+ZCUitXdUYTzKlTKAYiByY6HuPrvx1YBd3qhOsGfJpSbI4NvwlgZob/C0fme4soAI
         9XrMz+XoXmY9mulOdHZbHs8n55mrxulqpa0ZTsH6U4Q80ZNnww5CdsTNi+jsBgBPTGgf
         nLwL6semDmq88zxtMfnew+e5qVZvXXyos0pRIc/GHuJxidkiCXa8UojIoCqM8iLreXUZ
         9VzXU6t7b6btvagfqleV9I+OTGHX/0x3F5G+cCDzXEO0cp+By35W75eN0dAvgCyUGjUM
         3Bhg==
X-Forwarded-Encrypted: i=1; AJvYcCWfbRJhFNNKlcrq4hd2BWP4Vis9tM0vOy9LlPm0C2Li2GGsFEkz6lW62C9OEHE7qRZLEjzGTg+IHo4aPJPz@lists.linux.dev
X-Gm-Message-State: AOJu0YzGfp8+e9TEdXq9+rCOKGXRpUDjlHrw5AdxWzPYEFlou9NUDRGY
	toJp20AaA8jNmyQgQ0r8+81mM0KRmnMdB4AqdIqqCV4en3U5JtMK
X-Google-Smtp-Source: AGHT+IEoDC1+DdRyNwiGYE7qetGrHQUyrDq7g7gNsyLBOiO9dmY8iHh/vdMDVHQHSTCGd5Si/xC6wg==
X-Received: by 2002:a05:600c:548a:b0:42c:c003:edd1 with SMTP id 5b1f17b1804b1-4319ac9c555mr211530915e9.10.1730483261864;
        Fri, 01 Nov 2024 10:47:41 -0700 (PDT)
Received: from localhost.localdomain (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-381c1185b4bsm5732933f8f.112.2024.11.01.10.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Nov 2024 10:47:40 -0700 (PDT)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: skhan@linuxfoundation.org,
	arnd@arndb.de,
	Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 1/9] Fix buffer overflow in ni_usb_init
Date: Fri,  1 Nov 2024 18:46:57 +0100
Message-ID: <20241101174705.12682-2-dpenkler@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20241101174705.12682-1-dpenkler@gmail.com>
References: <20241101174705.12682-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  The writes buffer size was taking into accont the number of
  entries causing random oopses.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
index 571f07800c9a..9ff56b063681 100644
--- a/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
+++ b/drivers/staging/gpib/ni_usb/ni_usb_gpib.c
@@ -1726,7 +1726,7 @@ static int ni_usb_init(gpib_board_t *board)
 	unsigned int ibsta;
 	int writes_len;
 
-	writes = kmalloc(sizeof(*writes), GFP_KERNEL);
+	writes = kmalloc(sizeof(*writes) * NUM_INIT_WRITES, GFP_KERNEL);
 	if (!writes)
 		return -ENOMEM;
 
-- 
2.46.2

