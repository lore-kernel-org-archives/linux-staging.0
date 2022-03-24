Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99F0B7E
	for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 17:27:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1648142823;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=liRbImRNW+7P8M0AFLGtjRyZSDyrWzFoWmyeKMsK9gQ=;
	b=OG1O+GnuzUVa1Ci3fYu4kas4V1+8GR8xmuYZJBuNQSzzigXFU0H6OmWn9fbJx0qBFH9mBH
	yLCYI37Ga51JRb14+u8WYufMhGY4dmnTBgHfH2n5S8i4dwrd+sCYUB/IheKC2R71liHVOB
	SuUntqoTU5SCU+k9JqZLTUJK1oPNZbY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-317-dtmNubPZNByqptHm9Q_aVA-1; Thu, 24 Mar 2022 13:27:02 -0400
X-MC-Unique: dtmNubPZNByqptHm9Q_aVA-1
Received: by mail-qv1-f71.google.com with SMTP id d11-20020a0cffab000000b00440f965f77cso4138997qvv.4
        for <linux-staging@lists.linux.dev>; Thu, 24 Mar 2022 10:27:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=liRbImRNW+7P8M0AFLGtjRyZSDyrWzFoWmyeKMsK9gQ=;
        b=2BSpG9hsi9I4lTYBDZhdRvoEkMLB1GDnoVhdxYGsld6vqXyWdt3kbRmh9ZytL3OmFm
         8c8PQ1jbnUxJPxnHJjxVdqQW7WiscOJV1T5xcTnh5f9gsbI4Vtkbz9yLFfhlAOiQ0ZF9
         GrCusfgdWMxCrypgpqd1Gy7jS1IRHEtstuCmOnY8XINN2QDfmP8L5CTA0e5iTSHD/P6V
         oNU3cx5IdtcuxeoVap19mRTi4svUZFDtUxNFZR63kRciwSaLCvuHCsOLOsyViEuGvCUT
         FkU53Mtid6OwB+Fpr1CmGTfDzo2/hx0SzmCWpnj/+mVRi8pnWMquSpMJQ0/n3RJdDvEd
         DxGA==
X-Gm-Message-State: AOAM532nneSm8e6q8wZkHhIpvfrt0Gj6UznmMsxH+8kPcTW2tiucMfn3
	fWItFFcYkSClZ4sTrDZZAxXZFK0F/608H3u1iwEQcu+4UZvKn8Las9PP9cEo2DKORkdv0o34wwx
	3O1cbcqu57PYYIDEBPC+UVEn7ww==
X-Received: by 2002:a05:620a:370c:b0:680:9d9e:ecfe with SMTP id de12-20020a05620a370c00b006809d9eecfemr3825813qkb.307.1648142821859;
        Thu, 24 Mar 2022 10:27:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwoRa+4NSOlOggFdzYFCyPhvXbLJa7Ooafl0DS0H8lqYYl0wdhBQkyvH/e0Vt0LXWhsBn5ANQ==
X-Received: by 2002:a05:620a:370c:b0:680:9d9e:ecfe with SMTP id de12-20020a05620a370c00b006809d9eecfemr3825800qkb.307.1648142821680;
        Thu, 24 Mar 2022 10:27:01 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id bm21-20020a05620a199500b0067d5e6c7bd8sm1886515qkb.56.2022.03.24.10.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Mar 2022 10:27:00 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add support for bcm2711 in vchiq_arm
Date: Thu, 24 Mar 2022 13:26:45 -0400
Message-Id: <20220324172647.167617-1-athierry@redhat.com>
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
Content-Type: text/plain; charset="US-ASCII"; x-default=true

The goal of this patch series is to use the bcm2711 compatible string in
vchiq_arm for the Raspberry Pi 4. This allows using the downstream device
tree with the upstream kernel.

---
Changes since v1:
- Removed duplicate compatible string for bcm2711 in
  brcm,bcm2835-vchiq.yaml

Adrien Thierry (2):
  dt-bindings: soc: bcm: bcm2835-vchiq: Add support for bcm2711
  staging: vchiq_arm: Use bcm2711 compatible string for bcm2711-based
    RPi

 .../devicetree/bindings/soc/bcm/brcm,bcm2835-vchiq.yaml      | 5 +++++
 arch/arm/boot/dts/bcm2711-rpi.dtsi                           | 1 +
 .../staging/vc04_services/interface/vchiq_arm/vchiq_arm.c    | 5 +++++
 3 files changed, 11 insertions(+)


base-commit: ed4643521e6af8ab8ed1e467630a85884d2696cf
-- 
2.35.1

