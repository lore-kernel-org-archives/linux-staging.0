Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52902D2E5
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 15:18:49 +0000 (UTC)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-1c4de3b9072so1273425fac.3
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 08:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693063128; x=1693667928;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nzTwOxodIrtEsdwkWuz0yOug+DzxDcAq1gfUgYKMZNE=;
        b=BQGH0YOfSriMoQqC274OlA/PRMd6iqmqKxPkF0utQK+Ock1Kw1Wi/gvJBhkpb2PGCb
         NuSMW2eJTA/WYU1ZK81TOh9RzBmINcJUafi9ZJPivjbKU/Fbv4CKQBzZSoEWnEHr4vMO
         hJQiBQnmQfJvhznt1w0RWDmhRSvmz5mbZZh1KTcXNefQupglJQqeh4p8iNx4Qo93Ss7L
         UqhKqxtIufTwJeq1jqjMzrfh0PJ9+1QbKNAXfTXVkOQeDH8kgYI8s2Hp8qFb8+PYJRs6
         tgT8hqVW61eWJ6NTrCg0nP1tp8NkW0mQwbwMfKYUmsqf2mJycbz8VeIoSI9J/x/iNoL9
         tpmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693063128; x=1693667928;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nzTwOxodIrtEsdwkWuz0yOug+DzxDcAq1gfUgYKMZNE=;
        b=PCkUI8sgEXqL3x5dY82fik2BDPMbio9jX+rC1rKkf3EheZTmS43BeuynY9umcyKGyG
         NYzsnEwFxnAfHtHbAcb9Pot/A9/Xn0TNDYRWeBEiKPfJGyMFRFfSRjApy7mtKgff33qb
         jdkIPwdz7uitjxQff/JsgL4xMM3BfMwKuWXD0LOSUwxqCG6l/t5uTL7iScMQ+xO4lJsQ
         gGtIyeg5BByxVugj0xBKfsK2kbbX9obCGDXRQMEOxZGDrfieH4LT6VGl9DdbZtamyhn2
         SBLWLCyT2RBruGerDd7P+rQlAyJDCmOZk8lIqoeZK2YQRbh4NPRXqHFmYF1NrMG4KlT2
         XufQ==
X-Gm-Message-State: AOJu0YzAR2/BVtZulB58Wm0ZNwJR9zetYlJeQ/LBUq++f/JIjCxHo2Kl
	RcJqjgbkVTnOFM6/UmvBKGM=
X-Google-Smtp-Source: AGHT+IHiSLyTBDQGZWESnc9jAvslkvTW5INNTFaT6pxNLUkEBR7RbXXBUmhcGxY/LdEJwsCjM220iQ==
X-Received: by 2002:a05:6870:828d:b0:1bb:b025:3e87 with SMTP id q13-20020a056870828d00b001bbb0253e87mr6362102oae.58.1693063128213;
        Sat, 26 Aug 2023 08:18:48 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id e11-20020a0568301e4b00b006bcbffa5167sm1818255otj.76.2023.08.26.08.18.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 08:18:47 -0700 (PDT)
Date: Sat, 26 Aug 2023 12:18:42 -0300
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk, manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: [PATCH v2 3/4] staging: vme_user: fix check unnecessary blank lines
 in vme_fake.c
Message-ID: <ZOoX0npoWDwBSDn0@alolivei-thinkpadt480s.gru.csb>
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

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

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

