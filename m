Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15CB22DEA60
	for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 16:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753117021; cv=none; b=hBBsz5r0MdAgLxkk4IJUblMJ8wt0kbYbLjfqdWRZGAO029tkJpuxHM1UzmKX83CyXQZ3LjKzr1jpZ7kW9r6kkLLIITDv6wDkGyUO/OpNifTYt/ixcNsIIkUzyJkxslGtiZDmUPtdCVEqKGBtYrze5B9e4MRuaB44mbMR1DqSn44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753117021; c=relaxed/simple;
	bh=5ikrG52niIvSMqEoDc/5U2cdAJ0QxIU0RIVnhtX/YzU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WyPqlqDfrTNnUJPld5ttkwco35GpdDGU4hQX24J4O95QyoAzxXkOCTnAo92NEC2rZbvq7L3P0KWPTo3i9oP1lnEZFQ2rXMZ7dieB6ldC0AjjLxyRyU7oeRs62BwE8fFj2j2KRAu+dODPP9+1i+FTRyGTzt1y0LXdhcEeFnIBYlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bo/ydF0A; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bo/ydF0A"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6088d856c6eso7882756a12.0
        for <linux-staging@lists.linux.dev>; Mon, 21 Jul 2025 09:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753117018; x=1753721818; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KycE6mEc0YN9C10a1qOjE8F0swLnK7OKIA1QKEpWqxQ=;
        b=bo/ydF0A/GEtwokMjK0e0ia6hq+3sxvhhMuTWAsAaAa9m1mZJm9MDP6/G1oFjJyaTT
         +dEaCdILvYvULLOl9LzDfQJojnN/YLzCr8uZTycZR/ukrq7vxSYE9gGbV16zQpHOYKuX
         L+bhYHJD5XU92vGluPFpsH076NuYsWgvXtRSj0QsWZfSHpIEz0jaHN56reYJQVFFRuy2
         qrzbWyb31ERMYPV2lSrYxaR9u6CHADUDNJTt//ZzxU+DoocOK7AEfNpJ7GAY8K+AOLon
         YJdlAgucCnu5MUzIUtf5Uj7AeNG/8x0b5dJAB9ns0YV6vlDeb1deKOcOtXie7amDoUAa
         IFBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753117018; x=1753721818;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KycE6mEc0YN9C10a1qOjE8F0swLnK7OKIA1QKEpWqxQ=;
        b=B1DODXfCqSY5QJM3B6P7Ri2zVnATCUlJe+55uBIVBkpO6KnvYvKA9wAEJZKXWLO7iO
         nA5HlDGyz6f5zyjQJ/m5J9VOJq4VbTe5fA1AErZJ9tRx3X79UFGkV8tM1/fP2GxXU645
         2yR8w5uX6LHqnr3eWthpvyMMyghhqeOg23viTTt+xK/JuLp9t03OiMn/R9v61CJRrbB4
         GjNZHjzItue3M/HPzxi+tqfrVsOE5NdEXDLyhIhPEYCioNOkhd/z86deSlHQcloatIVd
         TI7lndbHOhCdiWYgtALEm/9N5uxe+l+itaRw5+zRt8yjexNipB7GMeAmo0aPmyIQnLkF
         BPPA==
X-Forwarded-Encrypted: i=1; AJvYcCUVHoMmg7ePoBGBco6ZLxMgSZ58z3vn7pnKLhDDs4J7+CPxCpMtTMRoYoD2gG4ni5KDqMGYepMEUBWrqXBZ@lists.linux.dev
X-Gm-Message-State: AOJu0Ywq4Kz79C1XeJ6DC22aNXE2RPgp48I7fOrrkSVZ8bSxOzKU5e0R
	/Rbs56iICLo6VV85VFfGhXcy61nM6Xa5rqv5cU8bfSHSLBE++gwufRh3oFHLVeuh
X-Gm-Gg: ASbGnct8qg144r6+rTyjbeTP9Kiiz9Jo+CTSrG3J7CNlvxhPF/ay9R+0LuzGpM7N81X
	sBK29RZvfQCV6+YlNL6ZmbX5FR6ENOqE/cJXMRCuAavZDIAk/Ai8fDsXoadHjBjMpTsKm3N9kns
	RUt/O95tSOqTJIBjO8DqSaS3Cwm4ZvZ/7ZPSS8Q/PrgM1AJiY7V+JI7BQut3BXYwyUbzFN74xqe
	LNZthiDrYPREkZ/1s/fJLnCtYdVS5Dntu3G5emjYvm/l3BvS1wrXMLXr9xfB328v7u4rwdupdEy
	wePfoON8LiYIYXmpqyZOoBrrfFRjUxpTy3zKITlIvpp8OPrKMNtfqqSfjJvpDOa0N5zTTS+GVFv
	hctFslOVCNwrcScISx7CvVsTer5orBw==
X-Google-Smtp-Source: AGHT+IFkLM6d9KiheRng+f/N6qM1dRFv6Q1xvfQ+tsyi/c8iYXWk5mjkRBH/6jkO2tpQ1lBBcrJCZQ==
X-Received: by 2002:a05:6402:321e:b0:607:f082:5fbf with SMTP id 4fb4d7f45d1cf-612821361b0mr17683589a12.12.1753117018310;
        Mon, 21 Jul 2025 09:56:58 -0700 (PDT)
Received: from zephyr ([77.237.184.54])
        by smtp.googlemail.com with ESMTPSA id 4fb4d7f45d1cf-612f15f596dsm3923507a12.51.2025.07.21.09.56.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jul 2025 09:56:57 -0700 (PDT)
From: Ali Nasrolahi <a.nasrolahi01@gmail.com>
X-Google-Original-From: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Ali Nasrolahi <A.Nasrolahi01@gmail.com>
Subject: [PATCH] staging: rtl8723bs: remove redundant semicolon in basic_types.h
Date: Mon, 21 Jul 2025 20:26:39 +0330
Message-ID: <20250721165639.10078-1-A.Nasrolahi01@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch removes a redundant semicolon for
the macro SET_BITS_TO_LE_2BYTE from basic_types.h

Signed-off-by: Ali Nasrolahi <A.Nasrolahi01@gmail.com>
---
 drivers/staging/rtl8723bs/include/basic_types.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/include/basic_types.h b/drivers/staging/rtl8723bs/include/basic_types.h
index e2f203910be..640db1e79e7 100644
--- a/drivers/staging/rtl8723bs/include/basic_types.h
+++ b/drivers/staging/rtl8723bs/include/basic_types.h
@@ -162,7 +162,7 @@
 		(					\
 		LE_BITS_CLEARED_TO_2BYTE(__pstart, __bitoffset, __bitlen) | \
 		((((u16)__val) & BIT_LEN_MASK_16(__bitlen)) << (__bitoffset)) \
-		);
+		)
 
 #define SET_BITS_TO_LE_1BYTE(__pstart, __bitoffset, __bitlen, __val) \
 		*((u8 *)(__pstart)) = EF1BYTE			\
-- 
2.50.1

