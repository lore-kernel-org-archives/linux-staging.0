Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [63.128.21.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC23E6F
	for <linux-staging@lists.linux.dev>; Wed, 24 Mar 2021 01:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1616547632;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mXD4jkd7wlqRcumQPssXGkKrnP2LYdiCNnEzRMWZEdA=;
	b=FwfFtCEUs7LybOMNlxxKLH7ZsUlmz122401PBLc0Xp2AXEg16SRMZL5rsH08uTPJ4+9KVB
	Ml/p/pRZTYNDLccyKtENhpHTsF4/CDVE1wzebUd9arOho+ZNdjX9fkOnhYb/+ladrWZ9OT
	rwvYoQkTzCqtkbNZS1HcyIoWu4Bd6KY=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-ZY3RMk3oN36qRHNjA8S7AA-1; Tue, 23 Mar 2021 21:00:30 -0400
X-MC-Unique: ZY3RMk3oN36qRHNjA8S7AA-1
Received: by mail-pg1-f198.google.com with SMTP id l2so548160pgi.5
        for <linux-staging@lists.linux.dev>; Tue, 23 Mar 2021 18:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=mXD4jkd7wlqRcumQPssXGkKrnP2LYdiCNnEzRMWZEdA=;
        b=joRX54Bs2wddp7qVbtoUQrifqtVUtD81cOiWUt/v1Kb5yAv7dNEEUbCl8AoFdahTzl
         tcoqZCCAGEOrLydySIj7hXVnXZeiJOQarMx1c88GsdabCfGbgP3jG2+RJgvdy2aUBd3T
         vuuVWGrr+Nwi5e6Ug3+n2Vm94lMm4oA2y+skrxSPplKtnrMdn/ocuvyZcwTKnauCLmvr
         77GgEVV21zDikYtXXyrDPkRWIFwwKRPYjuO50O6m4aUXh38ymEBE8aKAMc/WYjBsLgrR
         i9J04HcK1nRSTdycAaEPAwTuwNezVlnCQihAEu5exvV7t0X5j2HJhgC9J0RiT1YGUsPy
         NhsA==
X-Gm-Message-State: AOAM531CV/P/+n+iXE22m+Br9RKIAra7tNvjmowk2CzEA/GhsHWwUC1Y
	n5tMluJoz8JMHId1PQoLrrc24hVJ6lUBlzPdPEBgQFIvhE+moRQBvjuG/k5NlRIIwV706aae6ih
	VrlVhBElfusVwCkUq+zzs0ekUmH8qwKn/tvRifs2W0GXgnh7G/Rvcj9JN5q0oYLJQ8GjQbhWg
X-Received: by 2002:a65:4288:: with SMTP id j8mr777143pgp.231.1616547629315;
        Tue, 23 Mar 2021 18:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwWirEo8pQH7hqV/baJawI7VwpC/dAAShVAbbWa8tVTu1Ema0frBwQddALOqOwrEz0+SFjcig==
X-Received: by 2002:a65:4288:: with SMTP id j8mr777116pgp.231.1616547628926;
        Tue, 23 Mar 2021 18:00:28 -0700 (PDT)
Received: from localhost ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id x1sm321456pje.40.2021.03.23.18.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Mar 2021 18:00:28 -0700 (PDT)
From: Coiby Xu <coxu@redhat.com>
To: linux-staging@lists.linux.dev
Cc: Coiby Xu <coiby.xu@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Manish Chopra <manishc@marvell.com>,
	GR-Linux-NIC-Dev@marvell.com (supporter:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	netdev@vger.kernel.org (open list:QLOGIC QLGE 10Gb ETHERNET DRIVER),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] staging: qlge: deal with the case that devlink_health_reporter_create fails
Date: Wed, 24 Mar 2021 09:00:01 +0800
Message-Id: <20210324010002.109846-1-coxu@redhat.com>
X-Mailer: git-send-email 2.31.0
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=coxu@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Coiby Xu <coiby.xu@gmail.com>

devlink_health_reporter_create may fail. In that case, do the cleanup
work.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Coiby Xu <coxu@redhat.com>
---
 drivers/staging/qlge/qlge_devlink.c | 10 +++++++---
 drivers/staging/qlge/qlge_devlink.h |  2 +-
 drivers/staging/qlge/qlge_main.c    |  8 +++++++-
 3 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/qlge/qlge_devlink.c b/drivers/staging/qlge/qlge_devlink.c
index 86834d96cebf..0ab02d6d3817 100644
--- a/drivers/staging/qlge/qlge_devlink.c
+++ b/drivers/staging/qlge/qlge_devlink.c
@@ -148,16 +148,20 @@ static const struct devlink_health_reporter_ops qlge_reporter_ops = {
 	.dump = qlge_reporter_coredump,
 };
 
-void qlge_health_create_reporters(struct qlge_adapter *priv)
+long qlge_health_create_reporters(struct qlge_adapter *priv)
 {
 	struct devlink *devlink;
+	long err = 0;
 
 	devlink = priv_to_devlink(priv);
 	priv->reporter =
 		devlink_health_reporter_create(devlink, &qlge_reporter_ops,
 					       0, priv);
-	if (IS_ERR(priv->reporter))
+	if (IS_ERR(priv->reporter)) {
+		err = PTR_ERR(priv->reporter);
 		netdev_warn(priv->ndev,
 			    "Failed to create reporter, err = %ld\n",
-			    PTR_ERR(priv->reporter));
+			    err);
+	}
+	return err;
 }
diff --git a/drivers/staging/qlge/qlge_devlink.h b/drivers/staging/qlge/qlge_devlink.h
index 19078e1ac694..94538e923f2f 100644
--- a/drivers/staging/qlge/qlge_devlink.h
+++ b/drivers/staging/qlge/qlge_devlink.h
@@ -4,6 +4,6 @@
 
 #include <net/devlink.h>
 
-void qlge_health_create_reporters(struct qlge_adapter *priv);
+long qlge_health_create_reporters(struct qlge_adapter *priv);
 
 #endif /* QLGE_DEVLINK_H */
diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 5516be3af898..59d1ec580696 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -4620,7 +4620,11 @@ static int qlge_probe(struct pci_dev *pdev,
 	if (err)
 		goto netdev_free;
 
-	qlge_health_create_reporters(qdev);
+	err = qlge_health_create_reporters(qdev);
+
+	if (err)
+		goto devlink_unregister;
+
 	/* Start up the timer to trigger EEH if
 	 * the bus goes dead
 	 */
@@ -4632,6 +4636,8 @@ static int qlge_probe(struct pci_dev *pdev,
 	cards_found++;
 	return 0;
 
+devlink_unregister:
+	devlink_unregister(devlink);
 netdev_free:
 	free_netdev(ndev);
 devlink_free:
-- 
2.31.0

