Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E199370
	for <linux-staging@lists.linux.dev>; Thu,  8 Apr 2021 02:58:35 +0000 (UTC)
Received: by mail-pj1-f53.google.com with SMTP id z22-20020a17090a0156b029014d4056663fso567022pje.0
        for <linux-staging@lists.linux.dev>; Wed, 07 Apr 2021 19:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
        bh=uj9M9j69MmEK6kxoKurva3J2kTnrLS58UJHTZwQEUnA=;
        b=Bx6bE9HUW6Kdju/XBIi8ukVkfQPBPAs+KrxrFXSP7TqqqntvXMuNNj6ey3fyvwVS+z
         wE5V65H7X8fKXwSEJwWpJ78XncP3VREp9WQUzqzg6uFOECvRQpq3WXNbn5c6klOGgHpE
         rWAGCku9Ag9BQ/0kMYzQPCqg80kT0sil+Uz/1gFWOv9/KsrK3EUBbjayXWikU1PcO28/
         wPbRvIGXFXmGvMvUD9jIki9XbzxWdwua06DhoyP646fipK24d9lCxhFXcWP0oLri2VSj
         CTqi0CMar8RxnVDUL0Ix4XPyvi7UdBw3TtVhbDWWNNila/WXa6srTZZb+8ZDch+au9VD
         qoww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition;
        bh=uj9M9j69MmEK6kxoKurva3J2kTnrLS58UJHTZwQEUnA=;
        b=RCPBYeon/QfCqkQkq82r/rPyPjQVuPqpCikS8PxO/jNkWv4wzBvJIPVSR+o10KkT+a
         s4nU4c5FbQylKCgem6EpyqU0W//tQBbq7g4XsuST1nnoqeV2v7PSr1lAgyQCbOi6cFyi
         5fWYnhZyuc7ykXf9717g+vtiGeI6CknC7DhKyRoCBRZpeVZUQ79Ng62qdAeESUUxzDup
         ms02It/gYymyLpxnUchm2TtfYQJxkJwG6hDTkGPGFb82xIayhSzE3M2i3auPTenEW6cq
         hY1FwBHR7HYirx1nKxPKKcrhrr3VMsvCx7fE7ZdW0OHxKhCwKf1JQTCiv2yXLS4u5gfM
         pX1w==
X-Gm-Message-State: AOAM530h5WOSRDKFLLGxOxOiDEQo4hUAuFHbj5BEeTQMUM4ICqg3Lu/g
	NFlPTK2+1L52jBP8T99l1ns=
X-Google-Smtp-Source: ABdhPJyMn9ffLLVpX2XMegNd0jtX8WAJrpZzXiWyMO9kWVowkD5YmryUoDNUqTUyknQ9kccWJE8YQA==
X-Received: by 2002:a17:90b:e18:: with SMTP id ge24mr6297133pjb.199.1617850715204;
        Wed, 07 Apr 2021 19:58:35 -0700 (PDT)
Received: from kali ([152.57.40.190])
        by smtp.gmail.com with ESMTPSA id b24sm22454613pgj.58.2021.04.07.19.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Apr 2021 19:58:34 -0700 (PDT)
Date: Thu, 8 Apr 2021 08:28:31 +0530
From: Mitali Borkar <mitaliborkar810@gmail.com>
To: Larry.Finger@lwfinger.net, florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, linux-kenel@vger.kernel.org,
	outreachy-kernel@googlegroups.com, mitali_s@me.iitr.ac.in
Subject: [PATCH] staging: rtl8712: matched alignment with open parenthesis
Message-ID: <YG5xV5q7ODTUTVK/@kali>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Aligned arguments with open parenthesis to meet linux kernel coding
style
Reported by checkpatch

Signed-off-by: Mitali Borkar <mitaliborkar810@gmail.com>
---
 drivers/staging/rtl8712/usb_ops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rtl8712/usb_ops.h b/drivers/staging/rtl8712/usb_ops.h
index d62975447d29..7a6b619b73fa 100644
--- a/drivers/staging/rtl8712/usb_ops.h
+++ b/drivers/staging/rtl8712/usb_ops.h
@@ -21,9 +21,9 @@
 void r8712_usb_write_mem(struct intf_hdl *pintfhdl, u32 addr,
 			 u32 cnt, u8 *wmem);
 u32 r8712_usb_write_port(struct intf_hdl *pintfhdl, u32 addr,
-			  u32 cnt, u8 *wmem);
+			 u32 cnt, u8 *wmem);
 u32 r8712_usb_read_port(struct intf_hdl *pintfhdl, u32 addr,
-			 u32 cnt, u8 *rmem);
+			u32 cnt, u8 *rmem);
 void r8712_usb_set_intf_option(u32 *poption);
 void r8712_usb_set_intf_funs(struct intf_hdl *pintf_hdl);
 uint r8712_usb_init_intf_priv(struct intf_priv *pintfpriv);
@@ -32,7 +32,7 @@ void r8712_usb_set_intf_ops(struct _io_ops *pops);
 void r8712_usb_read_port_cancel(struct _adapter *padapter);
 void r8712_usb_write_port_cancel(struct _adapter *padapter);
 int r8712_usbctrl_vendorreq(struct intf_priv *pintfpriv, u8 request, u16 value,
-		      u16 index, void *pdata, u16 len, u8 requesttype);
+			    u16 index, void *pdata, u16 len, u8 requesttype);
 
 #endif
 
-- 
2.30.2

