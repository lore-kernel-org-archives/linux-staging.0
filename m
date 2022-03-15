Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02767A
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647374985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIJlhxZQII2b1Vl5R2eePvHRFchgJiZqPqucMSOZBVI=;
	b=Ff9tdyuDJjRBkAuu+qtygmkcchQold0QRyQVQOrepJSziLRlWAAewmtEVwKRVE/NQMOsiB
	qsT+fLEAEQJnnYQxLxv43xMXhVMmNBFLvoq+UxjAbwXVMPrd4r96LD7ZuqW9QoCl0gS7KY
	0/hFZvan6YeK4Vh0Cd6bRNdhyTEcEA0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-433-Y9JACwqVP6mqkASoERt2DQ-1; Tue, 15 Mar 2022 16:09:44 -0400
X-MC-Unique: Y9JACwqVP6mqkASoERt2DQ-1
Received: by mail-qt1-f200.google.com with SMTP id f22-20020ac840d6000000b002dd4d87de21so85075qtm.23
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 13:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIJlhxZQII2b1Vl5R2eePvHRFchgJiZqPqucMSOZBVI=;
        b=VcGqbNKRA7Ij4Wnl6Mr7K6+UUljhFzDSp58kpVp4D2UbcqZKzMUpIMr/TnN8rVfqTJ
         Ys+Yrrckoqjc54av/wi3kYncqbODxRMA3u7kWvozly8Wm3/oM801qXCdirF6H3Yu8HLt
         jMLT9jk4DQrwaSfgkT35cpRv8TH//MI49Fo1EY2mQKDM0Bqcd7S6peRmxpFdGi6SRvpi
         X4PRAn9U1aQQ5r2jDeAJTRoUCEuIv/nVpqM/xhAbYLVU51k7QuRbS+P3KS8EA6ug/Cvn
         2t+VUudE4TgmRma+w0R83914WTwm+ZrhiTeh6mqsnsIHTM43WvXBpC1cfquf0jsaq5T8
         ECjw==
X-Gm-Message-State: AOAM533CfB8keMcrczeaxEAr01CiE5sMPUOKKDangEqO1AJOlEkLyN9K
	a10lApgxTTClOLDC3w4byHyKahxBUulHaf8lavSFhP8Y/l0QxMJgR1dUSKZAjY9hL5NCvFJ9HsY
	+gijkKAGX6KRddK4/IyBOq29rYA==
X-Received: by 2002:a05:6214:27c6:b0:438:ff55:f2ad with SMTP id ge6-20020a05621427c600b00438ff55f2admr19812289qvb.14.1647374984312;
        Tue, 15 Mar 2022 13:09:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBAm8qJM4uO8E8XkhhgJ83X1MYV1taiReK2amKwIwz+dojqDUprSq/T2eq8pIQxnEiC+JolA==
X-Received: by 2002:a05:6214:27c6:b0:438:ff55:f2ad with SMTP id ge6-20020a05621427c600b00438ff55f2admr19812260qvb.14.1647374984094;
        Tue, 15 Mar 2022 13:09:44 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id 197-20020a3703ce000000b0067af869ffa6sm9582433qkd.127.2022.03.15.13.09.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 13:09:43 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Adrien Thierry <athierry@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Stefan Wahren <stefan.wahren@i2se.com>,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gaston Gonzalez <gascoar@gmail.com>,
	Ojaswin Mujoo <ojaswin98@gmail.com>,
	linux-staging@lists.linux.dev
Subject: [PATCH 2/2] staging: vchiq_arm: Use bcm2711 compatible string for bcm2711-based RPi
Date: Tue, 15 Mar 2022 16:09:29 -0400
Message-Id: <20220315200929.74952-3-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220315200929.74952-1-athierry@redhat.com>
References: <20220315200929.74952-1-athierry@redhat.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=athierry@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

Use bcm2711 compatible string in vchiq driver and device tree for
bcm2711-based Raspberry Pi (Raspberry Pi 4). This is consistent with
what the downstream device tree uses, and allows running the vchiq
driver on the upstream kernel with the downstream device tree.

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 arch/arm/boot/dts/bcm2711-rpi.dtsi                           | 1 +
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +++++
 2 files changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/bcm2711-rpi.dtsi b/arch/arm/boot/dts/bcm2711-rpi.dtsi
index ca266c5d9f9b..c868d1dcaba7 100644
--- a/arch/arm/boot/dts/bcm2711-rpi.dtsi
+++ b/arch/arm/boot/dts/bcm2711-rpi.dtsi
@@ -70,5 +70,6 @@ blconfig: nvram@0 {
 };
 
 &vchiq {
+	compatible = "brcm,bcm2711-vchiq";
 	interrupts = <GIC_SPI 34 IRQ_TYPE_LEVEL_HIGH>;
 };
diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
index 3a2e4582db8e..136c664132f4 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c
@@ -81,6 +81,10 @@ static struct vchiq_drvdata bcm2836_drvdata = {
 	.cache_line_size = 64,
 };
 
+static struct vchiq_drvdata bcm2711_drvdata = {
+	.cache_line_size = 64,
+};
+
 struct vchiq_arm_state {
 	/* Keepalive-related data */
 	struct task_struct *ka_thread;
@@ -1748,6 +1752,7 @@ void vchiq_platform_conn_state_changed(struct vchiq_state *state,
 static const struct of_device_id vchiq_of_match[] = {
 	{ .compatible = "brcm,bcm2835-vchiq", .data = &bcm2835_drvdata },
 	{ .compatible = "brcm,bcm2836-vchiq", .data = &bcm2836_drvdata },
+	{ .compatible = "brcm,bcm2711-vchiq", .data = &bcm2711_drvdata },
 	{},
 };
 MODULE_DEVICE_TABLE(of, vchiq_of_match);
-- 
2.35.1

