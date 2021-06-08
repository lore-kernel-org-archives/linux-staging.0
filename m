Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1746B29CA
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9WOcYtG36rVjuPEj8K6lgDL7dCdoY9WpL7jwDyU54B8=;
	b=YuU+ZGPB6Cgx2Ael2H+Arv/N/8kNlAzaEuzXl9zsj4NeRE4sS1qOzF168r625h/DWdthX8
	2BS+0T/WJRPv5uG/v6uqx1sGWSnZKj5xLAbuIYufu+EnURyWdPyYF/sibGXrYjBeUu6QS7
	gwGKg3RSSN3o6GFrh7BYPRnZxPtklGI=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-VEj8ukgtMRyS-YCXO0b3hQ-1; Tue, 08 Jun 2021 17:24:00 -0400
X-MC-Unique: VEj8ukgtMRyS-YCXO0b3hQ-1
Received: by mail-oi1-f197.google.com with SMTP id o65-20020acaf0440000b02901f5112008e6so940299oih.17
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=9WOcYtG36rVjuPEj8K6lgDL7dCdoY9WpL7jwDyU54B8=;
        b=AOWnFCTwggm2o59/308ctpXeJ7oTyVG9JUGRCga+Fa2ELY0hgGaISLIN/nBkwaajvQ
         Kob0wx+N61tKG0FM+Spg8LbLS+RnWtIMPMxH39okx8qTdZzyvDIwPanO3l2GewMi+0Hb
         F5hQ8/iAje5punUkqb7k0UKKxJom+tLnLL77YYvW0WSsjRiuu6S0fuRNCDr8LqgCxSxF
         DbWluRWBsn1nAfWf6NI7hb9SzuUeceNAUsed2QbddMCm6P7o/hsXdOhFob/36B0/8aD9
         d//kXCjmHRLVusgQULSBBXM9rE++JrHtXdxzZUd7/CsHMP7x1crvyKAj4Rmy6VUkkZ4m
         xglA==
X-Gm-Message-State: AOAM532pFGlJuq7KOIl5GhSAs50YtWCi2C04A4WrVw11Te44LQz/kHbY
	T50Mp2ArqRJz2U0Gha8cpdZugQuPPwKsnBgrw5RJapH8ttQofi2QSfJJKpkgqGgoG80g7CCsmk9
	mbCLVR9Sn5jbKG7Or6NLtPcO5ew==
X-Received: by 2002:a54:4091:: with SMTP id i17mr4211780oii.96.1623187439562;
        Tue, 08 Jun 2021 14:23:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/slvYeAdnbZ/SPI7BCq6DWlaOdgzks9roBFKWnERshaA7TkLI+lr32K9zzB6m1V9KMz0o0A==
X-Received: by 2002:a54:4091:: with SMTP id i17mr4211765oii.96.1623187439400;
        Tue, 08 Jun 2021 14:23:59 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:23:59 -0700 (PDT)
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
Subject: [PATCH 00/11] fpga: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:38 -0700
Message-Id: <20210608212350.3029742-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
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

A treewide followup of
https://lore.kernel.org/linux-fpga/2faf6ccb-005b-063a-a2a3-e177082c4b3c@silicom.dk/

Change the use of 'a fpga' to 'an fpga'
Ref usage in wiki
https://en.wikipedia.org/wiki/Field-programmable_gate_array
and Intel's 'FPGAs For Dummies'
https://plan.seek.intel.com/PSG_WW_NC_LPCD_FR_2018_FPGAforDummiesbook

Change was mechanical
 !/bin/sh                                                        
 for f in `find . -type f`; do
   sed -i.bak 's/ a fpga/ an fpga/g' $f
   sed -i.bak 's/ A fpga/ An fpga/g' $f
   sed -i.bak 's/ a FPGA/ an FPGA/g' $f
   sed -i.bak 's/ A FPGA/ An FPGA/g' $f
 done


Tom Rix (11):
  dt-bindings: fpga: fpga-region: change FPGA indirect article to an
  Documentation: fpga: dfl: change FPGA indirect article to an
  Documentation: ocxl.rst: change FPGA indirect article to an
  crypto: marvell: cesa: change FPGA indirect article to an
  fpga: change FPGA indirect article to an
  fpga: bridge: change FPGA indirect article to an
  fpga-mgr: change FPGA indirect article to an
  fpga: region: change FPGA indirect article to an
  fpga: of-fpga-region: change FPGA indirect article to an
  fpga: stratix10-soc: change FPGA indirect article to an
  staging: fpgaboot: change FPGA indirect article to an

 .../devicetree/bindings/fpga/fpga-region.txt  | 22 +++++++++----------
 Documentation/fpga/dfl.rst                    |  4 ++--
 .../userspace-api/accelerators/ocxl.rst       |  2 +-
 drivers/crypto/marvell/cesa/cesa.h            |  2 +-
 drivers/fpga/Kconfig                          |  4 ++--
 drivers/fpga/fpga-bridge.c                    | 22 +++++++++----------
 drivers/fpga/fpga-mgr.c                       | 22 +++++++++----------
 drivers/fpga/fpga-region.c                    | 14 ++++++------
 drivers/fpga/of-fpga-region.c                 |  8 +++----
 drivers/fpga/stratix10-soc.c                  |  2 +-
 drivers/staging/gs_fpgaboot/README            |  2 +-
 include/linux/fpga/fpga-bridge.h              |  2 +-
 include/linux/fpga/fpga-mgr.h                 |  2 +-
 13 files changed, 54 insertions(+), 54 deletions(-)

-- 
2.26.3

