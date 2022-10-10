Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2265C80
	for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 19:05:02 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id bu30so18338532wrb.8
        for <linux-staging@lists.linux.dev>; Mon, 10 Oct 2022 12:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QD8wdvaO6XBs/zfHh26v0oCC9SUgounvKhPdieCAY3o=;
        b=lOfe6l0Q1kuGftEXm9/Yq/X7M4WDGYhWr+oME53Nyu0Qr1cK6ehbciTAZuosWFfLEz
         HinYyEGrtNPn+xMBDV+i5zzmsbVaM970AIugse44Actw41tYxLg68gLuw9DDwQlNiFNd
         817LZfVfRiUiBa0hyitefwmSNTgf+Mm7BPz680HuVqhIDqe/tx4o2y5I0UBb8wBiPwdK
         gLBxv1PsHYLbE8kpgf4yLPLLRlaSvoTQ3gcKRjuZrb22RUZP+hrUFbL44dnzKS3picC5
         0SXoyvLDVw0aTs7DczrQzfChT8H7WfGwTMwq3VqjN+tad9XVks4KU0/36jOzjXG9paUa
         5i5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QD8wdvaO6XBs/zfHh26v0oCC9SUgounvKhPdieCAY3o=;
        b=ErqcaSbaZP36PfGS2OSHGhL7tsSwuW3lWno3jw5VA1NmZUfsTX1N8oI80AUoF3w08g
         5HNKU9XSsFObUt8gMZ4njgRpP73m8w0k0dKsadqyrzYNsNgNEto1AbxsU0dFxt29qGWe
         vE34/Dvcsd9Qy1R8HcYwVHFmvxVZ8dY5iQVR/e3LEUICuwllHM2BajgEHYNA4rdrU5FJ
         CxslTa5nB5KBV7wXCQ2xxEjsv9r4PgvkTOV5UxNxQEQEvUNdVIMWBBJEhqIyp7/cAbBD
         ORHdJTje4LKncgmNaBRUdHI12OUo/nX2tENCuOveqWril1ddXlqn1zYP65jgmR0B2y+v
         1s0w==
X-Gm-Message-State: ACrzQf0uKUEWIxcxG14s0BD19QLwb0iiFZBg1fpLQTI2aoWtfs5e8Zg8
	/w7D3RIcKem8X2tDwW6imEY=
X-Google-Smtp-Source: AMsMyM6HPVmC4Abz5JFMY400zWBGWNlFJ32woPTJV4KfgC3wG/Xfc6cAzCY3z7r7Kc0W9TP74zNPpQ==
X-Received: by 2002:a05:6000:1786:b0:22e:3955:13a1 with SMTP id e6-20020a056000178600b0022e395513a1mr12486277wrg.624.1665428701383;
        Mon, 10 Oct 2022 12:05:01 -0700 (PDT)
Received: from localhost.localdomain ([176.61.123.135])
        by smtp.gmail.com with ESMTPSA id i29-20020a1c541d000000b003c41144b3cfsm8650140wmb.20.2022.10.10.12.05.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Oct 2022 12:05:00 -0700 (PDT)
From: Dragan Cvetic <dragan.m.cvetic@gmail.com>
To: philipp.g.hortmann@gmail.com
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Dragan Cvetic <dragan.m.cvetic@gmail.com>
Subject: [PATCH 0/3] staging: r8192e: Rename variables in rtl_dm.h
Date: Mon, 10 Oct 2022 20:04:54 +0100
Message-Id: <20221010190457.13199-1-dragan.m.cvetic@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variables to avoid CamelCase which is not accepted by checkpatch.

No test performed on HW, just build.

Dragan Cvetic (3):
  staging: rtl8192e: Rename CurSTAConnectState and PreSTAConnectState
  staging: rtl8192e: Rename Enable, cck_Rx_path and disabledRF
  staging: rtl8192e: Rename Op, Length and Value

 drivers/staging/rtl8192e/rtl8192e/rtl_dm.c | 48 +++++++++++-----------
 drivers/staging/rtl8192e/rtl8192e/rtl_dm.h | 16 ++++----
 2 files changed, 32 insertions(+), 32 deletions(-)

-- 
2.25.1

