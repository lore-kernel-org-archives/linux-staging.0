Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com [209.85.222.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F2C0A53
	for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 21:07:22 +0000 (UTC)
Received: by mail-ua1-f53.google.com with SMTP id a1e0cc1a2514c-7a2ab581cb1so723951241.1
        for <linux-staging@lists.linux.dev>; Sat, 26 Aug 2023 14:07:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693084041; x=1693688841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hrAfmkDjeLWsX6v8VmGfNgFeSlaJo1JXSit4j9nwvGA=;
        b=kcQTr5Jpd9jT1NC48d4gY0ZSxjuAPNoixGNw5egGE94QLaPGA6AATPo0ETZjpUp82/
         cN6SPvOdG2X5f2HN1gqwldrrZ4NQaHf83FGsrAEJ9QL3yLYH9I5oEXwTdMfMw00oKWoL
         jqbt1YTAqEKzGRQVdTMRPuNtEdF5SHbS/eC93ca8fcjIyHcEETCjQVN8ZMoghjPdpsps
         qLXT1adgTe5cLplobWYPcNENSbxwWnNxf+5aSD2yw7zKu4xrBNIlwvvhBlgenordhD/a
         risIrDrPkz5cnQu2MZVYym7Gf6gGFbOyH8/VAI9QJbWoE4trCorb8TU3pudJiVW4ZOYD
         j1MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693084041; x=1693688841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hrAfmkDjeLWsX6v8VmGfNgFeSlaJo1JXSit4j9nwvGA=;
        b=e1yCa1yR8v1/zuY5EEH5yN60zN28gH8ivyRqM/MesgRboQDrkTshmHr0bbK+401OC/
         NT+N71VITinJ+NTe2DT9TwpCLwrATjRBRr+RSAw3t6QkKms6jkWbEPBQrfz3ymhr+r+X
         npBYp6mf9u/TTkqVY8rTiBvVxVHf1djg1KCCgUil8Ny8w5KLWMPHIUl4ARWpDvqCCJXz
         GO0UnKRDlelBmyAc/yxgdj9YomWqK6GUBgK5MwCi9HNZbXH9YoL92OtQXKtNFLFtBx1L
         Fj+L0Dg5DlbixLDZarr2utm/6elphB8Wfr+xUX3Z45MNagqv3OGFs78A4btQ75ET55vk
         DCfA==
X-Gm-Message-State: AOJu0YwyvTZktsn0+6/WCX1jpcJcfZpaDyS6/+LmjmF8Djgm6Q2a8uXK
	5wIDnVCG4b7GkNz33E2vMnE=
X-Google-Smtp-Source: AGHT+IGQfg0jBs6IZALuLuHot3u3jTCGhWEcU0KsBE/fmeiitJ1eh6Sg1udyUlJcZDkBXFIqbwmUzg==
X-Received: by 2002:a05:6102:3a49:b0:44d:5053:11ce with SMTP id c9-20020a0561023a4900b0044d505311cemr16214941vsu.19.1693084041076;
        Sat, 26 Aug 2023 14:07:21 -0700 (PDT)
Received: from alolivei-thinkpadt480s.gru.csb ([2804:14c:bf20:82ea:8c7c:b784:3f92:988a])
        by smtp.gmail.com with ESMTPSA id w3-20020a0c8e43000000b0064f50e2c551sm1488377qvb.1.2023.08.26.14.07.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Aug 2023 14:07:20 -0700 (PDT)
From: Alexon Oliveira <alexondunkan@gmail.com>
To: gregkh@linuxfoundation.org
Cc: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Alexon Oliveira <alexondunkan@gmail.com>
Subject: [PATCH 0/4] staging: vme_user: fix checks reported in vme_fake.c
Date: Sat, 26 Aug 2023 18:05:14 -0300
Message-ID: <cover.1693082101.git.alexondunkan@gmail.com>
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

