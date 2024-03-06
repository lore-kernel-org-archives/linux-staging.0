Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 795C012BEAC;
	Thu,  7 Mar 2024 13:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709818188; cv=none; b=A0qf7JCxwwyk23MDFWU19+7FdgkfMvBI4/CFjR7HnwugBzr5y00xGa6xVAfpDsOlxVrjigdNv+djFh4iQ1DUgt/UTy8BVD72IofZqmoBlU+Ct81GO9tQp9b0VB03s1KL6ypGGHCvW9KSx0V7zupCKSawgM2pBBdhw6q15plitNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709818188; c=relaxed/simple;
	bh=vbb38G5Gumf/ecC6dBdcPpKKGxxuKyQe0RRZyJw91CI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hHKGIVzclRFQFTDCbmAZ4V8IAExtu6/tl76LKR1ExGRAuHBXL+y5io3h968FFasA2eexoskq5PDwW3so6pJtm/yEpuTvXaIEVMfqCU8gSRQH4a9Zof5lxZYTBzngy4P4v163BHhMz7c8rLrboUZUNzi0MFERrt9/ZsPJgE6qoRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MlCcaEN8; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MlCcaEN8"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a3fb8b0b7acso118100866b.2;
        Thu, 07 Mar 2024 05:29:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709818184; x=1710422984; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DHV7i01huumxO6FyTd59cs94VPL3O+cCfuwHbx5+aYU=;
        b=MlCcaEN8ElEIxKjLJ1VzlrEQ6WA9/jSaVRJPM2EAaC39MgAX9BSouD6rlGEyUq/rKe
         rE5ZT1XHG/62BvywjI+XICdugnodxssKED9qGSlFEDY8VQksrAZog/czkST/JT/oodzC
         MhoxW7i8UXsYSew2Z59tmHyVDENeZZFwx/vDzbu6pfAioOevxDWfWx2f/D/JKihWyIVA
         GINC4TNndMOYSmWU23rDS5L6h+SrminGPv7hz7WeOAQ4qKgoe7+qQY2dMON1K/clFw0t
         XJLL/bTRTW7QU0GkVbdvsp8FUI6mx0AYor9D9iP6Yc4VafEX6U13gXbpnrQhZQwTgPCj
         USiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709818184; x=1710422984;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DHV7i01huumxO6FyTd59cs94VPL3O+cCfuwHbx5+aYU=;
        b=UObKe5tKzHpHN2Lbm8kZm5Qk28hR9Um1uZRw64ATxp7sSnG/m0ibjQQNEaZSvlZvVs
         cbgFioqiyQFMNuHqbs30Ga7kbATCbUzWjqj8RRBeaZaB++m5ueX151ylFIGRSFTZP453
         GH8G9OI2gzfcNGMoQd1PhuD6gUoIsdZe8BgY8cfXGvTJEG5pMRpiy5i+KSCRlEfQ9dul
         L36ESdBQ565uJcLlELycYPaULVC4kqsJnC8GvZWG0WesYl3JIOy1nDS4FmhDLX0etIeC
         Air5+BbYQ0MDPdvM61RScUg8d3x1EZCU4j4LPsDRhDGYuNs4BZBZR8J1PfI2IcNGAU7h
         Ja4g==
X-Forwarded-Encrypted: i=1; AJvYcCXaEkN659lFCzFVeL6ciiARYy1SbvQq2PekvG3EXVlZv5WpO7DACBS5R1m5RGWInJWNrrqEQkA1teqpI9Vsxtk/yQSky/o9Ns3rprSudZiDGw7JBrNl8wGbwpxHLHZET18FdEM8eVIHtQ==
X-Gm-Message-State: AOJu0YwAI1GE3xN+IHcAPOuy5OfwZGU/Bw+ewDRMJdXa6aQUlzQb46W6
	vpa/m+aDWyl7dQLLQhymiIZxFSzYwCxSInhrv1RnSB2nXsO+BluYJfwtSZvytzk=
X-Google-Smtp-Source: AGHT+IHGJ+JyL01r1FIe5yobLcSqzGqshI/hvA/qHySXbCWeZnWRXG4G8Fhm2sNPfSZvac5cShCH3Q==
X-Received: by 2002:a17:907:11c1:b0:a44:1b9e:b977 with SMTP id va1-20020a17090711c100b00a441b9eb977mr12390376ejb.19.1709818184401;
        Thu, 07 Mar 2024 05:29:44 -0800 (PST)
Received: from ubuntu-focal.zuku.co.ke ([197.237.50.252])
        by smtp.gmail.com with ESMTPSA id x14-20020a170906710e00b00a45769e8e58sm3904401ejj.219.2024.03.07.05.29.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Mar 2024 05:29:44 -0800 (PST)
From: Dorine Tipo <dorine.a.tipo@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	outreachy@lists.linux.dev
Cc: Dorine Tipo <dorine.a.tipo@gmail.com>
Subject: [PATCH v3 4/8] Staging: sm750fb: Rename variable sii164EnableHotPlugDetection
Date: Wed,  6 Mar 2024 05:44:54 +0000
Message-Id: <20240306054458.102288-5-dorine.a.tipo@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
References: <20240306054458.102288-1-dorine.a.tipo@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rename variable sii164EnableHotPlugDetection to
sii164_enable_hot_plug_detection to silence checkpatch warning Avoid
CamelCase

Signed-off-by: Dorine Tipo <dorine.a.tipo@gmail.com>
---
V2: Added the patch to a series.
    Fixed errors within the patch.
    Compiled the kernel

V3: Reverted a commit in the same patch series


 drivers/staging/sm750fb/ddk750_dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/sm750fb/ddk750_dvi.c b/drivers/staging/sm750fb/ddk750_dvi.c
index c12df1f9fb00..1ce44c50617a 100644
--- a/drivers/staging/sm750fb/ddk750_dvi.c
+++ b/drivers/staging/sm750fb/ddk750_dvi.c
@@ -21,7 +21,7 @@ static struct dvi_ctrl_device dcft_supported_dvi_controller[] = {
 		.reset_chip = sii164_reset_chip,
 		.get_chip_string = sii164_get_chip_string,
 		.set_power = sii164_set_power,
-		.enable_hot_plug_detection = sii164EnableHotPlugDetection,
+		.enable_hot_plug_detection = sii164_enable_hot_plug_detection,
 		.is_connected = sii164IsConnected,
 		.check_interrupt = sii164CheckInterrupt,
 		.clear_interrupt = sii164ClearInterrupt,
--
2.25.1

