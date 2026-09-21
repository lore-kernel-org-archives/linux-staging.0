Received: from mail-wr2-f11.google.com (mail-wr2-f11.google.com [74.125.225.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E014F93DC
	for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 18:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790015619; cv=none; b=PCBE14D+ThI5HcwsY11cr6DoOYcl2WscPDhbzVKZXVlDQa5Cm9mtCdypEDq4eQvLkYOsBxWmdQPXb3hfaX09g0BPllbWt9QeLWLLzyvZ357EeafkIo/VCxz04V226OMkQCVUrfhIjdaW3W4P+JrdvjI3CyXXVUrVTSE3+1KKTBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790015619; c=relaxed/simple;
	bh=imLjrTU5t3+H3A0cVIp6sUg0tHEbyxjPqqF20TYdT/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jEVk6bvH6holvHv9ub8fOE5o/aKQPDdhJCjJEzzC6+kCcXmNMME5NX+wiUFLgzXRZA5GMjgFvaoY3GYM1oIHDS9TtwAv9Mdr97hPOmh+BhLAS97GyASD5xT4+bWw8PpyD3EpmLfhVxFLRHp0QxEar0L3xgIQRI0Xv9lUNC86qSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpSHTClg; arc=none smtp.client-ip=74.125.225.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpSHTClg"
Received: by mail-wr2-f11.google.com with SMTP id ffacd0b85a97d-48351e5bb47so1121677f8f.1
        for <linux-staging@lists.linux.dev>; Mon, 21 Sep 2026 11:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790015615; x=1790620415; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=8qwDua38LIyW1TawgxN9o1m0hOow5CaSBoRxma0znMA=;
        b=JpSHTClgSO1ogbwF8mihifnPwOocCuolL0Lfluu3nShf56Y9YUwHUSWIEa+8Ih56tA
         jK8NWqaGGJr0Or68t5FuD6nbjxEvJw/2gZu10PqX/t73cUt9ralhFjHLNbeQJ2D5lCUm
         RzkFhoziwnNdIaLYlytK81OIDtOWuGJWduE1uG3HqbMMEDbLbGjSQvA+CIzukRNM4NaM
         61gdVjvBFJly7K4u/7Ti6npw1lZbvsuO6cJ3Gmj7z/8w/9egCFE0Ppe3w9PnuacEBNo3
         BwZUUSAMK6Ihdle69gTGFR3ivAaBoSg7m9Ofr3ekwcT1B4NaloN9ljsdsGimVBRnNeG8
         qPEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790015615; x=1790620415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8qwDua38LIyW1TawgxN9o1m0hOow5CaSBoRxma0znMA=;
        b=QzrUD45tMTB9HakCXZUXZecza9o0gS5apNpeps/Oc0MJ0X3NDE3xsx9BXF00VXNO6o
         t0hwp0BCnsN2iA0VYq5cUsA5PxZh08sEoM0H4hI6SJc3PMh/TCsycVNcVpa/RoKrT+Uy
         L5ur0jz47zHj3VLivdHp8cyxwhpGRzN22hL0YDc9llJ3EBnn0QUNvRV4UMMXdLj13PYc
         W2VS+sXA5XuEs/kUEROxW7gn+Px8hUGQutJuKd2cssKaPGT8u0blwCrIp0Q5Vin/D+Kr
         GHp7dVfqhTMkvWxHTch4YrkIEE9CruuofXY4BFbnb3nef+3ML9b9XNUst+pbT/4H5m8v
         AUIA==
X-Forwarded-Encrypted: i=1; AKwUvBwMSVYe5I61RFh/MNFn3g4H1s+vRAl88QSdH6nq5xiR30V9YdM2+LhvsAhkuKoD9ZWX/eCbQoKZ25PAiKNY@lists.linux.dev
X-Gm-Message-State: AFuF++mxt31UgrSuKLDiyak2c2EDZ78dEqGx9gkUEsOupfJGSUPDh2dV
	/Ac5WDxyGweZjkNK4vz7Z8fz9sBuIGaHOc1Xpx9PuGYSv3d+XblSLvFKzvKj8e1Krdeyhg==
X-Gm-Gg: AYBFou0irwKubddZDXSq2V/myTwaMyYBw0IPx8m5oDBsYHr5MaiAABuMIDbSaXlZbT1
	gjoMaXIHkX+dBFY5cuBK6PwJpsjWsPg9gvXQIQDb9d5SYstt0l15taIb0lXPLmJP+bn8vppnuSG
	j5PnV4ZdCou8oO1i6KfbBFCsNIbbVMFL7rF+9saqPaP/mtXloAZxuTpQmXcUhUEfHItV0G23X1c
	XBIENnF5JBCnYYJdxgwAZJqEAMiTz3E2CO58rM2W0b7sKg88DA71sBp0zytxZEQXKJUv9ivCmmo
	Hhq+uSRJtCjIASgci0TsrCBQgL08X7CMtuXgokhXIyttkodpkruy3r5N4zeEud6Wkn8OU33iug8
	ufuPn0Us7SMnc59HpSvjScXVZH9vYLKgsCSDLApem/fELgPl1YXtbhkTmEKD51UBLb5rYeI1T5c
	S58VC2KzYiJ/rWRV+pg2Jw0RweCGhYW0PKqt098gQps5yI+tm4mbtdnNzAvNC6Q2KHpgrB3aoqc
	XJpdXGA8DxKw+gn
X-Received: by 2002:a05:6000:2584:b0:487:27f6:a4d5 with SMTP id ffacd0b85a97d-48727f6a645mr11933217f8f.37.1790015614392;
        Mon, 21 Sep 2026 11:33:34 -0700 (PDT)
Received: from gbox.chicasongroup.com ([197.210.105.26])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456ee4esm23679114f8f.21.2026.09.21.11.33.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 11:33:32 -0700 (PDT)
From: UgwuRhema <hikarialiyev@gmail.com>
To: gregkh@linuxfoundation.org
Cc: Andy Shevchenko <andy@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: fbtft: fbtft-bus: remove space before close parenthesis
Date: Mon, 21 Sep 2026 18:33:12 +0000
Message-ID: <20260921183313.92795-1-hikarialiyev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix checkpatch.pl errors regarding prohibited spaces before closing
parentheses in fbtft-bus.c while retaining trailing commas required
by macro definitions.

Signed-off-by: UgwuRhema <hikarialiyev@gmail.com>
---
v2: Keep trailing commas in define_fbtft_write_reg invocations to prevent
    preprocessor build errors from missing macro arguments.
---
 drivers/staging/fbtft/fbtft-bus.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-bus.c b/drivers/staging/fbtft/fbtft-bus.c
index 30e436ff1..38697992f 100644
--- a/drivers/staging/fbtft/fbtft-bus.c
+++ b/drivers/staging/fbtft/fbtft-bus.c
@@ -62,9 +62,9 @@ out:									      \
 }                                                                             \
 EXPORT_SYMBOL(func);
 
-define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8, )
+define_fbtft_write_reg(fbtft_write_reg8_bus8, u8, u8,)
 define_fbtft_write_reg(fbtft_write_reg16_bus8, __be16, u16, cpu_to_be16)
-define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16, )
+define_fbtft_write_reg(fbtft_write_reg16_bus16, u16, u16,)
 
 void fbtft_write_reg8_bus9(struct fbtft_par *par, int len, ...)
 {
-- 
2.55.0

