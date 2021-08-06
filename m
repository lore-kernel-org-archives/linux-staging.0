Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7934972
	for <linux-staging@lists.linux.dev>; Fri,  6 Aug 2021 21:32:43 +0000 (UTC)
Received: by mail-oo1-f54.google.com with SMTP id n1-20020a4ac7010000b0290262f3c22a63so2574521ooq.9
        for <linux-staging@lists.linux.dev>; Fri, 06 Aug 2021 14:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0FFKOfNVS5j/32Zs1ttdVtGfFgL6Hp+Qlqyo96Y9neY=;
        b=SbCCan87vLHRS9fzbj82MVNv0FEhyJ2TuWHyP/huHeROPSRKo8yavpOj9UVbkchFXL
         arba7bkHfZG4wYKtD6JPxnZWNL+qIM+wstEdl8xoS4LjZHkkN5KieE7h+WGjXW97/U8R
         E1s+OBF+pWS9B+rN7/sNg534UYFaj7NrQq0jH/O+15QvVHawzeuVpmFOfcpBBbymixBS
         gxnoms/rr0fpdgtbUXKi8PXI51JTwWm30hT48tXCPROIN5S7/lg59LudtLDXbx6a92rW
         DiHtwXd4FgOXznLO3LZqurk4Lq2+Gsn+qNCr1c7cacrBL1B/gvINZnUjOuG7nUQjrxIa
         OhTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=0FFKOfNVS5j/32Zs1ttdVtGfFgL6Hp+Qlqyo96Y9neY=;
        b=m3T/1D2kHQDnuEwiBpCQDbc7aT1FmN8oBKutXfqt6SF2Qo9icjdkebDJbKULY4o5BM
         uSeq3e94Ln2BLYZULKeGWTj/Td1rDrK66rDdU+6r2QZ62A+7gO5OQ948bxExi7447Mrz
         C8ZN1kQn1QfRUg5iBDEEYHdzEF7W0C/JKLI6lOogLm54JKY9SBDznxM/VIGzwZ7qvNrH
         O6WLSNKTCt5kJEs0yPd6tNhl8wpa2hBfuP55ZXpfNrn76ewRtx/MuxGVikx0r8Qf/RCR
         ++qe1LTUGI/X1FV8z7W4h23N2EpcNt+9qaAdK//H1nfWWc/3tmU10pEteQ6rhkyiEWT3
         tExg==
X-Gm-Message-State: AOAM533bkIe+UQJfu+9dc4+0P4dW2STAY2BNeYwHJkRmXMmD/1UlIguE
	Lwnu6yxvzd+II5suFvitUQQ=
X-Google-Smtp-Source: ABdhPJzam/GUFFewKobEvnxt+6II5fjJ1JU2Z/09c0B8BunffUD/RI7cHK7yNlhqNGLBQBcxZ2C7ow==
X-Received: by 2002:a4a:ea37:: with SMTP id y23mr6892930ood.39.1628285562534;
        Fri, 06 Aug 2021 14:32:42 -0700 (PDT)
Received: from 2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com.com (2603-8090-2005-39b3-0000-0000-0000-100a.res6.spectrum.com. [2603:8090:2005:39b3::100a])
        by smtp.gmail.com with ESMTPSA id d7sm1504882oon.18.2021.08.06.14.32.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Aug 2021 14:32:41 -0700 (PDT)
Sender: Larry Finger <larry.finger@gmail.com>
From: Larry Finger <Larry.Finger@lwfinger.net>
To: gregkh@linuxfoundation.org
Cc: phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] staging: r8188eu: Fix potential memory leak or NULL dereference
Date: Fri,  6 Aug 2021 16:32:35 -0500
Message-Id: <20210806213235.22349-1-Larry.Finger@lwfinger.net>
X-Mailer: git-send-email 2.32.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In routine c2h_wk_callback(() following a kmalloc() call, the
error recovery is flawed. If the kmalloc() returns a pointer
that is not NULL, and the following c2h_evt_read() fails, the
code will leak that buffer. If the kmalloc() fails, a NULL
dereference will occur in the following code.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Larry Finger <Larry.Finger@lwfinger.net>
---
 drivers/staging/r8188eu/core/rtw_cmd.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_cmd.c b/drivers/staging/r8188eu/core/rtw_cmd.c
index c3a9051ca10c..238ae79f4141 100644
--- a/drivers/staging/r8188eu/core/rtw_cmd.c
+++ b/drivers/staging/r8188eu/core/rtw_cmd.c
@@ -1908,8 +1908,12 @@ static void c2h_wk_callback(struct work_struct *work)
 			c2h_evt = kmalloc(16, GFP_KERNEL);
 			if (c2h_evt) {
 				/* This C2H event is not read, read & clear now */
-				if (c2h_evt_read(adapter, (u8 *)c2h_evt) != _SUCCESS)
+				if (c2h_evt_read(adapter, (u8 *)c2h_evt) != _SUCCESS) {
+					kfree(c2h_evt);
 					continue;
+				}
+			} else {
+				return;
 			}
 		}
 
-- 
2.32.0

