Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C839972
	for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 13:30:48 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id v12so970939plo.10
        for <linux-staging@lists.linux.dev>; Fri, 14 May 2021 06:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wT0Jn1b/5R6Ec7FJe0n8ikzXhLXxiAZMKP/g+ykPRbA=;
        b=EISTQhVOD5WNxvecVI4DpooL7Jp91OKE+PI+cpXcJP1pNBTjS7pmw+5PZZLOs0yZnF
         o8lbgm+ot7YFXWLN3metN2l9e81zTd0i9Ok4V8Ndclm+ax59GIgr5Bvpb9rIVTLJu08/
         reqeWEoq2rMVjr+u3nyH/7F+ElAx7R6Ci5sfZckE6wNc3r2G1qWSDgkos/K1GEpLAhBX
         e21YttJ8qqGRcMYWS4Bj2hCLDQOL69VfQTLX39zlhAdjW01UD0JwkanFxnwYbzjYbVPS
         MXFItjeBT2VIHud8fNXG95CUege2suTcNpk99hPnSvUdvvPXpjhtyodYQS+EO9lGtnj8
         paIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=wT0Jn1b/5R6Ec7FJe0n8ikzXhLXxiAZMKP/g+ykPRbA=;
        b=XkjyVbHYIu7Rfv8cBCTK5CSPjTkiUasystqUrhj0eGfEDKCsXNpPOfCjUNzP+RU5+1
         /u3v9tXH1oKP+nekxs4vg4YFRkRrb1E8tCOddUPyG17rgQWDspXgQPh5YOntoCpqDqK4
         7WWub8zes1ikrtQE+ArjY2nzeOej0b0DSYWSHB1vCaVDSHESdHa1aYo9CMOwMKdSYWvI
         kZU5wag5Mk7MXqyrfM1hjI6GyDcbhdcC4d5HHr3Fq+WDvSdUVt4+7s9PI2d86+OiXSrl
         oyCuhrm8m6GXO3+b7cUDgCf+XKVT61bL4N3NN7KBKWTxcbgQ2d7UKkmRn7mPuKCgQrXC
         w0Ag==
X-Gm-Message-State: AOAM530m3+3gju8JmIlbeUn/L7KrDqadUUaDtzhfz8AQ4QCm/Vng4ET8
	UU5lD4wpi3W5Y4ZVSKeX5+Y=
X-Google-Smtp-Source: ABdhPJzD0kDjvXw4UTqhdxFfDieKbztEW02uxQJEMRqNtSY5aqeam8PR80RsZ21mhavlxffYq3noZQ==
X-Received: by 2002:a17:90a:d909:: with SMTP id c9mr2754554pjv.190.1620999048263;
        Fri, 14 May 2021 06:30:48 -0700 (PDT)
Received: from fedora.. ([2405:201:6008:61b4:4e16:5348:d963:c66d])
        by smtp.googlemail.com with ESMTPSA id ei9sm5176527pjb.2.2021.05.14.06.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 May 2021 06:30:47 -0700 (PDT)
From: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fix gb_loopback_stats_attrs definition
Date: Fri, 14 May 2021 19:00:39 +0530
Message-Id: <20210514133039.304760-1-chouhan.shreyansh630@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gb_loopback_stats_attrs macro, (defined in loopback.c,) is a
multiline macro whose statements were not enclosed in a do while
loop.

This patch adds a do while loop around the statements of the said
macro.

Signed-off-by: Shreyansh Chouhan <chouhan.shreyansh630@gmail.com>
---
 drivers/staging/greybus/loopback.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index 2471448ba42a..c88ef3e894fa 100644
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
+	do {								\
+		gb_loopback_ro_stats_attr(field, min, u);		\
+		gb_loopback_ro_stats_attr(field, max, u);		\
+		gb_loopback_ro_avg_attr(field);				\
+	} while (0)
 
 #define gb_loopback_attr(field, type)					\
 static ssize_t field##_show(struct device *dev,				\
-- 
2.31.1

