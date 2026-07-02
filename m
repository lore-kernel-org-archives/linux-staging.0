Received: from mail-lr2-f3.google.com (mail-lr2-f3.google.com [74.125.230.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E85CE4A2E01
	for <linux-staging@lists.linux.dev>; Thu,  2 Jul 2026 13:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783000577; cv=none; b=gqBmrESIqmsgj0K2KNZ1qEjCthIUf/95+/oQosCJLCMJIK5JA8e4GofuEb3hjWKplynC/B33u06rY6uh0UogGHvqp9IQONuVYwxVQtVLssg/T4RdtZcaoRId+xt3NCky2V/hIUSSmv4s3XajAt81nREhCUQXv57ZBVvu1RSdc4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783000577; c=relaxed/simple;
	bh=UaVEUdRAGtC7aLKhUviK1MAizQJj6stdK5GFApCJui0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lWU1dGCPSqymgxwOUGiN8Q/fO6+kgSI1gcBZBi8kZ6EFluSwRX1j4loIYQ8V6ullMbz18MVDec4A6FFn4zP4+EmNPxTZ793+KjpmsBoiOlTMPvXHOfPERRtjrIi98lA4TEBq/VdYZrZNeuknr8WFpPSSe0wkUwzQMLalbPP1hvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyM3OEtR; arc=none smtp.client-ip=74.125.230.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyM3OEtR"
Received: by mail-lr2-f3.google.com with SMTP id 38308e7fff4ca-39aeee5817fso5529051fa.0
        for <linux-staging@lists.linux.dev>; Thu, 02 Jul 2026 06:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783000574; x=1783605374; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4JyGNpvvoY2EfnwsLcpSI0KMTB87kuQf0AOS0r1gf6I=;
        b=iyM3OEtRYvMhi8PdRzI3P2JaRZ6lA93JymkM9mWvscDbUavJu16q/etPaPklDlEVcQ
         C+tSvF0YfOknjp/mmzqq/zI+jebAT8J/IvakGTuNrDzFcH3zz8vi3fc16AWH6dAifoRw
         r/uM0Tm/opHw4jK6WhIjL9ZVzjuvu1gaYWvOpNKWy+4+KVblH1dLWFRlH1Y0D6qKIdh6
         B+VIVqxcSi87v1NJXfiizz6cF+kx7waUdHlIVqgerdQiQISADiqgtXoqXvrRc3tcVZbO
         0uhLP+DDjgvoiSOnG4iBBpoudPBU9ozo8B3H6vCE8sAXM+AaHFmb//ggorw3X57xo/G2
         nrrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783000574; x=1783605374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4JyGNpvvoY2EfnwsLcpSI0KMTB87kuQf0AOS0r1gf6I=;
        b=Rr8wmUdVqbQ/HDBVDbLyLcFwIC6Zmt04iCTUTxmacEQixsmpwzNP/Z3aS4nW4veMhR
         zrX4cTF2XIn2D0mzNjMt/3JJmSR0YmyK9ShYkr6GJQivPxJzHdt6cW48PNbtsKP9Ywmq
         oLESAHFah8ybD2jQA6H/+IaAb+MDfvq5sTRq3mz6zwbTGMZ9V40y/nKUQHEd6vH+Fu56
         ySfEIvMue50V/dNWgctJdaxnvoIQNQvLxtrtJiIJWCC5XmBmmP3/RLhU5zQBKugI/i3r
         8V1cEcZ6jEspj2GGbrpQk0DI0Es4YbYzMjvdlmpM32y9O4jV0aXXq6tA5Wt2eYk9BfUH
         8N5A==
X-Forwarded-Encrypted: i=1; AHgh+RoaXdM+rR1MW1AN+RyZ2XhuqZm67NLmQswf4dUieN/OddWU83SW290o/XjEJCGyMEENKDkyh0Xe055NxglZ@lists.linux.dev
X-Gm-Message-State: AOJu0Yye7JU8YGeOTwYmbKFZj7JiP8oGAw/PBenu7zxOVWKnmvfo32R2
	icp+I2wdlwrMZ+vc3YKXt48JuQjwlQnBNxvKoXm7n0Fitc586dj44LwZ
X-Gm-Gg: AfdE7cm4nRwp6WWxyGydI4K8IFXFJs1JaVPKqfKHqhiWwkg2OjdqthcPNVEbZuGtQC0
	2+t+6hl+0YKfKrPx7snzzntnk8Byc6jQzIZpU/JzWbJ4UQW6opDvnLw1FzMD6HVJk8atNZfdZtg
	Sgd/2zHPVAILgwixb4kN1XKeAeyjpY5w8J8XNUUrcUML7m/2vwZbwUkKP4nvIAUhSuljYJqtdxn
	mVdlGSnryYqWByHjYrH3WRwAkYUFcwvZcH7GNGE/8+a3tuardIQzi74IBSfT9BS2VGLSLAoyOsd
	QCIK7ycvvNWbleWI5e8nDuxYT8ZeVbnCJP9Rgw/htA5xyzBwv3SBX9cSmdsNh5pxrGbChTxo745
	UKX70PxJ9Libz22Ybm673WKk0h4vWWkxN0VPdaskebKYhnfR9IakP/ael9pEDM6Trj0e7vPxsX1
	ujxrBBSWGB
X-Received: by 2002:a05:6512:6887:b0:5ae:b77f:f823 with SMTP id 2adb3069b0e04-5aec80196c6mr934774e87.15.1783000573989;
        Thu, 02 Jul 2026 06:56:13 -0700 (PDT)
Received: from arch ([93.177.236.219])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aec89919bcsm720820e87.11.2026.07.02.06.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 06:56:13 -0700 (PDT)
From: "Bohdan D. Marcus" <bohdandmarcus@gmail.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	"Bohdan D. Marcus" <bohdandmarcus@gmail.com>
Subject: [PATCH 0/3] media: atomisp: clean up block comment formatting
Date: Thu,  2 Jul 2026 16:52:27 +0300
Message-ID: <20260702135230.19030-1-bohdandmarcus@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series addresses the block comment formatting issues across
several header files in the atomisp driver, as suggested in previous
reviews. The comments have been reformatted to comply with the Linux
kernel coding style guidelines.

Checkpatch reports no remaining errors or warnings for these files.

Bohdan D. Marcus (3):
  media: atomisp: fix block comment formatting in atomisp_internal.h
  media: atomisp: fix block comment formatting in ia_css_mipi.h
  media: atomisp: fix block comment formatting in ia_css_timer.h

 .../media/atomisp/pci/atomisp_internal.h      |  3 +-
 .../staging/media/atomisp/pci/ia_css_mipi.h   |  6 ++-
 .../staging/media/atomisp/pci/ia_css_timer.h  | 49 +++++++++++--------
 3 files changed, 34 insertions(+), 24 deletions(-)

-- 
2.55.0

