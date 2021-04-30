Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E8C42F9A
	for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 14:57:23 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id r9so105686705ejj.3
        for <linux-staging@lists.linux.dev>; Fri, 30 Apr 2021 07:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=tqWuGh+IcIutJjY340lBdNQf7hFWM7L+H/WDKtguyuNk4uzusyF+YKIuTi6Ucw3nVM
         +UWk8D4PavSiERnS5jeSK4iRgMHLsYTAN3hy7wMyoVnAV/d5K5cGI0Zz8su9gQoGcS87
         mCtMo7Nz/FcR3elhXfZhtYdkKknZgDrb9s4cwrQygSKWJsfstFN7lvCJi6fx3Fdfhtj4
         YN+qyaOcKlusxvqWecvfQnmim2YmAeioP9PSXqAGTQDm0k94V+cLtyNLGF9lANZhrjz7
         KcPNYDAnuLOFOfH0z9zmOIcwe/nR32XZodL7XaJaeAC57IugRauUBYQPtyTlpVxOsmK4
         wYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=VXGJ6BJNTyxC31APtHNNGgHRV6GpZZQxSZgzKX376VM=;
        b=jJdcaG5f8XM4f+aMdVDSFOKl7HRTKzG8E+UPP5qbHN72EFrIr27v3pM16rQvSC4uwi
         /BjlLuwExj6QpjtNiMCDkC9T8ByYhOFLgvaMsuPt3uaIrRkJ5RQfLAv9R20QNWEOY1Eg
         vJQHnRQuJinJG9zjU72Bs5WP+0fJeC1GH9200Q3Qjx4gDIRuJmhpKDSblIcTQqzZ/10M
         W8xr761LcGYyhuEIOhAffWqc6+DoDG6S+SCtX5wE8iP2sJ9Bs8yjRRqk5jqj7BcPLtIG
         cBhy4/Q6GfWwdpEF+4sCZwXem5KMITHC1F+rDSqy989AYmmmyP1H3SsB/OJUZMs6E1Wi
         mv3w==
X-Gm-Message-State: AOAM5328xOxQaWCFzKTz1eOJOsF6rBDNaEkmvB5EchW0Bde0HRCncgSe
	QI6bL1NhfU8TWIRomsIbbMKXP2oGC7E=
X-Google-Smtp-Source: ABdhPJwilUl0DvCCKJZUaBjlbuGCKgdiKtaRQ/m7SG8KYhhIGcHS23PTXogrVBF1qzUtwTXwEcFRbQ==
X-Received: by 2002:a17:907:397:: with SMTP id ss23mr4648537ejb.298.1619794641719;
        Fri, 30 Apr 2021 07:57:21 -0700 (PDT)
Received: from agape ([109.52.244.36])
        by smtp.gmail.com with ESMTPSA id z4sm2113322ejw.54.2021.04.30.07.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Apr 2021 07:57:21 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 09/43] staging: rtl8723bs: replace ODM_RT_ASSERT with netdev_dbg()
Date: Fri, 30 Apr 2021 16:56:31 +0200
Message-Id: <3f172aaefb84aaac639f1850c5eb45678578e393.1619794331.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1619794331.git.fabioaiuto83@gmail.com>
References: <cover.1619794331.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

replace ODM_RT_ASSERT with netdev dbg.

Marco ODM_RT_ASSERT wraps a raw prink and prints a message
everytime second argument is false. This occurrence prints
always, so replace it with netdev_dbg()

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/hal/odm.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/hal/odm.c b/drivers/staging/rtl8723bs/hal/odm.c
index 0027ce211619..fcd3f97e7df5 100644
--- a/drivers/staging/rtl8723bs/hal/odm.c
+++ b/drivers/staging/rtl8723bs/hal/odm.c
@@ -552,7 +552,8 @@ bool ODM_RAStateCheck(
 		break;
 
 	default:
-		ODM_RT_ASSERT(pDM_Odm, false, ("wrong rssi level setting %d !", *pRATRState));
+		netdev_dbg(pDM_Odm->Adapter->pnetdev,
+			   "wrong rssi level setting %d !", *pRATRState);
 		break;
 	}
 
-- 
2.20.1

