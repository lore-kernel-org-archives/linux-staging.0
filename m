Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE1772
	for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 11:33:51 +0000 (UTC)
Received: by mail-ed1-f43.google.com with SMTP id c22so10122739edn.7
        for <linux-staging@lists.linux.dev>; Wed, 28 Apr 2021 04:33:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRL7LAkBzsLUShMKaYemtSvs+IVP4TH25c50jQgyGbc=;
        b=H22f8cenNNUgyJ6uU1FRqxyvANwieddNRC0SaSE9AWvvRIu/qY9xgul+uvp/EZ1jab
         6OxfuFXHEtQvscV9yZTCaK3gyXP3Us4OXlyRDmnPwCPvj3+jonhU78rdVHGuSY78FyIH
         icOWJ0nSmxenTalBCqaBaft4/j3eLuqK44WiMwPcIgCpX7qXVAhO8q8xkGk2vu1PjqJU
         Jl7YRdTUbtnxjLgAKXfYt7EuvXU/+qImrFu32lNNe4HYl/BtGIsPibtE5lU2Wc1EhTBA
         dJcgQ+XtQaHnsCPGbzk6N0fesutFyOHwAOUOhZqnt4WjgRPp1citkMhU5TgFHeNtXyFo
         2FrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=SRL7LAkBzsLUShMKaYemtSvs+IVP4TH25c50jQgyGbc=;
        b=Qk9dG0r8UW6gZuiBxshIw46Mygk5tdELYtlaOEDIgK1HryuuOsnejzPlGcqVrFISqI
         W5RCrACNN3YqhngFk7e8PA3JV8eQ482K9DHAWGkhbeJrYS4HJdweShWfeATZwTTCqtHQ
         d/qAomdiHr7XFOEBQIo7mQIabCBNvMWfYvW+X0PasX4p+lyvynXZt1kmfCDikrRZOjoX
         w2Cc/3TTwWF9P+ZTjr8CvzeZobjC3gFyl1peBL0C5RJj/g9KB3lcBzLa0gCcQbI1kgBz
         vy1sgUXQGIRSJtAEpuvA/xOAXabPW70DCfJT1I9mYuI8J72gS+e3HfI1yOviD1j9qCUw
         UNww==
X-Gm-Message-State: AOAM533zqlLvxYRwHTGDEDpSwccFpBK3Zzg58teQNX1yM0yfco1rW0Db
	jukYYcRjA8sHkghACMA28g8=
X-Google-Smtp-Source: ABdhPJzYnYVJv0HaNf5CJzsCVTYjnZ6cQLmgLajSsTiPi+o3b8ZVk3e+EHb2xL0Yu+Z4JXatJuuM0Q==
X-Received: by 2002:a50:fc99:: with SMTP id f25mr10711029edq.147.1619609630443;
        Wed, 28 Apr 2021 04:33:50 -0700 (PDT)
Received: from linux.local (host-79-52-107-152.retail.telecomitalia.it. [79.52.107.152])
        by smtp.gmail.com with ESMTPSA id u19sm4677187edy.23.2021.04.28.04.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Apr 2021 04:33:49 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: outreachy-kernel@googlegroups.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [Outreachy kernel] [PATCH 0/2] Removed set but unused variables
Date: Wed, 28 Apr 2021 13:33:44 +0200
Message-Id: <20210428113346.28305-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.31.1
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removed set but unused variables. Issue detected by gcc.

Fabio M. De Francesco (2):
  staging: rtl8723bs: hal: Remove set but unused variables.
  staging: rtl8723bs: core: Removed set but unused variable.

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c     | 4 +---
 drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c | 5 -----
 2 files changed, 1 insertion(+), 8 deletions(-)

-- 
2.31.1

