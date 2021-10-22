Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690902CA3
	for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 10:10:35 +0000 (UTC)
Received: by mail-ed1-f51.google.com with SMTP id e19so1053212edy.0
        for <linux-staging@lists.linux.dev>; Fri, 22 Oct 2021 03:10:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JmAB8n7UaBcqYspnUH1iQzfV3fA+SByJ94PZYXKecgY=;
        b=oHt2Wof0ZrH0Db8BpUIlVfNuIA4YEHpx/05WyIgrxZ0IKpYvKPeO8ACqfZ6VwmwbjY
         OV279sUu09r2FU8ECBsJCWfFPjQP8zAN79mE+V459+7wkRrSyU/VhroL9b0wiPcfVGw1
         8NSCjFU7/w05VaGu0PWBoxoIZ9eyDSoiAN2Bu3nUMREUXK47Ny/r7QUqI4IhR/n1sDUM
         5K1QbBNWJrMna0D+Vq3GjdNlmPfPY/Nr5hZqbrqWG7+NvIH3AAYOjWT9ZFqpXEhQ2z//
         Xy2fivTQpEsha23cIFT2S63HrIOFtIl43mtF57PjpLu1uQtmYqdgMvsp6D/wY2VNkS/6
         Qc1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JmAB8n7UaBcqYspnUH1iQzfV3fA+SByJ94PZYXKecgY=;
        b=qYNPObZY9kKS57IrBX13f/GqPI35rueCytEuSv5+Ydl18Gu6tnTQEwl4AkDNRQ18qj
         Hs2ZNDyDInYXEv78gYSHBrSG4DfagPGbUhApD6M/tShDOHFxqqRVQNBR/qfcOEjPdzjL
         jSeKHNhQHpoaBJ8f81ZuL2oiWXzzIaEDOYOvscPCIF/N1d0HOP/BRFtt1Ab+BiVIZqJ4
         gzwRc0dZ0uDpilt7DleY64weD2EgfXmPOBEeZA3T2XRXCqMm//MG5dscEjlzuZkwGBsV
         +iIL2bLdKsvCMkd4m3d0pnx4Mpjh//WzNFa0lWa9EMQ6Kf90SwGZ+4QuSlBXp5qoN714
         XhJg==
X-Gm-Message-State: AOAM531YBEzKuzTI1jkD4SOVRwlA8d2/54jQb8rKaPu3qQmXXh0WXo9o
	LOp5WWmTz6kekCBZaG6jE20=
X-Google-Smtp-Source: ABdhPJzATlfsnVn2ex6Z2XSOuRakVDLSIMIT1qSn1ffpholYi105ufGMMko+a0QJVqTMzg/Gklndrg==
X-Received: by 2002:a50:d558:: with SMTP id f24mr16112680edj.305.1634897433770;
        Fri, 22 Oct 2021 03:10:33 -0700 (PDT)
Received: from localhost.localdomain (host-80-181-148-119.retail.telecomitalia.it. [80.181.148.119])
        by smtp.gmail.com with ESMTPSA id j15sm4243446edl.34.2021.10.22.03.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Oct 2021 03:10:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Phillip Potter <phil@philpotter.co.uk>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH v2 2/2] staging: r8188eu: Remove unused semaphore "io_retevt"
Date: Fri, 22 Oct 2021 12:10:28 +0200
Message-Id: <20211022101028.30367-3-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211022101028.30367-1-fmdefrancesco@gmail.com>
References: <20211022101028.30367-1-fmdefrancesco@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove semaphore "io_retevt" because it is never used.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/r8188eu/include/osdep_intf.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/r8188eu/include/osdep_intf.h b/drivers/staging/r8188eu/include/osdep_intf.h
index 90b37655e9e0..0d7009269aab 100644
--- a/drivers/staging/r8188eu/include/osdep_intf.h
+++ b/drivers/staging/r8188eu/include/osdep_intf.h
@@ -34,7 +34,6 @@ The protection mechanism is through the pending queue.
 	struct urb *piorw_urb;
 	u8 io_irp_cnt;
 	u8 bio_irp_pending;
-	struct semaphore  io_retevt;
 	struct timer_list io_timer;
 	u8 bio_irp_timeout;
 	u8 bio_timer_cancel;
-- 
2.33.1

