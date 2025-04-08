Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD76254B1A
	for <linux-staging@lists.linux.dev>; Tue,  8 Apr 2025 22:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744151835; cv=none; b=KyLGdCntR+lNz0Ofe4QsDWzoyyaJVBwjRb7U6R9O7tPrMKgjLtqh9FSUY3VzDpFgWiTqJt31L1AZfmc6PVBq3t+Ti4wf+zQ1hoHnfvaBB0dF0ni61xs+pRnWeEZCkmUJP9XtiDrdoOstu5NAg8DZxsbqeJl34b2SRGfEFs19a3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744151835; c=relaxed/simple;
	bh=q9zf1c2z0k8nf25Gcd0LQ9hAl8FQJe2qwvY1PlNvQ7o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fLvOZy4qpk+R3snylhYj6rXdV+a4vORALRJYZLcghJ5R4Jnb7NfKOpCrrscZuqwBp8mDS6CZ8gxcFEow5lMhZqvC31pe/qmxO6xAiZIF0szCixQj2U9iTZ/SR7D1bQAXIH26w9PyveFrXTIxtCX25GmopOkTHFFF/YqMZz9ZYvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=BXt8phvO; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="BXt8phvO"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736b34a71a1so7182288b3a.0
        for <linux-staging@lists.linux.dev>; Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744151833; x=1744756633; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FjpQj5oY//AbdRKOiO0HjQ1j1RxhGsiWjsuoiFTCEiM=;
        b=BXt8phvOFclCj66N4saGMOhFTWNa7Gvwz39D31+p6SaaUNUg14lgWiA1O8Vz1w4Vhz
         MoOXLobHQ9mZBj7+M/V3qJ1VEIDCz6iUHTLgnoLNjhbkbsrSCUvOt+a7HwwiZXqBjnkm
         udgvV6mvNXhMn56l18lEOJodCLyqykT7tW92aHB00uyJKbo1FeL80RHMVcsIg/6pFL4/
         Vug2csrGVWD8emdKRsZEze9pHL6xMxB2GhhI+qx26rm6XRXDuUdVIaeNGUAVd/RIk7Sx
         rtH7xJDmefxSuAtCJi3MYr+cKykV3dqqtgSfKkAx1XTG5jdz4E1Rywv2F2mP3Xe2ALc9
         4ZPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744151833; x=1744756633;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FjpQj5oY//AbdRKOiO0HjQ1j1RxhGsiWjsuoiFTCEiM=;
        b=LFAdS5jA0EWT450GFK3iPfIxToMw8ARM0WIdmRbII4uZ+/IdzvyM5zXUV4CdzM3PAF
         /sEHIoelE2w5bX7nTtEx2NsS4T+8d/91Fhopm0Hl2Dre2qkRA1p3SBvZ1TfiOmRH6qP+
         uoLV2A/Dc8BzKnbBNqAXiULSIahY+6xzNUAxiESWr8b6Z3HE+6ogPLrOYTPRUcNrBrUV
         JuEF3FIhw3I9rtnGD+1bZyDZruGChA9oi88AbjbzxzbqUEXDB8asRHRveopt/vRPRDjx
         HsoKTDa3GneecdpognZWXGAXXu1OettMwu5hEW0R4Zs+4es+keUinUbKLpp+XH42yQqX
         CTJw==
X-Forwarded-Encrypted: i=1; AJvYcCXqq3F5eSKOtHQLYh+UYlAEUlQRz1230jQYi7Q7gBzNDrZ3huCiLxkxjNP0wFfDQGZJNwMfvFoCLn1KUu1D@lists.linux.dev
X-Gm-Message-State: AOJu0YzgV1yDn075pahX+cKIfcUObFXetMAKmKiGCiXf+dAhGDEHjROY
	ZZjNl8Rz6qgwAFa9WA6vDme47MdVPKjobtzkR5MfDBlR+Q2h7vUP1kOefoKAhg==
X-Gm-Gg: ASbGncuXtge87vMwqVJTZnMRhAkDewPm4lm1DJ2bvxtcmgfTEGC3LLCmagX/fm0Z5bv
	vsIKZZOTKGG3yK3ppgTkl7sYwd8ypeIscsLvuVOAul8wVKCIWzp3ZQ0pWOh5rB7I1GXJPYI7t/O
	/+r+ozhW8Hzeg1es3PxHVDakA1cUX9D/1EFhSmv6zmgiyC0oNVcdz+nOLReFCPROeMwYhHlKqPw
	N8/hA+DOq7pBjOOEZRcnFJR8DeJX8VW/JjkrJiEDIQdTtYVXBnUFWb1khW4d1ailr4uwMU6Clct
	urwG/IKLEXjDo0kmWq7wZhPNrHtScmsyl+ip2kYtWsNX0QdRD2et6PUnbksi/SIiF83KgIwehgU
	my3YnotDSmHWE4FZ9SVW7
X-Google-Smtp-Source: AGHT+IHcbqmqqD36HkzOjtk/zQqU6ShjZ7AuFw14mbVyYAOl6TqLnbSExYECmxIE4cpFwf43ts+GVQ==
X-Received: by 2002:a05:6a21:3103:b0:1f5:6a1a:3284 with SMTP id adf61e73a8af0-2015b01ffa4mr230407637.40.1744151833350;
        Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d9ea15d6sm11164546b3a.89.2025.04.08.15.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 15:37:13 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v1 09/18] staging: gpib: gpio: struct gpib_board_config
Date: Tue,  8 Apr 2025 22:36:49 +0000
Message-ID: <20250408223659.187109-10-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408223659.187109-1-matchstick@neverthere.org>
References: <20250408223659.187109-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_board_config

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/gpio/gpib_bitbang.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/gpio/gpib_bitbang.c b/drivers/staging/gpib/gpio/gpib_bitbang.c
index 7e85dd29ef93..c586f739c251 100644
--- a/drivers/staging/gpib/gpio/gpib_bitbang.c
+++ b/drivers/staging/gpib/gpio/gpib_bitbang.c
@@ -1206,7 +1206,7 @@ static void bb_detach(struct gpib_board *board)
 	free_private(board);
 }
 
-static int bb_attach(struct gpib_board *board, const gpib_board_config_t *config)
+static int bb_attach(struct gpib_board *board, const struct gpib_board_config *config)
 {
 	struct bb_priv *priv;
 	int retval = 0;
-- 
2.43.0

