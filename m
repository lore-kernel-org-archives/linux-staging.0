Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B044C2D780C
	for <linux-staging@lists.linux.dev>; Fri,  5 Dec 2025 20:28:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966494; cv=none; b=ezGW82jiXL0biwt2LLs2HgZIAnAvhnfjHjy8iGTPFoogervNFWFfo+H7Uwk9JLt3Qv/iykJkWIvUhPmnIYJiL2dFPMMytGuufWSxxNUp9Uf53Evsj4Rb+buPkYweY23LDvr3pfIWnznyJn4qxkUP2QNdrAMICA/59x4nczCe9Ps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966494; c=relaxed/simple;
	bh=EVOhk1HI6FciASKyQp7+FOie/7X+cAATsS5lmRg1qfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gbpkJur92LQ/trh5+9k2UmBpRa/0oaeKKw6gSBtOOw3yBukCKoACFdVgd/6uFz4wn3qkmB9+OkVeU1AyaM3fFdVk6BOL0jMe6YMlOX2SKdfIWLcqyfawk4dDIMyZArOOqhATVDPcgzbR3QL2qK0S5pC0yWS3eSIdITXEDau7kAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJiW+PNd; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJiW+PNd"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2953ad5517dso25331105ad.0
        for <linux-staging@lists.linux.dev>; Fri, 05 Dec 2025 12:28:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764966492; x=1765571292; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SdEQYEeEhg+Pxb0AQxBFfKIUgC+j17YfvZoVKrA407E=;
        b=CJiW+PNdLHjABxK+IIbychwwJh0srte/qWGbG8SRW6QaxTyuMEuH0e3OeUmUp2Ha/1
         Hv36hGv6/PMELjkHAWaTB5RQOze77WnTwc/2pKVImIVmDKiqEYUHar8U/r5U0Ah9fQD/
         FEOkxnjlx5/4vNEqOdCwIws8T4E21ktpNTTnO6cevvx5EMKO6YCeKOdFG4Tcj3l6p6n+
         8qDiEBOE+zv8a8Xebe+2d+gh/Kc6pzImZsNKxC1rh4RzdnD2RK6Q54S6Ef9qNuWGmtFT
         pvzQ/I4As7mSESiIYvHclgl6LzbQGQUEsyyMWmbkj4z1QeX55t7wJA3GTUqSUZRvr+HW
         eloA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764966492; x=1765571292;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SdEQYEeEhg+Pxb0AQxBFfKIUgC+j17YfvZoVKrA407E=;
        b=lWhW2OyRkR0dJt0l9Ekh6Z1ZChnHgZqTXQPB4dY+G8TWWwqJxMdu3MNXRWWmsYaZMz
         FSUQxAq/zcewCxZxJ6YJ2JY+OQ0Ry+q+FOtBS0+fPpUFLTxsXkvjntLeF1mG7pcESx+3
         l84B4FyE4VpPIPsf0mxHEqacDZ7PlECXYM9BwWaNwtBfUsLu1kdvVbxyIWpUrhHup1+K
         HyltnyQ/zkkCRVjCFkSFVJynYZ1xeSwsxOWghDpZqCJ5zDlWRFT2NR6+90Zbd+KSJ6J7
         ksrlhYziqijZwGwx59a8iShWWVXgHsKcK9mPFabcrSr0NkDCX0PEfJC53c2pTIM1eN59
         Fdfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmoblqXkTYzNn67i3loVGz/uzpkbgMqaylZHEh+hYLLAUFusWyKDZzwhcV6PHTzkCG3ZRXHxm28HpOT42H@lists.linux.dev
X-Gm-Message-State: AOJu0YziYbwpZWQjtEEVygSYV1lG5SNgyVila3ftCftTGLmL4nrfSpG3
	4hvo+vKTHJ7MzRxUreO9YRC/s3i6narGu8kH2f8/K6wdQd2rugS+kiYv
X-Gm-Gg: ASbGncuQ9VPM46T05nkq+QGNQxg9j/2VIfBZktwmYFhkalk5L6JMF/KseSZWJoiXHTm
	42DlGzCapGa0A7TwnY/Ns6TxAL/7N3VGBubg7Kq9G/nJxjKH+NFXpzJ0qGpGdPhtDYkisaRDHkB
	iyT8+CG5DX8iD4CK+yw8O670+mQWnsMHF/6Lzm4xU9I53hgzNE+jm+u6q7I/nJzv40X41BMl4fP
	Hmc3Ygr76ujUrsvfLEztbVPBpITr3hDQ14FrPx9d5e9DfK9BWBWpJ3t9TbivPQMfYNJpMa5ufJ3
	SshSzn3XiYOQCGuAL1iDMrDC/wKsIg43WDz5b0lmjEAUKyZVuDb2FmjYLuRu9G9f3kZRspfPegq
	Ylue9yRlEQYMMHgoC0zra+md6Oga0WTshCIh5Npc/qlBuMZT73KBAoKzYiRTKqDvZASAHGbGU2l
	0AC/x92t0amJlBjQc1eGBzNe2/fmZT+NVKZnm6/U4tzk/rlhmgNNthVUOnatk7Mx9+jN5A/txrk
	7+4jgoUmdlv48tXFGWDfBjR8K5yulHPibjFnSSsUKfO0FJXzu8LVYs7ohU6iWaMKoBkNMTN
X-Google-Smtp-Source: AGHT+IE7SZxJEEgg2GMHkTTXb7pxe8bAQ0ErqGaRLH8Fgf3Ui7YDuS3yTvPgzhY3cUjHgxCL6TCIsw==
X-Received: by 2002:a17:903:3510:b0:298:3a2f:2333 with SMTP id d9443c01a7336-29df610f3eamr2230825ad.31.1764966491847;
        Fri, 05 Dec 2025 12:28:11 -0800 (PST)
Received: from Lewboski.localdomain ([181.191.143.42])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99fa59sm57256845ad.58.2025.12.05.12.28.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 12:28:11 -0800 (PST)
From: Tomas Borquez <tomasborquez13@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Lars-Peter Clausen <lars@metafoo.de>,
	Michael Hennerich <Michael.Hennerich@analog.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Tomas Borquez <tomasborquez13@gmail.com>
Subject: [RFC PATCH 0/3] ad9832: driver cleanup
Date: Fri,  5 Dec 2025 17:27:40 -0300
Message-ID: <20251205202743.10530-1-tomasborquez13@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is a general cleanup of ad9832, with the purpose of 
graduating it from staging. The main changes are removing legacy 
platform_data support, converting to IIO channels with read/write_raw 
callbacks, and adding devicetree support.

I'm sending this as an RFC because I have some concerns about the ABI 
design and would appreciate guidance before putting more time into this.

Patch 1 removes the legacy platform_data support as suggested by
Jonathan [1]. The driver now initializes to a safe state and lets
userspace configure frequencies/phases via sysfs.

Patch 2 converts frequency and phase configuration from custom sysfs
attributes to proper IIO channels using read_raw/write_raw callbacks
(This is the main area where I'd like feedback).

Patch 3 adds devicetree bindings documentation.

Design Concerns:
1) Channel Organization and ABI Break

   The device has 2 frequency registers and 4 phase registers. Since both
   frequency and phase must use IIO_ALTVOLTAGE since there's no better fit
   (as far as I know), I've organized channels as:

     out_altvoltage0_frequency  (FREQ0)
     out_altvoltage1_frequency  (FREQ1)
     out_altvoltage2_phase      (PHASE0)
     out_altvoltage3_phase      (PHASE1)
     out_altvoltage4_phase      (PHASE2)
     out_altvoltage5_phase      (PHASE3)

   The old ABI used out_altvoltage0_frequency0, out_altvoltage0_frequency1,
   out_altvoltage0_phase0, etc. 

   The new approach felt cleaner but I'm open to alternatives and better 
   ways of mapping them. Is this channel mapping reasonable, or would a 
   different organization be preferred? And is the ABI break okay?

2) Scale Attributes

   The frequency scale is 1 Hz and phase scale is 2*PI/4096 radians.
   I cannot use info_mask_shared_by_type for IIO_CHAN_INFO_SCALE because
   all channels share IIO_ALTVOLTAGE.

   So instead I'm using IIO_CONST_ATTR for the scales:

     out_altvoltage_frequency_scale = "1"
     out_altvoltage_phase_scale = "0.0015339808"

   Is there a better approach here? Or should I just document the units and
   skip scale attributes entirely?

3) Remaining Custom Attributes

   Other controls remain as custom sysfs attributes:

     - out_altvoltage_frequencysymbol: select active frequency register
     - out_altvoltage_phasesymbol: select active phase register  
     - out_altvoltage_pincontrol_en: hardware pin control enable
     - out_altvoltage_out_enable: output enable

   I'm not sure if these map cleanly to IIO interfaces. Should these be
   documented in ABI or is there a preferred way to handle them?

4) Implementation Notes

   - read_raw uses explicit address switching rather than channel index
     arithmetic for clarity, though phase values could alternatively be
     accessed via st->phase[chan->channel - 2] and directly in freq with
     st->freq[chan->channel].
   - I'm unsure if mutex guards on cached reads are necessary.

Link: https://lore.kernel.org/linux-iio/20250628161040.3d21e2c4@jic23-huawei/ [1]
Signed-off-by: Tomas Borquez <tomasborquez13@gmail.com>

Tomas Borquez (3):
  staging: iio: ad9832: remove platform_data support
  staging: iio: ad9832: convert to iio channels
  dt-bindings: iio: add analog devices ad9832/ad9835

 .../bindings/iio/frequency/adi,ad9832.yaml    |  65 +++++
 drivers/staging/iio/frequency/ad9832.c        | 264 +++++++++++-------
 drivers/staging/iio/frequency/ad9832.h        |  33 ---
 3 files changed, 233 insertions(+), 129 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/iio/frequency/adi,ad9832.yaml
 delete mode 100644 drivers/staging/iio/frequency/ad9832.h

-- 
2.43.0

