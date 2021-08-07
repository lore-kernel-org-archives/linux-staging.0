Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A98970
	for <linux-staging@lists.linux.dev>; Sat,  7 Aug 2021 09:48:27 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id d8so14320326wrm.4
        for <linux-staging@lists.linux.dev>; Sat, 07 Aug 2021 02:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rqppnh/WDI71rpOyjNOzTEItDQOlRTUr1XfwQG6H1rM=;
        b=P6AXXTYG+26CjAKpIk0O/LpIDfcOZQTT8qKju2eQYMDDZVmdUjz1yOrqt52FIEkMf3
         pHD1pW5ddu/8GNhlcM23kmoSuXcn2Q6H/cvBTditOwcIXhjfH48FTnr5IJF1BoMoAPbY
         ft4+xv3HUyqIbpDDj2sf5YUXRMHUG5BBipC4VQ10zOcpPuQRDaNTvYy98gqjvRIij2XJ
         aBG8DxcVva3jNP8U75o0Bu6WEzT4x8G0vMKjFsnA5OnU96unE20/dBR1dWkH6WBBl9KS
         jgeRHVDE7qbHcnfVMuAc1Hniczy1+8r3+WflgC7Oyor5o2VmTJ7xmaNlqqelBEpGQGzZ
         EPsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rqppnh/WDI71rpOyjNOzTEItDQOlRTUr1XfwQG6H1rM=;
        b=A4RzeDIMFsCV/GtJyCnUi9Xh5mefRpUxhcHM/gadCRjl5aX/ZjOYBOlYvCZT6Rx6wR
         a9EHUCGwJ6tmUTeI8lZaNec61dY8/Oc6jMJhgM6cJMNF8eBcFgzbM+5HWRWWxYTY+NPY
         OnTb5HpUceHZB6ciZM1ubBdqSJTL+OVDn+GYmO/2ex2b3RlFhDGFpcsOH6VCKIQuZDDl
         I8m7jsBGZsXKdEdqFvCJzFyJVeN4rpGH2hHrCdB/oEqbNp8sFti+2w/dNNfAf77Upwhn
         VKO4P2rzcOYep3wO+U48EJnMy2DnsWYfEo3cmQ+W9yQifxhm2Gcmgbp9mT7vzpfCIB5T
         0Nhg==
X-Gm-Message-State: AOAM530XVaLRPpNfpZUgQv/W+8/xoOxJrvsidCxqFSPfg+83uNNhL9MR
	FRrwOQUV5naBq/agJZWqvMWaXy3TGsI=
X-Google-Smtp-Source: ABdhPJzl4Zid6qFXPJqUrpt/5jQyA8gZMbpjW5nRh3H+gqSbC0SlEaYP+9NokymvsaoNTuZkDEB27w==
X-Received: by 2002:adf:f590:: with SMTP id f16mr15486485wro.162.1628329705856;
        Sat, 07 Aug 2021 02:48:25 -0700 (PDT)
Received: from agape ([5.171.80.112])
        by smtp.gmail.com with ESMTPSA id p14sm1064600wro.3.2021.08.07.02.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Aug 2021 02:48:25 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 08/21] staging: rtl8723bs: fix right side of condition
Date: Sat,  7 Aug 2021 11:48:00 +0200
Message-Id: <147631fe6f4f5de84cc54a62ba71d739b92697be.1628329348.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1628329348.git.fabioaiuto83@gmail.com>
References: <cover.1628329348.git.fabioaiuto83@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

TxNum value is compared against ODM_RF_PATH_D,
which is inconsistent. Compare it against
RF_MAX_TX_NUM, as in other places in the same file.

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/hal_com_phycfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
index 03c174aab08d..a47a0a1cae22 100644
--- a/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
+++ b/drivers/staging/rtl8723bs/hal/hal_com_phycfg.c
@@ -350,7 +350,7 @@ static void PHY_StoreTxPowerByRateNew(
 	if (RfPath > ODM_RF_PATH_D)
 		return;
 
-	if (TxNum > ODM_RF_PATH_D)
+	if (TxNum > RF_MAX_TX_NUM)
 		return;
 
 	for (i = 0; i < rateNum; ++i) {
-- 
2.20.1

