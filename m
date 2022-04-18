Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BB7A;
	Mon, 18 Apr 2022 16:28:41 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id t12so12738474pll.7;
        Mon, 18 Apr 2022 09:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=pHmIfYdFlbEBfg1s7Ca3bU++BraBxET9LrYHIdIzDOw=;
        b=Gt4VzL3KTmWKfLKC7W25J/xX9fzpOGWcfANQQKWSw8ZY6PBC7ECL5WDiSRu61kFUXL
         Klgvra4BD/Sxpee4hC5tkrqL9LTGsU6tE1A09569yjOGlXZRSMwgZrN4jM7gME6rLGRX
         lwJr/N+1uGB9mtCSwCCOkBNqgltL3MiNyLDH3FhXVZDk1E34NyCJYmygtdju6pFmYRqF
         SpEgA+g9b8Wghl+MGkZavW6JV8NQqX7w+9sd/VBAL7iklYy3x3EFpj7nv4Eh+cZyYnkJ
         0fLOtNohqHo5uY6TfflUaq+1G70rRypZWnQ3NRdR6KcSL3LGZizaeLc1Vb2wVVWCUGAC
         bfzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=pHmIfYdFlbEBfg1s7Ca3bU++BraBxET9LrYHIdIzDOw=;
        b=FNeawlC7FeIxCrvIcb/dmWtP7RRAHEDLDoJsYKLm2bPZiLvU8JSbIxGqsS/CYMgu08
         JHwnEGdjCSMHBdtyMGtHk3lharXLXAJ0yKNI9N2QRS6uxGkhcaWVH7QkD+0iaxwPSLPv
         en1xzlKcyAUAxlTIE3GagGngP/8O/QgjcIlBNZutwdquFE98lAVEZjY4NJwoaIVAmzY/
         uRdPfJqWAur1CKToYTzyQOvRtz8iJEi8CV4On3alw8RlT3tDkw9VTphC8fixVlBM1n3G
         +7AgVbdNMbofkLuVzsgKiuUI9JpLOtmzE2z2TjKlOvqp8QYUXlZlp96PPR4UmQ7jw/6T
         7SuA==
X-Gm-Message-State: AOAM530mB8mMkLYeY5t+6ttyGzH/4mTJBZgI98CvTF7b+sU1UibjZFwI
	3JsOJYCw9NpU3k5XYkA3QoI=
X-Google-Smtp-Source: ABdhPJwa0etoZ3UYp1pfmXyyzdO+3SN5JsmGZJH9apOIyhcA7TVy4ZZD9uWEe1HhMAO++LdBOtht1Q==
X-Received: by 2002:a17:902:7c01:b0:156:17a5:a68 with SMTP id x1-20020a1709027c0100b0015617a50a68mr11433631pll.166.1650299321045;
        Mon, 18 Apr 2022 09:28:41 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id h18-20020a63c012000000b0039cc3c323f7sm13295602pgg.33.2022.04.18.09.28.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 09:28:40 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v2 1/3] staging: media: zoran: use seq_puts() instead of seq_printf()
Date: Mon, 18 Apr 2022 21:52:44 +0530
Message-Id: <20220418162244.15346-2-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220418162244.15346-1-aliyarahmani786@gmail.com>
References: <20220418162244.15346-1-aliyarahmani786@gmail.com>
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

