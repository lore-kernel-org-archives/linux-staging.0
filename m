Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5F62218AB0
	for <linux-staging@lists.linux.dev>; Sat, 26 Jul 2025 04:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753504437; cv=none; b=Sywc6PfNO4GKKwek/ti6k7iQmhoV/joSzwkXJBMvvC7IdvH9h/gZIqybSAw/QpaRDfikJ98Py+4MWTnCyYwxqLe1LZgvuP0bakU4q5NNc98sZaZNTFd+icrRW3/RKo2wodS3o5IHH8K4xvj4Be3zmLlvgwxTIwi3FQNN6b+YbnQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753504437; c=relaxed/simple;
	bh=WvWtSSG1WQ0XnFbhnhRWLKw4dnXHRNMYRUC6Kw9zqM4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=kZJYszzZGdsJJSHvj99JONWh90vU8Jwv/buUJscqedQtaSc157GKzw/sq1CJmr9MetJMQRrGQYEruuPX0zFLg1Q3Rb1WeXLVj1EbQul02eGiDi4Y3e5q8o4t3KOu2NZGp5Zk6bt6t4x9WLxtNO8VYylPlx0V2vUue9rdHe3nMFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dQQ/evc4; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dQQ/evc4"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7e1f3b95449so394335185a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Jul 2025 21:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753504434; x=1754109234; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gC45lvNfo/ER/85bNnioTazhn/jQr+yHb1t5QvafK14=;
        b=dQQ/evc4Ycbcw8C0NPdBULClgZM9qfIlUWWMm4m6RLW85DroUYNirzGvt0vgFUHALz
         yksIfNxezfTsCHmKKYPoFK3q9fz1E9pdVxn9CZSp8uDY+MJxNufp4y/6KD/wttefxjPm
         6Kj4zSYYgMNBTB82fWZZv0GQi8h3AuY2RvlaRmno01qj82HFyqYVFyFhJMUfPvyAb/Ai
         pIvIJsaBfaLoC2aogXYf9r7O8WZDaAREU1BYkbvFn52bJTEpPBluHRDzrZuP2Ik4GysU
         fmHBHp0XrdogU+/cJyNOjsBoy+oMQDvRZDESjrjpG2JBHP4HKl1Q3ggtLjUDQRhnqnTC
         L3kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753504434; x=1754109234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gC45lvNfo/ER/85bNnioTazhn/jQr+yHb1t5QvafK14=;
        b=FrIX/9vo9qMtxErtYwojB2oB80BwN1NrMTFjZSsBKod9hDlVcSG8G6ZfYbNTqhKjJ7
         mWRlQ37HcGYw+dFdgxt7rX0aRRahaaPLKT/Zj+INsMF4YTHticSgxYFOdolH569y460J
         dFI/vSanBMAM+iNeapPlBuswyWL/0D5yw61RR+1TFSB9FbKRuwFPgrhbBNG6AgTqldQQ
         X1K7WfkRiKrh2gJb5JuygiMBa9GFdslsjBfFLbzKO3L1cd0qp9qGmVQ6SpIig1ZennnQ
         VQMjlG1vYPlyUAwRQzy3kVyu4mdUze6J0W46gwyd51ultGXms3rD+J6WpB070lToZIer
         umUA==
X-Gm-Message-State: AOJu0YwgPKCtAH96X1k9Ajpz9ixWnlFH2WiZFKH+cbQ/lJN2EL2/9v+z
	CV45vYQ3oYVOzzybqdUFsQasJkVcW/TdPHOkYOE453CghZvXI/yC9wj/
X-Gm-Gg: ASbGncvm+YZNUy+KTbK4ZbSV/1VcRTQAyWvV9wCrRWW5I1kqzEn6IDuftqP1CJY89T6
	n252/twMlf45GSYED5e7PyrKCfOv0trvLqKSWrcert1sLbrk+pjF8ZMg6oQOEfMdScIF5hwhYYl
	eKdQ+ETryKKRudVdP31ofCfVfweKCdr0N2EXTnzUqy0lUYL6MnkmaJ5rPNaaOvi/jpJdp4iA/hx
	UNrRsb1O47uJMMrxDoky8MftJQ99DNyK51MW8fnG+8qaz0dj3dd0qt92Y1PLKFbf44v7s1KKbPS
	gAWKiSZKjhXIIK2XzS9vzYRETBHE5YgZCt7s/WrzDXBG2SobWP6dIZpy889DEV2UDG2Kg7dQDtM
	XCsvmk57gXptAuZQZ0+4l5mTK0O/2JYbVPxpcz03OqaAqhfNRYZk=
X-Google-Smtp-Source: AGHT+IHeiQLQMrg9lJ4rQcscOTGZVVaWggM4N+/ThoNuwNXhuqUMPhFd9JyXB0i08pGlDPbIypg4pw==
X-Received: by 2002:a05:620a:470d:b0:7d2:189a:5949 with SMTP id af79cd13be357-7e63badac12mr611023285a.28.1753504434208;
        Fri, 25 Jul 2025 21:33:54 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e6432a885asm70322185a.36.2025.07.25.21.33.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jul 2025 21:33:53 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	vivek.balachandhar@gmail.com
Subject: [PATCH 12/20] staging: rtl8723bs: fix excessive indentation in nested if statement
Date: Sat, 26 Jul 2025 04:32:10 +0000
Message-Id: <20250726043218.386738-13-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
References: <20250726043218.386738-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reduced indentation in a nested if-statement to match kernel coding
style and improve readability. No functional changes introduced.

Signed-off-by: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_mlme.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme.c b/drivers/staging/rtl8723bs/core/rtw_mlme.c
index 547734f5492e..0679253355fb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_mlme.c
+++ b/drivers/staging/rtl8723bs/core/rtw_mlme.c
@@ -1160,8 +1160,8 @@ void rtw_joinbss_event_prehandle(struct adapter *adapter, u8 *pbuf)
 
 					ptarget_wlan = rtw_find_network(&pmlmepriv->scanned_queue, pnetwork->network.mac_address);
 					if (check_fwstate(pmlmepriv, WIFI_STATION_STATE) == true) {
-						if (ptarget_wlan)
-							ptarget_wlan->fixed = true;
+					    if (ptarget_wlan)
+						ptarget_wlan->fixed = true;
 					}
 				}
 
-- 
2.39.5

