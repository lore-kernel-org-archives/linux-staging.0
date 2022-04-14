Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA73320C
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960262;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=azZFyvbXbsRrL2GrJ7PQeirmm3t2q04DjeZIVAP8lC0=;
	b=KvO1HXRfTvO4elBKyJ7PFP53thzuIamdxYs+Uk33PSh2YUBVuYIdQzn2uDatA000GbeE+a
	MzlkjmmTSVArQO3ZxDQ4g3V8rIu/DIX0pO2Ih2BxKcfOh5v6pkwTing2SbkmvBjV8HFBHb
	VMygv4FSbO5TdpfEJRAzIGROga1YBlA=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-146-3sLRt7lnN-yktAfdVZAmiA-1; Thu, 14 Apr 2022 14:17:41 -0400
X-MC-Unique: 3sLRt7lnN-yktAfdVZAmiA-1
Received: by mail-qk1-f199.google.com with SMTP id i2-20020a05620a248200b0067b51fa1269so3787299qkn.19
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=azZFyvbXbsRrL2GrJ7PQeirmm3t2q04DjeZIVAP8lC0=;
        b=3w+yXe2631KUwngtJHAkNTlLbUbYN62PWYpL8V6mb8+OFnSBjZ50zX4IuZeCSLIShW
         KRZhLam4OKQuKa5La1aZeh9an5TUTQYJzIAKqfW7nKMR1e40kWzwrOrp58P5LgrCx2W7
         H3oM3UV+KCMRKaadvMIO2TNpCCz24hblkxXGLD7fu2Jt4bdEphvA+BabqxHJa4UTw6tR
         +IObPMgfiG4qV0RYbTsGZZfOJzQFXeZI94Drc0Hav8NUgJqlUAMXQXbZh/cOwYgrjRJR
         fD/aH4zi1x0y4/L22ICsjldBE4MRjld8UN4bwO6DOBknH/Qb7Bid6+N1nRPHQYg0pHZ0
         8P/Q==
X-Gm-Message-State: AOAM531RNmyYErTORYrI7HjneRAyZ3ohO9VhLXTn4AzRaqvV0cE8Uamg
	OoMtz/H54RXZRfS8loszpNFf6a2GCaGuGWQ/LnCKIfgnd3SQAayf8bmiq9gyqVvSrDBOUqCX+9E
	G6BRJeJyxebTI9LG+12NC2fZC9g==
X-Received: by 2002:a05:6214:2607:b0:444:3e1c:9491 with SMTP id gu7-20020a056214260700b004443e1c9491mr4658504qvb.12.1649960261422;
        Thu, 14 Apr 2022 11:17:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPFI9LaNCqQ5DDacyUpStgLvPbYlekuXV70UXl0i1kqJef4wmHRnyufxpuU13B2NmCskEb1g==
X-Received: by 2002:a05:6214:2607:b0:444:3e1c:9491 with SMTP id gu7-20020a056214260700b004443e1c9491mr4658476qvb.12.1649960261204;
        Thu, 14 Apr 2022 11:17:41 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:40 -0700 (PDT)
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
Subject: [PATCH v2 2/5] staging: bcm2835-audio: fix line ending with '('
Date: Thu, 14 Apr 2022 14:16:19 -0400
Message-Id: <20220414181622.102049-3-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414181622.102049-1-athierry@redhat.com>
References: <20220414181622.102049-1-athierry@redhat.com>
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

Fix issue reported by checkpatch:

CHECK: Lines should not end with a '('
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c:85:

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index f2ef1d641e70..856d3c022f80 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
@@ -82,8 +82,7 @@ void bcm2835_playback_fifo(struct bcm2835_alsa_stream *alsa_stream,
 }
 
 /* open callback */
-static int snd_bcm2835_playback_open_generic(
-	struct snd_pcm_substream *substream, int spdif)
+static int snd_bcm2835_playback_open_generic(struct snd_pcm_substream *substream, int spdif)
 {
 	struct bcm2835_chip *chip = snd_pcm_substream_chip(substream);
 	struct snd_pcm_runtime *runtime = substream->runtime;
-- 
2.35.1

