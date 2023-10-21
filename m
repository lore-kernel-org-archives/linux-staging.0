Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64481D517;
	Sat, 21 Oct 2023 23:12:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fSng1i1s"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2c4fe37f166so29286231fa.1;
        Sat, 21 Oct 2023 16:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697929960; x=1698534760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=58Eo+qEtvIjLh9UY6FY88GQO7Bn+aYS8BK4MYosjEHM=;
        b=fSng1i1sXxQ3xekx/gUZrHBRESwvz5uuVIceFXOW4adbPpxCQuULOpzGDCEyMwrVNt
         DZDdJrNJpvh5Yrpq4HXl2s+qpSgjxtsCb5L8lbSj0+J3TosrKSqIMIBA5AvHTup8lqT5
         IvzwqaGUTqAX3hAnKWxk8YRibCHqr284o/0cUk6sIF/Rjkpmrn4+PsKWGOsVDnD3UMXK
         TwW1fhgUi/U2S61WhAkkEnMk8uXW1C4cDvU/QInHpKg4gvPJM5GuhN6rF9TrD4Zy84XA
         B1IOnS6g+xRFoAMdhp0yZa/RCk4LbRZgcS9NFD6MqEa1xqQzEC4cA4oX0Uf566joPRj6
         5sxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697929960; x=1698534760;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=58Eo+qEtvIjLh9UY6FY88GQO7Bn+aYS8BK4MYosjEHM=;
        b=BccWRs9yeAiGC1gVILZtpKgcbu/LQDQTO7WPZZNsaBkrOEKhmtQyvKNjmHAitQ37rC
         2SKecSdvlYM227JfK2IF+yn6kR1I3NFlkUnJD2dKdBPT+eEV4XTHauj4WhjwQN9NSvhp
         OzJ1e2kiAWSh7cAbSWUi7Ce9Hg/B8kfrMXA7Wvy7qjIJnm1fLm4+vi/wqfPVis1wUVPa
         wnbuMsZASLMGiM/Gu7e2icCuTqFJ/Tfjv1FC4vRwvWTXZnQfUQ1m/nVP7C1qWz6QSe6u
         5ja7MPQB9/+QpTKMEnGbWEQEkUWO28pZABf2Gg0WlT8JuycQx3h0zePQ2P05go4Bb8sI
         IEzw==
X-Gm-Message-State: AOJu0Yzv6z3hrY6Ca3lGAiLvCit/kKNkdGwD3c0sLBhoz/EclOAvvTmg
	N5nlaGPnkFABut50k3y72Ks=
X-Google-Smtp-Source: AGHT+IH22DnBv5tZD7jH7UBvDltokJlxy/V9phy9m0A1YU0bNsyZdfWEg/MZ1/OXJEAOhtD+UlDl8g==
X-Received: by 2002:a2e:2c09:0:b0:2c5:578:f998 with SMTP id s9-20020a2e2c09000000b002c50578f998mr3515600ljs.26.1697929959985;
        Sat, 21 Oct 2023 16:12:39 -0700 (PDT)
Received: from gilbert-PC ([105.113.89.119])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c190600b0040641a9d49bsm5573827wmq.17.2023.10.21.16.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Oct 2023 16:12:39 -0700 (PDT)
From: Gilbert Adikankwu <gilbertadikankwu@gmail.com>
To: gregkh@linuxfoundation.org,
	outreachy@lists.linux.dev
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gilbert Adikankwu <gilbertadikankwu@gmail.com>
Subject: [PATCH 0/5] staging: vt6655: Rename variables byCWMaxMin, bySlot, bySIFS, byDIFS and byEIFS
Date: Sun, 22 Oct 2023 00:12:26 +0100
Message-Id: <cover.1697927812.git.gilbertadikankwu@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make the variable names adhere to Linux kernel coding style and fix
checkpatch.pl errors.

Gilbert Adikankwu (5):
  staging: vt6655: Rename variable byCWMaxMin
  staging: vt6655: Rename variable bySlot
  staging: vt6655: Rename variable bySIFS
  staging: vt6655: Rename variable byDIFS
  staging: vt6655: Rename variable byEIFS

 drivers/staging/vt6655/card.c   | 72 ++++++++++++++++-----------------
 drivers/staging/vt6655/device.h | 10 ++---
 2 files changed, 41 insertions(+), 41 deletions(-)

-- 
2.34.1

