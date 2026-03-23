Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D4573BB5A
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 03:10:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774235444; cv=none; b=tlu7reRvJEo2LubLWQciZ74HQNGdtyWQfgE5NcJ2BGrWkJ9M8r/0lMogS15zNN1poTWyxcmbhs+hee7DBDEI9DFOMlHKuEcps7kMdQB0H6zt1sOz33hSgqu44fbBzMxm1eYLwH4cOteThKcxKCH3gOS+4Is69PT353iUU5qX4SE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774235444; c=relaxed/simple;
	bh=Tl8ai5YoPMdzxlz3KX/dsK/wxvvNkB+javi2nxPrmVo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c2oTx2gG/htxqPzDv9DnEX1grD9JRM8iAGQt22Msw3ZDymehnXcKhGL9mVcKJ0F95bo3i3lnN2ZAm1Z7zFByRxl0VaKVK0ascT4X4zXcJ6j2wQzlBWtwcIGzVuD2dC2GXd+p0yvsItoA0lP372AODnwxEAYieNXLgiKr6o7ffWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=laez6+1C; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="laez6+1C"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-823c56765fdso1899188b3a.1
        for <linux-staging@lists.linux.dev>; Sun, 22 Mar 2026 20:10:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774235442; x=1774840242; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/0NMOz25SxriesEm3lplSiISeq9tICGAAYq075smODk=;
        b=laez6+1CeyjkMJlCWy0L4KcMuU4cF+SovzPClqhPPcVHL+OsiLdxS2u5wHIVhAaE+S
         we075d0ej487x9l/FcdDzTjVgzyYzxwRgCCwdfyVG1FH6H+9SU1TzXCO5qd3H/pGE4lr
         zhlAxGqX6yahEbQB+s6N0m+mN8apG0x+tuokEaFCDjyVUeSln4XHi+ZXK+bwCCjGpFr9
         LWyoAoanniBZ04i28npYLETdc2BzeUwhWAcefYaqZhWaxHOpRPmz0Jmn6dsb4pYw8Y9i
         sRisRB9aGvmMCStAxzVdC3C/8HnJ33lQbT5hUTqVXRm66FfIbnhnLogRUmOVzzMNKfGT
         kDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774235442; x=1774840242;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/0NMOz25SxriesEm3lplSiISeq9tICGAAYq075smODk=;
        b=G9/LTgD15NuRhr2r912sHiB2/UaX7aDsgAxc6oI9XSKucWIlrrTDwESisfjImuLKbx
         whN4kIWB+ZbK3BfVFPuGdJ2kSGXGutkcg7qU/LisKMQdkJErN6ud2vRCsbsF4z2xlcwh
         DA3w68TDUhAr51vLjruMMr0RR4Qso8BENN0S5sY5Xg3q8St77mgX2UR2kSsYXLHmVyGr
         LKN/nEeC1rheL1BH+UMhBPZcOpzto3Vr3oBldOJHwG/28AW0JWz7wcQk10r3zwXL8I9X
         Mttqo4gK+3vmHoL3f0pD/0JLk/wEENKTtS2SPPWcshr2b1uv6cofsIPn4j+P1WDCodD/
         P2dw==
X-Forwarded-Encrypted: i=1; AJvYcCVZXViUZfpAQcsmlw4CsTdnJOovywMOPG8aIdKsToFyTSRw+nqt/68B0fuM9sb4pI49DCy/upJee1fWOzUw@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1U35prYAgkwUG8jVn4U2Q/3LGkJaS9Fkl9zJ/gygbcs74QjXv
	JCyo95NAZoOGhfu/67pt7EOfLEOAbL0D78ZnIDmw323R/QjlzNiyonDA
X-Gm-Gg: ATEYQzxq5DZVU+4jyWm2yZp0fRet0gvEoE6ADGIoRIxx/D2dNP0uTXpEwzTdNVkIS/6
	CN/rx7q2re+Rnw+o37+Kz0XN0KpMA8LSXc6Cuouk4n+IhUQ0Pau4zzakULk1Qyw0QazVYKQMYe3
	vIty7UhnYgOU1ZpC3ynHqpcczipU4fm9CoM2Ot7JvGTHJievaJb2/a0tqN7hGdXQ8waztgddqQQ
	UB5ay5T//k+4ZTXK95/C2TYU5iXr4oAQP+uK4FrFf3htKhdtxGa2DnunigGWQSlWKCHgGvfpXBU
	D1qUvGK2pgGSgbfzJZudTsG4SOrSEmoZQZCTCwUjX10znSytKX+qRxOKQIu93eW5yZ99Fap82/v
	kBi+W/4Yzj0cGp+O1yZWaZMoRbXvpQAwIXRwqs6wsFvmG5ld/mPmPmN7thDcFwJxvmV7asF+qXA
	yKISKxubfAz/aY2YW3WiwFbyyMvILywtrEDavk3hb8T4tQ8OefvkOVdnWX3RXQoS1li66vhg==
X-Received: by 2002:a05:6a00:bc93:b0:824:98c5:ce77 with SMTP id d2e1a72fcca58-82a8c248173mr7708706b3a.7.1774235441758;
        Sun, 22 Mar 2026 20:10:41 -0700 (PDT)
Received: from study-kernel.. (46.132.178.217.shared.user.transix.jp. [217.178.132.46])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b040debf9sm7947058b3a.47.2026.03.22.20.10.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 20:10:41 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH] staging: greybus: authenticate: fix alignment and type warning
Date: Mon, 23 Mar 2026 03:10:17 +0000
Message-Id: <20260323031017.3650-1-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the following checkpatch.pl warning and check:
- Warning: Prefer 'unsigned long long' over 'unsigned long long int'
- Check: Alignment should match open parenthesis

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 3d2c6f88a138..ba4b16b04557 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -58,7 +58,7 @@ int main(int argc, char *argv[])
 		goto close_fd;
 	}
 
-	printf("UID received: 0x%llx\n", *(unsigned long long int *)(uid.uid));
+	printf("UID received: 0x%llx\n", *(unsigned long long *)(uid.uid));
 
 	/* Get certificate */
 	printf("Get IMS certificate\n");
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);
-- 
2.34.1

