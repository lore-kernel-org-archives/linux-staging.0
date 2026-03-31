Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com [209.85.214.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD3F3BF680
	for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 07:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774941918; cv=none; b=CqaP5pyRCMTDhCe7F8SMQjKOwO4/RfgjbaIKXuz7+a/klewbVRjPqljBcahP82d441zcQZ0reJ0v3fRFqbHKhLnZ1gV6LVbJeq1hTw1FLwYHKcz3qJnAG30t0HlJ/LJQZ9zKpBvE2Oy6uwgKPWSAvjFLSnbrYl6hSsn0v//woOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774941918; c=relaxed/simple;
	bh=jpBKCvDwEnaAHQaDSndjz8ggTnXKApeWpvM7bXUvWIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aGLdX6S37PIAf2aPL0Z7yh6Y0e8vUCXPgtnf+XdleXcWDCeSpSMntAX/zajPTusUMg8LghK4AQ29Yfikwi3S+WF0c+nwD91idtQjoCRfqv3y08Qo2xGVHBOFJhtNOioaO9pico8tk+QCzWXid6AqJP7+Y9+2YYxjO5c4ZGUQFEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GVXpIpxs; arc=none smtp.client-ip=209.85.214.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GVXpIpxs"
Received: by mail-pl1-f194.google.com with SMTP id d9443c01a7336-2b0c8362d93so30910085ad.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 00:25:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774941917; x=1775546717; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kDomBRu/WaObDoJzQS7Tba3JfdUuYrLrhSQ1OKlEw28=;
        b=GVXpIpxsLt9kTpber8juOWoqC9YUAnLyvZQa0QkTm3056orv/yzfpFoQ27Pva4WRbP
         4G0JkE7nmzGTJWydgNfeYsPiKbzBKpAGGc0nQXF0ApTZsf1eG+41CgktcOoczW3pcgnp
         f+gOcazOeu9thnC7YKBzRgbYNuBNIDRj9vuhg+Woitb7dKJHzpQ4WJOiKUl5U1bYI89p
         n4zpSe2sHK7hKDQ1qSlm5LQ4hFzykhYOpw9qs+oO0SirTnZGB46nhcjevmZSuz701nIg
         bPR0CRLNlwbQ2d7G2A/Vgv1NA1RpSsE/4N8TYViHc8bzCbdYabIwlCrackeCwBpNlRny
         /J/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774941917; x=1775546717;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kDomBRu/WaObDoJzQS7Tba3JfdUuYrLrhSQ1OKlEw28=;
        b=L4NwJecScbVNeHWC+/bDLdCcz15qOfpazbu5A8uwwxVuKKXGC57EWIYrnq+UN9E0aa
         J1MzenJf/qT/OaJyM1kXfhNqP1FHvya8T7HL5cx2jfOBLYsl+OMDmWpZVwq/UcD4Lkll
         K2QU9sMwy6ANtS3SldynV2GbYlveK5ZSWQwTWvGGYqeWvQs8qc5lEv/o5mZ5RxAHjnh7
         2t3tnp++7zJyzKZxbGr6X5u9G1G5aDv4gTJpv238U9XYhtYrQUy0eurEJKIhjA9ntRu2
         26wVvmnMYfCeBx9Vk1k6RiHji28SVANKkltCAWkEb2vBe+sGliux2uZQg7BzjHjcgj9+
         lKPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpjzMC3lgfB/pu9mrfmPUpDCg/fWTXLQkhWZuFd1UWkT+mYhEKnrIGufMB6r6tNMEucaf6jPBETAgB63oJ@lists.linux.dev
X-Gm-Message-State: AOJu0YzIyxyKqzlmaE9XYi7zFVAXs9dkOSJ+4PyZxUO7AkOfDl3c6rXk
	TpUmEjubTCohP5Xebr3Hq0gie46eBXQr9cftOlQ/jx00jG1QzFj8PZQ5
X-Gm-Gg: ATEYQzy+mH3RUzjEgesZ6cIFW6Eupr/AGIDjmIEhSkVQAq84zdxdJhJHqji+SbV44X1
	rk1uARaJBcArq2TEzohpCwU9uB5C87M+Rsh5svIuDzn3BLZChknoS+cLt4KmZIGCz+bdoIOa7si
	Ub5O7HhTIlg4SRDcOc9oZ2wWYDWZMiloccMdBCMNLmVFLkiquPtlXymyARP+CRp5NCEI/DdnBZx
	U5IdDYT8yZm0mZ+A2+L4TTY+dMwZB+m+68Tzq5w9pLDOz/ax2YOd1EZ+jG13zROprQB91D7sGqq
	KRRfO75R45H1MQUh+T4xbdEcrW12RrFPR6mkcO7wwh/jDrLP7qqlvILDSsGB7gl9IFRrNd3wBiP
	XU58wE446B5LM9ZEPQDppsVcqHsbGlYFeoDZiKHAPg3GTStJIt1hSh57FU5zNENDuRUNeGLJf+8
	dYac1W9LK6ML4K8pcTrNoHbQRsqj5IOuwOU7ccnx8=
X-Received: by 2002:a17:902:f650:b0:2b0:65e8:4041 with SMTP id d9443c01a7336-2b0cdcb73e2mr156323595ad.36.1774941916962;
        Tue, 31 Mar 2026 00:25:16 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:5412:6527:d590:8704:ff8:2ffd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b242642956sm109272495ad.6.2026.03.31.00.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 00:25:16 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v4 0/4] staging: iio: adc: ad7816: code cleanups and modernization
Date: Tue, 31 Mar 2026 13:24:49 +0600
Message-Id: <20260331072453.6530-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses feedback from Andy Shevchenko to modernize and clean
up the ad7816 driver.

Changes in v4:
- Added a blank line after the AD7816_FULL and AD7816_PD definitions to
  improve code readability, as requested by Andy Shevchenko.

Changes in v3:
- Added missing Signed-off-by tags and detailed patch descriptions to
  all commits as requested by the automated patch-bot.
- No functional changes since v2.

Changes in v2:
- Renamed sysfs callback functions (e.g., ad7816_show_mode to mode_show)
  to satisfy the requirements of modern IIO attribute macros.
- Fixed usage of sysfs_match_string() by removing the unnecessary 
  ARRAY_SIZE parameter.
- Fixed vertical alignment of function parameters to match open parenthesis.
- Replaced sprintf() with sysfs_emit() across all show attributes.

Md. Mahmudul Hasan Mabud (4):
  staging: iio: adc: ad7816: redefine mode constants to start from 0
  staging: iio: adc: ad7816: use sysfs_match_string() for mode selection
  staging: iio: adc: ad7816: replace sprintf() with sysfs_emit()
  staging: iio: adc: ad7816: use modern IIO attribute macros

 drivers/staging/iio/adc/ad7816.c | 112 +++++++++++++++----------------
 1 file changed, 54 insertions(+), 58 deletions(-)

-- 
2.34.1

