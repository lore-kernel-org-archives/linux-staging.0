Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4E91FCE
	for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1652901120;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8IPr4BqiZkpa6rDCPznS2vW1CcA8i8Vnd3gRfZzsA+o=;
	b=B2eGd2mEB4FR2/Lk0D8ZKWEvPeWlV0cvUSqWf5tMJkQbwmOJBE6aPbr6cSIaVXcut6liDp
	rJSbIKhHXvItbK2KEH6X3N6QtY9r6vKY/X699unEtrl+Ivsh21sN8t51Gi9YpQnfKf20AP
	etN8Rx9h3jN6lKU9uWGsmyvSBmwK0jQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-640-3viej3GlOeOkX3PHp-sveQ-1; Wed, 18 May 2022 15:11:42 -0400
X-MC-Unique: 3viej3GlOeOkX3PHp-sveQ-1
Received: by mail-qt1-f197.google.com with SMTP id d4-20020a05622a15c400b002f3bd4b80f7so2387281qty.3
        for <linux-staging@lists.linux.dev>; Wed, 18 May 2022 12:11:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=8IPr4BqiZkpa6rDCPznS2vW1CcA8i8Vnd3gRfZzsA+o=;
        b=hRbpd/Qn6fzbhaWCzEV+8GSr/j5H69AK5rJfpclGKXTnbn2zgI0ub6ioUgIvUxlWyD
         Q+T6ROo2BMCddjAGl8JLzPKYnKAWTkVAoMwipg3OlCAF4QJXIWhiPuj7H7T5EpFH6QED
         Ef+O176iNZxhzFiUNARclEjmDFxwtMql7zjGDgjBdGUHZjjfrPblhPQiB3WsCYSixcLV
         Ux+Fd+5qEte4X1mZoTkQVX69m85qbFDFr2Lyo2nSfNQu/vbzspMnIAkBbPTUMRcdKdfh
         YUFMaMJJlbj3gkDvvDe9sf9+uGwDPJbEfBo75xciEUvT1VNvDf1m5WX5eMuXuL/VYHO7
         9I+Q==
X-Gm-Message-State: AOAM532B359F/JqlxYmxiIVrTLPpciJzeLDOaf0ephSEHcXb22DAZGEC
	XICGp6j2LNeGNJPzw57OJU0jlxJKoWjXHKmfpN9ljq0QcgMQjUE7IJl0pwSYAgPtraiWcgtokSg
	LcJ5SN0mg9BGBBECfnupR4DJ2/w==
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id q20-20020a05622a04d400b002f3c5295f89mr1210025qtx.158.1652901102386;
        Wed, 18 May 2022 12:11:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyYZgRv0g3JeofREFLmW2IgIGkmSDCryr1c3yqJ2yudxdlL8FGAuZutBYugwNKI3wVjL3Rslg==
X-Received: by 2002:a05:622a:4d4:b0:2f3:c529:5f89 with SMTP id q20-20020a05622a04d400b002f3c5295f89mr1210003qtx.158.1652901102177;
        Wed, 18 May 2022 12:11:42 -0700 (PDT)
Received: from fedora.hitronhub.home (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id z190-20020a37b0c7000000b006a32d491f92sm39183qke.39.2022.05.18.12.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 May 2022 12:11:41 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: bcm-kernel-feedback-list@broadcom.com,
	Florian Fainelli <f.fainelli@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>
Cc: Stefan Wahren <stefan.wahren@i2se.com>,
	Adrien Thierry <athierry@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 0/9] staging: vchiq_arm: remove some unnecessary global variables
Date: Wed, 18 May 2022 15:11:11 -0400
Message-Id: <20220518191126.60396-1-athierry@redhat.com>
X-Mailer: git-send-email 2.35.3
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

This patch series aims at removing some unnecessary global structures
(namely, 'g_dev' and 'vchiq_states'), in order to make the driver more
robust. This is part of an effort to address TODO item "Get rid of all non
essential global structures and create a proper per device structure".

Changes since v1:
- added more info in commit messages
- split commit removing the 'vchiq_states' array into several changes to
  make the review easier.

Adrien Thierry (9):
  staging: vchiq_arm: add reference to vchiq device in vchiq_state
  staging: vchiq_arm: get rid of global device structure
  staging: vchiq_arm: pass vchiq instance to service callbacks
  staging: vchiq_arm: pass vchiq instance to 'find_service_by_handle'
  staging: vchiq_arm: pass vchiq instance to 'vchiq_get_client_id'
  staging: vchiq_arm: pass vchiq instance to
    'vchiq_get_service_userdata'
  staging: vchiq_arm: pass vchiq instance to 'handle_to_service'
  staging: vchiq_arm: use state from vchiq instance
  staging: vchiq_arm: remove global 'vchiq_states' array

 .../bcm2835-audio/bcm2835-vchiq.c             | 40 +++++---
 .../include/linux/raspberrypi/vchiq.h         | 48 +++++----
 .../interface/vchiq_arm/vchiq_arm.c           | 92 ++++++++----------
 .../interface/vchiq_arm/vchiq_arm.h           |  8 +-
 .../interface/vchiq_arm/vchiq_core.c          | 97 ++++++++++---------
 .../interface/vchiq_arm/vchiq_core.h          | 38 +++-----
 .../interface/vchiq_arm/vchiq_dev.c           | 40 ++++----
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 63 ++++++------
 8 files changed, 217 insertions(+), 209 deletions(-)


base-commit: e41f7a5521d7f03dca99e3207633df71740569dd
-- 
2.35.3

