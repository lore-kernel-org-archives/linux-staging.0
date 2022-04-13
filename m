Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC9A23A6;
	Wed, 13 Apr 2022 22:55:41 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id s25so3736816edi.13;
        Wed, 13 Apr 2022 15:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyvjfLWBF83ldDk4yCXAC9aBU6w05cT1GCfa/ITsV5M=;
        b=GjAUZCsq0IIScVS5wpaNnTUGNYz/WuHRVFd6BTprSefXbiclMpphZ0PhN5kV6LbNDI
         e8vvBo2rYCY/sWrOpBAfTQrweOIm10DKQ3FSrHKa4IZUt1HE2PJNcw4IqFnmc+hUlcbn
         LGv5jlv9pMKQu+giZ7qc2yfQBGKv/56qHblvcm82VJ5cQtU8wUT5iRda/IpsgEIC7Omf
         XDSyVq5MHmhOB6I/e31vLizL+mvVTwIKy93HbDMi8YFyD9J/xpfLsVIfrCiM8y3qs930
         Rslk+o0wWO40dKhtbZC9LxjiWu29lRIQOSg8DHJwDgnnuVYFOG1LJuXZbbDad86kYAOR
         bVhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=dyvjfLWBF83ldDk4yCXAC9aBU6w05cT1GCfa/ITsV5M=;
        b=sveuC+P1qH5h49HyFoxhqrOuKd4KhQYciaQ2xRkva7ho18o0XUNuIhC+CKJ/SWTicp
         27r1ai/fIw0xPrIDJhb1/3K+eLJtwtPOqimv69eLx0LlltHTU0Hrxv/fsEDiai5ZfuoG
         gboWH6HzZw3KQpUDZU6qEs4OoBz+aPCtVsh7MiBi5OKY419gIR7XBYtsw7AMqARGrbYN
         XySa/g6kdYq1cEbUYU+16ZjFYDyjbO0sw+2ifyAwwH+o2x8qSY3gKLqanhaaA6GmbF7E
         Y+/CjwYaZiaHaN8QnvUQGH18iWCIpL+I5A1MF1atuvqoW2TV/nBrHw6+IIQM8KjBmUPV
         20SA==
X-Gm-Message-State: AOAM5316mZ1jVGEDmqSdkYfc9gNufQ7052hKNri3IBKRGk6uvxNwaIoT
	BL1TwCll6pr98hNBQZDf58M=
X-Google-Smtp-Source: ABdhPJwUF1oJQj2/lXqKcrWMbBCNj86N9kaBYLDVYEjlque7ZruiFwrT8oH+sfxef6CI03oAKpYTwg==
X-Received: by 2002:a05:6402:d0e:b0:413:3d99:f2d6 with SMTP id eb14-20020a0564020d0e00b004133d99f2d6mr1056662edb.189.1649890539778;
        Wed, 13 Apr 2022 15:55:39 -0700 (PDT)
Received: from localhost.localdomain (host-79-43-11-75.retail.telecomitalia.it. [79.43.11.75])
        by smtp.gmail.com with ESMTPSA id do8-20020a170906c10800b006dfe4d1edc6sm78329ejc.61.2022.04.13.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Apr 2022 15:55:38 -0700 (PDT)
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
	Ira Weiny <ira.weiny@intel.com>,
	outreachy@lists.linux.dev
Cc: "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
Subject: [PATCH] staging: media: atomisp: Use kmap_local_page() in hmm_store()
Date: Thu, 14 Apr 2022 00:55:31 +0200
Message-Id: <20220413225531.9425-1-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The use of kmap() is being deprecated in favor of kmap_local_page()
where it is feasible. The same is true for kmap_atomic().

In file pci/hmm/hmm.c, function hmm_store() test if we are in atomic
context and, if so, it calls kmap_atomic(), if not, it calls kmap().

First of all, in_atomic() shouldn't be used in drivers. This macro
cannot always detect atomic context; in particular, it cannot know
about held spinlocks in non-preemptible kernels.

Notwithstanding what it is said above, this code doesn't need to care
whether or not it is executing in atomic context. It can simply use
kmap_local_page() / kunmap_local() that can instead do the mapping /
unmapping regardless of the context.

With kmap_local_page(), the mapping is per thread, CPU local and not
globally visible. Therefore, hmm_store()() is a function where the use
of kmap_local_page() in place of both kmap() and kmap_atomic() is
correctly suited.

Convert the calls of kmap() / kunmap() and kmap_atomic() /
kunmap_atomic() to kmap_local_page() / kunmap_local() and drop the
unnecessary tests which test if the code is in atomic context.

Signed-off-by: Fabio M. De Francesco <fmdefrancesco@gmail.com>
---
 drivers/staging/media/atomisp/pci/hmm/hmm.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index 46ac082cd3f1..54188197c3dc 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -482,10 +482,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 		idx = (virt - bo->start) >> PAGE_SHIFT;
 		offset = (virt - bo->start) - (idx << PAGE_SHIFT);
 
-		if (in_atomic())
-			des = (char *)kmap_atomic(bo->page_obj[idx].page);
-		else
-			des = (char *)kmap(bo->page_obj[idx].page);
+		des = (char *)kmap_local_page(bo->page_obj[idx].page);
 
 		if (!des) {
 			dev_err(atomisp_dev,
@@ -512,14 +509,7 @@ int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 
 		clflush_cache_range(des, len);
 
-		if (in_atomic())
-			/*
-			 * Note: kunmap_atomic requires return addr from
-			 * kmap_atomic, not the page. See linux/highmem.h
-			 */
-			kunmap_atomic(des - offset);
-		else
-			kunmap(bo->page_obj[idx].page);
+		kunmap_local(des);
 	}
 
 	return 0;
-- 
2.34.1

