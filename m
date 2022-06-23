Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9192C1842
	for <linux-staging@lists.linux.dev>; Thu, 23 Jun 2022 04:39:15 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id a17so15168579pls.6
        for <linux-staging@lists.linux.dev>; Wed, 22 Jun 2022 21:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtCc+UQQpUTja7HKmiItYlG8yACqKBWw8JAx2Em2Ros=;
        b=gh/igH2UBmB6266V7qY6S0bv21sMThSqiv6qST2OQV19Ker6WZI12/ZPsn5LmqqWMh
         t6B8o2aZQ4nJA7ak3aUREkh7KGQ2hNRtyoR81bZ+A8Fi4z4McsyrgQekTQcMCI70UI2n
         3RQWqjbp2T4yiGZpV+UYo3SmGTABIUT9W/o/7PhDpLAGwt+LqOCdHqUxWN8rIWno2h1A
         yaR7HwLh5gimH4pkP8R4TyB0BRQgj5Vk/qAzYMVTFTvdrtlzi9MU2P0Ov9lbzA5ajnZ9
         JG6THSs9MWkC6Ho5PsIOCjSN6xRoh9MdEFq94l8qNCd/kXfvxnaFM83nULrqV7QslcN2
         EuNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=XtCc+UQQpUTja7HKmiItYlG8yACqKBWw8JAx2Em2Ros=;
        b=qHN6pWfx2dTdqHmezFfII0H4SbCpekiJ0FpjMpol3fw5oQurNz0YkR879EzcNZUXr9
         B3Zxg2WH1cwcRLVxYZeRO61/Eqdi3wgvTnVLymxLm01SRKmDYUAHW4noxkoy7ekJSrU4
         1XLOc07r6M+Rwppq2b7Ap5SShEh5HOs/lzfzuSzaHZ76ccAIsvJm3mvd5tTs9UKa3FMc
         KACMByjUvRTuRfwEPQfcRpjetgBuS1a9IhsTq8zhSDW8524e1VnPPALG9evhKBk8hgcX
         ELOLF1S5CCi3du+YO41NNkcqXx5HWg7YVhRp+FZ6qHo62kkQ7ucuBRB+NF6xc78rfPTa
         pN5w==
X-Gm-Message-State: AJIora9f3rB74StZn3O3Re+hRDnuCd4gLCAHsjW3LCpD/bg75HAEqC6x
	tmgSf5cpsAofofrcSNvUUGg=
X-Google-Smtp-Source: AGRyM1tjtG0nx/M7CuMI6QIDU2GQemBYxqdzHLv+78X41ahZcFZtCvvQIaaUbp3aAN3pC5NPVKezhw==
X-Received: by 2002:a17:90a:c984:b0:1ec:747b:da32 with SMTP id w4-20020a17090ac98400b001ec747bda32mr1975850pjt.216.1655959154953;
        Wed, 22 Jun 2022 21:39:14 -0700 (PDT)
Received: from localhost (c-67-180-87-133.hsd1.ca.comcast.net. [67.180.87.133])
        by smtp.gmail.com with ESMTPSA id a66-20020a621a45000000b005251759afbasm9041385pfa.65.2022.06.22.21.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jun 2022 21:39:14 -0700 (PDT)
From: Chang Yu <marcus.yu.56@gmail.com>
To: Larry.Finger@lwfinger.net,
	philipp.g.hortmann@gmail.com
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Chang Yu <marcus.yu.56@gmail.com>
Subject: [PATCH v2] staging: r8188eu: Make rtw_signal_stat_timer_hdl a static function
Date: Wed, 22 Jun 2022 21:38:55 -0700
Message-Id: <20220623043855.407208-1-marcus.yu.56@gmail.com>
X-Mailer: git-send-email 2.36.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make rtw_signal_stat_timer_hdl a static function instead of a global
function.

Signed-off-by: Chang Yu <marcus.yu.56@gmail.com>
---
Changes in v2:
Added static for the definition as well

 drivers/staging/r8188eu/core/rtw_recv.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_recv.c b/drivers/staging/r8188eu/core/rtw_recv.c
index cc91638a085d..6564e82ddd66 100644
--- a/drivers/staging/r8188eu/core/rtw_recv.c
+++ b/drivers/staging/r8188eu/core/rtw_recv.c
@@ -24,7 +24,7 @@ static u8 rtw_rfc1042_header[] = {
 	0xaa, 0xaa, 0x03, 0x00, 0x00, 0x00
 };
 
-void rtw_signal_stat_timer_hdl(struct timer_list *t);
+static void rtw_signal_stat_timer_hdl(struct timer_list *t);
 
 void _rtw_init_sta_recv_priv(struct sta_recv_priv *psta_recvpriv)
 {
@@ -1794,7 +1794,7 @@ s32 rtw_recv_entry(struct recv_frame *precvframe)
 	return ret;
 }
 
-void rtw_signal_stat_timer_hdl(struct timer_list *t)
+static void rtw_signal_stat_timer_hdl(struct timer_list *t)
 {
 	struct adapter *adapter = from_timer(adapter, t, recvpriv.signal_stat_timer);
 	struct recv_priv *recvpriv = &adapter->recvpriv;
-- 
2.36.1

