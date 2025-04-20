Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A13415D1;
	Sun, 20 Apr 2025 01:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745113754; cv=none; b=tVlyx4O7eUG/zUGDNewCE0/ZHv9nzx8zNimW1OyOYja/l74QlhFi5AMir91fRU7LAYDA4YX/Gsq/a++jRCcZhzyRF1YUud240EXobdNRR9IWDEDAevlg3Re552HbhZfr0UG0TZP+ybmBt5wkDf+Q7hynorfzmwY+Ajz/LZ+tyzc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745113754; c=relaxed/simple;
	bh=XR8VshVCBjCpDK/6MAQll9UllzfBm361bXzpA28liZA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DacNtzrpKV+uNxZSY7g3EbfoU3iie9oDgnxI4GIGrJO6w33a89rBJ4/oKdGyqdVMUltlAJIk1YekPqGbj4neTXBRF8UPB9eNgjMntgsIoHjIy0cKVPpYCPB88Ebop6rD/owcNA8IlIC2STn1CoG6uJiSM0gQZ9wXSGeXvouCB/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=araUWuEz; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="araUWuEz"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476b89782c3so34755631cf.1;
        Sat, 19 Apr 2025 18:49:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745113751; x=1745718551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BkK7sCqoYgkV7vHHu2iYpaek+AUiihEoUOu+lvG/1bs=;
        b=araUWuEzv1r8nRRpS31+b12jqEy0EfOsrqMBZi06Nu3D9Shj+DvRWWaBB8LHwKcCL6
         1tEx865loNaDr6fItO6VjKY7lVtquw22bD0Nj3m3SqCUD9uazXAA9kJaFaRuJEOEzvh1
         U0BoxNZmxIAaKBjibHV3xo2PhzKNyMStrOLZhOUvlU1Ce+bvY0Xd5o/thyN5sWw69VrG
         R37FDqmSOt+PCJ+4ustGvBGjCO+fEbHGvwUcFrJJ1Oo6KwOUKYmGL6xUPHMV5JdFT5nT
         Wftw9TT0YVXCbMQfLSphtaD4Po8G4UhLDgVJQltZ4jo2GVtHgGKPSn2XPLZF9Bv5QRd+
         UnJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745113751; x=1745718551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BkK7sCqoYgkV7vHHu2iYpaek+AUiihEoUOu+lvG/1bs=;
        b=bTTEhaDViWrlKXUNGHIUvom/pOGVHWj/utvM0JEvHjwQylGoFzWLeMa+jR0542Wavz
         j2+nezzBhkiUzoZe7XsMkfD6BY+7eQy420TWINFY+f+caXSMyC5Tbykmho2zRFBJS4WI
         YTuR1pazTMCFboRB2FF8/R2yCdKRjARwN4enK80RgYjwT06PhGL3fZrnSPKzRVb5UBrk
         AZuGM79q4O87JwcMTW8ei16ciB+YW0MKonAQH9AwV1jN+6oeciOn5MCxYny+TUoNIzJ1
         kWM5l4DGIxnGKQUf2RvJLlH/NSxcF6ty7s9znp7h+Zl+h91szKhKUvdQgqiBcnkQLv03
         RcHw==
X-Forwarded-Encrypted: i=1; AJvYcCUEtn5eVpqqlQju6EYemcd65Z5C5iT167jTX/+v+pVu4QuahrH1ktMCJH2ZvKsPJs1+oNkgNbKAkKlaFn4diqB2T6id+w==@lists.linux.dev, AJvYcCXY7CrwJuqpq4qRb6urd63WbUx3OP65RqH29/AcDZ0vYChI5cHdB/hOAPmgOkOQT+eVAy2pTr9+rbaILqY/WQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzPNUbQf/6sGvgwvOKFxtVRPnOO6gBr5egylasRCurEGSD9leIH
	kUEMrQ+i4LKeDhC+HizIQzh3zUJNZ/Ss2A33ZXl1VTmykek/YCgh
X-Gm-Gg: ASbGncs3JiKwe3NJjBTminZOoug355JvIn+XJMGmUj3NbaTTGyVucm0G8LW0L/+2Z9H
	3O1quVQ7Ry6XJ/n8oTB9Mm//cL1++klMXDfE/5On5nRxkjjpCgRwsBsujD5tKQVGIFIP6MczQv5
	h59ed+UBtZhILzLfRLJjKeXnQ+FyS1Yd5q4AZz/oU6jB81uPIBN4EcFXSYasUtGkmoTemOSKDPw
	obNyjhYhBStFkApKeMmVnrNER7r8fHTUEdqksuJ8+3yz3dvoRQv8U3Rlh8lNGVC4hjm2FYODUO4
	Mn9Qq7ILF1btVsZZ+W8jmb6d82lTfssra6F+mdCbYJL7p+FI9fnsbNX+j5Pc24JkniiIhVn1twf
	DqyFuu+AzzYNOvecAX14=
X-Google-Smtp-Source: AGHT+IGk3d9R1YYZht1x3p/xAxJxMVx6pGTt6Bq2tXXeEnpnQ2jZXnBusb/NjFh7MeNLG0ibHtjl3w==
X-Received: by 2002:ad4:5bac:0:b0:6e8:feae:929c with SMTP id 6a1803df08f44-6f2c4570259mr129930536d6.21.1745113751486;
        Sat, 19 Apr 2025 18:49:11 -0700 (PDT)
Received: from theriatric.mshome.net (c-73-123-232-110.hsd1.ma.comcast.net. [73.123.232.110])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af1283sm27583846d6.23.2025.04.19.18.49.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Apr 2025 18:49:11 -0700 (PDT)
From: Gabriel Shahrouzi <gshahrouzi@gmail.com>
To: gregkh@linuxfoundation.org,
	jic23@kernel.org,
	lars@metafoo.de,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Michael.Hennerich@analog.com,
	sonic.zhang@analog.com,
	vapier@gentoo.org
Cc: gshahrouzi@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: [PATCH v5 0/5] staging: iio: adc: ad7816: Fix channel handling and refactor
Date: Sat, 19 Apr 2025 21:49:05 -0400
Message-ID: <20250420014910.849934-1-gshahrouzi@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The original patch combined a functional fix (allowing channel 7) with
several refactoring steps (introducing chip_info, renaming structs,
improving validation). As requested, these have now been separated.

The series proceeds as follows:
1. Fix: Allow diagnostic channel 7 for all device variants.
2. Refactor: Rename the main state structure for clarity before introducing
   the new chip_info struct.
3. Refactor: Introduce struct ad7816_chip_info to hold static per-variant
   data, update ID tables to store pointers, and switch to using
   device_get_match_data() for firmware-independent identification.
   This removes the old enum/id mechanism.
4. Refactor: Add has_busy_pin to chip_info and use this flag to
   determine BUSY pin handling, replacing pointer comparisons.
5. Refactor: Simplify channel validation logic using 
   chip_info->max_channels, removing strcmp() checks.

Regarding the 'fixes' tag: I've applied it only to the first commit
containing the core fix, primarily to make backporting easier. Is this
the standard practice, or should the tag typically be applied to
subsequent commits that build upon or are related to the fix as well?

Changes in v5:
	- Use correct patch version.
Changes in v4:
	- Include missing bracket for condtional statement.
Chainges in v3:
	- Split the patch into smaller patches. Make the fix first
	  followed by clean up.
	- Include missing channel for channel selection.
	- Address specific feedback regarding enums vs. chip_info data.
	- Use device_get_match_data() for device identification.
	- Move BUSY pin capability check into chip_info data.
	- Simplify channel validation using chip_info data.
Changes in v2:
        - Refactor by adding chip_info struct which simplifies
          conditional logic.

Gabriel Shahrouzi (5):
  staging: iio: adc: ad7816: Allow channel 7 for all devices
  staging: iio: adc: ad7816: Rename state structure
  staging: iio: adc: ad7816: Introduce chip_info and use pointer
    matching
  staging: iio: adc: ad7816: Use chip_info for device capabilities
  staging: iio: adc: ad7816: Simplify channel validation using chip_info

 drivers/staging/iio/adc/ad7816.c | 94 ++++++++++++++++++--------------
 1 file changed, 54 insertions(+), 40 deletions(-)

-- 
2.43.0

