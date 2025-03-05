Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5289D2512F5
	for <linux-staging@lists.linux.dev>; Wed,  5 Mar 2025 19:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741203388; cv=none; b=d/PLENG880wAqSh0nVBy4VPslrHycAcF/w29DMQ2qS81opAgUhYvrPX3fCn8E2U7rgStig/G3WveEVa+UwYlMVTd42OwqL6NbXQYJETWFreHp/z3khRdlpFXkaxcDdd9UOirPA4+UkJ93jnaXswAu7tASUAOXteeCLR3cq6ByPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741203388; c=relaxed/simple;
	bh=Ks8X7EPJ54VCXSHM7sl3Hrc7gHBCTE9UxNQ0VdzAcDQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RjWAmRxO5E/TyHAwAYr2NqQkn4LiFnu7KGg02vQkKqGAUoOqbX2ECH0SqInN2v3IbboZGVTKbAi7S0hrWVCljCten3Iw/kHC15g39Q+Gj933P74ts1zY8geRLLlkBPYN1JSz6G0vc8eUQ2dpY7Y0B7iDl3my0i2jmHijgq/g4WE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBIaP4iV; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBIaP4iV"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2f9b8ef4261so1884074a91.1
        for <linux-staging@lists.linux.dev>; Wed, 05 Mar 2025 11:36:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741203386; x=1741808186; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BX6Xw+vu38MTqxN013edOzT70ivLZgV/Gxi462fO01Y=;
        b=OBIaP4iVgYLuDub9/NcjSRziMRSjRfHh2NiIPljFEc2zKR+PcK2bTrZ4eKVq2NnWx8
         rEveidGUrFvnN5Bf6LFH0VdmXaMir0FQyr1B1ihq6zSRwxLQedVIp6WgCQ94S2cQM7cm
         lC+elWh8KBkgfak72YpWpc+osZ6xOY/KLTOglUsjMQEOi+jGoF5HfdJfy7OYgxSuT0fl
         WV3omQBYunpE4BI8lYTIuYCD0+MoJXdJJCBnEktL4jDoGEBoGuV717bRktLvNjRLSyx3
         +LeQjUd8IBujqaSVukuTWLHTaWA180gIZaMKe/we1HKXhiroFC/vWmzBWfk5ccRJUCfB
         Vlng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741203386; x=1741808186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BX6Xw+vu38MTqxN013edOzT70ivLZgV/Gxi462fO01Y=;
        b=XsZUPR02dM26/73SN0xO8XsnVZOdRrxKJgiNDc6HJPeQOuXAy0NGXoBoqYPwql2LQS
         gyqL3a45xlO7ybVuYphD3+Kr4glI4NKdbhX3TE/MOCZBHdQ42PlQuoZ5HjAExAf2tV5d
         ze8ClMIWUUeMaMBx340sdSXk3hwNAXQA0sdCbFeOZgnIRnIUfqEke8dJsCrbsOsjQeUo
         UkXn17bO5lL1mRlaSftCpPmVWZpU5z55RsDwfrhc2zqpacaQzFHEck64sIRfb3OYsxOm
         X2hTgJQ944/l+Z7u+CqGDtUWqlEM6a3PdX91lO1yoSWiu0TVGN6zYD3hNxgMo9n3pLRX
         cjBA==
X-Gm-Message-State: AOJu0YzW/nBjxUcbPTRk+fJFAV9xXUqky0Xi+MevGPUiaKrShcplv3E0
	ZNNCrAS31EKxNdj19/RaL8pEG9EvBHYF1vgVcaNIxHM8lIf3+Y0m4q40aw==
X-Gm-Gg: ASbGncvUBg/GBAjTZ7CrLRVx5NPdy+dLq+nP9OV4pqy+RSUx/U6rzgjCcsmiVYS6K5r
	9AqC4kkCjooyZEd3zJB72o3EACpPDLy55HEkbstriDdQU16voxij5zJFAesSNVQnS0TEs2ezLEu
	9UI2buMAZ1oqP1kiLEusJEevnmvKIqaPrB8e/DF1J4jZjNpJ4rnctoZRrosi1RnmJkLMekcxfxE
	7Tbf1IjUd+tuLoNontobMLU+Ep8LvSeHj7MqXrCuG9WzTswXFwVBIj5yf2v5+TGkyF2P/Vl53eN
	gj9o6qTyNP6EL1CMYdEhe1S/9b7+e3s5NNkCLug0eIS0m7DqYbV+9l5joHuk
X-Google-Smtp-Source: AGHT+IEkUCi8wPyvxb82rYx6xJGYrqZ1lV9KvMi9G2GkzNJ99fuVhxFU500SJah2gefci1i/MU3RIw==
X-Received: by 2002:a17:90b:3b8f:b0:2fe:9730:8e42 with SMTP id 98e67ed59e1d1-2ff497a62femr2867938a91.3.1741203385976;
        Wed, 05 Mar 2025 11:36:25 -0800 (PST)
Received: from localhost.lp.veng.com.ar ([200.10.125.114])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff4e7a2bbesm1898148a91.37.2025.03.05.11.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 11:36:25 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org,
	arnd@arndb.de,
	niharchaithanya@gmail.com,
	jiapeng.chong@linux.alibaba.com,
	linux-kernel@vger.kernel.org,
	Gaston Gonzalez <gascoar@gmail.com>
Subject: [PATCH v2 0/4] staging: gpib: some cleanups in lpvo_usb_gpib.c
Date: Wed,  5 Mar 2025 16:32:14 -0300
Message-ID: <20250305193614.39604-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.49.0.rc0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series comprises three kernel-doc comments fixes and one commented-out code
cleanup.

v1 -> v2: remove extra blank line in patch 3: 'staging: gpib: fix kernel-doc
section for usb_gpib_line_status() function'

Gaston Gonzalez (4):
  staging: gpib: fix kernel-doc section for write_loop() function
  staging: gpib: fix kernel-doc section for function
    usb_gpib_interface_clear()
  staging: gpib: fix kernel-doc section for usb_gpib_line_status()
    function
  staging: gpib: remove commented-out lines

 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        | 26 +++++--------------
 1 file changed, 7 insertions(+), 19 deletions(-)

-- 
2.49.0.rc0

