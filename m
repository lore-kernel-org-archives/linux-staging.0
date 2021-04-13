Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E3E970
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 15:29:24 +0000 (UTC)
Received: by mail-pj1-f50.google.com with SMTP id cu16so6650745pjb.4
        for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=p944sU1HlsGK+JAM7pfhxbxu763gDyxFzptVVENEtWM=;
        b=MYJ+RCjmhTgTQSRLqy50VLuGxZjkC35EJmvzA+8K08hZVM+Nt90l2NgkOIYRROoPwC
         2+eMwcbDyVOAyYW0cY2KxoCEQJHb5jtqbQtIA+5lC4M84Qnvx+c+BJN2QXGX0PpERSl6
         J4WhRIZCEodU4A8gMeFzAidKEkZ/xO07aS/kVE6MJh6Plv0IDHqFsiIj+nIHdsj/Fa4C
         tctzypyDmW1tTIQkWJgwzPEFyTXI8VUnzoL1Z0yW3gLvmGat8a9DhLv9MW8VM5EYY5oW
         Qj49syhLGZBR7tbSbphWNBlKc4azgXvVNQVMBYnmV01uHQVPcls/dVUd05NGTGQUTtdr
         c8Mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p944sU1HlsGK+JAM7pfhxbxu763gDyxFzptVVENEtWM=;
        b=PRn0OmhkO/qFcveiBC2vXzEFiMHHbLPgVXfDrN+Qgbw7sqZ+1xf+88eGNS4yt/j1VI
         m0avYOkGrhkoem6V9Fkoe4gIp1QLDXfWd2jheN4mpFZuoRLEHIvgh1bW33iar4GNpqNf
         cRlS3ORCZoyorI2j28WNrOmD69wMls98iLL+TU5B9C6nDuV8ypQ/o/xQ/8rcxwX9DSx1
         F8l8CXqB5rwXjwZmD/j5VZeQyeSoHGuIFNs6Bu3alEIT7J8xP8D4SRbzk2bQBeLAE/a7
         wQWddJZaNd/IPa1FdAT6Ir29fNnyLx1r9geaetml81mXrq73w+PNTgVci3olYATq9bTi
         H0qA==
X-Gm-Message-State: AOAM530rAF8M3cI3eYQt2Te1kJ1MblVJ94br/vSWgnTXmFt1QoV73Uxp
	OAJshK6+28QVnLwf8M0uURg=
X-Google-Smtp-Source: ABdhPJy3WjgZIQXfFPzsU2gloxkhTp2yAA+RHLcvoLytUtD73gmOfDgmA42lLYZnUdVg6nybjhO9zg==
X-Received: by 2002:a17:902:e8c1:b029:e9:3c98:2dd2 with SMTP id v1-20020a170902e8c1b02900e93c982dd2mr32793993plg.17.1618327763995;
        Tue, 13 Apr 2021 08:29:23 -0700 (PDT)
Received: from kali ([103.141.87.253])
        by smtp.gmail.com with ESMTPSA id r10sm2852104pjf.5.2021.04.13.08.29.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Apr 2021 08:29:23 -0700 (PDT)
Date: Tue, 13 Apr 2021 20:59:17 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v3 3/4] staging: media: intel-ipu3: line should not end with
 '['
Message-ID: <dcd55cb415194a5e0246b0103e791d9684de03f0.1618326535.git.mitaliborkar810@gmail.com>
References: <cover.1618326535.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618326535.git.mitaliborkar810@gmail.com>

Fixed the issue of line should not end with '[' by moving argument
from next line to line ending with '[' and made it under 80
characters.
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
Changes from v2:- No changes
Changes from v1:- Made line length under 80 characters

 drivers/staging/media/ipu3/include/intel-ipu3.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index eb21cbc63af6..47e98979683c 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -247,8 +247,8 @@ struct ipu3_uapi_ae_ccm {
  */
 struct ipu3_uapi_ae_config {
 	struct ipu3_uapi_ae_grid_config grid_cfg __attribute__((aligned(32)));
-	struct ipu3_uapi_ae_weight_elem weights[
-			IPU3_UAPI_AE_WEIGHTS] __attribute__((aligned(32)));
+	struct ipu3_uapi_ae_weight_elem weights[IPU3_UAPI_AE_WEIGHTS]
+						__attribute__((aligned(32)));
 	struct ipu3_uapi_ae_ccm ae_ccm __attribute__((aligned(32)));
 } __packed;
 
-- 
2.30.2

