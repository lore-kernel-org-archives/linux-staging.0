Received: from out199-16.us.a.mail.aliyun.com (out199-16.us.a.mail.aliyun.com [47.90.199.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB1A7EBB
	for <linux-staging@lists.linux.dev>; Thu, 30 Jun 2022 09:40:42 +0000 (UTC)
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R971e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=yang.lee@linux.alibaba.com;NM=1;PH=DS;RN=7;SR=0;TI=SMTPD_---0VHrVw7N_1656580178;
Received: from localhost(mailfrom:yang.lee@linux.alibaba.com fp:SMTPD_---0VHrVw7N_1656580178)
          by smtp.aliyun-inc.com;
          Thu, 30 Jun 2022 17:09:38 +0800
From: Yang Li <yang.lee@linux.alibaba.com>
To: Larry.Finger@lwfinger.net
Cc: phil@philpotter.co.uk,
	paskripkin@gmail.com,
	gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yang Li <yang.lee@linux.alibaba.com>
Subject: [PATCH -next] staging: r8188eu: remove unneeded semicolon
Date: Thu, 30 Jun 2022 17:09:37 +0800
Message-Id: <20220630090937.4983-1-yang.lee@linux.alibaba.com>
X-Mailer: git-send-email 2.20.1.7.g153144c
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Eliminate the following coccicheck warning:
./drivers/staging/r8188eu/hal/HalPwrSeqCmd.c:70:2-3: Unneeded semicolon

Signed-off-by: Yang Li <yang.lee@linux.alibaba.com>
---
 drivers/staging/r8188eu/hal/HalPwrSeqCmd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
index b5f6d41464db..5b0f66573d94 100644
--- a/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
+++ b/drivers/staging/r8188eu/hal/HalPwrSeqCmd.c
@@ -67,7 +67,7 @@ u8 HalPwrSeqCmdParsing(struct adapter *padapter, enum r8188eu_pwr_seq seq)
 		break;
 	default:
 		return false;
-	};
+	}
 
 	do {
 		pwrcfgcmd = pwrseqcmd[aryidx];
-- 
2.20.1.7.g153144c

