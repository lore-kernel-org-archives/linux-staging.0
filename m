Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9759635960
	for <linux-staging@lists.linux.dev>; Sat, 28 Dec 2024 06:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367138; cv=none; b=Bv/KA5ArO9CG3iimwHP0JE7KEwQ2iGP82DS85e1O6tVOLcOwYalUIHnPnt8vvtFd/gF7RIYiC2/+dRG2h9lCywlECagpbQSiPfBRlXDqUJ9tckrJJNIX1vW2GeSH2mv89E1x0GDoJJkaiviySGBixnluQqbGEHLxgp8DhrraJtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367138; c=relaxed/simple;
	bh=1jPo2JHin0LgQlm4vKXeGh2HLIjD+OuBskgQrOYzzKg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eGQpbmcNv0cSMlBTSVUXM3Vekj2CGJ7p0ivCZJ/gC/aq6z4UnQg4hDPAkXsJKUlwI5JHz2RT6QJ77y1MaQXtuP2GmX0nwtncU2z3p724ZBGX82Un4frczfS5d2v1R8D+ojrElZdMESyZWkZn08AllLFQGN3RpfRBlAJI7cF0T18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SICGvsYi; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SICGvsYi"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2ee534d6800so1538205a91.2
        for <linux-staging@lists.linux.dev>; Fri, 27 Dec 2024 22:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735367136; x=1735971936; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UKZvoMOFa+RbGKxA6Ich2DTnwsMQAd7ewYLEegwqBEo=;
        b=SICGvsYi/FJLs9F+5fSkSantGC4qhWQtjpJH2pAbexRO4pnA5e/0gPAde1Wz0qPV7P
         p0U5iqsggJtS6U8oxm5m0k/5Xq/6hC6sQPnJekvPT6ryv3Gv2GgcLU02PxpozwaYB5Tu
         Xpv+hqpd/lIleT8nBFEpxw8vpCJKwUJPeGrBNij/i/N7uCU3rwx7WfPQhLXN17NVG8BT
         s/Rz2NeLpiXyjbSaHAGOkLq1d3ymnVjQLqmAZyXZKHJcijnJDh8/3cjNC/rxiwAn5Zuy
         X0uoWkoLf7oAUYTn5cO+9d8uUInjSd7OcMktWXJ/9gm6RlEEzLlvWuCTPrhV7yOgLw1Y
         abxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735367136; x=1735971936;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UKZvoMOFa+RbGKxA6Ich2DTnwsMQAd7ewYLEegwqBEo=;
        b=XW+CZvXRwCegN2eU0ZDqjgTXrorccwJ0V5QdRJaaqzHcUEHxyqm8sm6/S2mpjTjZSp
         dRJpYJNXbj67xGT170cSr1NU9VzjZK0KxVOVncMsw2WLkDllR1iAcJfxu/mrcFjPL/pi
         uxi2f9rVqKvmPiKwdMxG43jEuNH/Tgt8uCRJ6d4tc/dyLVx5YSqVzCpgq9gq/YDpYPe5
         43Y3rp/uqowIknJ/DjbPaKbqBAmP2ci+mrWqkX8cHFnGzZ6BidWS6ERKcPL8FqyDLQ6u
         ciYZ0GSg8JvPbHyp6+DBjc8eFs0sBI1eDsQrrNoh9b+FIk88y405a+aBKpVBQrQlEvbB
         vHdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc4F2sQ3JuvKi43ymKrHUbi9FI9CQUVRsm4jkQFG5BVPODHdZ/f0jdpuMuovw9L8mNgW/3HVlOOTgO9zlz@lists.linux.dev
X-Gm-Message-State: AOJu0Yyq4dGbBRZsR+Xn+WJIob3CsQJql7s4tbWFQ/haF3QItpx8EXw3
	yJXv6hlTlIf+pp/9svM+qHt63YivnsubAGLXW6BOvW2t1XdiJnMm
X-Gm-Gg: ASbGnctKLQeFdml8drJTkPleZM6CyRoJp/wv+KAGPh6lCwg2GWhJ2TS99nUFMK6rn/3
	nqTSNRnOh5keRu/RA9Z70uwnhCuQLfEV0yrA8Rk/5KFrkXFf0eBatNGrM/pP4/q3upvx2cpHkwS
	amd2l1h8eCxEdfKpnVa5oI4Fsi83aW7vn87K8DeQj9LuLXz9puFDMPXrHa1eV9nYZz/fTUF/CP2
	AFqECP3QWRC5whc9ap0p7o4Fkud9qpk3yEVLSjB/A/YZEpneWMzJBI=
X-Google-Smtp-Source: AGHT+IGp39FpeVG+VRoBYgltwm8XnLEWje5eSAJA15xfCgvGeZts7RNRP7020sA9OtAUWqX4Lj+MCQ==
X-Received: by 2002:a17:903:2a8c:b0:215:9a73:6c4f with SMTP id d9443c01a7336-219e6e9de89mr155298355ad.6.1735367135690;
        Fri, 27 Dec 2024 22:25:35 -0800 (PST)
Received: from ice.. ([171.76.83.141])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9f73f6sm144479455ad.222.2024.12.27.22.25.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Dec 2024 22:25:35 -0800 (PST)
From: Nihar Chaithanya <niharchaithanya@gmail.com>
To: dpenkler@gmail.com,
	gregkh@linuxfoundation.org
Cc: dan.carpenter@linaro.org,
	skhan@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nihar Chaithanya <niharchaithanya@gmail.com>
Subject: [PATCH v5 00/15] staging: gpib: Handle gpib_register_driver() errors
Date: Sat, 28 Dec 2024 11:37:48 +0530
Message-Id: <20241228060800.107653-1-niharchaithanya@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

While reviewing the patch for fixing Coverity scan issue from
gpib: cb7210 [1], Greg pointed out that the gpib_register_driver()
function can fail and must return an error value if it fails.

This patch series fixes the above issue by changing the return type
of gpib_register_driver() function and returning the error value if
it fails.

This fix also makes sure that wherever the gpib_register_driver()
is called and if it fails - the previous driver register functions
are unregistered(if they exist) and the error value is returned.

Thanks,
Nihar

v4 --> v5 : Added pr_* statements indicating when the driver register
            functions fail or if the module is initialized without errors.

v3 --> v4 : Made the v3 patch into series and also fixed an error in
            v3 [2]. Each patch in this series is a fix for particular
            driver handling the gpib_register_driver() error.

v2 --> v3 : Modified the gpib_register_driver() to return error code,
            added error handling to all the places that the
            gpib_register_driver() is called.

v1 --> v2 : Replaced the redundant cb_pcmcia_init_module() with
            pcmcia_register_driver().

Link to v4 : https://lore.kernel.org/all/20241226193637.241049-16-niharchaithanya@gmail.com/
Link to v3 : https://lore.kernel.org/all/20241221214822.163667-1-niharchaithanya@gmail.com/
Link to v2 : https://lore.kernel.org/all/20241221091121.35476-1-niharchaithanya@gmail.com/
Link to v1 : https://lore.kernel.org/all/20241221022632.20931-1-niharchaithanya@gmail.com/

[1] https://lore.kernel.org/all/2024122133-outskirts-causing-099a@gregkh/
[2] https://lore.kernel.org/all/202412221424.WIjKFIPf-lkp@intel.com/

Nihar Chaithanya (15):
  staging: gpib: Modify gpib_register_driver() to return error if it
    fails
  staging: gpib: agilent_82350b: Handle gpib_register_driver() errors
  staging: gpib: agilent_82357a: Handle gpib_register_driver() errors
  staging: gpib: cb7210: Handle gpib_register_driver() errors
  staging: gpib: cec: Handle gpib_register_driver() errors
  staging: gpib: fluke: Handle gpib_register_driver() errors
  staging: gpib: fmh: Handle gpib_register_driver() errors
  staging: gpib: gpio: Return error value from gpib_register_driver()
  staging: gpib: hp_82335: Return error value from
    gpib_register_driver()
  staging: gpib: hp_82341: Handle gpib_register_driver() errors
  staging: gpib: ines: Handle gpib_register_driver() errors
  staging: gpib: lpvo_usb: Return error value from
    gpib_register_driver()
  staging: gpib: ni_usb: Handle gpib_register_driver() errors
  staging: gpib: pc2: Handle gpib_register_driver() errors
  staging: gpib: tnt4882: Handle gpib_register_driver() errors

 .../gpib/agilent_82350b/agilent_82350b.c      | 21 +++-
 .../gpib/agilent_82357a/agilent_82357a.c      | 18 +++-
 drivers/staging/gpib/cb7210/cb7210.c          | 99 ++++++++++++++-----
 drivers/staging/gpib/cec/cec_gpib.c           |  9 +-
 drivers/staging/gpib/common/gpib_os.c         |  7 +-
 drivers/staging/gpib/eastwood/fluke_gpib.c    | 28 +++++-
 drivers/staging/gpib/fmh_gpib/fmh_gpib.c      | 41 ++++++--
 drivers/staging/gpib/gpio/gpib_bitbang.c      |  7 +-
 drivers/staging/gpib/hp_82335/hp82335.c       |  9 +-
 drivers/staging/gpib/hp_82341/hp_82341.c      | 18 +++-
 drivers/staging/gpib/include/gpibP.h          |  2 +-
 drivers/staging/gpib/ines/ines_gpib.c         | 81 +++++++++++----
 .../gpib/lpvo_usb_gpib/lpvo_usb_gpib.c        |  6 +-
 drivers/staging/gpib/ni_usb/ni_usb_gpib.c     | 17 +++-
 drivers/staging/gpib/pc2/pc2_gpib.c           | 34 ++++++-
 drivers/staging/gpib/tnt4882/tnt4882_gpib.c   | 87 +++++++++++++---
 16 files changed, 387 insertions(+), 97 deletions(-)

-- 
2.34.1

