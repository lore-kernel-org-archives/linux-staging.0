Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F9817F5
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 07:44:15 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id w4so16639804wrg.12
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 00:44:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=XMF+gMN9bhGYDlM3pFVKQ1yvAcKiJtAzC5AwaU+IPA0=;
        b=ZDvOWeSp+/f+BDi5HK/bFni4dJxfkbK0SvMwv6Qv1BBbaWjz9cpBB3+1cnJiwvpx7l
         qVVPXrWkM/gykvnbz7qxAcvCNT5xwNqLyVtGZ17yEBYa66Jry6HeoQ8ocI2YqgGSkoMT
         anq66aTWr06mE2O7zvptqqGUNntZgHbTxRW2E1K7O8xirFNTijsz8Xe+w1AIRcI1P+8D
         qzTOOFd/A3TmXpdH1sWnIAe22pj5M9RWEBBkJzMfDKGrTzMoJXCnjPYqp95qtspZ3Qd7
         i1a8zenCfN/uotMDBSejcN0N7iiv8CqUz4lTBU4yA4Y1PQNg08PUQ2k1PzXMrCI4qO53
         D3Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XMF+gMN9bhGYDlM3pFVKQ1yvAcKiJtAzC5AwaU+IPA0=;
        b=umg+syy0/BbD/yH0UfL7E81VzMFt/LcPrXSNiCKLa+36HulRiD1eJSBABAwfUAsYqV
         bsvWSEonVeuMPZ+60ymfSXrWUJQS/aI+gy5vV9b4a+aUaoJCGjIraLMbeOQya9wDKq/h
         HRQSQC6+4FhIUHQRg04tqteSFU7K6AvyKx+lGwenS6STYGvPrSqYrIqNf+hrRXm0gH3r
         1e9DbK5GgbvaKpU9wjoLMq0m+3eWFLW1ClhmAZuOw1fuYJ+DbFpBv9f5uxzCmEIAIIu+
         14V4/H4MbXrHYbyomXvH4pslOXjUzZLDaFwWGWsUuAOxvrGJJApAOXiJ5RrZURT7p1zx
         iUrA==
X-Gm-Message-State: AOAM531Z171z2vHz0Sf3WiWVOzuPKF+wapP51W8SF9tPf6hTO53VyFJr
	CUWx7ffB0aLN7Xr/C+fwjCoFzSuVB1c=
X-Google-Smtp-Source: ABdhPJzhxDdUI4l6zvYKUDfy+krONxhiqUq+YF1HSrTGYdkqScYp0jMP9GJQcs/+uc4U3vk5h8PRTA==
X-Received: by 2002:a05:6000:1f91:b0:207:b6b1:64a9 with SMTP id bw17-20020a0560001f9100b00207b6b164a9mr9687866wrb.286.1650786253911;
        Sun, 24 Apr 2022 00:44:13 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id u16-20020a05600c441000b0038ebcbadcedsm10016908wmn.2.2022.04.24.00.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 00:44:13 -0700 (PDT)
Date: Sun, 24 Apr 2022 09:44:11 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] staging: vt6655: Replace MACvReadMIBCounter with
 VNSvInPortD
Message-ID: <2a50f3e99b15db2100f93e1e1a2b5cbc13b82882.1650784817.git.philipp.g.hortmann@gmail.com>
References: <cover.1650784817.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1650784817.git.philipp.g.hortmann@gmail.com>

Replace macro MACvReadMIBCounter with VNSvInPortD.
Last patch within this patch series will replace all macros
VNSvInPortD with ioread32. The names of macros and the arguments
use CamelCase which is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 08b955c71b3c..7cceb57a5139 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1042,7 +1042,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 	spin_lock_irqsave(&priv->lock, flags);
 
 	/* Read low level stats */
-	MACvReadMIBCounter(priv->port_offset, &mib_counter);
+	VNSvInPortD(priv->port_offset + MAC_REG_MIBCNTR, &mib_counter);
 
 	low_stats->dot11RTSSuccessCount += mib_counter & 0xff;
 	low_stats->dot11RTSFailureCount += (mib_counter >> 8) & 0xff;
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 4c6739862188..74b45e1f0963 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -684,9 +684,6 @@ do {									\
 #define MACvSelectPage1(iobase)				\
 	VNSvOutPortB(iobase + MAC_REG_PAGE1SEL, 1)
 
-#define MACvReadMIBCounter(iobase, pdwCounter)			\
-	VNSvInPortD(iobase + MAC_REG_MIBCNTR, pdwCounter)
-
 #define MACvEnableProtectMD(iobase)					\
 do {									\
 	unsigned long dwOrgValue;					\
-- 
2.25.1

