Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E0747DD58
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 19:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775070511; cv=none; b=G2Lf+7RYGf/xf/2xOsAGcGirpWQKxXWIk7DjFB42Bw8aYxgztDUfCKwhxkqSU5r/hGmGB2BYPFLoK1QKJVZVYTegANGuM9JLv0oAK/H66PTB5gqJJ8o8GeDaoaeTOoZ2gdGVvhfQTl3tooLU0czCCy5xrNftqhHZbnpTg0oF6oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775070511; c=relaxed/simple;
	bh=7hWnGR6JVLfex+rD/xGo4bHDTvfpkq68L4Ou9llbFYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CRiGo+7a61esl8b+jiNfZxni79lUYinoUwDTrNed3wwbdh/IRJlN+7hd/wtK/0YPddNaOgTUWxA6Pz79QF8WTtvjxm16faCJw5xFn7wjoYQfcImjDDIgznP4xYCtGWHqUVoyRia4gVd9bif2l3Ch04ROZh5vxfaikxvTaT64TL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JBqV29FB; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JBqV29FB"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-38a2f196cbaso1316191fa.1
        for <linux-staging@lists.linux.dev>; Wed, 01 Apr 2026 12:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775070508; x=1775675308; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyRJjZX34vRjHf1B150nKESkNo+LK++/0dkjHnE+CAs=;
        b=JBqV29FBAFSGBNmybR4o0Mxxg+eUeHkKQbE5ej8pDXLiPcALo9okyhjZ5aFSQ2CUZN
         +SYWSBuykKbQ0VB/hqtPw+JyOV/HteFaRrjvvCAOCRXR2uaoeMHGDwTm6t9Fm19jZ2Gs
         cCtuPohm/yHfLI4avW0WDvc7UBI4T/qcsSEBHNtZjtdOrCR++7Nv+zfcJ+mIm5e4bLJB
         QQHpqJ3BnES2mQmBOVwRlkoh58PL2/4TadDNLyA+Lff87wpEQzwCi5PHQDABzBJwKv7R
         l1ro2KYnOmXrrCF9lO2+qqXcJZFhyKZF7RiS9Cv3KiYsE/qldl6U0GWEe8q4B4TjGV5s
         XN/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775070508; x=1775675308;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SyRJjZX34vRjHf1B150nKESkNo+LK++/0dkjHnE+CAs=;
        b=VspZPOZVmhs/tscD4ReRpFfeDgcSAl7XPqJIDREcO1n+URMmXf2Ni7pfH6U/9cyDb+
         Ndks1rJcwlzPof4KpMoxYatY+xgKqnZCnpnHneXrBQIl9HZcG/9UoQQI0VmzKcxdCeb/
         QU78rYlyLzHQI1yp840NxxwEc+kmaxSMbsvCdPjMiQdkKH77M90/Ryd020NcLncNsKOz
         Mbkee+DpDzYt7AZPv9I5WgIRepGV2xRwcFBJghuHLGZJ19cYG8xCLXQiv4hLr50eoDyb
         IO1jo2PnoC4Z73cahhEQLow5i2x5fp8u7ef5Sgtfe5cIG/oFQ05ZSFklJjtw4JklD/8a
         krYw==
X-Gm-Message-State: AOJu0YxjMkHOhFvkldf5EyAQ5vrzPMBTSe+yYTtIf/YkrRIRUBzpB3Uz
	PYYNgqYslZVFXAkZGKEF/n6S0gaIb0Rmvp/p7fxBILhWFC5T0RfWbKI1
X-Gm-Gg: ATEYQzxaC6p1TBC8WpR8P8u5bPyogwnZAY6Ef+aZhnvZ8EP01IHRbxumj4ZSr8tJael
	9KAfqJ81+EW4y75JNBpeoEwzxQcOHLwc/Qpl/TYjHJg1KhxSYy68hgeR78j57uuQXNkk6S91f8f
	Au8X2GHM1xew6Wyd1f+ip7bl6dnO3beg4o84re2UovGuv4A6bw+ibDRArE0KpFOr4JijwG6jMNA
	yKtaH7oSKIP2dhL2NVwfxa0iXG7cfemnD4BpY5IgAFxScUA1wH1i8790Al1AtU4NSzZfMOa2r0+
	nj2Frs8Ee3lmtAgGVGr2w5MWQRaxnu5JwgXG2UR18FLDCywdETBHRtGCw8os2M8uPFUf9PO6Yc1
	1mEF6PgggKBS3lDe5FzchCNM2P6MFSPGYfpjbuR9D+RT9AVvqRS5hREk4vQpgDnrGgKrgBxfaI5
	vnfXLSENPauHkw8Vh8fbxYv7ExqIAp
X-Received: by 2002:a05:6512:3b8a:b0:5a2:bc19:b7ac with SMTP id 2adb3069b0e04-5a2c7682c28mr93260e87.36.1775070507915;
        Wed, 01 Apr 2026 12:08:27 -0700 (PDT)
Received: from localhost ([2a02:aa1:115f:85c8:99af:b9fd:7f92:d8b4])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc5f83sm134556e87.40.2026.04.01.12.08.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 12:08:27 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH v4 7/7] staging: rtl8723bs: remove space before tab
Date: Wed,  1 Apr 2026 21:08:14 +0200
Message-ID: <20260401190814.216333-8-linus.probert@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260401190814.216333-1-linus.probert@gmail.com>
References: <20260401190814.216333-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes a space before tab according to kernel code style.
Discovered using the checkpatch.pl tool.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
v4: No change

 drivers/staging/rtl8723bs/include/rtw_efuse.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_efuse.h b/drivers/staging/rtl8723bs/include/rtw_efuse.h
index 4e8980d86965..808ba94a5998 100644
--- a/drivers/staging/rtl8723bs/include/rtw_efuse.h
+++ b/drivers/staging/rtl8723bs/include/rtw_efuse.h
@@ -31,7 +31,7 @@ enum {
 #define		EFUSE_REPEAT_THRESHOLD_			3
 
 /*  */
-/* 	The following is for BT Efuse definition */
+/*	The following is for BT Efuse definition */
 /*  */
 #define		EFUSE_BT_MAX_MAP_LEN		1024
 #define		EFUSE_MAX_BANK			4
-- 
2.53.0

