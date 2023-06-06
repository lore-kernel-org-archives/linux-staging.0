Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72ED0468F
	for <linux-staging@lists.linux.dev>; Tue,  6 Jun 2023 11:24:25 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-53063897412so5510309a12.0
        for <linux-staging@lists.linux.dev>; Tue, 06 Jun 2023 04:24:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686050665; x=1688642665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FgtVUQsPT8FJ5Vzbv9hHerc/vSp2iW4yB4BuCz1QsuE=;
        b=X9RKkocOwQQoXx0VhPNaN13xx38hrB1NL9Qeas968kTz934dCgNjjeIhg99fKEbPlb
         6cM/KOKzsUfPb/s03X4tqWqB/5EHRv4Qtxon8t49Py46hNyOc6jTx8gubOEDmNr4p5LS
         7ESoZVLBN+pXUqw8wkLUQ5X06HCb+u/qJj2wfvtwUzR5PPU7GpLH2BY5wqRlIj/wCJ+k
         G4hi49Wz7WTezp5wicGgKGR/svUC6jVvkkHKoeYgvtbdFOUdDe/Al43wEHKuF1XO3LzM
         QikbIswGFiXSLgmPhQrYCQe/tbkTr2481wbJwS+N+L124uX3OpvY4KGFOXmWnRedsVGR
         JtxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686050665; x=1688642665;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FgtVUQsPT8FJ5Vzbv9hHerc/vSp2iW4yB4BuCz1QsuE=;
        b=Fknt7QRwL5IIGoaanVKcj0RdXV/li21lDiTlT6NKZCMayyAY0apOs+UBfj0X2t2f5K
         mTWeT4gxsagozxvXrrqg4YKdmfP6/dWhNuOzpcyeWZGKF70LP+lEMv3QkNJopRv2gNc/
         1dACnsLWkoc8YXb0no5ofoZ1Lwqq9PwEwchpzGCQe93ktwZsmR73h7tlFjpcDsgJWint
         GBqCzcSmDD7wMFwlRTaUCxLgye/a98jogOhUHY48/uf2lgmpeBSmAEIAzESTMlCqEUWT
         aOzLUbbcOL7TXkVZ9qKISWrsKRXQZgPxtWN39Jesy67zd7CBttb3RMvWofraCNeAJBdQ
         DpnA==
X-Gm-Message-State: AC+VfDzOikoPPUlPk+kQhYZItwJnUiJ65us5ouRDdK5lGyqBBoXz7azP
	khmQ3/Y1UiGxcwsirx/22+4=
X-Google-Smtp-Source: ACHHUZ4l+g/FfCRp1i0AIdVqCX+QDTMhIRcwBujXABvXRV46+Mu668a9Mk+dBLjqeQ3tEYia9IofNA==
X-Received: by 2002:a17:902:d487:b0:1af:d812:d27 with SMTP id c7-20020a170902d48700b001afd8120d27mr2295462plg.9.1686050664759;
        Tue, 06 Jun 2023 04:24:24 -0700 (PDT)
Received: from devbox.. ([103.165.115.136])
        by smtp.gmail.com with ESMTPSA id ja22-20020a170902efd600b001b008b3dee2sm8271740plb.287.2023.06.06.04.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 04:24:24 -0700 (PDT)
From: Neel Chakraborty <neelchakrabortykernelwork@gmail.com>
To: martyn@welchs.me.uk
Cc: manohar.vanga@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Neel Chakraborty <neelchakrabortykernelwork@gmail.com>
Subject: [PATCH 001/001] drivers/staging/vme_user/vme.c: Fixed alignment issues
Date: Tue,  6 Jun 2023 16:53:22 +0530
Message-Id: <20230606112321.1022783-1-neelchakrabortykernelwork@gmail.com>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Made alignment match open parenthesis.

Signed-off-by: Neel Chakraborty <neelchakrabortykernelwork@gmail.com>
---
 drivers/staging/vme_user/vme.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vme_user/vme.c b/drivers/staging/vme_user/vme.c
index b5555683a069..8a9efb4a00a3 100644
--- a/drivers/staging/vme_user/vme.c
+++ b/drivers/staging/vme_user/vme.c
@@ -79,7 +79,7 @@ static struct vme_bridge *find_bridge(struct vme_resource *resource)
  * Return: Virtual address of allocation on success, NULL on failure.
  */
 void *vme_alloc_consistent(struct vme_resource *resource, size_t size,
-	dma_addr_t *dma)
+			   dma_addr_t *dma)
 {
 	struct vme_bridge *bridge;
 
-- 
2.40.1

