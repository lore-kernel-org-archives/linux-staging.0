Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39EB8562E
	for <linux-staging@lists.linux.dev>; Sat, 25 May 2024 16:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716652971; cv=none; b=RVjoaz9niWEZtJIA8K0TloNvLQZkRDD1BcfDRXvUhIe5N0UvoiSqaLiM9A31TwtOc5JtYqfKZClhBjaEjMaVrgg8mom9W6waz7Pcbfc/J8jnV02NiffGAXsn/v8qZf8lZLoZFXP4I95XMmXS0vVruU9T2ROGEc8ES0s1afkZwBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716652971; c=relaxed/simple;
	bh=2PocUIctJT1LGB/9mzIa0giFi5RIO4kYRtnrssDuAGU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=X06Eix3IRW+bzx3Kss/BIurqQFIRu8PQrx83kBR5ScOYQi88z4lEHquivoFAKAgPfOVA2VU7Hr2/0KrTVu1EMLw6ht1EAOt0+hbuBdgLuRt1e8QzxbClljjdjp6oivVWp2/q+gIDw479hiSZJkpvkrirMnMiD2TCH4GswV15vIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HEt3ABn3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HEt3ABn3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-1f333e7a669so30064505ad.3
        for <linux-staging@lists.linux.dev>; Sat, 25 May 2024 09:02:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716652969; x=1717257769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AViMprnRZDg8WlLNdCeKLRe1EXgWkFqK17wBJRWM63I=;
        b=HEt3ABn3+Tjk6PZgTMG5dbO7oOh4zJavRyATmc7c2+g5g4a6DphwICo2ZMGfKr4HhT
         43FZqHoEzZ0+Q57dGavHvCrkD8GAokno8exhJlgnjyWlMVLM5gfbvg48NpDvvjUv4vD8
         YPKhCDAWoTgAQq3EMZsjy2kZn9gw8/stNpLAAk6ZD3ifCk8AR71mYnKPyIZ50gNnLhIo
         cClKqbASx5d9DuVpZAnRqhJbKS7qH44Pgo0sUdkIEYVhDtxn6DIdSGv3jZetkg0Kg0v8
         aoYJJTdO6rYQazms91niow+vH5JWTmFGvKXuvKGKwzz+xmp9tQGwdMN7LAxaV8oCEb1g
         FDDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716652969; x=1717257769;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AViMprnRZDg8WlLNdCeKLRe1EXgWkFqK17wBJRWM63I=;
        b=tveDe78PeZfucJ0qRMythU2/lHG6iuSR8u7vNZckwLfw4P4qXKOWq0fFrMsEA29D5g
         KyYGKWlAjfN92PwQK7M6J6v4LtVMUmmMuPPneRzGLEOsoHjz2V2GZTRD1//jPT4+dVX6
         BQ2izAsjfVwvaTmVyvX89KXuGAuXx/7v6Nnd3H9wIKYwQx5VdDbyvF9N2Sh12yTtuXb9
         cpUQ3Eo1/DBj5/wHBhx3/UPfVGQuByClVL25MvS+Oyz5rMXiA1G5RgqvDQP+xHwypM7u
         FPr9OWnNF8qqe8zjZzQ0zcQ+oucpT16Qy2w1UocSOCAOUbMjB9GLki9GVzP0GVlbmChx
         MfJg==
X-Forwarded-Encrypted: i=1; AJvYcCWOnh2kQcKYkLGf5iBZJqfjDctpMKshPK56XMcJucktU0+nVIJOc0vu3e1VGULgAE5O++KhxtOeMMK7h3BCyPaEgkv27rb4bg0n8TGoRg==
X-Gm-Message-State: AOJu0Yw+j8IzJS2H+Uj5LsMRC8ID+ZLk1pzvwHd7IpO32lGVpXZO2qmx
	7xZwkRud4EBXJXPf+9cwTQqjN9aCANc5M6Qf6Eg+wEtqIbHDpK8u
X-Google-Smtp-Source: AGHT+IH8F+iMmwX9YKpALznoihMfYEKPSO49DL5/qynDmNyFDsPcSgr0VzrN329gKNRZCvIhdxRbew==
X-Received: by 2002:a17:902:7808:b0:1f2:f854:f59 with SMTP id d9443c01a7336-1f4486efeeamr39861045ad.15.1716652969053;
        Sat, 25 May 2024 09:02:49 -0700 (PDT)
Received: from ubuntukernelserver.. ([110.44.116.44])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f44c9b0787sm31668435ad.242.2024.05.25.09.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 May 2024 09:02:48 -0700 (PDT)
From: Roshan Khatri <topofeverest8848@gmail.com>
To: Larry.Finger@lwfinger.net,
	florian.c.schilhabel@googlemail.com,
	gregkh@linuxfoundation.org,
	ayushtiw0110@gmail.com,
	namcaov@gmail.com,
	dan.carpenter@linaro.org
Cc: Roshan Khatri <topofeverest8848@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] staging: rtl8712: Fix spelling mistake in rtl871x_io.h
Date: Sat, 25 May 2024 21:47:29 +0545
Message-Id: <20240525160230.66365-1-topofeverest8848@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch corrects misspelled word to increase code readability and
searching.

Signed-off-by: Roshan Khatri <topofeverest8848@gmail.com>
---
 drivers/staging/rtl8712/rtl871x_io.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8712/rtl871x_io.h b/drivers/staging/rtl8712/rtl871x_io.h
index c5b12f74ebf8..f09d50a29b82 100644
--- a/drivers/staging/rtl8712/rtl871x_io.h
+++ b/drivers/staging/rtl8712/rtl871x_io.h
@@ -62,7 +62,7 @@
 #define IO_WR_BURST(x)		(IO_WRITE_ | _IO_SYNC_ | _IO_BURST_ | \
 				((x) & _IOSZ_MASK_))
 #define IO_RD_BURST(x)		(_IO_SYNC_ | _IO_BURST_ | ((x) & _IOSZ_MASK_))
-/*below is for the intf_option bit defition...*/
+/*below is for the intf_option bit definition...*/
 #define _INTF_ASYNC_	BIT(0)	/*support async io*/
 struct intf_priv;
 struct	intf_hdl;
-- 
2.34.1

