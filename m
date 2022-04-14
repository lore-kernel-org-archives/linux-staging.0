Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4A815DD
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 08:39:10 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id lc2so8617259ejb.12
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 01:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFWSbvyg+22b/MTXpAJu7hFpGo/4sj3aFOsTXUdx0xU=;
        b=ZLXMAdvZA5nPgsMZXpuI68jXLnxG3WeCvhyC2GDAFZqh8PUfxRByOo0E+6+BwchGz3
         HTTKg17xUiBhRy2Iholc/Q5lS9y50YhJNeLFwNlbThEUvFcPwdV4kUuBI0CmHDUK0Bj8
         +mkh8MPxDBGs3giiND6xjptxk3Zq8m+fRt4texdNoDHTGorpNztfSl62is27kC9QwWyz
         +AuaNtBJ6fJhIjmTeTuC9QW+NQkq9c86lD7N9eSiUglPxC/AO9YFlPSg2E617BkWrwz8
         p4x9OYw7oO3d79QD0yQsM8QmwPEuWS9kyHk4EJQLPevorLOAIyAs7I/ikEbo0X0FdI1V
         TQ9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFWSbvyg+22b/MTXpAJu7hFpGo/4sj3aFOsTXUdx0xU=;
        b=e7UM9/eSkrZh9qxGGvMRhbL7HaNe17foFAnHI3z6GsPPxBaHJpCnuRzMGWOPCI96L4
         J/AbY71b/59SNxyhc5cZAKl/FytQfChgpmvl1UvdhaRr33ajmeynRYzufk59BuX/dSlY
         iMknXJMzqhh6YVNYiEyVq28jYVIsqhDX5O/7S1rLVm+hHkWW3VfVZpbIf9+sPvLv+KoL
         mStHerIeX71d7g8WIaoHuE1juvq7rsc8tklXenpLidbNlWUh0wyKUMrYI0xQPJWlMA0s
         rQuKLJRHFKi7AXWI8tBT5+GrprsS5YaRysj/9WBSagHTtxc+TP/0Qt0XvarNCrzMyNla
         4Gsg==
X-Gm-Message-State: AOAM531voYdfexmKfayH3H/XMeVuTXeg65Jo8tt2H79SIBRm5zLHNgry
	4rpojoyDgwttP0klL5Yoz1aFO2mxgYw=
X-Google-Smtp-Source: ABdhPJwMzD9CCiNoIR7HLLoeUlQ/lfMg5II32J07JGisVsIreiCSfjHc5/sYQN5rHAeaU7oFV2w0KQ==
X-Received: by 2002:a17:907:d16:b0:6d6:e3b6:9cd8 with SMTP id gn22-20020a1709070d1600b006d6e3b69cd8mr1380050ejc.94.1649925548940;
        Thu, 14 Apr 2022 01:39:08 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id ah13-20020a1709069acd00b006e8a0b3e071sm418138ejc.110.2022.04.14.01.39.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 01:39:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 1/7] staging: r8188eu: fix struct rt_firmware_hdr
Date: Thu, 14 Apr 2022 10:38:47 +0200
Message-Id: <20220414083853.3422-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414083853.3422-1-straube.linux@gmail.com>
References: <20220414083853.3422-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The structure rt_firmware_hdr is wrong, there are two issues.

The first issue is that the size of struct rt_firmware_hdr is 33 bytes
but the header in the firmware file is 32 bytes long.

The hexdump of rtl8188eufw.bin shows that the field Rsvd1 of struct
rt_firmware_hdr should be u8 instead of __le16.

OFFSET      rtl8188eufw.bin
-----------------------------------------------------------
0x00000000  E1 88 10 00 0B 00 01 00 01 21 11 27 30 36 00 00
0x00000010  2D 07 00 00 00 00 00 00 00 00 00 00 00 00 00 00
0x00000020  02 45 4E 00 00 00 00 00 00 00 00 00 00 00 00 00

0x00000000  E1 88 10 00 0B 00 01  00     01     21    11    27 30 36 00 00
                              ^   ^      ^      ^     ^     ^
                     Subversion   Rsvd1  Month  Date  Hour  Minute

This was figured out by looking at struct rtlwifi_firmware_header in
drivers/net/wireless/rtlwifi/wifi.h and the firmware file that the
rtlwifi/rtl8188ee driver uses.

The second issue is that the u16 and u32 fields sould be __le16 and
__le32.

Change the field Rsvd1 to u8 and the u16, u32 fileds to __le16, __le32.

Both issues had no effect because the header size is actually hardcoded
to 32 where it is used in the code. Also the fields after Subversion
are not used and the bytes of the u16 and u32 fields are all zero.

Fixes: 7884fc0a1473 ("staging: r8188eu: introduce new include dir for RTL8188eu driver")
Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/core/rtw_fw.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/r8188eu/core/rtw_fw.c b/drivers/staging/r8188eu/core/rtw_fw.c
index 8620f3c92b52..7cd08268f3b9 100644
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
@@ -42,11 +42,11 @@ struct rt_firmware_hdr {
 
 	/*  LONG WORD 2 ---- */
 	__le32		SvnIdx;	/*  The SVN entry index */
-	u32		Rsvd3;
+	__le32		Rsvd3;
 
 	/*  LONG WORD 3 ---- */
-	u32		Rsvd4;
-	u32		Rsvd5;
+	__le32		Rsvd4;
+	__le32		Rsvd5;
 };
 
 static void fw_download_enable(struct adapter *padapter, bool enable)
-- 
2.35.1

