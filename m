Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8793FC5
	for <linux-staging@lists.linux.dev>; Thu, 16 Sep 2021 01:59:46 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id 5so2822229plo.5
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 18:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+KKjNgTcb83x5rVV1+cg4K4aG9dt6VBaDuCquyFpI4=;
        b=AiGJ39zGlrIJHe+lDVpNOwfJYc6FFyygQZamFYtDpw5NB4Tbkhjpi7/lrjwkiJ16Te
         lmRyrYR5ao2nOaGqoizsXfwV8LrhvC5XkECvJzPIFQkAGoOqe9h9LkiiF6PQq7T9TcYJ
         x/+SJZTWvWCr3Y6G8OQ2E98jnYYHOd3BOItO6ms0QrJVBf42C9m4E/ytTgaVtUWicJ/6
         kD1mk+3TtZ5E5GhqKYCMuheVlh79ZuX1rGUb3c6aGjn31LhQbFJcKl8RY7v4VtOx0xHa
         V4ky+BfNVD8lI9PbfDVVvV3i06H0sE/QobTnp2vI4uPaPTBxZp8NTyqPE2pnk3jlADUq
         UMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=c+KKjNgTcb83x5rVV1+cg4K4aG9dt6VBaDuCquyFpI4=;
        b=pyTsnTYZx236ypaUpW6j6kI3ZjtLHdDlVGOiGaFQnn84VPu1LdoyW0cq/fQWV+DatJ
         SMj0mKPVh0QSnBPqmbhMhCuM+G7yYVcT4amwVtVUfaPqwwWjFR5kcP+s4FX4IoYnsuN9
         xyQrww6/mr4oRgmwabh1LloyENb76NS67g6MSH/++pBb7gShklA23v/nYSksDOSnpLif
         WW2MaEEEkPtc8jh89WlLS3KiWiatw/ICefnkxc//lZSoPviLwo0MxEUyPnxiWn9FQRlG
         22VW3M3IESdc9OZSXZH36zNtMNsAQCRx0Ktk+9CGHBC7J3SeCVe/l7zDPTcNK1cT5kB1
         MmnA==
X-Gm-Message-State: AOAM532eHkan270z/QPqS35Ne00F4wpWYoYBnEFqvuE4yeL4TDaEmI1+
	WCJdaqur9pL4D8/cSGj73m4=
X-Google-Smtp-Source: ABdhPJwC5MoLDQY1gaFlXnxx4DR8DuPoS5ALH3jw8wlL2HPVqwC7g1ZE/zYITbpqFj708gJnI9jPQg==
X-Received: by 2002:a17:90a:6289:: with SMTP id d9mr12014197pjj.110.1631757585654;
        Wed, 15 Sep 2021 18:59:45 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id w8sm1057119pfc.93.2021.09.15.18.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 18:59:45 -0700 (PDT)
From: CGEL <cgel.zte@gmail.com>
X-Google-Original-From: CGEL <deng.changcheng@zte.com.cn>
To: Larry Finger <Larry.Finger@lwfinger.net>
Cc: Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	Nathan Chancellor <nathan@kernel.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Changcheng Deng <deng.changcheng@zte.com.cn>,
	Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH linux-next] staging: r8188eu: use ARRAY_SIZE
Date: Thu, 16 Sep 2021 01:59:36 +0000
Message-Id: <20210916015936.180990-1-deng.changcheng@zte.com.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Changcheng Deng <deng.changcheng@zte.com.cn>

Use ARRAY_SIZE instead of dividing sizeof array with sizeof an element

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Changcheng Deng <deng.changcheng@zte.com.cn>
---
 drivers/staging/r8188eu/os_dep/usb_intf.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/os_dep/usb_intf.c b/drivers/staging/r8188eu/os_dep/usb_intf.c
index 78c857d..c7de8ee 100644
--- a/drivers/staging/r8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/r8188eu/os_dep/usb_intf.c
@@ -261,8 +261,7 @@ static void process_spec_devid(const struct usb_device_id *pdid)
 	u16 vid, pid;
 	u32 flags;
 	int i;
-	int num = sizeof(specific_device_id_tbl) /
-		  sizeof(struct specific_device_id);
+	int num = ARRAY_SIZE(specific_device_id_tbl);
 
 	for (i = 0; i < num; i++) {
 		vid = specific_device_id_tbl[i].idVendor;
-- 
1.8.3.1


