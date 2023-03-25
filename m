Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328BA2574;
	Sat, 25 Mar 2023 12:13:24 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id e18so4182879wra.9;
        Sat, 25 Mar 2023 05:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679746402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ioX1KgKROFiDWyqlsJs6XqlB2RrAlll5N2zukuaEs8k=;
        b=XJPwToHJkrPaj0nwPt2SyRVtFB7FXDH/Z3auEPO+Khwe0rEKQcCueB+nayuCztsgCA
         +KQuHvXruHkxtxhVBDozej0ZHpELqK81gVgsSCTFmkU4jHPDtz43nsx3LDeVy945pG3/
         q5zt0E+RDieYgCgvsXMKcB3QdKrDgGlH33J54m7L/g2SfPAi572ZdhDue23MgGeWlH4P
         rImFNc0OHQ3mr28VGhm0TCkcH1jOdof2rP9kQzP8MrIQVS9Gv99JMhEYDTS84OoNrdUl
         yG487ffsbhBWK8HBiYQO+kJnieLpcl3owxnLSSm7n0IDDsyg9GKibN4habR4uhEjAYDw
         IgmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679746402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ioX1KgKROFiDWyqlsJs6XqlB2RrAlll5N2zukuaEs8k=;
        b=igbM63UDKSwJjGMA1i+aUbr5upsQCymMEfymfBEi4PSh+RZkn5fz1PgQljvKmlIBJN
         v6hQFI9jXPhUf/G1ylAb6gTFPYOjMW+Gwsqi0TxKxIk2Ngz4IHIT4+H0e0XyTy7Ijwog
         mQumbY+SdjHESNOysY1oMA/SrblckrEz/3NMWihvLi0aa1hPYEpDojOMh9wAtkA/urFH
         Q1lm0q/88eO28s+Iz5SfLPLhZPN68RZKBrM+VKuVHCsKmbTLKb0kKTFgBnQzQ5dKdP6J
         jCTCXCkUOh3sqAL9FTHqcy0TXo5518SqQ8eyh4BJIe08EeCd41FBidj1naJVt4IlX+P/
         pT1Q==
X-Gm-Message-State: AAQBX9fs4KpssF01Q5EFwx8rye8M0baIP4/0qAUhsmax4rhnpZfhjlpH
	IUNTsU43M7IKx/1LcNVISEEaYc5RP8UTFA==
X-Google-Smtp-Source: AKy350a2jpGdQ3Z51auHp3Gn/TpH4pAwCSuQc9o1Km/85xtDChsyfUsE2XLnWZKHa4h7BAMCM/Od1A==
X-Received: by 2002:a05:6000:1206:b0:2ce:a8e9:bb3d with SMTP id e6-20020a056000120600b002cea8e9bb3dmr5177954wrx.4.1679746401969;
        Sat, 25 Mar 2023 05:13:21 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id c10-20020adffb0a000000b002c70c99db74sm20504791wrr.86.2023.03.25.05.13.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Mar 2023 05:13:21 -0700 (PDT)
From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/3] staging: rtl8192u: clean up comments in r8192U_dm.c
Date: Sat, 25 Mar 2023 17:13:15 +0500
Message-Id: <cover.1679744684.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Clean up several comments in file r8192U_dm.c

Reviewer feedback on a previous patch suggested additional cleanup
comments. Link to the previous patch:
https://lore.kernel.org/outreachy/ZB2a5zwYpBZ%2F6qwU@khadija-virtual-machine/


Khadija Kamran (3):
  staging: rtl8192u: reformat block comments
  staging: rtl8192u: remove change history from comments
  staging: rtl8192u: remove code from comments

 drivers/staging/rtl8192u/r8192U_dm.c | 199 ++++-----------------------
 1 file changed, 25 insertions(+), 174 deletions(-)

-- 
2.34.1

