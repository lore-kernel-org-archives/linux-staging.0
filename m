Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70FC129CA
	for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 16:24:31 +0000 (UTC)
Received: by mail-pj1-f44.google.com with SMTP id kk10so10629121pjb.1
        for <linux-staging@lists.linux.dev>; Sun, 17 Oct 2021 09:24:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1U5j9dLuqOBD2+4+BKBb8CQd5hunvzKj7i4Lt7apL9A=;
        b=K7kXoKfBZKAXl56rAUCz+HsclXr3Q8hCSzG7VvUvLJAB86H4otCVhrXkAM+2BIz1Jh
         FtX/W9MZBfy7xxLO42J6mgTJa8I1ZPeiu7noxkXj2hzoTnzWRJ17egDSCRa356K8cgT1
         B6Yzjb3UEC+Spi60a3dzPGspCe3u7sFBgLLsb83CjlmhFaeX952oSLpAPnXvfuBbQZGA
         k09HHkKeJ2dNhHxn+wk5oWdDAoeMyg2rJ4ggvXQ0uvI9eTjRqpy6sDluiHZlr7JUokPK
         PT9wEnNJu8BSFBioZgGHTTgDywesMI85UHZHRw9VvsBfVYHij7Xa5F7Xm9dxnLV7Omf6
         4BFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1U5j9dLuqOBD2+4+BKBb8CQd5hunvzKj7i4Lt7apL9A=;
        b=DMRax1Pj4ZTw1WhFbZnS8llknmGjfWuNvuRNXBJaE8nfDOsYfNJkhkvumKuTKskqo+
         UpHUGxc/Nyd7DaRX8jnkhcjxNW0OFylVS6VSKtTggusiISdxnokHrHbGHfmhV6XXC/u2
         zIqBVZagAxcBgSMs5UmpDCDrCF9aQNZdF0JZs0T1xrsQ6Lh/60heTJL8DOj8Vf/mSz8E
         bIGjYO7EHuZLX1iIWslQEps3yHODRjuBMCBhpTETM5s2QkBxWcGhLwlLxwoLSYYFS8/y
         I+cfI9K9xg1ZRk+8HulJwDSHF6cBxqwlDBriDVrWPcICjfhtrkO5QSodI3Cyc0j0cV6t
         QwRA==
X-Gm-Message-State: AOAM53157iCm1sAeJ7moO7MVANKWEAFUBwUh/KMGwuS91n3PBC4iNutD
	kWbCdKha26nY6Vb2pxJeS1c=
X-Google-Smtp-Source: ABdhPJwYP4cXN9ce7vYJjv+MvPKGgTMKP1o3K0trlI5qpFlnqOxIVtad2urMHOqZ3gdbmRiUXMHL7A==
X-Received: by 2002:a17:90b:4f87:: with SMTP id qe7mr31400974pjb.29.1634487870876;
        Sun, 17 Oct 2021 09:24:30 -0700 (PDT)
Received: from sbwpb-arch.flets-east.jp ([2400:4052:6980:3800:dba7:2b1f:3f26:a5ec])
        by smtp.gmail.com with ESMTPSA id f30sm10814332pfq.142.2021.10.17.09.24.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Oct 2021 09:24:30 -0700 (PDT)
From: Tsuchiya Yuto <kitakar@gmail.com>
To: 
Cc: Hans de Goede <hdegoede@redhat.com>,
	Patrik Gfeller <patrik.gfeller@gmail.com>,
	Tsuchiya Yuto <kitakar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Dan Carpenter <dan.carpenter@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Kaixu Xia <kaixuxia@tencent.com>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [BUG/RFC PATCH 1/5] [BUG][RFC] media: atomisp: pci: assume run_mode is PREVIEW
Date: Mon, 18 Oct 2021 01:23:32 +0900
Message-Id: <20211017162337.44860-2-kitakar@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211017162337.44860-1-kitakar@gmail.com>
References: <20211017162337.44860-1-kitakar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is almost a BUG report with a patch to just make atomisp work
again with the current mainline kernel. Thus, prefixed with [BUG][RFC].

RFC:
  1. When looking at the `case CI_MODE_NONE:`, it tries to do something.
     So, it should rather work with CI_MODE_NONE, too? Just I don't know
     how to configure userspace apps to use CI_MODE_NONE ?
  2. How can we re-add the run mode support again without relying on
     the s_parm ?

>8-----------------------------------------------------------------8<

After the commit 8a7c5594c020 ("media: v4l2-ioctl: clear fields in s_parm")
added on v4.18 (backported to v4.9.182 and v4.14.127), the capture mode
flag is cleared (except for V4L2_MODE_HIGHQUALITY).

Due to this, it seems that now we can't use this flag to set atomisp
run_mode. This results in capture not working with the following message
(loaded atomisp driver with dbg_level=1):

	kern  :warn  : [ 3658.776616] ia_css_pipe_get_info: ia_css_stream_create needs to be called before ia_css_[stream/pipe]_get_info
	kern  :err   : [ 3658.776641] atomisp-isp2 0000:00:03.0: get_frame_info 1920x1080 (padded to 0)
	kern  :warn  : [ 3658.776666] atomisp-isp2 0000:00:03.0: Can't set format on ISP. Error -22

So, when we can't detect run mode from the s_parm capturemode
(CI_MODE_NONE), let's assume the run mode is PREVIEW.

Signed-off-by: Tsuchiya Yuto <kitakar@gmail.com>
---
 drivers/staging/media/atomisp/pci/atomisp_ioctl.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
index c8a625667e81..6fc64f0ccc31 100644
--- a/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
+++ b/drivers/staging/media/atomisp/pci/atomisp_ioctl.c
@@ -2638,7 +2638,11 @@ static int atomisp_s_parm(struct file *file, void *fh,
 				asd->high_speed_mode = true;
 		}
 
-		goto out;
+		dev_warn(isp->dev,
+			 "setting run_mode using s_parm capturemode is not supported anymore\n");
+		dev_warn(isp->dev, "assuming run_mode is PREVIEW\n");
+		mode = ATOMISP_RUN_MODE_PREVIEW;
+		break;
 	}
 	case CI_MODE_VIDEO:
 		mode = ATOMISP_RUN_MODE_VIDEO;
-- 
2.33.1

