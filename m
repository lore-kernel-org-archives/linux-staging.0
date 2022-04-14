Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 026AE320A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HlSZzKp73Fayw7krLRtWU5sPNWnQq78trEkuE6TU4hM=;
	b=NsCaTwSjxwXrRQEDHeFeoXJRIyqN6Yfd3kmgSjdnT8ulfq/ryTMknTUS/NyKUcOsJftVr4
	IHolBYkdi8Jd28Q4/oBJwDkCs4dV4Vnl50ilWJHUllpsTtPT9nxnxQLiteDIIkKL9rxL1s
	7/NprhFZ39xoSedqrYPE7BW89F7hMIM=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-468-8t93ZEzVPv-1AW6YjNokHg-1; Thu, 14 Apr 2022 14:17:47 -0400
X-MC-Unique: 8t93ZEzVPv-1AW6YjNokHg-1
Received: by mail-qk1-f198.google.com with SMTP id g15-20020a05620a40cf00b0069c61283d9fso3223863qko.20
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=HlSZzKp73Fayw7krLRtWU5sPNWnQq78trEkuE6TU4hM=;
        b=7efEWS10DxGqhdmROmEf/7xBqnAJHVHh7CpHuTpSK2kQqpOJFf6QKwORjyJUrchCTQ
         YBOx3gDvu4jOzfPyDgN6iwVe9NxrJB/U+iD/3MtNVlFTzuIrQow6cAaKvWp/B8G00V0a
         57Tl9CaVv4MJ6sNA1njQABc7E8HGLvW5xRVVQ6oSb+F5xWKYicB7BYcOXp0KOhTMZwuI
         F+nlk9Yx/XiwjwKVE8tNHg+fhdKKDtKmPvKVQabp8xCYxXLAir2/Orubv9oCZwVjtDBE
         6lHk/8xdRJXKCRAleELdXYCeDwH6Aol6MWjzAFnl83FslmKhEgrn0z2CPwWQxo92lt4o
         difg==
X-Gm-Message-State: AOAM533ZmIBTqIPzwOZjtpE4Im5vr1IbaJ3byPq6zjci4wGg9YdkDHkY
	ziMud+FUK6+vDdUue5NBhd+loaBerAUqhZzb0l0zNvcIaFp/6jWN51+fnLijhsTmPfj2xx2qAnZ
	fjKZtbewKWVTczunh/bkb77lTiw==
X-Received: by 2002:a05:620a:3706:b0:69c:41fc:ae9d with SMTP id de6-20020a05620a370600b0069c41fcae9dmr2884125qkb.307.1649960267103;
        Thu, 14 Apr 2022 11:17:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzbDkwZn4LTf/pzuq9ks/ZEKFR/wwVxem3IAa/T4H3Fr2doVaKqBcWNZSrnxRotfDf19d2/4Q==
X-Received: by 2002:a05:620a:3706:b0:69c:41fc:ae9d with SMTP id de6-20020a05620a370600b0069c41fcae9dmr2884105qkb.307.1649960266903;
        Thu, 14 Apr 2022 11:17:46 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:46 -0700 (PDT)
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
Subject: [PATCH v2 5/5] staging: bcm2835-audio: fix mutex definition without comment
Date: Thu, 14 Apr 2022 14:16:22 -0400
Message-Id: <20220414181622.102049-6-athierry@redhat.com>
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
FILE: drivers/staging/vc04_services/bcm2835-audio/bcm2835.h:64:

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

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

