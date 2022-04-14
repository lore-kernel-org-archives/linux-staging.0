Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2061417D3
	for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 10:43:49 +0000 (UTC)
Received: by mail-ed1-f45.google.com with SMTP id z12so5826739edl.2
        for <linux-staging@lists.linux.dev>; Thu, 14 Apr 2022 03:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WFWSbvyg+22b/MTXpAJu7hFpGo/4sj3aFOsTXUdx0xU=;
        b=QyV2bqbB67CEvoWLL+KxlN8vK+MHpp1Sd1EBlVNcejR3Jac427hCRQNr4Sg17bXh5J
         5pBDvjAs0EYgGiLDKqkIS9ihJtHNmxqrMU2M0n5DIEdcY8eyLb1Si4mhVD7Wx7OP4RMU
         r8YlaMAaPkX7YDyqH5H4KdcWalyHglva0b58jrZP3lxhKQfjwgrj1KZIYWVxiHG2mMty
         cvFK7XMq7+KvMg8vIxRwTjAWTzXFhBMZoEjO7CfgSEjA19j5h7wdcR+B9FU1zpct42I3
         ZCjM9kAeyrUlgVVBQfZIjcCsGjqLRuNsjKAHhOxUADOPkqW1+wVPXNt1BkMMw/AhWPcO
         zmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WFWSbvyg+22b/MTXpAJu7hFpGo/4sj3aFOsTXUdx0xU=;
        b=P9BA9RShEi9oRubgsEdl7p3VfNcq9oEsucvc8/4xVXJsRReAkCkJRh4umOSwLvSc3p
         tlo+p58dR4Dm7997n7lpNSZ8tRdZ/e3iaxkyp+J6q5gvDugPUMSdFEyFIqH4fTXtzeT0
         pYG/1tOGZL+Cbk0wCtgOPWO8QybJZ91axt9Z6Fb4cTeBmzdOCMfBK2LBTGbXexmSb2ll
         UxSu+KDo53o0H+20EuWpRbl+gjNAFK+6Pm52d5JvwBw2V51WiyGNWqbNUcbu22WLHwPK
         wxryi2Xkt4rrpxkuBwOf/YUyrHdfc0yC4aRcNzufIZlxDHw/7+yZbp852nd/P/GHWBRA
         K8pg==
X-Gm-Message-State: AOAM530w6TVx3CS7VPxk3CC3uCBCFJUSo4aluWfd2MRUw5NEHo5jEYJf
	9pqgLGlaVZ4+XCvRTEUtybfznqD/pQ8=
X-Google-Smtp-Source: ABdhPJwo5OS8VI7zAySQPUrSJFOPG8ga1uuwWy1rlKpZKAVE0RwTl6dsqS/eI1kUmqChDbVRmgbXRA==
X-Received: by 2002:a05:6402:4407:b0:421:21be:376b with SMTP id y7-20020a056402440700b0042121be376bmr1583976eda.294.1649933027522;
        Thu, 14 Apr 2022 03:43:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abb6b.dynamic.kabel-deutschland.de. [95.90.187.107])
        by smtp.gmail.com with ESMTPSA id h9-20020aa7c949000000b0041b4d8ae50csm821318edt.34.2022.04.14.03.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Apr 2022 03:43:47 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH v2 1/8] staging: r8188eu: fix struct rt_firmware_hdr
Date: Thu, 14 Apr 2022 12:43:16 +0200
Message-Id: <20220414104323.6152-2-straube.linux@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220414104323.6152-1-straube.linux@gmail.com>
References: <20220414104323.6152-1-straube.linux@gmail.com>
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

