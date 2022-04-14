Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2B2320A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960264;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zy+BZO4byiGtpgAVtL3WxpyUEL13EpkA7IKsqDx9JAE=;
	b=AMAxVutRqKuEluhNbvHe0+rwq8wO4dwBWWxuOWFZv3kTMd1gU9vnPzS3eLmpSDdVFTHGJW
	GNCV3URbrg4zQPcSSX08g+d0TscvU5uG2OZxu0XLvRpsNHzisU06i69xCs2gMXbeFbefnZ
	CTDXL8y9Tte5IIGJamwd08R4VGk+f6Y=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-o_5tbmMFMcq7zsFyJqOTvw-1; Thu, 14 Apr 2022 14:17:43 -0400
X-MC-Unique: o_5tbmMFMcq7zsFyJqOTvw-1
Received: by mail-qt1-f198.google.com with SMTP id m3-20020ac86883000000b002ed8d29a300so3724088qtq.11
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zy+BZO4byiGtpgAVtL3WxpyUEL13EpkA7IKsqDx9JAE=;
        b=fLNmjAyGsyGU9FHdBUkrbmIbd/44nKcOqs22VnBqLJ0rQFGjcsBWIJNzAjcwUgLVwS
         04pdixv2d1nCdgAgyKLNbWb8/pnWIh/GvzONcjZaiZNdoW3k8qXwdPhGCkZi2TYV5Nv/
         uRhjz/ACHFEI3BGXfBaDUIRBj+c1FMbFlYetAyKrw4SJ2WcuD+gH7VUqfhr7nI+qHqsI
         d2Ywp4aXfPloBdOmyi6eEqrevgPoxxt8MY7yRUUPvexMSP4tXS44TL6seuO0mG4dr5uT
         x+Pdo6I8WLJmu4mqLAoCSr9HB9M7RAmuiJmWbkYmiTC0WS3xQ2+cnfar/HXEEIZC8lgY
         zKkA==
X-Gm-Message-State: AOAM531WmzidfoA5lbAeqhYRIu4fAFdvkm7vE8L8rKRwgeHZc4GHdx0J
	SwhhR0vlbIWqB6TP30xmROY9/eh6SWx8jLJnEphnHyE7378lXGgaZyWmU9FQkZEbCa8Pqfi+r1K
	Cb8j+M9nDKSCRHl7BJIUEF0PxJg==
X-Received: by 2002:ac8:7f83:0:b0:2e1:df62:380c with SMTP id z3-20020ac87f83000000b002e1df62380cmr2818241qtj.427.1649960262926;
        Thu, 14 Apr 2022 11:17:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwulDgYN2XzG/gLG13Jj3INXMKsHc0v0l2aMhB1g0X7v8vggHhHUIziyZIXU72AkWg9yx8ExQ==
X-Received: by 2002:ac8:7f83:0:b0:2e1:df62:380c with SMTP id z3-20020ac87f83000000b002e1df62380cmr2818235qtj.427.1649960262737;
        Thu, 14 Apr 2022 11:17:42 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:42 -0700 (PDT)
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
Subject: [PATCH v2 3/5] staging: bcm2835-audio: fix unnecessary space after cast
Date: Thu, 14 Apr 2022 14:16:20 -0400
Message-Id: <20220414181622.102049-4-athierry@redhat.com>
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

CHECK: No space is necessary after a cast
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c:240:

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
index 856d3c022f80..68e8d491a7ec 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
+++ b/drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c
@@ -236,7 +236,7 @@ static void snd_bcm2835_pcm_transfer(struct snd_pcm_substream *substream,
 {
 	struct snd_pcm_runtime *runtime = substream->runtime;
 	struct bcm2835_alsa_stream *alsa_stream = runtime->private_data;
-	void *src = (void *) (substream->runtime->dma_area + rec->sw_data);
+	void *src = (void *)(substream->runtime->dma_area + rec->sw_data);
 
 	bcm2835_audio_write(alsa_stream, bytes, src);
 }
-- 
2.35.1

