Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE4D185090
	for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 17:58:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719165488; cv=none; b=ePX1oPvo+u6dLuKeCppabOEUcFwTAbdnx4OFF0AQbJ2kC5gmOIdEW7SxWokWfrrVQY+lmtzPa1AE4PaZiNAAUjF3UyCtgoS/oEL5lunMr0qd5VwkcuyUi98E9U2qLAzE2c5a1j7K9slCg1cwVNPOQAMnDTH7KdfxHyueM7nMJ3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719165488; c=relaxed/simple;
	bh=R6XM7jW3udkgWoLCKFwsri2TbX0ri2/bGBF7okJLTPg=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IIYpdKyTQJ4oe84bIU0l/kSMJmkfjk9uNinU6r6kLcR6kIL+SWN0trXSiAxDL8CUpYP65v2O9U/eizIr+DavY0hXrshunKedTcuDw0set2ViS8I1MuHyFntjVcNJdzynV/nozCS4SrpLbSNRGlN4SL6bBtpVsblU6dcfNutsl/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jYPn2PJu; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jYPn2PJu"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d0e3d32f1so530612a12.0
        for <linux-staging@lists.linux.dev>; Sun, 23 Jun 2024 10:58:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719165485; x=1719770285; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CeP6RxLC/M7SQiQJoNsCR+rK4B27OB8IhQklB/6FH/4=;
        b=jYPn2PJuQYupxkrYujXmUXVSlypuNyAKyA0OmobXhhTl3SxO+4OxueBuBCN82m18VA
         DxrccNw4kUKBvHxK2sN3G9dtcWO0kpukhKKpDI6Bzh+iNuMOetKKDoVg2bOFSL9tR0Y6
         kU5PGb3cjBkTP6+AbWszJVjCmLhmJ+LIZGAdSwgsdIDI0LkFwqPblSq85N8Nzs4ziLAe
         Z+n7kjwrkmQtt5EvkMkrJ7QGbbm4UBErSmCJnKuMcjLvvfwHX/r6v+AXuyaE5jJVQkJ2
         FX8ISTt4qL0jDRiuGyAOWmKjgwD707UlaHyEccWIm4Ubhah3NLAw96vAZCcDtdomGqDj
         dGxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719165485; x=1719770285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CeP6RxLC/M7SQiQJoNsCR+rK4B27OB8IhQklB/6FH/4=;
        b=BJCZhYh9oYRhFYIvCVjIdX9qL2Ug5ruGEgeKUG2/sFQggwtaW91Zh+Rc00fm5JaLlO
         nell0bb2twnnIHFlumwvtLb0069Ko9Db380LYtDr0cB5K4oIh789FkREhlhDgRmGyT1r
         QQyrr/lhWLt2Pbl411TscfF9rot+QqHmDL052G3X4FGgTVnOdRx5Cdzcc8XywD8uqRyZ
         eaF076e4hvAf2thikcpw+TsOMfCo+tFbWIoUDSpxYDTyfosPgnPDjaGv2i8xyoHnqb57
         GF/FsOKTowBGgoXyTrGvgm9l1IuNxf7y02GI48D3TGUrK3jNtzkl8Mxx+jBDoxO1DPZz
         fZyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpIKZwkKcv5UtGbOQylwLqR3j6Ce7rX854fg7Seavg12Na8W+2DzFjGOTrh8MvYtubGNp3iCUKG7WR9qacc4bQ99C2w9iaRuhWq5M8Rw==
X-Gm-Message-State: AOJu0YwmGKdkpxWoksh+d2j47njkn52RZK6IkU5SpK0VFdfcDUMa47KO
	/3wkgHjGbJ62NI6lMR5jSmgTORZmkSk3egwfJVuEWgW4ly9UTvRZ
X-Google-Smtp-Source: AGHT+IH9QWeNIWTyxKGzlRLC4GfqQQmKmbdcVjvUEUwgnFfuz/X+GqhDJtokCU9knowP+lRG7OgELA==
X-Received: by 2002:a50:cd5d:0:b0:57c:6895:1de9 with SMTP id 4fb4d7f45d1cf-57d43b68dc8mr2323173a12.4.1719165485119;
        Sun, 23 Jun 2024 10:58:05 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57935a9b.dip0.t-ipconnect.de. [87.147.90.155])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d3053558esm3720144a12.64.2024.06.23.10.58.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 10:58:04 -0700 (PDT)
Date: Sun, 23 Jun 2024 19:58:03 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 11/14] staging: rtl8723bs: Remove unused macros in rtw_mp.h
Message-ID: <49bf00c305b34f2d3ed1061b6a22d042edd3a2c1.1719155208.git.philipp.g.hortmann@gmail.com>
References: <cover.1719155208.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1719155208.git.philipp.g.hortmann@gmail.com>

Remove unused macros.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_mp.h | 29 ----------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_mp.h b/drivers/staging/rtl8723bs/include/rtw_mp.h
index ea3abee325ef..f94bb18479da 100644
--- a/drivers/staging/rtl8723bs/include/rtw_mp.h
+++ b/drivers/staging/rtl8723bs/include/rtw_mp.h
@@ -8,7 +8,6 @@
 #define _RTW_MP_H_
 
 #define MAX_MP_XMITBUF_SZ	2048
-#define NR_MP_XMITFRAME		8
 
 struct mp_xmit_frame {
 	struct list_head	list;
@@ -151,12 +150,6 @@ struct mpt_context {
 };
 /* endif */
 
-/* E-Fuse */
-#define EFUSE_MAP_SIZE		512
-
-#define EFUSE_MAX_SIZE		512
-/* end of E-Fuse */
-
 /* define RTPRIV_IOCTL_MP					(SIOCIWFIRSTPRIV + 0x17) */
 enum {
 	WRITE_REG = 1,
@@ -259,33 +252,11 @@ struct mp_priv {
 	u8 *TXradomBuffer;
 };
 
-#define LOWER	true
-#define RAISE	false
-
 /* Hardware Registers */
-#define BB_REG_BASE_ADDR		0x800
-
-#define MAX_RF_PATH_NUMS	RF_PATH_MAX
-
 extern u8 mpdatarate[NumRates];
 
 #define MAX_TX_PWR_INDEX_N_MODE 64	/*  0x3F */
 
-#define RX_PKT_BROADCAST	1
-#define RX_PKT_DEST_ADDR	2
-#define RX_PKT_PHY_MATCH	3
-
-#define Mac_OFDM_OK			0x00000000
-#define Mac_OFDM_Fail			0x10000000
-#define Mac_OFDM_FasleAlarm	0x20000000
-#define Mac_CCK_OK				0x30000000
-#define Mac_CCK_Fail			0x40000000
-#define Mac_CCK_FasleAlarm		0x50000000
-#define Mac_HT_OK				0x60000000
-#define Mac_HT_Fail			0x70000000
-#define Mac_HT_FasleAlarm		0x90000000
-#define Mac_DropPacket			0xA0000000
-
 #define		REG_RF_BB_GAIN_OFFSET	0x7f
 #define		RF_GAIN_OFFSET_MASK	0xfffff
 
-- 
2.45.2

