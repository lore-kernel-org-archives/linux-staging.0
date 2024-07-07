Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC8017565
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335305; cv=none; b=U8+91XVaRar2aIrOUkP6IPOjNdFyOtlJnDbP+EwXRzubYQN0ZN68wt3uaOjrgKksOY7utIQ7wEBP65tF3baA33C7+Is33KsDnZDgqZJ6sKKAMT7zRrt/S25CkDzUk6QKroFf6wJcxMXfUYVvIUQitiZxQ6/x71U5R0AF8RyUW68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335305; c=relaxed/simple;
	bh=rzKabKffahYwgJ55hpBHQvrGtgLu5nbsAN1wfIvqlrk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qGOH9FEj7RcKLp8CdSLpA0xTHMn/xsZdpwdjOXiQD8BcwqbKKDhpVy/ruHpXLrlPDNc2QCOFX+qmpOLzVU7tswPC1QYP5txep3J4CNA7cFS9+G34e+XkI9T+WfR4mtZDzi7mdDZrEbT3ABIfQeq+swWF7tx4kFhlb442DkrX0e4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QcowpaB/; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QcowpaB/"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-36788bf97d4so81178f8f.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:55:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335302; x=1720940102; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=m2PorvJffBvL5zdCnB5NS37w93MVpx08ayzwznwdvC8=;
        b=QcowpaB/zeRzStfn+CP6xK6zHy0wGZcyMMaXx4R+aTlv40WHQ9r43X88qFgss6ldgq
         OBC9XTP5wm7/LOXq3/ymVfX/EWTNPf9fZ0eDRw36XwAiaBw2jMJ3lCAik6nrQBPGSnAi
         CUnci+J6IZMfZeXtt8eEMyjaPh61qzP5wJr+jzPfK/Ob2mZZ6NgHa/sNRI3bi80Xrw4+
         6SaHP/XB/p5dBih1Pkl/UKnTqDvgh+9stD4XefCRndI1c9MXbyspi0y+MDRYB6iSpKsa
         5LsNFhN+4hgLkU9341ZKWAb9kmBR9CzAIS5cGszwyMPPq5XONVsAQim+zh7cqcmR2OzS
         l88g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335302; x=1720940102;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m2PorvJffBvL5zdCnB5NS37w93MVpx08ayzwznwdvC8=;
        b=jrV3CO/YQV/Vi8/+qYbaislm4RZpEP6sOj8kDJvD3mtnui5YT4LH+Wk5toFvHESdev
         Yh27Dj7+Tj6TYGtNyLOKoNuymQzCexwoaxIlcKHjIgo7fS5VkfcWhzdQJxnQLMxoecpo
         NA02Zbus8tLJWwcAbYwHoJD6yMHc6niJezpY4sQhJzxoWOzfcx1O3RT7Zs/Rwu8r/x77
         TQxb8WfLh7QdPiDBHeXXBbW03iNIn5BxBtZo2OdaZAmzT8GXtUQzsrk2mkhPz2ooAF5a
         QpFNLdUB1Rd89lKSwuBRksrQiPecSwMZ6IBwy3pXXBN/ed3d7Af1tUJ5H8xZjTIeO/Vk
         osHw==
X-Forwarded-Encrypted: i=1; AJvYcCW+Ge6GtGS8DDSF7gdjGHemdhx37iglHYka0czlMJhEB0+K8u3OXP2iB1iWJc/hlhjhzNT01vZ32cCQq6EB6d8Op3sa240Qkt8c+riJfA==
X-Gm-Message-State: AOJu0YwREIksoUaPgoSQyOdqEOKYlm12dgU3iPasGFDUWdgVR6Hf/vot
	X/Yj1wXBxp1sQuQ8w4ZMb+miT8TKRol1YWlB8inNhnRCwQGQY+Dq
X-Google-Smtp-Source: AGHT+IFON8nQMBqv3cEJcIEdHB7Adc7nAWFXQc4w7yFh4P2EzQKJvi1Iv7yS+/iqeF16r4tihrMn2Q==
X-Received: by 2002:a05:6000:4023:b0:35f:2f97:e890 with SMTP id ffacd0b85a97d-3679db8926emr6233367f8f.0.1720335302102;
        Sat, 06 Jul 2024 23:55:02 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-36798fafa0esm8788724f8f.74.2024.07.06.23.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:55:01 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:54:59 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 13/13] staging: rtl8723bs: Remove unused macros in
 rtw_mlme_ext.h
Message-ID: <7178388b14033c24e9c6a3912a1cf19d342b9b22.1720245061.git.philipp.g.hortmann@gmail.com>
References: <cover.1720245061.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1720245061.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  | 37 -------------------
 1 file changed, 37 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
index 65e138a5238f..5b8574f5a251 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mlme_ext.h
@@ -20,50 +20,18 @@
 /* define DISCONNECT_TO	(3000) */
 #define ADDBA_TO			(2000)
 
-#define LINKED_TO (1) /* unit:2 sec, 1x2 =2 sec */
-
 #define REAUTH_LIMIT	(4)
 #define REASSOC_LIMIT	(4)
-#define READDBA_LIMIT	(2)
-
-#define ROAMING_LIMIT	8
-/* define	IOCMD_REG0		0x10250370 */
-/* define	IOCMD_REG1		0x10250374 */
-/* define	IOCMD_REG2		0x10250378 */
-
-/* define	FW_DYNAMIC_FUN_SWITCH	0x10250364 */
-
-/* define	WRITE_BB_CMD		0xF0000001 */
-/* define	SET_CHANNEL_CMD	0xF3000000 */
-/* define	UPDATE_RA_CMD	0xFD0000A2 */
 
 #define DYNAMIC_FUNC_DISABLE		(0x0)
 
 /*  ====== ODM_ABILITY_E ======== */
 /*  BB ODM section BIT 0-15 */
 #define DYNAMIC_BB_DIG				BIT0 /* ODM_BB_DIG */
-#define DYNAMIC_BB_RA_MASK			BIT1 /* ODM_BB_RA_MASK */
 #define DYNAMIC_BB_DYNAMIC_TXPWR	BIT2 /* ODM_BB_DYNAMIC_TXPWR */
-#define DYNAMIC_BB_BB_FA_CNT		BIT3 /* ODM_BB_FA_CNT */
-#define DYNAMIC_BB_RSSI_MONITOR		BIT4 /* ODM_BB_RSSI_MONITOR */
-#define DYNAMIC_BB_CCK_PD			BIT5 /* ODM_BB_CCK_PD */
 #define DYNAMIC_BB_ANT_DIV			BIT6 /* ODM_BB_ANT_DIV */
-#define DYNAMIC_BB_PWR_SAVE			BIT7 /* ODM_BB_PWR_SAVE */
-#define DYNAMIC_BB_PWR_TRAIN		BIT8 /* ODM_BB_PWR_TRAIN */
-#define DYNAMIC_BB_RATE_ADAPTIVE	BIT9 /* ODM_BB_RATE_ADAPTIVE */
-#define DYNAMIC_BB_PATH_DIV			BIT10/* ODM_BB_PATH_DIV */
-#define DYNAMIC_BB_PSD				BIT11/* ODM_BB_PSD */
-#define DYNAMIC_BB_RXHP				BIT12/* ODM_BB_RXHP */
-#define DYNAMIC_BB_ADAPTIVITY		BIT13/* ODM_BB_ADAPTIVITY */
-#define DYNAMIC_BB_DYNAMIC_ATC		BIT14/* ODM_BB_DYNAMIC_ATC */
-
-/*  MAC DM section BIT 16-23 */
-#define DYNAMIC_MAC_EDCA_TURBO		BIT16/* ODM_MAC_EDCA_TURBO */
-#define DYNAMIC_MAC_EARLY_MODE		BIT17/* ODM_MAC_EARLY_MODE */
 
 /*  RF ODM section BIT 24-31 */
-#define DYNAMIC_RF_TX_PWR_TRACK		BIT24/* ODM_RF_TX_PWR_TRACK */
-#define DYNAMIC_RF_RX_GAIN_TRACK	BIT25/* ODM_RF_RX_GAIN_TRACK */
 #define DYNAMIC_RF_CALIBRATION		BIT26/* ODM_RF_CALIBRATION */
 
 #define DYNAMIC_ALL_FUNC_ENABLE		0xFFFFFFF
@@ -91,11 +59,6 @@
 MCS rate definitions
 *********************************************************/
 #define MCS_RATE_1R	(0x000000ff)
-#define MCS_RATE_2R	(0x0000ffff)
-#define MCS_RATE_3R	(0x00ffffff)
-#define MCS_RATE_4R	(0xffffffff)
-#define MCS_RATE_2R_13TO15_OFF	(0x00001fff)
-
 
 extern unsigned char RTW_WPA_OUI[];
 extern unsigned char WMM_OUI[];
-- 
2.45.2

