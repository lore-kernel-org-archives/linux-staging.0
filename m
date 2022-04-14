Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA617A
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 15:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1649949834;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dJ952WGOXndZeyhd9vxjBUmOeHfnPduqI8EF8AuKcTY=;
	b=fTYce2oGfysGpn22xL4fm4x5aFyijJc7A03IyswqT8/laUWMFv4A1dxdI4udO4ZkcaEN7P
	U5+w0Elj+kTwqJIuZvBYQH6xKWDKZk/Zlyih9ZKaEVu7yhSSKqTV51ox9UinwVkG7R5Ozv
	HAdklqg/UHikEs2w08NuJNAMxd2U2AI=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-652-EfET2_SOMi6wIjzkQxQzSQ-1; Thu, 14 Apr 2022 11:23:53 -0400
X-MC-Unique: EfET2_SOMi6wIjzkQxQzSQ-1
Received: by mail-qv1-f69.google.com with SMTP id z12-20020a0ce60c000000b0044632eb79b3so213755qvm.7
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:23:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dJ952WGOXndZeyhd9vxjBUmOeHfnPduqI8EF8AuKcTY=;
        b=L6413ABhaR7wrUSd5U5+ZEiVW7B84dbnekF6DPSKlBwfA0LzgB4sjlrB7Ct7RnKnYi
         2w7po75n60t+vD6+sn9Xp+ftZ1eydJrGVQd0Q0Q2im5/RgiOCu0TQxuPC1maERGTzhRl
         dhNqiWa4rvcsP2/8aT1ITZCm6L1JxOhe2rxzGeNpJtFNwNhuYZfaQMotlNPsWRfRre+h
         er5E+Q2fO3fh5OV8Ho4u7d6j+K3q6cA23uZoYirboO9USJhcUYO4JDB6ShLJ1MVrhFMG
         S+krb2slzDdwgPZWpBmv6ZZEvU/D/wtASuz24kAzA8Zb0E7mf79d0tCwBZTS59J58lS9
         CRaw==
X-Gm-Message-State: AOAM531g0eYqn6m51G5MjvJlSJ8jm9io0vo3YXXTo+dIO37htclDf1Md
	lHiCI2wtaLHIL7zdEnnoj2jvMZxrG5A0cAEaKX/9J7t06s/WqmRzXSyd+ky7fQRbR3ILLN8pplS
	58wjohhSnh7laByvTKOsdHnIFeQ==
X-Received: by 2002:a0c:b2d7:0:b0:443:afac:fc60 with SMTP id d23-20020a0cb2d7000000b00443afacfc60mr3750479qvf.58.1649949833142;
        Thu, 14 Apr 2022 08:23:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDfFqGhctIMuMkohOJTACk8HeRnuayiX/2TbehKgCD7SAbsugdHp+eT2bykwpixK0AJIEDHg==
X-Received: by 2002:a0c:b2d7:0:b0:443:afac:fc60 with SMTP id d23-20020a0cb2d7000000b00443afacfc60mr3750456qvf.58.1649949832926;
        Thu, 14 Apr 2022 08:23:52 -0700 (PDT)
Received: from fedora.redhat.com (modemcable200.11-22-96.mc.videotron.ca. [96.22.11.200])
        by smtp.gmail.com with ESMTPSA id p5-20020a378d05000000b0069beaffd5b3sm1166038qkd.4.2022.04.14.08.23.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 08:23:52 -0700 (PDT)
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
Subject: [PATCH 0/2] staging: bcm2835-audio: minor code style cleanups
Date: Thu, 14 Apr 2022 11:23:38 -0400
Message-Id: <20220414152340.68932-1-athierry@redhat.com>
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

Adrien Thierry (2):
  staging: bcm2835-audio: fully describe config symbol
  staging: bcm2835-audio: clean code style warnings

 drivers/staging/vc04_services/bcm2835-audio/Kconfig         | 5 ++++-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-pcm.c   | 5 ++---
 drivers/staging/vc04_services/bcm2835-audio/bcm2835-vchiq.c | 2 +-
 drivers/staging/vc04_services/bcm2835-audio/bcm2835.h       | 2 +-
 4 files changed, 8 insertions(+), 6 deletions(-)


base-commit: 194193dd06848c1839d928090cb2032eec8b2f9c
-- 
2.35.1

