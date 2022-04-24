Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 957FC17F5
	for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 07:44:21 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id j15so3431379wrb.2
        for <linux-staging@lists.linux.dev>; Sun, 24 Apr 2022 00:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fgBUlpHj30ipZDs3qRp+zmtHfcJ9iQ4ROlt9IZ+zLbQ=;
        b=SQGD+ZnRqFlyZ3xkIBi0A13arggBjEqcJZybJI+jfnlOtPd4mPV9x1ixhIK1Xujs+x
         z3NyWkCTehYUW7i4AFXuOe0cKNujen8oPXftS101OLn5qTYXP3Y2xDicYZozrCcA9xEl
         CDwmjBwXUsoOMLnejwXJbUM+JRw9+SSmox25+wCEmLpKY5MnsTTYjQ9GFoLEwmFLEqZy
         PqUSajtaD1As9IHUMwSBxyAvaOVbPftf4B5b/Agwv0yYMaoNJydDFjuciwaGPTVowWGo
         X1y0+6mhtoKLRX8bwa1pIwMRPtBuhmnXk3xt3WxXe0Bg+fVVOPe1Ao+0wv5Lbeb2dvpE
         sunQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fgBUlpHj30ipZDs3qRp+zmtHfcJ9iQ4ROlt9IZ+zLbQ=;
        b=6LDfArzAiTEP8AogG3QqG6GsuKDsHfgk4fE1944ZASKKbN1FbeqleeUsMMKFb8BV12
         EzAS+6jOE0cjN+hmuIfJzml+NvUzsQH8eqvpIk+YsOE5oUg4sAVkL87ws+GS3EWqZ1Tw
         IPi4eg2Hc5/LXOcqseB6N+4GMUywCIs03amsHFSTpUQrnSC9ha/RFvSOQP5Aj5K8RMr/
         XBWRvCXq6pdVgYCYf6oBSG2SxH/IbjvwsDyl3kC+89jmYCmx5sZMrbaOa7LPT+SC2Krh
         kVPxNZXAR9TGVAfw7TCHraBfBvseQF9h1+dPE4aXks+vSzZyqhkPmqq+zWPSYAFyfA1N
         fAlQ==
X-Gm-Message-State: AOAM532ocM/A4d7Ryp18qazbHOiQKDbyTGAVLE7vXI1ZhjwCx+VxqZSa
	bsasDHBNbTW8dsHkCCK04vI=
X-Google-Smtp-Source: ABdhPJwCE2i/PMu0ZLvVFCAPgiI7YPCqLiY3wi0vWCwhmwqtEKfZ+9KhiZPyE2CS+uon6yCDmN/bvQ==
X-Received: by 2002:a05:6000:1d83:b0:203:ed96:fa4c with SMTP id bk3-20020a0560001d8300b00203ed96fa4cmr9919302wrb.400.1650786259896;
        Sun, 24 Apr 2022 00:44:19 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id i7-20020a5d5587000000b00207a8cde900sm5769411wrv.19.2022.04.24.00.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Apr 2022 00:44:19 -0700 (PDT)
Date: Sun, 24 Apr 2022 09:44:17 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] staging: vt6655: Replace MACvReadISR with VNSvInPortD
Message-ID: <c819500877055aa4e8d3221dd953b6c92c3ca802.1650784817.git.philipp.g.hortmann@gmail.com>
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

Replace macro MACvReadISR with VNSvInPortD.
Last patch within this patch series will replace all macros
VNSvInPortD with ioread32. The names of macros and the arguments
use CamelCase which is not accepted by checkpatch.pl

Since there are more than one checkpatch issue per line,
more steps are rquired to fix.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 4 ++--
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 7cceb57a5139..c21787f32252 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1029,7 +1029,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 	u32 isr;
 	unsigned long flags;
 
-	MACvReadISR(priv->port_offset, &isr);
+	VNSvInPortD(priv->port_offset + MAC_REG_ISR, &isr);
 
 	if (isr == 0)
 		return;
@@ -1116,7 +1116,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 		    ieee80211_queue_stopped(priv->hw, 0))
 			ieee80211_wake_queues(priv->hw);
 
-		MACvReadISR(priv->port_offset, &isr);
+		VNSvInPortD(priv->port_offset + MAC_REG_ISR, &isr);
 
 		MACvReceive0(priv->port_offset);
 		MACvReceive1(priv->port_offset);
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index 74b45e1f0963..5aaa0de20e67 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -666,9 +666,6 @@ do {									\
 	VNSvOutPortB(iobase + MAC_REG_STICKHW, byOrgValue);		\
 } while (0)
 
-#define MACvReadISR(iobase, pdwValue)				\
-	VNSvInPortD(iobase + MAC_REG_ISR, pdwValue)
-
 #define MACvWriteISR(iobase, dwValue)				\
 	VNSvOutPortD(iobase + MAC_REG_ISR, dwValue)
 
-- 
2.25.1

