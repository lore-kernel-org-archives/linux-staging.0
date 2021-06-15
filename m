Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E9036D0E
	for <linux-staging@lists.linux.dev>; Tue, 15 Jun 2021 00:15:59 +0000 (UTC)
Received: by mail-qk1-f178.google.com with SMTP id c9so13983802qkm.0
        for <linux-staging@lists.linux.dev>; Mon, 14 Jun 2021 17:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=philpotter-co-uk.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=oAhWvrf4MKxQa5lHti7TTDcFAj1qiXLJCSE80+4N8ZA=;
        b=PTTiabWgWcrGiWdJmgp9OxmJrzRvrBapVAoWHy/Rs2pXE965cDXAzcHCS+S9fs0NvU
         xGlYHkleDfMwfuwlYFH0N2NW22vvY9y+1NKTkAA+gb1iCpDFOb2w+zTZMHKhExU41UjS
         1bzsJJfFYvSnlp6PYzSon75CE7V8msM7IimjPd9m4DuhPXzn7957UkbmtpgCHAS4/Rwe
         8rQg32Q/o43bFo9kjpqPLX5kDQKdnUluCQwDDqVQ/9husJKhbMkZEsGBSPi0ex4PLU+p
         s29bXrzJ4tVUJa4Ac2aOrIjVFF5d8M1zH/aqlUTLA6Kw3vEmHPOvSqh57RLIIoeIMplO
         sarQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=oAhWvrf4MKxQa5lHti7TTDcFAj1qiXLJCSE80+4N8ZA=;
        b=SX8r/3mY7hEnxDIRdVvILz3frnIuaQ32Q11TxL5pnEfRcIDRINXRryZbJBQJwvJ5DT
         asAFrYOl5HwnkiA45C70zZVvuvp9tzesxPKJTZbnlsy3DlA+D39RxnPv42L51pGfF3E0
         wMPnCgmPfq+Uwov/874Lel4r6dOldGybsmRrx2m4hyNyJvaVIJsDpnxELaVs+3EkhA4G
         Iu1yRXRlQqAkr7FqvnxiCOorWgz/DEDKqKqzxxkoJN8CH5SspdsxiHJqlXoezqTJnPK8
         7irPk8dR/nO/ni6sNSM+0gU5a7F2TBdY7RLTYNISXXuFUik5ONOdnoKcedU9F5soBtqZ
         mqvw==
X-Gm-Message-State: AOAM532U0SBF5gCawrihQfyff5+Aaes4YBJDwAmA24QceTxORhn6Xr7y
	3xdcbCEdpWpAGZTIRn6uSgMTNg==
X-Google-Smtp-Source: ABdhPJyfespBzZJgJdHvPuUKVxuLSsOxM72g8ET5cbHPeAJ3elpkxqK+6Pvv549jNtvs+cN9uG1l6A==
X-Received: by 2002:a05:620a:1443:: with SMTP id i3mr18479386qkl.193.1623716158384;
        Mon, 14 Jun 2021 17:15:58 -0700 (PDT)
Received: from localhost.localdomain (5.d.e.a.c.b.a.1.5.0.9.4.d.7.7.d.0.a.1.e.e.d.f.d.0.b.8.0.1.0.0.2.ip6.arpa. [2001:8b0:dfde:e1a0:d77d:4905:1abc:aed5])
        by smtp.gmail.com with ESMTPSA id m199sm11244248qke.71.2021.06.14.17.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jun 2021 17:15:57 -0700 (PDT)
From: Phillip Potter <phil@philpotter.co.uk>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	dan.carpenter@oracle.com,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH 12/28] staging: rtl8188eu: remove all DBG_88E calls from os_dep/usb_intf.c
Date: Tue, 15 Jun 2021 01:14:51 +0100
Message-Id: <20210615001507.1171-13-phil@philpotter.co.uk>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210615001507.1171-1-phil@philpotter.co.uk>
References: <20210615001507.1171-1-phil@philpotter.co.uk>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove all DBG_88E calls from os_dep/usb_intf.c as this macro is
unnecessary, and many of these calls are dubious in terms of necessity.
Removing all calls will ultimately allow the removal of the macro
itself.

Signed-off-by: Phillip Potter <phil@philpotter.co.uk>
---
 drivers/staging/rtl8188eu/os_dep/usb_intf.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8188eu/os_dep/usb_intf.c b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
index 3a970d67aa8c..5ca54dc36fa9 100644
--- a/drivers/staging/rtl8188eu/os_dep/usb_intf.c
+++ b/drivers/staging/rtl8188eu/os_dep/usb_intf.c
@@ -351,7 +351,6 @@ static int rtw_usb_if1_init(struct usb_interface *pusb_intf)
 
 	padapter->HalData = kzalloc(sizeof(struct hal_data_8188e), GFP_KERNEL);
 	if (!padapter->HalData) {
-		DBG_88E("Failed to allocate memory for HAL data\n");
 		err = -ENOMEM;
 		goto free_adapter;
 	}
-- 
2.30.2

