Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C46F3801;
	Mon, 18 Apr 2022 12:02:48 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id b7so2515078plh.2;
        Mon, 18 Apr 2022 05:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pHmIfYdFlbEBfg1s7Ca3bU++BraBxET9LrYHIdIzDOw=;
        b=QXDWG5IlrTI1SdTC2t0iJGNjYcOeHl6dU8afA0mPcO0Or+oRWHHlgJ1uRhLd4evU2I
         W5FnM/xeJ4CEyFyqIyGl6RPDQuIgBK8IX3vaQg+woyVXiRJLmLPzc/MMQxkCbDyp+J5C
         KzVgP0q4TD8uaq/vuJGd9gtT0/VjozlwEW52z2J6ISvZ+0eIGyGRpwpsp8lZ6wEEKhGE
         P93idKHTGXZ14lA6TBTim/g+AY/yJXmnroEE3sgC7icduU77CV+GjeB2nS2ueVgPToed
         S4yarTAJPnC3dx9LS3eNG/ZBES560RulN33Pu5aWLesongYn036mb1UpWexUM6xq2bPi
         UaOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHmIfYdFlbEBfg1s7Ca3bU++BraBxET9LrYHIdIzDOw=;
        b=7B6slvRuNDRvswei9/dNJoSh9+lBqWODeQILxklpKhb8QIb/miVK93zhpKXeXAvL8l
         JyDjnJYPw8dn+4b/pvBWqWoqCf4NV/uWKRiah5wKOleT1ita/CZFWrIdjImrjoSROdS0
         6CXDS8BH6zcx59bCqYlkxH2+lryCJqNi6tLuyFsf3YOJ7Vd+K6Q4jWm5fwVxytso4IGf
         9MP0txyZVXOLYO09GDX7LB1R0AifKKXSid46sWfarTTgYYUi6zvIXLaRfiPYEy+i38Ws
         hGMsFGRwRAemzyu6zyR47TR9AFT3toMbaAi0Cjg/cp+bRqNGxGr1Dnbx3QGdRMexDS5z
         qPKA==
X-Gm-Message-State: AOAM532/dKphTLR8YAfBEd+3RRO5LP3oftr/0tp881duLlw1I8gM7mZX
	EVDDgL1AnKgm8O3raU498zM=
X-Google-Smtp-Source: ABdhPJyjaCRepIeQD49ER6XVhKfz5eniRdQHa7nbQuAOV/clAl/1UqGDDXpDHluB+6BttoCRcq5+Tg==
X-Received: by 2002:a17:90b:1c88:b0:1b8:a77e:c9cb with SMTP id oo8-20020a17090b1c8800b001b8a77ec9cbmr17837755pjb.205.1650283368262;
        Mon, 18 Apr 2022 05:02:48 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b001d28905b214sm3840628pjj.39.2022.04.18.05.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:02:47 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH 1/3] staging: media: zoran: use seq_puts() instead of seq_printf()
Date: Mon, 18 Apr 2022 17:29:48 +0530
Message-Id: <20220418115948.5456-2-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418115948.5456-1-aliyarahmani786@gmail.com>
References: <20220418115948.5456-1-aliyarahmani786@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace seq_printf() with seq_puts() for a constant format without
additional arguments, reported by checkpatch.

Signed-off-by: Aliya Rahmani <aliyarahmani786@gmail.com>
---
 drivers/staging/media/zoran/videocodec.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/zoran/videocodec.c b/drivers/staging/media/zoran/videocodec.c
index 3af7d02bd910..16a1f23a7f19 100644
--- a/drivers/staging/media/zoran/videocodec.c
+++ b/drivers/staging/media/zoran/videocodec.c
@@ -250,8 +250,8 @@ int videocodec_debugfs_show(struct seq_file *m)
 	struct codec_list *h = codeclist_top;
 	struct attached_list *a;
 
-	seq_printf(m, "<S>lave or attached <M>aster name  type flags    magic    ");
-	seq_printf(m, "(connected as)\n");
+	seq_puts(m, "<S>lave or attached <M>aster name  type flags    magic    ");
+	seq_puts(m, "(connected as)\n");

-- 
2.25.1

