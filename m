Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926FEA29;
	Mon, 18 Apr 2022 17:21:07 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id u5-20020a17090a6a8500b001d0b95031ebso7675080pjj.3;
        Mon, 18 Apr 2022 10:21:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQ7zMObbxBwpwrmjodRH3jIXu53bzE9nhd/lk8gMVG0=;
        b=N27U19zOBTYQfhc3bgkjYTIy8VPlnXYzPv3bvnCJHxVIGdoj6Dz995yQF6LlOPCvTr
         BSsZ6cxg55iljThZtwy6r0pNbEQpmpTlAy87IBBTZdvMau1M/zmRDEh4hK1zgOBL0uge
         VENqT2H+vNAC49WV+/Z4KPqtM4awCnGbTH7UyDkEmGNHPrn0PXFedpdb7EAn/CNfdqlh
         247BiGGCsoUiN5RhPrOcsztxDbmWCYSrUsuMfIuqrO+cBMjYO4hw1D126HqZvf07pj3C
         9bNgLiJENjKHtOO/4F468dhRDAhjam2oB+ydxWBy5w0zJTJCKYyRgJfqEmG2oTnafSpS
         tKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=iQ7zMObbxBwpwrmjodRH3jIXu53bzE9nhd/lk8gMVG0=;
        b=nf0phxPrtpO8yhV6E1cxujCpi2ys6DyO9oy8JDA8j5DmIAqTFU1RQIq6ZrKcwUH/lm
         yfqXMgqMfok7TsPuQ2D/Q7nG7gUxzI1+XhbitQvxt0GLzZSvPMEEK8zuItDgkM6xaXll
         ebQcjCqPoprGzoOsXIhBsR12Kl27KW1mW8Ks+7OqgdS5V6aPxkobnG4Ub5x5JABScPaN
         ajTshDogK0LcTX8Tcdk1Cyr5/zAxw4iNeqHJmraf9Wf2/IBn3EQaJi/R8fS5mHOSxPET
         Dc+06li4e3+An/2QLeZtCAF3XkXjTodBTcVlwDqPm4ASBknhr4tyNZFIcKCO17UjkRUF
         Hosg==
X-Gm-Message-State: AOAM533RpcpYE9xqD+hee21RnkiMME7YuN6Ydu1JM+GgdkUPAPyaDtkB
	AI89UjfQGPl7c+J2Bt1A41k=
X-Google-Smtp-Source: ABdhPJz++PL/lJOqM3fzQXj2jrTDz43c8/cBZ4e+c+pV3rnK5BSZJnTiluFjWyDif1IdjKep3RWv4w==
X-Received: by 2002:a17:90b:1a8a:b0:1c7:c60b:f12 with SMTP id ng10-20020a17090b1a8a00b001c7c60b0f12mr13989087pjb.139.1650302467000;
        Mon, 18 Apr 2022 10:21:07 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id y9-20020aa78f29000000b005098201d2f5sm13041394pfr.205.2022.04.18.10.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 10:21:06 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH v3 0/3] staging: media: zoran: fix warnings reported by checkpatch
Date: Mon, 18 Apr 2022 22:44:50 +0530
Message-Id: <20220418171453.16971-1-aliyarahmani786@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These patches address style issues found by checkpatch in the
zoran/videocodec.c file.

changes since v2:
PATCH[2/3] : Rework commit description and subject
PATCH[3/3] : Rework commit description and subject

Aliya Rahmani (3):
 staging: media: zoran: use seq_puts() instead of seq_printf()
 staging: media: zoran: else is not generally useful after a break or return
 staging: media: zoran: avoid macro argument precedence issues

drivers/staging/media/zoran/videocodec.c | 9++++-----
1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.25.1

