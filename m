Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621146ADD
	for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 21:24:28 +0000 (UTC)
Received: by mail-ed1-f50.google.com with SMTP id m16so33396221edc.4
        for <linux-staging@lists.linux.dev>; Mon, 24 Oct 2022 14:24:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O4TfgwncnU/HwDrEet2mPSVCmyGRLpO7aAKR17oXTOM=;
        b=ZvCH3I055bsQxyZ2EFbe/WK0etuo4Ftc4KWHjKWllkkcQHDdtU9Wih+G9leYJphdlX
         Eqo72/eHiCAO9cKSri1OYJOUn7RxXYE8rqflcXWY5suZSedpJykeoNPQImJy9RNN7zF5
         jG0e+X9NHnXcyOZuXz0CMwmvzUSkQ7qWuAbk4bEIGCZk6nUsh4RJKCXjAY55hGqmPAib
         jc36hCrwkdajUgB6zbzmUgw728cGkuBMXe91Kurk5XmL5KvB5cGJ6jBlQJvp4RQVmVRC
         k5kucKtxMeIEd6E5Rc6hb/Y7ZV0/gatFY7c8jwDT+tg6kQalpdC6nsclVEeaxYVnOYKm
         vJIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=O4TfgwncnU/HwDrEet2mPSVCmyGRLpO7aAKR17oXTOM=;
        b=OMEGgJXL5nndZupegqYVqA6rS6CexdrOMnQE+fxlV9E/HUCrWHJBjAiP9RGPLmqzoa
         cvteFO+81qQO1w/orD33zrdotdz8WHZ162BIClSdFiRGRHIjeTx7k93GXvQ8qMSDnZ/c
         pii6TtBDldRme+nCatcXTPTGGQPtTJOFTb5o1gNEaWqXvp5GRPdRh9PO+RAW1h5tPAti
         NzIomvY34cRFVhBwb8K48d0u/MaU86vma3jawclcKDxZLHLyXn1nkragxAP9Ikd13HhF
         HixN9HwuKFiXQTtH6zbzTQ+OgrCK1u6KJyXKAyUyzyS6i2Wa7N/tC5ZAr38zhWbDx7ze
         fUOw==
X-Gm-Message-State: ACrzQf0ReENChbQLagjSLHsjF4hLl9YErdtGTvlkvXMGN7KvS2QjDDEj
	MfLmzep82CU5YdLQuAK4R2w=
X-Google-Smtp-Source: AMsMyM7VgT0h8faK9qer4AruU019XwyqUcMD+U0WYjbRMdtVTBL+cM4HSyxblSfwbMnnndIhUT9SEg==
X-Received: by 2002:a05:6402:40c7:b0:461:ecdb:1c41 with SMTP id z7-20020a05640240c700b00461ecdb1c41mr3511218edb.288.1666646666234;
        Mon, 24 Oct 2022 14:24:26 -0700 (PDT)
Received: from localhost.localdomain (ip-217-105-46-178.ip.prioritytelecom.net. [217.105.46.178])
        by smtp.gmail.com with ESMTPSA id r1-20020a1709061ba100b007a9c3831409sm379354ejg.137.2022.10.24.14.24.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 14:24:25 -0700 (PDT)
From: Nam Cao <namcaov@gmail.com>
To: Larry Finger <Larry.Finger@lwfinger.net>,
	Florian Schilhabel <florian.c.schilhabel@googlemail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: namcaov@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] staging: rtl8712: check for return value of _r8712_init_xmit_priv()
Date: Mon, 24 Oct 2022 23:24:08 +0200
Message-Id: <9314f33cc91f69d7d5c79912fe55136faca7927f.1666645510.git.namcaov@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1666645510.git.namcaov@gmail.com>
References: <cover.1666645510.git.namcaov@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The return value of _r8712_init_xmit_priv() is never checked and the driver
always continue execution as if all is well. This will cause problems
if, for example, buffers cannot be allocated and the driver continue and
use those buffers.

Check for return value of _r8712_init_xmit_priv() and return error (if any)
during probing.

Signed-off-by: Nam Cao <namcaov@gmail.com>
---
 drivers/staging/rtl8712/os_intfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/os_intfs.c b/drivers/staging/rtl8712/os_intfs.c
index 47d7d998fa86..ade57dd89eee 100644
--- a/drivers/staging/rtl8712/os_intfs.c
+++ b/drivers/staging/rtl8712/os_intfs.c
@@ -308,7 +308,9 @@ int r8712_init_drv_sw(struct _adapter *padapter)
 	ret = r8712_init_mlme_priv(padapter);
 	if (ret)
 		return ret;
-	_r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	ret = _r8712_init_xmit_priv(&padapter->xmitpriv, padapter);
+	if (ret)
+		return ret;
 	ret = _r8712_init_recv_priv(&padapter->recvpriv, padapter);
 		return ret;
 	memset((unsigned char *)&padapter->securitypriv, 0,
-- 
2.25.1

