Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793357284;
	b=YeHbJsqQar1f5PgMICWVGEUsyvsDpqY/9QqfUu6fU5atoFLc7lCJsb3qKyxNetr3DHxx
	 mRvAaNBes7noy524J4GYFRQ4VllDOG7u1xbKlahyftUjg79HfzUfdAXsufYhYwGG1Z1IE
	 wE7wYHP3C0vZzzSoLTuCQQ1Fq+5pBqoY/wVaQAXY9iT2ABVs/LxQWuLSyaR8+o0+TVEcJ
	 QU95dQd2qGxyCvsubfqCePccJUebDiJSq071byAZX7pkI/wGqTTs3ICs5KOeLlG+QFKo1
	 rpplozevhhzeYDUD7BE87uYkN7M6yCQzy0MM8sb/qfqSVS2OW3hhEf51C3BHiSdOuxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793357284;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
	b=WM9s1q8os1VkabTYo6OPCI7znZEhjUnBbUIH+pP0ouaYsGXIja1+jhhEpdvPh7pnAr4W
	 L/LpOxiuk49J/cXGzMF/emyhdn6hEGF5K1HiikK98aTd5907RPbwR6ahVLfYd6SNF0qks
	 5tzT7ObGLu/YaULoCtKB1s5jDrwPjo/DvfsmODQRbq/6cTsj/QbtS1VLS9w6r6C3jGflc
	 R/4Uf6ky04kcVkSLEdcT8E7h6jbyDOGtvBNVgW7RDLJSObKqijP5fxwhcIfutuCzAS33J
	 eeT86iAHtU95lyV3jt6WIW+/Ag2PZkZpeNEkONx2KxX/Z7V+B4NIzCP2jFArE7WD5Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UtRnpOvI;
	arc=none smtp.remote-ip=209.85.128.53
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD307606A31A
	for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 10:48:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD307606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UtRnpOvI
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4a2d6d01ecbso3270595e9.0
        for <linux-staging@lists.linux.dev>; Fri, 30 Oct 2026 03:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793357282; x=1793962082; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
        b=UtRnpOvIlgri+RXUlefvwbzODb1xNvJx1vhTbIDaxyHyz6A4QjGe2vWLRlKPJmDkCG
         O8Bs5190IWBhRNEyobOLOLysmVJOIMAjAfI15w8ShNPqTynmFa4NHMn2NNEkVq9h0ooO
         E426v0t4whCmJk2BuR4KjnCMLNhtqBt47xIX/1aDcmkRdw/jq1WARA8UZlgKozd32HOW
         +F1o5O48VugJ5Tw2BsR3q1UcjHQNjYKBnlEVIyeqI8Bto+cHIsa/S4TkwRFq7FHlpgUp
         BuHdSst28N/ev92ZAqRHcIihT2wojC17wn41eQZf9swQ3UOVa3XL7/bXNqGBVR1YYjcK
         qqtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793357282; x=1793962082;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C57ru1ZgQyPfTj2Ltl+MtZ6bKGREeSrdFgZ8/zlIiCA=;
        b=voiSNI8nR0OHvsXR6WdNaDRJt2iC2DYTOm5lxIvFTbfM+1hF2g2B0xGuk5a/G3/i10
         Ip3NiIfGFs9Zfh+JgyzNJM7f57kGuvbO163xL7zrN8PkOSxdsT4D+IbXnRCl0mWYcQ1Z
         cpottzydbCnbghn/HI8CrBC3KZq8CsIPO2V5p3NaHNQ8zyaz5Jb43W3q083k9zerWeBo
         woaplxOACwrp6Y1vFNYw7t7Idt9xLEDgPgvlLVFWFUsJv16sE/aA5yVSJXzf9eV1zBZK
         zdhsJoC/dwAeJOeS8i3DLB79AgKfG308vSUInu04WC7R+JIafHK0vEIeJ3393eUy4ROo
         Tkdw==
X-Forwarded-Encrypted: i=1; AKwUvByk+znEwQeAZVOTeIJEruHiKJKwpRi9gA/vDN9Z2pqYz1HdMeEVcUQyCBMmpTOOa1CoeUBYUf6RvVxoI2Ap@lists.linux.dev
X-Gm-Message-State: AFq9FYIzxrBJbTksyg6FHCdjDU5pFCtfFwnzAuWDaUlLFlDoX2Cc1Hyf
	qkK36Up59+oPMIChlU53ZAO8wcUvSxRCa4sTgc16g7TPWZfYUfT9PIA0jyQ2Eg==
X-Gm-Gg: AYBFou1F9wRTsYTUCs1qmNUAJeBN+x3XgmaxteOvN0hvJPJmVBK6PjJDHwzZrZNMyxg
	IQos1WDhzZ5RJvz+7XebNpg+96+nK7NWG82OFiCSmY98MHHTYv6FgwD5HgJqJHBXNFfcMAtcH79
	buC0/OB4ye5OTIcxZUmy0lygKQgJwhku/5MtHWDxqS6vUnI/4R1CiDY7qtCgbNhkt1QYyUrZLvR
	Iiz822aNoACfMlqEU4lBEaYMuct2owZxfXTAr5S+u+v7uQeRE1ns7/Y/7Zkh2y9Ns6ivrHfHTGg
	3sVjstAH45yrReyCK9V2hpOGlMtWR5XNpK20k1vb0aaSl1okyB6EP8bklrxv+684cnHDCjizlMa
	YA6J8+JxuZkgBBpNZiW/0kgzlvbYR3XGkTBa9BUwveLhtBF5QaOOt9/3723tfQDSAbucybaAyXb
	fqccO9UTpXXYAidCuoUxMEDVS9/2BB5KSFST5bg/GxTKYlO7D4PVxEbs1kZjayaKGKQWHTZfJOp
	aIFc7Vkb7M5Yp1itNf2zxRo7upcO7urvdoSOQvDZwKQYGo92gN0C1l8Avn+r211EgADoUbjCIZn
	70C7ZpNdO8G8oxIJKUJoMhwLpVM4saLx48QD3HtFWz7uMOeI3AnoS++YEH2y
X-Received: by 2002:a05:600d:a:b0:4ac:aae6:6401 with SMTP id 5b1f17b1804b1-4acaae665d8mr12093245e9.12.1793357282256;
        Fri, 30 Oct 2026 03:48:02 -0700 (PDT)
Received: from fedora ([154.183.179.146])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71bae25dsm2240473f8f.59.2026.10.30.03.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:48:01 -0700 (PDT)
From: Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nuno Sa <nuno.sa@analog.com>,
	Michael Hennerich <Michael.Hennerich@analog.com>
Cc: David Lechner <dlechner@baylibre.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux@analog.com,
	linux-kernel@vger.kernel.org,
	Abdelnasser Hussein <abdelnasserhussein11@gmail.com>
Subject: [PATCH v2 0/2] staging: iio: addac: adt7316: clean up header inclusions
Date: Fri, 30 Oct 2026 12:47:43 +0200
Message-ID: <20261030104745.16693-1-abdelnasserhussein11@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up header inclusions in adt7316.c

The changes are split into two logical patches:
1. Drop proxy header <linux/kernel.h> and explicitly include
   <linux/bits.h> and <linux/kstrtox.h> per IWYU.
2. Explicitly include missing headers (<linux/err.h>, <linux/errno.h>,
   <linux/pm.h>, <linux/string.h>, and <linux/types.h>), drop unused
   headers, and sort the remaining headers alphabetically.

Note: <linux/device.h> is retained because the driver explicitly calls
dev_get_drvdata() and dev_set_drvdata().

v2:
 - Split the original patch into a 2-patch series.
 - Dropped proxy header <linux/kernel.h> and included <linux/bits.h>
   and <linux/kstrtox.h>.
 - Explicitly included missing headers for types, errors, and PM ops.
 - Retained <linux/device.h> for device drvdata functions.

Abdelnasser Hussein (2):
  staging: iio: addac: adt7316: replace kernel.h with bits.h and
    kstrtox.h
  staging: iio: addac: adt7316: explicitly include missing headers and
    sort

 drivers/staging/iio/addac/adt7316.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

-- 
2.56.0

