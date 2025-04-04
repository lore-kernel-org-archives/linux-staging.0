Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB96719DFB4;
	Fri,  4 Apr 2025 08:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743756676; cv=none; b=JqFsKs7okPDsEOEvhulaOYf90qN+D/u9u9C8KGrM+Cstq2XkH+eLiwHOoL1pAI3zYIWivW/NUofmbJNhbAf4yuY5yi3uoSH25gfnRHVjVYSAHmKJYhaNnZbzxzZ54VPX3k5OEldqgyhkFlhIjY9aAKC1ZZ3j4BV72O92iBlro1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743756676; c=relaxed/simple;
	bh=lngRN9nvGxLhQV9TVsFmrrZpgQFhZKfVPpdORrbJOEk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tKv1X9I+YLxjajZzErIEoHIXYEBJFLegK/AFrLNmrYqOOVsWnBhCoeRKDbxRt+Sa5VN8lDCRNa7i8mb5ZJVrcFSsV1y/C2zVk9LH8F7+xj+b3f70cpgqLJNkP417hU2y6sgrDJI2nlqpfvaBmcHZqhilwDa1+QCPlyFQ4yuPG/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0ZuVT4G; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0ZuVT4G"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5e66407963fso3416421a12.2;
        Fri, 04 Apr 2025 01:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743756673; x=1744361473; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4CojFgjAzP50elq6TWRr9b4r5AbCg0Y2Qy9bynVTKdw=;
        b=T0ZuVT4GC+DN6koHD/yvZ4higUOpW2Ce4mD3Jx/NNSOEzhtX3QyBznwQ3O3gC+D0b3
         mvHgIqxLxzX3tMTJa+lelqcXAwx9CxZCTOrR1ddeKQWO0sPhsVDtINB/JV5+tgUHRyX9
         SKsZoOvvvwTjVn6lKCVmUU3MSDPJSUt1hkUhIkKbQkHieoF0JyZH1f0apqhls0SP1Lt6
         OA7/el4gdT9NH/sZnAYQMdIpke7UQSXs6qZZelKI+ZmuoXSEtM8v6doqoXHGvxQL+bws
         qMJT7kaxqpscGwc6Re6XtkfwXG3yDTbI0zCzeOnPCeIRuJTfsAkLrEUbxX8dRWCu7Oyi
         G9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743756673; x=1744361473;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4CojFgjAzP50elq6TWRr9b4r5AbCg0Y2Qy9bynVTKdw=;
        b=YCr97AAJMOR90mnX9D0uKti63BBrlCnpi0E3yX4LJSgkReLN7pfbEy/p4hUAz8SHM6
         fAaKpRMgCwgBiO6IOWjiVEB7iz8vwxPjUU4R5nTHxhPOIancavI/jAMXBi0eT/UDm7Jp
         bRmiZ2ovgjSKAq1JO8sde6p+npOxiams6Aado/9sM6hp+KWD+NoSyKT8XTw6h7itahYg
         Ny6HyNXHhwdtHWYW1Y5/Jk3KK4ahINSoIHbVo8EVmqYitC4yhkZlCIHkizkE2PBH39gO
         FxBU1kXFlxKArKaBMvzW21Ns1Plgv4SXwtnTpR8+ZI19so2WucJQfaDD1fjCw+WDrjpa
         rwuw==
X-Forwarded-Encrypted: i=1; AJvYcCVB+GuT3AarFGUNmsr9tDOPj11pVz3Mnl+nx2Ru7HZvJtxcjevCpu02SoBZC4CWy/caPTlGP7I3VcPfkLPk@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8YiaTwZJk/WTbwT5MoiuxsFOaAxJHuNk2z6Pttl17PiPHUyJa
	sSe0+VK6CD80YNwwESkwoAsJPozGFYMjTFE6LUv4vR57alNqq5/y
X-Gm-Gg: ASbGncs+0z72U/OleugprCffDEpbdswRTYVuLg0AlwaNhRSXyYb3rshzrYB3+pXTOuR
	DUOKTpNFflxSvBcfOUvkAzd7CT2r7I59h8NbxQ9NyUo9I1e6POFcyY82YX0z2iUyl4DIm9PkFkk
	mpHLC0vFzmAiQw2eNZSlXNNd92YxQHPES1z81rwDK0YjzzDmtX4Jjk9ocqsymUe8JS5mUuzLvVB
	kpr3A+v/nXUXhGLLGx08cYAd/Ptyy4bMjxiGAMWYBNlezS+y8Z+4BrBD1aGPy4Ay+7CegvrEhFn
	++H0yenafBzNIu0QHmPM7PfoH4JafCbBKEnfRIpNvHjC/IZA
X-Google-Smtp-Source: AGHT+IFjVi/bcMPN485Ss8hZ0/3qEWIMI8fnouefKu2Ht7IdYo1Va+g9peAmMnxiZI6LEIilKgFZYA==
X-Received: by 2002:a05:6402:278e:b0:5d3:cff5:634f with SMTP id 4fb4d7f45d1cf-5f0b660b98amr1432310a12.24.1743756672629;
        Fri, 04 Apr 2025 01:51:12 -0700 (PDT)
Received: from HP-650 ([105.112.123.50])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f0880a5204sm2042952a12.66.2025.04.04.01.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 01:51:12 -0700 (PDT)
From: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
To: outreachy@lists.linux.dev,
	julia.lawall@inria.fr
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	andy@kernel.org,
	Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Subject: [PATCH v4 0/1] Unnecessary code cleanup patches
Date: Fri,  4 Apr 2025 09:50:20 +0100
Message-Id: <cover.1743755621.git.abrahamadekunle50@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The patchset modifies unnecessary duplicate NULL tests on a value in an
expression, when the value has been NULL tested in a previous expression.

- Changes in v3:
	- Changed other cases to use modulo (% 4096) over (& 0xfff).
	-  Modified commit message to reflect these changes.
- Changes in v2:
	- Dropped patch files for media drivers from patchset as it is
	not meant for outreachy applicants.
	- Added full-stop sign to text in commit message.
	- Made code more readable by adding a line break.
	- Changed cases to use modulo (% 4096) over (& 0xff).
- Changes in v1
	- Patch for drivers/staging/media/av7110/sp8870.c and
	  drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
	  is split into two different patches in the patchset for use by the different
	  driver maintainers.
	- Added subject title for each of the separated patches.
	- Patch 1: Removed unnecessary curly braces {} initially inserted.
	- Patch 2: Unnecessary {} was also removed for v1.

Abraham Samuel Adekunle (1):
  staging: rtl8723bs: Prevent duplicate NULL tests on a value

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c     | 58 +++++++++----------
 2 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.34.1

