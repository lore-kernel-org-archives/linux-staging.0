Received: from mail-pl1-f196.google.com (mail-pl1-f196.google.com [209.85.214.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8E9219E9E
	for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 12:56:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739797005; cv=none; b=Z2Upyi0vmP8Bj26ciq5sYTIadSimXv9QS5sj/W+glAlvZZrZPXr9USLPuEKKwHIkUGpfsR99uf+FXqWgOMOVwAkcV/uAa/16x1g+ERo1D75KnU/jPEFBhvnoESdVW++ZaJXa9rX/+IeMstahPeWGx0ET0GshOxV2FUJdi9g6o8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739797005; c=relaxed/simple;
	bh=RzszDZP0yG2wXMCuyILVdPYmMGztwNcJ7s4yFtngP8Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=of/iHF6yQYjvcB2uYFZPxdhs0LRtWSBYB6jyiHGadBdRFwaYI+EwF0Xew+78T99vmybclgKr4SdjwHYNhJWxaR/NnJ0oBWf5LlAH6PJb1KAJC4STWsBRMtD+nTbknjZ9bwNT/hNZiDiIvdOiT5a2MUhTl0U7KgXpWbhMFVdbZcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BoDuqLv7; arc=none smtp.client-ip=209.85.214.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BoDuqLv7"
Received: by mail-pl1-f196.google.com with SMTP id d9443c01a7336-220f4dd756eso49023355ad.3
        for <linux-staging@lists.linux.dev>; Mon, 17 Feb 2025 04:56:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739797003; x=1740401803; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMv/zSSTQbD/xLU+9HCbjZPBCs+m5GIXQdkA1TcQxe4=;
        b=BoDuqLv7J83an5jzAl3+PY0RodiFPvv/KnbESw+pmFIofwpIqMKmpjwhB8nHNjedSF
         dzmFbkt8IZrcmtZdXCTx9PivnIR8QUag+092JDAurkZs2B7pDeQGX9mI+m9dbnxhJO5q
         TyA1hIj0ogCTRpCNPI/Uad4k+m0PpLbwnzelpLv+P1Lbl7PIGXyOL0pt4s54Im8A+2Fg
         GChLVb9Ks6bUIYtPbnx0X0YLBeIwxYuwS63SnsL0yvGZwiqpItewxRS4s6Ux/fptVaHf
         cyW0PtRtYg32gmxs+7uzhpkMvY6UvEm5ws8aH1UBOXotSGyYKlKgkilski2FQFX9tvjE
         SBLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739797003; x=1740401803;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMv/zSSTQbD/xLU+9HCbjZPBCs+m5GIXQdkA1TcQxe4=;
        b=cePdGjwi0/spFitR1AKr8jvQ23tiAFxRfAfSwVwWTO5IiBKV5ZWzTOBNA6aYgHoJaE
         orivDnm4kdrCEH41p/PJ2C9DSC+439GWW3oKrBxEAHr/Wprt3LruTFzbjaWQm9Tw9Kyd
         IhocRoKO+THAc4AsCFXpnRbwbsGg5/Dpxprb3A9QAjrD1K4eFDUgS6buiwtldd9l+cNK
         Y5VG3zwtbqQK2NU82O9fNndavr6fzCcfA2DJsj98I7tUipAz5jIJ+eFr+pbK4Ann4oCV
         fYWRPaCebX4OmjjIT+ojZDMYg5N2OY7NE28Fz5/n3WKD1AV7isSnYqRZZhYhuDsbILb2
         tzzA==
X-Forwarded-Encrypted: i=1; AJvYcCUbweb+0umvx8h83lnOd1DQbqTQ5STIEU9sZ1gH9xNtEdVuHnUoR2dSba92eWP1elv4j1z8yXFpNrgY0Hy6@lists.linux.dev
X-Gm-Message-State: AOJu0Yxu19DrdX8pXSBsnOO9YEo1ft3TT8//UQcy89qg7yxaV3VeKUwo
	0l8djO5ivz2KZsIENwKuHcf3/d0A52gCUFv9nYMdzwiIm3yOe6kn
X-Gm-Gg: ASbGncuZ7N7P0/R59fVZuGGdXeIngbl6MRc3BB9CRsQQvdFVU7zY768TgcKoeMDHPW1
	Q1gqWJ6H7xEYpOp3xf4TcuSofAyr+GRUYPJ+syj9NLaZkg/t26ewiV8H7syOLs/V2PTh4spf7RT
	tWS4Wz/hQ0/ct9LgbJsvQSy7mFL86d0m29Fo/P3zfzSxZfIwemE/KoyMnwIzb/v4g8RMZqOehEe
	nmV5cuaBmhpDS6CI1Mu8E2xtgJObilRlS/5pEo7s8oWbBHKsBRi7rpsOc2OVQsl+qIg6M+vkrzj
	rqUN75L6XyYMuZJ8dG8Q
X-Google-Smtp-Source: AGHT+IG7RfJ78Ke3TOD7UhjYlnkWAAzlWWZixmgLKPiIceLEOn28Akbe2ZRpNs/gev9QvJ6MiFecKA==
X-Received: by 2002:a17:902:e545:b0:21f:6dbf:1850 with SMTP id d9443c01a7336-221040bd704mr164901815ad.40.1739797003521;
        Mon, 17 Feb 2025 04:56:43 -0800 (PST)
Received: from localhost ([2409:4066:d04:319e:1d76:db25:b6bf:4f52])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-220d5349047sm71475415ad.7.2025.02.17.04.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Feb 2025 04:56:43 -0800 (PST)
From: Ravi Kumar kairi <kumarkairiravi@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	kuba@kernel.org,
	rmk+kernel@armlinux.org.uk,
	broonie@kernel.org
Cc: arnd@arndb.de,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ravi Kumar Kairi <kumarkairiravi@gmail.com>
Subject: [PATCH 1/2] [PATCH 1/2] staging:gpib:hp_82335: Fix error message format for invalid base IO address
Date: Mon, 17 Feb 2025 18:26:16 +0530
Message-ID: <eb8368ee9fff0076ea1f97d154ff2b07d2fec572.1739794938.git.kumarkairiravi@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739794938.git.kumarkairiravi@gmail.com>
References: <cover.1739794938.git.kumarkairiravi@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ravi Kumar Kairi <kumarkairiravi@gmail.com>

Updated the error message to correctly format the base IO address using %#x
instead of %u, ensuring it is displayed with a leading '0x'.

Signed-off-by: Ravi Kumar Kairi <kumarkairiravi@gmail.com>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 451d5dc6d3..f1c2045570 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -274,7 +274,7 @@ static int hp82335_attach(gpib_board_t *board, const gpib_board_config_t *config
 	case 0xfc000:
 		break;
 	default:
-		pr_err("hp82335: invalid base io address 0x%u\n", config->ibbase);
+		pr_err("hp82335: invalid base io address 0x%#x\n", config->ibbase);
 		return -EINVAL;
 	}
 	if (!request_mem_region(upper_iomem_base, hp82335_upper_iomem_size, "hp82335")) {
-- 
2.48.1

