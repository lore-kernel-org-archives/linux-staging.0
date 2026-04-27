Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EB133A6F7
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 17:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777311546; cv=none; b=Nj5rjOiTGP5p5ceJON9hp1ua2amYpR/QnauCCugcBcitwlOhHrSIh0ugR+FmEyFIkYGKO6MqUHfwg7nh1xKIcmtn8iiwVmDdsa7dVeRdTUPaqy74bYXKglSBIR6nfkqwKV/ZVFoI7mHsahmwlciqcqkCKK661jke7XWyi41vQcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777311546; c=relaxed/simple;
	bh=DxwtRe5+ygNK7Zw5VfENdAeH72XrKSY3Vrk3KPvlX7Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c2F7vPRRUqkbqP1uzLL1hhiwk19Gw9ZCPiDUhlHVr60iHn4Ir8gnfiV32PoTq9iPrGoOELGzGy642BdAKCdYc0fm6V7FdP9hVHrCOa6/W93yFMkvKalIsKvdolC/Wh7rZgRCDySCs5t5D10yxWmr8nUCpTaTDqN++qd0wEbQN4E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNacSIuP; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNacSIuP"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5a1307438ddso9367619e87.1
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 10:39:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777311544; x=1777916344; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3cm056sk6WacS/f3dQdyzoYHq033IVwGR9gtSW0OBkk=;
        b=BNacSIuPSD41SvxnctJ1/R90MQXdQDOiVWdViZhN8N2/hQTu7VHdq05q0MmKAi4q/E
         GIA8UGSoNoBBlTQCL+omBBiIJ0vF/BV4t1pX+AZO87I37gXdrVWrr6EVRuZBZhRb+NNn
         5ICgjqA/IYlGtDB+nFW4TXrcLnAMQT++jw3mQ1Pubfc6/7vgNH8kYejLT/0PhRc9pa/I
         mupilooQ6FtRsh0LlF+dfxOI0iArn8VEUP/RKjVKA9PwldNgHnnRuZWSEM4I16PKcKWS
         YJ2eM3mORJ0O4TeInsw1jBvwlw1XXRVODWxqVzLb/26gs0SdBNbE6s6xWL84hlK3Pp1g
         8v8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777311544; x=1777916344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=3cm056sk6WacS/f3dQdyzoYHq033IVwGR9gtSW0OBkk=;
        b=HkQQCgeW/J5bjwqlFAqt3c2K4+usDQCq/pV8v1NnAa2fSf5uVwz6/gxrs3umSdLIBu
         Rh8JgfNJo9/YEWHZ+5uxEgQojQIQpJRz6a/ONL7dAjvshn2kk/q4iedH603D1iHWfBXD
         r6h5gdV1dg/haIC43XWQyDWeLyRCG40JNn+sb25uBryl5PFvbUaTONGdGAvvZ4cjykuq
         FE3snSx4obHDp7cPO7JX8wrmy2s6RMQY+2hbD8NVyzkGNlVWJKiuM5IJPcI3B9gLY82b
         w+dNjqixQBkfe4FwiLtJPELyuvlCzymdDQq92D5NraqbFFrsyscBqk63LyvfNKjghkaa
         +Fpw==
X-Gm-Message-State: AOJu0YwdYg1InvvLIv79HuhsYs1bZIzuwMMv918Tan2pXuErRPrdGd+T
	KzNpuKs46mEXzvTJdU3Ai65EBeyNZlouR6SqePuFGXz0BpRZ7wA+EL4o
X-Gm-Gg: AeBDietxvRgIZrPz6GXqRUw0wjbe4ccm/JUn6aZxSkljvEYBS69G5P0+VcNuEhJAjVJ
	9lMjdT/fu74XlEQwakfOVYfSLZO+esSabZgHpqrwbYbx+tJJ1DEEyIyCZgk2mYMfCjtB+Wqky4W
	We9hTifpuf2ob7gqQiyFCaeTHp/XVRBqcATbL0ipbP4F2d2+F14pFvtx1iwhwkbU20RaU/khmSC
	YNu8bEwMAYYwvgCyEUaOdNcMFd1lYsVkOGfiFnjd9kH1XJ+q6OZI8UBpKolIyEbriXnQ9uhlali
	tGvYd+C75KQUunRDOTdmBktnmzPsgyBarNGiO0w/u4zr8XCKtQsx32qQBw/8QBMv5Y3EO4uW6wF
	0g0s2r9VfV4IPjgtwxMT1hBYRVDcoMu9yAmCTAk65B1hTntISHJaO+47kzUTTJU0CxPtiSnwqDR
	htS76OZPM8A3xQhnKyPcrMOAxjQn8GtDNL638BAS54XQeIDhA7mNIbfn+fHCcf9/5sF1soCS4S
X-Received: by 2002:a05:6512:a95:b0:5a3:cc81:eff3 with SMTP id 2adb3069b0e04-5a746051aedmr66874e87.26.1777311543578;
        Mon, 27 Apr 2026 10:39:03 -0700 (PDT)
Received: from localhost (c188-150-77-196.bredband.tele2.se. [188.150.77.196])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185ad12asm8562762e87.1.2026.04.27.10.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 10:39:03 -0700 (PDT)
From: Linus Probert <linus.probert@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Linus Probert <linus.probert@gmail.com>
Subject: [PATCH 1/8] staging: rtl8723bs: remove blank line in rtw_btcoex.h
Date: Mon, 27 Apr 2026 19:38:50 +0200
Message-ID: <20260427173857.585742-2-linus.probert@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427173857.585742-1-linus.probert@gmail.com>
References: <20260427173857.585742-1-linus.probert@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Removes redundant blank line in rtw_btcoex.h.
Found using checkpatch.pl.

Signed-off-by: Linus Probert <linus.probert@gmail.com>
---
 drivers/staging/rtl8723bs/include/rtw_btcoex.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/rtw_btcoex.h b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
index 19764c80b8ba..5554118bbe36 100644
--- a/drivers/staging/rtl8723bs/include/rtw_btcoex.h
+++ b/drivers/staging/rtl8723bs/include/rtw_btcoex.h
@@ -9,7 +9,6 @@
 
 #include <drv_types.h>
 
-
 #define	PACKET_NORMAL			0
 #define	PACKET_DHCP				1
 #define	PACKET_ARP				2
-- 
2.54.0

