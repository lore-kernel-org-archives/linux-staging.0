Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B4357B;
	Sat, 11 Mar 2023 13:59:28 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id l1so7499587wry.12;
        Sat, 11 Mar 2023 05:59:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678543166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LJRQANhCEGiforjUF4Wz2oYn+hKUyKWCbODGuMeniSQ=;
        b=JIiZNE3piZTJCsdED37IIm8XMSp9EX72kmtzwU+J7mdYahgbVAMXowLQYViHJ7h9us
         98UEpwBDucgBmIApBqTPNHqtZm4vCsrtJQeGmKZUZ+v+aE2QpS0XMG+TEaXvZfPgrChj
         G888iVy92TQEqtYbGEZAv3suMTzOaLMl+YYCh4qSBOdMCfUkfmJbUAI53MFtCHTYHP7t
         9BgSpNHefw8483mdbzuReU2/fOupzw4AlnJxaNf5ZY/h3o6U3KgWUL5drplcszGqsCWU
         9yLw7G+Ew7BZn5C79OHCJsSB2ooeC8oynkEAqt2gMZluxQ2gVoB3obLIhjApQSQKrA//
         cZAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678543166;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LJRQANhCEGiforjUF4Wz2oYn+hKUyKWCbODGuMeniSQ=;
        b=zOmlF0hmbvgQhLEITSNWGZgSD4Ja1VXxHWDHXOtMFqJlfULwg/qyJf9O2TYZSrI43J
         XfwqIzXxc0bm/Z1HmDpof7YF5ssI1T1mzLOcHW09vO6HClogyWE1zuKLN/lpsN+GLmcb
         YN7ctbXigB0JZXVdtMPHOJHL7f7xEPaXvqo8I1IBZMLG7lpPAkXXiOyA1quZe0D1T65W
         qCvKbwM+yVuwTDjzVdFRYk85dVNRu3GJ/WykewLjdH2LjU7CAZLbaLmXsBnR4vePECrn
         lypvQ58DQrX4LkOrc18hLHV0HUX9xtXWnfel+9PjQ27xmWmqEW3Am4+FnBCOXiRshqy5
         eAfQ==
X-Gm-Message-State: AO0yUKWVu7MhINj1Y4XN/xqIdteKe7+WhPMtGdyhTsnzTp1cLi5Wp5Q8
	W9r7VD6nrRQUpdHCrA0C8FYClC/s9x/UFw==
X-Google-Smtp-Source: AK7set+flWmWv1HNs5ZSs/7+QBbG9EVcruCl00JPP/7DWKMEE8Tg5+ucOu2vofksMgs5muQs2jBs2g==
X-Received: by 2002:a5d:4b04:0:b0:2c5:3cfa:f7dc with SMTP id v4-20020a5d4b04000000b002c53cfaf7dcmr20930026wrq.7.1678543165955;
        Sat, 11 Mar 2023 05:59:25 -0800 (PST)
Received: from alaa-emad.. ([41.42.191.171])
        by smtp.gmail.com with ESMTPSA id s9-20020a5d5109000000b002cea8e3bd54sm245257wrt.53.2023.03.11.05.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 05:59:25 -0800 (PST)
From: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
To: outreachy@lists.linux.dev
Cc: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	eng.mennamahmoud.mm@gmail.com
Subject: [PATCH] staging: greybus: eclose macro in a do - while loop
Date: Sat, 11 Mar 2023 15:59:19 +0200
Message-Id: <20230311135919.9129-1-eng.mennamahmoud.mm@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

" ERROR: Macros with multiple statements should be enclosed in a do -
while loop"

Reported by checkpath.

do loop with the conditional expression set to a constant
value of zero (0).This creates a loop that
will execute exactly one time.This is a coding idiom that
allows a multi-line macro to be used anywhere
that a single statement can be used.

So, enclose `gb_loopback_stats_attrs` macro in do - while (0) to
fix checkpath error

Signed-off-by: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
---
 drivers/staging/greybus/loopback.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 1a61fce98056..e86d50638cb5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -162,10 +162,12 @@ static ssize_t name##_avg_show(struct device *dev,		\
 }									\
 static DEVICE_ATTR_RO(name##_avg)
 
-#define gb_loopback_stats_attrs(field)				\
-	gb_loopback_ro_stats_attr(field, min, u);		\
-	gb_loopback_ro_stats_attr(field, max, u);		\
-	gb_loopback_ro_avg_attr(field)
+#define gb_loopback_stats_attrs(field)					\
+	do { \
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);				\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.34.1

