Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3287E28A3E1;
	Mon,  7 Jul 2025 14:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751897405; cv=none; b=ENsq+SlVikZnw1Nta6r9AnzD7Keq5IfGfetinYI4jJUfXWT9Jh1D2zgsvaByzcWF+gJdNHucPXaH4pqlUJKLTiAMog1EMpEGaaLTIwR07TgyXP7obrRxYIl2cOntesNXB9gisuC3J3wMv5FNNWK4eroUlXmRiQSNhC7gc+STAZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751897405; c=relaxed/simple;
	bh=AHdaYOSI3SgombZBC8dmiHualEDlfjhpn8V0V/DgMuk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TIA17NjaYAK+tfwR2bWWmVxFJ0vEzvnKau0XoBQAfKzn6K/9XhKJpo8CY0j0w9ojh7vvvLnRl2/rbLkEuL6ii1QWIyrO2ZQVp2dS4wkNycOpZMlg5gzyzFAaSTlD3juRmPgB9U5dOfa0Me4eSNaVS8Y0F5Z56y2Xy/aXHO45uBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EYvpKHRx; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EYvpKHRx"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ae3521a124cso44841066b.0;
        Mon, 07 Jul 2025 07:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751897402; x=1752502202; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uyCqESTaPkXyHbkcmpNd2gMmLJmq6htwbjOFYD33r8M=;
        b=EYvpKHRxDEhwplrbtDOsQh5lGFWxGnstnzJEhgiv04KBY02WwPOSLF9UNqMC02E5UW
         anLyrKwc8yBrcbQja+0CD+HcVnshs8wSMfgk7tk1G/76vJ9KC5+s8JEkoa45hUvF+MZL
         ZCGj87CdvTLkIGmFmRXa/tyHJKHLqSxwWciVB4jo1bvS2/GMs0pHGjfbIYRikCSpMMsR
         r6JspTGvF1AH7zCqQfXH9G8q9zwvu/elchoxXgZM/U44ZoGlJ81b+4ebdAOOx+fMNh0s
         vZlCwxlqVjN/pPepiwIaFeI8K6fndoSaHtUpFCHS2bogXCI+67amG0r8uhlMOFfiavgg
         I92w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751897402; x=1752502202;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uyCqESTaPkXyHbkcmpNd2gMmLJmq6htwbjOFYD33r8M=;
        b=ht0y6LkVxD/DwI+uf8cQ3h9MtENB2lAl7AyojPIXSDZkOd9eBMHDhdA294bwTtBVUr
         mqJE06s8w9FIkaDv7wmOTcuW0pffHCpEda4u8Q21jnuDZfmHnCJ33G12zVNzyR/0oNuT
         Or3he0iqkmKgmzbPYJUa4ZdpeuqU801+NPgv4Ieo7vEzxwZSrtpec5UN0uGy3w5NYiFQ
         TGGMdy7Zwv4b7e+MI6yNLSDOmD8UG8ICiwLFioph4ratpM5igcyvQwNOxePEztb3DKRE
         aDgBEBB/zQc5tLJMJNmVmzGgOw5YQlOx7KoPqrI+FX5TJohTixP/Tdtw644XD5OZl9Jg
         zwuA==
X-Forwarded-Encrypted: i=1; AJvYcCU8ve4lAae/kCdgN6YS/FWfZAk9dE3/LA1SaaFQMZKGxWPUBq7HIUJyGt4GF4JPY3oUAm63uwDFShkrSsFP9xuqP0emtA==@lists.linux.dev, AJvYcCWQqISiOKN53fL/Uy7hXjvd76FQ8YljzTRL4ERBi8HEHsQNh1ArEENjV4L9aX5a2TdANQXfow5H/FF/ZC4Aew==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGzvqWhEtd9JuBt5KBkwWclX9ajeu/KfILqK8ImjFv4p70lZSd
	+rxGqA+koWcuY1MA6CSmpQl0lt74BTGV51eetiWaMF2qQZOzbqGqKUHF
X-Gm-Gg: ASbGnctJnLXSfr3Waxylko3gwnlMyol1IDsbH4Ezv7cGGS/XuV5k/YWLuJtle8KMNyk
	/ShCakhIdetI6xMKu6JouPU+GasAnCfwa6pOaPfRIfCss/7rrC9DhLtDn46putNLDTpNvd+sr10
	yh/IBWDxfco24b1ixWcXJFM/WluexAQ3A7wRMXWqfenJlpwmjR8UweqFo9naKymqd6ME83Y57gw
	sNng5ohFwYSAwHDxuw+Z8iMzNXv8G0ftdKXFW2HhRqWrUf3fBmdRRndCCt9j9hL5rNiSyloHftq
	ke4g3zMb+QWU7R33g54aApSoLci6E4l6kKokP9ktqMbqvC5hEyJDjfctnww60bZeflJXWQ5XcRF
	Bq/XHjAKDzxTYUGUw5zL8Stm6puYZmdEBgS+tbWuuXIOHR8KB3IDekpBztzEh
X-Google-Smtp-Source: AGHT+IFoyq3U+1/o3AJhEJGB7FOf5qPE24zYohu/ZNZ7tgwRy0GsIfZj+9LrwSnh8D5/P/Tiid5//A==
X-Received: by 2002:a17:907:9443:b0:ae0:dcd5:ea6d with SMTP id a640c23a62f3a-ae3fbd57f27mr434916066b.11.1751897401998;
        Mon, 07 Jul 2025 07:10:01 -0700 (PDT)
Received: from yousrii-VirtualBox.hotspot.internet-for-guests.com ([82.129.154.18])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae3f66d1ae3sm710370466b.7.2025.07.07.07.10.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 07:10:01 -0700 (PDT)
From: Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
To: hansg@kernel.org,
	mchehab@kernel.org,
	sakari.ailus@linux.intel.org,
	andy@kernel.org,
	gregkh@linuxfoundation.org
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	dan.carpenter@linaro.org,
	Abdelrahman Fekry <abdelrahmanfekry375@gmail.com>
Subject: [PATCH 0/2] staging: media: atomisp: clean up and unify HMM initialization logic
Date: Mon,  7 Jul 2025 17:09:21 +0300
Message-Id: <20250707140923.58935-1-abdelrahmanfekry375@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Continuing the series of cleaning up the atomisp driver as discussed in
[1], This patch series improves the consistency and reliability of the
initialization logic in the AtomISP driver's Hybrid Memory Manager (HMM)
subsystem.

These modifications were tested by building the AtomISP driver

Link: https://lore.kernel.org/all/fbfbd0e5-2c27-4f32-a3d7-9cf57fde5098@kernel.org/ [1]
Abdelrahman Fekry (2):
  staging: media: atomisp: return early on hmm_bo_device_init() failure
  staging: media: atomisp: unify initialization flag usage in HMM

 .../media/atomisp/include/hmm/hmm_bo.h        |  9 +++++++--
 drivers/staging/media/atomisp/pci/hmm/hmm.c   | 19 ++++++-------------
 2 files changed, 13 insertions(+), 15 deletions(-)

-- 
2.25.1

