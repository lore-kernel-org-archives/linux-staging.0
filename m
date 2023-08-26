Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA64A53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 21:07:40 +0000 (UTC)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-1bbb4bde76dso1322798fac.2
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 14:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693084060; x=1693688860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5OOg8+maoDUe9q7mOudOl/p44V4LSOgvZCREz8VZty8=;
        b=IonTgb9QkQqRKfraItYCeB897JjYJHlJowFFlaXyLOHThcHeevaluGOSb24nj2j/aI
         nllWloXEwhHSIKFXO1Kjam1TY4Kjh2xx/Om70Uw+cckcr1rYaZoU7AH+bzpE4YpsXPF0
         1o7szmlYtgD4DlYrJaznxyxMmjOeHzEMIkXaGNM+5vy1+DYbe09s3puCiKiMZ2l2M2U0
         dki6Z3FEB4zx8/P4n9yd4UAcafMkmytN+TXL2zon3P7I5xjHbJEXEOqIa4Z6ioDpQLDP
         kMTJ1+muMnEvz95RtM7C9jPiglUOjdG4LLhRnqB+wv4wDIHXqKyqMOWsSMb2pXY3cV5N
         UoMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693084060; x=1693688860;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5OOg8+maoDUe9q7mOudOl/p44V4LSOgvZCREz8VZty8=;
        b=GlLbC0KybzLAP8t5Kttr3jzmvuMM8mK0lwAQbrZzqwAzpqacc9GCL0qeuyv0OBeXsg
         xcGJsOCHHGjQwq0lvuuLu+NS/vE++EvmQAx7yaILv1XSgVPGbD95ifPNbF3Ul+2WYo4p
         8zgYJYfz168U+1qMsMRUeOy7yanFPyQfTjAkp+fR540dhD2U6NsVFTORGnX+UDRvi8n0
         +1Y7l5yb189wj0LpZH1dBm3A15shEZ9QM8FLcHlEilMLtJTk4ffbNHpDK3uLLvUQX3t0
         21yZsSMYfpOJMJ/TwJPms4nQvN4zGJKnufaxpxMNCWnZUuwA8+f3HIi9LjXGU47kqCTe
         YeZw==
X-Gm-Message-State: AOJu0YxrjSxwwPQzOD130Sa5xMhdB1F3Sqelp+W3/fsx6YiY1r/118L2
	sRLyY8A49gEm89TdKZKAzJY=
X-Google-Smtp-Source: AGHT+IHcNDE4V9Ev+F8vIZR6rYrKZg8hjUpAjYOuvW78cQxwnOngTIEOKA3T1SLgzzpYEwazHVUydQ==
X-Received: by 2002:a05:6870:e0ca:b0:1b3:f010:87c2 with SMTP id a10-20020a056870e0ca00b001b3f01087c2mr7402646oab.30.1693084059835;
        Sat, 26 Aug 2023 14:07:39 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id w3-20020a0c8e43000000b0064f50e2c551sm1488377qvb.1.2023.08.26.14.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 14:07:39 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH 3/4] staging: vme_user: fix check unnecessary blank lines in vme_fake.c
Date: Sat, 26 Aug 2023 18:05:17 -0300
Message-ID: <dde6f13f92a7cb17e01aceaeabe790656078326e.1693082101.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693082101.git.alexondunkan@gmail.com>
References: <cover.1693082101.git.alexondunkan@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixed all CHECK: Blank lines aren't necessary before a close brace '}'
as reported by checkpatch to adhere to the Linux kernel
coding-style guidelines.

Signed-off-by: Alexon Oliveira <alexondunkan@gmail.com>
---
 drivers/staging/vme_user/vme_fake.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/staging/vme_user/vme_fake.c b/drivers/staging/vme_user/vme_fake.c
index dbaf050f88e5..4258ed6033e7 100644
--- a/drivers/staging/vme_user/vme_fake.c
+++ b/drivers/staging/vme_user/vme_fake.c
@@ -584,7 +584,6 @@ static ssize_t fake_master_read(struct vme_master_resource *image, void *buf,
 					aspace, cycle);
 			done += 1;
 		}
-
 	}
 
 	if ((dwidth == VME_D16) || (dwidth == VME_D32)) {
@@ -770,7 +769,6 @@ static ssize_t fake_master_write(struct vme_master_resource *image, void *buf,
 				       aspace, cycle);
 			done += 1;
 		}
-
 	}
 
 	if ((dwidth == VME_D16) || (dwidth == VME_D32)) {
-- 
2.41.0

