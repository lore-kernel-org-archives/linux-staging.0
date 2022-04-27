Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 024F37E3
	for <linux-staging@lists.linux.dev>; Wed, 27 Apr 2022 05:42:21 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id e23so651498eda.11
        for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 22:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7Twn2M/aG8ry6M+Vp8Ty89zIl1BTO6nNE/uGo9m1G2I=;
        b=IvSlC5IeQ61BTR+fxOTMquh3dwuQQfW1I+isdOGbUdT49h/y64bYg1Ty+GvEVNOhv8
         31+qIsY8xdKeex8USo8QV/0IXc4KYuxzwqa9CZC0cJkMauWZ0PuGXMCx3rCbwoYLkFjS
         4xOPWR+3A/qsz6qGddKAA02IteAE8/4O+rV+Q89lqVPXX6CQ4PpdY1T1fhmad34vvKiD
         zb3nw4sLrMMGvkCNaaKkPXQsL/RF29f+6i4cSngwybyXhrxy7LHRjGHwbVVcEqFBQmUS
         omzGwZwjawsUkir7wKaGII2hmJp0F2MAZ9kfYjw4/4mHfAzW+RyB3c77pvbx9h7aNuzw
         +TeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7Twn2M/aG8ry6M+Vp8Ty89zIl1BTO6nNE/uGo9m1G2I=;
        b=kmWCuceZSjDQR4NcOZAUw198jsn5j24uayjB4VH6zPMxxlgmtoq6qMci+wXE2zsUHx
         eUMAs0gwxUYjNjBBXVFulcY2aj7eOXCVshgEVVzgldqQPRpY5a2iwhJfbiu0rY3moQxh
         YXgmLNnwagNknYbZmVXmphsFZR/iQUKezBNNsJNDBus4yccsf/IQAr0UQ3ns0mWE9Ku0
         K/zJym5e0VSunh/xt1TS7JBBwXtqC7L/K/5NzyhGqw5TuO01keafOz741dtel5oeFE95
         Zb3NOkHq9jV/rAPaj184Cj4Di0Ingv9/UOqqBZ6BxNmRTb9aLsrCmKsfButNJ4yFGvWH
         H4EA==
X-Gm-Message-State: AOAM533EJGgVB8PVTfhEAjYyYzODM4nuWITCNuphac4SVFW22JSKaTEC
	LOJrrD7xt315LP3B9DWzLaE=
X-Google-Smtp-Source: ABdhPJxaCxDvGhtQBBVE51ECwdwSwARlL6R5jtujsL7EP4+OhDh2fnTtoq8VMJ9KPoplaOsUtCgR8w==
X-Received: by 2002:aa7:d310:0:b0:425:f22f:763f with SMTP id p16-20020aa7d310000000b00425f22f763fmr12066122edq.163.1651038140447;
        Tue, 26 Apr 2022 22:42:20 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id y3-20020a50ce03000000b00425bfb7f940sm7571748edi.11.2022.04.26.22.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 22:42:20 -0700 (PDT)
Date: Wed, 27 Apr 2022 07:42:18 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] staging: vt6655: Replace MACvReadISR with VNSvInPortD
Message-ID: <ddd403a3f590cb81403197442b12c3986c98ba25.1651036713.git.philipp.g.hortmann@gmail.com>
References: <cover.1651036713.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651036713.git.philipp.g.hortmann@gmail.com>

Replace macro MACvReadISR with VNSvInPortD and as it was the only
user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Shorted and simplified patch description
V2 -> V3: Added missing version in subject
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

