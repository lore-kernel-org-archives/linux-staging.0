Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16B51190
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 00:22:56 +0000 (UTC)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-76ef653af2eso81282585a.0
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 17:22:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693009376; x=1693614176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5OOg8+maoDUe9q7mOudOl/p44V4LSOgvZCREz8VZty8=;
        b=iVXaew1tf0ApfM4nIuXHiCVbGuT7TvqLGv8qxhnZzkfXIAOizyGJJyVCEUwB4PMmVL
         0UK+IFdouET8Tg9mt8HwjSGkNoe0H8Wh2SzzwhI/MFdo99DP/9qTif/ES0GswK9witIf
         MOK1bbHep6uPUbq0SR8nr2MoUGL5A2eAZnOBOiHtNj2b2T6F067nDr+cALLtnKEmUPRG
         Gj3DXCR9PmySyY3f8K5PZjylHecxe7lPHFwjW2Ae8+S2lCcfndHAI6NaU3CZH5obQpnf
         KS9/lLQXH2dnBLrnYIWlqR8HTyJ6Q4b1/UVybSwRkgEyUQNDH+iVCY8suDU+2yHpsEd1
         EKxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693009376; x=1693614176;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5OOg8+maoDUe9q7mOudOl/p44V4LSOgvZCREz8VZty8=;
        b=Ik1jkPbQMvpjQruSbPVgbW/fqAp56fw9AdU1MTDWttdVMh52kdEtAheOg/hVZlD1rX
         lQ1hijzzHFgh81Qy2kUW24orSoU78TMruVv8Fu2SJy9sXIGIUlXni2N+APZTBD40STLO
         80mtBVmQoQua6dhuRnRqC7H4KOyFK2qDe/p7hPLy3PhQNdmlMTxB/o10LS1NcLYSlbrI
         wrmfZ4e8o35TQ4C/z4/i1sHwP3qx/HLU9KimcQJ2G8CNeNrfG0FOxvIBn7NZLwDT5p/+
         zkYc1ysok5fPMnTl38J6Cqb2BZIRzcCbNsK96Si6BenErSlbHwNf2u97pSE9rQMcPvqk
         7Cqg==
X-Gm-Message-State: AOJu0YyYCg/BSprjm5DSEs6pTy9QNOy6G6ADM1yiLhmPXNp0xUldL716
	duHxeM7K0n+B7HH0lZg5GS4=
X-Google-Smtp-Source: AGHT+IFLF4hJm3gn4k1ab4MFpGTxMhuzuE63NOvvcDuLSxNOKGOEpaPxxCo3ZrIkPUfks0lrTo6xQA==
X-Received: by 2002:a05:620a:a52:b0:76d:7102:28e8 with SMTP id j18-20020a05620a0a5200b0076d710228e8mr20877304qka.76.1693009375603;
        Fri, 25 Aug 2023 17:22:55 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id k9-20020a05620a142900b0076e672f535asm851849qkj.57.2023.08.25.17.22.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 17:22:55 -0700 (PDT)
Date: Fri, 25 Aug 2023 21:22:50 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH] staging: vme_user: fix check unnecessary blank lines in
 vme_fake.c
Message-ID: <ZOlF2p7mjYomUWya@alolivei-thinkpadt480s.gru.csb>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

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

