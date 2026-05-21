Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EA2039901A
	for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 07:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779348903; cv=none; b=MkY/PBDJOq765IJdbKfJgKuZeTV9/veAnB/9cjV6N9wR4QmwfK/EHAoBL8+GRqt84qlzV1rOCnk0NAECCb0J3on7lJt2J/mvBbBsdfiRJXDU2vofbNctPO0jc4bc+xW8lu67rCcctfy6PxEa/hT3P7w2b4jGqv9a9zM/1Ioc1vA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779348903; c=relaxed/simple;
	bh=H3A1ZqsEWXy+Y9IWbVTa6nORcA4uBPnBGNaZzs/OZWc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GPi6efNwAMi6HqxwxhoOXCc3jJmymhYauJ+CZ1Mgaqobw0XsV592TboHlCIHpIhniBleMQRE4doRUaCivpgrOdl02dYaJtzXq4YxW8Vs5cdS1NMpD+upWM4mRodlU3eNq90bn38LkVhNPj0GxdhmWsOywWZMjfDWlqva1CriANw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KAeroAlp; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KAeroAlp"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-367c26471f5so3664309a91.1
        for <linux-staging@lists.linux.dev>; Thu, 21 May 2026 00:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779348901; x=1779953701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=KAeroAlp1h95Fw3hK9BbsoKM/K7+YUqM7fbZRceA37dAmNB4gGhCLcaZtMB8xyrwBU
         /IcyFwpfdF322nyNylQrQYNKO+fZfBGwkCLdK1cw1AtEJYkjHj96o/oxS39Pf0jX7gPO
         2vwgkoaFJbfZWF8+Q1VCpht5dEVqvy/whsk8kANEI2v34M0p9srYR+ROgM6EvN7O3zsS
         1LTcZse/ypM0GlfcAlCh+TqvfrIf6i+SpQIZojU5yNTznFmWYm9c9bBPm0Wn7FEh/FdR
         SDknsfP1SQckm3UcatJ44N5uDnd8RS1R2pXvjhZbpPsRpKWNLaN7w9k/kSo65LYzJwzL
         rCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779348901; x=1779953701;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Nv3O98MdUPD4zHhAIH8Dw2e6iXe5AcQ+j+PSSnnErM=;
        b=Cjgl0qlHYKLFKqMtD1ChrESg/NtP+ralXE1Drl9eZcbH++a+fhA0i0wjiBjjgTasUW
         BACK9azFLoXi7MK8b/OTPBtEGE0v9AJfjfAUsJzWzfX6hQakLw9dDS7RaFexkWcDCt9C
         dQRli5wsnU3mUWrEN7xI4E+b23niPHs82liecskz6wFZpjnvEQaotc9iKP2bqoeg+129
         KX/Zv6vdq8CWoO1NbS7dd191hCtj8luYdtDjyRd73adOqafXGExb28ICCpNHHfHizNi2
         mQdIHuFBu8XIU+p9xdSdD/sCpoa/QmLe0GFWJeKErJA8GR6uR7FcRP2XIQUesCvVzVMy
         6LIA==
X-Forwarded-Encrypted: i=1; AFNElJ/VrVpfgfbtRVbiJnFIrdOkGMlCjieUl1V8dbrMNj6Bx17l3F2JTzHJsSeQEQLTRt6oFmdr8K3EPPBaj3hE@lists.linux.dev
X-Gm-Message-State: AOJu0YzOEiqUB1ZclWMJZVkqBJg6dnZ2ieDslqL3R1mQWHqveqdSpCWx
	HLxkLUKB5vW10NgsrQ8sCdTsSVkiOYUDm73soFxjsmLZMAsR5Fk6fWQ+
X-Gm-Gg: Acq92OGxCYZO2zJi+vA9/AbbnGGeCYfNveleYGG9pJrLwI8ZDHfWoxLuW/v9BCnCS2m
	Z4EZvnOz76DbVi/ayL9VyWViZgxMlyC6YEpJwh4mptWVXKdYAqun7X1np3jcGKtCjzVcTkeuV1v
	3XEYPpGB6E864RsEavCQgO9j4iVyWCNFF8gAFKvyS50l5NAPIutYSlIG0mlnaOvZ2tsRnFm6lOy
	toMeTHKPLkyZrW24Jw9+chOBd+AwZNlghK25sGPBUD3k6rRYbOE953PZtt5M8hcysg3vHBVW0Gm
	slgb3AzZ4Vr+AKB7DFXKMgVfwIiabFBJML139AIt4Pw2fg/VUdpXRDUbn1EwHjoBDQN58pWemh3
	3tS45dYWlkaBGfCOukA/7DfrrwGs091o6ci4tevf2jHVaBBIpYox3EjuV6rzYCBCB0FrZnOepmW
	nhh2gvFlkokUfFoN2BDmPV
X-Received: by 2002:a17:90b:57ce:b0:368:a297:bd3d with SMTP id 98e67ed59e1d1-36a44f18393mr1788402a91.3.1779348901391;
        Thu, 21 May 2026 00:35:01 -0700 (PDT)
Received: from rockpi-5b ([45.112.0.230])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36a45c5decesm783833a91.1.2026.05.21.00.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 00:35:00 -0700 (PDT)
From: Anand Moon <linux.amoon@gmail.com>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Hans Verkuil <hverkuil@kernel.org>,
	Maxime Jourdan <mjourdan@baylibre.com>,
	linux-media@vger.kernel.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-amlogic@lists.infradead.org (open list:MESON VIDEO DECODER DRIVER FOR AMLOGIC SOCS),
	linux-staging@lists.linux.dev (open list:STAGING SUBSYSTEM),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Amlogic Meson SoC support),
	linux-kernel@vger.kernel.org (open list)
Cc: Anand Moon <linux.amoon@gmail.com>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v4 0/3] media: meson: Fix memory leak in error path in
Date: Thu, 21 May 2026 13:04:10 +0530
Message-ID: <20260521073449.10057-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Following chamges try to fix the memory leak reported by Sashiko 

Pre-existing issues:
- [Critical] The `sess->esparser_queue_work` work item is not canceled
   before freeing the session context, leading to a potential Use-After-Free 
   vulnerability.
- [High] The patch attempts to fix a memory leak reported by kmemleak,
    but misdiagnoses the root cause and leaves the primary memory leak 
    (the V4L2 control handler) unresolved.
- [High] The driver does not verify if `kthread_run()` returns an `ERR_PTR`,
     leading to a kernel panic when `kthread_stop()` is called.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/all/20260520045905.6ACBA1F000E9@smtp.kernel.org/#t

Thanks
-Anand

Anand Moon (3):
  media: meson: vdec: Fix memory leak in error path of vdec_open
  media: meson: vdec: Add error handling for recycle thread creation
  media: meson: vdec: Cancel esparser work in error and stop paths

 drivers/staging/media/meson/vdec/vdec.c | 27 +++++++++++++++++++------
 1 file changed, 21 insertions(+), 6 deletions(-)


base-commit: 8bc67e4db64aa72732c474b44ea8622062c903f0
-- 
2.50.1

