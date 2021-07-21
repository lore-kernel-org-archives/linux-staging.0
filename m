Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32DD72
	for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 13:37:35 +0000 (UTC)
Received: by mail-ej1-f42.google.com with SMTP id ga14so3299012ejc.6
        for <linux-staging@lists.linux.dev>; Wed, 21 Jul 2021 06:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9AQiL5ZkIL62kHnV4W3WVuoAjYbuzEncbnDSFsmO0kE=;
        b=Qq96oe50Klfxs2PwMji8or0xoeD3j3nEBXvlcrkiHBIJlyo0aiwnVa8JyEdkc/ddRH
         QuKkpYNXE+q8wpfAn65stNV9qTFubo/nz6sP8llH26quObI2QeCiW1bVIalgPunkuC8e
         fRm2JeofSnHCuLHjcM/2PHjTQo+Lq9kCT83uzX4Zqf9cTpbvVTATqfpchPbb2aOXbgK4
         7uZ3v42hlZ0AYgGqZxaIeRhXx27yQv6ET4Zu1AxlJ3ewebKaHRr8tjwGdPbukRZuVmet
         i5IO2ytV58VJGfq8WR/3CLJgM3UCMWJNl91soqDCKpm+HQbUga7w8RFx9DfALO6TCEi7
         z9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9AQiL5ZkIL62kHnV4W3WVuoAjYbuzEncbnDSFsmO0kE=;
        b=CXSB6j5trgEeKegEg7Ld+n4nL9Qemh9Yw+ChK/QUXbGlFWxdS8AY/O+3vWyPzl4DRA
         rcG1e9aJPQofelO90HSOzz2a+9P5+imwqYHpTvuwByPvC6I5pEmsq7AkhSCQOwkcrbvb
         Fy7Kt8QLZEvKU3Mpz8OqNfK1svYKwn/4NBgbRqxVAJJ8zrf4091KPZoNAkU2oLoZB3Mh
         Q8+kNEYKCApBrLdDE06WiNiutnNkic4Q9Y8ONYMHWMeF9vZYZPh4KOh6WpStVKqO8Q3Q
         TJWsDmdtAfPV/Pgo4Wq3ECBs6oS3iMhzN5a1KFFpsPgKXFAWQw6AOR/sNKHgmoQbamn2
         rxWw==
X-Gm-Message-State: AOAM531rUGIkB4H8vWlVCyRkndJmg5OXTdbb0ECV5s4ZNc7tgwjkQSJB
	XOIR6AVMjETN3/xAaWXypH8=
X-Google-Smtp-Source: ABdhPJyRW7rpjdTPux/kZe5WHfclLwc3wEiSET/6hna+eVumWUg7NFkcjRyqEUhW0F8f/aQCasYqew==
X-Received: by 2002:a17:906:4b43:: with SMTP id j3mr25016430ejv.524.1626874654266;
        Wed, 21 Jul 2021 06:37:34 -0700 (PDT)
Received: from agape ([5.171.73.45])
        by smtp.gmail.com with ESMTPSA id c17sm10676975edv.6.2021.07.21.06.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jul 2021 06:37:34 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/16] staging: rtl8723bs: remove commented out condition
Date: Wed, 21 Jul 2021 15:37:13 +0200
Message-Id: <83762719c0c13ac8b78612a32db26e691eef17d1.1626874164.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1626874164.git.fabioaiuto83@gmail.com>
References: <cover.1626874164.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

remove commented out condition checking channel > 14.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 8af81c4ff8db..060cdd7b2925 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -159,7 +159,7 @@ static char *translate_scan(struct adapter *padapter,
 		start = iwe_stream_add_event(info, start, stop, &iwe, IW_EV_UINT_LEN);
 	}
 
-	if (pnetwork->network.Configuration.DSConfig < 1 /*|| pnetwork->network.Configuration.DSConfig > 14*/)
+	if (pnetwork->network.Configuration.DSConfig < 1)
 		pnetwork->network.Configuration.DSConfig = 1;
 
 	 /* Add frequency/channel */
-- 
2.20.1

