Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA7B6D18
	for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 14:13:30 +0000 (UTC)
Received: by mail-pf1-f173.google.com with SMTP id k19so2273936pfc.11
        for <linux-staging@lists.linux.dev>; Wed, 18 Aug 2021 07:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=pathpartnertech.com; s=google;
        h=mime-version:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=OFpHweS/JQ3nqb6EquukVDDOgXnX34E/VyawLNfBUGQ=;
        b=qIrjgaFUpOYCFS16Znu3m2ffDS9rT4371rnPKMR0z+4yAKGhi6HdGLD0+GQRFuBqBy
         2+COOXDZSTvyO5BoWPqaW+Ozv4cwXwz/ZstzlsgSOn0KWTQVFQIlbFRvB7mkCeQqDQxO
         F9uO5uqZ253MtIjYsl750rSDFVipfayu+8YzHxqjzJCopmrWGdtRk9vx6YM3lrqBgSFO
         ISdI4RsrovhDOkVneIDiS11SOBWAilSPdUu2efruxi9kSYoVhpXd3t6TyeKorTlxpwy+
         EfciVKQt53H6OIBk9Z18l3W1XWo/AZ6y1SU9iozJN0DTBzTFvYVXQi8pAcmyEz69SNi2
         JRWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :in-reply-to:references;
        bh=OFpHweS/JQ3nqb6EquukVDDOgXnX34E/VyawLNfBUGQ=;
        b=JicgsEvoZqzh7kJdP2gmU9LeK4ic9toEG2D91tWiCc8hZHqm6KzcvsYdSV/5jtMMB+
         2TGmdAuztcLkwXNOWScW5OlqCeoz62DuDGrOiXmMcT3Xdu/QxEp0JeS3ll94Oi2j+sFY
         hxfGhQ1nz3tb6s6zDYA7oYI/rpi2BvKkxi72SKcvHqnWd3Ziblm5b6viTlNAcx3fC894
         jED6qmRGonrmb6FOLOjkC3hRLlNRN2pPyzDzXNuSwXxLeU+1vH0tCZKfghUtCgVUrY72
         o786hhJ2ngzCeA/z/4ZPh3lJHlp45Ux5od0uL4/K3xRICl0U1DU+rYUxCosdATdWqWu9
         LNCw==
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Gm-Message-State: AOAM533id2AV/4O5YLiNsxgtpJsYAEbP8EejbNFaOYJNq9Qb/YnAeH1J
	xv6u76STh8lkXmhRPnxyga02uVPwEAduLdMwimJVLQI7UZO/4H9xYcMGqjOuboaN++EPiQbf9JM
	7qu6wIIw1hFSm9infilY=
X-Google-Smtp-Source: ABdhPJzJFl0khqx5jqtp4TZDJFPqk5KxTnnqJXM3m1MLT0D7usuLVQ1pxYZhnGa0vAXluGhJBOCsow==
X-Received: by 2002:a05:6a00:1583:b0:3e2:2ae3:2ba8 with SMTP id u3-20020a056a00158300b003e22ae32ba8mr9534018pfk.58.1629296010096;
        Wed, 18 Aug 2021 07:13:30 -0700 (PDT)
Received: from localhost.localdomain ([49.207.214.181])
        by smtp.gmail.com with ESMTPSA id e8sm8084343pgg.31.2021.08.18.07.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 07:13:29 -0700 (PDT)
From: sidraya.bj@pathpartnertech.com
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: prashanth.ka@pathpartnertech.com,
	praneeth@ti.com,
	mchehab@kernel.org,
	linux-media@vger.kernel.org,
	praveen.ap@pathpartnertech.com,
	Sidraya <sidraya.bj@pathpartnertech.com>
Subject: [PATCH 29/30] arm64: dts: dra82: Add v4l2 vxd_dec device node
Date: Wed, 18 Aug 2021 19:40:36 +0530
Message-Id: <20210818141037.19990-30-sidraya.bj@pathpartnertech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
References: <20210818141037.19990-1-sidraya.bj@pathpartnertech.com>
Content-Type: text/plain; charset="US-ASCII"

From: Sidraya <sidraya.bj@pathpartnertech.com>

Enable v4l2 vxd_dec on dra82

Signed-off-by: Angela Stegmaier <angelabaker@ti.com>
Signed-off-by: Sidraya <sidraya.bj@pathpartnertech.com>
---
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
index cf3482376c1e..a10eb7bcce74 100644
--- a/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
+++ b/arch/arm64/boot/dts/ti/k3-j721e-main.dtsi
@@ -1242,6 +1242,15 @@
 		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
 	};
 
+	d5520: video-decoder@4300000 {
+	       /* IMG D5520 driver configuration */
+	       compatible = "img,d5500-vxd";
+	       reg = <0x00 0x04300000>,
+		     <0x00 0x100000>;
+	       power-domains = <&k3_pds 144 TI_SCI_PD_EXCLUSIVE>;
+	       interrupts = <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>;
+	};
+
 	ufs_wrapper: ufs-wrapper@4e80000 {
 		compatible = "ti,j721e-ufs";
 		reg = <0x0 0x4e80000 0x0 0x100>;
-- 
2.17.1


-- 






This
message contains confidential information and is intended only 
for the
individual(s) named. If you are not the intended
recipient, you are 
notified that disclosing, copying, distributing or taking any
action in 
reliance on the contents of this mail and attached file/s is strictly
prohibited. Please notify the
sender immediately and delete this e-mail 
from your system. E-mail transmission
cannot be guaranteed to be secured or 
error-free as information could be
intercepted, corrupted, lost, destroyed, 
arrive late or incomplete, or contain
viruses. The sender therefore does 
not accept liability for any errors or
omissions in the contents of this 
message, which arise as a result of e-mail
transmission.
