Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD02970
	for <linux-staging@lists.linux.dev>; Wed,  2 Jun 2021 13:37:12 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e22so2245123pgv.10
        for <linux-staging@lists.linux.dev>; Wed, 02 Jun 2021 06:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ggtixs2081NFyzFZjKHEZFg0tSmZqU1lORXP6WHti2M=;
        b=ha4c+/+xV2Tg8r7LY6CYQfILogLoM9qyX2AB2ENNR2Kj4tmR1Nxfwr9QXbdvsl7lBV
         YgyXtHX+5m8dZz8qw9WvIgH8OkFmaZAo/EXo9KjNSk59rfE710G/8ayFxEg7OAHbAccY
         /vULJvNphqg35q0iP8wZ/LXRTvhK3fiq+fqtCdYGP4SSk5pBR4Q8egi8U0KOroQwZAO6
         R9zigCUJy8hwOZWUNJAKfP4EIgVQaXPRrZlxjvD8zLilFXYYqt58eYz8jgfZXbOzfOyw
         VLYnBKTBzApZAJnBk+nksamtwa/aRXPm5FSbXerumTo4gGpr2eY8WcaluzV5LF/zHdsF
         o2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Ggtixs2081NFyzFZjKHEZFg0tSmZqU1lORXP6WHti2M=;
        b=RvxhM2gk9nlR0/PsfL5iNWviypXLU0XjQcjWPc2bas9v5a6yGyjTAPYbZuzJIBtLvi
         1YGguTGaS0UHo9R/h53fBMlXgWuCUfz2d/Nhse+5VS/MmuvmvMuMscKc782cqY9M5ZRo
         Y+nWsAVI/oT6z6pEHLhdkMihcHsfVhbHLe/yvLkLW3UPZbS/26upwhgUrONw30i/UOGJ
         Ns7NFyaAQjQj2KgTxKe4OkDbhPrW7kzs9yNt72+b447rX/g5M6+c7Wm6FJyT0hNt2+Wt
         umHk8RXpmrnsQhcsHDs4QmGUgnGtQDnkVy0FANbeK8sF2hqotJQFbM2x5vKKuLeQxyjW
         11aw==
X-Gm-Message-State: AOAM532UZ4nW8x423dYj0X5P0AH1Rpy11onTchxzdc0XlXsjm7HKSCAg
	UNAdk+Kw1V8eLXQ+UeBQkJ4=
X-Google-Smtp-Source: ABdhPJxSyat2Sj5uimWbBNoh8uTFj0dKrTGy/R2BnSoK93NYDr6PicCHpALC/bNrjzyERuRv41XHpw==
X-Received: by 2002:a65:60c5:: with SMTP id r5mr14215853pgv.79.1622641032378;
        Wed, 02 Jun 2021 06:37:12 -0700 (PDT)
Received: from localhost.localdomain ([183.82.159.194])
        by smtp.googlemail.com with ESMTPSA id x6sm907000pfd.173.2021.06.02.06.37.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jun 2021 06:37:12 -0700 (PDT)
From: sh4nnu <manikishanghantasala@gmail.com>
To: 
Cc: manikishanghantasala@gmail.com,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: greybus: fixed the coding style, labels should not be indented.
Date: Wed,  2 Jun 2021 19:06:58 +0530
Message-Id: <20210602133659.46158-1-manikishanghantasala@gmail.com>
X-Mailer: git-send-email 2.25.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Manikishan Ghantasala <manikishanghantasala@gmail.com>

staging: greybus: gpio.c: Clear coding-style problem
"labels should not be indented" by removing indentation.

Signed-off-by: Manikishan Ghantasala <manikishanghantasala@gmail.com>
---
 drivers/staging/greybus/gpio.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index 7e6347fe93f9..4661f4a251bd 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -20,9 +20,9 @@
 struct gb_gpio_line {
 	/* The following has to be an array of line_max entries */
 	/* --> make them just a flags field */
-	u8			active:    1,
-				direction: 1,	/* 0 = output, 1 = input */
-				value:     1;	/* 0 = low, 1 = high */
+	u8			active:1,
+				direction:1,	/* 0 = output, 1 = input */
+				value:1;	/* 0 = low, 1 = high */
 	u16			debounce_usec;
 
 	u8			irq_type;
-- 
2.25.1

