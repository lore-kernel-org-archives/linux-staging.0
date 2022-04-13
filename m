Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE272F32;
	Wed, 13 Apr 2022 20:11:43 +0000 (UTC)
Received: by mail-qt1-f179.google.com with SMTP id hf18so1719589qtb.0;
        Wed, 13 Apr 2022 13:11:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLu5+mnBdkV5bNcuBYn/9StkIMnThnOJRjEm3/I6LL8=;
        b=JQbNGODPh/X7mDysGHKbjM3WkcSoi89SOSZVLGbV/UPdE8SMyTqBI+Ww/JkrZsN/jl
         eGfxZ4SsA01wvrXmEAuZ8RpUR/NP/ZBD0sWfs/LDAi0du18C0koHi2PRBwqzYIHPjHae
         JIutwzN0GAlHwYC36bFqzraSYhZveSn3t2rpdz+kGkk8P82MjbwFebgp5RWp4Rq+/7Ey
         raJ+EaY2p4fVoP3nmnF/lcQutv6QzTq42bHAzMJntNc28ktHwOz3lh0cGJ5K4gpxwp++
         UEzu/ewT08eqVX4BGP01B6HkRNRGLrD5nAVsW1CMM2cdEKApnqkm+AzjJx08VAwa6XWf
         y0LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FLu5+mnBdkV5bNcuBYn/9StkIMnThnOJRjEm3/I6LL8=;
        b=UncDFFLp7ve8DJkT8B+4QhK4Ewrqi6E7tHXweWzyiHht3pnmadakjMcy3Q25UB9yUs
         N5hDtJzj/46o7yAQMXaP/ktJ7PsQL5BVC9PF67tA+WdEYh8ro7Ly0uAmToUsT3DovuJy
         Uc46ISNfkEYMGx1x85btxjU/futwDTYV9ICPHvmjb0Phdc0XFpMoSXqV3AOn+fYpKWcG
         9i7wGcEmjUMyE9OTnO8nW7xhXR470wUxxgU6kf2hOxvS64lGT1nqq8q0pad0e1K3RLVq
         TwdcIK2UT3AmZyOgm7V5AfG5gjRthXE6miL3jAemLj6dK/Zp0OW3S7ey9YI28Yata9Dh
         lsXg==
X-Gm-Message-State: AOAM531MxtbmrAeo8nO3IHacg67iy6kFJF4RYFERS3GVL0krTheJ+yqy
	tZ9g+t7H7QQjPwga5CgTLsw=
X-Google-Smtp-Source: ABdhPJyiBkXmOz1EjxJX3Vdcd/isDYM9UtENeLlEXyamjBzbo2SNLPdgpC3jKZ/KiHIc7WtxB7LlrA==
X-Received: by 2002:a05:622a:1cc5:b0:2ed:cba0:3f0e with SMTP id bc5-20020a05622a1cc500b002edcba03f0emr8505261qtb.365.1649880702197;
        Wed, 13 Apr 2022 13:11:42 -0700 (PDT)
Received: from jaehee-ThinkPad-X1-Extreme.wework.com ([4.34.18.218])
        by smtp.gmail.com with ESMTPSA id 7-20020a370907000000b0069c5598584esm1469827qkj.105.2022.04.13.13.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 13:11:41 -0700 (PDT)
From: Jaehee Park <jhpark1013@gmail.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	jhpark1013@gmail.com
Subject: [PATCH 0/6] staging: r8188eu: fix warnings reported by checkpatch
Date: Wed, 13 Apr 2022 16:11:28 -0400
Message-Id: <cover.1649880454.git.jhpark1013@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
core/rtw_mlme.c file. 

Jaehee Park (6):
  staging: r8188eu: remove unnecessary braces in single statement block
  staging: r8188eu: remove spaces before tabs
  staging: r8188eu: remove 'added by' author comments
  staging: r8188eu: place constants on the right side of tests
  staging: r8188eu: replace spaces with tabs
  staging: r8188eu: correct typo in comments

 drivers/staging/r8188eu/core/rtw_mlme.c | 42 +++++++++++--------------
 1 file changed, 19 insertions(+), 23 deletions(-)

-- 
2.25.1

