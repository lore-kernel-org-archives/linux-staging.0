Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B9706FA8
	for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 15:56:46 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-51d93425853so863726a12.1
        for <linux-staging@lists.linux.dev>; Sun, 25 Jun 2023 08:56:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1687708604; x=1690300604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJwT14TihBRqB0zuCMTLR/0JBnFHysVCjPaJH4ilQiA=;
        b=XMp7U5DAmUm81cnyjU5jLJU0/yVd4ezhGfFWVgeONlsIvAaSITWyXb2G7lYg+8TrdV
         3DPodAe+9bHFHDUiA8HZVlaf8Avudsl3NUCjoJPqu79v0LdfTHopfeo6MEubAGF5qBrq
         34s6L8cNGpvlujVjOGDVCnkb3gPI2QwycwPDq/wiR1jo+bwiK0U6pb5I5xwl4Ly/Zj6a
         Pfu1WLdAFmVuN7FxV7IW/JIqnku5sGVTt0BGO2eVwQxpU8qpeLx/g9aborjR4+hA0mEL
         Fb8x7mGCL6q6gzkX5C89uwXt7mNWQWk5gwII86WGzVQLX69IxB0LPLPQ1+MjpDgpQrHN
         mE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687708604; x=1690300604;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BJwT14TihBRqB0zuCMTLR/0JBnFHysVCjPaJH4ilQiA=;
        b=Z1W7JSs3Cp9+HY35mcAIaV20F/2ean4hjnJ9ot8QVdcSdI1/kGf2NCBfhL0ycHOjzT
         eDQGjnP93PNsW/RwVJEe/gQhiJQffD8vyoH8aHMrOFjTr3Va3T90+i69ZaIxVVH7qgiF
         nO6m0wFIL+bpNTKa3ow6DWlN8jAEJq82d8umYUkwIUR/pcg54/H8YJDc/9hkYF8PNZjh
         hSXLUB8/Xp7Zq1Lse7bShrbA8rnnmMmrMDN3dc7mOk1BX93+E8szsIhxuXNUpk6xsSyX
         EOE3Ot+FLYwdN0z2SIrPBdTLvFc8X5NwFyb7/4z/JqsMEVltMm3r/Rohso+IxnRH4feI
         kIIA==
X-Gm-Message-State: AC+VfDzocJgeJaWghvD/mS+1ZA1I65HTSSKuftJtet7ErQroc0eOxpcJ
	VtEX9Z+V6qhqe0GDy9tFGze6gD5P/Yvu0w==
X-Google-Smtp-Source: ACHHUZ4qIwnHicnRfn4cD9whZBDuWdb247+g7jvt9pwfiXbGEl10GQ5tYSD5oUqV3RRWP9DKw2twAQ==
X-Received: by 2002:a05:6402:786:b0:51d:9883:afdf with SMTP id d6-20020a056402078600b0051d9883afdfmr492829edy.12.1687708604163;
        Sun, 25 Jun 2023 08:56:44 -0700 (PDT)
Received: from localhost.localdomain ([2a02:810a:9640:26a8:484f:5091:3ba0:ecc])
        by smtp.gmail.com with ESMTPSA id r26-20020aa7d59a000000b0051d961ab28asm660933edq.67.2023.06.25.08.56.43
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 25 Jun 2023 08:56:43 -0700 (PDT)
From: Franziska Naepelt <franziska.naepelt@googlemail.com>
X-Google-Original-From: Franziska Naepelt <franziska.naepelt@gmail.com>
To: linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	eperi1024@gmail.com,
	hdegoede@redhat.com,
	quic_vjakkam@quicinc.com,
	johannes.berg@intel.com,
	tegongkang@gmail.com,
	gregkh@linuxfoundation.org,
	Franziska Naepelt <franziska.naepelt@gmail.com>
Subject: [PATCH v3 0/3] Fix some checkpatch issues
Date: Sun, 25 Jun 2023 17:56:32 +0200
Message-Id: <20230625155632.32403-1-franziska.naepelt@gmail.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a series of patches to fix some trivial checkpatch issues. Not all
issues have been fixed. I intend to submit another series to fix more stuff.

Testing:

---
v3: Series to contain only remaining patches.

Franziska Naepelt (3):
  staging: rtl8723bs: Fix space issues
  staging: rtl8723bs: Fix alignment open parenthesis
  staging: rtl8723bs: Fix remaining blank line issue

 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c | 164 +++++++++---------
 1 file changed, 85 insertions(+), 79 deletions(-)

--
2.39.2 (Apple Git-143)

