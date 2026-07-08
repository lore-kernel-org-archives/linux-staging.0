Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C3843DA3A
	for <linux-staging@lists.linux.dev>; Wed,  8 Jul 2026 12:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783513183; cv=none; b=kYjbsoVKBMIKUCKgm1GbLe40qJbAm80A8qJ8XRQyKZRp1YnBWgH3CzQ+RuRU9viPeSTDVC27N+iPFqrOardcZnqf3B8EZlR0Zrm0svFR4Joyc0V6EQCSESL/qNKoF6s1XUJdmI5qV4sECxMhYgkdv2hx7Xiu7dqiCRzGRNgm/sA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783513183; c=relaxed/simple;
	bh=MzrdO1Gj+TqyTl9af1pJyO4PFyUudFU6Vqf1wW+uF7Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NhAsmVL+iyfPpY7ZNW+HpMl9LCYGYXta1q0xL/2Ilkp80vICe2J28G0Q7dseVIQRcvHSdVf1eFfG3nvZBx4fVdzCWdsOHZSb1/gMVYRB66oV4o6aidJLW4mu1yEjUQzDYBnz9AFzc+8F+qGIokpLyiEbBmbYXFb0+bdvrnYQSIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YPbWS4gB; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YPbWS4gB"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-493c55d5c7aso6204335e9.1
        for <linux-staging@lists.linux.dev>; Wed, 08 Jul 2026 05:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783513180; x=1784117980; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PnyoeRq1HNa5JgGoZrDoKZkQE8r24q3giYl5JEHLegs=;
        b=YPbWS4gBrDM+AIVyqHov/f5f5ynSjcetgs9Hlf6WObvFu0tt5WebcaBo7ppBGtMxL7
         f0gZG1FERBZUyJllf9WHkZxp8UE86NZMCuISHxRP/r98UY2dcF4T2OGjTzfcLm28+UuB
         cbsWstso7Mbe3STQOHtyIByiYOcPW5neM6MRIMQjJ7vwtTEjHqxCzCfUY/w/+6WPPdBC
         82WqzLE/JB23K3AHU9eeNNIs2xVEbmSjehX7GtYUc4F/RTMCbWjk66n1fG2dqyw434Vt
         2Tb81xg9fsCTLdg7OAxigCAJAmRzdwxMkidr5RxKJc8xRcS7t4rj9kdiAhuRJupRVX/H
         EiaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783513180; x=1784117980;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PnyoeRq1HNa5JgGoZrDoKZkQE8r24q3giYl5JEHLegs=;
        b=mJie8k7kJkZy2RTiv4bMI5Bv6EfNHMW6z6gZS1oV7j5x0Eqsncr3uram7z3gf/0HHk
         On9PlsNqkjD0l6qvhsJVoZ+heyTjzrLpzcyTttK1cxHNuO8tACw+o18eHiVBA3ddXyte
         V6XgNRIP/hNET3VUHQh+2c4Zx4xxopiWLA9/3qkB1Kv02c9lk3wdVQtzjBMsYALgy/PH
         /26gyakWSrmWN9epTMWgCD4UpnVS+ORXmg9v3PFDMNPiqsIavkXJ7AT6s3G3q17cyhy3
         NYehUbD7aB4nM15XT+H12fRzy2BmFg4fNsHraO6Pl9fGO65BswdMLwV01XevX8ArzAuF
         ob7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rp0ovmRppBmkd62gqMo4pOMECOJjsu/zpwrCowCJkCcGkGOGiHckFygKymNvEyE++3d9+Yrvybzmuao7vAY@lists.linux.dev
X-Gm-Message-State: AOJu0YxCFQbfwjhC5+0/BhX5LSt2Az0tmXzF9lt8C6xbsbLLCo7cnbsp
	ecctaniAyboFyrdh8l68E3qZK8qpv0OLv47bZCi6JjHR6ojRsAUsKHjJ
X-Gm-Gg: AfdE7cm2IH0t9VVvmxUkpP6fEr95tz2X8CYfMhU6avyLpOs1TehchkeLwGZikHxgZsW
	BSlBMSumg9IQ1n5dgQo2zx5Ijp16qgTzwbC4gk7W65xSVy6EfmgDFQi8HVdkYYiWXMKJbF6iouM
	A5/QiHjAMm16lla70qQmD/64JJ65QzVAoUjQ6vlAPu2b9TJA1S4yxWScJCQ6yKuDNFRS1sTQkZs
	/3JJpCh7ud2B9QDIzxbhFxNnlcUJbKcKdE6UJRQYLA6fEdFiOGh540OjDtzjTboGNjrZWHzk73u
	G60UI+7tCsQm/xP08qttgAwiQNvHyTKTlUF6LAdvLd6I1OO+mL7e0aEr0j3bxpcg4tGwrNGwcDe
	rG7GE2NrGcW0Mibhmwd0eRlNSEjJSlOgkT8YNPJIhwUNQWZ/wr9S/fi0uyav8CFK9UzThnb6JDV
	Lq0PdtgSmUbluuGqHa+3J6Ro0XAFRi+Hx+OYvpJAJF/+LQ1a4/K0uDw2Ba6AGypgK9o2Fg1tBYB
	YRFqw==
X-Received: by 2002:a05:600c:c1c8:10b0:493:c3c9:218c with SMTP id 5b1f17b1804b1-493e68cebf6mr18678105e9.30.1783513180476;
        Wed, 08 Jul 2026 05:19:40 -0700 (PDT)
Received: from koolguy.fritz.box (dslb-088-074-245-227.088.074.pools.vodafone-ip.de. [88.74.245.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e0f50418sm122571205e9.11.2026.07.08.05.19.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 05:19:40 -0700 (PDT)
From: fliegbert2@gmail.com
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
Subject: [PATCH v2 2/6] staging: rtl8723bs: Replace spaces for tab
Date: Wed,  8 Jul 2026 12:15:59 +0000
Message-ID: <20260708121603.2393-3-fliegbert2@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260708121603.2393-1-fliegbert2@gmail.com>
References: <cover.1780343502.git.fliegbert2@gmail.com>
 <20260708121603.2393-1-fliegbert2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>

Resolving checkpatch warning by removing spaces and using tab instead.

Signed-off-by: Dalvin-Ehinoma Noah Aiguobas <fliegbert2@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mlme.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme.h b/drivers/staging/rtl8723bs/include/rtw_mlme.h
index 180891e49971..b42fb1fc7658 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme.h
@@ -13,8 +13,8 @@
 /* define   MAX_JOIN_TIMEOUT	2500 */
 #define   MAX_JOIN_TIMEOUT	6500
 
-/* Commented by Albert 20101105 */
-/* Increase the scanning timeout because of increasing the SURVEY_TO value. */
+/*	Commented by Albert 20101105 */
+/*	Increase the scanning timeout because of increasing the SURVEY_TO value. */
 
 #define		SCANNING_TIMEOUT	8000
 
-- 
2.54.0

