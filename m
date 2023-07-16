Received: from mail-qk1-f174.google.com (mail-qk1-f174.google.com [209.85.222.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A26FA4E
	for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 22:38:13 +0000 (UTC)
Received: by mail-qk1-f174.google.com with SMTP id af79cd13be357-76547539775so263623085a.3
        for <linux-staging@lists.linux.dev>; Sun, 16 Jul 2023 15:38:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689547093; x=1692139093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y3TDuYSgYiiRhqCEjzbwHrr/s0j0cJsJcXGsxFIFGbo=;
        b=WG4kSJe+gXFk4Zwnf8e5MNtmyrP5jstJ1thI17hY7HiosWX+G3IuzRsByYDEX0k4Cw
         sVT01Q07UMUk3oMgAg4suOmLmfbAaGOTdxQGTHBW0mKu/txUdreCaY6IjPvV3FpktrS/
         FindJCHbeVHdJqaQRNItpsAyYIgptU4q2fTshTINUEmwSHFKf2WPTvJpRUgPfKhvsVJR
         ZGC02GwMdOLlRzcc7sNq3j4mTqWC5AoCW+UngZ3T+gamby+kSGgwsijUR3fqGQ4UV52I
         i+GayPe9GfWsRgbR3wnjolFgfBvNpWnhQnf/xvpbfcMjIuP5uIGxKpR1ZL6V+kBAlEQm
         OHBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689547093; x=1692139093;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y3TDuYSgYiiRhqCEjzbwHrr/s0j0cJsJcXGsxFIFGbo=;
        b=FI7QPQlAb1KfZoitvkwdo3VbJ7tkbFFBSFBjgF+h3eYmhApq0IAcE75uI0L+4y5RbL
         k4K/BHGc5fNXoy50HAPKTKufLxWizSgLq3KZjnnHrKMkdqxYoUY0CEvN+Xr6YByve6Ca
         jJMfJJeJuAzn6rZc4LbTiVIiRc1BV+2DOM56JhnpfkJCahnRlqoAkoiqzjrEkjDAJE03
         rwRBZoKG7mFRRtXGh1b2l7JzSUWaTmEappf5+cgYG2xlZzK2nDGzQlIcfzZsEtJ5dopQ
         w0dy1oeTDULK/JQZqZREIE1HVrsDD0gt4lG6GaamCceETV4W6JN6WJPY0nIfyN1tgvez
         BDDg==
X-Gm-Message-State: ABy/qLaUOW/0JMiio09/ly1+zL8opD5cjYaVr4qMYJCFPAtGt0c6Agzk
	y3zwmc1reFmOjm1SBM1joZo=
X-Google-Smtp-Source: APBJJlHlAZq3+RHOmjEsNjMTcfiaJ0e3QwfTTHe3vwPY3S7KzhlSUZbtirpUKQOEHjQq3NoMesvz9Q==
X-Received: by 2002:a0c:e314:0:b0:637:ae7a:798b with SMTP id s20-20020a0ce314000000b00637ae7a798bmr8478329qvl.57.1689547092786;
        Sun, 16 Jul 2023 15:38:12 -0700 (PDT)
Received: from localhost.localdomain (c-73-236-155-147.hsd1.pa.comcast.net. [73.236.155.147])
        by smtp.gmail.com with ESMTPSA id s4-20020a0ce304000000b00636b3519467sm5940479qvl.54.2023.07.16.15.38.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jul 2023 15:38:12 -0700 (PDT)
From: Cyrus Ramavarapu <cyrus.ramavarapu@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Cc: Cyrus Ramavarapu <cyrus.ramavarapu@gmail.com>
Subject: [PATCH] staging: rts5208: Correct line ending with '('
Date: Sun, 16 Jul 2023 18:38:11 -0400
Message-ID: <20230716223905.2187-1-cyrus.ramavarapu@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adhere to Linux kernel coding style.

Reported by checkpatch:

CHECK: Lines should not end with a '('

Signed-off-by: Cyrus Ramavarapu <cyrus.ramavarapu@gmail.com>
---
 drivers/staging/rts5208/sd.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/rts5208/sd.c b/drivers/staging/rts5208/sd.c
index 4b7122add51a..74c4f476b3a4 100644
--- a/drivers/staging/rts5208/sd.c
+++ b/drivers/staging/rts5208/sd.c
@@ -4501,8 +4501,7 @@ int sd_execute_write_data(struct scsi_cmnd *srb, struct rtsx_chip *chip)
 			sd_card->sd_lock_notify = 1;
 			if (sd_lock_state &&
 			    (sd_card->sd_lock_status & SD_LOCK_1BIT_MODE)) {
-				sd_card->sd_lock_status |= (
-					SD_UNLOCK_POW_ON | SD_SDR_RST);
+				sd_card->sd_lock_status |= (SD_UNLOCK_POW_ON | SD_SDR_RST);
 				if (CHK_SD(sd_card)) {
 					retval = reset_sd(chip);
 					if (retval != STATUS_SUCCESS) {
--
2.41.0

