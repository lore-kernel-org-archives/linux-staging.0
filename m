Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3574B7A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649949840;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ymoHjSbTJfTWENDrZAMakMAu3NTQlX8fnQuTkXZ1c+0=;
	b=X/SjFsVZc4vUzF5RUlsVUjB3rfNvJDVfQAuiOxuT3sLz76TxA9pspcynJrtW03rI8ytSq3
	CT0O++YOTtFAwe+9FmdhvbgAENlrUiJqoJXHqJOJKZJ3A7IvzKc3TGFN8xtlHAmklao0/5
	gb6hRTCaGjLlMbs42fAQhfDpokyD6JQ=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-73-DLgNRyBzPlaNAszkMR6F4A-1; Thu, 14 Apr 2022 11:23:57 -0400
X-MC-Unique: DLgNRyBzPlaNAszkMR6F4A-1
Received: by mail-qv1-f71.google.com with SMTP id b9-20020a0cfe69000000b00443cff31dfaso4654393qvv.5
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:23:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ymoHjSbTJfTWENDrZAMakMAu3NTQlX8fnQuTkXZ1c+0=;
        b=zIbBPqrml4AZwONREHOwUjARqpUsA+fgAJBUZUbppXY5/TXFtKSzyvqlWXCEjhkyqe
         4S7RKFga1/Iq+ZmsIuiny+GbuqW8EOnqzPhwutzFlq+KN4g8alTIFngp7TNNFpCqlYDr
         WcEmRDu5rTcZfWz9LVZcrChaqg9Ny05g5VsCcyzG3SYInK52HYU8sStasq8e1UTnRyag
         GFYca2edH30YyM3LaREd9BvjgU8SWLB8PTAQgOVYiWMeL30/3SZexWtLIaxi2chqjA9x
         NA9DNI3+6VF3idhTPfGiwK1qYQdDiYfOc9mz82H5lmR83s3loOOMdUTSoeOgg0Ps8UK/
         FXfQ==
X-Gm-Message-State: AOAM531SFi45NdRNlyeIeVdECCFQ8xpTDp6tGE0xv5g5/tlg4Y/5dxYN
	pOpH+vhl+Yeb4BhWa6E0v4Xs36XtGxIcxEioKCwtOJ42ulvUOANUdZYGhm84GGq3/eehtjdx9Z0
	3QRZA2/WHNOwHquAk4Anf1ZaOOw==
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id s19-20020a05622a179300b002e1ba410ed2mr2180109qtk.238.1649949836593;
        Thu, 14 Apr 2022 08:23:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzs3AjMBWvnaeFFepMGw6xBfV7UrXSMsLV3Nf+VF6QIpa+RPOmd63l8E4yiuw2decacPo8cmQ==
X-Received: by 2002:a05:622a:1793:b0:2e1:ba41:ed2 with SMTP id s19-20020a05622a179300b002e1ba410ed2mr2180095qtk.238.1649949836406;
        Thu, 14 Apr 2022 08:23:56 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id p5-20020a378d05000000b0069beaffd5b3sm1166038qkd.4.2022.04.14.08.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 08:23:56 -0700 (PDT)
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
Subject: [PATCH 2/2] staging: bcm2835-audio: clean code style warnings
Date: Thu, 14 Apr 2022 11:23:40 -0400
Message-Id: <20220414152340.68932-3-athierry@redhat.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414152340.68932-1-athierry@redhat.com>
References: <20220414152340.68932-1-athierry@redhat.com>
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

Clean a few minor code style warnings.

Reported by checkpatch:

CHECK: Lines should not end with a '('
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c:85:

CHECK: No space is necessary after a cast
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c:240:

CHECK: struct mutex definition without comment
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c:14:

CHECK: struct mutex definition without comment
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835.h:64:

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c   | 5 ++---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 2 +-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h       | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index f2ef1d641e70..68e8d491a7ec 100644
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
@@ -237,7 +236,7 @@ static void snd_bcm2835_pcm_transfer(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct bcm2835_alsa_stream *alsa_stream = runtime->private_data;
-	void *src = (void *) (substream->runtime->dma_area + rec->sw_data);
+	void *src = (void *)(substream->runtime->dma_area + rec->sw_data);
 
 	bcm2835_audio_write(alsa_stream, bytes, src);
 }
diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
index d567a2e3f70c..e429b33b4d39 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c
@@ -11,7 +11,7 @@ struct bcm2835_audio_instance {
 	struct device *dev;
 	unsigned int service_handle;
 	struct completion msg_avail_comp;
-	struct mutex vchi_mutex;
+	struct mutex vchi_mutex; /* Serialize vchiq access */
 	struct bcm2835_alsa_stream *alsa_stream;
 	int result;
 	unsigned int max_packet;
diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
index 51066ac8eea5..38b7451d77b2 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835.h
@@ -61,7 +61,7 @@ struct bcm2835_chip {
 
 	unsigned int opened;
 	unsigned int spdif_status;
-	struct mutex audio_mutex;
+	struct mutex audio_mutex; /* Serialize chip data access */
 
 	struct bcm2835_vchi_ctx *vchi_ctx;
 };
-- 
2.35.1

