Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB6A320A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960259;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=z5tgB23gsfb+KHanZyKg4LmdU6c+WAvLbSSi7WjMupg=;
	b=gcQ4kO09zEPwTvOGfODc6IVZZ7CvVljyzlNdpSdlSBpwZr46lh8lxR7ySWCDHD4PhlMsdT
	lLL/iX92/5uju9E5DQldm0akBFjutPlNBKrPeJWpHTQVAv9NJsNcE02P2BNa24KDDR/vk/
	AFnSpIA3Cxmy35TUesY06AxF056dDoY=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-251-UuD7AYldM0uIKstKbtgQSw-1; Thu, 14 Apr 2022 14:17:38 -0400
X-MC-Unique: UuD7AYldM0uIKstKbtgQSw-1
Received: by mail-qk1-f197.google.com with SMTP id l20-20020a05620a28d400b0069c63137970so2940591qkp.10
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=z5tgB23gsfb+KHanZyKg4LmdU6c+WAvLbSSi7WjMupg=;
        b=zuVSDAfcVqFaGzbmZCkG0l7sSLk14kyqRgB0EKQT1wLPsKO223dxfY3mtTBcfiln5n
         ZNKWqWxBt5bPfVK+bpMIkW7EO558QxJ5MHaxa5+KXIHEDUPNU8RqS0bw8BynczqqW12w
         j2Hu7Sq22U8rHAdycD7xdgtkQDIU+eaFoyPDHmGAEk8XweR6Z0YfnZVeJckZtx9mw3Il
         s6fu4TpXeePWHfW6STXDsoNRPlT/2y9glOcaocyK0upL+tvLggL1lIh5JJhM/KbFZWba
         8JRGXtmNQBqLnxU1hZ/IoSsuvIyGcF2tcQ20UigC5upjJzEwAnrOk4DOJcubL3Y8jewZ
         j5/A==
X-Gm-Message-State: AOAM531Dq5CO3qwsTlaMsvS4N7ugtuNJSfwRrbgNXFfzZZnVhM4NbyzX
	Ci1Tl0ymyZj2I5prjFMSopfjcu2vuDakKThfLcKTIN93xE+4Etmyc5Xrx5bgEv2CjXxTg6jENgK
	ShJRdSZ0i/EFlPgOzV13cmzQSyg==
X-Received: by 2002:a05:620a:190f:b0:69c:34f3:cdc5 with SMTP id bj15-20020a05620a190f00b0069c34f3cdc5mr2816753qkb.579.1649960258041;
        Thu, 14 Apr 2022 11:17:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqlzxMzniXZYmYlsajFK1AyahG5bV7gnrcaBdvbFxg1rAeBX6GXs8+x5dyLKp6jcE5zMf4gQ==
X-Received: by 2002:a05:620a:190f:b0:69c:34f3:cdc5 with SMTP id bj15-20020a05620a190f00b0069c34f3cdc5mr2816734qkb.579.1649960257805;
        Thu, 14 Apr 2022 11:17:37 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:37 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Maxime Ripard <mripard@kernel.org>,
	Takashi Iwai <tiwai@suse.com>
Cc: linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Adrien Thierry <athierry@redhat.com>
Subject: [PATCH v2 0/5] staging: bcm2835-audio: minor code style cleanups
Date: Thu, 14 Apr 2022 14:16:17 -0400
Message-Id: <20220414181622.102049-1-athierry@redhat.com>
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

This series contains minor code style cleanups to fix checkpatch warnings.

This handles TODO item "Fix the remaining checkpatch.pl errors and
warnings"

---

Changes since v1:
- removed mention of vc4 in Kconfig help text
- split patches so that each patch fixes only one checkpatch warning

Adrien Thierry (5):
  staging: bcm2835-audio: fully describe config symbol
  staging: bcm2835-audio: fix line ending with '('
  staging: bcm2835-audio: fix unnecessary space after cast
  staging: bcm2835-audio: fix mutex definition without comment
  staging: bcm2835-audio: fix mutex definition without comment

 drivers/staging/vc04_services/bcm2835-audio/Kconfig         | 6 ++++--
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c   | 5 ++---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 2 +-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h       | 2 +-
 4 files changed, 8 insertions(+), 7 deletions(-)


base-commit: 194193dd06848c1839d928090cb2032eec8b2f9c
-- 
2.35.1

