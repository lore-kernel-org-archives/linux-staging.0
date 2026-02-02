Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818BD363C73
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 12:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770035006; cv=none; b=g+9AbrBtDrLRKDuEbZ7nwQhPm62i+/nEClYRqoYBC7ygkp97O1id87mGpN8ht0o3a96N+iLX2+UhRCm2DkmvYh6DRJH/nG+eoC8PzrR/F7M/991z0GNBTHbz/pU2v4n4rxYhqxFtYlZa4PfPO7xJltaiwMzS+Vv01vKASOmgJL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770035006; c=relaxed/simple;
	bh=MCHQMdkFiNDL8zrP4PSphH8C7d9DQHFq6bIQEAg/r0M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CC+LKyQpeq/DX9SnjFtFjHjsN6P8UCO//fwVwEWizV6qrd2b5+WInHPgCfkVLo3UpFehLzpRcKWWexEAlZrQWmP7aLqIzhRONb2klmAMd4co9m2IRyIov1ruZBNWJBZUF7d93c6cGJtBW2HUoMk5zIcZDDTIVwHungjDjOdzBxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lHa9VleZ; arc=none smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lHa9VleZ"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6481bd173c0so3742955d50.2
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 04:23:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770035004; x=1770639804; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ftS99dSAeN1vcGJBELbkIMS3fcYwNwj74i1TJL2JXzg=;
        b=lHa9VleZUe9rZCz6xpI13FiLPG2cer9lojmg09Qsdkz0e7JN90e637/qqQwevmgKRc
         d23D2JBJQJ/qfu7maDBrpWgmGCfTwPzgirUdmWtLMZgquVtfjhoAIxJj04Xjp9Lm/TFl
         IzZbv/U+TTCaWoansuRceCLEt6dBwHEbzX7cg/CdcOMXNFY/E7oVuxa6QX0asSwaRtNM
         RMzAzcJszSs97BD/32Q35laklvh/EpML/lQrRk3I+hd+WLCa/cjihwGLZXBcul3xgsxk
         ArKatzEp6PVnryGZgarlwYqmXYSXKFLiurtZsdSWkvIhekmM6+uGhidGb8/UvEP+6auU
         UiFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770035004; x=1770639804;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ftS99dSAeN1vcGJBELbkIMS3fcYwNwj74i1TJL2JXzg=;
        b=ogGot1Yk9heLi98j9LxkQEhC6A/+CUd9gN35r1Fvbq2D10CQ4x0EG4utIY210JK1nW
         Z5Hot06TLBRKjaP7iJw2p2byoD8k7TMrrJdkR9aexxPwFe/U3FzDGgm7VDSSTTUYuqgU
         +b3XVA4LJ9J3lOdo8wRoxjY1wFr/mZGcR3/VRMYdHsnxEbRFYnPTtduBodCgQOzyiEIl
         3XUCQ1lBiZypOuNmzjHcb45prjaAdIrFf9hnNqYVbN3pfEPmTbFC7PzP4c2JFW0JaOQH
         ISauFATFuwraOCFdMIX4qtwdas6kiw34LefzDWtKR9Xu8ULLs33QX9IWFQ4iCT0uYR59
         kLzg==
X-Forwarded-Encrypted: i=1; AJvYcCUYmA8ufRFSIGn6nXwSQWMi/pe4Cptox2wgRK7e7gSGvD7xM/n9z6Dv1un8DdEDVjoC+ErytukHATsl34as@lists.linux.dev
X-Gm-Message-State: AOJu0Yzw96iisZfECWOsO2HqUknHlVBJO6CFEJAtiupQBXRZRQ1orsRe
	9+mQdZL1eg8uUZH3ud+CYaUHAtDJqpMtEDtlwTUi711TWuEYng63Vm+7
X-Gm-Gg: AZuq6aInbt+c0AhTRGzqlePtkHUlrEolOjeKzrL6ZPUgESN/kXAO3TlyN4hK80p39bt
	41e2IcJN3fwlmTKBCeAEfwiQCplO8eXgXX6LgiGyJ0YwSZD33tA+stuTrva+J2jW9C28rJgqRSa
	sWr4CtdB9JJTgsw/fK5KoT5y4YlciFMn0C5gZDcVRvBhp/iQNb+g3OiEpZWm22vB7ZMa07c8QML
	RFbVs11ce1lL6/KA9nbYsZYsVHYTerxgTZzj8Srn2wunwIAS7DTin4KSljiGLsTQJm7Fzx4gQql
	/G6jICFig0Go1mYwhPgkwPLCDNK9EEPbhpiAtPptdrH6MUGcprXVqeZRctRwwzCp3fWA/IHuiCb
	+TGTVtzQcuh9Z3+4HJT9Kdiw75kXryblEZZ0vQ3KY7G2DmNlB9bYj5iD1FMQuupOJha0lBB1iaI
	lh8u7B8RZr8pcOcm8d4RLFzW6LDLLxCpXw
X-Received: by 2002:a05:690e:bc7:b0:649:af80:1f18 with SMTP id 956f58d0204a3-649af803379mr6666318d50.18.1770035004423;
        Mon, 02 Feb 2026 04:23:24 -0800 (PST)
Received: from gustavo-arch ([2804:14c:f25a:845f:5b8d:2e7c:d238:2d28])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-649b30b5825sm4981931d50.24.2026.02.02.04.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 04:23:23 -0800 (PST)
From: Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
To: gregkh@linuxfoundation.org,
	dan.carpenter@linaro.org
Cc: ovidiu.panait.oss@gmail.com,
	gshahrouzi@gmail.com,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Gustavo Piaz da Silva <gustavopiazdasilva2102@gmail.com>
Subject: [PATCH v4 0/2] staging: axis-fifo: refactor and cleanup
Date: Mon,  2 Feb 2026 09:23:15 -0300
Message-ID: <20260202122317.13821-1-gustavopiazdasilva2102@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the axis-fifo driver probe function logic.

Patch 1 aligns the struct types with the OF API.
Patch 2 refactors the parsing logic.

Changes in v4:
 - Removed extra blank lines in commit messages.
 - Added "rx" and "tx" prefixes to error messages in Patch 2 to distinguish failures.
 - Explicitly listed changes in individual patches.

Changes in v3:
 - Split into two patches as requested.

Gustavo Piaz da Silva (2):
  staging: axis-fifo: align fifo depth types with OF API
  staging: axis-fifo: refactor device tree parsing

 drivers/staging/axis-fifo/axis-fifo.c | 81 +++++++++------------------
 1 file changed, 27 insertions(+), 54 deletions(-)

-- 
2.52.0

