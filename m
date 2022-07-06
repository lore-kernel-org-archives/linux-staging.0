Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21A517C
	for <linux-staging@lists.linux.dev>; Wed,  6 Jul 2022 19:19:05 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id k30so12360821edk.8
        for <linux-staging@lists.linux.dev>; Wed, 06 Jul 2022 12:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pJs6YpPMXJBKMv5cs8ZYrf6cf8wF5M5B8N8jxRJcpPg=;
        b=dPtR0T2CMTa9s7441XqtntYU0TcOhB+ctD8fbFxmFil8ZaBkkURe6NKC8Om4h6NqPq
         YtN/8WONvvOWiIlQ61wamEAeoMTH9GLZlQIQCn6YP+K9Ry7YDe+6bvci1n770G34y3P2
         YRKdY2i0UzHlRx+u7g1kji625wkXo0zCpLY/2sykDBwshgytyCZS/0WU4f1PAljWUuEt
         yx7MPHDJcJHY3PdCdawLNubW0GsziUq9UWXxtbSK+k6lhlCHwmGigDI1zbq9s1kWDwgI
         9u/eFe6j8b7s8JUEwCPdClHidOZ8oD9nWrTBW5q7o+zQcINqUp+Zmg4CiituAVn4pgww
         rUEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pJs6YpPMXJBKMv5cs8ZYrf6cf8wF5M5B8N8jxRJcpPg=;
        b=YBhiA0V6+VUTakYIh72PetZlHMgsJifCM+C6DVpbvK0ew1E3ffAe3y7yyXqUsGaXNo
         fDfqsAmRY5VYtB2Cq6gzCgJS41PE2PL7hG1p9sPndLy6ETOuH7USc8OQKGvj5y4n3lSE
         CdYcUA73S1ZHn1lM0tL1eD8yLWW3fM/HgcolUgwqPodqsx6vCimti+2ap9C2dRDZcM6u
         TM+63ErcWBfz3sheCbWv053/13SCIEko1ePm973qgsH2z5+tbP+fZ2J2qkHjbBTZyXds
         POXTvOuvXlrIgpYn02DB4p7zQfPGKrNV/pqaqyDMiQpOPfPRvudh5yHF/MKs8/haDew2
         dIOw==
X-Gm-Message-State: AJIora8Ib3yhkaw5/pWBixlVeaageeX2a0fCBtnkhKITicGoxeGTfWfJ
	fRg/loHlgjXO7cGxJEybtTQ=
X-Google-Smtp-Source: AGRyM1tZi1MWEz9TiMijACO9+VcDGJ5yuTRBsJsWHs1CYRMQNrNePMZRKej5VKvd45iNWVQ6EGkcYA==
X-Received: by 2002:a05:6402:1658:b0:43a:91cd:2ffb with SMTP id s24-20020a056402165800b0043a91cd2ffbmr2824351edx.277.1657135143483;
        Wed, 06 Jul 2022 12:19:03 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id s17-20020a1709060c1100b00722e52d043dsm17731397ejf.114.2022.07.06.12.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 12:19:03 -0700 (PDT)
Date: Wed, 6 Jul 2022 21:19:01 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Joe Perches <joe@perches.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] staging: vt6655: Use loop in vt6655_mac_write_bssid_addr
Message-ID: <b3b93ae7ce41562565e9007eb4580b9c47a2881f.1657134099.git.philipp.g.hortmann@gmail.com>
References: <cover.1657134099.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1657134099.git.philipp.g.hortmann@gmail.com>

Use loop in vt6655_mac_write_bssid_addr to avoid multiple
similar statements.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
Code for testing:
for (int i = 0; i < 6; i++){
	iowrite8(mac_addr[i], iobase + MAC_REG_BSSID0 + i);
	printk("i = %i\n", i);
}

Log:
[ 2592.189081] i = 0
[ 2592.189083] i = 1
[ 2592.189083] i = 2
[ 2592.189084] i = 3
[ 2592.189084] i = 4
[ 2592.189085] i = 5
---
 drivers/staging/vt6655/device_main.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vt6655/device_main.c b/drivers/staging/vt6655/device_main.c
index 298963cbca1d..099f0b95417a 100644
--- a/drivers/staging/vt6655/device_main.c
+++ b/drivers/staging/vt6655/device_main.c
@@ -192,12 +192,8 @@ device_set_options(struct vnt_private *priv)
 static void vt6655_mac_write_bssid_addr(void __iomem *iobase, const u8 *mac_addr)
 {
 	iowrite8(1, iobase + MAC_REG_PAGE1SEL);
-	iowrite8(mac_addr[0], iobase + MAC_REG_BSSID0);
-	iowrite8(mac_addr[1], iobase + MAC_REG_BSSID0 + 1);
-	iowrite8(mac_addr[2], iobase + MAC_REG_BSSID0 + 2);
-	iowrite8(mac_addr[3], iobase + MAC_REG_BSSID0 + 3);
-	iowrite8(mac_addr[4], iobase + MAC_REG_BSSID0 + 4);
-	iowrite8(mac_addr[5], iobase + MAC_REG_BSSID0 + 5);
+	for (int i = 0; i < 6; i++)
+		iowrite8(mac_addr[i], iobase + MAC_REG_BSSID0 + i);
 	iowrite8(0, iobase + MAC_REG_PAGE1SEL);
 }
 
-- 
2.37.0

