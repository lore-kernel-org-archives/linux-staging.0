Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAAE36D0E
	for <linux-staging@lists.linux.dev>; Wed,  7 Apr 2021 07:57:34 +0000 (UTC)
Received: by mail-pl1-f179.google.com with SMTP id ay2so8929287plb.3
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 00:57:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:date:to:cc:subject:message-id:mime-version:content-disposition;
        bh=GyqCSJDTppuuFfpUrZ7k/G3TcyInJOqMzJqN1ipUF+4=;
        b=Yhg7XiEVh0NLRIwQs0dPjoCJ9Iy1xihWOS5sk8ACN3rBpTryEIcQXRwx5FHhnVulW4
         mqzX4gVlA2Ax6zuMF9nG1ySEKzZ1vpBApmJOuNYlNWOEcdIrXhjkWIb6rncZZYwuJsl2
         Xqpqhmw/EMERxT3b9NHEKZjwZ7gdptQuiuWIj7QlxIejY5/YaeWthEh13s06y9oxEPey
         WWmly4Ve9FF2vM3VS/GyKmy/bVMRRwKTqXZRdRKukjxzqkCyByPLVjsrsBwo7xDdF06W
         3TEpP33LFKm87imAyUmDjcixr4MpwMe/haJ9g8aKHaX5wnxALB2/HwUgETEZ1riTVP5X
         yuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:date:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=GyqCSJDTppuuFfpUrZ7k/G3TcyInJOqMzJqN1ipUF+4=;
        b=IaZnCp1iaiiSWqFTHMdXMBnhSpbulSQcyea+NGX+Fuzzpds7g6vGWwivSd/acgYNFw
         IIIxdnWTKTTGqYzvS6hMNaWrmo0hpdewBLUBHwtzwd62MRNTXIOknJc66LNB+9z9Eymw
         IQEt6O2K7+vMRPljiLKFlrTndXyTUp8ZCBD0bX+oapKw3CIw525slkC3M5R2H2axUWjr
         J7fJrH63p459krrXGuvt/iPrBOvmXth+33NXi1BoDLt1zOYtAgGDEtx2gYKcCsxVqbGu
         ymYDTTNw4ORmpLhD6OghO/ediCh2jBdwFjtLqnCJHXi+JVicRKO+usj9KzdxK2eDqu9j
         DvYw==
X-Gm-Message-State: AOAM5332oQlODlmE5MihlghlppwUnLohlayj6MFGv02cFuLFFK7JChU2
	aUiysvD/JJdhaEXb3C2wRhU=
X-Google-Smtp-Source: ABdhPJzOzelL7Q+K9uwVWCl7hVeBXE5KWlzZ2ypOPk5NUzEBggssb7Ct4A8LMJSQDXhUbJ6b3h9ZXw==
X-Received: by 2002:a17:90b:142:: with SMTP id em2mr2109427pjb.59.1617782254060;
        Wed, 07 Apr 2021 00:57:34 -0700 (PDT)
Received: from kali ([152.57.146.48])
        by smtp.gmail.com with ESMTPSA id n23sm4335230pgl.49.2021.04.07.00.57.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 00:57:33 -0700 (PDT)
From: Mitali Borkar <mitaliborkar810@gmail.com>
X-Google-Original-From: Mitali Borkar <mitaliborkar810@example.com>
Date: Wed, 7 Apr 2021 13:27:29 +0530
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8712: fix avoid CamelCase in xmit_osdep.h
Message-ID: <YG1l6QIKRMjqgPiD@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Fixed Check:Avoid CamelCase by renaming SetFilter to set_filter
Reported by checkpatch.

Signed-off-by: Mitali Borkar <mitaliborkar810@example.com>
---
 drivers/staging/rtl8712/xmit_osdep.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/xmit_osdep.h b/drivers/staging/rtl8712/xmit_osdep.h
index b76021b568f8..7ad2ac6f5ff0 100644
--- a/drivers/staging/rtl8712/xmit_osdep.h
+++ b/drivers/staging/rtl8712/xmit_osdep.h
@@ -35,7 +35,7 @@ struct xmit_frame;
 struct xmit_buf;
 
 int r8712_xmit_entry(_pkt *pkt, struct  net_device *pnetdev);
-void r8712_SetFilter(struct work_struct *work);
+void r8712_set_filter(struct work_struct *work);
 int r8712_xmit_resource_alloc(struct _adapter *padapter,
 			      struct xmit_buf *pxmitbuf);
 void r8712_xmit_resource_free(struct _adapter *padapter,
-- 
2.30.2

