Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DB4320A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AzQ4QAAj2VuNQ/FqRmCllZ6Sxm9XylzBtMDsyAckXBk=;
	b=YkH2582mXEAHHfyyNtcH2ymiHN/uAaGq+QlVgggVBiq1VJMhgDJQJfJPutT20THfCaI2Lg
	vkyRETBHLpGhuFsZOXGSgJQ12mYDKYqAj8qq+I7lrmxFLPn7aUPX9e1LqorYODlLgG07JK
	alEqqtpw7bZiPBja8IPaBe5cTPgwQsk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-214-Tgs_CBELOni61ULGuzIJAw-1; Thu, 14 Apr 2022 14:17:44 -0400
X-MC-Unique: Tgs_CBELOni61ULGuzIJAw-1
Received: by mail-qv1-f71.google.com with SMTP id e10-20020a0562140d8a00b00443c3595342so5027959qve.8
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AzQ4QAAj2VuNQ/FqRmCllZ6Sxm9XylzBtMDsyAckXBk=;
        b=XxevOneCPTsxv50VgZe29N8uua8BwvCS6xadVuiivlOEl2Kjv+KPHPQM0+lArOj81O
         6oEWJsU1HyZLEwI9FyjgVKt6WjrIounKIj32Fc6Xl4ESSnYhucD1VARBqUJrldUT9Iti
         +5j8nEkRHI3FvcTe9+rpFrxUrI5LsXRHxRHzTe5qRYgmiXqZpJtedjsMB3XjwiiV3DoT
         34K2vzLLb3JxJhrcDq9KqjEOKT5sTtlJmUS65MIiesVOdyJMa4Go6ApiTVrH9G1p/AxM
         MySPoZWQzGydGLGfFw9ah9mB0y73HHNnm7HXK2lhBG2TBXRbEbqXl5JNxoxejnK5CG5f
         GAZg==
X-Gm-Message-State: AOAM530rjxfIyL/lKTeHS/24PGkzIOZEzhsGAjOHDZpNJnl9c4snUYrl
	G2wZj3g/bGbAd5L8ke98lGhJL0tb0j0scvawCqBEMivlnOn0/xXP92K8tXbFT7xBrYzGsqsg5IS
	OMokczrog3zIoG2IC2NWGl8yO7g==
X-Received: by 2002:a05:622a:64f:b0:2e0:6a11:7b0d with SMTP id a15-20020a05622a064f00b002e06a117b0dmr2834093qtb.9.1649960264458;
        Thu, 14 Apr 2022 11:17:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwQCBsCYIW9qTWEVzr2uXIjuRmjRtRNtV7/hcrHwq+Oi87WABK0If4z9cRP097Vex5PiCYcFA==
X-Received: by 2002:a05:622a:64f:b0:2e0:6a11:7b0d with SMTP id a15-20020a05622a064f00b002e06a117b0dmr2834072qtb.9.1649960264251;
        Thu, 14 Apr 2022 11:17:44 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:44 -0700 (PDT)
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
Subject: [PATCH v2 4/5] staging: bcm2835-audio: fix mutex definition without comment
Date: Thu, 14 Apr 2022 14:16:21 -0400
Message-Id: <20220414181622.102049-5-athierry@redhat.com>
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

CHECK: struct mutex definition without comment
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c:14:

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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
-- 
2.35.1

