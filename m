Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8C9379DF
	for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 11:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716722447; cv=none; b=IApulWemTWDvjG9Xhlh5r3zJZuOyyl+ZZ9/DM+LVgZmzdW2AqIMdoyjtsowphpltLNYxyhu+bbsrPBMtFL+aX1Le3nmBD8Sxi5kh/JSCkFEA7dux6LzTMdMimpVNmh6I+MFXn0wTeJH/eOZL5npCwIdWPpZS5UWsNkUBL6W1hyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716722447; c=relaxed/simple;
	bh=+QyzVB+hF/W0F7duXYUqSZVzerWLK56Lq1XaLySrJfU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=T8shqQohBu8PY6Vn58hBm8FAIIDK1jjvxbfuNWeEDsOOTlnLgeuQoGyvS2YHX0dHp0g6RLYk//4dQXXgnXWB8Quwt9z+HC3smBQLvu5Cm6AJsnedaUlM0M+65cku2r/G/Ibc17N4PABGF5TAB68A1UEqbnbOISpJl1E+4/vgWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4fsK6E9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4fsK6E9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a59a609dd3fso801486266b.0
        for <linux-staging@lists.linux.dev>; Sun, 26 May 2024 04:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716722443; x=1717327243; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kOnZ78TgB4Zxh2HcKouq8wUbppxd3i0KcEghV6k4HzI=;
        b=j4fsK6E9oplZYaKpWMKvCsUb545bTABgqjLPXw1NSOew0b++KrZuuoqL+SuuwCLBEB
         cawCe9JpRI5L6OuV5++KpzL9JsYK6ld1oDVCEBuC8w+o0aZHUjPi5P+jfpdksR3Uelpg
         RgQosEYQ17sg3WP4PjrOyJjyo1YHGbsNe03Uxe1Xi+eKkodaU7SPKOAHzEEx2SGrHv5t
         I3e69Vq6KOCF7waSOnfylUQ0h9KwfUa4YIQxqj4jYwB4gpqkkZ1L2xFfCzCpCs1CPJQO
         epV/gpV53zCbKfcT+cxkWvitcPPLmkcF9I1TC95tX8+BOKtVDaA/svqiuZPyu0TxSgoy
         csfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716722443; x=1717327243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kOnZ78TgB4Zxh2HcKouq8wUbppxd3i0KcEghV6k4HzI=;
        b=MugRNZrOqM/JXEODw8FEKCBi6t967EwAXPkfdaj8R5wy3S9lInllqQiXvWmctyvUWl
         sAfWabEe/+hJtf/DRwSkuosD72Ht5hjFRSIpYAPOE6TyVqy/xLVdqXyirW8uqtLT+Jom
         geJlz8z1lEUR/MEvpxY8wgxPc2AU5UvOGOSv2gc4nKYuGAIRJTWfv8ZHKFQ6+FTSW08C
         xZLFyKSlhWZd9/Zyc8L8j56ucQIK2HAQMoyM5x6dvqSJbt1mDOvO4yhk4NRqT+v9BtCg
         QQV1EgrHuhZxk1tlqON+6x+pERpInzq8p5JN8Rzb34dNglcvuFFdvA1vQmnvcWm1M89r
         WDfg==
X-Forwarded-Encrypted: i=1; AJvYcCXpCLaet45DHYbzsFKrJdBXS2z7agZUsuGckwgc8ipbk0utk9juGgc7yspG+zzB8pJhS5bj3/n6QRR2N24q5MKiLFPyFw+S2BL01BPHIQ==
X-Gm-Message-State: AOJu0Yw/6BuJS3l46BUW3Y9TBAOGde5u07jW141YArzMDA21zB+IrgZA
	kEKRTfx4Iy6dKpSj3bYXAvE/qOXXS/NQYAyiacYFW0zqPdD0R5PH
X-Google-Smtp-Source: AGHT+IH+8lftp06Xp7fZ3kAF6+csz1iu2s5FwfpZw54pP2vg0ijtiylT487UVwvIvD3zFKQKlZfsxg==
X-Received: by 2002:a17:906:f0c3:b0:a59:9ed5:eefc with SMTP id a640c23a62f3a-a6262b14494mr583538466b.32.1716722443159;
        Sun, 26 May 2024 04:20:43 -0700 (PDT)
Received: from localhost.localdomain (ip-77-25-34-87.web.vodafone.de. [77.25.34.87])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a626cc8e534sm373983366b.170.2024.05.26.04.20.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 04:20:42 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/3] staging: rtl8192e: some refactoring
Date: Sun, 26 May 2024 13:19:25 +0200
Message-ID: <20240526111928.14574-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.45.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series refactors two for loops in _rtl92e_dm_rx_path_sel_byrssi()
to reduce indentation and improve readability.

Compile-tested only, due to lack of hardware.

Michael Straube (3):
  staging: rtl8192e: reduce indentation level
  staging: rtl8192e: remove unnecessary line breaks
  staging: rtl8192e: remove dead code

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 154 ++++++++++-----------
 1 file changed, 71 insertions(+), 83 deletions(-)

-- 
2.45.1

