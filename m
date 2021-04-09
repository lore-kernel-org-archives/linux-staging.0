Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 203CC6D0E
	for <linux-staging@lists.linux.dev>; Fri,  9 Apr 2021 10:02:02 +0000 (UTC)
Received: by mail-ej1-f54.google.com with SMTP id a7so7763149eju.1
        for <linux-staging@lists.linux.dev>; Fri, 09 Apr 2021 03:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=g5fH5MF8Mh/cdom53aeKYjv6Ynby/OWeuuO+jFx6DpI=;
        b=q60mapN4fJd9Pmbhf0k9KGgtMsKHpTz2t5ajYkALWBibGJUdD7BCTNpq8c18qiEynH
         w+J7XwFXdsndH7Ayy0mfY8xyu3TplReHLRKUUqK5/AD9+fVdiQVFSR4KBr+eiwBbVD2n
         skoCqnlm0+I/4hXEw0WNUZLy+E8gl/TNsywuShk8Mj8n+WYrTN7U0iUJd0yJoO/YW0vm
         sSOgFuqoOpgAJ6ZQxn9xGpXZLzAeGcuCYOnv5qfiCujFhrIelc8WnQtIOD3bsOzlnhcH
         N1v5sYQlYE714XeahYBjHqhbC92rk4A1okNwZGtGes9sCozNi0M2gDmTCTWdFbQ6oJka
         OOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=g5fH5MF8Mh/cdom53aeKYjv6Ynby/OWeuuO+jFx6DpI=;
        b=ULNTIIJXAH2L3cO/DDyqTXToH1hl7UUwUyMPPhmgPXHxdlLuNxToKiK0zSaMLAV+vH
         dBLepvj2u9a8rsipUHsR+WuJ87m65TuYwJqGJO93tgfKMAbHI5RMQYaJEFnK7u7K+91a
         6VeJAzp8Pa4othE6Z6jtatw9tqcMkOKq8thcQLlHxm4ix1jcE1IGku4otFSchrRQHQGx
         Z/b1o3zcoDlH+Fcgh333MeoFRWe1P3654VNLcNJTS4EbmLRYLGNyamHVbdXZYvEs5rn+
         r3+X9ill2DZeYcJ8od3CATFqEVPBqSL2elXO2RJH6RvzXoQb5n9WKtE6m/9wzRGvuWnr
         Rp6A==
X-Gm-Message-State: AOAM5316VLNVEvwbmfCtfC1PyA8fpP1lsz1KKmgqRwQAilOzDW646m7B
	vZKgrJrOelxz5RHxZEW/T+A=
X-Google-Smtp-Source: ABdhPJxHLRn1GnLyWTZlMJAJO7Xb2HrKjS4S/VwhUsswIruhrzreobdYhw3LFNXS3gDgbkNgVc9YnQ==
X-Received: by 2002:a17:906:b296:: with SMTP id q22mr15272496ejz.161.1617962520751;
        Fri, 09 Apr 2021 03:02:00 -0700 (PDT)
Received: from agape ([5.171.72.173])
        by smtp.gmail.com with ESMTPSA id bq18sm974563ejb.27.2021.04.09.03.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 03:02:00 -0700 (PDT)
From: Fabio Aiuto <fabioaiuto83@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Fabio Aiuto <fabioaiuto83@gmail.com>
Subject: [PATCH 08/11] staging: rtl8723bs: remove unused pmlmepriv variable in rtw_dbg_port() in os_dep/ioctl_linux.c
Date: Fri,  9 Apr 2021 12:01:36 +0200
Message-Id: <e8a31937b0075162104347e1c8ecc5e6d079f6d2.1617962215.git.fabioaiuto83@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1617962215.git.fabioaiuto83@gmail.com>
References: <cover.1617962215.git.fabioaiuto83@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

remove unused variable. Fix W=1 compiler warning:

drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:
In function ‘rtw_dbg_port’:
drivers/staging/rtl8723bs/os_dep/ioctl_linux.c:2444:20:
warning: unused variable ‘pmlmepriv’ [-Wunused-variable]
  struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);

Signed-off-by: Fabio Aiuto <fabioaiuto83@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/ioctl_linux.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
index 2f215e5e28b0..0ff6fbbb4e4f 100644
--- a/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
+++ b/drivers/staging/rtl8723bs/os_dep/ioctl_linux.c
@@ -2441,7 +2441,6 @@ static int rtw_dbg_port(struct net_device *dev,
 	u16 arg;
 	u32 extra_arg, *pdata, val32;
 	struct adapter *padapter = rtw_netdev_priv(dev);
-	struct mlme_priv *pmlmepriv = &(padapter->mlmepriv);
 	struct mlme_ext_priv *pmlmeext = &padapter->mlmeextpriv;
 	struct mlme_ext_info *pmlmeinfo = &(pmlmeext->mlmext_info);
 
-- 
2.20.1

