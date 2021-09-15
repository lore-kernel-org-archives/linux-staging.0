Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC2403FC9
	for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 20:19:11 +0000 (UTC)
Received: by mail-qk1-f181.google.com with SMTP id a66so4948884qkc.1
        for <linux-staging@lists.linux.dev>; Wed, 15 Sep 2021 13:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjkKpbsOxtTLRzIMIRjss6tASIT031WBS0F4FaC661o=;
        b=NsR01QR1nDuiFpi9f+jX2Vt5AXHErqLS4DoCkeN1aYkVfSCLubVO5nk3E1duUnwA7y
         XRoKx30/JUaooaSWxQKFyLuDy/xwfyoQ0PUuFFDGxsBU63xh69T0Lgh3PYiH2bAgH0hD
         wLieKG/lrcfStyVIr5Xx8s1wDnyS2Osb0+hEza/a+bgLsBjBqau10PV7sRaI1Rrq+tmA
         WWX/nWntsqnffvdq100PkRCWsXoL15NxaREdfimqT8XOSw439TGvlECD1nQHGzRrIbW0
         8XX+/frzSur16a9Qck9QgOJ9Q2actIuTomn5LvCHAw8wIah2vpWGaoE/RwpBvbK8gIgt
         2usg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjkKpbsOxtTLRzIMIRjss6tASIT031WBS0F4FaC661o=;
        b=YLu4uzZVbJQeOkW4rJN2xhLGd4FnB8mSMsPu/TF3Dgjp7pweqa5+SSVcSIAK+UHEs2
         DG3KiwvUboUtLSnKI65/qNl3x3zyLwjkhx/6zCe4l+4d6V8hUE8pBv/lxc6xJM6AMApA
         wkTdHrS86yHwpYm6v0cjRINkTSbyfPzrworHH/fqfnuyCl2uTTO6w4uA3ISXMOoK0Jw8
         CdwLtW4WB5C5fZcSpR548Cqq5qoMey79wVTDuPMOo5dZEaLWqyGgAyzbbBUpHZfDy/Q3
         sY987D3/gr5Phw3Pd9W9x+etAHrGY01VcrP0nhJcsWZGvcEW6k8gek3+tlF3+0yrijsv
         8sEw==
X-Gm-Message-State: AOAM530CbQ7hDc8MbTNW9G4c0dOCcAyVPsuhiH5b7uPONWIJM252OsgF
	o63txHEqh2vwJFdJN1PS71LTxOec29Zt3g==
X-Google-Smtp-Source: ABdhPJzGaVaPmN/ZRRmux31NxHdMbfPHZSvr8nFu9oEOEurSgh/CvDC6wjBAoBgHgNZaDd0P6VjFNw==
X-Received: by 2002:ae9:c007:: with SMTP id u7mr1838430qkk.271.1631737150846;
        Wed, 15 Sep 2021 13:19:10 -0700 (PDT)
Received: from debianG.lan ([181.166.206.110])
        by smtp.gmail.com with ESMTPSA id g8sm752834qkm.25.2021.09.15.13.19.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 13:19:10 -0700 (PDT)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: gregkh@linuxfoundation.org,
	nsaenz@kernel.org,
	stefan.wahren@i2se.com,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ojaswin98@gmail.com,
	amarjargal16@gmail.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 6/7] staging: vchiq_arm: remove extra blank line
Date: Wed, 15 Sep 2021 17:18:23 -0300
Message-Id: <20210915201824.413202-6-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210915201824.413202-1-gascoar@gmail.com>
References: <20210915201824.413202-1-gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove unnecessary blank line.

Reported by checkpatch.pl

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
index e8e39a154c74..8f5182df17b6 100644
--- a/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
+++ b/drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.h
@@ -151,7 +151,6 @@ vchiq_dump_service_use_state(struct vchiq_state *state);
 extern struct vchiq_arm_state*
 vchiq_platform_get_arm_state(struct vchiq_state *state);
 
-
 extern enum vchiq_status
 vchiq_use_internal(struct vchiq_state *state, struct vchiq_service *service,
 		   enum USE_TYPE_E use_type);
-- 
2.33.0

