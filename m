Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7837E
	for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 20:02:26 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id i27so38232837ejd.9
        for <linux-staging@lists.linux.dev>; Tue, 26 Apr 2022 13:02:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=nKYj1zApLX3Siev5H3zAoIfh5wybFWsTCDDUKvzfiUg=;
        b=ZlB/E0idSI22FbmVUHDGhF8PfXOtPl5Jfp+73C5JW2Fcq3EV7NNQw5W6Pgy9ruImOq
         3yTNE2EwVS1Ivg+eJRzbuwmaaR2xqst83JZSA761RmB7VzejKU8+Y474j2Itd8ohe+m0
         RovrzxYmpS/q5OqUlJ6om0Sg9B5hxVzfPWM9Yy6q/LhD1t+vySfzC53xQmmWINaWgtPz
         vO7Cm7hEntgT3CDns+A8mLsGx6sawSI6tr5kkQnjEn5xWlTtj1A0fFk7tr3iI6yQAHOG
         LLO/BSOH10rlOXuys7rKGnqHYlB+YkaeVF0nZKDTQbpF35J4VxegxkntsdXU2DTHi3Go
         aLlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nKYj1zApLX3Siev5H3zAoIfh5wybFWsTCDDUKvzfiUg=;
        b=qjD1QhSuaQtqNdNfkhxlLnFZ6lJcLZRB9SeNm9gDtdJ4DwpMQjQXkT4abg1vBy6Pay
         BxCBuANZkofaWh5Ik4aETu+A3k94Y+PYurdIn06ST9g+ByjZkRriott9qCyvkIZBloAs
         sk7dTXS2+TVQtQGO9Y8g9dZ4q0IZIDDekCH9erqy96P/TezRiToNNxdcsvOnB1utyBT0
         b+QTnhRtw1sszZXh79T1S/ZCs9qMX5XvBnDLIcc5a5mCjT5pCebjAjha508b1fAHSbwE
         Xl6Q/e6do/COknglgLAK80DywFa2dLNnBhdE5F3Pa7K4m3Lj10yUvRJEAESIVYTSaqSA
         YBJw==
X-Gm-Message-State: AOAM530ZWBv9q0N3c3DDwzjkloKR8u+kpWTyHeLGaLxxvc+UpxHj7QWo
	R8nYE2gQfHs17buaXGp+yRo=
X-Google-Smtp-Source: ABdhPJyo9ATeFt/36fxCFBPwfX7wkygBsrGYk+hR9bNNjn3ebHcJUgpgIlM7WkoO8E9iHgHtT6QP4g==
X-Received: by 2002:a17:907:1ca8:b0:6f3:6d36:b2e3 with SMTP id nb40-20020a1709071ca800b006f36d36b2e3mr17980811ejc.88.1651003345022;
        Tue, 26 Apr 2022 13:02:25 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a074e9.dip0.t-ipconnect.de. [84.160.116.233])
        by smtp.gmail.com with ESMTPSA id i2-20020a1709061cc200b006f386217c6bsm3638526ejh.124.2022.04.26.13.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Apr 2022 13:02:24 -0700 (PDT)
Date: Tue, 26 Apr 2022 22:02:22 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] staging: vt6655: Replace MACvReadISR with VNSvInPortD
Message-ID: <66146b6881b792206eccb7ba7eacdfbaea56ab42.1651001609.git.philipp.g.hortmann@gmail.com>
References: <cover.1651001609.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1651001609.git.philipp.g.hortmann@gmail.com>

Replace macro MACvReadISR with VNSvInPortD and as it was the only
user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
V1 -> V2: Shorted and simplified patch description
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

