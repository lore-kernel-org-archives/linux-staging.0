Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEEA17C
	for <linux-staging@lists.linux.dev>; Sun, 12 Jun 2022 01:05:26 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id o7so4788439eja.1
        for <linux-staging@lists.linux.dev>; Sat, 11 Jun 2022 18:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eaJ9A311TrSfFnoNHlPLqCJLl63tuzS6qi1yW9Cp5w8=;
        b=kTQHVU0bpZYPKroMPjv6y78xV/6snZ6DHzneUBLVERu3DtZRvjpU/FYrmEcT8qombK
         BVdXn0Wm7BouKKZ8jsgpDceZcCvo+AXYhKzWEMt5onU9HS5HRZA2R5FjJVzwoGOBeQ0w
         aFDhgV6O+zuM7BEu3gUFUGyQ0PCpZqhG9i+DxX+E/l5farDku9r0xAq3jS/ZALdMWTvb
         pSJubGLKy458RbjnBvarQtaHeznQR2kC/DI33H4eoYLt9j4NySaJNOdOAAk8gm6HDgnr
         IuqCCU8PoDSGFI+Jcw9GIf04BC4X9R3aME9HWnenv5lHaIkafttu3UBhPoGSMp2VmpSW
         WPiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=eaJ9A311TrSfFnoNHlPLqCJLl63tuzS6qi1yW9Cp5w8=;
        b=qEpG8W+v1ZcqkPmXdc7I1dA//oeS79p92XOj/+91c5mtx0kf1VNHJPUrRQDiS0wFgE
         8tnbi4R2Nm5j1RtyADg6U+Q/6DKdjixqm+tgoxUZ2LHGIP7f6dSr1VjvR4vlkdXEzzmQ
         gIBvwPYW232yHNPy2k11i9KUQCn5NJy+ZGgy1uG6Ge145CEKczFKYQDlQBBg0Xze0xx7
         ettBuAr+oQXLYSqnph5zRyITp9imPaq00z5o3gZOeehqUifzeJm/AiGY1LB6g6qPNYlD
         XW0Pk3je9capnP0bXsmH5qClruf8G/QIq9vm8pjsY5T+bRvCmqEMBXyo9GF5KjI2rdia
         whhg==
X-Gm-Message-State: AOAM530N4lHuStUN2ZEMB4O/yYf4cgKT4b61q5mtcQaZUlJHRNB/OLEQ
	0RpYwh+xbL6KNJS9MXzZcrk=
X-Google-Smtp-Source: ABdhPJzxFval4Qok9pFwMRhEYeMibBtrQ4zyJ0h+CNNl8lq5obSDpSrDc91u949sx/WfmEzXFK7EQg==
X-Received: by 2002:a17:906:5352:b0:712:3916:e92 with SMTP id j18-20020a170906535200b0071239160e92mr6681677ejo.756.1654995925004;
        Sat, 11 Jun 2022 18:05:25 -0700 (PDT)
Received: from nam-dell.fritz.box ([2a02:8109:afbf:ed88:b802:84b6:a3f8:7c89])
        by smtp.gmail.com with ESMTPSA id u20-20020a509514000000b0042dd1d3d571sm2312297eda.26.2022.06.11.18.05.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Jun 2022 18:05:24 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nam Cao <namcaov@gmail.com>
Subject: [PATCH 0/2] Clean up some macros
Date: Sun, 12 Jun 2022 03:05:12 +0200
Message-Id: <cover.1654994517.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace some macros with standard ones. Remove some useless macros.

Nam Cao (2):
  staging: r8188eu: simplify some macros
  staging: r8188eu: replace FIELD_OFFSET with offsetof

 drivers/staging/r8188eu/core/rtw_mlme_ext.c   |  4 +--
 .../r8188eu/include/Hal8188ERateAdaptive.h    | 10 +++---
 drivers/staging/r8188eu/include/basic_types.h | 33 -------------------
 drivers/staging/r8188eu/os_dep/ioctl_linux.c  |  4 +--
 4 files changed, 9 insertions(+), 42 deletions(-)

-- 
2.25.1

