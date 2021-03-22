Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6BA5F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:25 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id x13so16819642wrs.9
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5EDFSTkTgKN5EwgHCxDWDJZGP4DVQONUfiu+jdB10wA=;
        b=qjqv4aqHyhKd3SwAsImgeFjk4/pjXt48HN2olaI1TyVcCPdRqtCElPskTdzXk2OOZ5
         0PvOB/YFVyIkw0spHsVlq9ggA1nqWqr3+TRqo+4OI1baG27w6UcHVwRokYucqQW0FDAC
         TnX9q7OfmXP3UQYYaclXtjde3QUIavL69VgkduvUdPVWXXOabSqJ+eyKCRpZPuFJE/lY
         kbtXTkCJgWOqNBvd5Z2UuspJMBnXXnOCFcJ+mVd9Li/LiNS0IFsKisSgBdpcNJQx0/XQ
         SLR7YW8vQyZunfyBXxz93CVOwK+F7fZIcpLNsbug7L7j6SYjZRLag6nIvYiC4yT3iYxl
         apjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5EDFSTkTgKN5EwgHCxDWDJZGP4DVQONUfiu+jdB10wA=;
        b=e19J3KYnRaFBqPrxiYJvLbk7QJo0WzgyKTEBn29Vp835q1bjKIAuhho8425pJh4ULj
         X1zHPMQtJnKQFItyNxLURK7/WINghykzat5qwkN23mDm7SVqwb6anmZrHQigrSn+i+gD
         /YGXGZnbvhvehkjzAWL/0oFa+bbEbeKQniEuA9a0Z1CTENJt0fdg5Qin3CpL89pZzKkl
         O5VXNIt4cLJT5P7xSmR0AzmnUOMou4VEehZfyBgKZ4OPmvFpdH5DRCCGb1+zFmpw4Rop
         FDcJTAdVua+YaXtS2t/x8hPwK9c0Q/3jURaHdw2u1VJRmhvutIPV6zkulEKHmmS8+4S+
         3Jhw==
X-Gm-Message-State: AOAM530dujf48Gykm3UALG7+TfjH69FH86jA6Ol3eTPdXHZ7vhZY+dvK
	HpM+pGBDZKrRUR6/vVh2rqrBR5/kc54=
X-Google-Smtp-Source: ABdhPJzkUqGDQ78v8yBPxaUnI0vu3f8zCIPdaehEsbNCmPXLpqqpBYWPLXjAVJvXWZ+rJBc4RtDQBA==
X-Received: by 2002:a05:600c:4caa:: with SMTP id g42mr10025179wmp.2.1616420244248;
        Mon, 22 Mar 2021 06:37:24 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:24 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 16/19] Staging: rtl8723bs: remove useless structs in rtw_xmit.h
Date: Mon, 22 Mar 2021 14:37:14 +0100
Message-Id: <20210322133717.17797-17-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct in include/rtw_xmit.h:

	struct agg_pkt_info

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_xmit.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_xmit.h b/drivers/staging/rtl8723bs/include/rtw_xmit.h
index f7d6ac0ff865..4d4fa157daa9 100644
--- a/drivers/staging/rtl8723bs/include/rtw_xmit.h
+++ b/drivers/staging/rtl8723bs/include/rtw_xmit.h
@@ -346,11 +346,6 @@ struct	hw_txqueue	{
 	signed int	ac_tag;
 };
 
-struct agg_pkt_info {
-	u16 offset;
-	u16 pkt_len;
-};
-
 enum cmdbuf_type {
 	CMDBUF_BEACON = 0x00,
 	CMDBUF_RSVD,
-- 
2.30.2

