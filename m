Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB9B3215
	for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 12:10:37 +0000 (UTC)
Received: by mail-ed1-f41.google.com with SMTP id v4so9715171edl.7
        for <linux-staging@lists.linux.dev>; Fri, 15 Apr 2022 05:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Z4IE0OQ8E/8/Uo6VyqqsqfAO6v80qcrW7+EGio8VhGM=;
        b=WC9meVzZPRT6pezD6Ws9XoFwNenm93wY/iI1l3ZOcr9RTV6lZTgdhNi2Gna3ZskEy8
         ywCE+2tm0GpcJDsoKgWlsbgkBn0tmHSLwIn1t82MDnzax0EbMT0qcgQ+hqyYE5VKwlgA
         9uQWzA+l4HAxF+lw/amOk18f23c+SuCVoj32mwPNU9VPzF0ONsn6AnNXxKcsymQJtm6S
         VY3QdJMaCTUlcd2n4TgbApmcxmzU+0uVEEjyDDx39Q3hgxcVtwCLH7BvyREXQACOtaaf
         4RoD0J8q7VrZyBXiHjg/DRQhc9u+xkNMlPL1zAbrSysLLLDNOJDyxwj/AJrZZFG9zMIx
         Z6xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Z4IE0OQ8E/8/Uo6VyqqsqfAO6v80qcrW7+EGio8VhGM=;
        b=yQsBpR09VH2+nyFJTn8YTDKCL8t09jTgauFkFWjH7EaLFajpKrp1w1lrEKLw9O4w/E
         SPPA+v85cxKZV8io/qrFBUotdz3pzFJP2hbcWkA7aXpY/e6baQJInaZVungkOPWWBGZ3
         KmOrdbgKsXnZp+Orp/pru7xad2zAxx0q5v0E8Rxpwbai/dqiOOZ+wVZgzUbflSYDbo22
         5VJ0nyJd7547WdFGJkanUViCapcYrEjgZu0FftxUG5EJqOrhLGIoYlRNe1gFc4FROsYG
         3HIOaXu1OkcZ6D4qSawhHp2Q1wr4QfQEGK2I9gjWFrdpI2d8tSd/PHV8cRx7OJU0R+VH
         q19Q==
X-Gm-Message-State: AOAM532Edfi10UlwXYO2dLNB9SwZXW4Am6XmrSwzII3y6zFrDODujEl5
	qP8G168SIVEFUlwOPyKA2naQxlpqQIA=
X-Google-Smtp-Source: ABdhPJzc/Ktw3QuQHevJBYmv7RNJVnQ4aXRFxN6BVeK4nFygvduqD5EIjkFsqLCqH/CKMr6QjrLQ2Q==
X-Received: by 2002:a05:6402:350d:b0:41d:675f:ea96 with SMTP id b13-20020a056402350d00b0041d675fea96mr8048459edd.297.1650024635706;
        Fri, 15 Apr 2022 05:10:35 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id z22-20020a1709063ad600b006e8867caa5dsm1626114ejd.72.2022.04.15.05.10.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Apr 2022 05:10:35 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v3 1/8] staging: r8188eu: fix struct rt_firmware_hdr
Date: Fri, 15 Apr 2022 14:10:16 +0200
Message-Id: <20220415121023.11564-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220415121023.11564-1-straube.linux@gmail.com>
References: <20220415121023.11564-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The size of struct rt_firmware_hdr is 36 bytes.

$ pahole -C rt_firmware_hdr drivers/staging/r8188eu/r8188eu.o
struct rt_firmware_hdr {
        __le16                     Signature;            /*     0     2 */
        u8                         Category;             /*     2     1 */
        u8                         Function;             /*     3     1 */
        __le16                     Version;              /*     4     2 */
        u8                         Subversion;           /*     6     1 */

        /* XXX 1 byte hole, try to pack */

        u16                        Rsvd1;                /*     8     2 */
        u8                         Month;                /*    10     1 */
        u8                         Date;                 /*    11     1 */
        u8                         Hour;                 /*    12     1 */
        u8                         Minute;               /*    13     1 */
        __le16                     RamCodeSize;          /*    14     2 */
        u8                         Foundry;              /*    16     1 */
        u8                         Rsvd2;                /*    17     1 */

        /* XXX 2 bytes hole, try to pack */

        __le32                     SvnIdx;               /*    20     4 */
        u32                        Rsvd3;                /*    24     4 */
        u32                        Rsvd4;                /*    28     4 */
        u32                        Rsvd5;                /*    32     4 */

        /* size: 36, cachelines: 1, members: 17 */
        /* sum members: 33, holes: 2, sum holes: 3 */
        /* last cacheline: 36 bytes */
};

But the header in the firmware file is only 32 bytes long.

The hexdump of rtl8188eufw.bin shows that the field Rsvd1 should be u8
instead of __le16.

OFFSET      rtl8188eufw.bin
-----------------------------------------------------------
0x00000000  E1 88 10 00 0B 00 01 00 01 21 11 27 30 36 00 00
0x00000010  2D 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00

0x00000000  E1 88 10 00 0B 00 01  00     01     21    11    27 30 36 00 00
                              ^   ^      ^      ^     ^     ^
                     Subversion   Rsvd1  Month  Date  Hour  Minute

With the change of field Rsvd1 from __le16 to u8 the structure has the
correct size 32.

$ pahole -C rt_firmware_hdr drivers/staging/r8188eu/r8188eu.o
struct rt_firmware_hdr {
        __le16                     Signature;            /*     0     2 */
        u8                         Category;             /*     2     1 */
        u8                         Function;             /*     3     1 */
        __le16                     Version;              /*     4     2 */
        u8                         Subversion;           /*     6     1 */
        u8                         Rsvd1;                /*     7     1 */
        u8                         Month;                /*     8     1 */
        u8                         Date;                 /*     9     1 */
        u8                         Hour;                 /*    10     1 */
        u8                         Minute;               /*    11     1 */
        __le16                     RamCodeSize;          /*    12     2 */
        u8                         Foundry;              /*    14     1 */
        u8                         Rsvd2;                /*    15     1 */
        __le32                     SvnIdx;               /*    16     4 */
        u32                        Rsvd3;                /*    20     4 */
        u32                        Rsvd4;                /*    24     4 */
        u32                        Rsvd5;                /*    28     4 */

        /* size: 32, cachelines: 1, members: 17 */
        /* last cacheline: 32 bytes */

The wrong size had no effect because the header size is hardcoded to
32 where it is used in the code and the fields after Subversion are
not used.

Fixes: 7884fc0a1473 ("staging: r8188eu: introduce new include dir for RTL8188eu driver")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
v3:
- updated the commit message
- moved the u32 to __le32 conversions to a separate patch

v2:
- no changes

 drivers/staging/r8188eu/core/rtw_fw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 8620f3c92b52..eb4ab11f6b28 100644
--- a/drivers/staging/r8188eu/core/rtw_fw.c
+++ b/drivers/staging/r8188eu/core/rtw_fw.c
@@ -29,7 +29,7 @@ struct rt_firmware_hdr {
 					 *  FW for different conditions */
 	__le16		Version;	/*  FW Version */
 	u8		Subversion;	/*  FW Subversion, default 0x00 */
-	u16		Rsvd1;
+	u8		Rsvd1;
 
 	/*  LONG WORD 1 ---- */
 	u8		Month;	/*  Release time Month field */
-- 
2.35.1

