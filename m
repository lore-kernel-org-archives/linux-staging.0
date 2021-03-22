Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53675F
	for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 13:37:22 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id k8so16815713wrc.3
        for <linux-staging@lists.linux.dev>; Mon, 22 Mar 2021 06:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Nymfnb6vZCjmN46Ys71DZyGa6luVMEp9VFlBmET69yU=;
        b=FJwOivSJFvmCV8sGC9OXjOfLJy87Qt01sIJqD67dFZkpuvS09ECQNXluJhq2IDwVQd
         NmEn2NU4XmOVypxGsIe2XEqvNvmGsMjOxtIANmtYVFQY0NwybEP1vB53Sw+dFDD/T2NF
         ZqvjDJAFEcaclCTs/5iGgerjLpOimFb/ExO1AHKbQRUrx7YNOTgjfQBvyaaY9jzt9p3S
         dyE+hHwPjinKB40KTTFHjwNskNwY7LauUapQ4NWbDPqidTWUIPNOLVsUAvADsp6060cs
         SF432LJO4QWXfH3S8ajRcEJovk14VvplGvn5WSBxSI14nkiV686gLpNfdDW9j/W/PuHa
         XyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Nymfnb6vZCjmN46Ys71DZyGa6luVMEp9VFlBmET69yU=;
        b=Yy43youX2Md/uv2fwTINyCvMR02XYolmGNEQ4P7jogOFmnWaCjRs0TVfbvUBT3hpqb
         rTLnEwNoD6hXDZqBZQMvYn39T1TJrAuGNtXLpqgOxfXhg5W1co/yC0hnbf612zrnQhvS
         r6NhmgQQBvnr5Fni5zxKwdspBzNs3n6zzp5XY6uBpnA6im9fGGeiFvNPoUrWXXYRH1Ks
         EeVll27J4byNz/zPeYXmnqxvMf93CSgoIWR9WMKhGtafmz03df0QG8vTeMXxvL3tFNz1
         B3Gi4wMtYXg57AaWIKDHIamYLAdLiIPga+QFtwAWeJ2cAJDxVSahI6mTdTGK+WAH9kAu
         xYoQ==
X-Gm-Message-State: AOAM531heB3L7qSbXFAW6M8QTkLt8XZcr9OQXv2buDRm8xVMr0s7K5AB
	esgZluHbH2+jrGpbjyuFbyU=
X-Google-Smtp-Source: ABdhPJwwXFT/+8D3GFGj65xsnFmKTk8+XLmhlzQcDxCnnDIr0ldCJpCvNQIZO9x1wmhypTQ9gRgc3g==
X-Received: by 2002:a05:600c:247:: with SMTP id 7mr16134891wmj.116.1616420241540;
        Mon, 22 Mar 2021 06:37:21 -0700 (PDT)
Received: from gimli.cesven (93-48-145-141.ip257.fastwebnet.it. [93.48.145.141])
        by smtp.gmail.com with ESMTPSA id d204sm17091770wmc.17.2021.03.22.06.37.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Mar 2021 06:37:21 -0700 (PDT)
From: Marco Cesati <marcocesati@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Larry Finger <Larry.Finger@lwfinger.net>,
	linux-staging@lists.linux.dev,
	Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH 13/19] Staging: rtl8723bs: remove useless structs in rtw_io.h
Date: Mon, 22 Mar 2021 14:37:11 +0100
Message-Id: <20210322133717.17797-14-marcocesati@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210322133717.17797-1-marcocesati@gmail.com>
References: <20210322133717.17797-1-marcocesati@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove the following unreferenced struct's in include/rtw_io.h:

	struct reg_protocol_rd
	struct reg_protocol_wt

Signed-off-by: Marco Cesati <marcocesati@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_io.h | 111 ---------------------
 1 file changed, 111 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_io.h b/drivers/staging/rtl8723bs/include/rtw_io.h
index c83d8c66bd86..fbb73e698e09 100644
--- a/drivers/staging/rtl8723bs/include/rtw_io.h
+++ b/drivers/staging/rtl8723bs/include/rtw_io.h
@@ -127,117 +127,6 @@ struct	intf_hdl {
 	struct _io_ops	io_ops;
 };
 
-struct reg_protocol_rd {
-
-#ifdef __LITTLE_ENDIAN
-
-	/* DW1 */
-	u32 	NumOfTrans:4;
-	u32 	Reserved1:4;
-	u32 	Reserved2:24;
-	/* DW2 */
-	u32 	ByteCount:7;
-	u32 	WriteEnable:1;		/* 0:read, 1:write */
-	u32 	FixOrContinuous:1;	/* 0:continuous, 1: Fix */
-	u32 	BurstMode:1;
-	u32 	Byte1Access:1;
-	u32 	Byte2Access:1;
-	u32 	Byte4Access:1;
-	u32 	Reserved3:3;
-	u32 	Reserved4:16;
-	/* DW3 */
-	u32 	BusAddress;
-	/* DW4 */
-	/* u32 	Value; */
-#else
-
-
-/* DW1 */
-	u32 Reserved1  :4;
-	u32 NumOfTrans :4;
-
-	u32 Reserved2  :24;
-
-	/* DW2 */
-	u32 WriteEnable : 1;
-	u32 ByteCount :7;
-
-
-	u32 Reserved3 : 3;
-	u32 Byte4Access : 1;
-
-	u32 Byte2Access : 1;
-	u32 Byte1Access : 1;
-	u32 BurstMode :1;
-	u32 FixOrContinuous : 1;
-
-	u32 Reserved4 : 16;
-
-	/* DW3 */
-	u32 	BusAddress;
-
-	/* DW4 */
-	/* u32 	Value; */
-
-#endif
-
-};
-
-
-struct reg_protocol_wt {
-
-
-#ifdef __LITTLE_ENDIAN
-
-	/* DW1 */
-	u32 	NumOfTrans:4;
-	u32 	Reserved1:4;
-	u32 	Reserved2:24;
-	/* DW2 */
-	u32 	ByteCount:7;
-	u32 	WriteEnable:1;		/* 0:read, 1:write */
-	u32 	FixOrContinuous:1;	/* 0:continuous, 1: Fix */
-	u32 	BurstMode:1;
-	u32 	Byte1Access:1;
-	u32 	Byte2Access:1;
-	u32 	Byte4Access:1;
-	u32 	Reserved3:3;
-	u32 	Reserved4:16;
-	/* DW3 */
-	u32 	BusAddress;
-	/* DW4 */
-	u32 	Value;
-
-#else
-	/* DW1 */
-	u32 Reserved1  :4;
-	u32 NumOfTrans :4;
-
-	u32 Reserved2  :24;
-
-	/* DW2 */
-	u32 WriteEnable : 1;
-	u32 ByteCount :7;
-
-	u32 Reserved3 : 3;
-	u32 Byte4Access : 1;
-
-	u32 Byte2Access : 1;
-	u32 Byte1Access : 1;
-	u32 BurstMode :1;
-	u32 FixOrContinuous : 1;
-
-	u32 Reserved4 : 16;
-
-	/* DW3 */
-	u32 	BusAddress;
-
-	/* DW4 */
-	u32 	Value;
-
-#endif
-
-};
 #define SD_IO_TRY_CNT (8)
 #define MAX_CONTINUAL_IO_ERR SD_IO_TRY_CNT
 
-- 
2.30.2

