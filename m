Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E99F3FCF
	for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 20:05:50 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id t8so10538268wri.1
        for <linux-staging@lists.linux.dev>; Wed, 22 Sep 2021 13:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=h02ebF9jZHXus7OiG53g7IHFMhzwY9WpWKsUgRjOpGc=;
        b=Br+1p8l3gtJLYoNGQpSYGdovnlINhFz5cwseq1GTVAr9GhkHUmzJNJ/aCOBiqub+8o
         OtvfoFsalp+/fXRxfK0jRfzXc9+xYPs6HjmcR5CP4IatUjgrGx2+3lBw4k3rjVs6VIE7
         qxLPY3hdzcw7vrnpD5Nar6c1116zBg8ehe47A1CBhNR5AFmQ6PJYUqTFEttPnW0muN77
         qIJLRsF5mGw2thLluUaqMP1vrLyiB+sRcNfSQGabTWAYygfzI8l8AirH+o9Q/j2Yt46/
         xMvcIRkHCJ4t9509NbD/uc2/4w+JpcfZMWBT0WKAXv3NKE6w3HRg2zXi6A9tQTY5CVAe
         o9/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=h02ebF9jZHXus7OiG53g7IHFMhzwY9WpWKsUgRjOpGc=;
        b=Nn/r/K90AeGZmpsjTvvRttmwxLVJ6JHdOYRH4NE9Chxkd0TfBY6lGvfjm6WlAjAPIY
         98RrsKqniV9yTpdF+5Um9ErvW0fIqCAhlWXLQGqQntiYrLmR7yiCKHPZ4kBZ6FkxBW6z
         twX8oNF8gI2uAPPQp+2XWBHmNoxzc1bn1uJe7d/LnS3t9t1eQ7o23w1eF6zgbxJywqLW
         ty4cgExAUQvhUi7/gdaLYO/u0nFpHEgLJ1+jRxWY+vzwYMhaFfetWyG/diprEN736SXt
         si3SGbIEMzyzV4viRy+Xa525GLw8B+1ukMqhZa+A+8+mbZbqtzOl0H3JkNe+Y2wP/E3D
         htoA==
X-Gm-Message-State: AOAM5306TGOxIJLllhg8e9kUoXq0k2YXFKxyZOyl8+j1SaGPt1dZdhf0
	YyzVK+akKku/RqiwuFlswnqlUVhVxTvjew==
X-Google-Smtp-Source: ABdhPJzb/9yJP0bPTfIVD5ASzrBHmRQpZrZZq/vw+ijxmw+O6O1rujP/n8LyZbmmT46efSPNJZhupw==
X-Received: by 2002:a7b:c7c6:: with SMTP id z6mr12443599wmk.34.1632341148965;
        Wed, 22 Sep 2021 13:05:48 -0700 (PDT)
Received: from localhost.localdomain ([2a02:8108:96c0:3b88::cde])
        by smtp.gmail.com with ESMTPSA id e2sm3219761wra.40.2021.09.22.13.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Sep 2021 13:05:48 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 25/47] staging: r8188eu: remove rtw_atoi()
Date: Wed, 22 Sep 2021 22:03:58 +0200
Message-Id: <20210922200420.9693-26-straube.linux@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210922200420.9693-1-straube.linux@gmail.com>
References: <20210922200420.9693-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Function rtw_atoi() is not used, remove it.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/osdep_service.h |  2 --
 drivers/staging/r8188eu/os_dep/osdep_service.c  | 17 -----------------
 2 files changed, 19 deletions(-)

diff --git a/drivers/staging/r8188eu/include/osdep_service.h b/drivers/staging/r8188eu/include/osdep_service.h
index 86140ca3a115..b9b87f2317a1 100644
--- a/drivers/staging/r8188eu/include/osdep_service.h
+++ b/drivers/staging/r8188eu/include/osdep_service.h
@@ -155,8 +155,6 @@ s32  rtw_get_passing_time_ms(u32 start);
 
 void rtw_usleep_os(int us);
 
-u32  rtw_atoi(u8 *s);
-
 static inline unsigned char _cancel_timer_ex(struct timer_list *ptimer)
 {
 	return del_timer_sync(ptimer);
diff --git a/drivers/staging/r8188eu/os_dep/osdep_service.c b/drivers/staging/r8188eu/os_dep/osdep_service.c
index bee6d42b8738..489a7d33b212 100644
--- a/drivers/staging/r8188eu/os_dep/osdep_service.c
+++ b/drivers/staging/r8188eu/os_dep/osdep_service.c
@@ -19,23 +19,6 @@ inline int RTW_STATUS_CODE(int error_code)
 	return _FAIL;
 }
 
-u32 rtw_atoi(u8 *s)
-{
-	int num = 0, flag = 0;
-	int i;
-	for (i = 0; i <= strlen(s); i++) {
-		if (s[i] >= '0' && s[i] <= '9')
-			num = num * 10 + s[i] - '0';
-		else if (s[0] == '-' && i == 0)
-			flag = 1;
-		else
-			break;
-	}
-	if (flag == 1)
-		num = num * -1;
-	return num;
-}
-
 void *rtw_malloc2d(int h, int w, int size)
 {
 	int j;
-- 
2.33.0

