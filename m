Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CDEE2BE7B6
	for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 13:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359081; cv=none; b=d2Y99V96WB2zlIpqSQ9MtVXKXtGe0IZ4YOAjnUpBOwzQbcqJN5pZ/PQ6s5srCcl8n3LkZjdIcX97ol9qP1HkIkocCthu6ZrqhHicYvUv5MhR64nYpPcfJYSiOJnTAiAj1+8WRKuyDVPnuFdtWvWc3m2LZqcmSXwcmgTkuX5B0cA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359081; c=relaxed/simple;
	bh=Xd637m6SmDrcu+ks4PdjEqSvFZQfDLlVLI7/ynfi+2U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XgbK1KJYcqr99t3bnzCZ2unklR3hhBhIgogLH424sDFGNZKKvTKEDj1WCcfFmJ9wKYmUKYQx2NX6za3WPXXF6Kbad5hygoVDyQ/AXI1f6FUI63E6b+UnEYIgPAub6TGrjn+PBQWFNlf4yDtwqeY8IcW9hrzGZsDAKI4Dl831PUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eIt985pN; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eIt985pN"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2aea8c13d94so11899955ad.3
        for <linux-staging@lists.linux.dev>; Tue, 24 Mar 2026 06:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774359080; x=1774963880; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CkKxioEiq3QhTBb4CGR63rNkUodusJuI0Yva2C8kszg=;
        b=eIt985pNVDO91NMKR7fy0s3Inx3mfMnSl56st4Gg2HtFHCMaGlAAi1h/8ZSmQcg0hC
         JQlzwVq6Abwfk2BOZb1AR9/5Q5n+mqCnBJ89lkDKxMlNU0Zv9p28tVkIpHDUB0lHmOuv
         RALd/XfyDrWdhJZGbNvfTkyiTELZ4GdL5JotSkHFpJgsHtaQB/w6JwQTQvUls5Evhdz+
         oJUESfrA+UinAAv/6xbNIoaSQ7ASa7PTNWhv5XtWkcKtXUldT+ApxAY4WbDi9a2oYab1
         2I0B2NF2yQriCoBiMBTXn+/YGVJ1SVLpo/Rbt8uj0F2MXbY5EwZb/VjDFKm3PJ7sMFJV
         je7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774359080; x=1774963880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkKxioEiq3QhTBb4CGR63rNkUodusJuI0Yva2C8kszg=;
        b=lIflKk1jVTArYQebhMZyTeQaHgZHJwgqQUHTIBa5iOZYl9Wx0I2SPHWmHserQNTMPk
         nB/RalcAq3J7UBQOHcL+3Qe5BJO5aoS2Krry0doAfMEh6Ur+JrjFYcfL7U3OWFWD2tSc
         a/S6aBY3xuX21vfGOrlvOEQQoEXar4M4GaBq8pcRawXQYdTCjT2e98A/d6Es+J8vF+jX
         2eLD2WPMthKKWOO1Sl4hZVeMNlPOtvriKalKRnmBTN3LikWiLoc63CRbCK0uMJTsOHfZ
         b8kuqrOZfHsz5q1wNrEDqQQKmJE5I22bCVg49I6ufw8y/Ad36EmQU9upnEQnq1pz4Fnl
         Ddjg==
X-Gm-Message-State: AOJu0YyfZmIyvxP/tfWn/PoO+uxFJSJEpG6Vjyz33KOJeOJNRuu6qZJW
	Yeql+/JJx2PGq/866Zfu1z0PdBNDR4U1zhVGpyZ8pS24JWczRi9MRK1m
X-Gm-Gg: ATEYQzxkZ61BRQzj51j3tR5gDyDOfywtD7F+1O/f59tBWgcdMM7XhOOjyT1KZnAtXtT
	FyaH1xcvMInrhqk7k7iZI4VxDv8EmcRVHDtSGjypPl/VTRkXazfOJ9LrvucxM4/u8B3BUluTqcw
	FgoKgTfnSk48suV78oflP70LBAXxk8DtCflAXqvLCCkl77+NWn1N1VlFpA1tHr2UEQ9R2YoJZEK
	YTD6dyMKQzEpBhf3RylsvkRFTAj9DIxCs8UOr52qBOeNuLQNTbOJvTowioFm9L+fBYHaLfM8JUI
	inT3G8psIvMmQPunt0FAYnVD+hPxD79FoNDbL79YPfzjeBjbN3DQApWp8x27BrVT76ZWPsOj+by
	1ldh3UHKA1fvViON2IsTEukpHDpEizVoSIiHHB/s9aGpJUF+yaqwlw/EcaN4K+78/Ls3HNwdhEu
	nuE9mx69vbAhjMvwySo0aaYnyHFDApQ6BsvFZOniY=
X-Received: by 2002:a17:902:db0a:b0:2b0:67cc:adcd with SMTP id d9443c01a7336-2b0828263abmr98614445ad.8.1774359079690;
        Tue, 24 Mar 2026 06:31:19 -0700 (PDT)
Received: from fedora ([2401:4900:bdeb:4823:b168:4102:56c7:c7d9])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b08354bb76sm147526535ad.34.2026.03.24.06.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 06:31:18 -0700 (PDT)
From: AyushMukkanwar <ayushmukkanwar@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	AyushMukkanwar <ayushmukkanwar@gmail.com>
Subject: [PATCH 0/3] staging: octeon: add pr_fmt macro to ethernet drivers
Date: Tue, 24 Mar 2026 19:00:26 +0530
Message-ID: <20260324133029.82764-1-ayushmukkanwar@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add pr_fmt macro to three ethernet driver files in the octeon
staging driver to prefix log messages with the module name,
making debugging easier.

AyushMukkanwar (3):
  staging: octeon: ethernet-mem: add pr_fmt macro
  staging: octeon: ethernet-spi: add pr_fmt macro
  staging: octeon: ethernet: add pr_fmt macro

 drivers/staging/octeon/ethernet-mem.c | 1 +
 drivers/staging/octeon/ethernet-spi.c | 1 +
 drivers/staging/octeon/ethernet.c     | 1 +
 3 files changed, 3 insertions(+)

-- 
2.53.0

