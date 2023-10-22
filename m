Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 476BF2901
	for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 12:13:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYdNz+bT"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1c9b7c234a7so19690065ad.3
        for <linux-staging@lists.linux.dev>; Sun, 22 Oct 2023 05:13:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697976828; x=1698581628; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6BZxhGQ28bcDNiJWnqZ3AsEPoFN6rBfxD//AMxuy/10=;
        b=nYdNz+bTsSh73xMxgOyy7A3U1cdcdsL4dtt0ZpDvU4DahgKFxhz/CxN0prx9LrYZNS
         84R9fyzYCTLO1F3Ts2jtCKzhdcMVVE0WuQZ7uc8pKg2ATOkx5ugJhf+EewftRKdbBmc8
         eTQ1UKAZG/XCq3kXtzk/5xlMBuoBKYefUNQ+LZ/Gj2IfcLUby/Wn/y5cr0XuluzyV6Ss
         gnHHyP8QyVkSduAzH07ryg13aOPP0+0HuRZlqkP3c/X+qUq57PBag6Rml0Kvnvs3BTLM
         2oLW3azgEEZYQG/qeZ0+hOLfTpjP3Pq9ANFA8fwZFF4ap4txGseZQBrkvOeR3MhxZiEi
         K9+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697976828; x=1698581628;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6BZxhGQ28bcDNiJWnqZ3AsEPoFN6rBfxD//AMxuy/10=;
        b=JIghUXrznqKdbQqScyQvK1EGZgNez09gmhKtn1iu/bJnKMRZmg00ZP8ZS69SHPSlgh
         sRIVApi9lLfyBj7tswshY53myfW9LePSJT4hjm/t8MacluiWnozy/KKRZVlSDv2ES2Af
         LjYQ2VoLPgWnMGYD+Gax+DG41vyXvo/CRfrIRzawUrQNQwCxobqVWnA0R6WkdWQ2bqnU
         q6dTs1+DlrIrPzgSpcr8+LY6HOtclMgBZy3xMkv61rJFhZ3Nvf3emdYoQjFAsiY6AuJZ
         HpyIPTAI1ZbmczEtpgRQcX3oY5Gw73x07/XghbDe3Z+r0KUNYeOxHVSV73XwGp9o/Sfo
         VyOQ==
X-Gm-Message-State: AOJu0YzCG0oneRzYlkBa6ODowDR7C4HyREGILUid+Y+v7eWWCKzstw6z
	YFSyAvF/f06wNKwvW10a22M=
X-Google-Smtp-Source: AGHT+IGYz4FShfhO8IFsqj3LVS3VLm7MdITeOG1iGHqL7abwGfQ3F70w+8t5XMwp0sIOpsBbfJg1eA==
X-Received: by 2002:a17:903:1252:b0:1c9:e774:58d9 with SMTP id u18-20020a170903125200b001c9e77458d9mr7960726plh.34.1697976828445;
        Sun, 22 Oct 2023 05:13:48 -0700 (PDT)
Received: from ubuntu ([122.171.143.200])
        by smtp.gmail.com with ESMTPSA id iz22-20020a170902ef9600b001c771740da4sm4378625plb.195.2023.10.22.05.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Oct 2023 05:13:48 -0700 (PDT)
Date: Sun, 22 Oct 2023 05:13:32 -0700
From: Nandha Kumar Singaram <nandhakumar.singaram@gmail.com>
To: Viresh Kumar <vireshk@kernel.org>, Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: kumaran.4353@gmail.com
Subject: [PATCH v2 0/3] staging: greybus: Coding style cleanup patches
Message-ID: <cover.1697976302.git.nandhakumar.singaram@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

This patchset performs code cleanup in greybus driver as per
linux coding style and may be applied in any sequence.

v2: Ammended wording in subject line for all the patches
    Suggested by Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Nandha Kumar Singaram (3):
  staging: greybus: camera: Alignment should match open parenthesis
  staging: greybus: camera: Modify lines end with a '('
  staging: greybus: bootrom: fixed prefer using ftrace warning

 drivers/staging/greybus/bootrom.c |  2 --
 drivers/staging/greybus/camera.c  | 13 ++++++-------
 2 files changed, 6 insertions(+), 9 deletions(-)

-- 
2.25.1

