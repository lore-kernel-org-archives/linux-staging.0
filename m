Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E641401C
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 19:33:57 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6bca857accbso2065306a34.0
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 12:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164836; x=1693769636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8owQxhS5E1ZOUbfMsVXpc+yZBo+YfqBQ9stCS1V4Rks=;
        b=bcmTitmpWn3IWkMlJ4Fk3NHl0O4WTAM+ApwKk04XiVShA81yMZQk+zbbI/7oEAcJTR
         0N7d2sq0R0LjK0D3TPVdjzxKKXSMuHiyFA8C5jCF5qOVilxdM9dVzzEnnjtliNEasizd
         q96fCR/f0aZOiPwUWrPZZ4q9AzqjIGJzsjDPM/+08JupvpcGJUVDx+UQp7dx0q8dv7Lf
         tWO87AEtJ1Z7ZKOKzO4cB4u2sjygfBx3TO+bPPHTKHmDdtPmwZhf8GI0c+ikBHO7mQa9
         WKPvtZ52j0AdmhqmiTzE0BN7TrP/eN1rpaaDB5TJzkOh+wyWU170kRgX/afaRUCFI7pc
         jRCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164836; x=1693769636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8owQxhS5E1ZOUbfMsVXpc+yZBo+YfqBQ9stCS1V4Rks=;
        b=YLtsunzor4eot/Cxb5lFrsB7SXAfuaPn+ohVJRQcjTO+5m4Kav21GWkWynnzYCQ5z4
         LYUZbt84NSU5fRwYoRq/ma44RJILyJQl/+w8J+eyQQ+i+XnuO8iiUeAlfukh2NAnwypL
         5QhrpPRT67PBPFVGP7Xd+Cy1qEEUmXJ2oQsEa4n1RIYLMt+YX7xNO06J5nfoh45Vd8i9
         jRWSk4vEcsUP9yUov5DbEUN5UhFgNwBdpfMpfdRS9ZM4xoMS5CeaX5pLvxhmSIRUHPU9
         txPtus1IPvZwJfGs6HLphp9iB5rt8H/snzON22BJXGzNs/4um1MU+P8V9+07kMtMDPZQ
         7aMA==
X-Gm-Message-State: AOJu0YwxuMAzZJhrjq+rrfMIxuuoH5KsCBGkEiOxU/B28tUZLvAOz7U2
	O9KJdTlmn6IyJbjwvJZICuCgdaNvGqI=
X-Google-Smtp-Source: AGHT+IGwitpPpk9uf84c8V9vFO9dcSj7DyQ9HBaAP1ghSUC0m5PPfvHgEdrc+6o1Ayo982i2Fi7h0A==
X-Received: by 2002:a9d:7f8e:0:b0:6b7:56f6:f846 with SMTP id t14-20020a9d7f8e000000b006b756f6f846mr12173664otp.5.1693164836484;
        Sun, 27 Aug 2023 12:33:56 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id l8-20020a9d7348000000b006b96384ba1csm1640272otk.77.2023.08.27.12.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:33:56 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH v4 3/4] staging: vme_user: fix check unnecessary blank lines in vme_fake.c
Date: Sun, 27 Aug 2023 16:32:54 -0300
Message-ID: <dde6f13f92a7cb17e01aceaeabe790656078326e.1693164540.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1693164540.git.alexondunkan@gmail.com>
References: <cover.1693164540.git.alexondunkan@gmail.com>
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

Changes in v2:
- Fixed summary phrase with tags to indicate commit order
in the patch series, noted by Greg KH

Changes in v3:
- Sent patch series in a single email thread, noted by Nam Cao

Changes in v4:
- Versioning the patch series with the forgotten information
about the changes in the previous versions, noted by Greg KH

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

