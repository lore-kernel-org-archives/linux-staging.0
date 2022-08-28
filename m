Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C7E17E5
	for <linux-staging@lists.linux.dev>; Sun, 28 Aug 2022 06:54:34 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id t5so6651620edc.11
        for <linux-staging@lists.linux.dev>; Sat, 27 Aug 2022 23:54:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc;
        bh=zlbBwhELsS9ncIi7cmLrnHeCoFJ5J4VqFjmk0yBsOK0=;
        b=n+MTmaYheBrwbksR3a1pDVrtDWAnuQKMmAfl6FgMq5c8w61sNc+o9hU4YQL1hOhr6E
         4Fd83XQCdKqOrpzmc0+27X6tQ/pAtV9EKrtsQ738dJawp2F/IwzoJ+zfjwUlS2+WiX23
         5HdtAnnubtt76SsuF2P2nM26lLk97NQBl/x7RWNDPgRQsqdMCCInOYLCNyXTs0OKF07v
         jM+wKDpAzqFWF3wrAtSN58ximxfh+KFiJtpovD0M6b4oqKNNkHatP1dtx+YKWutk9NeO
         sBzwr+LzJTv6w9bwYwygXJBIHWZkCDXb0qSYfPaPuIxuMrmOskK2YFwh6zdQ2oTo0arg
         TwsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc;
        bh=zlbBwhELsS9ncIi7cmLrnHeCoFJ5J4VqFjmk0yBsOK0=;
        b=akG2XMM1ueY68tavl7p5ZrPhlmVgjCpDlWbeD8awErQsMlwp6xJpOsdXkcSA8OAxxu
         NcAZvAtWWcIFIr4aBqaCxm6cBJPLr9NcDPwK6docvqm2C/GrDcQLZno7/h1PEKtH9KQ+
         GA+tfbuSn5RUu51Y8qENtYBlwyP43EMdY83mNET4R7eQtX3rwloToq+bwb2EhVITkLee
         wcVg4wAMqz/6E9DLu26qRVhAmsAdc0w++L/VplWoTZAce3kYqXQ7gWHt5zu7cgwzXbh9
         c1ahNoSW6z2MI/d4WagseUXyg5QRBSYyboiE0+IrWz1O9dfyZhWWuBG58z8stvpYZ/A1
         /aOg==
X-Gm-Message-State: ACgBeo1URiL5Bujs/AJwFGVrM6YO7KLYewt/pOfZiTxS7WslJRE9zyFO
	ftOWZkDRfXYjqFtZMgDCy/A=
X-Google-Smtp-Source: AA6agR56QllEkOcl6kLrpUeTLopr8djB51cgB/WfYnU3uDYGuPNru60dfO8/RUPyJteV6glFYoh2EA==
X-Received: by 2002:aa7:cc05:0:b0:447:8654:7fa9 with SMTP id q5-20020aa7cc05000000b0044786547fa9mr12325311edt.298.1661669672826;
        Sat, 27 Aug 2022 23:54:32 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p54a07b82.dip0.t-ipconnect.de. [84.160.123.130])
        by smtp.gmail.com with ESMTPSA id d25-20020a056402079900b00447e2aeeba2sm3755535edy.27.2022.08.27.23.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Aug 2022 23:54:32 -0700 (PDT)
Date: Sun, 28 Aug 2022 08:54:30 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Forest Bond <forest@alittletooquiet.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] staging: vt6655: Delete function MACbIsIntDisable
Message-ID: <2cf96b9b7cf576bdd9d17e54acbc765690b7900b.1661666677.git.philipp.g.hortmann@gmail.com>
References: <cover.1661666677.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1661666677.git.philipp.g.hortmann@gmail.com>

Delete function MACbIsIntDisable as it is unused and the name is not
accepted by checkpatch.pl.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/vt6655/mac.c | 24 ------------------------
 drivers/staging/vt6655/mac.h |  2 --
 2 files changed, 26 deletions(-)

diff --git a/drivers/staging/vt6655/mac.c b/drivers/staging/vt6655/mac.c
index 7363dfb04ba8..edd941c4f9ee 100644
--- a/drivers/staging/vt6655/mac.c
+++ b/drivers/staging/vt6655/mac.c
@@ -11,7 +11,6 @@
  *
  * Functions:
  *      vt6655_mac_is_reg_bits_off - Test if All test Bits Off
- *      MACbIsIntDisable - Test if MAC interrupt disable
  *      MACvSetShortRetryLimit - Set 802.11 Short Retry limit
  *      MACvSetLongRetryLimit - Set 802.11 Long Retry limit
  *      MACvSetLoopbackMode - Set MAC Loopback Mode
@@ -103,29 +102,6 @@ static bool vt6655_mac_is_reg_bits_off(struct vnt_private *priv,
 	return !(ioread8(io_base + reg_offset) & mask);
 }
 
-/*
- * Description:
- *      Test if MAC interrupt disable
- *
- * Parameters:
- *  In:
- *      io_base    - Base Address for MAC
- *  Out:
- *      none
- *
- * Return Value: true if interrupt is disable; otherwise false
- *
- */
-bool MACbIsIntDisable(struct vnt_private *priv)
-{
-	void __iomem *io_base = priv->port_offset;
-
-	if (ioread32(io_base + MAC_REG_IMR))
-		return false;
-
-	return true;
-}
-
 /*
  * Description:
  *      Set 802.11 Short Retry Limit
diff --git a/drivers/staging/vt6655/mac.h b/drivers/staging/vt6655/mac.h
index ca1211aacec2..cc5d2493375b 100644
--- a/drivers/staging/vt6655/mac.h
+++ b/drivers/staging/vt6655/mac.h
@@ -549,8 +549,6 @@ void vt6655_mac_word_reg_bits_on(void __iomem *iobase, const u8 reg_offset, cons
 void vt6655_mac_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u8 bit_mask);
 void vt6655_mac_word_reg_bits_off(void __iomem *iobase, const u8 reg_offset, const u16 bit_mask);
 
-bool MACbIsIntDisable(struct vnt_private *priv);
-
 void MACvSetShortRetryLimit(struct vnt_private *priv,
 			    unsigned char byRetryLimit);
 
-- 
2.37.2

