Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [216.205.24.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A50B52FAD
	for <linux-staging@lists.linux.dev>; Tue,  8 Jun 2021 21:24:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1623187467;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sgq7YpZfI377cjTuKzZzdMcYM8vZyb+R30zx+84A9yI=;
	b=irpC19/2qQxbqZdApxZCVDqQE8sHLiOJ3Mwo+LHG3a+qgdAKKgYFyc+glvFXKRQa0R7Vae
	6Y0bQ1ix01a9/gUbxhVEF00HgTh6F49e74qkyX4QmJVZKY1oLehtsNY8jqAmBW3YKQeGw1
	km1HcetLWGjNB1SjcFeE6/QFvFvNhw8=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-WNcvlqPUMf6fMArcgKFRKQ-1; Tue, 08 Jun 2021 17:24:26 -0400
X-MC-Unique: WNcvlqPUMf6fMArcgKFRKQ-1
Received: by mail-ot1-f71.google.com with SMTP id y2-20020a0568301082b02903b5696f0a64so14809202oto.2
        for <linux-staging@lists.linux.dev>; Tue, 08 Jun 2021 14:24:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sgq7YpZfI377cjTuKzZzdMcYM8vZyb+R30zx+84A9yI=;
        b=ENXWue/qNObuOP7s0hBaPmz09+QfTMv2k519yqqNoFSgT1vZKZXoz/mLoIyfbiyNON
         i4jZ7IVsLRAAWeg83R2r1BBZDZUMUzdcfLriMgYkgX7O2/UgVNrLp+Fstn+bXZ1UGac6
         hNi2LBpDBrL0Ljor1+TzhzTBDHtGEz67JCOM3XKhYn3jSEP+Hc34v8zHJ4WxLhQfJRwY
         tUS1xeV3guttMQ4bo8Sjw/Ue4jasKtdqSBjYGJr/XRvMoDwX3PGn/V2N33PIiF8FxelI
         cKxr62eT0To76I2aZk0PziVU1wh28hPBViuGHKWRnizAbpnpS2T6G5BG7/n+UXUHyUt1
         XmYg==
X-Gm-Message-State: AOAM532UQSzp10NyfxQQlo+kMsfL3qP732DIQyf3bRM8azUbCJP4WTio
	zuHEewyFMCkItLz/1wLyrzHw716vrZAtia122dXyOo7rji98ouk5gUKnCUB5WmSJJKi3FewkKP7
	srOKJtgwaIRip2CX/eWuI/NNZHA==
X-Received: by 2002:aca:33d4:: with SMTP id z203mr4176772oiz.51.1623187465854;
        Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysr+C3bZgIQEZy/8wCr9Q5uLj3VqD8M6xSNa0dsASWBdlkV/63bU+lwSL+xyqD9OEYmwRjzg==
X-Received: by 2002:aca:33d4:: with SMTP id z203mr4176741oiz.51.1623187465720;
        Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
Received: from localhost.localdomain.com (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x199sm1954310oif.5.2021.06.08.14.24.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 14:24:25 -0700 (PDT)
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
Subject: [PATCH 10/11] fpga: stratix10-soc: change FPGA indirect article to an
Date: Tue,  8 Jun 2021 14:23:49 -0700
Message-Id: <20210608212350.3029742-12-trix@redhat.com>
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
 drivers/fpga/stratix10-soc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/fpga/stratix10-soc.c b/drivers/fpga/stratix10-soc.c
index 657a70c5fc996..2aeb53f8e9d0f 100644
--- a/drivers/fpga/stratix10-soc.c
+++ b/drivers/fpga/stratix10-soc.c
@@ -271,7 +271,7 @@ static int s10_send_buf(struct fpga_manager *mgr, const char *buf, size_t count)
 }
 
 /*
- * Send a FPGA image to privileged layers to write to the FPGA.  When done
+ * Send an FPGA image to privileged layers to write to the FPGA.  When done
  * sending, free all service layer buffers we allocated in write_init.
  */
 static int s10_ops_write(struct fpga_manager *mgr, const char *buf,
-- 
2.26.3

