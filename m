Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F15372
	for <linux-staging@lists.linux.dev>; Tue, 13 Apr 2021 05:15:36 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso8393039pje.0
        for <linux-staging@lists.linux.dev>; Mon, 12 Apr 2021 22:15:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=8FKIyfvJimu5n8dTNB4u4e/nO7qNHfn5pyDyp+5wO5A=;
        b=kwYX7mZ+06IgOFbOJmfyFCBrXT2iZis2iKlsVKmQ6TObfXOKlWf748R2KuJuKBe5wQ
         ZDTAW071raQSQESs/qsmvuwWJA3eMJqOpb2TrREPQjrFuCK3bNyyGyMjFdC5DzeDoopm
         9sKCaMc3O2nkzTFh4YI7AP4seaBiWroGsu72AyIafrceegqRLu7jfwTbUuUpsboFm+1C
         dnXytEElZVTt7Ow2SVVw0BBy1F3NLJZvWW73JGjX9VXyY4NcSecXOHEXeFbYd3NkdMbo
         N9L2tiGy3UqxaekwntF0tQTeDB+Ne7kRcpV5iIh+3PSuoInAfzKpHdy83cYIhvE1k+l0
         AxnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8FKIyfvJimu5n8dTNB4u4e/nO7qNHfn5pyDyp+5wO5A=;
        b=O5vXcIrxrx3K4DAzPyjIlcaFxO0CFY9dVLIWgJ7G2uNdIUG8qTAxySd/Lc114iVbX0
         jIdu+zJyQCy6MXAKUUGSC4wS3Fzqo891BWdC2d4CgI0EixoodDId0903xMdzMHy1KZ4v
         SA8eF3BW6SyfdiLSc6EfBizgYUkEGcBZoryHKjZENrxBzHElklr10l2RDs6o9RkUFmcj
         7NHAeeCM83l+w0xIkf62IDsn96VulscoIPIVq/nVL3T0XB/+O4sUgZ1y6xDOrDQz6tvK
         1+BYI8wAv07jO0Nr3QtvOTT2bhtF4Yxf2txIsDytz96p4ss0EnZCPQYc1Rn7kK1lztE3
         uFeQ==
X-Gm-Message-State: AOAM533//AJFkjIBkHAJ/W6Wp+s5VPCphYudb5T33N3obO/SuzKUSWKK
	yE6hZN44NPWxv8bcILT/iME=
X-Google-Smtp-Source: ABdhPJyDeXeO03Ru03OrC3kdsY22Ij81nz1iwwYpXoeNA401PfROWPVyPNTRCmz59DtX7J4qXiaIpw==
X-Received: by 2002:a17:90b:1e01:: with SMTP id pg1mr2956908pjb.156.1618290935759;
        Mon, 12 Apr 2021 22:15:35 -0700 (PDT)
Received: from kali ([103.141.87.254])
        by smtp.gmail.com with ESMTPSA id v1sm960182pjt.1.2021.04.12.22.15.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Apr 2021 22:15:35 -0700 (PDT)
Date: Tue, 13 Apr 2021 10:45:29 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: sakari.ailus@linux.intel.com, bingbu.cao@intel.com,
	tian.shu.qiu@intel.com, mchehab@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org, outreachy-kernel@googlegroups.com,
	mitali_s@me.iitr.ac.in
Subject: [PATCH v2 1/4] staging: media: intel-ipu3: remove unnecessary blank
 line
Message-ID: <79b543d96fa0bd613090984b98c5665344b4dddf.1618289130.git.mitaliborkar810@gmail.com>
References: <cover.1618289130.git.mitaliborkar810@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1618289130.git.mitaliborkar810@gmail.com>

Removed an unnecessary blank line to meet linux kernel coding style.
Reported by checkpatch.pl

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---

Changes from v1:- No changes. 

 drivers/staging/media/ipu3/include/intel-ipu3.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/media/ipu3/include/intel-ipu3.h b/drivers/staging/media/ipu3/include/intel-ipu3.h
index d95ca9ebfafb..335522e7fc08 100644
--- a/drivers/staging/media/ipu3/include/intel-ipu3.h
+++ b/drivers/staging/media/ipu3/include/intel-ipu3.h
@@ -75,7 +75,6 @@ struct ipu3_uapi_grid_config {
 	(IPU3_UAPI_AWB_MAX_SETS * \
 	 (IPU3_UAPI_AWB_SET_SIZE + IPU3_UAPI_AWB_SPARE_FOR_BUBBLES))
 
-
 /**
  * struct ipu3_uapi_awb_raw_buffer - AWB raw buffer
  *
-- 
2.30.2

