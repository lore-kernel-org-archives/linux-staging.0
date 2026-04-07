Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B537258EF9
	for <linux-staging@lists.linux.dev>; Tue,  7 Apr 2026 14:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775572748; cv=none; b=aNqcXdIgCFRxos39/ZcNrreDsTso9fLeeQs6b6xEjJJp0LhSC6mklF3Aijkfo73deWNZ/AsSk9QpfAuC+V0N2t9qMIKx6sD+4WZSoN0JOnudzadFYvGoEg6JM1vxw20IK+E6q9UqBTNyh1zFtDDv4PRhEFb7wLF/5Mo0K6uI1rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775572748; c=relaxed/simple;
	bh=Ddy+2GBgq3icX9K7wH2GNcIbciSMRQBrmLkWbwzbD7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uDCIt45reBygz75j2HAV2PTJ968A419V8jO8uMYoLWLqYWWtxwBJF+Q/MPlrRSUStBhxB4p00MPE0YfpO0c+O/8ZkX+XPVPtIZ+v+X5HlaIBVTczB7MZo3CITJibrdz1fCOWtajJgaZpjC/+/ByWu2DXUxOHYkZbyr4hgE1P3CE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lbrszloO; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lbrszloO"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64eb84d1e37so4040818d50.2
        for <linux-staging@lists.linux.dev>; Tue, 07 Apr 2026 07:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775572746; x=1776177546; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AItauShGQVHVAiPOLYPBj+rdI5wU39yt09hn7zjwtIE=;
        b=lbrszloO56U4EOIKuP6FUt8L6o2JSCPgHTRoYo/To9zione8d/RPFcpxermx77FY4h
         CJbLkQPKMofNeWjJ5NRfWQ0B7Q/Gwz2xUAWgRrOhZ3PvA6Z0YXkItJyxOUF/fmU+9etq
         BCBo5k4uUasJAhCR+tCyT2OB3HVOfZzUcs7Bv/xC+CMcaljtu5fDFWwLiZusE0P6sYW3
         B3k7wHRDQx2kHz0OZPLkvrx7Ng4znZXGKx92TGbn7pYktWJpEpFBGyZZMxgDNcX47mrg
         8nSP5M2+4XRiAqyS6iOnSqIZsf7M6RBdgxaPBC2fL0Pc20hf8XQyoddu31XqYchs5c0u
         tmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775572746; x=1776177546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AItauShGQVHVAiPOLYPBj+rdI5wU39yt09hn7zjwtIE=;
        b=OlJQP7yfJbDC5nzPATigFhX8r9TcMJb+n2SF95owAZQBkA2wce76I6mC8pg4qndDNZ
         PLu7QMRPUQTiGhCJU6gZIecUiI/sbwZhHcxDThTc77xMw3m1dlAyB5UdGoJxO19naula
         fpgRQgdoaGjDm6wHiR0FVNPvA7pYtZqHQZcv14WINRPo3Kgl8/Q4E+IN/6SG2FepFpO7
         nY5JBLJXMW/9QbIdLyHSeq5y6PeMrpvxR+caRK2WtDAY5bcW/OXf9SvQ/1EErqqOlW6z
         WTuksUEdY2wu5pXp3nTRKsT8mtM0sAzbrK4BWIp7VisJWlzzEEcmd9mCWRAsmcUF3TP4
         uHeA==
X-Gm-Message-State: AOJu0YyObxBEH63wVsuK04Aj7K59KRq55FlWPBrLVh6O/ZG3fNUt1jvo
	5SJQUS72vrOKP0ofwSIXZmeYvJ8zRzDx7U9syhAIX1qDlUIZTLpWquUUt3a2lA==
X-Gm-Gg: AeBDieuPsfHUcbaVLDgCYJ695PeksUiKKoFkJR3niDG9GQzNipLqdcSomE+o8GyjLtN
	ooL8xFUPLVv1vRU/u8sU62sEfdv3l4gxqUigYwr4Jd2qg47ZlxrU7knFRmnR6TqjxXTmXv6HAtt
	kehov1bkcqUS1HnePJ28mp0VFow0xQ4eoXu53zTTY3Gjn/D5oigPtZwKFBv8BSLFjt8eJvwn7y3
	RKcBrmQYbfgJq78FP9Qn3I4lf8wfPHRznml+QfxdMTLgh52oqp60pfK140UvKr2S8yDMAD1LCVw
	k/Bzg1c1+nqOGaz6G4CU44vBg2iTEkwCXfmEoYU4MJztVQPaFhZ70iKS+uIX1sREzpobIavuA+N
	HU7Z73PLVPvUrEUgncf9SJrw39ZVnlv2ESt920jmZgt0ff6LQQm7C9yHBAmdbsmH65igs+DzcOZ
	4EODS0GpQigCWRjKt2fekMp9ZY
X-Received: by 2002:a53:c590:0:b0:650:1b68:8753 with SMTP id 956f58d0204a3-6504870ad44mr12067431d50.20.1775572746551;
        Tue, 07 Apr 2026 07:39:06 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6503a828f3csm7868159d50.3.2026.04.07.07.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 07:39:06 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 6/6] staging: rtl8723bs: remove unused BIT33..BIT36 macros
Date: Tue,  7 Apr 2026 17:33:31 +0300
Message-ID: <20260407143622.9767-7-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260407143622.9767-1-nikolayof23@gmail.com>
References: <20260407143622.9767-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These bit definitions are not used anywhere in the driver. Removing them
clears the header and eliminates dead code.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---

I didn't touch the BIT0..BIT32 macros because they are used somewhere,
and a separate series is needed to replace them.


 drivers/staging/rtl8723bs/include/osdep_service.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/rtl8723bs/include/osdep_service.h b/drivers/staging/rtl8723bs/include/osdep_service.h
index 99c26b446f72..86b321e2081d 100644
--- a/drivers/staging/rtl8723bs/include/osdep_service.h
+++ b/drivers/staging/rtl8723bs/include/osdep_service.h
@@ -47,10 +47,6 @@
 #define BIT30	0x40000000
 #define BIT31	0x80000000
 #define BIT32	0x0100000000
-#define BIT33	0x0200000000
-#define BIT34	0x0400000000
-#define BIT35	0x0800000000
-#define BIT36	0x1000000000
 
 extern int RTW_STATUS_CODE(int error_code);
 
-- 
2.53.0

