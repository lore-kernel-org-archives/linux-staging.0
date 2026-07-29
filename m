Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F37390CB0
	for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 17:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785347812; cv=none; b=HkWOu1XQxzsap5rsZqiM3e6cQRj+XH/3iVirqH+onEpus/7zkZ+1s0n8+5zDpkef9iJfuI2VZyH2WFDvOdulV0lJ4I6DPbeXgGdWKMSgXLbxl3I2NoV+oaaJLB7Y4u8T9rx8iW7PUl2kPRoLsS0hjcfcuhLyuywqPncSkKQYTuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785347812; c=relaxed/simple;
	bh=RBK6fqnddY9QyWATiEicRl0W6Pn61rkPISyCDpv0sJY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bqcEhl7EcoqSUCdJLh4Xe/e3FRe0HiAl7pWx5+8mAOFJAH6E4n7Ksy05ichwMl3gxT/attgakED2yqJOIWA3YQM+ky9qnwez3IiZt4kpQYBBXFpNXFppVrEcDAx621DuNRAosWBsx0D6uEFcuZb6Tt7qOR8AbHvDoh03WfzA8kk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V2Ynl/pS; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V2Ynl/pS"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-39c9bb9d2fbso11755251fa.2
        for <linux-staging@lists.linux.dev>; Wed, 29 Jul 2026 10:56:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785347809; x=1785952609; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=RBK6fqnddY9QyWATiEicRl0W6Pn61rkPISyCDpv0sJY=;
        b=V2Ynl/pSK5RyIyQ/KZ5GhePH/bn09am3hh6vjkguEu+NZEWnayxUjFZN/mQGagu5/W
         DSIxh3iCFEEjpRF9gFAz+7Kz4nE/wSCn2QjQN5b1pGbvy/lz7H8WGsMrIwW6GQxQNIjB
         3ssabwV69asyii85cPFzt4etCSgXgPQrFrfyBz1lSZLPV1WFgeLtAge2QG+hUVMTc4QA
         uR2Wi5WaTSSfwg0gBiRyVCi7xFEg8A9w4nyO8mSNwsXK7svSBtxQyWOpYy+yttJFqPCb
         hEmbhpcuLvwkQUQmldFj7pYDhn9Es+rw1gN8W+4YVLY1pSDatkTSVzbDuy71fF5yzq/C
         OFhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785347809; x=1785952609;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RBK6fqnddY9QyWATiEicRl0W6Pn61rkPISyCDpv0sJY=;
        b=D6fEuMOQeUCB7fSrX/hCZPcL2Jgbm2FfLJhTGKasPiNRFdZEi0Wq8MC2IaysGIMeQU
         1/Mxc39w8pjguZKGvtEFCuKwE9ZsjT9t35gKchwZDhR3+8gaG8mpTEeZo2Tmc/1V1zl6
         3mW2NAr7jNMAT6WD/9hvVdiA66S2k+ttsmEWHH1cEtBu02K5cU1ZowMuujOV+KyjJxPK
         n7CZwECi3kRDXz1rAoa9c+CzBeUZcY//CdDQ3gZwKfnuMF3n7ZgyAg4WM5lRjzJCD09K
         zByJCgDCdXf/8Ff/qs/MgSrMZAwnwW1VtaKVsWZYAAyfRiKSyue/FGXQh30TVv9AOZIv
         fnSw==
X-Gm-Message-State: AOJu0Yz9Nrhk5RccqdfJrFCiI3d5M3CiKhwUxBjQohUuN0pXfjpDxCe+
	M/Wk3az4goDXiQXha3IuPSK9b5h5tzmnJX34OBAA07dGjQR6EF0zAk73
X-Gm-Gg: AR+sD12jTe3EtH59F4XnBO+YiO1GKrn7sY+N4YLE0/3gtrPHDG7+vhtGX2BaHsmkpA0
	mcgdsw+554sW7y412CTERjtLmeHtspvnY9xtt8mMAXyjSS6lg6DsyyQs9p8/TqNAOgUK8hYVFVo
	FFfN1C0F0praj78DlEW3Ja7oifzLydqSuMMoV9RRUzsgUED5mtCBrsbSoR4PNb82Nh501ZfG1h7
	8xxQ6Y1XhxhMSZ2Do8wbP6an1iDGTbE+r0FgRhdK/OdptEdjHRGsoPzLPtXYqVTaoPEfCzU6rXu
	69aKZ21hMd4LjNASBsg8WE8sMg71AXulK1kwA29/vESox1y5Px8PY7dVLjy9p7vWFte7sEaIgoj
	9V/rwQZ9sG3XHNWdpYdsRHtxQykbaU+qwc/PAblsH1ZetE1TWHBwqjDZsia3cd+xTva2R3nEHeJ
	IwUUv5fcqzpYWSgNOsuQKgvOa/9DyGWp0bieOOjzywQhfumLzgDvyngBZ6qIUk4ysOTI99c6VWb
	FqWZFJR2+JZWyYVd/bcwi6gDVxeCHA0FJ7eLlG1MyBZ+aOXALlIuErppg==
X-Received: by 2002:a05:6512:3b8f:b0:5b0:f9cb:2979 with SMTP id 2adb3069b0e04-5b2d0217a90mr1500940e87.15.1785347809259;
        Wed, 29 Jul 2026 10:56:49 -0700 (PDT)
Received: from localhost.localdomain (46-138-176-102.dynamic.spd-mgts.ru. [46.138.176.102])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39f65da4ac6sm2214621fa.16.2026.07.29.10.56.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 10:56:48 -0700 (PDT)
From: Artem Lytkin <iprintercanon@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	Marc Dietrich <marvin24@gmx.de>
Subject: Please drop my RESENDs of the nvec and vme_user cleanups
Date: Wed, 29 Jul 2026 20:56:27 +0300
Message-ID: <20260729175627.7034-1-iprintercanon@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Greg,

Back in February you turned down two small cleanups of mine, the
strncmp() to strcmp() change in nvec_power.c and the NULL check reorder
in fake_crcsr_init(), because neither is a bugfix and both invite churn
from checkers.

I resent them on 23 July as [PATCH RESEND] without going through the
archive first, so they are duplicates of patches you have already
declined. Please drop them.

Sorry for the noise.

Artem
