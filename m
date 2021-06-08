Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E232FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9WOcYtG36rVjuPEj8K6lgDL7dCdoY9WpL7jwDyU54B8=;
	b=QvCnwQqo0eG+uhBmeDYFKzfENhFPQ8IHT3v/OQL2XRPlzq1LDH0Z1JUefhW6fnM150ht6k
	M7O+dLPCtSniO50w4qkcl3QzEeBr/3p01ob1b3c4FQ3eTQvspVjLIcmZlrswovv1nHsDy7
	QwYeFTfk+PLfN3iVWgVTKXNRRBmYOBE=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-239-mJCF4-QDO1iUzVazcUXZag-1; Tue, 08 Jun 2021 17:24:02 -0400
X-MC-Unique: mJCF4-QDO1iUzVazcUXZag-1
Received: by mail-ot1-f71.google.com with SMTP id t13-20020a0568301e2db02903db6adef049so10150827otr.20
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9WOcYtG36rVjuPEj8K6lgDL7dCdoY9WpL7jwDyU54B8=;
        b=O0yAEVczyJ8aAfRrhEl74UUPH7G+uoDUf/0Iqlw8RJJN9xN1fYKav3f57ni21rHkLq
         Acaoa3cX8/Xz8SuBLp7xjNQ3bNcqIxg/LHS50mDHJR1OhY5cKukpJynExwTs2qllAuMq
         j0Z7cPhp661d+nT08qb5KrxBCYlrwPdYhgDVzsD+sQ5iWvPBtRXW2YeZIpX6jRX+uCp+
         GZr8cx/08P42T8W3fQQB5z3PtckJMTLhsFggIPdKnDUhChRQ82/17rWikeFKiBwYt3/t
         U9W82CPnxEhVktanhs43Z8jOtHK+EI2x5LN6H5duZ8M59nHlwCPu2LZQu30dcAZa2Rwx
         1FBA==
X-Gm-Message-State: AOAM532CvS7tGKBn5HAtw3islqJJ4Na7usJnH34crz+D7WzJf24CscNV
	OjwAWy+S654WEAJUjb+z/8S9kEwIIkHGRr9bJku0d4Y1JG+zDOyW4nhTR5MLWpOKyQiFPuGB3mp
	q9mULUajNjcqyVrhmW1TPiTaVPg==
X-Received: by 2002:aca:4703:: with SMTP id u3mr4203147oia.37.1623187441894;
        Tue, 08 Jun 2021 14:24:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxOmes5a6/9rFBo39RJQElGnhgBYJ++iI8VFQf2/yT0UFkGTfCosxrJuI7CS1xqFaTnjT/XLg==
X-Received: by 2002:aca:4703:: with SMTP id u3mr4203117oia.37.1623187441736;
        Tue, 08 Jun 2021 14:24:01 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.23.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:01 -0700 (PDT)
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
Date: Tue,  8 Jun 2021 14:23:39 -0700
Message-Id: <20210608212350.3029742-2-trix@redhat.com>
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

