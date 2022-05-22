Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFE7A33E3
	for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 19:48:58 +0000 (UTC)
Received: by mail-ej1-f48.google.com with SMTP id i27so24740081ejd.9
        for <linux-staging@lists.linux.dev>; Sun, 22 May 2022 12:48:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HFVukygACe6EUdSdvL43yBPTzSujU+tWVdTau6xPeDA=;
        b=LdfwdIcjabMdR4vnA1Wix0Iuglxk8n0yUqLAnxGW8p5jYB0mk7ATKmLD/JcpxGmLzJ
         wNZbrBZ4TRS7S2052kV+b6+fvazOY+Xw0dgpg2lAbBZMQ4ejmt4AxM5Db283gPIeBqVI
         Pre4cYyZnP/NYSTo3qiA/NaHL0kdvKe1p1VpgOtQSUGp2aos+Vy7UVuRf/tgQO+YV70S
         SJs4Pbg0FQebmWWN4VjQyNO/h3TrjpLAkuRn2PhbRzK5EOkHRNcbHh7TR+6dyLIu12XN
         qkj6sTMiVfqvh8DccQPz/RqSHS6q8C06+ukB2N/wT3wAPOePfBUr1nyqKohCCy5YE77M
         GAlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HFVukygACe6EUdSdvL43yBPTzSujU+tWVdTau6xPeDA=;
        b=3ov0LRi2IKE1Ei06qQ/1eB+QIhh/1jHC3r5SiSTVcQ0B/WHiTbXGAbhwLHuRzq2q8O
         axKZvS2t6Ar61drcEKr1BFMG+zfNiW/x45RAsb8kS0IPtCfVCHsDBN3kOdo7FmOdINAL
         WTj3Pm2UhhZ8LZIinEL0boTiOb1whXZ605osMywMsX5aweWpnRpJQhmHe/c+pcrxewoH
         E7dDXUz6EMRkzDlJfZUadFzlU4Y7o9/C465DZXDaY1xnLFf/VN4km60xbdbaxSFtAtTg
         AJDJT74lK6dOTgQY+GWsR0270wmKpFzIgTxwfbmviiIayJlwmT8DeCDhI8ebMSp4eGbS
         bizg==
X-Gm-Message-State: AOAM531UGoegOrqalMUPhqiq3+i1JpN9UboFu9vVrmW1hcDb9xuO1Wvo
	7y7r3gJFiyEIbgaKi88bEc26L2hUMes=
X-Google-Smtp-Source: ABdhPJwML15aoNxYXzWXSWz/IgfhUL/W32v2njx4R/N3yEy6Xu2tQJLqWUXT9Dt4GB0tUe8/jnAu2w==
X-Received: by 2002:a17:906:ece3:b0:6f3:da10:138a with SMTP id qt3-20020a170906ece300b006f3da10138amr17138973ejb.438.1653248937218;
        Sun, 22 May 2022 12:48:57 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935774.dip0.t-ipconnect.de. [87.147.87.116])
        by smtp.gmail.com with ESMTPSA id q1-20020aa7d441000000b0042aae0a4699sm7375630edr.60.2022.05.22.12.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 May 2022 12:48:56 -0700 (PDT)
Date: Sun, 22 May 2022 21:48:55 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 03/11] staging: vt6655: Replace MACvWriteISR with VNSvOutPortD
Message-ID: <80cd68a83807209230a898ab0260188adfad4158.1653203927.git.philipp.g.hortmann@gmail.com>
References: <cover.1653203927.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1653203927.git.philipp.g.hortmann@gmail.com>

Replace macro MACvWriteISR with VNSvOutPortD and as it
was the only user, it can now be removed.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/device_main.c | 2 +-
 drivers/staging/vt6655/mac.h         | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 5f28d9ea4232..41bc87d80ad8 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -1055,7 +1055,7 @@ static void vnt_interrupt_process(struct vnt_private *priv)
 	 * update ISR counter
 	 */
 	while (isr && priv->vif) {
-		MACvWriteISR(priv->port_offset, isr);
+		VNSvOutPortD(priv->port_offset + MAC_REG_ISR, isr);
 
 		if (isr & ISR_FETALERR) {
 			pr_debug(" ISR_FETALERR\n");
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index ebadf527a911..42b216897218 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -648,9 +648,6 @@ do {									\
 	iowrite8(byOrgValue, iobase + MAC_REG_STICKHW);			\
 } while (0)
 
-#define MACvWriteISR(iobase, dwValue)				\
-	VNSvOutPortD(iobase + MAC_REG_ISR, dwValue)
-
 #define MACvIntEnable(iobase, dwMask)				\
 	VNSvOutPortD(iobase + MAC_REG_IMR, dwMask)
 
-- 
2.25.1

