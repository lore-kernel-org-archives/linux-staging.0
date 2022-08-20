Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94F812F5F
	for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 18:16:38 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id x21so9149678edd.3
        for <linux-staging@lists.linux.dev>; Sat, 20 Aug 2022 11:16:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=GkFSCmCmtCp/tSVKJ+Jm/lmW9Ahq2ZlSjrqLfNvUxFs=;
        b=X6IB1+8hZJ1jMHbhOTGVJktLBGjNSdr5Jmszn44QbM/Lmy9XnJCISYC6lb7G/Za6Lw
         4d7ZAHtnw0GZoa8BWnIixUpK+jYW9FBvLj4nUYVYaeO8sKXOc+SYoLa63ky8p0Y8BR5f
         Ecfj0mfhIsV8Pxrvzw6dbALHxxoPfmNfCTtS9h1MihyfmO0cyy+nWxf4hoa1pAfFsdLV
         TIIMO7VlWYlGvnFGUzzFjMs0N2PkhB62u/q55ikZAWoL434e4G3TW9gJIL95tBq9fc0m
         rjbtZ+NwsgO2CZTf+5RgFY1pirmQsuBO8rt64C+L/slS5iiNg9LMLjKicDYq+NVvu873
         UgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=GkFSCmCmtCp/tSVKJ+Jm/lmW9Ahq2ZlSjrqLfNvUxFs=;
        b=MPfTxmE5ZnIgTaDr5n+Usw4f+6GerJTcwA/RaQOV2jm2sY/CMSV/6ESyiXhruPjqYI
         sRrXr0RBOdVtNQELQEQwNz3QtQMQwgWcmcOBps3Um0oDAweepG+ggiEDBfuXikDgrujA
         /IkkAw/r2FnvQBImetb8GhHDrd3qo/qMfRhi9tmZS9KDj0Ie+Y4lQC4NpuM3hl2BqgxZ
         UyhLvBuCZxIJ4YKs15y34rujKN9xeVXeNuRvOhTIxAC7vTa7KIirXU7D/xeC+rRBWvAB
         AIJmZF3lNlLHrVY9UzBWjuVWiNr2pcxFv9pf0yHNNHtbzAzxQgrEmx8JpV6XwSYThkSM
         kxzQ==
X-Gm-Message-State: ACgBeo31ZEz2f6O6G9v8uGGZEsf13Jztzd5i8SV1k2N+9OzIDMAVJ+Yg
	Z3PkAa+Rs6aJ6D11TksYZEk=
X-Google-Smtp-Source: AA6agR5as52Vu9ai9fyg6MfnFuq4JB7GgBpqrwwZNS1CpH681S7teflIMGKbmIe06oWHmEIgY/b3Jg==
X-Received: by 2002:a05:6402:524c:b0:43e:aba4:a42d with SMTP id t12-20020a056402524c00b0043eaba4a42dmr10279216edd.328.1661019396951;
        Sat, 20 Aug 2022 11:16:36 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb77.dynamic.kabel-deutschland.de. [95.90.187.119])
        by smtp.gmail.com with ESMTPSA id g2-20020a17090604c200b0072af890f52dsm3887833eja.88.2022.08.20.11.16.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Aug 2022 11:16:36 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 01/19] staging: r8188eu: make rtw_remainder_len() static
Date: Sat, 20 Aug 2022 20:16:05 +0200
Message-Id: <20220820181623.12497-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220820181623.12497-1-straube.linux@gmail.com>
References: <20220820181623.12497-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The function rtw_remainder_len() is only used in xmit_linux.c.
Make it static.

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/include/xmit_osdep.h | 1 -
 drivers/staging/r8188eu/os_dep/xmit_linux.c  | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/staging/r8188eu/include/xmit_osdep.h b/drivers/staging/r8188eu/include/xmit_osdep.h
index 130dc06efe73..55347de455c8 100644
--- a/drivers/staging/r8188eu/include/xmit_osdep.h
+++ b/drivers/staging/r8188eu/include/xmit_osdep.h
@@ -37,7 +37,6 @@ int rtw_os_xmit_resource_alloc(struct adapter *padapter,
 void rtw_os_xmit_resource_free(struct adapter *padapter,
 			       struct xmit_buf *pxmitbuf, u32 free_sz);
 
-uint rtw_remainder_len(struct pkt_file *pfile);
 void _rtw_open_pktfile(struct sk_buff *pkt, struct pkt_file *pfile);
 uint _rtw_pktfile_read(struct pkt_file *pfile, u8 *rmem, uint rlen);
 
diff --git a/drivers/staging/r8188eu/os_dep/xmit_linux.c b/drivers/staging/r8188eu/os_dep/xmit_linux.c
index 85ef27735b88..33400a9b08e1 100644
--- a/drivers/staging/r8188eu/os_dep/xmit_linux.c
+++ b/drivers/staging/r8188eu/os_dep/xmit_linux.c
@@ -11,7 +11,7 @@
 #include "../include/osdep_intf.h"
 #include "../include/usb_osintf.h"
 
-uint rtw_remainder_len(struct pkt_file *pfile)
+static uint rtw_remainder_len(struct pkt_file *pfile)
 {
 	return pfile->buf_len - ((size_t)(pfile->cur_addr) -
 	       (size_t)(pfile->buf_start));
-- 
2.37.2

