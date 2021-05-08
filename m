Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4372
	for <linux-staging@lists.linux.dev>; Sat,  8 May 2021 12:21:24 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id z13so16621505lft.1
        for <linux-staging@lists.linux.dev>; Sat, 08 May 2021 05:21:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=04cgrkWh50flqZpRh37baQFAIaC4WlfO0T6oXLED7ks=;
        b=mExExvHoG8jNOehgnXXg0lQ2Y7jCePctD8KnPz4fksYeeg24T0xXYp1+pCQAbXbMJ6
         dbGpEJBUECwthAvx3d9YIH6KPvL3vGBUo/NWc1baxesdpdqoUNc3rwDBH455x0nMJRbH
         ngGDI+EUMZUVRO+UCj/msTEoPTXv7t6fSHC9jdRP/qaF2GJdBQWiUSG/UTrUbETJaOZS
         bxitWoIWcfIF0qhJOiZrgcS+mmjxvSGckcP68D6B6yJqNZ9HYBtU9ZobBguRHdjAEMZp
         O8Jt6kdK58fvWL0mfcDSKtnMm0gAgOkJD+JauC1TvPLDQPQS5BjydGWx2uTHIssG1DzQ
         eybA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=04cgrkWh50flqZpRh37baQFAIaC4WlfO0T6oXLED7ks=;
        b=dUw+XMUGwwjYbkBM8D2rSN0rNLUp1oBFz7UrCnZw88c2IPADvRF6SY7tldO3hiQ00C
         w4cS4NnEB8EV7dYbqk1sPNJUwW2/37wx9+l7SxtV++7ADBnQdRJVyU0of9z3DTjkt/Vr
         lKbaClpDkwRelVZKpJnZpcHYp+OOrxw0omhLQGGk0JDL1t07T9J23M/1jm+EFDJZwPlW
         uECEKJWjfZvJe8HB7P8p8YZGU+eIwrhWAQeNVm5uUe+YOGJs3j8AA6yl0BcqOtY7XUt9
         XGuoYthjw3ab/xoK7nV/TSXbsARmj60xAobQUZtnYGDoQF6nggGSY7a9BgbYem0gEPE3
         IMog==
X-Gm-Message-State: AOAM531SQ8ic1nJnuvIy3HUEL7kSk1L1wUrPgxWu0/TtrRcrdtDra+ef
	yJGM6DA5nYoNUNwgav47gW8=
X-Google-Smtp-Source: ABdhPJzPNFgLMWYqVx205XcNshsO4fb+1wFy+XgJ4uRekQG1wGH6SIr+SADaI6l/hmdiIF/ZNgCruQ==
X-Received: by 2002:ac2:5497:: with SMTP id t23mr9953657lfk.52.1620476482679;
        Sat, 08 May 2021 05:21:22 -0700 (PDT)
Received: from localhost.localdomain ([185.215.60.119])
        by smtp.gmail.com with ESMTPSA id u5sm1627354lfk.237.2021.05.08.05.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 May 2021 05:21:22 -0700 (PDT)
From: Pavel Skripkin <paskripkin@gmail.com>
To: mchehab@kernel.org,
	sakari.ailus@linux.intel.com,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pavel Skripkin <paskripkin@gmail.com>
Subject: [PATCH v3 0/3] staging: media: atomisp: code clean up
Date: Sat,  8 May 2021 15:21:16 +0300
Message-Id: <cover.1620475909.git.paskripkin@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <YJZuviLa3SRLWASk@kroah.com>
References: <YJZuviLa3SRLWASk@kroah.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series includes code clean up for input_system.c.

Changes from v3:
  Removed returns at the end of void functions
  Split all changes into 3 patches

Changes from v2:
  Removed useless returns

Pavel Skripkin (3):
  staging: media: atomisp: remove useless breaks
  staging: media: atomisp: remove dublicate code
  staging: media: atomisp: remove useless returns

 .../hive_isp_css_common/host/input_system.c   | 62 -------------------
 1 file changed, 62 deletions(-)

-- 
2.31.1

