Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D49187E
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 17:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648142828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OIJlhxZQII2b1Vl5R2eePvHRFchgJiZqPqucMSOZBVI=;
	b=J2z21nMtgNXILWZPkXDeK5XIbFXcDWw0Ee85VJUBsVn9Hwf3yklOzxys1byW2yHHBVZbiS
	1Dlv23r2I7baRGbAT+1xJztObbJ7qdzNnKqIKQ4aRrUqzdJ4iVjwUe8jFOBC2Yi9t9gjMh
	Z+tLdOufLs/0asq2YYIkQt8szDQgbVI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-IFOjKZA_M7qjFnoZZ_YIRg-1; Thu, 24 Mar 2022 13:27:05 -0400
X-MC-Unique: IFOjKZA_M7qjFnoZZ_YIRg-1
Received: by mail-qv1-f69.google.com with SMTP id o1-20020a0c9001000000b00440e415a3a2so4114318qvo.13
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 10:27:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIJlhxZQII2b1Vl5R2eePvHRFchgJiZqPqucMSOZBVI=;
        b=ssQSKQA9Lszm75VooJ548xJRt6uFh7xZer3I16SuS5knLF8zR4hU+eO75BkjpgBwXe
         uQ0/v5dblXYOF6EvX0eI9L8JNMySOIboUk6o0V+m5UUmZLTCA6ei0xObJZ4qu7k5C8nx
         ICt2T43Sr738QmWuJxxrZL43aJfTPgtg5rSgXKE68Ns+vh9Qh/NMcyorHoA11DU3fhAx
         +HC+saszBqHrDKAH64HxWqz8AF464sqsgP9OfYy0JHq2h6kihpchzTIfvd3f1kRE5lzI
         lwoN9mUbSTTA9Ye+lf/nxbpFwepGC9dP52lKeiUfizDfG2ccA0Rgar84f3C34GwP4D8W
         oVOg==
X-Gm-Message-State: AOAM5321ETGKbYTdO3olnW6GDsRMNng+jR5qKugHpz3yVJl4iyoii1T3
	SjCKTI8bqQTcf7+Af4F9zuDXu6ql+PhOwabI1SerIF5aGOEM6j1j+DS3rHbGSG9o49NremECK3k
	kiQXh5Jpr2FdBhEXjNWaPz/XUow==
X-Received: by 2002:a05:620a:a57:b0:67d:396a:8a9d with SMTP id j23-20020a05620a0a5700b0067d396a8a9dmr4150364qka.322.1648142825406;
        Thu, 24 Mar 2022 10:27:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxB5F5wgV7J5cTSYxSXNzkylFEPJGtGrvg0qTVvsWiiJ29lM4a+bp0esEG2VaB8Mu4hX9z7ng==
X-Received: by 2002:a05:620a:a57:b0:67d:396a:8a9d with SMTP id j23-20020a05620a0a5700b0067d396a8a9dmr4150351qka.322.1648142825215;
        Thu, 24 Mar 2022 10:27:05 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id bm21-20020a05620a199500b0067d5e6c7bd8sm1886515qkb.56.2022.03.24.10.27.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 10:27:04 -0700 (PDT)
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
Subject: [PATCH v2 2/2] staging: vchiq_arm: Use bcm2711 compatible string for bcm2711-based RPi
Date: Thu, 24 Mar 2022 13:26:47 -0400
Message-Id: <20220324172647.167617-3-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220324172647.167617-1-athierry@redhat.com>
References: <20220324172647.167617-1-athierry@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

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

