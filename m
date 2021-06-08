Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 833542FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187458;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4gIQrxNh8rCNXWF5A+cmW2C8HVpKFKLZxYRvN1nK0FM=;
	b=Vy7zCXzoWLlR09Ca+EgDZZiQh3DwJW0YvUJ0eYSi3H80/a2WemEl1BuIPf9O7QC0kKzlSe
	SSkCrHigpHN3Wb4DHQ1ZjmpBvWja6pINvnMgmx/qcqClWQ6PTSijT3tbr2DB44NnlBRM8s
	nHPEeZvA4MBLEjlmFCa5VYBjyTbLCLA=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-VtR4t3WeNtuSKZpsm2Ij2Q-1; Tue, 08 Jun 2021 17:24:14 -0400
X-MC-Unique: VtR4t3WeNtuSKZpsm2Ij2Q-1
Received: by mail-oo1-f71.google.com with SMTP id o2-20020a4ad4820000b0290208a2516d36so14062991oos.16
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4gIQrxNh8rCNXWF5A+cmW2C8HVpKFKLZxYRvN1nK0FM=;
        b=HArm73xlEKMDR3j1alIGeQ764PkAsNQjPeUJ+9a28/366TEZzDoj18ML9DqXQjGaGh
         RD7dEtw15RiKfKMkqE7b2SKsfhxL5j5tyONWr9tXn6YqPSPkRRlYxe5k0mCaUsGO1ydT
         lCQcOK7EAeITc4hsXRBuggu8twgWzvvYPORVTn597URj7Cx7tjD70aa5LN4b623HyIaM
         d+O4wzR9ZDdd6pu9zvaDYWgL5jQvmodUxz4B5uNANDU+kntvn77Hr0jd5QbDvnG2q+OD
         GhhfQ0+ABOUDsr7NuWgD3Qwwd3KxIMbZySJcOtIKpL8Hx9ujsB7OmkolhrsQUxyTlOvw
         PGHw==
X-Gm-Message-State: AOAM532pXE9ogH8EneJc3DzFtKSXWYugwyN0SuMyB1BpZPuGUSyiFiYg
	MncckP0DFejUei8/tZyU1zebMWVZ8MWI8FocAQHaqGyV6GtX8Xod0Kgb1yPynJw5UtyrF6hiGAu
	NhaDFMlFoeQGJByroUq3AnDKTew==
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr4182081oic.123.1623187453960;
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxXsoUQfchNBKnL8EdmQmEAp/5gAc1hlFks6ooIHfYu2jxHqDv442A3KNzBoqbETAUPGj1thg==
X-Received: by 2002:a05:6808:999:: with SMTP id a25mr4182055oic.123.1623187453793;
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:13 -0700 (PDT)
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
Subject: [PATCH 05/11] fpga: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:44 -0700
Message-Id: <20210608212350.3029742-7-trix@redhat.com>
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
 drivers/fpga/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/fpga/Kconfig b/drivers/fpga/Kconfig
index 33e15058d0dc7..8cd454ee20c0c 100644
--- a/drivers/fpga/Kconfig
+++ b/drivers/fpga/Kconfig
@@ -7,7 +7,7 @@ menuconfig FPGA
 	tristate "FPGA Configuration Framework"
 	help
 	  Say Y here if you want support for configuring FPGAs from the
-	  kernel.  The FPGA framework adds a FPGA manager class and FPGA
+	  kernel.  The FPGA framework adds an FPGA manager class and FPGA
 	  manager drivers.
 
 if FPGA
@@ -134,7 +134,7 @@ config FPGA_REGION
 	tristate "FPGA Region"
 	depends on FPGA_BRIDGE
 	help
-	  FPGA Region common code.  A FPGA Region controls a FPGA Manager
+	  FPGA Region common code.  An FPGA Region controls an FPGA Manager
 	  and the FPGA Bridges associated with either a reconfigurable
 	  region of an FPGA or a whole FPGA.
 
-- 
2.26.3

