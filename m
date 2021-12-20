Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 720C42C9D
	for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 21:31:31 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id c202so218786qkg.12
        for <linux-staging@lists.linux.dev>; Mon, 20 Dec 2021 13:31:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zj4Z1AB35wd1vTKNBKFRSR6CiKchENns4ZR0v8Fns04=;
        b=GOR0MBa/Xmy00Aw3b2EieHWd7CevEII7rqbIH1TFVHaFKdc+fYX+8ELGhF9kBQtlPp
         z0ZPRv2mu7C/hIKRpXtuSChBuzewZU5PA/E+WbUVDvS0Vbv+PlYrCXHXwV+0KE7VOjUv
         BvFP75ohX2KULNxqsZtMK/IbRDn0q+xXgfL3zW26AgCdM4+c4042iC9UGvKARh1RdUjm
         qFteVVxJEVQaRld6ohFMOt0yS6Bw65KMFIr8nOX2uyUsZhvfKAFzRh/VGOAAO/pear3x
         iUVJKfQ3jmuTFf6MkSoD2SKUe+SzDE2BRv2JjKT37jhC6xChgxDbv6r8dt5BHDT8Ktya
         DFQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zj4Z1AB35wd1vTKNBKFRSR6CiKchENns4ZR0v8Fns04=;
        b=O36zqxVyoHAAB05EENtFsz66sCTSbY2BrJFGFY1NdVtHi4fnbUanpRefYmqvtu2cg5
         i7Xmqf+PncH1t/7NB8cCwr3wFTra5DMaSk5eHIqdlve9Q33z2j/dI15VnY3usWufRep2
         xbIzoDDwaP/TtTpxm77b0PcZBIg4VxTiUb1QGGoqzcsOZL4jc52FWAi94iXtDNtvlI/Y
         qLNqtJ16DUVfa1/gJtyrBqciXzmh7/u8tdxubfCg9QfxEDJnLWLiZ75WGCQdprQQUD7h
         KZAcuNxck5oNtPOsCv0nv2zU/jUNl67N/6NPQDVZJWOkZVjMlCtGK16yqR/mPywYfGuY
         fvXA==
X-Gm-Message-State: AOAM533TRLHkWy65H1fdMiYH2Hbs4pTTWnDdDAbrWixNMqpkHUguTOmS
	pkc7zr63VI1OCSU0SV4RjyssNhJFpJE=
X-Google-Smtp-Source: ABdhPJwt6/EGrHzCkJ2tXvrtDivRehX0CRfFibm2LENvRbcLBNB+fSJskiTi96LHjFD+g7S7ssn5rQ==
X-Received: by 2002:a37:9ed5:: with SMTP id h204mr76593qke.35.1640035890318;
        Mon, 20 Dec 2021 13:31:30 -0800 (PST)
Received: from localhost.localdomain ([181.23.83.92])
        by smtp.gmail.com with ESMTPSA id s20sm16132210qtc.75.2021.12.20.13.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Dec 2021 13:31:30 -0800 (PST)
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
Subject: [PATCH 4/4] staging: vc04_services: update TODO file
Date: Mon, 20 Dec 2021 18:29:14 -0300
Message-Id: <53c397198ee5f0294b88452cfe24321829a0837d.1639858361.git.gascoar@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1639858361.git.gascoar@gmail.com>
References: <cover.1639858361.git.gascoar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no typedef remaining under vc04_services/. Hence, remove the
task from the TODO file.

While at it, fix the items sequential numbering.

Signed-off-by: Gaston Gonzalez <gascoar@gmail.com>
---
 drivers/staging/vc04_services/interface/TODO | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/vc04_services/interface/TODO b/drivers/staging/vc04_services/interface/TODO
index 39810ce017cd..241ca004735c 100644
--- a/drivers/staging/vc04_services/interface/TODO
+++ b/drivers/staging/vc04_services/interface/TODO
@@ -80,11 +80,7 @@ vchiq-core.ko and vchiq-dev.ko. This would also ease the upstreaming process.
 
 The code in vchiq_bcm2835_arm.c should fit in the generic platform file.
 
-12) Get rid of all the struct typedefs
-
-Most structs are typedefd, it's not encouraged in the kernel.
-
-13) Get rid of all non essential global structures and create a proper per
+11) Get rid of all non essential global structures and create a proper per
 device structure
 
 The first thing one generally sees in a probe function is a memory allocation
@@ -92,6 +88,6 @@ for all the device specific data. This structure is then passed all over the
 driver. This is good practice since it makes the driver work regardless of the
 number of devices probed.
 
-14) Clean up Sparse warnings from __user annotations. See
+12) Clean up Sparse warnings from __user annotations. See
 vchiq_irq_queue_bulk_tx_rx(). Ensure that the address of "&waiter->bulk_waiter"
 is never disclosed to userspace.
-- 
2.34.1

