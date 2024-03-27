Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3970A21A06
	for <linux-staging@lists.linux.dev>; Wed, 27 Mar 2024 06:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711521122; cv=none; b=jolHFXfDE6YNsvZ8ShQsClr7Igd2BmbWi5ipTd9OySfmYsWWV/kmSeI4EwV+7ghghTDRLi6EEepakF5eMh3Og3v3FShWxOJ+7CEivmnVZyoy7hZiM9XsfWShhY5hcoLSC9ME1R+X+TzV++M9PXF13Dh/34MVhs661Fk2fUD5jxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711521122; c=relaxed/simple;
	bh=KB5Kw8+VJDCNS6VTOkfW1rXx9Npz7y6cpQv6s8onYfE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ZVyvty8C0y0vSa6/3syGg7KDp69Vqvlp7rqOuCFk0R8fw0i4+OUgqEqOjdKIxqRXIomF3G0ThRRlx3Dwy/h+00jPwtHagcACM1Rj5yh5i0H1PBEkwkdICY11DmNWKdJqOLrxuEEVdrf/a+mgo2rsU4wioXNU/bUji1MdtOCSJWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NYV7VsFg; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NYV7VsFg"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-2d228a132acso85646821fa.0
        for <linux-staging@lists.linux.dev>; Tue, 26 Mar 2024 23:32:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711521119; x=1712125919; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3T42PDe6POVUiD2RNtF/xYGMNPYox2/xgraOY1XEF7o=;
        b=NYV7VsFg1t0MXjVv9D5oPJNLgCZHqV9CHm1viSdmoT4cJzhyJsiGtMKA1kGgmsvkhO
         bcc/l14BAt1Gszk3JIpuB5WrmObINTWBxPYVhTPW21rSghQhkGzvdlkV6ehWAjr3YDwk
         yF0t2UvV7BNeV+vYkq/lIRY0PwJXUrVnuD4Q72n87EjKGgSyuu+Ug8W1GpHorRQf3hCQ
         O4Pc6bWdRIVbiacIt5tO0SpKxFHUA9ZZ/fOCqMwvurLdlx6NxqfKSSIMKhru5o0dMrVy
         ueXm7oEY8xKEuXSgVLQ7YJN4Pq855in2C2MJjDciYYmCxoRDLxQaWFfV2jwl04WRkxIY
         oLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711521119; x=1712125919;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3T42PDe6POVUiD2RNtF/xYGMNPYox2/xgraOY1XEF7o=;
        b=rYsHRuU6kqMAuDDodIWjQx7yYM+jWua5b7qtcIaCzS32XHEOhWbV17vWvASF1bARiv
         qPDPv/hKfJA0z2p1ObIjy1caH7I+Qy3GLdgDmxlmwi1hXh4qtQAyxQ47hRjMSgyZLysa
         3J3DbRRvWRa79PeWqP02M5VsKGYXn98sYysA2+WNx66AvuXvp53ZpYgu6D9Nn4Yjh7xG
         rIUE+WsbX2jiJv2s0KG2QVIHJL5MUmRAC8x9jBIA+ZBBH+LlasH7dRjY+54ifDqATxh8
         8F/PeRBWYvqAALjL6laNySqeO+M0NmgepbAInmmcvbqmIKfHrgqcMDe9hkf61Uf42VIa
         tv3Q==
X-Gm-Message-State: AOJu0YzbwrGw9p+NLZXtkgk9LvuW2JdGt5azOVC91EQ/Vv79NJNVpXag
	Wxb2y3/0T85YNi2vodKx67isaqSc/jQhbnw3b3tL5+ixrglqPd7S9X9lnfDT
X-Google-Smtp-Source: AGHT+IGr3nZKGJe6ChxBKXfRHVU7yyiuKjO7popwkBfEPul66SPcOW8tWPzQYHx7bmDDWmovIsviKQ==
X-Received: by 2002:a2e:8455:0:b0:2d6:93c9:1f87 with SMTP id u21-20020a2e8455000000b002d693c91f87mr284404ljh.4.1711521119126;
        Tue, 26 Mar 2024 23:31:59 -0700 (PDT)
Received: from YOGA.local ([2a06:c701:736b:f200:f38a:32d3:e6f6:959])
        by smtp.gmail.com with ESMTPSA id u22-20020a05600c139600b004148d7b889asm1121360wmf.8.2024.03.26.23.31.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 23:31:58 -0700 (PDT)
From: Shahar Avidar <ikobh7@gmail.com>
To: gregkh@linuxfoundation.org,
	elder@linaro.org,
	andriy.shevchenko@linux.intel.com,
	robh@kernel.org,
	parthiban.veerasooran@microchip.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] staging: pi433: Fix includes, comments & macros.
Date: Wed, 27 Mar 2024 08:31:53 +0200
Message-Id: <20240327063156.96307-1-ikobh7@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset continues with some cleanups:

1. Untangle include hierarchy.
2. Delete a misleading comment.
3. Make use of general macro instead of magic number.

v2->v1:
Undo macro update. Remove its inaccurate comment instead.

Shahar Avidar (3):
  staging: pi433: Use headers in appropriate files.
  staging: pi433: Remove an inaccurate comment.
  staging: pi433: Make use of spi mode macro instead of magic number.

 drivers/staging/pi433/pi433_if.c | 5 +++--
 drivers/staging/pi433/rf69.c     | 1 +
 drivers/staging/pi433/rf69.h     | 1 -
 3 files changed, 4 insertions(+), 3 deletions(-)


base-commit: 26a73b4d30d29f572163f7399e39d56677607b55
-- 
2.34.1

