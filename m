Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7A02E555
	for <linux-staging@lists.linux.dev>; Fri, 14 Aug 2026 00:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786667197; cv=none; b=XYfns3IgEAl4HO+9yGZ+nHBR3F06K1i1lgcRp5yAKEjgUYHBOW157s2WGDWsRm3yzHF7D7blZ9CLZMLFmHNJSTjV9b9wwAZuHpdnURQSAT1kaWOGIajTn0ywuE4hONAB/mNQMQ5DbIe4Gquv/SXTenqKUWhJHQ+hk7BleL91+y8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786667197; c=relaxed/simple;
	bh=R9bTPVnIXneSwOj5nKNdH4epUqo8Fyg9c4RkOpGuvgg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=jSxV7291NQQv7Ny3uF7ctgihY15+7uuazItiNN+cO30iC9D33gRu8joA5I5ZHaYJ6G0Gj0AUKn7N95npricNDS1TaUe3ehhu07BPMIkieftCBLONN/4NfuSt7N+CD+9YhDZuG38U+Bjz3oeDI2oP9apdNKgiwD8u5Pi6OMjF8Qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iinF6Pxs; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iinF6Pxs"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2cf27856f9cso4893665ad.2
        for <linux-staging@lists.linux.dev>; Thu, 13 Aug 2026 17:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786667196; x=1787271996; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4f8inU9aaPCOu7H2o+xkxYl3DrCd0StIBeApHBHCWfM=;
        b=iinF6PxsT4w7IDqML4v1W2eFxhTuhDmOpSlNECPeEaN3k3rvliKoEY5jCA9mvfhWg2
         tY6UqF9r1ZdnXQqlziblDgrit4k3prhYe/hdfrx7jxBqiCrF3uOdH2MFOaa1BgHfu3Rj
         /46LNAA+DHMXvHgV0tOXB/CpUWe2E83loJuIXHxCAQvhF6XeIBWjutjHZVlweJKasIZK
         SI1/0weEpkQ88ry/53eUynxsqjatCtm3dyYSm9R+fA88ez2jrbIfmg5tXBnAfFLOxmNx
         D+RcXYDbdMI8y8TT9bDBjziUV+T3bz/QmnE4xe+kcFO4TdSxOO7VMbpEG6145gohZ3aB
         sEmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786667196; x=1787271996;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4f8inU9aaPCOu7H2o+xkxYl3DrCd0StIBeApHBHCWfM=;
        b=iJE0RmIjA9J1zZv7lmYWo0HCj5WXjeCbnUxTllQKdA4uTMXU+6PfL46ed4RAs/K7jo
         g4jcaiWEkQISl6egBRyd5Pi8aOU+QDbBlRKzHwpzcHcjVEWAuFtsZlJHPcMHyl2M0/G/
         m1CKQsnxDB+r31zBt9TrTLPACv2QPbULItmpE9NMMogZ7n6kL42wy2RocZTcT5tDFI51
         YJnISOwxbHpiIBoraACUdxhXmt6sbXOvVdfYj3MhTryvCCeQwn6V47AWeY1ZY7fjYk8H
         7Tuh18X8KSAwAaMFiRLiy2EDodNitybSUBdHqhxRGIy2yWAA69tsk4U9LzDp4sZSV/CX
         bQfQ==
X-Gm-Message-State: AOJu0YwpO4l/1dgQXP2SRKA1Den9y7W2cA7GvFR/BKXSrL3keiShE6iv
	cVoht5S+bJtwHdE0DCp4//aqKyfdxv1rlWe+cN0m5iwpqbka9eSGnGXq
X-Gm-Gg: AR+sD11JmX3Vvo9pGsaZenezn2pwjXbHyUWW1QsAEy6nofuFoFZFqLp4hWX+PiJzPbD
	VcPVzBSTw9rVyGTJCY7bsyOfwoZbPldAZ2B+0ECgwTPROsRbtTFCupwsiNanlG8HPO4ABUUbwCN
	+j+3wkDHNXNouqi4RWJZ+xvnOF+zoKvsp/teRMrazuipanl6hVmVuB/zWai6QK5hc5rfabJ2Sfg
	7xHlKp8NCtbFLRlC5wWWUIkOrlrM5rVysfpWN6chCDXa7B7x0GqZIjLG53pi0rYZ66E9Co8Ty8q
	7KWoKn/K/0iI0eeNxsY23t1BXysbcM7XTGEIO49282uiv6BTUlVdp/nDvDVYeFMAfH/nQDWygC0
	B+LNFM8kbCjmiBORc87QMtkFlk9/45iUxsemAGuUxmNAl5jaofKpDxY5BpO84lppSmgkutBU2vy
	kmXMEvmbeuJ1K46jF7RFLFjKmqj9JaLgpUDdKe54ohdRCzN8UTOZXUhR1eGdkW9ScU
X-Received: by 2002:a17:903:2c06:b0:2d3:a853:bb7a with SMTP id d9443c01a7336-2d3b0cde805mr24079285ad.19.1786667195880;
        Thu, 13 Aug 2026 17:26:35 -0700 (PDT)
Received: from [127.0.1.1] ([2804:14d:9ea1:8718:bb46:57cc:bba6:6246])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31ebf731dbasm14666255eec.17.2026.08.13.17.26.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Aug 2026 17:26:35 -0700 (PDT)
From: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: replace and remove
 N_BYTE_ALIGMENT()
Date: Thu, 13 Aug 2026 21:25:51 -0300
Message-Id: <20260813-staging-testing-v1-0-8baa7c210474@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJBgfmoC/x2MQQqAIBAAvxJ7TtAUib4SHSpX24uFKxGIf886D
 XOYKcCYCBmmrkDCm5jO2ET1HezHGgMKcs1hkIOVo9KC8xooBpGR88fNWoPeqN1pCa26Enp6/uO
 81PoCE7FduWEAAAA=
X-Change-ID: 20260813-staging-testing-b664ef41cd30
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Leonardo Martins Martins <dev.lmmrtns@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786667193; l=1404;
 i=dev.lmmrtns@gmail.com; s=20260813; h=from:subject:message-id;
 bh=R9bTPVnIXneSwOj5nKNdH4epUqo8Fyg9c4RkOpGuvgg=;
 b=m3yHCswhe7Ue8e0H2lNEIbCK1kkSRh0BrCZC2UX0L1sxtBTMF3PEWGg8Fpchm+jX3jpYHCDd5
 OxkvywSZa+dCmCTRmj0za0fmDVIWMBv87Tg+Il6FdIiAIsgVBI6Y/zm
X-Developer-Key: i=dev.lmmrtns@gmail.com; a=ed25519;
 pk=dOFSCpUL7hbyVftAaUGDebsgsSl9Uk/Tx0Aqpd4Bcng=

The macro N_BYTE_ALIGMENT() is used throughout the driver to perform
byte alignment on pointers with manual castings to unsigned long and
back to the pointer's type, making the code quite verbose.

This series replaces the macro N_BYTE_ALIGMENT() with the standard
PTR_ALIGN() macro.

Note: I've noticed that several of these alignments are called right
after kzalloc() or vzalloc() while aligning to 4, with kzalloc()
guaranteeing at least 8-byte alignment, this alignment is redundant.
I've left it as is since I don't have the hardware to test on and I
couldn't find out whether vzalloc() also guarantees byte alignment.
Please let me know if this change is desired.

Signed-off-by: Leonardo Martins Martins <dev.lmmrtns@gmail.com>
---
Leonardo Martins Martins (2):
      staging: rtl8723bs: replace N_BYTE_ALIGMENT() with PTR_ALIGN()
      staging: rtl8723bs: remove unused macro N_BYTE_ALIGMENT()

 drivers/staging/rtl8723bs/core/rtw_recv.c       |  3 ++-
 drivers/staging/rtl8723bs/core/rtw_xmit.c       | 13 +++++++------
 drivers/staging/rtl8723bs/hal/rtl8723bs_recv.c  |  3 ++-
 drivers/staging/rtl8723bs/include/basic_types.h |  3 ---
 4 files changed, 11 insertions(+), 11 deletions(-)
---
base-commit: c6eb4dc5964fdf4086b73b7f0f5dc0d595fb5cf3
change-id: 20260813-staging-testing-b664ef41cd30

Best regards,
-- 
Leonardo Martins Martins <dev.lmmrtns@gmail.com>

