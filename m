Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77F6BC8E1
	for <linux-staging@lists.linux.dev>; Sun,  7 Jul 2024 06:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720335172; cv=none; b=crfwMF5qyhpX3PCQ6Re4u/WO8Rh1kTIGKKZl8nQRHVW711VKbmGjBaBXy2BxUSQ0cOkjdtjrDWQ3fwEhZsOd22STOD/5VpqXOliJrTZ9doCBAX6nJlvyMqbOwMqImgJFnDupOYgThfSM8lWS5yoU2YrtdnXbXmXtMdfQuA2N0Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720335172; c=relaxed/simple;
	bh=eTcdbviIPXnaBScX/lCwCkx4UwxG0OeM942lVs5Y1aA=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ar5XYd2i5PPPchhLQKm9HLAkKRt7BsZcCFaxA/0Xhu0GXh5W9huUJYz4xCBvyE4XdrdHCa0Zv9DNL195dtUGczzvjNhMc2c5bVGx1fKmm7hkeyjAMZJM+17ju5dTTaug93HiZW+O/lq+uh+r+822QNPkx3NLfH8iModWEl++Ch0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Xk9o3xuw; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Xk9o3xuw"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4210f0bb857so3279565e9.1
        for <linux-staging@lists.linux.dev>; Sat, 06 Jul 2024 23:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720335170; x=1720939970; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ilGTpNzNmztcyPOmCQQUHGh9qBBEQhne1jUpgHqVUc4=;
        b=Xk9o3xuwPG9oWfYEDArwixs84k+qB/30K373q/Jfpc2A66aNrVU1/bebLyc1fRabx/
         MHgXkhCs8L0KBZSxfIj/BMI4K3WjdHJbBfOFCU6kLa+ytUTh9t7bRCTyNNeCKJXe1rNk
         XRz3CgTVxRhkIkt+jGLn31WbfGEKytJp3mpVZMqiebWv/I8N+93wPU2gkUD7482Ylfn+
         ABupbr/k/AYXt9TKbXe2WZTpoIerznzorBfZZbOh0TA49Y6hA5YVeM2yge+J77ivkW2y
         roCk6WgvpRF6JvptgAGXMa3E/Bodc/UGTW+LW1C87m1bOzvVmt0wUk80yhV6aOrMGSC/
         wdeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720335170; x=1720939970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ilGTpNzNmztcyPOmCQQUHGh9qBBEQhne1jUpgHqVUc4=;
        b=IoB95x1RTFCPtEyoE5grwgiSJPVbJfML+kNL5ytKRyy9zjRWjNulOTvgE2a8KEN/jl
         z1ubZe1MNOQK28nH1hoylc+RXJDg57o5fxbPAjAn41yIY43RaPl2liSRijEbh/Lm72Qr
         INrVdL16+CwRVOQAJEvZR7XbmJv3GdwwEgMO883QMH6oLGwUoW74+7CfOwwDrfWSIXjB
         IEwzo69aOfDAXhKVjHIYqzChVRyBRCSgqxmc4dfKIRhoaufCCJoEhNz/U1/YMNLrBCll
         nomAPQk2DbCYWKiTJKSvBL993ex+o4lXbJYh3k3DLYMYKNZiFaGzX32CXk0Bc/pF1HFB
         AF0A==
X-Forwarded-Encrypted: i=1; AJvYcCUnLfhHcVtuIecrkQdzBWtTjShcrb5wg3JUVThdT3indtJyhIQ3GdaToXivOJOoyZfm+cds76V0hoIFmLs/D6l6Xj8DpTa0XzYXhoKSHA==
X-Gm-Message-State: AOJu0YzgiRKgp1p9t2u8cjuH69Oy7B2oRg1LV4RITLigwFT4bS/bCPDo
	ufVu7R+zZl9gqxg8QGbY60QNomduVJ/XKCQrSxCKN7YGWCHuVbIA
X-Google-Smtp-Source: AGHT+IExqykmCMe6GXQZ7zesU7eaEDbMJuHK4G7VD3P5t8/8k+npWYx4FTyVgA1r/OC/yRGdjBMOnw==
X-Received: by 2002:a05:600c:4f03:b0:426:6358:7c5d with SMTP id 5b1f17b1804b1-4266358805emr10599065e9.4.1720335169931;
        Sat, 06 Jul 2024 23:52:49 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p57ba2f9b.dip0.t-ipconnect.de. [87.186.47.155])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-367b164799csm4214321f8f.56.2024.07.06.23.52.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 06 Jul 2024 23:52:49 -0700 (PDT)
Date: Sun, 7 Jul 2024 08:52:47 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 05/13] staging: rtl8723bs: Move last macro from
 hal_phy_reg_8723b.h
Message-ID: <7e1e5591af85a452415fb137767e21d0d1d163a1.1720245061.git.philipp.g.hortmann@gmail.com>
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

Move last macro from hal_phy_reg_8723b.h to Hal8192CPhyReg.h to prepare
removal of hal_phy_reg_8723b.h.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h    | 1 +
 drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h | 5 -----
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h b/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
index 586a3dabc5ca..292c18b62537 100644
--- a/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
+++ b/drivers/staging/rtl8723bs/include/Hal8192CPhyReg.h
@@ -1108,5 +1108,6 @@
 
 /*--------------------------Define Parameters-------------------------------*/
 
+#define rDPDT_control				0x92c
 
 #endif	/* __INC_HAL8192SPHYREG_H */
diff --git a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h b/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
index 0791b85b7c57..da549b773243 100644
--- a/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
+++ b/drivers/staging/rtl8723bs/include/hal_phy_reg_8723b.h
@@ -9,10 +9,5 @@
 
 #include <Hal8192CPhyReg.h>
 
-/*  BB Register Definition */
-/*  */
-/*  4. Page9(0x900) */
-/*  */
-#define rDPDT_control				0x92c
 
 #endif
-- 
2.45.2

