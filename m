Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46F9B320C
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649960261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kxJOB8TLKClBreQifns7iXdSNc4svJwozv5ZA8+0Dto=;
	b=R1cZV970vOm0MxLSpIsMGBMl1df65G/xwyhWMrtb9CjPzpNQUzpMUBog7jOTMuppJGZQIk
	33GuCW261xFLC6mBeeTS/YL08XHXPe0gedPRy5RCE0N+8NckROmaRjasW0JkU0DrVitgtk
	h3d3FwxJlJ5U3bzGyXYoMRE+RqVzeWM=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-XGZ6lXaLOA-3OY9DazIkMA-1; Thu, 14 Apr 2022 14:17:40 -0400
X-MC-Unique: XGZ6lXaLOA-3OY9DazIkMA-1
Received: by mail-qk1-f200.google.com with SMTP id bi19-20020a05620a319300b0069c16295aabso3825617qkb.1
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 11:17:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kxJOB8TLKClBreQifns7iXdSNc4svJwozv5ZA8+0Dto=;
        b=d0NPTmt1qzZiHJ543e61JkuM23XA65tEd6EIwME6QVayCDpg4sC6nn1HyicLeU8VFd
         Z1kqkr1hrRNyMqErYcNUvVG8GrKA/w9vougcXcW1FbwW+py6Gj+ikAbs6lpnHR5RinsP
         OeyuwmsOv593b9umQifvFQD864xztUf91uRBQI4cc9fqmgAjNXKguaxAczFh3d3zDsTg
         XSuyxbs7vueJhCSxwG1UIk+ZcCHSQByUnQNkLBq3EvmWJBka1MnYK2fkcVx2WHGmczU/
         XhU5qMotASRf92MfoRGSo0Zfs4RAUcJnLhdtnYIz0UsymuLRAJt0N/u1/xamo0XaSe0P
         i6nw==
X-Gm-Message-State: AOAM530AWJx1DgVSwyRnpLc70MGbvkuk8bux2hcjCWxxV9o3VNwk+YkJ
	8u4NBkCQ1X/xcdXva5Ze9mINFexJZTtgRrL3Ys11HkjcZ437QK9HSepCR+rKO16y0mYbx7u05qF
	z7A1d+KbIV7mf7nN7DNSQB8dmMg==
X-Received: by 2002:a05:622a:1386:b0:2e1:e812:f4c with SMTP id o6-20020a05622a138600b002e1e8120f4cmr2717493qtk.653.1649960259673;
        Thu, 14 Apr 2022 11:17:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwKJ6fUk2dQLqhc/W+maJVV1WH54z+1gN66BkwtgvBzcQ1RBqSQotzU8pjT5mVlR0KXtdPZWg==
X-Received: by 2002:a05:622a:1386:b0:2e1:e812:f4c with SMTP id o6-20020a05622a138600b002e1e8120f4cmr2717478qtk.653.1649960259476;
        Thu, 14 Apr 2022 11:17:39 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id h5-20020ac85845000000b002edfd4b0503sm1701816qth.88.2022.04.14.11.17.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 11:17:39 -0700 (PDT)
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
Subject: [PATCH v2 1/5] staging: bcm2835-audio: fully describe config symbol
Date: Thu, 14 Apr 2022 14:16:18 -0400
Message-Id: <20220414181622.102049-2-athierry@redhat.com>
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

Explain SND_BCM2835 config option in more detail to fix checkpatch
warning:

WARNING: please write a help paragraph that fully describes the config
symbol
FILE: drivers/staging/vc04_services/bcm2835-audio/Kconfig:2

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/Kconfig | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/vc04_services/bcm2835-audio/Kconfig b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
index d32ea348e846..307f2d6a9599 100644
--- a/drivers/staging/vc04_services/bcm2835-audio/Kconfig
+++ b/drivers/staging/vc04_services/bcm2835-audio/Kconfig
@@ -5,5 +5,7 @@ config SND_BCM2835
 	select SND_PCM
 	select BCM2835_VCHIQ
 	help
-	  Say Y or M if you want to support BCM2835 built in audio
-
+	  Say Y or M if you want to support BCM2835 built in audio.
+	  This driver handles both 3.5mm and HDMI audio, by leveraging
+	  the VCHIQ messaging interface between the kernel and the firmware
+	  running on VideoCore.
\ No newline at end of file
-- 
2.35.1

