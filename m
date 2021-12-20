Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DEF52C9D
	for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 21:30:30 +0000 (UTC)
Received: by mail-qk1-f177.google.com with SMTP id g28so10679809qkk.9
        for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 13:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CjOpGoTB+RgFzED/Z5AJZmeEWUvnehVde5GsP9KVlrg=;
        b=iPwn9myv9DhSISQF4gJy7e3ExgU3CZV85sDsiLBSKar85A7qLsigdOqYYxRYht2dzG
         K0pxeA4bfxppWl1XmCx4YwCS+CEFByUmFJ1IviO9vNfG2mlLMaXFRMsahgdiha4rudKu
         6VwLnLMWggIpnv7UXmFvmnrhEBqDeiIz3Iiutd7CyzGN1bEe4NYeDXyznYYDwKv+G23L
         pvg4vyr9qf6RAaas6Ggdp+qjupqXTDGTOnATs7ccwnLGomdAXynhTxDplLl6cH0hiYAv
         rKsO0Kjam7ytgrOFMBhoeG6YiuCqsSDkUQ3ydkvecc+klDoUiDuL+iLm1PvEq+KJRTot
         bk3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CjOpGoTB+RgFzED/Z5AJZmeEWUvnehVde5GsP9KVlrg=;
        b=WpjLm2B8ZdMlfdyC6TgUhQ9ORR7/Al5wDG/3fG/CjH1F7eP747TUrbpEhiOT5unjMg
         4uV+kHocFHhyP5uZJoHpMHznimjxnsCU+ot4k9R6WVOM/oUQtJ3J0bNLukdEWs5kCtpj
         dLPDTY/ZR9er6bjt4OSFv1obcFkjnckFw9Nr4ItLjrPERfen+0YgRdyr1NpbzMgb/YQm
         OiIhfOuXHImp8YqirwAKP7LPBh6wb6xnv2HDlv/N8YNzt/c8yIA7SHEBP+BPbpT+mYYg
         WukqYPlwOTaQmsokOE1IMkLb+JrmP/GEsW2fF4Ho6AX0FJ0dSy1uZxyWBUoNeSWbKo7Z
         g0rA==
X-Gm-Message-State: AOAM5328rk0+YevalfFS3FWateuQk6Je48WxDYW07k6EQfvpVnnkVSWv
	+zaE8Jh8e+MUOSFtO7p2U2wyxniIC7A=
X-Google-Smtp-Source: ABdhPJwsW3YzqTrxOFRap0vjfSnMSaYXOxThDtZXdIBLAgmpQiM0u9ULfOv8wwdtazDAaYNCF/qYwA==
X-Received: by 2002:a05:620a:bc7:: with SMTP id s7mr101221qki.20.1640035829392;
        Mon, 20 Dec 2021 13:30:29 -0800 (PST)
Received: from localhost.localdomain ([181.23.83.92])
        by smtp.gmail.com with ESMTPSA id s20sm16132210qtc.75.2021.12.20.13.30.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 13:30:28 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	f.fainelli@gmail.com,
	rjui@broadcom.com,
	sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	juerg.haefliger@canonical.com,
	rdunlap@infradead.org,
	dave.stevenson@raspberrypi.com,
	stefan.wahren@i2se.com,
	unixbhaskar@gmail.com,
	mitaliborkar810@gmail.com,
	phil@raspberrypi.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/4] staging: vc04_services: avoid the use of typedef for function pointers
Date: Mon, 20 Dec 2021 18:29:10 -0300
Message-Id: <cover.1639858361.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch set removes some typedefs for function pointers in vc04_services.

After patches 01 to 03, there are no remaining typedef under vc04_services.
Hence, the patch 04/04 updates the TODO file removing the 'remove typedefs'
task.

Gaston Gonzalez (4):
  staging: bcm2835-audio: replace function typedefs with equivalent
    declaration
  staging: vc04_services: replace function typedef with equivalent
    declaration
  staging: vc04_services: avoid the use of typedef for function pointers
  staging: vc04_services: update TODO file

 .../vc04_services/bcm2835-audio/bcm2835.c     | 28 +++----
 .../vc04_services/bcm2835-camera/controls.c   | 76 +++++++++----------
 drivers/staging/vc04_services/interface/TODO  |  8 +-
 .../vc04_services/vchiq-mmal/mmal-vchiq.c     | 24 +++---
 .../vc04_services/vchiq-mmal/mmal-vchiq.h     | 13 ++--
 5 files changed, 66 insertions(+), 83 deletions(-)

-- 
2.34.1

