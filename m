Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35BEE6D36
	for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 18:12:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id h10so24797608edt.13
        for <linux-staging@lists.linux.dev>; Wed, 14 Apr 2021 11:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=e8cMsDT9er0yB1vAcvjl5ixcilD8+YkGrcYft26XCmo=;
        b=Dc2TJ4cZEHs6KJ9s7IOUBRa+KjVExnbDv1YoO7FzRj9z13fDkJV+xCLxVlVj5n6v5j
         GW2wnsJkg/I/FlLkrT+L3/IUlb5HE4qUCnnnlgfpvELIUdeeMkZZNTL4hIfjQ5AyJXXO
         0nh7D60iJ0cdMjTLbX6O3a5uyksmhyzwbKhawkON3NmVl/VtrdFGS8oJwKUlbmGR23rJ
         Q2D3aaHDnzF0nuh5n3RWyp9KbGA00hUwLb/W5ZpGUUphHQZO5f6HrDSXM2+27GZcZfPa
         /xqgppvcS7w28CB2Jb/b93+pgiuVgv3jgnY54w6uIGZCvm4te19r3gkXiuzsJsiXKsKz
         543Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=e8cMsDT9er0yB1vAcvjl5ixcilD8+YkGrcYft26XCmo=;
        b=PmtB48IpS+9zM+8mxpPHZzmIv75wIIqkO4p+Z3ZduXao+t5uzcmNogDTa6tzAoE7os
         4gTeZRtGA3/D4kB9Wbvb1ihGAjuCQc6epDutzM9egLlIxEe/PispHyMWTv7QRMN6k2P3
         /OZbNsBxPkgISgA+X2WdoJEdiBposNZhF8Ciyx8avcWA0JhTgWBbvbSja3mQ+Z+6UjLn
         4mFQcSn2iI1mSxp60x7OZth1hJt/aCvPvovdEyP0we6+yakJraXPaMaK1CocKu3p97j4
         mwOzqZBooXIeEG1OUEw694G0HTXdE7YrlmBKTxpO3agBjgGn++VVG+NkWJmzjPqv3eA7
         qEFA==
X-Gm-Message-State: AOAM530mlpBxC4bur0QXsdtYxOnZZIf3eSXThYNCmlHQ8dQStsuFh9ba
	VwI/MNN4BbVw4G1J6sV23qTTwA==
X-Google-Smtp-Source: ABdhPJy07wiGwp3wa0/ZBXYc7WlybCUgXXjfZ8f/v2CdjW/WEP/SDmpS96vAcpkD3zT1dlobX688sg==
X-Received: by 2002:a50:e702:: with SMTP id a2mr183896edn.3.1618423952806;
        Wed, 14 Apr 2021 11:12:32 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
        by smtp.gmail.com with ESMTPSA id v1sm279493eds.17.2021.04.14.11.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Apr 2021 11:12:32 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Cc: linux-kernel@vger.kernel.org,
	Ian Abbott <abbotti@mev.co.uk>,
	H Hartley Sweeten <hsweeten@visionengravers.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	"David A. Schleef" <ds@schleef.org>,
	Mori Hess <fmhess@users.sourceforge.net>,
	Truxton Fulton <trux@truxton.com>,
	linux-staging@lists.linux.dev,
	linux-pwm@vger.kernel.org
Subject: [PATCH 55/57] staging: comedi: drivers: ni_mio_common: Move 'range_ni_E_ao_ext' to where it is used
Date: Wed, 14 Apr 2021 19:11:27 +0100
Message-Id: <20210414181129.1628598-56-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210414181129.1628598-1-lee.jones@linaro.org>
References: <20210414181129.1628598-1-lee.jones@linaro.org>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

... and mark it as __maybe_unused since not all users of the
header file reference it.

Fixes the following W=1 kernel build warning(s):

 drivers/staging/comedi/drivers/ni_mio_common.c:163:35: warning: ‘range_ni_E_ao_ext’ defined but not used [-Wunused-const-variable=]

Cc: Ian Abbott <abbotti@mev.co.uk>
Cc: H Hartley Sweeten <hsweeten@visionengravers.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Lee Jones <lee.jones@linaro.org>
Cc: "David A. Schleef" <ds@schleef.org>
Cc: Mori Hess <fmhess@users.sourceforge.net>
Cc: Truxton Fulton <trux@truxton.com>
Cc: linux-staging@lists.linux.dev
Cc: linux-pwm@vger.kernel.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/staging/comedi/drivers/ni_mio_common.c | 9 ---------
 drivers/staging/comedi/drivers/ni_stc.h        | 9 ++++++++-
 2 files changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/comedi/drivers/ni_mio_common.c b/drivers/staging/comedi/drivers/ni_mio_common.c
index 4f80a4991f953..37615b4e2c10d 100644
--- a/drivers/staging/comedi/drivers/ni_mio_common.c
+++ b/drivers/staging/comedi/drivers/ni_mio_common.c
@@ -160,15 +160,6 @@ static const struct comedi_lrange range_ni_M_ai_628x = {
 	}
 };
 
-static const struct comedi_lrange range_ni_E_ao_ext = {
-	4, {
-		BIP_RANGE(10),
-		UNI_RANGE(10),
-		RANGE_ext(-1, 1),
-		RANGE_ext(0, 1)
-	}
-};
-
 static const struct comedi_lrange *const ni_range_lkup[] = {
 	[ai_gain_16] = &range_ni_E_ai,
 	[ai_gain_8] = &range_ni_E_ai_limited,
diff --git a/drivers/staging/comedi/drivers/ni_stc.h b/drivers/staging/comedi/drivers/ni_stc.h
index fbc0b753a0f59..0822e65f709dd 100644
--- a/drivers/staging/comedi/drivers/ni_stc.h
+++ b/drivers/staging/comedi/drivers/ni_stc.h
@@ -1137,6 +1137,13 @@ struct ni_private {
 	u8 rgout0_usage;
 };
 
-static const struct comedi_lrange range_ni_E_ao_ext;
+static const struct comedi_lrange __maybe_unused range_ni_E_ao_ext = {
+	4, {
+		BIP_RANGE(10),
+		UNI_RANGE(10),
+		RANGE_ext(-1, 1),
+		RANGE_ext(0, 1)
+	}
+};
 
 #endif /* _COMEDI_NI_STC_H */
-- 
2.27.0

