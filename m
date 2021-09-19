Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1264C3FC3
	for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 22:06:40 +0000 (UTC)
Received: by mail-qk1-f170.google.com with SMTP id y144so36229081qkb.6
        for <linux-staging@lists.linux.dev>; Sun, 19 Sep 2021 15:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=IjkKpbsOxtTLRzIMIRjss6tASIT031WBS0F4FaC661o=;
        b=XAeOLV6BqNjq9EWbsR0tUxpnuA2trCD6twKtXiP6b+wl5coPS29WULQcpwcxCVTvPK
         ebBE4TcKwer/1lhoni/vME6bsNX9QVYzqV/TU+9mqmJqApuUj5fzDCuLBx52AjXiS26I
         bCvSgZ0BoijMDw9OsUbb6TtMqaldXR4v9dPdihNcYKol/J3grtDmz3viohVSBSMiXeNL
         5j4coQufHZo7sjO/ZV1HzUWFqVWtHDqhbaDiSuhVC5cqy6fUUfP2TL4QlTZZMQyjT2vy
         4GvgJ0xOr6m8YPjNw08MoP5Vtw7CoP/zpqgdWnPIqnpdHCYJ4fO+N3R9RrUpDHXIuSHp
         HiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=IjkKpbsOxtTLRzIMIRjss6tASIT031WBS0F4FaC661o=;
        b=PffxYHJEAZ9vgPPcyMaOGe3jzhvluOj6DTvoyBIGLv/0Yn0APUFcyRW83AgvEJPmzr
         GRxTOMH/W4tMxbHrsP1P7IbuzJDcWAlpz2ovoa1rTH5bB/fe37I7l+YEntudwCgmLTHC
         mLA5AW7SyeYO0ywDLLom8k/cML2TGR2unzmdBiFv0u3V+2csZR/MkZPWx3tE1Wpq5A+2
         wlDqHp60zciUcP4YjP5BCttCPDAIebdtx+88/FVCCGmLiNI0KW8lsaZdQyq4QFqz1kai
         cqtLP9+W902pXRZ3ecvdJqMuOBS4l5apYIPseIX4a+3Mg69/hPs9fiJvbCKDMQb4oNNA
         E/iA==
X-Gm-Message-State: AOAM532wipPJxoM5bwHd7Ru+syDZ5uF9I1ra6jbvtftGxoFyHjtSl35O
	MKOromgZmJg9nE/5uClu0HHN48ns+GY=
X-Google-Smtp-Source: ABdhPJz1CWgnIroJXybinJQzMbOF2B23vgwlHdCljMO+VE+W8hT0mUE2aP6wnNPYMAnp/J3/Q3kmpA==
X-Received: by 2002:a05:620a:191e:: with SMTP id bj30mr20635687qkb.319.1632089199017;
        Sun, 19 Sep 2021 15:06:39 -0700 (PDT)
Received: from localhost.localdomain ([191.84.236.195])
        by smtp.gmail.com with ESMTPSA id t23sm246313qkj.31.2021.09.19.15.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Sep 2021 15:06:38 -0700 (PDT)
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
Subject: [PATCH v2 6/7] staging: vchiq_arm: remove extra blank line
Date: Sun, 19 Sep 2021 18:59:13 -0300
Message-Id: <20210919215914.539805-7-gascoar@gmail.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210919215914.539805-1-gascoar@gmail.com>
References: <20210919215914.539805-1-gascoar@gmail.com>
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

