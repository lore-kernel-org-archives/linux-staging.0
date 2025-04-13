Received: from mail-qt1-f194.google.com (mail-qt1-f194.google.com [209.85.160.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94A6C14B959
	for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 07:32:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744529564; cv=none; b=H1HayNNFVrIe0sPuX0OSQqh7ET2Kd9alNYFpzZ/zKh3Sbklb9qOBxwJGvdEOI7rVZWKQJZN1C9pIGi3e7BfX1I1jBzggYVmTnM/SQEFPig7bImPlWwpE65bGlROOpzX1FXroIvSNYJ38Zt9/xzheAGzRYZjK84VpxhV/4H4D0zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744529564; c=relaxed/simple;
	bh=9Ijdkg6jBIROp0oaiFxxY38TjJl3H8rWa18W89bmf4w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SOaesA7qiWNhjacL9zMtiUI/QyNYSHpXijv75R6ZUWj3mx4womCp2esFSVM0G5pyBB9dz68m0/NFy578BACown6BWOlTL3q8O3PTUSB3/xCRX+Fj5Vsj03lo+qiFOE1CdXo0+tLjA/CeIA0WBCTiTJAyYi6lQM6OPsiq6eG3Lbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aO5nO/ew; arc=none smtp.client-ip=209.85.160.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aO5nO/ew"
Received: by mail-qt1-f194.google.com with SMTP id d75a77b69052e-47691d82bfbso72229301cf.0
        for <linux-staging@lists.linux.dev>; Sun, 13 Apr 2025 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744529561; x=1745134361; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=aO5nO/ewun3ko/n8zPg64y4VKEfgq+hEbHbKbky/Zc3ZjpB3gfZzV0QUGeeciEfJj3
         aib4xkw/ZWdS0bYMO9MgySlWEtn4qqD5K7PYMASkj5yWlaZsHXzMXhotQcJsy4g0TakJ
         V2VX2oh4s+zZbeL5mvUIrMjq+tfC4TA78dgJTtPof7QiPMQUtGpTau7VOE0rmqKryPrt
         elkZbIAyarUZ5VBMQ1ZPTRUDvB+ovjyzLvAGW3fuDesj2dJw7AA1SM0EXm8kp5LnDP7s
         Y8nZ/H/rQcoschaUFREQLFKnYK62JzrHVo0GS2kbJhVbgSMyKTfvxxSKg0V5E4awK3fD
         FyEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744529561; x=1745134361;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c/8etCy8vUBX1D7mcRQ877u8kgqMXt59GuVCcFTXiRU=;
        b=tAY8nbyrJoDzTiX6L2GppgHVZ3PK0HlWB24/uADPvCF0oLMyf0MI8oRZ6CVrH2OAlI
         lcq5pmhKAcfxwQJAs2TxU8Kz4JyfnVVd8wDoQopVbSk0YKVrBSsaRLvOqJ81xlgZFWvs
         R+1PkwqxdommCcJ46N9QDqeZPVma/7+8L9nZMaF+suojoQbHlWukL4c3Pd5HfdUSOZ+Q
         xWKLZwymQ5I0GTIVKG2K3srKJU/SWTsPiu+hf74S0bDHp3iG7QLbv7RfLIUp/L74DNXe
         87/CNykNNOS3yH0TjZ2L9yz6NXHs9rf8YHXmxibG3XtmSeYeJGN3n1JzOx76N+OVgLXf
         qF4w==
X-Forwarded-Encrypted: i=1; AJvYcCX8IxYreQNz3OjmFvchPs/OKLBQktQfpb69SIxYak44YIQ5FBu5K/E71FbiBq+M8s7BlrsVeMZ4HM1rS8e1@lists.linux.dev
X-Gm-Message-State: AOJu0YyaNmxaq2oQVWuuQ14k4K2Pvx+T11KvZcqsmDfxhjwjy1BHbBuH
	8TNnLVd0rJayNI21GW9L0aiYnxzBW2dooRQPVEOaLZDhKWWg+IJc
X-Gm-Gg: ASbGncsXhf8D2VPaS2paHGie2rH7AH7SgnhPZV9WAHZ4gVP1LZXz7y2YcoC8pLL61UU
	h4zEKlAb1BxOXEqr8hz7p6hESpJqOzRls2jqWibf1EjAq+NGMNCAjENp3jU/Lf7u0yV2N0N95ts
	Scj/A66DGVh7PzNUG3WtjfF0W8Df6isETE+6Snev6M9M212VXMiFsK+nIRxxWKxE+9EyvjUDeIO
	a3tMUlSplzrr5a1Eb0p/UpLEgq3fxSfgou+nQTYuCywy5weATIUE/iiqWUwzpqXxFs7mX08A/SI
	zZ7eLcu4Lj4IrURHac9M/um3NNWBhd5j242KlrYbhnLynuK6jo1c2E2me0tqoJNrLrWULr5CFQc
	GyU6xOp7eYYP5aWdFRg==
X-Google-Smtp-Source: AGHT+IGOP+2OtvsS7YolVOB2aGg75agobNToUGsbXzhY2oPmkrtUdrL5JFKn/GUT0mDN/OPwZtecvQ==
X-Received: by 2002:a05:622a:1902:b0:476:964a:e335 with SMTP id d75a77b69052e-4797755aaacmr88773491cf.24.1744529561246;
        Sun, 13 Apr 2025 00:32:41 -0700 (PDT)
Received: from UbuntuDev.. (syn-074-067-077-020.res.spectrum.com. [74.67.77.20])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb0b58csm52142401cf.2.2025.04.13.00.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 00:32:40 -0700 (PDT)
From: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>
To: johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	hvaibhav.linux@gmail.com,
	vaibhav.sr@gmail.com,
	mgreer@animalcreek.com,
	rmfrfs@gmail.com,
	pure.logic@nexus-software.ie,
	ganeshkpittala@gmail.com
Subject: [PATCH v2 0/4] staging: greybus: cleanup, API migration, and refactors
Date: Sun, 13 Apr 2025 07:32:16 +0000
Message-ID: <20250413073220.15931-1-ganeshkpittala@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series splits and improves the previously submitted single patch by
breaking it into four independent, logical changes following kernel submission
etiquette.

Link: https://lore.kernel.org/r/d683962c-e8b7-4adc-9902-483976197637@riscstar.com
Link: https://lore.kernel.org/r/5773d200-1d9d-4d6e-b01e-10d962ee9e8e@quicinc.com
Link: https://lore.kernel.org/r/4f47df18-e98c-4f23-afde-3fa8e9fd0f86@quicinc.com
Link: https://lore.kernel.org/r/202504010829.vIzweYue-lkp@intel.com
Link: https://lore.kernel.org/r/202504011217.iRb2Bbls-lkp@intel.com

All changes are isolated, reviewed, and tested.

Patches included:
  1. Replace deprecated strncpy() with strscpy() in firmware.c
  2. Replace sprintf() with sysfs_emit() in sysfs show functions
  3. Refactor gb_loopback_fn() into smaller helpers
  4. Fulfill TODO by splitting get_topology() logic in audio_gb.c

v1 feedback from maintainers highlighted the need to split changes and avoid
unrelated whitespace or formatting edits. These recommendations have been
carefully addressed in this version.

Signed-off-by: Ganesh Kumar Pittala <ganeshkpittala@gmail.com>

Ganesh Kumar Pittala (4):
  staging: greybus: replace deprecated strncpy with strscpy in
    firmware.c
  staging: greybus: replace sprintf with sysfs_emit in sysfs show
    functions
  staging: greybus: refactor gb_loopback_fn into smaller helper
    functions
  staging: greybus: split gb_audio_gb_get_topology into helper functions

 .../greybus/Documentation/firmware/firmware.c |   6 +-
 drivers/staging/greybus/arche-apb-ctrl.c      |  11 +-
 drivers/staging/greybus/arche-platform.c      |  11 +-
 drivers/staging/greybus/audio_gb.c            |  36 +++-
 .../staging/greybus/audio_manager_module.c    |  13 +-
 drivers/staging/greybus/gbphy.c               |   3 +-
 drivers/staging/greybus/light.c               |   5 +-
 drivers/staging/greybus/loopback.c            | 167 ++++++++++--------
 8 files changed, 145 insertions(+), 107 deletions(-)

-- 
2.43.0

