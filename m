Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2CB4502B;
	Sat, 22 Mar 2025 06:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742626692; cv=none; b=r8XbbyFleXMQyz523kyyy5sSI2cWi6kCPf9VWmHf6u5TLqhcNHZ4VSNIgvs1MPmU/oLpDFgzenioiRHBpWeNlo6m3vXH7huX4I3tiGl63Kg+UmQN9P42cKa8k7t/CZSVHalcgGR4xRVEH+i+1oWAWU2Co9JCKPO8tKaMYqGlXDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742626692; c=relaxed/simple;
	bh=HdCqHk31IVrFS5wCjRMxdwYXQ5QQ5E8hSwrIOXTpRYg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HjySRokui13sCREtf6/mLPDfaZh5P509n+VxcqxNRIMAcGKOrLIQwPNQ2ojAKYwpojZ2arGhI2TJ1ObUOChBkDnWa+ZuS0sCO0LCBWzpJhbYF2N7aYlGdjZbsmDYP25Qtw7JZcgsCwiHLgJdp/Zx1Sds/n/hklomBPUbjxMflWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H4QJ1kwr; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H4QJ1kwr"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so24398685e9.1;
        Fri, 21 Mar 2025 23:58:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742626689; x=1743231489; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8emfl3/iA6hoYtuWERF3HJ4s5M5mU6RjMOHWHh7wDU0=;
        b=H4QJ1kwrGUjasOVJ/CMGwsKFM5hm6aVyCHZQAEkXkuEUG1s4z/56QpBTAJPY9WhPpc
         5dgwb450V4XiD2e7MQCrhS1bmGVZF89wEx2TXofe5mgCCgyNhv4iqKGrcPfdNU4kciOF
         g6QV10sMkLEqaNcuMQiRj1zZDsRVeYtV+6a0PM6UoOVbuY24NCKSbup5hzum9EsyGNAu
         n6ZqYchwV4rPo1EXeaRBzSgPQSSEpuP7fr1mR37/XDssm2kYhtk/ThKKsWAQioyQiwLE
         sKrPgFklbx/atBtqexfrUmCXjWx+HAgHE61qH/htLxXk7gwcW2eEmbBT4RGl11lZMflj
         8BWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742626689; x=1743231489;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8emfl3/iA6hoYtuWERF3HJ4s5M5mU6RjMOHWHh7wDU0=;
        b=iPC4MZBS3ubNFweEA+o3OTLX6rs3XeC05+x3DZvTkWGqL5JOSo4XIR3fZ3yzgNJoOe
         HVOwdi2rSsbxgZEcH3P/sAet4Fir4ikESmH6BrH/4linWlQCXpo2ENQacmZPm2aTaB7c
         4E3qEAbQUIcz7AWac3u5ajkeGaShbGtn4Oi2oY4EfGjqiDR0FZYILNEinDnaHRABTrhW
         ztzH9Putib0iiUa3CPX+jDV8+vtLxUv8hkU6sK5z4XcEuD3kmq2snIFX39+S7CqrhyeK
         0SinrXPbHFcn6gDVmtW1KeISPjqcutATyLwSZ4c63cS0lnln1K4HZg1owaSvd1slLuef
         yMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCULclnL3ijv70cH8AZVftZTL7mdjRUo3aWmUaArck5xKhZYVH78MWkNpMkjMl4N5RT7RGiU8olZRHzUP7Fg@lists.linux.dev
X-Gm-Message-State: AOJu0YzghI6Trb/m3X58OGW8dlBk7HaVaoHO3nWOnvHh3antlRAJ3Gnw
	klwjkBohteHhzjvbUnXn0Ih5sHWtFZhOTe7R9rwwWFO1fuRETpzlMgbntb+StEA=
X-Gm-Gg: ASbGnctoS4Cf1BAfEzb4NZr9ZT7z7fGJJ5hllgviqODyYa3mujrf37FoR8uhY/5uFOG
	W+piraQcwyUCGYEKxzTWLKbkAao8+rt2alqIyiO90BCt14K54enbLT3coZGRUUsvXxAAlEFypV8
	azlfQD5RVfRSpr/xYJBrkaSAjvN62zx16Jf8nojFEtAxhfAl3rq60HkgE3fvXAfyhnFYZmxAphH
	M4VelbecwWVKLoQcHYR7sJNlUeRtDVcpy7eAx5Ad2bWbBH2jgpoySzom2ZdE2emeJc378b4C4F7
	AkDDyr1C4zhXqgHnoNVOwa9P9yrWZttOW+ryZy4=
X-Google-Smtp-Source: AGHT+IHNV8Bc+MdPoxMoHiudNZ/7s72orS1cZ4p20xYam3PMqwE8iNaxMoft8jHkRHlzJXMvlWH/Lg==
X-Received: by 2002:a05:600c:4995:b0:43c:ed33:a500 with SMTP id 5b1f17b1804b1-43d491b7dc5mr81439075e9.10.1742626688799;
        Fri, 21 Mar 2025 23:58:08 -0700 (PDT)
Received: from pc.. ([41.206.42.66])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d4fd277c9sm49607825e9.22.2025.03.21.23.58.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 23:58:08 -0700 (PDT)
From: Erick Karanja <karanja99erick@gmail.com>
To: outreachy@lists.linux.dev,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Erick Karanja <karanja99erick@gmail.com>
Subject: [PATCH] staging: greybus: Alignment warning
Date: Sat, 22 Mar 2025 09:58:00 +0300
Message-ID: <20250322065800.21361-1-karanja99erick@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct the alignment of the parameters to match the open parenthesis.

Reported by checkpatch:

    CHECK: Alignment should match open parenthesis

Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
---
 drivers/staging/greybus/camera.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 5d80ace41d8e..ec9fddfc0b14 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -1165,8 +1165,8 @@ static int gb_camera_debugfs_init(struct gb_camera *gcam)
 		gcam->debugfs.buffers[i].length = 0;
 
 		debugfs_create_file_aux(entry->name, entry->mask,
-				    gcam->debugfs.root, gcam, entry,
-				    &gb_camera_debugfs_ops);
+					gcam->debugfs.root, gcam, entry,
+					&gb_camera_debugfs_ops);
 	}
 
 	return 0;
-- 
2.43.0

