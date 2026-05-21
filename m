Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D6E5346AD6
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 21:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779397602; cv=none; b=k+5c48mqz0x8vP5LN2F8FwIVRGibO7CdlGgl8p0MgrcV2iKHtir+uUEyt70Vw6anmtm7VYQhStIIdyD8c5JwrLR/lT0XXAVxj053920Uwcdb2mOcIVf4+OmNNUoxJmPYBIyRzEzknJ1ipTh8OuZfL1WNPeNcFc8FXSQ096/2UMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779397602; c=relaxed/simple;
	bh=hToMS9sT62YLOsJLPeCWfrOu7CnnmpmARoAblpDBEdQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gjVMZT3mwoEL5QyntYDSQNsvoppAaJ+IAvfPIw99okeyobz4xZi6N31TUjJ7CPyK5gxneLc1EzBe+9NnvM75d99IrWjGn5/VrVIQWyneGfAOACbnFEog6PENptV5kCH3NCyCVecfDDzoYWd0fXgYRE4YJau97jIF1U6ryZImeXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZNhRrMkc; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZNhRrMkc"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-482de4ef03aso4698281b6e.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 14:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779397600; x=1780002400; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Caf4SzCyDP9b71JmHP5+3ea5FspDIbeu1gXvqelnfxA=;
        b=ZNhRrMkcsRvoLyH2xL9RDDZ7ngW4+yviHVizXS2QZwCrE3/dScDM9oqEyauPJT6NpG
         8C5zhMGrO/W9OtuSdsYncRY9CGedne2NjliNJJFLSzAJJvcrTEk9R2o9Fp3NdSmTqhgY
         qSK4Wjj7nmqIAUHKVoImblXcfc9xH2YXC7ypPKCdlX8IM37NwwaTaGhu048ubmImE9lM
         mvzVGZKZGZvQLjzIFMQ+Sz7E8WDBEky0gPa7+0Dve7jYOOEbvocJMsCGLjjVMt0UjOxG
         lgYbgoRNzUImo9fujvQEBphhusI8ViBQ48ADREq5dy5iyTFsficDbTugc+bI6GFJMgPH
         AEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779397600; x=1780002400;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Caf4SzCyDP9b71JmHP5+3ea5FspDIbeu1gXvqelnfxA=;
        b=NLaMGEdsbAQrxjQ+pE2jTfqyjNGy9gRmj9lixVDUdZ5fVK64PtKacLPOZ7RKS1PAsu
         XSwv2hPC02mRplPLrXzX7Mk+x2QonnG8N+xbMNlaqjvnm86kp1filYIM/s85l9at7gDf
         Yhiqi8DnPyIjBZBn800pTsg2irS9XqUoXjeG18gvHjIW1Bj45BC2xhEQx5huH+HlA2eH
         Q6zJA0JiYuun9QKZWdKDF0R071n48JG8fd+06TkO27wRITgHObzJuoZL/kGpn1b/d3e+
         5zX7zV7hrw0zq4D3hgSf5s73ZykFXP03yFvvWOEQgNTW6j9nJU+A/rPY1niwPuWILE0o
         4J/Q==
X-Forwarded-Encrypted: i=1; AFNElJ+RheYWbzOnwY5sRjA+k6MbaTrzkpq+mN+z3LeQJKRxkOJeZ1ZCwBxKKbx7IhpKOnsnFswlCmf5PToPj+m5@lists.linux.dev
X-Gm-Message-State: AOJu0YxpSZRmzEGIf731Nu4dP0Aqu9/djJ1Beb+VyuUoP3bWNfLuW6Dd
	Ppqk2iFpVPm5t2iw70LtGRwmuIhEBCBAwnGE4XL25f1tJKKKkHOSenJT
X-Gm-Gg: Acq92OHqy/TMYuTHyvIY7ZCBm4mmseXvVyC99+Iw+VBQqG/omhlkZjQtVAVKfdmCpCo
	d39aYvgcV9Sil/bRPMcq/urG0jLszLWZkU/nwD6b5SfuL/KAwX1xsi6zcMOPSRSpxt4a81EbQuA
	c9TFNCg52kTCVndm0uUWCE9vEuWquSRmXUJRC/MKIeF6SltVWDPoZj+vZMSLD53s/YuMPB919re
	qI3ypQmH6wr/yJkt16VgCW06EZYMxs6Mide1n0S5WCQweSXwaRGfvejx8DlYFoJkLTV1vORPeRN
	yeiJZ7OyDHc1ixHP6QWn4ZAAvQIOxjKH+4qFa3aVs7P/P4SsPby+UfjHutVk1NndrD+pXdtY6tx
	ngjTFv0azjJcqAcRB7wz0yj16tL8fCKZqZdbonQcPeznI3sg4MABSo+AVaPjQkp6dLu9j6E9XNE
	SAYXEr8c2V0qHp2AvAMhOiQNsunar6THs=
X-Received: by 2002:a05:6808:6604:b0:485:50e:5899 with SMTP id 5614622812f47-4854aacde69mr304318b6e.2.1779397600703;
        Thu, 21 May 2026 14:06:40 -0700 (PDT)
Received: from pop-os.. ([2806:264:548c:885a:fb25:8a80:d99d:260b])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-485431776acsm954022b6e.13.2026.05.21.14.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 14:06:39 -0700 (PDT)
From: =?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev
Cc: m.steinmoetzger@gmail.com,
	guojy.bj@gmail.com,
	straube.linux@gmail.com,
	error27@gmail.com,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Diego=20Fernando=20Mancera=20G=C3=B3mez?= <diegomancera.dev@gmail.com>
Subject: [PATCH] x86/build: Add custom extraversion identifier to Makefile
Date: Thu, 21 May 2026 15:05:23 -0600
Message-ID: <20260521210523.133725-3-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260521210523.133725-1-diegomancera.dev@gmail.com>
References: <20260521210523.133725-1-diegomancera.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Modify the top-level Makefile EXTRAVERSION variable to append a unique
user identifier '-capihw-v1'. This provides distinct verification
for custom compiled mainline trees during development audits.

Signed-off-by: Diego Fernando Mancera Gómez <diegomancera.dev@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b7b80e84e..d7f717d8a 100644
--- a/Makefile
+++ b/Makefile
@@ -2,7 +2,7 @@
 VERSION = 7
 PATCHLEVEL = 1
 SUBLEVEL = 0
-EXTRAVERSION = -rc3
+EXTRAVERSION = -rc3-capihw-v1
 NAME = Baby Opossum Posse
 
 # *DOCUMENTATION*
-- 
2.43.0

