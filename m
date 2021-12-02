Received: from mta-p6.oit.umn.edu (mta-p6.oit.umn.edu [134.84.196.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB8D2C82
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 16:13:11 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
	by mta-p6.oit.umn.edu (Postfix) with ESMTP id 4J4gkt1Smnz9w6Rh
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 16:04:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p6.oit.umn.edu ([127.0.0.1])
	by localhost (mta-p6.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8Ys84av2jxS for <linux-staging@lists.linux.dev>;
	Thu,  2 Dec 2021 10:04:38 -0600 (CST)
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mta-p6.oit.umn.edu (Postfix) with ESMTPS id 4J4gks6WHbz9w6Rr
	for <linux-staging@lists.linux.dev>; Thu,  2 Dec 2021 10:04:37 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p6.oit.umn.edu 4J4gks6WHbz9w6Rr
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p6.oit.umn.edu 4J4gks6WHbz9w6Rr
Received: by mail-pf1-f199.google.com with SMTP id c6-20020aa781c6000000b004a4fcdf1d6dso17683053pfn.4
        for <linux-staging@lists.linux.dev>; Thu, 02 Dec 2021 08:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
        b=L7C0+RHzWtzjba9VBc3MozgNXqhPdafl2LWHWHVzAggMUfoWrZALHvx2I8tzb0mZJD
         uH27GBysDh6p8PYn+9IbSvpazYZDH5AnsPUyf5xseBrxm9ERd/u65z+8bOekTU8dXr35
         JVg25OtUunTatma0lA9H+Xz93wlAOGSbUduvHPMHz81iMY9vlsYWZpSPxd6CHG0tZwu3
         D6iAWEhHB2C0HOC5Iflfa6sPTLscRTvsfwSfjXaWH3EzHspoFClknTsEXh0yU/ppbJ+V
         dXo1B0bKaNRS5+Wj/fNKp6HPZJ4+RcKEEs4vmzmouvuVv/EMH8fzet07v9ElecC6ZQF8
         ObVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tSFdJHmjZmGwK0hgeK/BuhdxfmOuNZpb1fLDoMSMoIA=;
        b=m07tBjG9SD9L/tF7rlWizecGn0qreQdLXK+eJwiSOMIKY0TLzlUcmj/Rof2D8M3A+K
         Hc4fC4b3y82f9h0dB0Vq73ihnf1JUr1Dm+gVQHsCoBzHnFR1EvKBKKkERpjAflDdT6ND
         bj4BfHcUVaG5MFMiNQVDol0CxP+t2qoF6a5QmGJtJfBHGsPOKL0rM9wNDLHvfoB4raxu
         kQLM1o2laZzEbjWpw7Y6xYfanKgQ521PBzaH39DlJHKv5m7hqE+Rz3NfoUkelbQamSw/
         KoYU2l0S4rzmy38ldxdLiqOwRtteNiGy5M6+0Z/vcLsmBb5WdePSxaPAFVyt8E0mVI9m
         Hjpg==
X-Gm-Message-State: AOAM531dSS40C0qDy6KVg9LpDhX3ziqvuzDapHlYhrIiRg3vECr1Ua7z
	Lko+nf8jPlVhi8sYeCNwB2wqLMCtd76BFPJ89B3yyLEi42YYzEOZtZwr3/1TYqIyMeRmwYVf5eI
	yWyAX3lfX4qXO85z/bP5/fOXnZqUNpg==
X-Received: by 2002:a63:1754:: with SMTP id 20mr24009pgx.559.1638461077038;
        Thu, 02 Dec 2021 08:04:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzWtFMeKAwpw/3fOXWwvMLF/51H2uFNuH5A00e7CrM7Jjwcdxc5Efn+9134CUiC/P7QgYHbNw==
X-Received: by 2002:a63:1754:: with SMTP id 20mr23947pgx.559.1638461076514;
        Thu, 02 Dec 2021 08:04:36 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.93.212])
        by smtp.gmail.com with ESMTPSA id a22sm236765pfh.111.2021.12.02.08.04.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 08:04:36 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu,
	Neil Armstrong <narmstrong@baylibre.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org,
	linux-amlogic@lists.infradead.org,
	linux-staging@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: meson: vdec: Fix a NULL pointer dereference in amvdec_add_ts()
Date: Fri,  3 Dec 2021 00:03:57 +0800
Message-Id: <20211202160357.75173-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201084108.GE9522@kadam>
References: <20211201084108.GE9522@kadam>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In amvdec_add_ts(), there is a dereference of kzalloc(), which could lead
to a NULL pointer dereference on failure of kzalloc().

I fix this bug by adding a NULL check of new_ts.

This bug was found by a static analyzer. The analysis employs
differential checking to identify inconsistent security operations
(e.g., checks or kfrees) between two code paths and confirms that the
inconsistent operations are not recovered in the current function or
the callers, so they constitute bugs.

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

Builds with CONFIG_VIDEO_MESON_VDEC=m show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 876f123b8956 ("media: meson: vdec: bring up to compliance")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
Changes in v2:
  -  Delete dev_err() message

 drivers/staging/media/meson/vdec/vdec_helpers.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/staging/media/meson/vdec/vdec_helpers.c b/drivers/staging/media/meson/vdec/vdec_helpers.c
index b9125c295d1d..ac60514c475b 100644
--- a/drivers/staging/media/meson/vdec/vdec_helpers.c
+++ b/drivers/staging/media/meson/vdec/vdec_helpers.c
@@ -234,6 +234,9 @@ void amvdec_add_ts(struct amvdec_session *sess, u64 ts,
 	unsigned long flags;
 
 	new_ts = kzalloc(sizeof(*new_ts), GFP_KERNEL);
+	if (!new_ts)
+		return;
+
 	new_ts->ts = ts;
 	new_ts->tc = tc;
 	new_ts->offset = offset;
-- 
2.25.1

