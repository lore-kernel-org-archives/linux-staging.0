Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC3A1FA2
	for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 21:04:20 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id x18-20020a17090a8a9200b001ef83b332f5so6549520pjn.0
        for <linux-staging@lists.linux.dev>; Sun, 10 Jul 2022 14:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=x7ZTr4+yMOBlk7vJ6rVQ4iqKzWGXEA4ep1T65Ay+ATc=;
        b=kjYbyWTHMLEhv94l/a/cY3l/s7xZrLIZZu0WiNWRE+cqoG8oN9tYoRz1DTaQEbUFTP
         WIWvHO0FGL6u7ssJ2Yqu/i6LgSMSFiI/GxXMqIxxKMZUbt6t8KLM4UBPfm7aBdswizOQ
         CWANiS3O9JWQJffRaxTRsxBeD5bFksnp4ac2GFOIz/GLOeWmfOsftNPkTnIy0dJM6FCK
         XmFEl0v/6jSJs9foQqifuzkGFXTbECpdjX+9Tv1TwdDBMMn0sdFFTlsEOG3M7j67GQDq
         poWW7BIxr8rBRCikCMeZqow1IGz96i+Mwxz6sX3tIdDAVK3OphNQ63mZiUjm69sDENgm
         GPNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=x7ZTr4+yMOBlk7vJ6rVQ4iqKzWGXEA4ep1T65Ay+ATc=;
        b=UfaOfCwwS9Wd/KClXu9eeAf/NS0XXA9P5KjJqwIktsbdllmy8i2qm4xJPj6fRAydIW
         XjukLGdAKO56Cc1YK9Py5BsZ69OCp3nSn0j+AIzid3eAPWEjBOiNc1dMiD9VL7XmcuAD
         LydTu8OcZeF4lX4TtzmEIq+E2/A8yDHurlJCeVghy8Q+0SK3G9UcfQ52wx625iqWhHNj
         AxqN/gI0ALPzFjb5iT3FQo9uT1bdiEYpQAAX2eIpOePnTcUx3+5hCH0OsTCTo9tvvwzY
         WaM5Tc8/lEecQTD7gGb47ACJGvDxYWLniCWfRTuwYjmLnUTC9SQSzDFG6re1PRtntMr4
         KDag==
X-Gm-Message-State: AJIora9NLExmVxqx44IIGvqT/e02cPhP4SmbNZQpOI42riKD3G7ykPf4
	nSDIk5GqZGJNgND1SyJBeW8=
X-Google-Smtp-Source: AGRyM1swv9zbKIDyLeUMey5TO43eTKAn71dquv+3BAyCeE3xZQ+WE8nokIuUqSL4Ff45OaP/C24w+Q==
X-Received: by 2002:a17:90b:1d92:b0:1ef:e28f:ff38 with SMTP id pf18-20020a17090b1d9200b001efe28fff38mr14027026pjb.32.1657487059782;
        Sun, 10 Jul 2022 14:04:19 -0700 (PDT)
Received: from cloud-MacBookPro ([2601:646:8201:c2e0:4045:a2e:ac7a:d1f4])
        by smtp.gmail.com with ESMTPSA id m17-20020a170902bb9100b0016a1e2d148csm3147741pls.32.2022.07.10.14.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Jul 2022 14:04:19 -0700 (PDT)
Date: Sun, 10 Jul 2022 14:04:18 -0700
From: Binyi Han <dantengknight@gmail.com>
To: Manish Chopra <manishc@marvell.com>, GR-Linux-NIC-Dev@marvell.com,
	Coiby Xu <coiby.xu@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>
Cc: netdev@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] staging: qlge: Fix indentation issue under long for loop
Message-ID: <20220710210418.GA148412@cloud-MacBookPro>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fix indentation issue to adhere to Linux kernel coding style,
Issue found by checkpatch. Change the long for loop into 3 lines. And
optimize by avoiding the multiplication.

Signed-off-by: Binyi Han <dantengknight@gmail.com>
---
v2:
	- Change the long for loop into 3 lines.
v3:
	- Align page_entries in the for loop to open parenthesis.
	- Optimize by avoiding the multiplication.

 drivers/staging/qlge/qlge_main.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/staging/qlge/qlge_main.c b/drivers/staging/qlge/qlge_main.c
index 1a378330d775..4b166c66cfc5 100644
--- a/drivers/staging/qlge/qlge_main.c
+++ b/drivers/staging/qlge/qlge_main.c
@@ -3007,10 +3007,12 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		tmp = (u64)rx_ring->lbq.base_dma;
 		base_indirect_ptr = rx_ring->lbq.base_indirect;
 
-		for (page_entries = 0; page_entries <
-			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		for (page_entries = 0;
+		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
+		     page_entries++) {
+			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
+			tmp += DB_PAGE_SIZE;
+		}
 		cqicb->lbq_addr = cpu_to_le64(rx_ring->lbq.base_indirect_dma);
 		cqicb->lbq_buf_size =
 			cpu_to_le16(QLGE_FIT16(qdev->lbq_buf_size));
@@ -3022,10 +3024,12 @@ static int qlge_start_rx_ring(struct qlge_adapter *qdev, struct rx_ring *rx_ring
 		tmp = (u64)rx_ring->sbq.base_dma;
 		base_indirect_ptr = rx_ring->sbq.base_indirect;
 
-		for (page_entries = 0; page_entries <
-			MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN); page_entries++)
-				base_indirect_ptr[page_entries] =
-					cpu_to_le64(tmp + (page_entries * DB_PAGE_SIZE));
+		for (page_entries = 0;
+		     page_entries < MAX_DB_PAGES_PER_BQ(QLGE_BQ_LEN);
+		     page_entries++) {
+			base_indirect_ptr[page_entries] = cpu_to_le64(tmp);
+			tmp += DB_PAGE_SIZE;
+		}
 		cqicb->sbq_addr =
 			cpu_to_le64(rx_ring->sbq.base_indirect_dma);
 		cqicb->sbq_buf_size = cpu_to_le16(SMALL_BUFFER_SIZE);
-- 
2.25.1

