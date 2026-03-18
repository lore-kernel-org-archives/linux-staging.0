Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016993128D9
	for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 21:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773870717; cv=none; b=ibMXmMkpNWjS8EzyaYtxOPXAzz5/PPQGfdeRselXIR9CvOinJqa+D902lW2PvdFrnkYd9RvP6FonaSjrHNC3ZBlTc1wFRhfK1QpJijWfqkTt8nJe2MP84ZJIj+KcMI9xg1QZxchVWyKF3VhtoSpBYiV3TPKnI0nxadx+vvNsjH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773870717; c=relaxed/simple;
	bh=aTx8lEVGp4oygDkEhu7cIXTq1eM0N8aDflwgRSlqwoI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iaLfjVkK/5lJpKh1jLeOja+3K0KP7jy9vsKqm9MsxU+jI+n/6+CkzIt3vtSgwicJ/3EtaF2woH9yXDyRJkYkjjSycrt78rzmHXF1vOffaZgyssCMVnb7gWPf93gDZ1pkCau3VPbrZNyq/+/KEPrLp/dym56cOpUW40VhQZaGgcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cuGt5jDP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cuGt5jDP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35b88a4f123so113231a91.1
        for <linux-staging@lists.linux.dev>; Wed, 18 Mar 2026 14:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773870715; x=1774475515; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+hGxR/86l0DY5BWJ3x/I2frNWMr4WQwDJvpvsRDZ+/I=;
        b=cuGt5jDPR/MgXDZG890TKdd2RQGkB/uzhY5IBvXFNd6OsMUHfvYit/P5BInc70d7IA
         WfQFeJcx14ItKceLbRvMQASDAWgOviitOShJxTF2m11xAqhl4TvJNfEB7+FzUmvYdiPD
         z/CzdGg6/rQGf96sFV7zTAIaa9l8Eaa15T8iQzHjDUcSzj9YVyofUWF7j7mAS+5LJGoI
         jO2/didsvcbb7jt0N/d13ckSF9sdWuAmHp2Outchv7Rhv+xeddKgI7RHsF9art2vi1GR
         vpJr4CdjRy/o0Pyp4yOxPZ0E48RdJRa99KYtSMlJTzK57MF0A0D0gLNywamhw/teOqY6
         ReZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773870715; x=1774475515;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+hGxR/86l0DY5BWJ3x/I2frNWMr4WQwDJvpvsRDZ+/I=;
        b=h5CUlX4QkMe//WZ58b4qy+dE49vZF9kpJVM5nlG+LS12QFJMSHLTD5maXS8w835wZm
         g05/jJaZOwSiHZGWxVrlHFTjOnEK2b5PectcQn4uaIQVhEm5lmYDXAux492/9FVLT9y+
         4IZESVzYA+JnlExH/8c6WP1YIfTHHNy5WnOgFCQ2WjrSrshKdOtClxTi/DYd6B/XCwm/
         iVsx5weBey4630URLlw+H8qI8+SHB1fv3k6Nr0QXc37gM290jVWbYvJ4mkdyHf3dSl9L
         JHKuABPg2yRjMScEwnwCKSy4MqiMhKY6qYcFO9iOG+iWr64xzg0iY2WZpaHdXuNhvQxK
         JHqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWC7bAa99pd+lLni4Knm4rGlryVnPlMgZ/SV5CT4h8yvWMMVyBmdrEfSRAiNdnwRkMTbITjUZdYe8JMTv/p@lists.linux.dev
X-Gm-Message-State: AOJu0Yx4wCjGuyYa/NFyGMD/dnvcpq+1yaR4KJVd4F8z+lTn3S944Wkr
	DJYukecZPG7X5AZipWB9n3LetAljptO28+1tLnKxl/vxsvRYYlyp4Qp7
X-Gm-Gg: ATEYQzx+s/3uA4mX3eOUeCS+A8E7O0JZuIeEDDWWPaoIV4mGxB9NasoHBoxocvxh7ew
	5Zb7308fot/Dd37Dt1Cxvf28Kf8wtQsZbOMgejn3rH3NwKgJO0AB0fk2o4KgA5FZwwtgeiL5dsF
	BQrnpowYtpRPJx9FkNx7QPncCbTuEW6Bs10E2YI+xyyworl5WEqRWRK9E9KZGnk4RKtmnsAMrjF
	uX+Pf4+gyCylLdSNW+KjNn7QM1nNHnxjJ0YyxqwDOxToBjTUgKA9P5eu03Tt02vjg76tuKeWgJK
	x1JYdccWKaHtIIrbVCPDD8HzKCUNZ8IeQLnwINB3bss1Ce0lpZMvqnJqBfAYzoILO86/rDQQn8P
	lLwzPXCeZgMmZ01R+0bzWkt34SQP6ITlXm3qBkNAOUV16bYk/l956YBQkEqek75g6lTmEz8vHYM
	YmNOcfsN+xszKM0ojfh1jxnoTGfrTEVUGBkxvTJcAj7v+EGbjyhsS3IG4Bh4OviakSvGW9Q/tF2
	+7PdwgcZOwZ5GOCSwRGhXY1tdncU+Lv6pKr3pwwIDev8YBz
X-Received: by 2002:a17:90b:3e4f:b0:35a:2ed:9b6f with SMTP id 98e67ed59e1d1-35bc5e90958mr878392a91.0.1773870715189;
        Wed, 18 Mar 2026 14:51:55 -0700 (PDT)
Received: from starpt-K55VD.. (2001-b011-7803-1df1-b14e-6890-de2e-81d0.dynamic-ip6.hinet.net. [2001:b011:7803:1df1:b14e:6890:de2e:81d0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b06e5ef58asm36511925ad.47.2026.03.18.14.51.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Mar 2026 14:51:54 -0700 (PDT)
From: Lin YuChen <starpt.official@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	straube.linux@gmail.com,
	starpt.official@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8723bs: refactor rtw_aes_decrypt()
Date: Thu, 19 Mar 2026 05:51:22 +0800
Message-Id: <20260318215124.22612-1-starpt.official@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026031810-kitty-untamed-2812@gregkh>
References: <2026031810-kitty-untamed-2812@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors rtw_aes_decrypt() to reduce nesting levels by
using guard clauses. As requested by Greg, the refactoring is split
into two steps to make the logic changes easier to verify.

Patch 1: Introduce guard clause for AES encryption check.
Patch 2: Introduce guard clause for stainfo check.

Lin YuChen (2):
  staging: rtl8723bs: use guard clause for AES check
  staging: rtl8723bs: use guard clause for stainfo check

 drivers/staging/rtl8723bs/core/rtw_security.c | 91 +++++++++----------
 1 file changed, 45 insertions(+), 46 deletions(-)

-- 
2.34.1

