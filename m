Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 712403D3D02
	for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 08:25:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774599915; cv=none; b=aHBr0rkWMMLruVwYFAJnlhpKts7pqMTi+/x1bLLgYw5UGeBnl2RliguYWJU2BaWhFNGmScgs9S8XBwpImKtRJ4aeX0Jj9oIuK75RB1ra6t9rYEq1VjwJdAu+phvSSKslD5xWwF/MjUXCRW5sDYEnIVnBRArTAQcx1XNdtDjqLCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774599915; c=relaxed/simple;
	bh=U1J/MKxGph7KxO2M+xvbkiGliOcTE10HEmeCmDjBYH8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nGC5ucVd4jX1UdptyPCFNjwnaJy6Ee2aLCvSlKkVKk37hNPPxs9NBOgEWd8ngRkfyWioXaieQCh3+WHrtF+4WwdCeikRipkBjeV2jH6gKH/sezDx5U8N34uA24VoDSRZjDcO/URrnPtUUbeCwZB/HndMLInbOiBwB7+eLB682xU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bh4aBlRG; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bh4aBlRG"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-c7412b07f22so1302703a12.0
        for <linux-staging@lists.linux.dev>; Fri, 27 Mar 2026 01:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774599911; x=1775204711; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R+Xs44uMeLke/Uq8q86tLy0mxWR/Y32zClcnriDBYnk=;
        b=Bh4aBlRG4XtwtpYE61RxiAraB1A+FoIBCJ1JyShVP9ttYieM2SEF80FL52E3YTKh/U
         4qMwFCZHkWMVoSHfADOqw2z3Hq1Nc7e1tG0AvWJ6l5uWH/tix44RmjSZS+UsN3YmWZTP
         ojiBtQWUbosaXQA3+TehpbYzVp1xj83CVG31iqg6hp13wF3dEQ1mlnNIA9eNBifp8yep
         kkKAGyqTJF+UvOPDR5We+lNIZ18sqwYhWD+GZF+yMopkf8mTtUSJXSPHdSatcAf/PRNQ
         VPmgzy0asFkgd+SSAvLvDLivIaVP0+21roN8Umt5c86hyyA7r20h3aAcHEzKo99XZm9X
         z52Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774599911; x=1775204711;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+Xs44uMeLke/Uq8q86tLy0mxWR/Y32zClcnriDBYnk=;
        b=qWmArR+DOZ8396kIQ5M5dOyLieOcURv21X41iYbi93jdNDJ2Gk+/eQVyaOnB583Ghf
         DOCOLJByY/lQcRFvyUALu2yi09aWWWtw7eCR+PTFh3CDimlsaRN/RrS7TFKAYbl9VlIo
         Z9kIWmuBn1YrvjqT+1dcQxRJKeBT+2zTZA/fk/Di+GYz1ey6C3NiludS+K7f+g1GtkDU
         WtgopbP0bGHrb+yVn/KeP65+w1bXtZc6UJiH/+EsKeyJcsB16Z0xlsjp64reAUCzqIX3
         Wz2rdYuiySv6IY2GUV7g7OASljIkSamcrTwAdI8IIfkabQlzFUs9yjQFVx/vM9TK4F8r
         txyQ==
X-Gm-Message-State: AOJu0YzsF1R82pR3ueWaeSIhc2+9/Ckq2v9mRGDRCRYg/xcmaJVWcOu/
	/jehfMW9ls3XtcWOuxZx7ajJVYisF5okXRRIgLtkfebL6yp5xMBgHDjj
X-Gm-Gg: ATEYQzxqRgr76WxHyonPryr38he3gpmH4BLzc9uWWoBgmnF+7EPFjxmyn7rUeCLhATO
	6FCqCr3lneKj43Z8qG7+lmMXbMnkWtuW8eRi0LSz6SDuAAJa2Wvk7+FHCd2uAksLQugjiVJtyUL
	1Y3FFFjSwvKa20fHH45JVBTaaBON21YQqySMyQDg0mivmMGoohluowJaEeYmzoXcsAvas94xO+2
	JvXAE/Ul4slboRZqVnO/BS8AG2ST9NOYe01ig5gbB8Hi33vuxa/log/shV4LfdOwzGBDEzJhpLX
	xxrmOzUbtSGV0oMWuWndyWkLAc38MozE6CQ70ttAAKl2icrzNjoRWUDuKJNsI6cCh0+pS1cbtFv
	zfl+2fdeH8O+7lhOj6wol8CM33Fbo50ppBVCJE7O64qPD7xE1kUQzkCwFU79jS20a/WPGd0fnJk
	N89N14Pi4c7Uxdergsy/b6eEYUp68N8FlfmMz+UA4+BqW5GzFa3cydJQ==
X-Received: by 2002:a05:6a20:12c9:b0:399:831:cc29 with SMTP id adf61e73a8af0-39c8ab887d0mr1433822637.23.1774599911392;
        Fri, 27 Mar 2026 01:25:11 -0700 (PDT)
Received: from ZC-202510311500 ([61.185.217.216])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7673933816sm4198141a12.21.2026.03.27.01.25.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 01:25:10 -0700 (PDT)
From: Haoyu Lu <hechushiguitu666@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"haoyu.lu" <hechushiguitu666@gmail.com>
Subject: [PATCH] staging: rtl8723bs: fix spelling in comment
Date: Fri, 27 Mar 2026 16:24:25 +0800
Message-ID: <20260327082434.2529-1-hechushiguitu666@gmail.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "haoyu.lu" <hechushiguitu666@gmail.com>

Change "co-existance" to "co-existence" in comment.

Signed-off-by: haoyu.lu <hechushiguitu666@gmail.com>
---
 drivers/staging/rtl8723bs/include/hal_data.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/hal_data.h b/drivers/staging/rtl8723bs/include/hal_data.h
index b87c90f693ec..ff4383e30322 100644
--- a/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:48:04.333064200 +0800
+++ b/drivers/staging/rtl8723bs/include/hal_data.h	2026-03-27 14:49:02.478348700 +0800
@@ -385,7 +385,7 @@ struct hal_com_data {
 	struct dm_priv dmpriv;
 	struct dm_odm_t		odmpriv;

-	/*  For bluetooth co-existance */
+	/*  For bluetooth co-existence */
 	struct bt_coexist		bt_coexist;

 	/*  Interrupt related register information. */
