Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3218B1867
	for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 17:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1650476757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W3NAe+4do7OzwFXlslJ1yxbsun/Vq+K/0OpwWY5c86Y=;
	b=hKSJFKd7EdZD0W50Mm9U2OZoQMP0Y6nK5C4B8BAqWd9FHHk4vhvm4Vupj1g3Oa/+duNamT
	cpjMNdQwm5yZItsh+BKrvh0aI+ot4Z46rewORnGIDwXg6ya97VZMjnx6ez+Abbob/WPH7T
	QTAefQuFHKb2Qx0FwLoOmAXFNY4iNZc=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-371-j1neAvaOMJSlWV2Mnb3mHw-1; Wed, 20 Apr 2022 13:45:56 -0400
X-MC-Unique: j1neAvaOMJSlWV2Mnb3mHw-1
Received: by mail-qt1-f199.google.com with SMTP id y11-20020ac8524b000000b002f1e35621dfso1468775qtn.16
        for <linux-staging@lists.linux.dev>; Wed, 20 Apr 2022 10:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W3NAe+4do7OzwFXlslJ1yxbsun/Vq+K/0OpwWY5c86Y=;
        b=oGQL5IKpaMyWDADIsRWJ74eZaxf3+Jv2h4MzC2tZdN7UEbymbgUzOhHLm8ofoz24d+
         ehOOHoP98+ss+ngdrdBrBMw4YuZ4awK1BaC7lEXcKbWbTH2/kE8rn5jD5gousBlvmRb7
         qbsBtDEk8fa/72UTAwJ6RD1XDtZAwCgNUm1Ik3b6WwT/6E6EmgfFtny1uavWNXi/Dub/
         6g+/buhN6r5PyxfSFClhtOWMUOTj3MR4UAPuEtpcReurv0SJoPPWERHQT0XTyxLaVbbU
         iE07DYwg4tlngbrXyQKi6DrpCwoW+8mWD4srVjv6s1z7zvsFAQTZfE8CBgXTpgGX2QdL
         sH7A==
X-Gm-Message-State: AOAM530Ryz7ysfKjtUH3Nq2T3Z1MZzbR0DlSYa0SJ/ixS11H6l48l905
	FXNmtJR8bXdPitXWMp78+NSpMr8pMbW060u2uNARCCXjYF70rJPAV8KTTACE1LnX1/pUAKA7UwU
	TDpiVSyA/+Ot2/J/Iiuu7Cat6Rw==
X-Received: by 2002:a05:6214:5185:b0:443:a821:31fc with SMTP id kl5-20020a056214518500b00443a82131fcmr16587289qvb.129.1650476755312;
        Wed, 20 Apr 2022 10:45:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzYAEQ1WmpR2JrVhqp2P3DD9igLq38fXCUMcnoHblogOvHnqs0AXZEApIUEBRvAIyTJ3afR3w==
X-Received: by 2002:a05:6214:5185:b0:443:a821:31fc with SMTP id kl5-20020a056214518500b00443a82131fcmr16587273qvb.129.1650476755110;
        Wed, 20 Apr 2022 10:45:55 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id s15-20020a05620a29cf00b00680ca4b3755sm1867721qkp.119.2022.04.20.10.45.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Apr 2022 10:45:54 -0700 (PDT)
From: Adrien Thierry <athierry@redhat.com>
To: Maxime Ripard <mripard@kernel.org>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Nicolas Saenz Julienne <nsaenz@kernel.org>
Cc: Adrien Thierry <athierry@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] staging: bcm2835-audio: delete TODO
Date: Wed, 20 Apr 2022 13:44:00 -0400
Message-Id: <20220420174401.305964-1-athierry@redhat.com>
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

Delete TODO since all tasks were completed:

1 - fixed here:
https://lore.kernel.org/all/20220408150359.26661-1-athierry@redhat.com/

2 - there are no remaining checkpatch.pl errors or warnings

Signed-off-by: Adrien Thierry <athierry@redhat.com>
---
 drivers/staging/vc04_services/bcm2835-audio/TODO | 10 ----------
 1 file changed, 10 deletions(-)
 delete mode 100644 drivers/staging/vc04_services/bcm2835-audio/TODO

diff --git a/drivers/staging/vc04_services/bcm2835-audio/TODO b/drivers/staging/vc04_services/bcm2835-audio/TODO
deleted file mode 100644
index b85451255db0..000000000000
--- a/drivers/staging/vc04_services/bcm2835-audio/TODO
+++ /dev/null
@@ -1,10 +0,0 @@
-*****************************************************************************
-*                                                                           *
-*                           TODO: BCM2835-AUDIO                             *
-*                                                                           *
-*****************************************************************************
-
-1) Revisit multi-cards options and PCM route mixer control (as per comment
-https://lore.kernel.org/lkml/s5hd0to5598.wl-tiwai@suse.de)
-
-2) Fix the remaining checkpatch.pl errors and warnings.
-- 
2.35.1

