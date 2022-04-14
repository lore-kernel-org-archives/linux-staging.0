Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 319F82F28
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649949836;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=IGRJLz7z/3jGasxkIFljjT/M7YCjB3xjYdcrHt5JsPY=;
	b=Iq2G0k7sijaiAiim8BX4ZFhpFpYonhUs+OqKnpE9yF8n0S/Gd8S0poxjNvNvJYdDkK55Bc
	5ynnxqP5zev3NpeZidE6tZlqXizmZiFlu/fXeRfkXVvbLvVTwOpD1sfINQn3wi0Q1zZcD/
	r4KWQAeGEwa7NCy3W9/JlyMQwzt3iQA=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-479-TOab3pKnP4iUZhFdN87_nA-1; Thu, 14 Apr 2022 11:23:55 -0400
X-MC-Unique: TOab3pKnP4iUZhFdN87_nA-1
Received: by mail-qv1-f71.google.com with SMTP id 33-20020a0c8024000000b0043d17ffb0bdso4602815qva.18
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:23:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IGRJLz7z/3jGasxkIFljjT/M7YCjB3xjYdcrHt5JsPY=;
        b=1yXXs0i1MNeiHiFVTJ488z38A5/O6Jie5CWNAJ3u18c72lDVjlIYsDRBpoun9IqY/V
         Fv94zHV04PjrcWGl0sIDj22fPdlKDtE/Vl7imp7m5IMWDwn2Pc3asGAVXBvfZ4GYde87
         JHYrqD5Bxc4nPjltKEqHWRO3/7qn9UJT4ghLMm+EP9AdAG9t7C07aPvOU7sj5CfXrwtY
         bI2EMcVxnG2jlsmDu6mFRayZXfnYUtAPFnG4IJdbA+rQw3DCMH7tbKD6OLmCGib9oOkv
         H/h/N4PtvmOvvT00lerHC4mEJjWWnIPcfsRHcIT4ybBpeN+5dhtsYAKSZQmQRfHgEZAU
         HjZg==
X-Gm-Message-State: AOAM530SsyAcba+6J4xj5n3YH/ZrjjkWDvLrmvxp/Y/8n8O1/7wsJkV+
	sQ9pyVTPSliJjpVQUuouEdoX2yGxGCUgZ3iIDdNJb1UfQs1iwNk3Q7T0aq6HFH3P2DkY7O0N6FL
	llShrgjyGQjFTWb0ggiGzOePFbg==
X-Received: by 2002:ad4:5dc7:0:b0:443:6f15:fe32 with SMTP id m7-20020ad45dc7000000b004436f15fe32mr3852113qvh.6.1649949834648;
        Thu, 14 Apr 2022 08:23:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxDIMnHIaFBi6EAQ93deNI9TIf/lTnkCTwd5RkyfWbj4eTfNhDjJwcfrcjQzxV8pE0w7SpAiw==
X-Received: by 2002:ad4:5dc7:0:b0:443:6f15:fe32 with SMTP id m7-20020ad45dc7000000b004436f15fe32mr3852106qvh.6.1649949834481;
        Thu, 14 Apr 2022 08:23:54 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id p5-20020a378d05000000b0069beaffd5b3sm1166038qkd.4.2022.04.14.08.23.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 08:23:54 -0700 (PDT)
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
Subject: [PATCH 1/2] staging: bcm2835-audio: fully describe config symbol
Date: Thu, 14 Apr 2022 11:23:39 -0400
Message-Id: <20220414152340.68932-2-athierry@redhat.com>
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

Explain SND_BCM2835 config option in more detail, especially the
implications of using the bcm2835-audio driver in conjunction with vc4
for HDMI audio.

Reported by checkpatch:

WARNING: please write a help paragraph that fully describes the config
symbol
FILE: drivers/staging/vc04_services/bcm2835-audio/Kconfig:2

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/Kconfig | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/Kconfig b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
index d32ea348e846..7cd0b3c0cae4 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
@@ -5,5 +5,8 @@ config SND_BCM2835
 	select SND_PCM
 	select BCM2835_VCHIQ
 	help
-	  Say Y or M if you want to support BCM2835 built in audio
+	  Say Y or M if you want to support BCM2835 built in audio.
+	  This driver handles both 3.5mm and HDMI audio. However, please
+	  note that when HDMI audio is enabled with this driver, the vc4
+	  driver cannot be used simultaneously, otherwise HDMI will break.
 
-- 
2.35.1

