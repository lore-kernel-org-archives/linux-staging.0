Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9561C801;
	Mon, 18 Apr 2022 12:02:01 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id n18so12173404plg.5;
        Mon, 18 Apr 2022 05:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gKolG0XQSgiHwIBW1X2xlM9KdTrIkpbhaF1LVD8QWbA=;
        b=WwtsObfUy3X8kQq0ag32kuwqF0SbNvHSCJvveICT7tu2BXjLQIKdonv4p5+9reTdhZ
         EFmjjmCW7RwT5lMWrQyHk71f7rcJfebUf2xt2S2ZY0nMGlaafG50NPJeKbwUw89hw6I0
         D+Mc+KrjBDsD9Guc6lKvgGr+Z7TOsUeVosxRLRuWcGTilmmUN1ZDMk1pQXhI41CJ28sP
         Q27U2h34lIvrVloq0VZSHKRyRonSkF7cW3q6MwZccl1O5hHfSxvYrKuD1vU3fULJs2tY
         LuXYJjLGpLw42XGk3EPoiJIjQXHNpHr4pJm+ZPMXgaF9U36EcU8cXGubtibttECwZZZx
         sIkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=gKolG0XQSgiHwIBW1X2xlM9KdTrIkpbhaF1LVD8QWbA=;
        b=vc2pBhqArXU7v8YvvTQ+lW+MGGXBx3m9S1UVrYkvs42Ix0ybn78DoIiZqyX6yP7a3Y
         eekrHdBXbtI6ysfgNzPTv+gGmzCONxMJT1zB/3eQ93xd6JlAxNszDpXXjNVGNXVse921
         D/aVSb8ZeBwNt+9Un6mYY1BkvCS0dFQyeFRGtetskoLaFx+vIq5XOJJBjRA9xxO0Lx58
         7Xuaoqi3muRxMth4fxnZD9s5TQOxdIDzN9FKw1kAeuZRWbMdBbIIW5Crt8FpvXGunrn2
         1oOVKbyhfppJqZtwhAVKRKoplF5KBVQaiclkDk8OrnqSvew5yD7XlnpP5iCBbubbryMO
         v+Zg==
X-Gm-Message-State: AOAM5319p59rnAf6wTH1yg8PN2OimuLjEB4gjRt6YoMRrmG7J/cj9s0R
	0RPTzLeBa16cWbaxouMvOlI=
X-Google-Smtp-Source: ABdhPJznztowHDMO7det1bQWcePkzjntiqWp8qdvE06Y1zne+ZhGdDMSAsjRmM3tkaSmemAsn7L3ug==
X-Received: by 2002:a17:90b:4c84:b0:1c7:7769:3cc7 with SMTP id my4-20020a17090b4c8400b001c777693cc7mr17887207pjb.73.1650283320894;
        Mon, 18 Apr 2022 05:02:00 -0700 (PDT)
Received: from aliyar-HP-Laptop-15-da1xxx.domain.name ([14.139.241.88])
        by smtp.gmail.com with ESMTPSA id p1-20020a17090a680100b001d28905b214sm3840628pjj.39.2022.04.18.05.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Apr 2022 05:02:00 -0700 (PDT)
From: Aliya Rahmani <aliyarahmani786@gmail.com>
To: clabbe@baylibre.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Aliya Rahmani <aliyarahmani786@gmail.com>
Subject: [PATCH 0/3] staging: media: zoran: fix warnings reported by checkpatch
Date: Mon, 18 Apr 2022 17:29:46 +0530
Message-Id: <20220418115948.5456-1-aliyarahmani786@gmail.com>
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

Aliya Rahmani (3):
 staging: media: zoran: use seq_puts() instead of seq_printf()
 staging: media: zoran: else is not generally useful after a break or return
 staging: media: zoran: avoid macro argument precedence issues

drivers/staging/media/zoran/videocodec.c | 9++++-----
1 file changed, 4 insertions(+), 5 deletions(-)

-- 
2.25.1

