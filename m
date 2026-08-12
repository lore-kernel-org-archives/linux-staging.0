Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F9D3AE718
	for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 20:55:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786568118; cv=none; b=bnJdFCIT5x9l0ycLSUcKiPjkDz2ixEftNJl/InqFrwxSMnI9DvpdX7eGNKCelPA/dKtS1lou1JbL26lvpVTBe5POWiFXzTQqM2I9q7cJ3ZR1b8yX0Fpx3T9xvZ1C4GYNs1YmpAF7Mr3U25wBRN6xlwjbMqWRX+4wHgUCVYpywSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786568118; c=relaxed/simple;
	bh=PfcYP6H4inJEoqY/AAT8PiQXeTTNIx/6j6aalZLG9oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hjdVonCXmLLZo+YUo+XS6Spb4+zOUyJTRMywGenti0aeuBF43yw1HJozpcRkMVzNYr2e/l9w2Ko/ebMtZ/9e66M7YshLwY53o/hlxag0bioRV/xYOL7kudAksSLzRo5x92pzABNgyFY9mZKmq/tfPDR5smmhkYGM6WjaCiy5Ewk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V35g4p10; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V35g4p10"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5aeb8c19017so2148006e87.0
        for <linux-staging@lists.linux.dev>; Wed, 12 Aug 2026 13:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786568112; x=1787172912; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fMlv8yck8DnDJ5KocQRB7E2A7xY09xdqY5AZ8i/KHD4=;
        b=V35g4p10+7E7LSLjOEobAOHNz0kzLU7KdqZncgvtF775Xne8NiavF8Vz2E+88A6vEZ
         OA/98vXdVsVkWKj/WV7V3ciiYYm6LwqtFCkK274Yd4RxtpLMX5phBkD6o5mZiMWDOx0d
         ehFReTUaMpotJlAIURjf5lh1pRbtDOUjmieOR0bP0fR+deeHfx2AiuMwT9vHx5cIvqYb
         itwlmNNhOeyumFpCbXTI7QceBh5ae2RlPSzS9A2K2ABKLqgAlvgikyjH6KOoznqzQlfr
         vbG+2HE9x9CT+unzlTeG48paLa+AB2ZTu+L/vsC5nC948vZbo24vulB44u1ZMpz9kF0w
         V24w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786568112; x=1787172912;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fMlv8yck8DnDJ5KocQRB7E2A7xY09xdqY5AZ8i/KHD4=;
        b=m/78KItbRPqqA3dH+K462WkiNlN0B1PMPy1nLImntNdMOMb4cuqY84upPe9Jcc/ar6
         y3L+TOdsqqeVvw5n/0ko5Eumu26DltNPPPh6OZMjNbNc3uJ5nLuVbQz7cZfLjBlxOAyw
         Q1UowKrvVxJNGcWAoOyVLvFPzxhmfdUJYEn71eCbIIk3PsT0hRGYjbbvF0O6e8bOe0pj
         abHlGEuguBe9Ru9PBl1g50tCvuqVjNiQCGIvK0B26xG2iEF/9mWIjmPnxlgrvSofS3/B
         h5rmWEjMDfG8hZ3HjGMIqEkHMtx15j6b7Fz4B9wAcupWZetkEv0D2nhVK8qodmzW9v6j
         FWrw==
X-Forwarded-Encrypted: i=1; AHgh+Rp3ECO2S10JRuZAm4dCm+n69H6fFZac3iz6lLLYOCu33fEFwiQkE8E1U10tsTyrtI192mxENjG7iQGvoWdX@lists.linux.dev
X-Gm-Message-State: AOJu0YxQXEBX/Xy9i8FO9SVGYRhlXT1eI7bePnnZKVQUi0n5ED1Ng16R
	14G7FPr0YmHd30vemt/ZnWeFXmporNAiCUtyizZW4vICBY7IT+c03C2b
X-Gm-Gg: AR+sD12csjO4NnjiiKluEFJeCIfyzsNjeuwgbCWOaSRYON5tvk+MAEiz8vqCpuWm3Pl
	u6eQrkNaZUj9EsezHGcbBr+EGISrspmIZYoDQgPNLFlhpExmNG5OWwpeyzQ7Bvq2oKkDIzFtrAd
	EGljuSn/6wgjvaY5omourRvu80SG6hWe/U/MNs1dphf8PuNyWjoRqGSglQLtwCDaNJw2c9DmUNY
	DYjC6zkG2+mXII2kbasGP2ySLygmiAX7N+SrCVZ8WGqtMKq1F+QxoRRagO6OOcl9PzHgIDq28hW
	e6FtzWGnCIkIWwOu3CslPAyit6+MdCnzFajK6I5RysTqoxzGJOJSb4NCofFvjIDHI9os8tAevPL
	TinPFp5ZEqHGwKQuVljPMC04s2/e4P740MkfMgGTzexd7lE+I8WsWfK/9rNzHVLxwec+Hzu1vSe
	0bgtiwZ65HnoMVgIlfGJYswnCAiAEAdvbY09a/fmlCSFY/2MSYykiXYIoDEAs=
X-Received: by 2002:a05:6512:155a:20b0:5ae:bcc4:c071 with SMTP id 2adb3069b0e04-5b453d065c4mr52158e87.0.1786568111514;
        Wed, 12 Aug 2026 13:55:11 -0700 (PDT)
Received: from archlinux ([94.229.19.199])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b4539e9605sm60999e87.22.2026.08.12.13.55.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:55:11 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v3 0/5] staging: media: atomisp: cleanup pci/hmm/ code
Date: Wed, 12 Aug 2026 23:51:33 +0300
Message-ID: <20260812205429.39181-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes unused functions and replaces obscure
variable-checking macros with clear conditional statements.

Changes in v3:
	- Split the last patch into two (inlining macros and removing
	  the file).
	- Replace variable initialization with assignment, followed
	  immediately by a check.
Changes in v2:
	- Squashed the function removals in pci/hmm/hmm.c and
	  pci/hmm/hmm_bo.c into a single commit.
	- Add commits to cleanup macros from include/hmm/hmm_common.h,
	  as suggested by Andy Shevchenko.

Nikolay Kulikov (5):
  staging: media: atomisp: remove unused functions from pci/hmm/
  staging: media: atomisp: inline macros for checking the bo/bodev
    pointer
  staging: media: atomisp: inline the check_bo_status_*() macros
  staging: media: atomisp: inline the var_equal_return*() macros
  staging: media: atomisp: remove hmm/hmm_common.h file

 .../staging/media/atomisp/include/hmm/hmm.h   |  17 --
 .../media/atomisp/include/hmm/hmm_bo.h        |  46 ----
 .../media/atomisp/include/hmm/hmm_common.h    |  60 -----
 drivers/staging/media/atomisp/pci/hmm/hmm.c   |  41 ---
 .../staging/media/atomisp/pci/hmm/hmm_bo.c    | 246 ++++++++----------
 5 files changed, 112 insertions(+), 298 deletions(-)
 delete mode 100644 drivers/staging/media/atomisp/include/hmm/hmm_common.h

-- 
2.55.0

