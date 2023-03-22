Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60196BA44
	for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 22:07:24 +0000 (UTC)
Received: by mail-ed1-f46.google.com with SMTP id h8so78887013ede.8
        for <linux-staging@lists.linux.dev>; Wed, 22 Mar 2023 15:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=seecs.edu.pk; s=google; t=1679522843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JVG2u0PxjcHnMZyDP5cFJRBQ+0w73Zdls1zxTkcKhxE=;
        b=4BllPFkRTczeJDJcUxBJ4nsD6E4yo6yZMqI5ufh32vPtKvfVCk57nb7nG3lnCd7pLg
         IZf1khqXXszZgb3ZKun7cZ0SEvW0V1Km+MTlbTlLMA+9NCZLXTAy42vqSW3yCafM5wrB
         rTfpNxBxJLw2I1H/aKLoXRpLnMGIpUpdCB4yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679522843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JVG2u0PxjcHnMZyDP5cFJRBQ+0w73Zdls1zxTkcKhxE=;
        b=Dl1S9B71N3fw6eENM9b4+RKHp9jr0B13C8+hA+oZ4iPttLbjEYjKMbwUeSqfrpXJax
         Ky6FcuYSs/sGb6gzty4k7yLREhMmkTzbrq9ZIY6Zxf6AJrIJ8JWR2He6Q2/patv7GO70
         VRkRqM3jakYFJQKf2oK0vLJlMiZ3GMUvadzwgSrtRz/6O0Pg5ImOkB+1XV2dohhvaId+
         fkU/cVGWlu3BkWt1jSpPurnrR5Zkv2WLZtsKrFsyMPXvjTBAUtSkhgBPBxjLcX1jltMP
         ZVnYUzg2ph3Yyh/IEGnfbBshVXMvQWXpFj9zvSKgw7KYpnSfqXApMBbRAaKM8w1TKU1R
         cx2Q==
X-Gm-Message-State: AO0yUKWJeD8L3r/t1O9C6BR4JkCKz9szWqKprjOjzS6NNreWtb/uV25g
	BR5D1osE5wP8N9v7tmzXCct2oQ==
X-Google-Smtp-Source: AK7set+SkK/C2Wqx91jsFrtmCMtKRHhrbDLMipKVjE/mmH6XsanIVqmWwvsaMF1HoLCV4+Nj+3O/5w==
X-Received: by 2002:a17:906:4f8f:b0:925:5705:b5b8 with SMTP id o15-20020a1709064f8f00b009255705b5b8mr8138114eju.58.1679522843190;
        Wed, 22 Mar 2023 15:07:23 -0700 (PDT)
Received: from khadija-virtual-machine.localdomain ([39.41.14.14])
        by smtp.gmail.com with ESMTPSA id v19-20020a17090651d300b0092b86d41dbasm7787935ejk.114.2023.03.22.15.07.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 15:07:22 -0700 (PDT)
From: Khadija Kamran <kkamran.bese16seecs@seecs.edu.pk>
X-Google-Original-From: Khadija Kamran <kamrankhadijadj@gmail.com>
To: outreachy@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Khadija Kamran <kamrankhadijadj@gmail.com>
Subject: [PATCH 0/4] staging: rtl8192e: code cleanup patches
Date: Thu, 23 Mar 2023 03:07:00 +0500
Message-Id: <cover.1679521517.git.kamrankhadijadj@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix several cleanup issues reported by checkpatch.pl in module
staging/rtl8192e in file rtllib_rx.c

Khadija Kamran (4):
  staging: rtl8192e: remove extra blank lines
  staging: rtl8192e: add blank lines after declarations
  staging: rtl8192e: add spaces around binary operators
  staging: rtl8192e: remove blank lines after '{'

 drivers/staging/rtl8192e/rtllib_rx.c | 73 +++++++++++-----------------
 1 file changed, 29 insertions(+), 44 deletions(-)

-- 
2.34.1

