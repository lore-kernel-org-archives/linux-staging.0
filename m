Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECDA82253B0
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 18:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774894657; cv=none; b=UB8Bb9mSgLKM2Ewu9VUACwp+5fmOA3+p9LeXnWqBJXQAzAeSOOgQTJyC4mbC+i6CcyO0gGd/TMnPw1z4rqUzB8vGJkxJM3KsYbO9qJ532XeV9l7YGaaFTU+x9Z/WvX/QqCXd5ZkYW/jtMRh/cDagG7eZ8D/olReNNcncAKdP2LQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774894657; c=relaxed/simple;
	bh=AlU6IL91eQc6saKlTde6Kc7sbTCIrF44nuCbfs7O7ys=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dybwj3tgtjr/3Euz6zXu/NKP3rGQu1ZYE1f3upZCTd7AaXqGJeNbOIYGHLqc3FtntMDJcSCyzhj5kWjx7ua9p7XCDnqby+Hr0fbiCWkqDkXOcPjdKwK1NYoWEGcDinEIEswgo+6/eU6rPMOycdaKMFoOCQtkbK29d1eOjgh0818=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dMZi1+BC; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dMZi1+BC"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82c28f0a4ecso3392239b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 11:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774894655; x=1775499455; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=IaRbKZC73FTsla4hY9cp+JWbndJRE9fpoUHFyce6xE8=;
        b=dMZi1+BCOlKLhZlOey7h/L2wJAx6FKWqkuiGFgWKq6q/57o4BFmAS3lHjVwI7Dj7TR
         dJ83m5x8WL36tKTT1KP+BMJP7+zvJox+Tb9xUVgJwA2hnlhc4/lc4+M31xgK1GDDz7cW
         XhGjRBF2NSJ54CyGyPPnoRhWaHtNzCsCmw5Wm4hhZ+vEwrOWwgG2uYCkL12oIu79pEeJ
         wY3RhVutAQjyZJ+nWPuQZ/cpV/kpX1qz94hwNOHQkfC9u/KnAMSWsR3AcdG867ibqHo8
         oouyUSTpKDaNhENrftid3n6kVRv+APmYTYev4XRW2MtaFpCacYM/lD9w2q+aofZ2QcbK
         sxzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774894655; x=1775499455;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IaRbKZC73FTsla4hY9cp+JWbndJRE9fpoUHFyce6xE8=;
        b=k+eGQbwi1rlrDJRdtndl10OM0vySwM6iv/wFqH7mjnPL0OhLmDzqoUZtuFZWXip74o
         LJ1CQpbqABM8xC2otpodm4lsmwL0/3jvnWAdt6Y33Cchded/kIsjrHzluzcp/GVmfxN5
         3+D+jqhQRJ4jJg+aZDu9Fo+bVDLGv+ahOU8nXAKEtVaYWiWE0bNo2SS2k+qAbJtMS4Do
         bBeDjpBqg15gxjHpCbt0fW5lQOcKswUJXnaMavRggt6yO22YeLvNeAau9pNnYm7HEhJZ
         xPHdNvVPNAeL8pZXxF+/cDLNIzYu0CjXztunb2OLlYT323Hj1K9ZmRszwh5MiE8dO2qa
         Cp6A==
X-Forwarded-Encrypted: i=1; AJvYcCUWkt8mgGUACcUKlT1eIE0lsscn5AtyxEamtY2somJ47dsmR2HEZuuvbQ1JBckK+5GEzZUkPxPWhJ3//6pM@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9AQT4VQqWytFSSP5sjuWo5uFoyRJvUQ84svhNDdGedicnQl0x
	d7LEwJeag02ROcPw9haFoL0JvNbtagHKjGBMXgzH2H1gS3OKFpZ+Fk0b
X-Gm-Gg: ATEYQzxCV0mMEsOuTufEp3sMNXWjAAWRKkL7NrkKBvi3+ZYxHAxRVY+wS7KFa6f3+4H
	ddTavqlZQAgSVXy96hzco2PE0JilKBcQt10eF7iYzD6XEVRelPlZ5j4qrsY2KBA0MYPtYPZj76m
	ePlHBaF3srrrhMx4kOwEZ6tnVsPKcFnDY0Fa3h2v48ahreremf6xZQ+CxK5BojbcyBe0MS8UrKW
	8Gf/BMo3i7rvdzHj8qpEIzYIv2yHZbN/IVQdl0zNSIfX2/eTWsOzoAPODduNjEzrx59odwB739X
	kgGI9TwsrgHqZslbw3rQW1sCth8/UI1tsAHlKuUqbrshqABMgMcVMZyAXffN+Egv3lwxntmiDLD
	EEH7JJnhpnYGTZcBxgmVBLbpTDZAs2cAFDO0WkxKdt65GZP/pJGEtkM5jIU580aVicOmau2Gwmf
	ZifYdmLRbXJ8hXbJNBwJK0fUIUUZsHirwQ+rvt85exPjCHgt1cLP4=
X-Received: by 2002:a05:6a00:ae0b:b0:82c:9c4f:da3 with SMTP id d2e1a72fcca58-82c9c4f11d2mr10974682b3a.31.1774894655321;
        Mon, 30 Mar 2026 11:17:35 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca85d4d90sm10099966b3a.36.2026.03.30.11.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 11:17:34 -0700 (PDT)
From: "Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
To: Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andy@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-iio@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Md. Mahmudul Hasan Mabud" <mdmahmudulhasan1511@gmail.com>
Subject: [PATCH v3 0/4] staging: iio: adc: ad7816: code cleanups and modernization
Date: Tue, 31 Mar 2026 00:17:06 +0600
Message-Id: <20260330181710.23258-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in v3:
- Added missing Signed-off-by tags and detailed patch descriptions to
  all commits as requested by the automated patch-bot.
- No functional changes since v2.

Changes in v2:
- Renamed sysfs callback functions (e.g., ad7816_show_mode to mode_show)
  to satisfy the requirements of modern IIO attribute macros.
- Fixed usage of sysfs_match_string() by removing the unnecessary 
  ARRAY_SIZE parameter.
- Fixed vertical alignment of function parameters to match open parenthesis.
- Replaced sprintf() with sysfs_emit() across all show attributes.

Md. Mahmudul Hasan Mabud (4):
  staging: iio: adc: ad7816: redefine mode constants to start from 0
  staging: iio: adc: ad7816: use sysfs_match_string() for mode selection
  staging: iio: adc: ad7816: replace sprintf() with sysfs_emit()
  staging: iio: adc: ad7816: use modern IIO attribute macros

 drivers/staging/iio/adc/ad7816.c | 111 +++++++++++++++----------------
 1 file changed, 53 insertions(+), 58 deletions(-)

-- 
2.34.1

