Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A82021931C
	for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 07:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752822820; cv=none; b=oXIfrps8KmNL35ZA40jQdBdPpR8TBRcS2mykTTSphO0+r0bhrH78iFxVRPWdVH+8X61zXhIPtwvNMAWz6A5O5IbBpXJTZBCNRrwE92QUD0V+agWCRjO4yg2wGVJTY32QTeU0L4VBNCxveAjgreUR/+VgBzC9DTJY7zryvk0U3jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752822820; c=relaxed/simple;
	bh=XnntMU/9g1qIHQUyx4VOpPDXVeVre57QdmM2tkazN7c=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c7PVyDKu/1zvAtn4/GTxVWFtg/1PXT82xRCfDBg/BaNer6YkopwEBuc4iP2j8/iij1XE56SRcUKfiQZkI10SIle09V6XeoVSdt3rRidxknVKZExH4J8Ua9WZ9UvA57x4WRIt7oJFVM0uZa9T+kFk2/JfteZwtsk3odAkPtUAF1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/zcqPyG; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/zcqPyG"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4ab644b8dc1so19487971cf.1
        for <linux-staging@lists.linux.dev>; Fri, 18 Jul 2025 00:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752822818; x=1753427618; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnntMU/9g1qIHQUyx4VOpPDXVeVre57QdmM2tkazN7c=;
        b=S/zcqPyGnWfWGPy4RpAhazygQjOYvW2Fwh+aLD3nJzaXCSRcKPqQd+nJys+/43+p5/
         y1OU7UyNYlK9hyl3UOJgxgi3oiMKpqvYn17Ykyowc2eWIvA0pZAFFgxDp3yz55+3D13e
         iR+xo574UMMmrR6cS23lyUlbE4rtpepY517yaAOb7WoUAnv88Ls7kVEwNlFGjik4nwCp
         IS1RWXLM1Bnl4qokRju5dsQh9fg1J/5vSoHEXwhUpufJuCrqT578Mwf23LorBYE+fg1v
         QNhvOfGJCWGCG2Uq16H8TvKit+1Scp61PIFkyT2ex9c8FW9qfvJ2CGLSY1pVYaTuwJei
         +lgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752822818; x=1753427618;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XnntMU/9g1qIHQUyx4VOpPDXVeVre57QdmM2tkazN7c=;
        b=gqyyguC/g10cJOgNiZabffhpZHwoWML/SnDaDxM4yw5FhFkbJvhCwRFDYZgT3dapk2
         bw4mofUSAB9uhVa+LHkGqZytzsfszRefAJ1iyLxuNlVxMvJI3LPTIzzbWaIzOiebyx+/
         72GHuL9VxKEOF4GyYPIio3AC4MMC+kCPSJsxULobIWk9YgmMt8JJQ866M5CBGJEo+ZyI
         A6fAYRm/KmmbysbPmQzteoXqDoQ05v+TTT75RBLHkohsPnsRW0ZifVBsl2eI2kYzx0MQ
         N1T8fWDEq+rjwrY1RLgnqTBjut0fe5CeSneqk4gNtwVtJLlcHoDgN1EIGpbDKxDComxk
         FFzQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9p/q0abiMeFbJmzhljeJzVgJ7XiLsg2Ew2WQO6jklELRXsLLa6dhdV3yuClk70AyJsepE9zkD69LnrfYw@lists.linux.dev
X-Gm-Message-State: AOJu0YzJDfodwfdwJUYFOLGLi2XYCNqPbKkQgSBPXM1w1cEEZYMzzxgY
	NrP2T1PPaSAmjzCIqleQ9zHp9lXYBJ0HqLPy6M/nakZ3QgV3cxncOoLnRs29JQ==
X-Gm-Gg: ASbGncvRCjANPQHgBwXzcJpz0Jal4X7V5jXXcrbFtCdRN0liiTfFEHzFAAZbnhLWVGr
	gIuvX2eXYkofGHcBNNaX17BSFapjvDiMcfKCstjTsuNjzK1ZMiN+Ra9BgUUhunVjf+hn006LjIv
	1tLu5ADX5Yc4YCkVyNy1pRZDY0swTzlIGNIHDBmcj+QawV8tE9mzYNaS0/J7Wek0LHf8d+hUBpA
	u45Z18T4FVepByx9bZJ8Bv/W7pbo62Y95VGkd82qbDJHfUdEnF0xSR8kHJOnxdM9xyDfHAsHqO5
	5xaTo5qvNoQ0Senanwi02nMWntVt3LVtEAtkzZ3Nfvn8n9/xv3v8tuFe4gUyVS+6btMrW9uq4I5
	m5nhhz83AgCXrO9IsfNpaCCFAFxHfqVZUmL/FvI2GKy55DY4kjoQ=
X-Google-Smtp-Source: AGHT+IFhkrR53gkL3P1emJDb/E/P+tL6SbS2YoE/IDUeCu6sTTfHt6LMTdvRIeYSmfCufo8sH6UZ0g==
X-Received: by 2002:a05:6214:3bc2:b0:6ff:16da:af20 with SMTP id 6a1803df08f44-704f6a57203mr124872746d6.14.1752822817693;
        Fri, 18 Jul 2025 00:13:37 -0700 (PDT)
Received: from linux-kernel-dev-start.. ([159.203.26.228])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7051ba6b760sm4397356d6.62.2025.07.18.00.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 00:13:37 -0700 (PDT)
From: Vivek BalachandharTN <vivek.balachandhar@gmail.com>
To: vivek.balachandhar@gmail.com
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH v4] staging: rtl8192u: Rename ChannelPlan to channel_plan
Date: Fri, 18 Jul 2025 07:13:22 +0000
Message-Id: <20250718071322.174671-1-vivek.balachandhar@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250718015925.162713-1-vivek.balachandhar@gmail.com>
References: <20250718015925.162713-1-vivek.balachandhar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

Thanks for the review and guidance.

Apologies for the earlier mistakes. I’ve addressed your comments in v5:
- Dropped unrelated changes to Makefile and init/main.c

v5 has been posted here:
https://lore.kernel.org/all/20250718025206.171361-1-vivek.balachandhar@gmail.com/ (cover letter)
https://lore.kernel.org/all/20250718025206.171361-2-vivek.balachandhar@gmail.com/ (actual patch)

Thanks again for your time and feedback!

Best regards,
Vivek BalachandharTN
