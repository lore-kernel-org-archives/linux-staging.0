Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2889F7B
	for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 07:06:54 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id a17so5206286pls.6
        for <linux-staging@lists.linux.dev>; Sun, 19 Jun 2022 00:06:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dBOTVmXLQ2WKVyNjwokSzfRoYEMv13f63lC25hv8tCg=;
        b=kv/n5h+HsLgab5rbqx8L5hyByiAvtbnjwWOvatO+vB/+cfMeU41JwNbGrphOvQY87U
         EtL9oILYzXCf8KhKs12s8XVUVr1F/aw7Oegnp6LaGgbetuisKUGGjNJ1KadzbBoH5yvO
         QveX6/c0nAUaY0rVzcFetLONb/NUCqwoJlzxr60OW3YfqZAd2yaDdSiKex52TwkxB/jp
         jbf0qrImyyYswFdFAFXgtKL0b9847i+rFSUP0QJ/msh213xnwiktOOPXwLg0/5vyS9yx
         k2PfzOX7WM3agoCkkNHP1OnNeoLcxa4onWEHrVPDD1tgx0tcfAPmDj7DccTcoLDzC0JR
         horQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dBOTVmXLQ2WKVyNjwokSzfRoYEMv13f63lC25hv8tCg=;
        b=DcOhLLRHrtgw1+nNdjqvEWFbi7Xi/Swh2NGVCjoM409FV+LRkkZw6WpMApXouqSbYT
         aMmQo+ACBcrLOC3rzcdxFAJPFC42/lfpsrwZ4ujJ48l8Yjr2YByNJOWbSYIleO+p+Pgl
         7/M0LquriQ6PvhB3s5z4jFIH298OdX9F6rSsB99L6aB+BAhjJqhb1Q7N2e2y1qgzSqAO
         FwJHm5zY9QusUnRA/PlsuqtXI8e4M4lqW5oOaOrWUwW/S/mu/wfLITWrfEV/xkZuB1pn
         VKKuBb7b68HbRQqArjaYTrF+c80nUXvAgsf9HiVgvty0mOgaIk6ACbnMrUOP1U7vkbqt
         z98g==
X-Gm-Message-State: AJIora80BXvsVPV5fj0CiVQ0ZreyWyfQsyw/qnfYAa+wOEbJQJROtf9c
	IBse9R0fdvJs4Co/pq2Q1lc=
X-Google-Smtp-Source: AGRyM1tECeVojpK1m+jhYMvz7IJirM4TRLEFk0/vXE7K/q8ZRRWuyq2tw3mPIzYtJQoNhW4+djLQ1A==
X-Received: by 2002:a17:90b:38c1:b0:1ea:8403:9305 with SMTP id nn1-20020a17090b38c100b001ea84039305mr19778992pjb.11.1655622413496;
        Sun, 19 Jun 2022 00:06:53 -0700 (PDT)
Received: from localhost.localdomain ([122.167.211.160])
        by smtp.gmail.com with ESMTPSA id w9-20020a17090a8a0900b001ec798b0dc4sm3681555pjn.38.2022.06.19.00.06.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jun 2022 00:06:53 -0700 (PDT)
From: Souptick Joarder <jrdr.linux@gmail.com>
To: martyn@welchs.me.uk,
	manohar.vanga@gmail.com,
	gregkh@linuxfoundation.org,
	alexandre.belloni@bootlin.com,
	rafael@kernel.org,
	mathieu.poirier@linaro.org,
	u.kleine-koenig@pengutronix.de,
	arnd@arndb.de
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	"Souptick Joarder (HPE)" <jrdr.linux@gmail.com>,
	Kernel test robot <lkp@intel.com>
Subject: [PATCH] vme: Added NULL check for bridge
Date: Sun, 19 Jun 2022 12:36:45 +0530
Message-Id: <20220619070645.100947-1-jrdr.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Souptick Joarder (HPE)" <jrdr.linux@gmail.com>

Kernel test robot throws below warning ->
drivers/staging/vme_user/vme.c:662:20: warning: dereference
of NULL 'bridge' [CWE-476] [-Wanalyzer-null-dereference]

Added a NULL check.

Reported-by: Kernel test robot <lkp@intel.com>
Signed-off-by: Souptick Joarder (HPE) <jrdr.linux@gmail.com>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5555683a069..ede774f2fe5a 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -659,7 +659,7 @@ ssize_t vme_master_read(struct vme_resource *resource, void *buf, size_t count,
 	struct vme_master_resource *image;
 	size_t length;
 
-	if (!bridge->master_read) {
+	if (bridge && !bridge->master_read) {
 		printk(KERN_WARNING "Reading from resource not supported\n");
 		return -EINVAL;
 	}
-- 
2.25.1

