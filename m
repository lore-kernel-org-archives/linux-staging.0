Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45B3C86AE5
	for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 21:44:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708551877; cv=none; b=WTfdAiGfwu1NioKGF7jWE89V7jk2wdgvFPzNPf0Am8LuTl1u1OxbBACKeOsQl9dP3O8pjXXJzHXAEPahCXrsFKw7cyAr+0H2xn/PQMXxtJqp/l1AZ1PimdZTw77P2GyeDNHVQw4XSBP1VN+YZS5ovbBziv/tvhg9iwl4+yoaTxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708551877; c=relaxed/simple;
	bh=w6/upBbbVOX2neZWjPgWOwjLXbT/MJOWIoLuxKe+ycQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j2qvM32NWbzQcxKM6R6BBUrcGkvSFPxdR9MDCOiHmLSChC/MaeOzxq3tX82RarRqUQp2l/IgSkDmg3jqtWO+oTuAo1sATPLnlJjmGFCc8U4FabKixmHBlEc9Fws4p4uXuA2kWYngeSuZtE+3ArmZENs4dlS60d1p7fMkBPwf/tk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gE4Uj+kA; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gE4Uj+kA"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-33d855caf7dso82439f8f.0
        for <linux-staging@lists.linux.dev>; Wed, 21 Feb 2024 13:44:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708551874; x=1709156674; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=O9gRpd2/XJA05Kc7l2MYELGuRxnYw+uQz71chRC49KQ=;
        b=gE4Uj+kATRCV2y9BPj4iLEotanrpye/1kwS42xvajWF8DWNqj+qzM3S3h7xAiVSIfp
         q7dX2VhetL3/9xa5RZmAHBaLtOlnn3WUX5cKUM76QBJhw1cT8A48gEVx6kCdPm7qshxD
         PiWTo17QcxC1PzW2ltdCCKIeg0Wpuic1ECHGCJL67hBHi2Lintz8/W+8m80vk/FDCkH2
         EAbP65oCTRcFrvTuzcNhA9fIz8A47E/Tzr19aA1Jz6xwyX6WPBbUK1VR9N0Li20Qatk/
         vdtQmhEvxIubU4xvIkxTseDeU9ezCSjUKsmYUaWeTH/JU2sbJR2u2tLnyWUjU8lRQblk
         RqYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708551874; x=1709156674;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O9gRpd2/XJA05Kc7l2MYELGuRxnYw+uQz71chRC49KQ=;
        b=MaMivvaairXOGaY+JF83ReBm1ekm6jrnf3zwc9v3oeRW5StN8EXlFAHGeM5gO0tTM1
         NqAla3gCuaSo9OUFVQ6ILeYGOr0OrneZ/jdVhNXI88pl7fhmgkYZK4JOFb+gf3qPm0He
         p+qkbKycUdgo2xVh5ptAZKw0dG1svocHIJmXvFzAFT/r3i1kbpy2BDcdNFhfOQszEq0j
         Ny9YG47nPktzdc3nDcN3qsKme7JmYYwJrq45kRGRckMnzeY8iMjuRIz8Uxxj0/zH3aB/
         78BqklLiCb/H26AcbexxzWk/hlyh1XT0AWM3bkl7DUbs7TFRxuccYMspcGaKCP9wymdb
         J9tw==
X-Forwarded-Encrypted: i=1; AJvYcCV0+C3VlcGYUQQnZeM2A+yuDEM7mY4oLH+YE3DZ2aUa+99/xZmo656MRbGTpclpHPAQuxrGWsYK89t0IsVJ1g/aGrAlkp6qTLJfvPJpLA==
X-Gm-Message-State: AOJu0YzA4hZTFB/KCXNX0Ldc6M5uYJsqMH3z53wt6F3chMjtVzaUOXbI
	alDeYjI4HJcPiikLccBKANhQ/477yEb2DfrRwK9ZfVi4TJEbj5lpVeliDsEwr70=
X-Google-Smtp-Source: AGHT+IHV2f6siKZmt9s061XJbXxmOcZFs4yDgm7j5gmLk41hx/4/Emys54msjb15wy5+dMwF9Bwblg==
X-Received: by 2002:a05:6000:38d:b0:33d:8cb5:142c with SMTP id u13-20020a056000038d00b0033d8cb5142cmr120816wrf.1.1708551874235;
        Wed, 21 Feb 2024 13:44:34 -0800 (PST)
Received: from matrix-ESPRIMO-P710 (p54a07fa0.dip0.t-ipconnect.de. [84.160.127.160])
        by smtp.gmail.com with ESMTPSA id cl2-20020a5d5f02000000b0033d4dab14a8sm11991310wrb.22.2024.02.21.13.44.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Feb 2024 13:44:27 -0800 (PST)
Date: Wed, 21 Feb 2024 22:44:19 +0100
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 0/8] Remove unused variables from rtllib_rx_stats
Message-ID: <cover.1708461563.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove unused or unevaluated variables from struct rtllib_rx_stats.

Tested with rtl8192e (WLL6130-D99) in Mode n (12.5 MB/s)
Transferred this patch over wlan connection of rtl8192e.

Philipp Hortmann (8):
  staging: rtl8192e: Remove variables tsf, beacon_time and Antenna
  staging: rtl8192e: Remove variables Wakeup, Reserved0 and AGC
  staging: rtl8192e: Remove unused variable bShift
  staging: rtl8192e: Remove variables bIsQosData and RxIs40MHzPacket
  staging: rtl8192e: Remove variables fraglength and packetlength
  staging: rtl8192e: Remove unused variables nic_type and RxPower
  staging: rtl8192e: Remove unused variables bShortPreamble and
    fragoffset
  staging: rtl8192e: Remove unused variables ntotalfrag and Seq_Num

 .../staging/rtl8192e/rtl8192e/r8192E_dev.c    | 20 -------------------
 drivers/staging/rtl8192e/rtl8192e/rtl_core.c  |  2 --
 drivers/staging/rtl8192e/rtllib.h             | 17 ----------------
 drivers/staging/rtl8192e/rtllib_rx.c          |  3 ---
 4 files changed, 42 deletions(-)

-- 
2.43.2

