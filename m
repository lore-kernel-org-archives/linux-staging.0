Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E25A32FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
	b=aACzDmZcLTPQdXwqDZOx80WKQujCqahmCB6mZTyFGYKdoynLH6+DhBxbeF0L9CXdyAiAzU
	ccK5XrlI5mik98Gm1VoKmLEQ2o8ORayvYG/kOaoMli6874sUXdLZezsXwLWe+owV7AMP2T
	TmcRMl0FpK1C3NzoANeCSiomzdLeRqk=
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-H4KPwhHeNWKZLfVqi2LjRA-1; Tue, 08 Jun 2021 17:24:28 -0400
X-MC-Unique: H4KPwhHeNWKZLfVqi2LjRA-1
Received: by mail-ot1-f72.google.com with SMTP id f7-20020a9d5e870000b02902f479dba730so14760104otl.21
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jeq8qRfoRfsbx4uL9oOz0deeKscRGraAzU6rnmI4bDk=;
        b=MQGeUBBHm/NgI3+cuEibWMsdopTSugmamuTlXiWMtHmEKIcFs+1UTSomeRqnl9xH8d
         YOSb/9MNZbQIeNMq2uWmK7hN03OA2kyU5AOalTHGtpkZWbaBlx7svYL6nuH5R2YHB3iz
         QGtG7vehrc24XF2HEKP8WX2O/WfRlbmHvrmtoqp1BzimJlI5q0BSO4Q87TU6Uoug8LRA
         vdKbeR0eyk/3LVjQWT61QeKXu5qQTLXmACBfBWSYZQvDhsWUe7ZC9I134rjhn/3V8KOX
         in/x/1eq2XvPsbgkatuRU1EQJ/5BRXZVUmqihGI8zVpe4jWENomO47lLG6lJ3qij1o6l
         uSFQ==
X-Gm-Message-State: AOAM532fp7J7SkRuYt2BPs0Yy6Mf2JpSqsQefIsrV/eMe8hkY5HUvNSH
	MRTJ1uLduMzrlSPMBrkokxVYf4PgNnjpHM1NR814eK7OacULVYxAFcDfvLW5XCWecA9EmMpHSCQ
	fElyAlrS5aVMBwpooXcwPQl3lgg==
X-Received: by 2002:a05:6830:1309:: with SMTP id p9mr12963275otq.209.1623187468231;
        Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxKsGI5o2pAZuxgtMx6UsQ5GpgFuru3G9QqB8VKcT3CwJSpYN5gRSP28hE4xYJAJAJCEsUFOQ==
X-Received: by 2002:a05:6830:1309:: with SMTP id p9mr12963250otq.209.1623187468089;
        Tue, 08 Jun 2021 14:24:28 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:27 -0700 (PDT)
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
Subject: [PATCH 11/11] staging: fpgaboot: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:50 -0700
Message-Id: <20210608212350.3029742-13-trix@redhat.com>
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
 drivers/staging/gs_fpgaboot/README | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gs_fpgaboot/README b/drivers/staging/gs_fpgaboot/README
index b85a76849fc4a..ec1235a21bcc1 100644
--- a/drivers/staging/gs_fpgaboot/README
+++ b/drivers/staging/gs_fpgaboot/README
@@ -39,7 +39,7 @@ TABLE OF CONTENTS.
 
 5. USE CASE (from a mailing list discussion with Greg)
 
-	a. As a FPGA development support tool,
+	a. As an FPGA development support tool,
 	During FPGA firmware development, you need to download a new FPGA
 	image frequently.
 	You would do that with a dedicated JTAG, which usually a limited
-- 
2.26.3

