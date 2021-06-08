Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A02A42FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187450;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
	b=A41xps87stm8oDX+VoC8dDAH4AXYMWbwlrhitDF5vY78W+YFrc6Gy48UeAFYwofWkvhgVC
	FcF7jNE3vJnucNHsq1OvH+y3ulrcdSt500hroI+M/g+R0SrdnPJnRLdZcyp+7R48V9xQCY
	a9T/WGwRF/jS+sHvS71aira9TO+rTRY=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-xyRqMX5YMequlwWX-FTwhw-1; Tue, 08 Jun 2021 17:24:07 -0400
X-MC-Unique: xyRqMX5YMequlwWX-FTwhw-1
Received: by mail-oo1-f72.google.com with SMTP id 3-20020a4a03030000b029024950bdb69dso9015600ooi.3
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/gBbRADva2K8JIEOGXkU5f6gFIRmDnT9Lnnhh5Tc3WE=;
        b=tth9VMpWQZHiWqqTdhgCY6oT02VWynAAiyV4hsdFt87/JSxNCHx1LZtgEM8EvSxwoe
         YkvW7ZQqwBqvuW8yChyC6+tOZXr3EDa5Qa+ZzS1q1HRSxeRBFAyk2xE+GN88EEGxqztM
         b1Udnl1hxYrLzZz+SnUME6GL7IvOabglnPrshf6ASXWJT5Qf2Su6gbH4n1k9DSRVHvMf
         uOrqfwr7FVsqz7HiOrph6Z8dwWczvxCbXwGvC4MAc78WchSKIgAxNRQpePZb9/zSa99I
         nYjAbJqaWtW+MoBo5Z/9+H5ERX6naZn1IIRP5lDgUqtYHRhIFWNm2chPygW90t1AXuc4
         rD4w==
X-Gm-Message-State: AOAM530wKTMyk4lTDsm5ka7elztB1hpMKu01TX3xkHUCGz9tuBumswE3
	PgSl5iQXgxsmGFG/xFIquiFATw3krmg8+j58wcFgHc3MoPPHVF3+dgDwn1aNotsmRFHlN4CNkR8
	f7kH+IIMYUWUCmiVGVm5OgcQcNA==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr586220oie.151.1623187446579;
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzRUvOvqRt0/CJtj2o0VyI4iVXsRLiR3szXaZyy3Js2xLbhN+wrCnNP4FBaFz2E4YlbUaXjZQ==
X-Received: by 2002:a05:6808:14e:: with SMTP id h14mr586213oie.151.1623187446440;
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:06 -0700 (PDT)
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
Subject: [PATCH 02/11] Documentation: fpga: dfl: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:41 -0700
Message-Id: <20210608212350.3029742-4-trix@redhat.com>
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
 Documentation/fpga/dfl.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/fpga/dfl.rst b/Documentation/fpga/dfl.rst
index ccc33f199df2a..ef9eec71f6f3a 100644
--- a/Documentation/fpga/dfl.rst
+++ b/Documentation/fpga/dfl.rst
@@ -57,7 +57,7 @@ FPGA Interface Unit (FIU) represents a standalone functional unit for the
 interface to FPGA, e.g. the FPGA Management Engine (FME) and Port (more
 descriptions on FME and Port in later sections).
 
-Accelerated Function Unit (AFU) represents a FPGA programmable region and
+Accelerated Function Unit (AFU) represents an FPGA programmable region and
 always connects to a FIU (e.g. a Port) as its child as illustrated above.
 
 Private Features represent sub features of the FIU and AFU. They could be
@@ -311,7 +311,7 @@ The driver organization in virtualization case is illustrated below:
              | PCI PF Device |            |          | PCI VF Device |
              +---------------+            |          +---------------+
 
-FPGA PCIe device driver is always loaded first once a FPGA PCIe PF or VF device
+FPGA PCIe device driver is always loaded first once an FPGA PCIe PF or VF device
 is detected. It:
 
 * Finishes enumeration on both FPGA PCIe PF and VF device using common
-- 
2.26.3

