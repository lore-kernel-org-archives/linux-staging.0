Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E6928F9
	for <linux-staging@lists.linux.dev>; Thu,  7 Jul 2022 20:07:40 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id f2so22429543wrr.6
        for <linux-staging@lists.linux.dev>; Thu, 07 Jul 2022 13:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V2FS0wBh6E9v0AAYp9N7QfTmBvANd9d4CAwWxz+lUhw=;
        b=Ykw7pgymVxW4ylR5nKhiE1dhV2hoWH7nArSOhhTxP0I8M2oMRqYFWN/Jdym800AzKK
         1pmhrwNm6Hnn0lJwTmzL8lcc2UF3IYEKrCTGiM8MgAH6V2zkhcEPNDoBdu2/R2I/NeOg
         EQSCCqUuEsmmwqqVrLAbXDlmihtiuOw+NrAuDOjwkkXR49flD57a24twRCKBv+5ru6bU
         5VTIs7W95tfqXbZWLQwowaQmSw41uKzFPmHdikUUnvK+znE5Q3zXLJS7T6wS93LK9NGp
         CNlNsqbadEiNfPwLfQK7dJwvNZ9qk5xjCxheVSBKYOJhrpbD/ARCuP7unQOe2UHFuRix
         KONA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V2FS0wBh6E9v0AAYp9N7QfTmBvANd9d4CAwWxz+lUhw=;
        b=74cNsJTxI8Pf/JEoDGYguLczoIrk4PVpvlT1tjQxoERKM1Fi1tejPLlyO5Vsqd0V4n
         VxroBkrK+jXIsneAGB208dHO5OpOkZIGo/k9jD0ZpcY6726zuUZdoSB7LJcd9jsQNpgr
         rT+U3Pumcrf2GBw7gCydtwMKg/9CMq6JCCA654jhD6NmB0CNeBNt45l4Ey5KEcNKrhLr
         36agBEYn5BxUxzbyOs5OcRINvahbV8/Xzerb8QSZK2exPu0AsIP/J29Pnr5Z6DyCeb0n
         H+GXacGqhWViJbxArjG64JA201HpoGxJfi98kR5+6rMp4eQtjBpTLCxCyt9xbV7iXEnw
         a8QQ==
X-Gm-Message-State: AJIora9xqiQt6WsMGwtvnHOy22MKMwdofMRqbyIzyZsQV1wjYG8mw/bT
	fyi4BnXQUPlwWPaTkKEpCP0=
X-Google-Smtp-Source: AGRyM1ubdp0wk/SF4+PuVsdl1on/yZsAcXjLUt3BabHTAdSDH41RpBq7sOL1nlatyS0ikOB+cRm4aA==
X-Received: by 2002:a5d:440e:0:b0:21d:85ce:6b8e with SMTP id z14-20020a5d440e000000b0021d85ce6b8emr5281027wrq.248.1657224458493;
        Thu, 07 Jul 2022 13:07:38 -0700 (PDT)
Received: from localhost.localdomain (host-79-53-109-127.retail.telecomitalia.it. [79.53.109.127])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c3b9100b0039ee391a024sm25096752wms.14.2022.07.07.13.07.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Jul 2022 13:07:37 -0700 (PDT)
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
Subject: [RESEND PATCH 1/3] staging: media: atomisp: Convert kmap() to kmap_local_page()
Date: Thu,  7 Jul 2022 22:07:16 +0200
Message-Id: <20220707200718.26398-2-fmdefrancesco@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707200718.26398-1-fmdefrancesco@gmail.com>
References: <20220707200718.26398-1-fmdefrancesco@gmail.com>
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

Tested-by: Hans de Goede <hdegoede@redhat.com>
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
2.36.1

