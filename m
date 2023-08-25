Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F295E101D1
	for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 14:06:16 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-68c3b9f8333so17783b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 25 Aug 2023 07:06:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=darkphysics.net; s=google; t=1692972376; x=1693577176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vUdqwdRYBAdAyAf4qgMbXsZ4Ix9El+5T23vOVq68bQ=;
        b=B7WhlnWTRQaL35hB6/MjGpm34XkPQ5kdSXFSqwv1QHYZtvJoDbOGHyZRXdJA3E1xBy
         GSZ+7YPPSH655WdcMcsOY5AKAZgOSnRewe2n9McgeewOR83CrVFX4/jCkK2EJ4TIBGjy
         qRcRLzAakHt9eoKAxs+PZiT+7NGTp4WQzYfWrzVG0cDCTZFVu/9NtkStymTNeOMKzXZ5
         MNqRDppgU5+ZtJBrxabY9Lqk/jdamkHvhl4m5+/VgnaLce/AxK5fRne0WYSZCTRu8zpS
         j6XTIsUN9ItKEKirB9c+wCTn/hM0fc9lAsgblNeA6LY416JuCIbElDPAAcc8wWUFgKh3
         JmrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692972376; x=1693577176;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/vUdqwdRYBAdAyAf4qgMbXsZ4Ix9El+5T23vOVq68bQ=;
        b=A+GVDIB3ACENYGxaVTbkDciN4Q5vOepkZq+U/gRYlcUgCKkJkmu71Ph1FZqBxnT/jr
         nJULyFykcIONErHTvbTqFhJYDEhg/1J2x2nx9tXFKp9MhMoiKOIg3WYil2mgAig4swz5
         2T9XA8yCGHgCNCLkSYKr6yifluq9s2fNaCY0BVNdbi/0iLwhNTIOsr5cOmeKXS2iQWPj
         mk50J7RH2c5CsAqPlSgMwicpFr1w4kM5sM7xTSc6ja6gGjZb9FMqw/adeGwXL+w7NcBX
         9vlbU3KeD/4SNluixJMFbM+uZAq5Envs+RROUPomguG+VEXibm4QAiYu7Sb75J59PDRD
         Yd7w==
X-Gm-Message-State: AOJu0Yzy9zrAqP0QYMiQ0y5itxwb0V4NHYa/nzPNbxKyNp10X3itw/Zg
	BF39b0umSTL2PQo35hkEYDkRNw==
X-Google-Smtp-Source: AGHT+IFKJQf2nnVuRdrG02X9VWtIhK0vBTk9y+4MLMWwcn5k15IpNoQYCkL5TzyWiHENlsk0PMxRPw==
X-Received: by 2002:a05:6a20:938a:b0:140:d536:d434 with SMTP id x10-20020a056a20938a00b00140d536d434mr28945743pzh.10.1692972376004;
        Fri, 25 Aug 2023 07:06:16 -0700 (PDT)
Received: from basil.darkphysics (c-76-146-178-2.hsd1.wa.comcast.net. [76.146.178.2])
        by smtp.gmail.com with ESMTPSA id v23-20020a62a517000000b006870721fcc5sm1628232pfm.175.2023.08.25.07.06.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Aug 2023 07:06:15 -0700 (PDT)
From: Tree Davies <tdavies@darkphysics.net>
To: gregkh@linuxfoundation.org,
	philipp.g.hortmann@gmail.com,
	anjan@momi.ca
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Tree Davies <tdavies@darkphysics.net>
Subject: [PATCH v4 00/16] Staging: rtl8192e: Rename struct rx_ts_record references
Date: Fri, 25 Aug 2023 07:08:31 -0700
Message-ID: <20230825140847.501113-1-tdavies@darkphysics.net>
X-Mailer: git-send-email 2.41.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The goal of this series is to fix checkpatch warning Avoid CamelCase,
for all references of struct rx_ts_record. In most cases renames the
references to, ts, to make the naming consistent.

Thank you in advance to the reviewers,
~ Tree

Tree Davies (16):
  Staging: rtl8192e: Rename variable pRxTs in function rx_ts_delete_ba()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_rx_ADDBAReq()
  Staging: rtl8192e: Rename variable pRxTs in function rtllib_rx_DELBA()
  Staging: rtl8192e: Rename variable pRxTs in function
    rtllib_ts_init_del_ba()
  Staging: rtl8192e: Rename variable pRxTs in function
    rtllib_rx_ba_inact_timeout()
  Staging: rtl8192e: Rename variable pRxTs in function
    RxPktPendingTimeout()
  Staging: rtl8192e: Rename variable pTS in function ResetRxTsEntry()
  Staging: rtl8192e: Rename variable pRxTS in function TSInitialize()
  Staging: rtl8192e: Rename variable tmp in function GetTs()
  Staging: rtl8192e: Rename variable pRxTS in function RemoveTsEntry()
  Staging: rtl8192e: Rename variable pTS in function prototype
    rtllib_FlushRxTsPendingPkts()
  Staging: rtl8192e: Rename variable pTS in function AddReorderEntry()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_FlushRxTsPendingPkts()
  Staging: rtl8192e: Rename variable pTS in function
    RxReorderIndicatePacket()
  Staging: rtl8192e: Rename variable pRxTS in function
    rtllib_rx_check_duplicate()
  Staging: rtl8192e: Rename variable pTS in function
    rtllib_rx_InfraAdhoc()

 drivers/staging/rtl8192e/rtl819x_BAProc.c | 36 ++++-----
 drivers/staging/rtl8192e/rtl819x_TSProc.c | 73 +++++++++---------
 drivers/staging/rtl8192e/rtllib.h         |  2 +-
 drivers/staging/rtl8192e/rtllib_rx.c      | 94 +++++++++++------------
 4 files changed, 102 insertions(+), 103 deletions(-)

-- 
2.41.0

