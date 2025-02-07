Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E3F1A9B23
	for <linux-staging@lists.linux.dev>; Fri,  7 Feb 2025 15:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738940693; cv=none; b=I40Y4C2y6Z73TLSSvWFjqYoe9XcjI6MdotazyqQZkcovLn7l2pVfhfiOUNVOLeFxaT6gup6ElxyOnnyISg2tJCr/NlT3J3s6koavJ0tTLO9d0+Rls7Vm/Y3eUPvoaJ2d5Wj4Ocw2P2S3i1w6Ip1jmBanrFOp1uD4J0rt7PzVeEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738940693; c=relaxed/simple;
	bh=WCu+d1nWgNWmEH0HioNi7/zlQOZ/COPLsZv3Wg+nOUI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Wn5kcH4ooSqv3/eYyBpP0iZ5sQB1YHTP1T6xSXPEovmJmhxa8HHGElcKIc7Pxe9w96k/+/LpdPPkZZKAwXBPjy6R7PICP+SnpwqwAhtgiGl0c94mbFQ+SCK/Bs/q/3dOOdIA1TT3Zhv8618T/kgR4xn8u32eMaqRss4q+P8pYlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kFnnbm/T; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kFnnbm/T"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f5ccd9742so1069345ad.1
        for <linux-staging@lists.linux.dev>; Fri, 07 Feb 2025 07:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738940691; x=1739545491; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iVGjPWgKQVcqmfxAXvNxw3qO1+HIN2RHmNMdDjIM+3Q=;
        b=kFnnbm/Tgx86hzD3HCCOGizGQoLcpuG1NOJA7/y/4V4/xJvq25uK/y3qFA6n4BEf5Q
         P5cloew4+lrs1iZ7oOS4GpOKAq0lN5gpHQqYrvHiOtvumPpn9aRVxwOh+kb3iQ9xkpcZ
         05r46fwEu1hEwbD2flt50heIG4AjVbROAfZod80nvWHqSgdcT9WJ2h+700cDAYNR+wH3
         z74bolAOs253Rn6bkT9pISpjowTpcwh3EyrcNNuxKyXaEqMdnlfQxoEIN+OmgtJtCIEL
         57ZU3Ci2qXkHwFbHknoPYRIkktlv2GLZPlMjusOLl0fkXlOC1xriKt/fUAmcsmmh41ew
         jPVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738940691; x=1739545491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iVGjPWgKQVcqmfxAXvNxw3qO1+HIN2RHmNMdDjIM+3Q=;
        b=axqlfzIaMnHXJWRLo88U74+OtosONIHIp8CEKZY4s1j/klvXHg13v65GNUExvOudyg
         6vCgjyP3rYT9kLQJX6a6bFhLS13LoQEuuRlgRonsVBBgUHkDuYwHW52DxPG4vDdkCfK8
         TiD/84Qf4cMM727ouzIAWRbe4YJofFkEAenHrGjvkVbGhzcj8fwIdkmryOU0jRyEkiMW
         gf2EfUQ7G39YHj8nuWE/Ff5VFGPH8yHqCDvvaxWia6B8CYVd5XtMuh2Xq3SDvlW/uK5N
         TD3JHqPiJo+LmWyX3tJv9kqN0Opd8lzSyufiHlbcWlQotQxOsfMUktLHPu/XwofnBCht
         CllQ==
X-Gm-Message-State: AOJu0Ywv8Gm3WNJcs8AQSjSbJUxJlN7GNBM2P0sitI9bc525iaz8i/DY
	4eKRbdrl+KZt2n/nhP1YuXOIvd1qymFnAhmNN31zb6cgwpjF70OGQUFogyhi
X-Gm-Gg: ASbGncts/huL9JIanu6a61laAAu/44CZGLzbfsNbCnOQ545LowHiVVhbA98Pqlj8ou4
	SMneWWYnXNn+os56jZoPEaXyaEGYDSqg+0s1ctnC/y3BmBahGvOp32GgGOQQrRGPn9v8sgIunYd
	r0ZCH9TpBe2tN/MFR3A5j+wnmNrIcdg7IA+Kc8m3D5LYVXNgUh9+ip55F3utpADcbtxGJWS4ESL
	lYJwY5XOCxJy02scuTme3J4TpHTM6IOqt4TW85YILmiWL9o9Q5r+xj4ngFlRGWdr7EAeq56Piho
	ApTjTZI/FZ8othq1qMsObP96L4Ds
X-Google-Smtp-Source: AGHT+IEVRFgO5DVOYljk9RqX7HCzeBu33NbjIYZOISfw7tLB1b9zY9CHaQFilc6mH4jHMCquxhf3Ag==
X-Received: by 2002:a17:902:b110:b0:21f:207:bd88 with SMTP id d9443c01a7336-21f4e6cfeeamr21443935ad.3.1738940691364;
        Fri, 07 Feb 2025 07:04:51 -0800 (PST)
Received: from localhost.localdomain ([2802:8012:30:9200:a83e:911f:eb3e:1cb7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3653b143sm31855815ad.54.2025.02.07.07.04.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 07:04:50 -0800 (PST)
From: Gaston Gonzalez <gascoar@gmail.com>
To: linux-staging@lists.linux.dev
Cc: dpenkler@gmail.com,
	gregkh@linuxfoundation.org,
	arnd@arndb.de,
	dan.carpenter@oracle.com,
	ajithpv.linux@gmail.com,
	roheetchavan@gmail.com,
	niharchaithanya@gmail.com,
	eleanor15x@gmail.com,
	everestkc@everestkc.com.np,
	kees@ijzerbout.nl,
	skhan@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	gascoar@gmail.com
Subject: [PATCH 0/5] staging: gpib: remove unused variables
Date: Fri,  7 Feb 2025 12:04:03 -0300
Message-ID: <20250207150427.153982-1-gascoar@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove some unused variables found compiling with make W=1.

Gaston Gonzalez (5):
  staging: gpib: cb7210: remove unused variable
  staging: gpib: eastwood: remove unused variable
  staging: gpib: ni_usb: remove unused variable
  staging: gpib: tnt4882: remove unused variable
  staging: gpib: ines: remove unused variable

 drivers/staging/gpib/cb7210/cb7210.c        | 2 --
 drivers/staging/gpib/eastwood/fluke_gpib.c  | 2 --
 drivers/staging/gpib/ines/ines_gpib.c       | 2 --
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c   | 2 --
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c | 2 --
 5 files changed, 10 deletions(-)

-- 
2.47.2

