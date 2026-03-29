Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52AB31F4611
	for <linux-staging@lists.linux.dev>; Sun, 29 Mar 2026 06:22:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774765360; cv=none; b=N902zjR46dyf/ldYZq5Zs8VvCKx9LhIim63OU+yOpl392tcUmR1ifr74zDTDvDtXS32JLNt0wvC1HO3hpjkzF/i/i0ZJZDn/mNSGVACLKXnsdaX7HAlhltwrQ+hpGPL/MttN3MMzPsBGLBcnBKcwgN3+UU5Qn7UDHA/fiHzonRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774765360; c=relaxed/simple;
	bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ahXtZNQNHYY+xzuDr5rB139IcZfV4i2TZkbTq75PwHmqJd9xzidnjNRXQEFBRaGsCtOChRnm0QWojS/YdPXXPWDUPcRhaCKnMVYglp2cbRsb5rzjdbJePCs0k5V/2a7mMTow3+v6zySWZdVA2+Vk4cd641aHOxtwxB6p0NG9yrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AKL7Oj0/; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AKL7Oj0/"
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-56b7043c97eso1395400e0c.1
        for <linux-staging@lists.linux.dev>; Sat, 28 Mar 2026 23:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774765358; x=1775370158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=AKL7Oj0/CbusSYlKuRM8cpxQEF5JugJpdyBGLcEwH2BZ5cwR/htMEG5He8XYBAAPP6
         dr9BihjptVVs4hUO58ehSnoENsyIc1rjMkUYoxCawXtkujvNGYuAUYctONt71uYg/Saz
         rAaOKTP7KXo9k9FXKbhIVJraSgCyKZ/79YONd0BMGVx3761T69KYP1fQj8caCMlIxN+E
         Hddn3WFyoitDX9TM38K/ea8p0sa7Xp7P93B9+tcRPEheJ9v48vgBTv8J1z+boVIP81C6
         gt/6creI95++YcVSoXqieZlIhIAUmZb7LTbcee0MYvJwkRGe5dB+najqTtwcrmz1wyw4
         /t6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774765358; x=1775370158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CHzzXCy/D8vpeyzGmNEAYKreZGsLdIkgzez1CAccAZI=;
        b=SNKn9YeFp92Q+NEH/cB6oZ6/LmZqN5IoCqIS0qBDN7e4Zk2uV/DPFccC0d3A2gxeXT
         taLq9HCOXZOvqdQVe2qpSD7LV4dbbOfg2cygmy9a6k+z7v9bBCFxB7Wn2BKv9PFLWsi0
         RuahruF565iZ19EGW4A2iwVvpRsFboMlsWg+UysU0SMuIpWa7CxXQX0Stc4gPVmO7XPy
         XI+lf9fLzKIoQKDyXcuYBVequVw8Dp+7MXqk4DQ+60M/QN8yJ2eC4lr9U+omOAlasxXq
         BtEngFuYMawnaOp45xwoaQhmLzri79alkvTqnCN/rT+PuxHHuf60C/Fjr2Td6MCYnThB
         tplw==
X-Forwarded-Encrypted: i=1; AJvYcCWVMRmYIgrCuoyxZbZzY1xHF+ikum+pH3OATgt9BJdav7oMa4WJYb3agM8p/GRh8WM2oTVDRs46qtPFN4f3@lists.linux.dev
X-Gm-Message-State: AOJu0YzgYiGGF2XpmoCF3I7J2sdSplW9UbJpIMWtAdrARy2WM2c/0XSL
	43IJMeCm9bl4PPU4zVdBWhP69zGOm3gswe0opJ0MLWnoMlCwpVNX6tcd
X-Gm-Gg: ATEYQzza6njZ9yf/wTjwcbIsCOaC4j0TWLucNJcf1iTOidpAAZFbGJpep1AEVpFUFsy
	WVf42HC7SbaK91Lk6QH8XSn9rzBafYaSFgFFm8iaRx0UKd4YisI0izWbGo6EU5zRe1p7V4vxyEQ
	F6B2Hcj+qkrhl2hmgi6a2iZernAg7iyGOuDsARcyqkMCQlNElAUWn05lqK+8G+NtegAib8wHFNr
	ZxUsDrXblfMkEmylwpHv46GRZxiJGO1wP3I7rfgZyt3pyzkw1022xO9T3TCAaE3itIZYWORvGME
	kk40FvA5Tq8zOB9+jL9lPZxqVh+M9fyQzTlDkgq9FUnqvc8Ddywl+YW2dp+nyaZBLKe2F6Nk3lP
	6cslb6ClRankMLjiZMbkqCplwbGhTjcY267wHgt34OG7R+Gcx/a4YX4lnqDXhhhd9XK1XItjyPX
	0WfKPpEAFB0fMox7yRnT3460f/
X-Received: by 2002:a05:6102:4421:b0:5ff:219b:497a with SMTP id ada2fe7eead31-604f8ff5ff7mr3209523137.3.1774765358333;
        Sat, 28 Mar 2026 23:22:38 -0700 (PDT)
Received: from localhost.localdomain ([2a09:bac6:d6db:aa::11:19a])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-60512d3a037sm4475072137.9.2026.03.28.23.22.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2026 23:22:37 -0700 (PDT)
From: Sebastian Josue Alba Vives <sebasjosue84@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Cc: bcm-kernel-feedback-list@broadcom.com,
	linux-staging@lists.linux.dev,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-media@vger.kernel.org,
	Dave Stevenson <dave.stevenson@raspberrypi.com>,
	kernel-list@raspberrypi.com,
	=?UTF-8?q?Sebasti=C3=A1n=20Alba=20Vives?= <sebasjosue84@gmail.com>
Subject: [PATCH 0/4] staging: vc04_services: vchiq-mmal: fix multiple memory safety issues 
Date: Sun, 29 Mar 2026 00:21:10 -0600
Message-ID: <20260329062229.493430-1-sebasjosue84@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This series fixes four memory safety issues in the MMAL VCHIQ driver
which handles multimedia message passing between the ARM CPU and the
VideoCore GPU on all Raspberry Pi models.

Patch 1: OOB array access in event_to_host_cb()
Patch 2: Missing buffer size check in inline_receive()
Patch 3: Missing bounds check in port_parameter_set()
Patch 4: Integer underflow in port_parameter_get()

All four issues affect both ARM32 and ARM64 Raspberry Pi kernels.
Found through manual source code auditing.

I would like to request separate CVE assignments for each
independently exploitable vulnerability.

Reported-by: Sebastián Alba Vives <sebasjosue84@gmail.com>

