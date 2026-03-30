Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADB0535E958
	for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 17:40:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774892455; cv=none; b=igjaDzwoUpQjpwjOX4qkLioaN+sbBQoMQ27l+NMO3tTTkUqnanbRKO6WYwUvaeP837heADZh2h5x+gwpxIs0zrqlZ/MWDj9dA44S/EjsjUh+fX40iTfCLexjIfhQ9jw6j6fkPsykCu9cVNi0QBe2q93VGPySVtugfaZk0KlVCJU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774892455; c=relaxed/simple;
	bh=NRkfQ5sWlyKZ8jYt0MoyU+A/zQpCzvR61PflWrUi6VI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gHyW/KhEQQdS1TXfW2Bd4wnWCNm2DNXXA8HyZ1NijxS0GIbdJEbcCT2jq/0w5tQsUdQc3YVH6sqyOw09zvPQWP2PZtawxXNP74d+7XHOcQSUQQ4L9yBCCTNDU7kE8Bo23lMuXi/TLlVkB1UGQmaQqkyCy0OqQkxpFPlgP7qyOp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jfuVFvBB; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jfuVFvBB"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-8296d553142so2146479b3a.3
        for <linux-staging@lists.linux.dev>; Mon, 30 Mar 2026 10:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774892454; x=1775497254; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uXmeoN0zd9waWSuUzT9frQxiUsdJkSomrx79VZXCc6s=;
        b=jfuVFvBBIOIzoprxtxFW1eNYySQfBVKX4nVx3RaAbgDmuPeppsMeAvAAZ6lX6/Yody
         LDerIxDfvnriDzpMdK7logujlZGdAuc8t/1bSj8cL1zwnAonW8wXWShXiKhYUpXkGjVh
         nHcU69oJ0734LyRsMRVvsRcNhWvfWyHH/UcGravAxw2uZvEGrBJF2x1MAsyQYwo4xOQh
         8uUC+Wnxtha6rjo1fF2ydDUdqzXSf+1L7I60L0v3Te/omlIyfmURsMQQTPMM4dGGyFpo
         e7px94T/yTJrCmvDYKrgMv61Yw3ImjyhuswelrG1pKbUvHUjXepZaLIYTg8TBxIDp168
         /jTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774892454; x=1775497254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uXmeoN0zd9waWSuUzT9frQxiUsdJkSomrx79VZXCc6s=;
        b=TDgTFhVVShMJY4H6+3BmF7f8ugvn8TA32lXHNlo53811TxgB8XLdKrshjcHiY5TbWH
         PUmzfX0n2kDEtnaz4fkiVabvCeItITDKmL8hI3Ba264On2V1WtkfB1pOE9SWlzo651Xx
         0PlHB3znoUMuehKewbwo9zwDNCZDnH8YO+5idSsiBvdoSMyE4X2N4AfYsgK61HGvx4Hv
         LELy8VvSOFBgiTi5ZXWTZ6dGGd+ajiefW/Qkf4mBAS/mxJ3JFGNwvWS/1mdAM7dlhQjg
         nK8QT7hCo5TSR329uttArqmPKHx+vgnFPNKMRgRFM4QX/drM4l/5Z6xd6MXWOYht29rf
         6ptQ==
X-Forwarded-Encrypted: i=1; AJvYcCULlmwMw3PBgc7vBsxLwuv9WEtdeWEyZPHTX0AIaTx1+0FulnDW21ZuiTfbnZf47d0OsMpuD6xW1P6VPgjs@lists.linux.dev
X-Gm-Message-State: AOJu0YwQFbRgeuyReHX0w+4CmhXNKTVT1dd97nzXCrX0pnh6mlTjdK8G
	ZMnhvGU6T17BcBQykIDOL6Le5aINtFsMEZytJ2lJ/FZ1nNaX+mJ6YIt+Chgf5wJv204=
X-Gm-Gg: ATEYQzwynciYJz8lMi2QJHRfu4gMaQvOoYuPS2CAuqvGEHFwKOrtr0n3HP6TukvFFE9
	cbWd09QHE2hbpIdguDJW3cFUKl43VkxMromU0J+9Fax///G7IAOMXzI8096IZzd4MydpOTe3zDp
	hDgx8MzhauHKO3c0Kj8i9OqN8cdVYQdnobQxAdt2lpy8dCJnSHttsiAd2k8uGd09VTihKp3WsCb
	m52gsYmMqamYPFVOJEVP+MEdT3KJH9gYZYwtGpje6IzLwaii3zcPbifB8ShgQtxYlM1cmBH6pV/
	wmyGhTmqtUbbk7Qck6e8i5aoPRmkdfobgu564bWTywHC48AHrT/4Bg9tYXJtYZDcnyMHTKDuFY9
	1Dp359J7WXghtjAReBl57n5no33O2F8EtAQjuHDpi2SqYH06AOBDlKGTtz4F82o9iFuP/nWcZD6
	bsuqLWMdI7hI3VVUT66t3cfWIUFLYT/gv/7IpSMYg+
X-Received: by 2002:a05:6a00:2e27:b0:82a:8163:4c00 with SMTP id d2e1a72fcca58-82c95c28026mr12874864b3a.2.1774892453962;
        Mon, 30 Mar 2026 10:40:53 -0700 (PDT)
Received: from Mahmudul.. ([2400:c600:545e:6508:42eb:3d78:89be:591b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82ca860b125sm7844052b3a.50.2026.03.30.10.40.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 10:40:53 -0700 (PDT)
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
Subject: [PATCH v2 0/4] staging: iio: adc: ad7816: code cleanups and modernization
Date: Mon, 30 Mar 2026 23:40:20 +0600
Message-Id: <20260330174024.20712-1-mdmahmudulhasan1511@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series addresses feedback from Andy Shevchenko to modernize and clean
up the ad7816 driver.

Changes in v2:
- Renamed sysfs callback functions (e.g., ad7816_show_mode to mode_show)
  to satisfy the requirements of modern IIO attribute macros and fix
  compilation errors.
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

