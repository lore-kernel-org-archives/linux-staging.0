Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8474B126
	for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 23:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=darkphysics.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=darkphysics.net header.i=@darkphysics.net header.b="Cxa/0nLu"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-5bcfc508d14so2135629a12.3
        for <linux-staging@lists.linux.dev>; Sun, 17 Dec 2023 15:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1702857323; x=1703462123; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+snDZLy8asIzjWt/vwGJS1mTnyKPWwo7tBhs/9ZgD6U=;
        b=Cxa/0nLuvSl367aQBqIPGyO6ZqGtK5Cir2aalmKjbIMkSwSWfyUJ8pUhytq48EIGDm
         Swbs5838+vuHJW824uT+2GV6UPdzjnqPD6X7pwdcGVUIV0ngkMnPfK/j7GPOBqKEFFnd
         wqkMlfggXNJJ1jKE/TrOuEVteb9uRH4GfmY7m5YBV3boUDMwautaUXrOooFYBH38KXxn
         PYZgIEHz2ihUgwhf7KkBgMPc0Mx4miA106prqGmGD5bjrOeWok8TfydfRbj5erg0Rhcr
         pViJ5vzMkNjqL5UcWuhF0gTlHlCzJyWCXzrFGEyuhrWvetK7/6bV9mI9TZ16IO0evj2S
         6kiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702857323; x=1703462123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+snDZLy8asIzjWt/vwGJS1mTnyKPWwo7tBhs/9ZgD6U=;
        b=Hwq+u3bhwcAiMzJN9m6Fl5WoESG6ndU2C6z9DyfXGWOuAMLYST7vYoEZuV91Tq0ybf
         6Hi7UXnWJM0e34F1CI3OAV4Tx7ShSqhoOGnJtREQFWfT+4yqoRCBTf1okXPo76sQSr1O
         +FiVoUm/Ws7X5919823A6VJ5dlkqkV2anz0zKkDVONYJdWupdBXiwvY40OOpYhobM3Be
         EH78URApH1OupI9MvyaJlxHKzoHJAhVntb+whxe44Fe5jTbI2YHrn/Tsvi8JI0zC6vhi
         oOunHo3RxTyZkhZ3UmNlzQgB8JZcCSxrKUXRA3IzrZuRJE+ofvW/IamEsx0CJO8oRP4W
         BwPA==
X-Gm-Message-State: AOJu0YxFAENFkQQBjd3g3kX/M8/HG0a0Ql2FLSB4hwy3+qznty66cJ+W
	bms9LEZjD19CKtWe+3W3/e5sLQ==
X-Google-Smtp-Source: AGHT+IEhhHmfErk1tQPNZa/a/PRZEl+UUQTMCyLJSO6YlKgJZLduDAp6OmhQQ3j3jweGGeuHjKHm1g==
X-Received: by 2002:a05:6a20:3d87:b0:190:cc38:7d7c with SMTP id s7-20020a056a203d8700b00190cc387d7cmr17446543pzi.44.1702857322824;
        Sun, 17 Dec 2023 15:55:22 -0800 (PST)
Received: from oatmeal.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id f11-20020a17090aec8b00b0028ae8284840sm9036176pjy.10.2023.12.17.15.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Dec 2023 15:55:22 -0800 (PST)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH 0/6] Staging: rtl8192e: Rename 6 variables to Style guide spec
Date: Sun, 17 Dec 2023 15:55:14 -0800
Message-Id: <20231217235520.30377-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set renames variable to fix checkpatch warnings
Thank you in advance to reviewers
~Tree

Tree Davies (6):
  Staging: rtl8192e: Rename array variable RxTsRecord
  Staging: rtl8192e: Rename array variable TxTsRecord
  Staging: rtl8192e: Rename variable ucTSID
  Staging: rtl8192e: Rename variable pDelBaParamSet
  Staging: rtl8192e: Rename variable TxRxSelect
  Staging: rtl8192e: Rename variable pBaStartSeqCtrl

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 42 +++++++++++------------
 drivers/staging/rtl8192e/rtl819x_Qos.h    |  2 +-
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 36 +++++++++----------
 drivers/staging/rtl8192e/rtllib.h         |  8 ++---
 4 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.39.2

