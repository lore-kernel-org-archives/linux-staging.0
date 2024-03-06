Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64E9682D9C;
	Thu,  7 Mar 2024 12:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709814031; cv=none; b=TUIqxmL6u4Z9l9r8vZyaXaMZzho6WRiGk3ADWIk1JJHPD1gAnYiQURiao1YY+dPREuzZX1TXHI8lwf88B+Ron01jKxsWDuZJnFSaIltitJ7995yWppkBSZJvA9ELC8kSozR/67NEgzGZgIzVO9FFRsfFTEKlRXlHdHcAyqBAA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709814031; c=relaxed/simple;
	bh=4w5zl6TUS3QXloyAcO1HPmXcKwy/Z1wjKEeqefd4KdU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=S2SHNuHdkhhIRLmI5dgru8XS8cYIhdFVFkMiZvJz5/WgYp2Dam0WYDr8iTyttM/7Hx7TW6Pu7oPzJasc0j0TH0UipsqRurfl94zv4o5X1NTpcQdmq4lRL3OEr5T/ix+N+yeKmUUnJjH2rkfgp7N1800v8+jk0o4ltr1iWY8ibaA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L/a61Sxm; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L/a61Sxm"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a44cdb2d3a6so124507266b.2;
        Thu, 07 Mar 2024 04:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709814027; x=1710418827; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2phTydufIsoa/Gh4YVm9MflyXi8vZV930MNRewLcHwc=;
        b=L/a61SxmsPeWxv6SOA9EXF5/jZN/AEeET8mbgqPRpLlTutckjrys3u5aDCzwA57A4/
         1yIBXuKZhxweFU+GIpX1QnrQwghKb5TlNKUsGcOHW1jR1eikBSs4vqHVH0vt8qWX9v1f
         y/NNKP2eYLiUJ4L0C5fiZYqcb0DApgdxfgs6uUVRf7lovPzYoX5bfQWNYCoNdkGEZlGr
         YSLuDehH8MEheQ4o2RVtecUDhoXoe7fuPq9p8KPI2d3e8o2KSIHfFW56k5G96Dl/RzwP
         4RQJJj6HDhMK2XbGaI0KAyYKtNKP+N0N8VtJwBcbVYZsH/vibSP0m4WmsBJy1l4Ztr2H
         A4dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709814027; x=1710418827;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2phTydufIsoa/Gh4YVm9MflyXi8vZV930MNRewLcHwc=;
        b=atbN3O5WFyJ0dtOi40pvzh5Vq8i6J0UXrcaQx4ilhknW2+5+XaCn7f9nNxGo7dbcbD
         56Xq4gZQRIEZ/YYYvl0TFHXJNkYYnSfYk8T4l21R33RhKE3nvrJ/TVB5wFo/GdJ/TDhP
         8Vm4SkAAuSEuNLjeV/pspK22Bsbnz8S6XWWJobIJegDhXCXi0rVnjYfL/XGCJItDbni/
         0EyWyCH3xEhrRABu59Ogt63fC5v2zW+Ufr6A09y8jV99aR1gVnl65ip4obxcGltVySOB
         B3Sn9mTNFwXQbddKZz0YmIziBdWLdjDy2gwvgVVehnhIPAr2iO29GUX8R/aJHsFgtDKx
         d8Gg==
X-Forwarded-Encrypted: i=1; AJvYcCWOv/C9RB9q7ulotSJLkFg1N+AFNxh61RbtQyl2eYynZ+nBa/Kgug5IhVevYdmIEG6MEyi/62icnjkcmGKLv8y6mgxBlDG6xYI4y+1N7UbVAGy9s8GDa4YCmwFD6kARjf+lMoqzkPcm8w==
X-Gm-Message-State: AOJu0Yx/Ocqa2wLXUhPbc4paqzqsV7+tPpFKrHwbkH1tCn+8A+BeCIx0
	xvZnCqQDV3uOFw2GbvXuEVISC0qX5hqHgeikpgWQn3qUuFhRTWF06lgvQHkKBMM=
X-Google-Smtp-Source: AGHT+IFhzoej6AWe0dNE52wAhOEs2pf2fNNjIbcmjDhN/bE3eOoKTgVSQ7LCO1S4rRZiu93DCGC82g==
X-Received: by 2002:a17:906:b347:b0:a45:acf3:a103 with SMTP id cd7-20020a170906b34700b00a45acf3a103mr5141748ejb.42.1709814027407;
        Thu, 07 Mar 2024 04:20:27 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id l25-20020a1709065a9900b00a45bb9b81d6sm1643073ejq.195.2024.03.07.04.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 04:20:26 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v2 0/8] Rename Variables in sm750fb driver
Date: Wed,  6 Mar 2024 04:36:03 +0000
Message-Id: <20240306043611.98074-1-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

This V2 series addresses the Avoid CamelCase checkpatch warning by renaming
the variables in sm750fb driver to use snake_case.

Patch 1 renames variable sii164GetDeviceID to sii164_get_device_id.

Patch 2 renames variable sii164ResetChip to sii164_reset_chip.

Patch 3 renames variable sii164GetChipString to sii164_get_chip_string.

Patch 4 renames variable sii164SetPower to sii164_set_power.

Patch 5 renames variable sii164EnableHotPlugDetection to
sii164_enable_hot_plug_detection.

Patch 6 renames variable sii164IsConnected to sii164_is_connected.

Patch 7 renames variable sii164CheckInterrupt to sii164_check_interrupt.

Patch 8 renames variable sii164ClearInterrupt to sii164_clear_interrupt.

Updates since V1:
Incorporated feedback from <gregkh@linuxfoundation.org> to fix the
warnings in the patches and create a patch series for the same.
I have also compiled the entire kernel and it compiled successfully.
(I understand this is not sufficient and would be happy to run further
tests. Should I run kselftests on the module?)

Dorine Tipo (8):
  Staging: sm750fb: Rename variable sii164GetDeviceID
  Staging: sm750fb: Rename sii164ResetChip
  Staging: sm750fb: Rename variable sii164GetChipString
  Staging: sm750fb: Rename variable sii164SetPower
  Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
  Staging: sm750fb: Rename variable sii164IsConnected
  Staging: sm750fb: Rename variable sii164CheckInterrupt
  Staging: sm750fb: Rename Variable sii164ClearInterrupt

 drivers/staging/sm750fb/ddk750_dvi.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

--
2.25.1

