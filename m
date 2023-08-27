Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FEC3111D
	for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 19:33:12 +0000 (UTC)
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-6b9a2416b1cso2146998a34.2
        for <linux-staging@lists.linux.dev>; Sun, 27 Aug 2023 12:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693164791; x=1693769591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrAfmkDjeLWsX6v8VmGfNgFeSlaJo1JXSit4j9nwvGA=;
        b=mDUWt8SCZ1zQzTOlBmBQG44QpsxPWbmCJ1jzAQS+NXrQmFAOGHUYBf7/FQyhX7Rabm
         nkJ7jVDE4qN7K29ax84fxHSIEsMAGj76FE9bRRnkPL4YHTNB7Za5Qq70k72ET476kJK5
         kn8DNJOTRkeNhXJCiwHsP679WyYo5AGxIMa0g+f3JcCtHqCO2oAywAXuNUHCdZf6MWKL
         wQNKUPcMvIezI7/BSJ98YVDnhYFGNsMNvM6ZK3fxclWXXCSp5bv0ffGIi4OGu1tehq9E
         NXqYNQuQPPiG694NZzG6g68teAm80orvBIVCnMbl5xmy16ZHQThddoPL1nvl4Y6zvKnI
         wL1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693164791; x=1693769591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrAfmkDjeLWsX6v8VmGfNgFeSlaJo1JXSit4j9nwvGA=;
        b=P9s9E2f5laxPppz8dDdQrK5U9Tm146osaoWvMHpy+epvZ+l1HGdLtQv9dj6IHJZolO
         bKGELVrSbAfFQw3ozFGx9TTpLXUyNyHi3NeYFBqepmIJoXnCnD2XjlxgBBnXx8q2m3cG
         Tip96z6zcNml7MYE928rHoK7lI+PEFp9AzpkXqlzWjafjdPcnC2PnYLZjRRsZ97Iw8fB
         SP1/sdch+sjhzZhbC6g+nSocrSIIMzGy0EZFP7iGF8dzYxn3Foh+zdHWWF72zWxxoAyN
         CkIS1DL0iTudgnGCT1XwfBAtrS88CfDa/IC9K0a6F32m2s9ZcKdSOry1XR2qlDowXkMi
         l9Pg==
X-Gm-Message-State: AOJu0Yx498AsoiwKAVDD5k2YR+TxWV0zgxYkdX4ZKnrOxQZ+QDJKSQdH
	y+8eUTHZlmNW/TH48kdNO7R/vgJWHJQ=
X-Google-Smtp-Source: AGHT+IEjka/+VDKBRuPl/I58rzTsE4cLX6zW7HtFlTr0vDBD4+zQeVcSMY3O31H4NuOtdmZNJc8czg==
X-Received: by 2002:a9d:7d98:0:b0:6b9:1af3:3307 with SMTP id j24-20020a9d7d98000000b006b91af33307mr12166928otn.17.1693164791248;
        Sun, 27 Aug 2023 12:33:11 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id l8-20020a9d7348000000b006b96384ba1csm1640272otk.77.2023.08.27.12.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Aug 2023 12:33:10 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH v4 0/4] staging: vme_user: fix checks reported in vme_fake.c
Date: Sun, 27 Aug 2023 16:32:48 -0300
Message-ID: <cover.1693164540.git.alexondunkan@gmail.com>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to fix all warnings related to
aligment of open parenthesis, lines not ending with '(',
unnecessary blank lines and unnecessary space after a cast
in the vme_fake.c file, as reported by checkpatch to adhere
to the Linux kernel coding-style guidelines.

Alexon Oliveira (4):
  staging: vme_user: fix check alignment of open parenthesis in
    vme_fake.c
  staging: vme_user: fix check lines not ending with '(' in vme_fake.c
  staging: vme_user: fix check unnecessary blank lines in vme_fake.c
  staging: vme_user: fix check unnecessary space after a cast in
    vme_fake.c

 drivers/staging/vme_user/vme_fake.c | 72 ++++++++++++++---------------
 1 file changed, 35 insertions(+), 37 deletions(-)

-- 
2.41.0
