Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C5B9649
	for <linux-staging@lists.linux.dev>; Fri,  8 Apr 2022 22:31:36 +0000 (UTC)
Received: by mail-ej1-f52.google.com with SMTP id k23so19939757ejd.3
        for <linux-staging@lists.linux.dev>; Fri, 08 Apr 2022 15:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIEuyIQOzr7GBajh+n+UsyE5Wi+bFa0QsRrOoLXPvQs=;
        b=oHP7fYwJCiexaqI8I+it/ifNdESNBhEUa2a5EkkGsFvbgoDOGdrPlE92AvQHwRpIDd
         /2zBlS69RK/2kPbk2Z1sP2bWuSWKvAozNmBOfX2WC0UxKS12GpP+PTgWuSNmznBMVCgh
         BTcggNlDq4v3L46zaP5NHvj7lpIIc7+FtoLFHX0+hfpcXogu6CwiWqwje49BvnLpMw49
         mrFS7+KNGpdlw6+9eibEvPSalKElKm5HsN1HkC8TVP1/E0kk7d0sc7fjwN0gWKvIiCIz
         cE7ktDUlnYWlsC9Bq54WCoZ/tskD+JFwd0njFZzQvQYrwD+R6pTKWEXHZX9SoloMJQMU
         i7TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MIEuyIQOzr7GBajh+n+UsyE5Wi+bFa0QsRrOoLXPvQs=;
        b=02I13sLZzGi1cDpLvrc17YvRjsxx+j1UIYHKkecFW+BsFReNfF6mU+bwWFUkRz5y8i
         THnG/BTLpy4pvMqDB8ThtL/UQVfkuovnZc5OBnVDr5gFO2mGR63bog5PJza5kDdAfzzb
         6HvzmeGhnq2whtPjzDeBmpVX+bX7yQ3yUatBGdRaRJeJRcSMHlIZyX1lpkIpybvtMPdb
         CeFjNS/COCBIj+oNDJ9XFNRwSbu3MNv6Q/5L7/gGXjLmZxYgTQao2jOmYEda/z3+A2NW
         7UaDIo93vyEDMP+z0LP/3WphQ3gCQCaZomR2jK+QaozDMQA98zIJzIJxjKvLeLD2r/xV
         3naQ==
X-Gm-Message-State: AOAM533zx1KQ1b5nwV10VNT418IDdIEgsx8zqooc1mzZr5TEXsrJK5qo
	AbPMyg79o3smBHcO3+TR04Y=
X-Google-Smtp-Source: ABdhPJwZHXUsf05CmofYgOWQixJUrHdRv1lrpE/Q183lJUyfC1JgwjV4k3etYG6TKy/yNZO0btD4Sw==
X-Received: by 2002:a17:907:7f8d:b0:6da:b3d6:a427 with SMTP id qk13-20020a1709077f8d00b006dab3d6a427mr19782384ejc.509.1649457094569;
        Fri, 08 Apr 2022 15:31:34 -0700 (PDT)
Received: from localhost.localdomain (host-87-4-4-217.retail.telecomitalia.it. [87.4.4.217])
        by smtp.gmail.com with ESMTPSA id m14-20020a056402510e00b0041d0c0942adsm2277425edd.52.2022.04.08.15.31.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Apr 2022 15:31:33 -0700 (PDT)
From: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Martiros Shakhzadyan <vrzh@vrzh.net>,
	Hans de Goede <hdegoede@redhat.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ira Weiny <ira.weiny@intel.com>
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: media: atomisp: Convert kmap() to kmap_local_page()
Date: Sat,  9 Apr 2022 00:31:29 +0200
Message-Id: <20220408223129.3844-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated in favor of kmap_local_page() where
it is feasible. With kmap_local_page(), the mapping is per thread, CPU
local and not globally visible.

load_and_flush_by_kmap() is a function where the use of kmap_local_page()
in place of kmap() is correctly suited.

Convert load_and_flush_by_kmap() from kmap() to kmap_local_page().

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index c1cda16f2dc0..6394385b6637 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -350,7 +350,7 @@ static int load_and_flush_by_kmap(ia_css_ptr virt, void *data,
 		idx = (virt - bo->start) >> PAGE_SHIFT;
 		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-		src = (char *)kmap(bo->page_obj[idx].page) + offset;
+		src = (char *)kmap_local_page(bo->page_obj[idx].page) + offset;
 
 		if ((bytes + offset) >= PAGE_SIZE) {
 			len = PAGE_SIZE - offset;
@@ -369,7 +369,7 @@ static int load_and_flush_by_kmap(ia_css_ptr virt, void *data,
 
 		clflush_cache_range(src, len);
 
-		kunmap(bo->page_obj[idx].page);
+		kunmap_local(src);
 	}
 
 	return 0;
-- 
2.34.1

