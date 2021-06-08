Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02A52FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wp596HvsXKCpAwusArsHwfjreuet0FT2ap8ASM9VttM=;
	b=U/oU1FS8HY3mTPbGyWwRCLUUDciwQuW0+fCKG6nwOLeQBUUfF2TUJM1Et8qaRnnARWYp/X
	Sxyd0YAXwK7y2KaLsU+QPOgLsZT+GHrhUEfVJiOYGTcbWdylsC+IBoS1RQUfeRPeaA+848
	GNYPasWlLbdYV9goaEhJ/NRX9789JNU=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-432--4lH_dj8OTuy0dcjIoRGGA-1; Tue, 08 Jun 2021 17:24:13 -0400
X-MC-Unique: -4lH_dj8OTuy0dcjIoRGGA-1
Received: by mail-oi1-f200.google.com with SMTP id l189-20020acabbc60000b02901f566a77bb8so662530oif.7
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wp596HvsXKCpAwusArsHwfjreuet0FT2ap8ASM9VttM=;
        b=plPonOS6s8rLHbl4P3Gnbc7FZ/WLni0b0Ir7yOZlL6DeLarQ25lPOB5Q89H2A4Q/Ix
         kp8ZsNgonE08izkT/iEujoy35J0Hc5op/Ng1fm65aEbdWYlbaG8b8aTsSG4bah/v2sdm
         Emp2XnDMpL5YLHDGdpfTof0hs/TX81d7GoI6x+nvX7K8MFt6kK5kRDl8QXL7cBjZzhbQ
         50tQg9YGAc2SEyWBBfcR8CqQgcxknYtqPCBkiK8N29iGiNbFYT6Y/WXxKEEkhhvJUAZH
         vqIuNDRK9cYGhX2jsZvUd3JR8QJtJclnAgzLptaFnH3NpwmbT+ggjGnPJPjty7izE9jV
         2fIg==
X-Gm-Message-State: AOAM533LMv3pfQUeO98FpLVG1ZdpEN1mBxxdXVgeHK5oFsTgnFTuH/++
	0fRoAfkHSk6ZWkqlxywqUHDyjHV6nZaTRZW5iwdFb3UOQr/1fIG+OOOf6ZCnhhbRdsZtI8dAobZ
	RI02woyHp3JnLkaW2nW6Lc7YyWQ==
X-Received: by 2002:a05:6830:161a:: with SMTP id g26mr12732180otr.62.1623187451515;
        Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLOwO0hiMF+KA6dMHmw2cY7cTlxB9WKoQb/W2MRs5OG0rKOt4HtiG8bWLvQUw/6wISGO0yyQ==
X-Received: by 2002:a05:6830:161a:: with SMTP id g26mr12732164otr.62.1623187451344;
        Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:11 -0700 (PDT)
From: trix@redhat.com
To: mdf@kernel.org,
	robh+dt@kernel.org,
	hao.wu@intel.com,
	corbet@lwn.net,
	fbarrat@linux.ibm.com,
	ajd@linux.ibm.com,
	bbrezillon@kernel.org,
	arno@natisbad.org,
	schalla@marvell.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	gregkh@linuxfoundation.org,
	Sven.Auhagen@voleatech.de,
	grandmaster@al2klimov.de
Cc: linux-fpga@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-crypto@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tom Rix <trix@redhat.com>
Subject: [PATCH 04/11] crypto: marvell: cesa: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:43 -0700
Message-Id: <20210608212350.3029742-6-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210608212350.3029742-1-trix@redhat.com>
References: <20210608212350.3029742-1-trix@redhat.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"

From: Tom Rix <trix@redhat.com>

Change use of 'a fpga' to 'an fpga'

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/crypto/marvell/cesa/cesa.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/crypto/marvell/cesa/cesa.h b/drivers/crypto/marvell/cesa/cesa.h
index c1007f2ba79c8..d215a6bed6bc7 100644
--- a/drivers/crypto/marvell/cesa/cesa.h
+++ b/drivers/crypto/marvell/cesa/cesa.h
@@ -66,7 +66,7 @@
 #define CESA_SA_ST_ACT_1			BIT(1)
 
 /*
- * CESA_SA_FPGA_INT_STATUS looks like a FPGA leftover and is documented only
+ * CESA_SA_FPGA_INT_STATUS looks like an FPGA leftover and is documented only
  * in Errata 4.12. It looks like that it was part of an IRQ-controller in FPGA
  * and someone forgot to remove  it while switching to the core and moving to
  * CESA_SA_INT_STATUS.
-- 
2.26.3

