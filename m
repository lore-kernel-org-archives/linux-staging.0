Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47462173
	for <linux-staging@lists.linux.dev>; Mon,  3 Jan 2022 19:40:14 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id y22so139761483edq.2
        for <linux-staging@lists.linux.dev>; Mon, 03 Jan 2022 11:40:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=KeBS7T+z3+RFfIW5vzlPf8GNtNuS/+GT4QZbada5eqM=;
        b=j2JW1HaTairBLqiT7eFzSqGa5+3RHmml3yC0s+mBeDO9SZvxNB0FntkrB9ssFzF5vw
         561sjHwJTMzdzzoqEZWbwSPwDhTTc4q5sFgUG6kbWccCIrwDFImxzigET2WLowM5ZEkl
         EsJRuqHLcD5vCnZwPBfv7LGxVrGCWBlRv96T41ALjGi51RcmoX8cGhYQpvYHkzO8BALs
         atEd82tpUx6db83SXDr+bmKRs7/zCDOQaHgy8SWmJYplk32yfECJT1b7CfOHUxz5Wqeu
         XKHWAUC8yOwdMcGq8S3oVljeuMv5XabmtyMWhwANMaTpBvjdLrd/BUr7sl4Gjci/VFlW
         vBGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=KeBS7T+z3+RFfIW5vzlPf8GNtNuS/+GT4QZbada5eqM=;
        b=HZMP2/6c0FXhP9qO11L4ohKMEJkXegIvOCXb/198s6EiV9j9TOuXfcwQjw7s47PE8A
         iHxZDiQv4bcSAHumvZKGB+OGSZKpKhE5ZTPuy7yu/mXBCJo9a5ZpJJ9Uk5AkjIHT63aa
         LfHprbWOFu6vE393jWPqGha4SZhKz9OWIPWGIgaK6EXlDkcudLqB6CT/qYE8lPB09uYd
         tvxcq9KM2qpIRTI5b0V+buXmPxVoBacTmTKFTUHQQKh0koMusyP33LQ5BxGS64/3cSt5
         O/vzn0ZnVNt/qENPY+S6ZIk6GEnwrGRM4sY6sJ/5UC1tJLkfNY1mg2J27vmfs//36Z0Q
         noIg==
X-Gm-Message-State: AOAM532O7/YtAWUBBXv282eP5c3LwZwf1z29AlWPmupEulcmgJLFPC4h
	1C/siC4rc72cbtE2k3WsHNc=
X-Google-Smtp-Source: ABdhPJxcvm9zELUx8UpELVzNDSMsWyYXdYW7kwbDp+QuQpSBC1NmEGNRh1WfI7tbPhPhkdM6crO86A==
X-Received: by 2002:a17:907:9694:: with SMTP id hd20mr35891559ejc.360.1641238812749;
        Mon, 03 Jan 2022 11:40:12 -0800 (PST)
Received: from t470p.fritz.box (host-87-18-201-21.retail.telecomitalia.it. [87.18.201.21])
        by smtp.gmail.com with ESMTPSA id gt20sm7009614ejc.11.2022.01.03.11.40.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Jan 2022 11:40:12 -0800 (PST)
From: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
To: 
Cc: alb3rt0.m3rciai@gmail.com,
	linuxfancy@googlegroups.com,
	Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Martin Kaiser <martin@kaiser.cx>,
	"Fabio M. De Francesco" <fmdefrancesco@gmail.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Saurav Girepunje <saurav.girepunje@gmail.com>,
	Ivan Safonov <insafonov@gmail.com>,
	Yang Li <yang.lee@linux.alibaba.com>,
	Zameer Manji <zmanji@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 37/56] staging: r8188eu: remove dead macro SetFragNum
Date: Mon,  3 Jan 2022 20:02:12 +0100
Message-Id: <20220103190326.363960-38-alb3rt0.m3rciai@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
References: <20220103190326.363960-1-alb3rt0.m3rciai@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove dead macro SetFragNum.

Signed-off-by: Alberto Merciai <alb3rt0.m3rciai@gmail.com>
---
 drivers/staging/r8188eu/include/wifi.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/r8188eu/include/wifi.h b/drivers/staging/r8188eu/include/wifi.h
index 652a31da0556..4b5dd73c391e 100644
--- a/drivers/staging/r8188eu/include/wifi.h
+++ b/drivers/staging/r8188eu/include/wifi.h
@@ -223,14 +223,6 @@ enum WIFI_REG_DOMAIN {
 #define get_frag_num(pbuf)			\
 	(le16_to_cpu(*(__le16 *)((size_t)(pbuf) + 22)) & 0x0f)
 
-#define SetFragNum(pbuf, num) \
-	do {    \
-		*(unsigned short *)((size_t)(pbuf) + 22) = \
-			((*(unsigned short *)((size_t)(pbuf) + 22)) &	\
-			le16_to_cpu(~(0x000f))) | \
-			cpu_to_le16(0x0f & (num));     \
-	} while (0)
-
 #define SetSeqNum(pbuf, num) \
 	do {    \
 		*(__le16 *)((size_t)(pbuf) + 22) = \
-- 
2.25.1

