Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F96F53A3;
	Wed, 19 Oct 2022 19:20:14 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id j23so23431788lji.8;
        Wed, 19 Oct 2022 12:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9hBHwT//7YVRU6p7n6Dpa0soZobMlVM8+tmM4b0TcpA=;
        b=XrHgrTxgcw2OnbR2Rn2l85bm8PqJaW2asw3Rj8nSKkpWabYmNRocvMCA6WpeRWnATc
         sjSU8uuNefou14117FYgY2AzHTWFYi8E8uAoA50p4Y265wqBYZKKhCBlJxT7t4lgon1j
         d7oajZYLNqsLwHuYzX8rxu4D5a+SJZxvkVNg7aDlzavvmgQwqEq1/0v2XDV4hK5aObGS
         vXCSN9ow7djwmgbT0UZ23j6VUcQJCQKsbOVHDaDNQf6eNN1liJQZ5ihiBUcQ4mY3jzMS
         MOG33Mm8BvSeuZXkq4KarClm9YmJA8/beT+e0QZ8rT/oNqYdC4mM4yrpqDvITKsIeyV+
         HYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9hBHwT//7YVRU6p7n6Dpa0soZobMlVM8+tmM4b0TcpA=;
        b=uMEQagYcHIaevOwCd+iZnUHDJhKOhV/hWKe5R+6imTFu6vILIWLvTRsGj38K17LeJl
         IJwqSaB370JDlA7lm7yjKXOm51mNrsz/lL7/L0Aa5XPlgiWGAUKZADFCnpLvd5UaRItm
         l8b0coDwQHvoUBkEmMXIEntmf2zV3ULDV3HY9OFVS6rOgWaudRzPhMp2sj6eQGPLRoBK
         U3age7mQKVT5rbIySmHs23FKKBf4RQZBaGS7WqYa9Y/1RTV+XO39oP9X4nIXhQocbADe
         BjE41YNxxDHykNHo8qSSdqCayYEi1QBMWXa+n97GISopwhwnku3L3oRiJVhi7RDpy3Tb
         hSDQ==
X-Gm-Message-State: ACrzQf3KIyuwMYdVlS031JOjAu+emnKYZTvM0gF0Z6qnGatoKQehhlIx
	VAYj8VBXeMz/nlY2FHyxalv4xvwWomfA9KyN
X-Google-Smtp-Source: AMsMyM6VKRTEwsTBz1IDque1DOW2qle9uQwrVW2yMe/+Q1Jp5HupvS9q3Z6RkkqsA1PMtpz6DvwY7Q==
X-Received: by 2002:a2e:a887:0:b0:26a:871b:a16d with SMTP id m7-20020a2ea887000000b0026a871ba16dmr3658942ljq.482.1666207212039;
        Wed, 19 Oct 2022 12:20:12 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id bg31-20020a05651c0b9f00b0026dce212f24sm2551026ljb.98.2022.10.19.12.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Oct 2022 12:20:11 -0700 (PDT)
Date: Wed, 19 Oct 2022 19:20:11 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: greg@kroah.com, forest@alittletooquiet.net,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev
Subject: [PATCH v2] staging: vt6655: Fix Lines should not end with a '('
Message-ID: <Y1BN6wPMrpxPB3qP@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Code style warnings reported by checkpatch.
Improve the layout of a function header:
Put the first parameter immediately after the '(' and align the other
parameters underneath it.

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>

---
v2: put static and void on the same line and adjusted the indentation as
suggested by Greg KH

 drivers/staging/vt6655/rxtx.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 5bdb5176772c..d987f7dff02a 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -85,10 +85,8 @@ static const unsigned short wFB_Opt1[2][5] = {
 #define DATADUR_A_F1    13
 
 /*---------------------  Static Functions  --------------------------*/
-static
-void
-s_vFillRTSHead(
-	struct vnt_private *pDevice,
+static void
+s_vFillRTSHead(struct vnt_private *pDevice,
 	unsigned char byPktType,
 	void *pvRTS,
 	unsigned int	cbFrameLength,
@@ -96,13 +94,10 @@ s_vFillRTSHead(
 	bool bDisCRC,
 	struct ieee80211_hdr *hdr,
 	unsigned short wCurrentRate,
-	unsigned char byFBOption
-);
+	unsigned char byFBOption);
 
-static
-void
-s_vGenerateTxParameter(
-	struct vnt_private *pDevice,
+static void
+s_vGenerateTxParameter(struct vnt_private *pDevice,
 	unsigned char byPktType,
 	struct vnt_tx_fifo_head *,
 	void *pvRrvTime,
@@ -112,8 +107,7 @@ s_vGenerateTxParameter(
 	bool bNeedACK,
 	unsigned int	uDMAIdx,
 	void *psEthHeader,
-	unsigned short wCurrentRate
-);
+	unsigned short wCurrentRate);
 
 static unsigned int
 s_cbFillTxBufHead(struct vnt_private *pDevice, unsigned char byPktType,
-- 
2.34.1

