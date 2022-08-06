Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDC141102
	for <linux-staging@lists.linux.dev>; Sat,  6 Aug 2022 06:09:48 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id uj29so8402619ejc.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Aug 2022 23:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=vcLF/W8KMFIaSXXvb2UsBctV0hSOCapQFAQgo06eWCM=;
        b=mqZ/ZAOCMrjjGKRH/ewbc55oJAItb5npnHzzg3svEYlyQrRuBTWHpd1MYWMO21bU/h
         WJqNXMcgdUboGwAZ4doAL9KZani3z5Lhx2a3r9wzoa/vmVZn+h0HUsnqaRYZ4pnNnvaJ
         9aKihD5ZifPOTPT2n1dvmoSqOmETQrwSMKWUwqRr7FODOs50aPl1f0GNK65SXG6fT6aC
         cwOY7MIU5tk5qgMso97lqMRFB+LgqPd/ghtAlPzyZ8C7KWuBxiM48VnAXsYXrb8Io99e
         N0kyNbeXxcd0iph4zrBbYLXrITH7o/8vtAXYPB9v5ZWvzZAc3ezG26a/ElBvc9Nk6xVO
         uFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=vcLF/W8KMFIaSXXvb2UsBctV0hSOCapQFAQgo06eWCM=;
        b=os+8R5vjW02aCuT0bf3PhkfdGG1jZFuYWoEs1YWWfQhtmH67Jpj4gTk/X3EYz9HXUt
         YLs8enA0oS9xIswBTBZiY5MvyZ/cgTF3CmLQqaGvJqBqeYFApzBQCaiv9HllHSLmocfv
         bHwcxsUqP1K054FqYX2gXoUomYTYtMdck0J9J2Sz2VZ5RfvCpojE/IAdDr1BxAODJr8i
         DhJl6fA+WWdODDvPRTxBu439YBnIl9V8VbwTgcGSUxDIGG5I+WCGs1CoRDc/wpf6k1lt
         A0tssaWIBqmCYtnrfXN6VrZ1T9rLBrp2BQWOpVqMoj73FEdQd0XJh+I877vRhMFbBHUj
         JhvQ==
X-Gm-Message-State: ACgBeo1uNKmcc75Ht6TL7MUKhGx96fruUmnJ1KAFwBG2h0DqlA+ZqqeK
	q1Rc1v9kYzvTLr4P1oK6tns=
X-Google-Smtp-Source: AA6agR4td96QHPH8bB6zZWLnwKy3oZ8M0MJyA522BMox/A2/flPPk04ZrDVrBUW3AHdmlXxP36M/bA==
X-Received: by 2002:a17:906:847c:b0:730:b6a0:e0d with SMTP id hx28-20020a170906847c00b00730b6a00e0dmr7459809ejc.126.1659766187034;
        Fri, 05 Aug 2022 23:09:47 -0700 (PDT)
Received: from localhost.localdomain (ip5f5abba5.dynamic.kabel-deutschland.de. [95.90.187.165])
        by smtp.gmail.com with ESMTPSA id p10-20020a05640243ca00b0043a7293a03dsm1002357edc.7.2022.08.05.23.09.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 23:09:46 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Larry.Finger@lwfinger.net,
	phil@philpotter.co.uk,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 2/3] staging: r8188eu: avoid camel case in phy_CalculateBitShift()
Date: Sat,  6 Aug 2022 08:09:28 +0200
Message-Id: <20220806060929.11022-3-straube.linux@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220806060929.11022-1-straube.linux@gmail.com>
References: <20220806060929.11022-1-straube.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename the function phy_CalculateBitShift() and its parameter BitMask
to avoid camel case.

phy_CalculateBitShift -> phy_calculate_bit_shift
BitMask -> bitmask

Signed-off-by: Michael Straube <straube.linux@gmail.com>
---
 drivers/staging/r8188eu/hal/rtl8188e_phycfg.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
index 3d8fcc1f0b6a..e9e24efabd76 100644
--- a/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
+++ b/drivers/staging/r8188eu/hal/rtl8188e_phycfg.c
@@ -23,9 +23,9 @@
 * Output:	none
 * Return:		u32		Return the shift bit bit position of the mask
 */
-static	u32 phy_CalculateBitShift(u32 BitMask)
+static u32 phy_calculate_bit_shift(u32 bitmask)
 {
-	u32 i = ffs(BitMask);
+	u32 i = ffs(bitmask);
 
 	return i ? i - 1 : 32;
 }
@@ -58,7 +58,7 @@ rtl8188e_PHY_QueryBBReg(
 	if (res)
 		return 0;
 
-	BitShift = phy_CalculateBitShift(BitMask);
+	BitShift = phy_calculate_bit_shift(BitMask);
 	ReturnValue = (OriginalValue & BitMask) >> BitShift;
 	return ReturnValue;
 }
@@ -91,7 +91,7 @@ void rtl8188e_PHY_SetBBReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask, u3
 		if (res)
 			return;
 
-		BitShift = phy_CalculateBitShift(BitMask);
+		BitShift = phy_calculate_bit_shift(BitMask);
 		Data = ((OriginalValue & (~BitMask)) | (Data << BitShift));
 	}
 
@@ -263,7 +263,7 @@ u32 rtl8188e_PHY_QueryRFReg(struct adapter *Adapter, u32 RegAddr, u32 BitMask)
 
 	Original_Value = phy_RFSerialRead(Adapter, RegAddr);
 
-	BitShift =  phy_CalculateBitShift(BitMask);
+	BitShift =  phy_calculate_bit_shift(BitMask);
 	Readback_Value = (Original_Value & BitMask) >> BitShift;
 	return Readback_Value;
 }
@@ -298,7 +298,7 @@ rtl8188e_PHY_SetRFReg(
 	/*  RF data is 12 bits only */
 	if (BitMask != bRFRegOffsetMask) {
 		Original_Value = phy_RFSerialRead(Adapter, RegAddr);
-		BitShift =  phy_CalculateBitShift(BitMask);
+		BitShift =  phy_calculate_bit_shift(BitMask);
 		Data = ((Original_Value & (~BitMask)) | (Data << BitShift));
 	}
 
-- 
2.37.1

