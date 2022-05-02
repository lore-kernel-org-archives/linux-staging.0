Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF902F32
	for <linux-staging@lists.linux.dev>; Mon,  2 May 2022 18:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1651516251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rguDjv+d49kqJjpBxJsrbZOSzE2Lv6ZdoiYYlDDf/aM=;
	b=cE5h7CB+fIMSrWZ7aMmVTDjiKNpiVM9XULojE/BZL3Z/PSHPUNqsCq8IhyqIrvgcvS+ulX
	zcXB3vnDAVJEnE3s2wR6S03tcqX45WauLkQurzTfwP2VlujZYJCW3p7ic8IRUah9hC0CFv
	PoC/q98fdjfDCg18ASltXRgg0nLeARY=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-529-VR6oFrZQO4GQcfiCszxLXw-1; Mon, 02 May 2022 14:30:50 -0400
X-MC-Unique: VR6oFrZQO4GQcfiCszxLXw-1
Received: by mail-qt1-f200.google.com with SMTP id a20-20020a05622a02d400b002f390c55f36so8639344qtx.16
        for <linux-staging@lists.linux.dev>; Mon, 02 May 2022 11:30:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=rguDjv+d49kqJjpBxJsrbZOSzE2Lv6ZdoiYYlDDf/aM=;
        b=Nx64dQmBQS1WIttxOPRURA6OYN3g0mkLM143KD322PZmblHutmbSfm6GiBl/7te2kf
         YjOJZJST6K2T3AaKFQCC6AOHVoRG8Njk7y7M83kRD+s0053G7kBQMn73PkFKZUYnkJyl
         59G0XejPiVp2AIkxspOReOXnGg2ug+jTTl1mO+HFGtWxeItoqKDnoTCfTOSMdCgAZTs4
         VVI+5QSxvdVcI4ucuBamx/ucVfdFp//5Tdv7p4bexGhR8Gc3W9VezT0rMuUKpay8DbVa
         s9CiWqDmbvoDktFHron8Zrd3xuOx5s+wivfwxRfbKf+lA8yfnIdTmKg9Tw5WiXxFB8CR
         qttA==
X-Gm-Message-State: AOAM533GFyUnqIdYqDbBq1uJGouEPHR59wfs2DLvl9Qr9++PXXtW7Ymg
	jyQkTSfQaWwUPpRYR2nMuT9ow+OrW+gG6sg+rcm+NNFUsECGMJV8LrJoKkYuWdGX2ocSncJjsNY
	9zQ1woKflpbfTj/SN0BWKLBnbdg==
X-Received: by 2002:a37:b1c7:0:b0:67d:6a17:cdcf with SMTP id a190-20020a37b1c7000000b0067d6a17cdcfmr9049120qkf.402.1651516250097;
        Mon, 02 May 2022 11:30:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwzGMrpuLrvTmxx8frRpTf9Qu2IQ5cz1FrI776CpFn8PKTAz9yYy6P2/rkP71HE8n8rRrh6LQ==
X-Received: by 2002:a37:b1c7:0:b0:67d:6a17:cdcf with SMTP id a190-20020a37b1c7000000b0067d6a17cdcfmr9049093qkf.402.1651516249729;
        Mon, 02 May 2022 11:30:49 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h12-20020ac846cc000000b002f39b99f68esm4412204qto.40.2022.05.02.11.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 May 2022 11:30:49 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Adrien Thierry <athierry@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 0/3] staging: vchiq_arm: remove some unnecessary global
Date: Mon,  2 May 2022 14:30:39 -0400
Message-Id: <20220502183045.206519-1-athierry@redhat.com>
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

This patch series aims at removing some unnecessary global structures in
order to make the driver more robust. This is part of an effort to address
TODO item "Get rid of all non essential global structures and create a
proper per device structure".

Adrien Thierry (3):
  staging: vchiq_arm: add reference to vchiq device in vchiq_state
  staging: vchiq_arm: get rid of global device structure
  staging: vchiq_arm: get rid of global vchiq_states array

 .../bcm2835-audio/bcm2835-vchiq.c             | 40 +++++---
 .../include/linux/raspberrypi/vchiq.h         | 49 +++++-----
 .../interface/vchiq_arm/vchiq_arm.c           | 94 +++++++++---------
 .../interface/vchiq_arm/vchiq_arm.h           |  8 +-
 .../interface/vchiq_arm/vchiq_core.c          | 98 ++++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          | 38 +++----
 .../interface/vchiq_arm/vchiq_dev.c           | 40 ++++----
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 63 ++++++------
 8 files changed, 218 insertions(+), 212 deletions(-)


base-commit: 5fe7856ad59afc56a6ff35d091bfaddd1d4f4bce
-- 
2.35.1

