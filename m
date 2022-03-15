Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 814257A
	for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 20:09:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1647374982;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=cVuRUCzWQ8sHp4iijGuH6jG3CMenp456hE40B3rmy5w=;
	b=HS4LL8RGPmAKmsHtdS5MpY4H6p2SMpjCd4uHvbKorQTNhvfZ5YMmNU2hYfYWJR2eRSMRnH
	sRnBEUrlv/W3A2Dk3iWYmOJDfs1bCFgMnpKzfW9ObJ8wVfQEd7ZUimMTM0S+Oe3BAvUDwc
	oR/HVQPMyEDsTCXUA/mhEsIfKyad4Ys=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-141-con2IrRrMwukVy8fY_TQzw-1; Tue, 15 Mar 2022 16:09:41 -0400
X-MC-Unique: con2IrRrMwukVy8fY_TQzw-1
Received: by mail-qt1-f199.google.com with SMTP id e28-20020ac8415c000000b002c5e43ca6b7so116974qtm.9
        for <linux-staging@lists.linux.dev>; Tue, 15 Mar 2022 13:09:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cVuRUCzWQ8sHp4iijGuH6jG3CMenp456hE40B3rmy5w=;
        b=QEEvOEPEnvF1K6GNi5h0X/kOq1Q1DDa6HON6RJXpyz2V6do1p71r4pUIfJFLumVdU1
         6YedsybzcHv184ZHylTW1cFaing03uVwhcLg3hiO00iRiVjKHnaF9GTbiFOJk5YsL4ZW
         5vX0lEKJwZ7rBDqF/tDFKNcEksiznqZNUnGcPAKKQr9tI8SaiolJR5zlfK4jyyQYGak1
         tqe+6xJByim8rws1g8x6ZX1xAs1893cK6rN4eBKrcrFa0Pz6YHY4rCs9/jCfn3Eh+ziD
         SWX/V8zO1ub1LFfr07wIrwM/6fJzJwtfnj8zP+veBJwrydbXdedw2rl7MG9hY6wXVTj1
         YpQw==
X-Gm-Message-State: AOAM532pa3A/SnRo01TmPLAKsEW5bONEnVzWN6pJHHojl7sM38DRE+PA
	14EoExJ5AYtw8xb752BF8kLg9n3MQ+IjTcgHvAjXcBVyApK7TJPiInF3o/nMs4ixKRB3q+Cjrz4
	qlpqU8Nc4G5xZRwOglUw9iX3JIw==
X-Received: by 2002:a05:6214:2689:b0:435:be79:a17e with SMTP id gm9-20020a056214268900b00435be79a17emr22493329qvb.35.1647374981034;
        Tue, 15 Mar 2022 13:09:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuPkjuOo9bT0rnQm4l+mCvOeMmKIO0U+oT7rObYdgyQ8gKGTTXcMrZp9grdWrNFpk95GFfDA==
X-Received: by 2002:a05:6214:2689:b0:435:be79:a17e with SMTP id gm9-20020a056214268900b00435be79a17emr22493322qvb.35.1647374980830;
        Tue, 15 Mar 2022 13:09:40 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id 197-20020a3703ce000000b0067af869ffa6sm9582433qkd.127.2022.03.15.13.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 13:09:40 -0700 (PDT)
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
Subject: [PATCH 0/2] Add support for bcm2711 in vchiq_arm
Date: Tue, 15 Mar 2022 16:09:27 -0400
Message-Id: <20220315200929.74952-1-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
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

The goal of this patch series is to use the bcm2711 compatible string in
vchiq_arm for the Raspberry Pi 4. This allows using the downstream device
tree with the upstream kernel.

Adrien Thierry (2):
  dt-bindings: soc: bcm: bcm2835-vchiq: Add support for bcm2711
  staging: vchiq_arm: Use bcm2711 compatible string for bcm2711-based
    RPi

 .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml     | 6 ++++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                          | 1 +
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c   | 5 +++++
 3 files changed, 12 insertions(+)


base-commit: 09688c0166e76ce2fb85e86b9d99be8b0084cdf9
-- 
2.35.1

