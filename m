Received: from mail-ej1-f67.google.com (mail-ej1-f67.google.com [209.85.218.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077A83C455B
	for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 09:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780048796; cv=none; b=Zg/02/bBuEoLy3G/pBJ69DDYulBt/fMNXW/PmgJPrW4frxlLH2hLTGcaw9JDS5SeoX9Ap/IfuQ5qrma9OdU0hZCtUzTYcJGmUbpsKCjylsr+poGHHuX1j3bv25bOxFSgnGhfZsZQxrTfZSTlAqed79QPwvyqmLz68iga2Qmmy/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780048796; c=relaxed/simple;
	bh=Z13iah0fgYZloN27axeaNeg8odeVrpInbJUpU1neNqc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rdYtOYe8XEquTN6rjtSPMs1ebPXJsQcN3Rdk6VvbuastXBTSLcJrifVu5KkSRhuASuJJ3vOovXsqpGkMN7Hjaibe07e919quRw1hbHZ2bUL8Ge+xpCA01u1UThUPNI+hb1MTj4BlVSWfd6LSFd7UdWjEPp5xci2STGjdltJ4n5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nK0Y8dDR; arc=none smtp.client-ip=209.85.218.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nK0Y8dDR"
Received: by mail-ej1-f67.google.com with SMTP id a640c23a62f3a-bdbac72ac1fso1584271866b.3
        for <linux-staging@lists.linux.dev>; Fri, 29 May 2026 02:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780048791; x=1780653591; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhD72t7n02W8CcheYHj7oTZVSz5gEc4XbYNJzDcwR6M=;
        b=nK0Y8dDRq95tj84ghV1yiZjUYq5HcjupvGk/6nH6rJNvZJKhZ5DLVxMjMeoLyB6yLn
         pZgayQwi9vIc0E+xH73xJdAdOAXHVy4fgEiKb7lMdJU/vNJalMgb6bJhw3XuZZb5bauZ
         LiCrXZ6DaUoFN9wfHBf5vuG/ytB+jQv/iSoSH4YCjLtpxEcALNJAABEY4iPyHE5RM/c2
         7G4c5YKvFXcJ+oYyKPsZhWfg9PctKsTrcPvNDFJi/aixo887bUKLzAkkq+nQIEWG0U5B
         ZmxYwPtX5Zt27BjR889v/8GUvh8p8dKQf/HyU/8BFoRn8+j6K8GZrfjb6YMrPc1iHUyx
         AU2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780048791; x=1780653591;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AhD72t7n02W8CcheYHj7oTZVSz5gEc4XbYNJzDcwR6M=;
        b=JU+6T6dBIicngw+ugpkk9g3ZMeDBRH73oi7XxieC8ASyJZfD6l1kqs5mS/eIHrxKj6
         xMhI9UHOTphbGveMualjYCO6YXsirRBrZ2ineqT1bLA93Higf2kr34x5wpEPqc/laHTP
         s6A38tX+k3EPNIefxgtuip9x8+1pE1YAZeQWzFckAfGYybjG0QyyN8wbeeWnInDcu8+/
         P3575G/OGQmN9ylBFBrPuyMTeudzsn5aETMHc+nDQt+J484uAuvJ1X2Bi6B/ZvVLWTDq
         HPIloWzpPp5dSVjYbdJPbsNrhV+K67dEAoKllmP/SjG3l9JQ+UVzRL3Cviaz8oRUR32C
         rFqQ==
X-Gm-Message-State: AOJu0YwqdeedWnLRpf6S43fJ9pW7SjNoBTK/8H0JyDcAevB+Lr9C2+H1
	TpaRilJH+5hnIjY198NF0zKljUBTjSk/mRfSOqX+hF8gLMbij7n4a7M=
X-Gm-Gg: Acq92OHEU12E0JLSWDG2CWBoyAIenV9oORDeB0SgnmYoPVPGDILQ/sbq5oJHBqdEIps
	FFAzm+7AejFVI//LyWeXWjZOYCl46EsCfrbJgNGL+h1M7MxtfKscub2psO29lgrTbUU3DW7nL4o
	HKPZEi/5iwuU95sKje+5uDhuzR11BIWGx4LpO1GaC80AZrxFZjY2AxKvrL/rlTkbBEbaU2CddeQ
	ijErrGbZYP+OSMnx7OVSOIKLrg8XSpnZXKsw2PsJUuD2foLDkjStvfAJzFP6ObCCrR47F9fSsN1
	nqEwgxLV4ecAt5F8t9omwqY00LuWdMc9c22oPIdL9htfxQT3G57cdairkp2FYtLS1USefPcKifb
	JuwS6tS9PzLDNp/hU2bm5Q0GYSCG6b924Y+VtIDKpHJvY+REbt22HT0OZRPrFCXLoyFfgZmBPNn
	EJgsvHvtVy1d71fVM2sy5H/W71ma+oj06xGMEKGxIwg5/JHnIqYN5rEKyeH4A=
X-Received: by 2002:a17:907:97c4:b0:bd5:18e8:1ae4 with SMTP id a640c23a62f3a-be9cb3f43a6mr130767866b.34.1780048791075;
        Fri, 29 May 2026 02:59:51 -0700 (PDT)
Received: from archlinux.itotolink.net ([217.196.163.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-be9d2de53dasm52479366b.14.2026.05.29.02.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 May 2026 02:59:50 -0700 (PDT)
From: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org,
	Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
Subject: [PATCH v2 1/3] staging: rtl8723bs: remove unnecessary braces and comments
Date: Fri, 29 May 2026 12:55:01 +0300
Message-ID: <20260529095503.130909-2-phant0m.mail2023@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
References: <20260529095503.130909-1-phant0m.mail2023@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl warning about unnecessary braces for single statement blocks. Also clean up the sentinel entry in the sdio_ids array as suggested by reviewers.

Signed-off-by: Vitaliy Slivinskiy <phant0m.mail2023@gmail.com>
---
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
index c43a0391a..f0aa5bc8a 100644
--- a/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
+++ b/drivers/staging/rtl8723bs/os_dep/sdio_intf.c
@@ -20,7 +20,7 @@ static const struct sdio_device_id sdio_ids[] = {
 	{ SDIO_DEVICE(0x024c, 0x0626), },
 	{ SDIO_DEVICE(0x024c, 0x0627), },
 	{ SDIO_DEVICE(0x024c, 0xb723), },
-	{ /* end: all zeroes */				},
+	{ }
 };
 MODULE_DEVICE_TABLE(sdio, sdio_ids);
 
-- 
2.53.0

