Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E88628E07
	for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 19:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705605384; cv=none; b=kSqhvJ1FSnIbaqJeQ8Q6GUmExTmeERw1Slf62m0bU4GsCyVSeADpuiAPuiiO1vzf3DYEvjMW7NemmTqrkQ6rllrBwRxefXORdiy46NbXPktbejG9qRcgVFVGYUgF6PxtgTmxoGBOjItLGjzHSDVH80WZ4DIZjTLf1ZUTV+j34yY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705605384; c=relaxed/simple;
	bh=N6PD4Pn8xXOy0winBMEC77MBySNJREQE9WnU3qOPXNU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=p+aVdX/GaMStEc+ET2k/Be5UhKiRmX3CDMt2oFd1ClskJ5PZb153mPs9onUsO8gsyqsitDm5CN9sBJ7IBb1fjatOR25Og3XpvC36odKSwVYn75SNIzgGLCjvtbiCFip4d0fYtmcD9XKVzXHHmMQeZOf4kKaGjucJeAfgDsHGgnY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvxKSJ1a; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvxKSJ1a"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-68155fca099so40556d6.1
        for <linux-staging@lists.linux.dev>; Thu, 18 Jan 2024 11:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705605382; x=1706210182; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VwsWXj+/LmbABlQqMCfmA7LGZR+IInP1jMSwsO/WAjk=;
        b=VvxKSJ1aGo1lxCtFk5ngZK8QC+udAIHJgwse8Hz6DECdpSEJ4JSQX9VEuTVjl3qAyP
         Ca/bUG+OcqfPR3F3gNuzRdrCiE/BqGavMwjhVZ4ACwWWt58GJy0GaHy2KomfmxfnWPIP
         j7GDTf9O80V6kYivDUG3EKJgtSxT5O8AiGK+p2fxXHTj3Kg4Fz2iUZi06+zng3Je6HCc
         2yf8zTjrh6g2diXx6fIP1L8hf288KrKoBat62sazW7Ty5iG3KhTvnWpQIhhWn4cdj6Ut
         dqfvNnncd4XddCH8NXF/As+PD5pwFUVXtS0ik7B10+z0xb5uEhMuSQA4zuszRVUSCIlF
         wpSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705605382; x=1706210182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VwsWXj+/LmbABlQqMCfmA7LGZR+IInP1jMSwsO/WAjk=;
        b=ZVWUVbzFBysw+Ir/VDG6/7UJRfZ3nIuubbNAyrN0sbZj6Afbj37oFOzSAVG37Nfick
         H2A6YMTQdMeDHu4P2XcbYy6u1FoV4iI75mWsYCyI8rsz+1WzSatBjLiQYRSeCUUbiTQ5
         Yb31PjlTTKOT8Vjxyb36kct9dxWgk6tGQqCeX/jjtKS7OWMAoqc+q56rc711E028GY0G
         nTB8a/uMO4WvnNHriVF5l0I/OwHn7QK3TIT1G37WzpVM/tXSmgQixXffAymfqn5VfukI
         Ow+kzqRK3wSBa+C8NoJ/xx1sJkVNC/aRzPAwa+nIQAv3f+xtwezKYJl8THSmkX2me4/g
         g+Uw==
X-Gm-Message-State: AOJu0YyEb+KM4f5E7tI+/AMsvbEzkikXmCHQtjVmXpx4J9R7x5uY5YkH
	F7H01gEmjQCs2nR0dGDqTCvVVF7r8wuhNxhSuEU8PB03tT2Fcom2
X-Google-Smtp-Source: AGHT+IGknJjns6pk5kfe9DNG6dAYa2dEE3uGt6EfY2L2Oyp98/vIPpgsItT3n+9iiguWhpWTg5gMzQ==
X-Received: by 2002:a05:6214:cc6:b0:681:91e3:919a with SMTP id 6-20020a0562140cc600b0068191e3919amr2419003qvx.1.1705605381946;
        Thu, 18 Jan 2024 11:16:21 -0800 (PST)
Received: from me.mynetworksettings.com (pool-74-98-201-227.pitbpa.fios.verizon.net. [74.98.201.227])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4452f000000b006818004d4efsm1428290qvu.126.2024.01.18.11.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jan 2024 11:16:21 -0800 (PST)
From: Jacob Lott <jklott.git@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Jacob Lott <jklott.git@gmail.com>
Subject: [PATCH v3] staging: rts5208: Add more details to Kconfig help
Date: Thu, 18 Jan 2024 14:14:26 -0500
Message-Id: <20240118191425.88826-1-jklott.git@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The current help text is short and triggers a
warning from checkpatch.pl. This patch adds more
details to the help text which should provide better
information for whether or not to enable the driver.

Signed-off-by: Jacob Lott <jklott.git@gmail.com>
---
v2 -> v3: Fixed spacing and newline in text
v1 -> v2: Corrected line spacing based off feedback

 drivers/staging/rts5208/Kconfig | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/rts5208/Kconfig b/drivers/staging/rts5208/Kconfig
index b864023d3ccb..c4664a26ba3b 100644
--- a/drivers/staging/rts5208/Kconfig
+++ b/drivers/staging/rts5208/Kconfig
@@ -3,7 +3,11 @@ config RTS5208
 	tristate "Realtek PCI-E Card Reader RTS5208/5288 support"
 	depends on PCI && SCSI
 	help
-	  Say Y here to include driver code to support the Realtek
-	  PCI-E card reader rts5208/rts5288.
+	  Choose Y here to enable support for the Realtek PCI-E card reader
+	  RTS5208/5288. This driver facilitates communication between the Linux
+	  kernel and the Realtek PCI-E card reader.
 
-	  If this driver is compiled as a module, it will be named rts5208.
+	  If you opt to compile this driver as a module, it will be named rts5208.
+	  Selecting N will exclude this driver from the kernel build. Choose option
+	  Y if your system includes the Realtek PCI-E card reader rts5208/rts5288.
+	  When in doubt, it is generally safe to select N.
-- 
2.34.1

v3 fixes the tab spacing for line 6 in Kconfig
