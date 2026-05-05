Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016A748A2B1
	for <linux-staging@lists.linux.dev>; Tue,  5 May 2026 21:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778015606; cv=none; b=g76U8IBIvyCZ/RQQLcVEVLeA/8CFcvwEjj5pfd1HUgnoJVEARzKq+G9DlX62LgkdTrmprAyUmEKW2e8XIAf95ycH58Doie2z/qC1I/ZP7jyTDvsUQgtJCkPx9cqF9KeXzCdi8vtoXdE4l/+kmxa7pwn/UIkZYBXQoWGhqSk+SKs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778015606; c=relaxed/simple;
	bh=9K/q20kdv9UEMqCTifcl6QltCpdUFZ3I/NdHZCda5FY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=thK0dEamIn5otlxJop5neTU8W67Lu2lDodbKNYm4uG2x+S0/fV94MevquK70Z17rhVvrS8jXPWA472AF0BVFhB1HDrsojrD8DEMpBK7vAGtyoh3X/yvZBJWUJVDcmSzzY2WBWSPmuwd5Q8uZC9U0xG2KpWVUOSNYlz4U4OQ/HwE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mk03xsRd; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mk03xsRd"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4891f625344so2833495e9.0
        for <linux-staging@lists.linux.dev>; Tue, 05 May 2026 14:13:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778015603; x=1778620403; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vtHOcfXlCeIRCIaOeTZhMJHEfAK35Rv4RbP/F/HJDg=;
        b=mk03xsRd1uuwIWBG8wZSN9wtmnt8Lb87aViOZQYnOZuNmJY2DUcRESLyC2tCfJq4E8
         pZ9C85hQNSUZi4mflllaFqbtP6UQ8hiwVmPblvsjNpj76mjqMpFaVqohBWXgJ8IWsUq8
         4cTg9q7pOkitb/4swz4znUGDKwyQr2pj4KMPQvI4E9t5KKFf+0moCYMqnlm9mxXqHO6q
         zraFUSLhSpvtcJ0HPx0BhbNvXu/0rrtgv+tN1uxDraakwJFMm1Y0kDw3vdQwhUfx8xqP
         1f4AZrwqxZoQzIW0+CGT+IDyut7JhPyXMiLdWSXJHnkMFPOQ6tlLkRDZ1I9IEngIh1aj
         U2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778015603; x=1778620403;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8vtHOcfXlCeIRCIaOeTZhMJHEfAK35Rv4RbP/F/HJDg=;
        b=Cm/k82R20pWwTj8YNTG3o8mNuAwOKJUK+m/m3MQPHVbhxPqDIkgA09/PLKY3B9Uwrw
         t7H5ymcacwTHYmWjhHMgwE7HJU/4z5qOc6U0p7qeffmz8NaWy32svBL7m6NnfBeq04J1
         l7mBoF8tHudMFOsJT/Ihb+e0o5kFjF+8ts0+nHyxvXS90sJyrzcoAyycTTN1109CoZSa
         4y27mbt28J2XdiZgb81TrPUS2kY0tT5IySm1DrcKHgQiKUAUqRAl740VL38IMh6otNUt
         orvvZiaC0jejezFAxfIk4FAg5+5NMj/AKrT/p2ZOk+vt1B2Zcq+k0XRzgHg1FtTbokmR
         Lv/w==
X-Forwarded-Encrypted: i=1; AFNElJ+Kp1EonV88l0hr1eMV0m3Zw8Eh9IE6sb1EyBINbUN4t/mHiTtd2iNTEOKuy+JZSGVwlI3k/Vr3eCTZW3tt@lists.linux.dev
X-Gm-Message-State: AOJu0YxoyZgy9I3dLOz0Fc+AOpzki44WGM1gLWJ/62h0HNEkB1pfNYbJ
	eL/y802o5nJS8e0HRL4PGW1TlwuJw5QkG/ZwfQCuJGR+raRwWTEP3JSg
X-Gm-Gg: AeBDiet/oORjMIqLhGI5PeZAstFu+Dnj7D4ZNETCBMVmd1kV/haeuKcJwtVlzPKwTPp
	HDWzgHJgAsIQqDtXUVRkDMcZ5xMhPHKzHkVZ0jeRDcI7NmaZfqIMMiHBMa/LZW4AZnQ2kv8pn0d
	ikjlippnLttjP8OzkthIgdCohlys3dUG2YaMZBNgdFopWo1DUHKeiPyzw7WDT0doFH0+TKPa/n+
	bDL1sD2TQyn6zicWOnA2zZc71wBwy2uM7jYuJdol8mQEasdTLVPmCUx/1CpYFzg2yPC8gVDdb0m
	CELMRfYTQVYBQFFKxiBHXy80nxhpoRUJcAsOxOYqURPKbl8zuM8CUSi7FxvhCeifmcg5FUF6sIx
	q3cxJje4TruwZ2j/Qk98DLlvDJFKc4zZYdmUalPRWTWXXaY1oASb42GA6qq7nbURJGltDGh++M1
	7+6ZzOsOGAZafLUCm35FVeqah3LkZQmnmmAcBygvFq22+kRODs7Kg7zNaryc3YdHbVxjB4kjOAY
	jbkLPlVHzh3XR2rwmSCoYGsD7DIS4LWcKCebhbT9cKlxSKeHD4AtdgkuKyvYEPdsA9D0vk=
X-Received: by 2002:a05:600d:d:b0:48a:53cb:8604 with SMTP id 5b1f17b1804b1-48e522c0909mr6320335e9.14.1778015603208;
        Tue, 05 May 2026 14:13:23 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb6fffcsm403400045e9.4.2026.05.05.14.13.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 14:13:22 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	stable@vger.kernel.org,
	luka.gejak@linux.dev,
	hansg@kernel.org,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v7 0/2] staging: rtl8723bs: fix OOB reads in OnAuth() and OnAuthClient()
Date: Tue,  5 May 2026 23:13:14 +0200
Message-ID: <20260505211316.3837020-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <2026050453-scorer-rebate-3898@gregkh>
References: <2026050453-scorer-rebate-3898@gregkh>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v7, addressing the sashiko review comments on v6.

Regarding hardware: I do not have rtl8723bs hardware available.  The
patches in this series are derived from static analysis of the code,
cross-checking against the 802.11 spec, and reviewing the patterns
already in use elsewhere in the same driver.

This series fixes authentication frame handling in the rtl8723bs driver.

Patch 1/2 fixes heap overflows in the Challenge Text IE paths of both
OnAuthClient() (STA mode) and OnAuth() (AP mode): the IE length field
from the received frame was used without checking it equals 128, the
fixed size mandated by IEEE 802.11.

Patch 2/2 adds frame length guards before the first direct pframe
dereferences in both OnAuth() and OnAuthClient().  Without these checks,
a frame shorter than WLAN_HDR_A3_LEN bytes causes out-of-bounds reads
before any IE parsing even begins.  Two additional guards cover the
algorithm/sequence fields in OnAuth() and the seq/status fields in
OnAuthClient(), which are read at variable offsets past the 802.11 header.

OnAssocRsp() was already fixed in a separate series.

What changed in v7:

Patch 1/2:
  - No code changes from v6; dropping Reviewed-by: Dan Carpenter because
    patch 2/2 changes code from the reviewed version.

Patch 2/2:
  - Add frame length checks for OnAuth(): guard before GetAddr2Ptr
    (len < WLAN_HDR_A3_LEN) and guard before algorithm/seq reads
    (len < WLAN_HDR_A3_LEN + offset + 4).
  - Correct commit message: remove incorrect claim that rtw_get_ie()
    unsigned underflow causes OOB scan; rtw_get_ie() uses signed int
    limit and returns NULL immediately when limit < 2, so the wrapped
    value is caught before any scan occurs.

Alexandru Hossu (2):
  staging: rtl8723bs: fix Challenge Text IE length checks in
    OnAuthClient() and OnAuth()
  staging: rtl8723bs: fix missing frame length checks in OnAuth() and
    OnAuthClient()

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c | 16 ++++++++++++++--
 1 file changed, 14 insertions(+), 2 deletions(-)

-- 
2.53.0

