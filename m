Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2AC26F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:18 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id z2so16833929wrl.5
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Sb/x5eCAizB46KySBUtITzSpr/0oDElSsgH4Uccv9oU=;
        b=AJ3sWtPUIHfVBd6oCCsqQRz6vjBTzKHsPcu8jOQLXZ8x512N6ZTUrjJKDr/i+AVsiZ
         ppKPb5oma55Fw5WI1CSzoNQM3/YoG2WJAdJl4coYWSY6tTLigk4/aE7P02VtTNGzmB+X
         sG/vwJpsBMGdyHXWF3xMVZpdnCYc4VeIe85U1gkRsjpsaUc2xeaRj1nNPLsm/cYwnsJL
         ooNyzrLdOgETBEjtiAz9e/cZzEOGm/jIF6q0coglfNwjhwZtNbBqz40QLHBEa2gUdzlj
         D1YwRcNtVxeOrsfRw+CV/YgZgw4Fd+DjdiqwHa+gY/thl03FZ/tkZufWJ79KSrkEUW6p
         8ugg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Sb/x5eCAizB46KySBUtITzSpr/0oDElSsgH4Uccv9oU=;
        b=XLs+UU2cWbsA9fXUyz+jJnUb1PvvyFBNcNQuLRG23/9Hs/3bO/Uz2HZfXcQv97M/da
         kIiRMh4jy6TUoXTxypMA4pblo66vDB7ZcamabZWduB21xHTqorVundruhVjCUluFn24/
         WGLsFskWmzxLtNu8X1h41oZ04ouWexlrypLL6Pm8fL/HjNXrkfYn9sPK0Fd2MLbiAOhI
         lSyg1CxlzR1u1MD3u34QQp35JcvpBcySL9UEgcJRd+MVzEIMYYKwBUG6ISqzI035arLC
         vgYzLWfkIWE/3W4OKKFH1o7vVCbc2rzWNIW3IABgvqDjM101HVgMprpkey7zijbxGdob
         oYrQ==
X-Gm-Message-State: AOAM5302f4y/FFbO148wCM26MU/I5IN3mLqt5Xq706fFydv6BaS0V3ND
	AoP09oVibTrLqId/zRK3xwE=
X-Google-Smtp-Source: ABdhPJy3Gqm8BCrzgixMLVMB4YtLUNdp8M5/0wGmz/eZsJs+S5Pin+8lF/YxW8o4zjZbZ4ArWehiSg==
X-Received: by 2002:a1c:7fd8:: with SMTP id a207mr15707180wmd.40.1616420237179;
        Mon, 22 Mar 2021 06:37:17 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:16 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 08/19] Staging: rtl8723bs: remove useless structs in hal_intf.h
Date: Mon, 22 Mar 2021 14:37:06 +0100
Message-Id: <20210322133717.17797-9-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/hal_intf.h:

	struct wowlan_ioctl_param

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_intf.h | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_intf.h b/drivers/staging/rtl8723bs/include/hal_intf.h
index 5cae87782059..3cd46a670e6d 100644
--- a/drivers/staging/rtl8723bs/include/hal_intf.h
+++ b/drivers/staging/rtl8723bs/include/hal_intf.h
@@ -288,14 +288,6 @@ enum wowlan_subcode {
 	WOWLAN_AP_DISABLE		= 13
 };
 
-struct wowlan_ioctl_param {
-	unsigned int subcode;
-	unsigned int subcode_value;
-	unsigned int wakeup_reason;
-	unsigned int len;
-	unsigned char pattern[0];
-};
-
 #define Rx_Pairwisekey			0x01
 #define Rx_GTK					0x02
 #define Rx_DisAssoc				0x04
-- 
2.30.2

