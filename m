Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E036D622
	for <linux-staging@lists.linux.dev>; Fri,  9 Sep 2022 05:31:09 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e17so895348edc.5
        for <linux-staging@lists.linux.dev>; Thu, 08 Sep 2022 22:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=rFLYto3K2CmPKXSaAwZZF63wiwFYIhCIDikeGhcUnes=;
        b=Vh+mhSWgZgTLphVA7O4Bl/hkzzn+QFBX+c6TpP67Jvhxve+3ZvMEsnRGarb9hn4QnI
         gR3sKN1N+9CcKQsENky2g3dZmQPaNajPmTLnUmxo0DQMMv7EGIxLlymkU33pn+UlsXBI
         eneOP25O/x24rccf9CwVkHaTE/axO56ileDjfRlC1dk5sU4OWUipKuxvbg2vSLEwjm6K
         JM7CIiZNbqusM3B6IZZF0njS6sndC+VpI4F23c6BvXP/w7/ymQOtnfLn7Cz9UOylkpLp
         5uFuS3PppUMN3Bf8pC72ptvsULZOPHRtkQWiaoeJnwxTG0f5wGTA9fS4Bpwg9Yhjt/8b
         7DJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=rFLYto3K2CmPKXSaAwZZF63wiwFYIhCIDikeGhcUnes=;
        b=NHpulu5Wqx25c0wy02KuWr90CaYum5JvBkB3yX+cPyO0C2SZBWN+ZcYkvhXTH7chJA
         8OlzJoI4OMjUttNqIsHf4cX8DKPUt32nHiYbh3np2ByxUO3YyQKYgRnWXblZLuEA/3JL
         gwZre7XlHfJr4sI+53xpgN6kstRWlTowE9rvLNw8EnwkdUnPUUicoVs6yZMblD91iSFI
         qIsMdG08A+UoMGxhz4Q6n7a6bTuYyu/uJilj3twdBukTqBc2FJegWtmOmTfCtxPfg9ex
         PzW80EyHVd0XwRkaiKH/Wn7CfnmE96WChoKG6WyhsapShnQe4jZmNfMTEQAFGgmXVm3r
         VdWQ==
X-Gm-Message-State: ACgBeo3ASk0vS5vEUV5Fg1aQqmSJdJaPlfQXHfNYBpogk+1DsNzvrdjF
	dPdB10M2FVEEym54I559d/s=
X-Google-Smtp-Source: AA6agR5iOqgAL3CEJpA6vw7nmX1vYQnQX4bL/IqLhmfPnASR2l8FZA7WUpKLDWc48uWUwD9jd0kWdg==
X-Received: by 2002:a05:6402:35c5:b0:450:4b7d:9c49 with SMTP id z5-20020a05640235c500b004504b7d9c49mr5636435edc.149.1662701468058;
        Thu, 08 Sep 2022 22:31:08 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-83.ip.prioritytelecom.net. [217.105.46.83])
        by smtp.gmail.com with ESMTPSA id d16-20020a50fb10000000b0044ee91129f9sm369370edq.70.2022.09.08.22.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Sep 2022 22:31:07 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: forest@alittletooquiet.net,
	gregkh@linuxfoundation.org
Cc: namcaov@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH] staging: vt6655: fix potential memory conruption bug
Date: Fri,  9 Sep 2022 07:30:39 +0200
Message-Id: <20220909053038.33188-1-namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A line of code is attempting to set the entire struct vnt_rdes0 to
zero by treating it as unsigned int. However, this only works if
sizeof(unsigned int) is equal to sizeof(struct vnt_rdes0) (4 bytes),
which is not guaranteed. This may cause memory conruption if
sizeof(unsigned int) is 8 bytes for example. Fix the problem by using
memset instead.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 8e2a976aaaad..a38657769c20 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -867,7 +867,7 @@ static bool device_alloc_rx_buf(struct vnt_private *priv,
 		return false;
 	}
 
-	*((unsigned int *)&rd->rd0) = 0; /* FIX cast */
+	memset((void *)&rd->rd0, 0, sizeof(rd->rd0));
 
 	rd->rd0.res_count = cpu_to_le16(priv->rx_buf_sz);
 	rd->rd0.owner = OWNED_BY_NIC;
-- 
2.25.1

