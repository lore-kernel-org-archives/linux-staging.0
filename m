Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2178BE7
	for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 08:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aG2zHHXJ"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-5842a7fdc61so1022849eaf.3
        for <linux-staging@lists.linux.dev>; Fri, 27 Oct 2023 01:52:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698396733; x=1699001533; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jGtdoF3Mg7AoYJ9tjtSPgKmP1BQAIZoXCYmDSYtFg1k=;
        b=aG2zHHXJWoaTK6UTGI9pAHXW2wHkODssGotGeJ7+kic/R3ph7epB2y3U4zAy/4TR2v
         GmNqexNmvShSw1txwJ/UomuRQaZOuqO2DB9l7X3qw0ovKp4GNU/L05+bkcLUIkvJrWms
         DJk3HGehbiDSe63LMpY5V6s/UqNUN0bGjdz0xgbamkMHzcKoM7WCmayXSvn1sDbt5GID
         JvVGM7xcA2fnZ/QzXy7+03/VSNG9lqfmK9uXkCEL8b9RXd0m85VgNgv9MWYCC9K7S02S
         on11mN7G1X6UUOV7CAFqHf11INsc2a3JiO2Fy2pLbo54GDuQGFTyJkcJk/rtVD8Q9IUn
         PC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698396733; x=1699001533;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jGtdoF3Mg7AoYJ9tjtSPgKmP1BQAIZoXCYmDSYtFg1k=;
        b=j95gZ6zfqLbbP+RO3364jAGWoDSHI+3JDZrJ+KriJ5aoSCsgkW8TD2jMFONvqqwmx+
         wCXTYHaEtKwiiz1zO4B/OlHYN04mwu3Wj3pqgV9S+4fba+OBkdN8ndR+mL+qbEpUjMy3
         9ov+FWJWoQqqII/p6A2eIrHAbtdAB5ix1jNBFs3ANlYBagl8GHh7YAjU+JmMKPg0UgMd
         Cl/WpRrkSqvQFkt4W77znaXJ7jmz2chSs44C85qhJIw+YMGVX0Y4IyeDDyRcTmWKEVjt
         7GZLeMDX6ev1NGejZdQIPJ4ZtZbJc4U1RpimhbxpNqGGROfNbcEyXT0DD/uHUYhKU388
         0E/A==
X-Gm-Message-State: AOJu0Yy4UXU1QeclCSdeA2LF1XSXtPZp9Rd737QRFLEfo7hRmxZt6Blg
	g/XFaTg5laXbX2k0mj45FaU=
X-Google-Smtp-Source: AGHT+IGLKq5DWDrOjVEC/Es+Ak/cnKAMw9mDYOyYLHjNpKFJaj8Px8YmkssY1ph706/HxFdcJF/iAg==
X-Received: by 2002:a05:6358:e490:b0:168:ec55:d164 with SMTP id by16-20020a056358e49000b00168ec55d164mr2664694rwb.25.1698396732904;
        Fri, 27 Oct 2023 01:52:12 -0700 (PDT)
Received: from ubuntu.. ([122.174.106.169])
        by smtp.gmail.com with ESMTPSA id h12-20020a63b00c000000b0055c178a8df1sm698825pgf.94.2023.10.27.01.52.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Oct 2023 01:52:12 -0700 (PDT)
From: Pavan Bobba <opensource206@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Pavan Bobba <opensource206@gmail.com>
Subject: [PATCH 00/10] Type encoding info dropped from array and function names in NIC driver
Date: Fri, 27 Oct 2023 14:21:49 +0530
Message-Id: <cover.1698396278.git.opensource206@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset series consist of fixes to issues found by checkpatch

Pavan Bobba (10):
  staging: vt6655: Type encoding info dropped from array name
    "cwRXBCNTSFOff"
  staging: vt6655: Type encoding info dropped from function name
    "s_vCalculateOFDMRParameter"
  staging: vt6655: Type encoding info dropped from variable name
    "pbyTxRate"
  staging: vt6655: Type encoding info dropped from variable name
    "pbyRsvTime"
  staging: vt6655: Type encoding info dropped from function name
    "CARDbSetPhyParameter"
  staging: vt6655: Type encoding info dropped from variable name
    "byPacketType"
  staging: vt6655: Type encoding info dropped from function name
    "CARDbyGetPktType"
  staging: vt6655: Type encoding info dropped from function name
    "CARDvSetRSPINF"
  staging: vt6655: Type encoding info dropped from function name
    "CARDbUpdateTSF"
  staging: vt6655: Type encoding info dropped from variable name
    "byRxRate"

 drivers/staging/vt6655/card.c        | 118 +++++++++++++--------------
 drivers/staging/vt6655/card.h        |  10 +--
 drivers/staging/vt6655/device.h      |   2 +-
 drivers/staging/vt6655/device_main.c |   8 +-
 4 files changed, 69 insertions(+), 69 deletions(-)

-- 
2.34.1

