Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AB362E;
	Tue,  1 Nov 2022 08:24:21 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id b9so4856331ljr.5;
        Tue, 01 Nov 2022 01:24:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=upOGKHHQ7dIQHp3Kn+biBaH/EQv9dJ5DonoGy784LMc=;
        b=FJIHR75D7fjRmjC2G/ZU4xqmLXvxy/Wxbrm9UdBE/elbHHWLKbAuiq9GrCoE1LgNK4
         beQp4nOlkNByRrIzQ5bbW/XR1PnyTth8p2KzAme00XV974/Hm1JGPdy4z73doCjSwbzb
         fyHd9poulfzuOq4KglGUAs9DkV0FLERmA+l61b56o41MUdL/656b1XohmM/xbo7bCfH5
         M6djE3o/bZ+bq+MXZOf2t58q+YAx8HdJIoQPDhfKnYLEG9YzZxFbZQwENKBseVWeiMPZ
         y38QYI6YTnXL8ZoisVer4rX0xw77PfGQhvZ7gpIKYbTBQeD5oroRVeiMafBUCLFJaRHW
         zpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=upOGKHHQ7dIQHp3Kn+biBaH/EQv9dJ5DonoGy784LMc=;
        b=rbHUyrSI/qUWnS/HnvA5Aa7JeBrJseNlx0vVt+87Bmufa1x2vlU4kjj/UYa6oyRPLY
         4p70N4yuiDGkKpFCuEmga8JzkH5g2a3PpWUY/lJtiPbBUJmT2W8+5VnBiqFEnIw9Hh/E
         BgXWvyqDCaGJIk2k9xdI+isMcTsxPELAiOkoHzOoQjGQSeV8O31B4na3c6j3VMbfZem2
         7Ue2nuD/3caSeRnypH8f7CpOTgZ148g42rS1Ef3WCSiCQTYIpL9gXIdODtluKOMOfTDx
         wKWEwpnsD3RmPuDDEiXQ6BEeGxSW6SBi3W+AydOUKOPDl1jHOrE6mVE1omr41pJZpMet
         83Mw==
X-Gm-Message-State: ACrzQf1JwoPI9yqMV7eB7FtwxSCE4RVHUZVMIte0ANhXzXOEuvMvND2Z
	8J0E5rWPbFEfzWJ5/agPnO7H6hNxFtlf9Q==
X-Google-Smtp-Source: AMsMyM6G9cysSeLqrx8ejcK15Lykfn64yabbrcoK34rsEToMmuLB0pTLgSHofnxQVXdU6NjINgXP+w==
X-Received: by 2002:a2e:84ca:0:b0:25d:77e0:2566 with SMTP id q10-20020a2e84ca000000b0025d77e02566mr7235820ljh.78.1667291059343;
        Tue, 01 Nov 2022 01:24:19 -0700 (PDT)
Received: from elroy-temp-vm ([20.240.130.248])
        by smtp.gmail.com with ESMTPSA id v11-20020ac258eb000000b004acd6e441cesm1582063lfo.205.2022.11.01.01.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 01:24:18 -0700 (PDT)
Date: Tue, 1 Nov 2022 08:24:18 +0000
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: [PATCH v2] staging: vt6655: change variable name wTimeStampOff
Message-ID: <Y2DXsnrQjQeP2PfO@elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Change the variable name wTimeStampOff to adhear to Linux kernel coding
style, which does not allow naming variables in CamelCase. error is
reported by checkpatch

Signed-off-by: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
---
 drivers/staging/vt6655/rxtx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vt6655/rxtx.c b/drivers/staging/vt6655/rxtx.c
index 1e5036121665..9bdcf2337235 100644
--- a/drivers/staging/vt6655/rxtx.c
+++ b/drivers/staging/vt6655/rxtx.c
@@ -54,7 +54,7 @@
  */
 #define CRITICAL_PACKET_LEN      256
 
-static const unsigned short wTimeStampOff[2][MAX_RATE] = {
+static const unsigned short time_stamp_off[2][MAX_RATE] = {
 	{384, 288, 226, 209, 54, 43, 37, 31, 28, 25, 24, 23}, /* Long Preamble */
 	{384, 192, 130, 113, 54, 43, 37, 31, 28, 25, 24, 23}, /* Short Preamble */
 };
@@ -130,7 +130,7 @@ static __le16 s_uFillDataHead(struct vnt_private *pDevice,
 
 static __le16 vnt_time_stamp_off(struct vnt_private *priv, u16 rate)
 {
-	return cpu_to_le16(wTimeStampOff[priv->preamble_type % 2]
+	return cpu_to_le16(time_stamp_off[priv->preamble_type % 2]
 							[rate % MAX_RATE]);
 }
 
-- 
2.34.1

