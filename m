Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EED9258CC6
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151124; cv=none; b=QoeKG27hTYwLrTK5yhscUmv455sL8jS3JNWNyJ9F1XngDda0SXj88h7FeovJb7Yb0tA2NwTatDhm16RQ8QbxcRqYt2kQMj3y2jQdwqbob/aBYtMSU8BvRLwW6DE3TSZej7eMAjtkFpzKbshcmfFAvseo66OP0BJUmuLiGpoqBnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151124; c=relaxed/simple;
	bh=5NwJeDoAtrf0Tx8RIS/c29EngE2LsKm8AYPS+TzPKUI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VGPbjx78QH3z9achOn9AnntbK0BC7sBK5kip3J/Ttu4TJi7Dd971ObjBDV+7rYaYIf0NphB3a63hhcAN1R8sqnAf9AmfODVQeHkTZNkxJ3lFNj1MSEGT18tKMYGMYetI4zqNMAz1W3PvfjvcSN4+oVJIMRPNkaHybS8ISgMklEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=gv7lRpeT; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="gv7lRpeT"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3014ae35534so5047731a91.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151122; x=1744755922; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ed/nYTgwq2fOD1wKZMkQ0lXU9nmr1lfpOmDa3UEGBR0=;
        b=gv7lRpeTreVk2zXlBLjAKc+jH/8SHp2BL6+B6FjjXTGgxtO2esWMG9n8hGNDJaa7hF
         AJeTnpSD3GyP8JFX8zbLSv8mvITmwG8uYtMOqCBzgaPK9L+ufS6Lvo6IclW7hOh0cFGQ
         8wycF2lDrRrLkSwGfjVDOp405/stak+yJrffIFJGTfr0vYd4ulRqkIrDlSZwTbYzeZzp
         RMNc8jdYFigqwLy7nyEq7NXx9FiovJM9A+sKFH2/Wv/YKVDpWVPcUaRdDJjwTKSJF/aD
         5tqlBID6wxjvCQ9+f6sL9WLfWmYx683UusHwdC7hrj9LoXr++ySVvLl/ZoWg0IiuiTMx
         rPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151122; x=1744755922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ed/nYTgwq2fOD1wKZMkQ0lXU9nmr1lfpOmDa3UEGBR0=;
        b=hQsx2gr0zGZji6LkMy9PS1omAYBSiiTB/G2ccs99mETtsNWYNrbWz2b5qxOKjyaCSM
         yysNvDL7lByTZwnNBU9/3HqVT5xkEurCXGKM0UYuRmrCCQh2aO+HvE8P5PfFiTraLwTv
         hkVapS/A3UUhD+6PX7pzsSkLiv6peUxfhhx5bywAPVtRGQBCM2oYVjUqJgAfJU+Hhz7a
         1/Mr8osRssTrzr7LMJNdy37VudxzpkxbzalGEVqynvoCXovKhQSdipqbdGVXdkJD4rx+
         ok3QRD8nn6Q2Oi9PLY0LNUuQ646pKaeiDn9w6ZlSWJ1XLmEGS782cmR5Ubv/knMdH6XD
         T6bg==
X-Forwarded-Encrypted: i=1; AJvYcCW0G6MVvYBKx1pQg4q+4AOc9coh5vbjYwdpQ28ljQ+OprB+wwP+rM8FPWJgbTMSuTjBWKoYJSXogESHt8ZE@lists.linux.dev
X-Gm-Message-State: AOJu0YzuWhs4+I+BTZ4j6ZL+rRzGFnmdObRZb3H44VCp3xutQr2zFvE1
	Jue3SBcaVLp0nX+evMEvt72fi0on8R/6DgFsrrpJL4EpWhK4dByQ5Y8722KTIA==
X-Gm-Gg: ASbGncvEbxSVPXukR2HGq1wOTlEAedcwdyLayHwGx/fV0KkFUXxxpzxsf8xTqyFpCzG
	NefFhR39lcMNVhmnF8rocC2v/aUPrq+XaKXX55cuCmpFrjVacTaA1E+ugs6FQrjaxbmEm8Df1cx
	R4zY3lFpu5cnT2sRns2+aCpKEA+JhPm49mkp0tPqyEKoqUDrLG0wsVfzGDyREXPx0l2UaeibacN
	B3FyNpaFdniEngVZgbrbo3G2qM1JhmZAh2uJpXe+JDJH2DNtV7Vh8EpqA5l2VYcJW7SXrRHjYqz
	9sBUM8kixgWX0Zjf5LQUI/UMSyK3+GF4Sbug9BJPg9R/Aas02ziVV+Ei1FiDepquJruIpTQrioV
	E9ZRKI3dOgtWriXzA34Vr
X-Google-Smtp-Source: AGHT+IEluinBJ/WzRKg68aXx+kL4SHWDvkm0+46g2cXPGj3iEdxubNX0IJJK30XCGqi85flc99q6Tg==
X-Received: by 2002:a17:90b:528a:b0:2ee:e113:815d with SMTP id 98e67ed59e1d1-306dd51da88mr230912a91.8.1744151122327;
        Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd04e9a8sm105050a91.0.2025.04.08.15.25.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:25:22 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 11/18] staging: gpib: hp2341: struct gpib_interface
Date: Tue,  8 Apr 2025 22:24:57 +0000
Message-ID: <20250408222504.186992-12-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408222504.186992-1-matchstick@neverthere.org>
References: <20250408222504.186992-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82341/hp_82341.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/gpib/hp_82341/hp_82341.c b/drivers/staging/gpib/hp_82341/hp_82341.c
index f52e673dc869..775103d744ba 100644
--- a/drivers/staging/gpib/hp_82341/hp_82341.c
+++ b/drivers/staging/gpib/hp_82341/hp_82341.c
@@ -410,7 +410,7 @@ static void hp_82341_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp_82341_unaccel_interface = {
+static struct gpib_interface hp_82341_unaccel_interface = {
 	.name = "hp_82341_unaccel",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
@@ -438,7 +438,7 @@ static gpib_interface_t hp_82341_unaccel_interface = {
 	.return_to_local = hp_82341_return_to_local,
 };
 
-static gpib_interface_t hp_82341_interface = {
+static struct gpib_interface hp_82341_interface = {
 	.name = "hp_82341",
 	.attach = hp_82341_attach,
 	.detach = hp_82341_detach,
-- 
2.43.0

