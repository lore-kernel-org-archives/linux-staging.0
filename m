Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FAAF30DD19
	for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 10:25:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762770335; cv=none; b=l1fhJOCY1NSjpFGgEEMhB1BsJhxkhontuzUydUS3QPGvG7PQcwci7TsdxWq1Nt240sC+uA2i0VRBBgiTLESU809oSZuBxzeUJpv77lYgqadsCd1uOXY1Xre3k42ZXYdqjwT/eocAEhdk2KlStRHlchMjFQICJyMZSX2URFLfEao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762770335; c=relaxed/simple;
	bh=gPYWZCrFWH5A95MUItopTio1Dv+bF3Yimo8m+Fu0LPU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ukfgiM7OVrgWltBNk3IZObRhF9fGzxLr7UTsPvKjd6Krib1QCVB8AuvnLgdNehGK+K557JM7dyunMwOBqpaoNugQuTlbrO+XdOEN5stBzqvRp36sRGnhJ65BJFazhRsF5RkzqL0ECFE7xa3CT4eTqaDq57os5EpwveNreVGN4ug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DM2WLZ7a; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DM2WLZ7a"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47758595eecso13935125e9.0
        for <linux-staging@lists.linux.dev>; Mon, 10 Nov 2025 02:25:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762770331; x=1763375131; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DDWEaabtponRDh5izzcawYcKRcbqPl2YaKoP5YJjm8U=;
        b=DM2WLZ7aQ4jicvi2nPDfxWZLIjmM0uIQ7hHdlzmFIoCcC9YUbUoRkvBqkDJiJH8gYO
         EdsGcOEra9VhBtNk/Ht5QV5Hobi/0xY0EmpDCgXM9LD26WbxUuJIaIxtasKFz/G/PPtY
         jrLY2RKOPooNNy3YdMQqMOItoUKG4XCt04Omgb5PYlbZSuf4Az4oEtnpLWKFMHw6TRbJ
         ROrcKnOmViqUzyTpe5QD+H900NK3+y9EUHTlZ1RZ3pDB/P3abNIu6zn/wTezRApepSFj
         5EabdQ0rPN8SLMwuBvvNC4g0Y+NeESu7Q8O2RJ9WQJyxc6DQzoqwC7pdU+t0y/A6P9sK
         OejA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762770331; x=1763375131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DDWEaabtponRDh5izzcawYcKRcbqPl2YaKoP5YJjm8U=;
        b=ncQRqJOQ7NCD1vzLdTywtbfPIu8E9IO7Z7NnSz8qh73EI75R6O8114e4cdtAdlfnvb
         tRTS544EGbJ9KE/AkSaorYUvpU4mhDFOgSypFjqBiXDl94TTCB6aRMcnCJxUTBTXMGS3
         qcD6le3JJLdk61IWYTyU4H569RqSsQfX+cm5l7cBCIhipHMJonjPwK/DbOaprmD9loQL
         yDigs3Yay0Zld8YzCbzl+bTt7ey3aSxzfIxUaFslIM0FBP12SZP5lrxIT7HO3UDdkxQ6
         kJGv4qQk8nrVRsl3YZ+LptxIDzNTYbU0bqSgPHHfnG5BVgFSK5Rw87Wsqi/Y6ZeTnNbv
         McTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQMg6eaAU7vxelssKNXlQQBFVNg6S8TBSIbBocJKFoyFOuSZ+SKBjx1qORy/caGEvb/Kquc00v8qGPBAUX@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz3ujjdTESxpNUuXVlD+EXLI57JdlG3bdmNNLDF2k960tgS9to
	ll5fQuE4YUQhHMHXZ2uWEaoXHY5uoL/VrtIxgW/CqflyrhNX0+UR15aT
X-Gm-Gg: ASbGncvu/VvQfKYOny716N67tMqPvTvUa/VqG3SVJT6EEv9nMpFdxaXxP/JiiEeoKVl
	5Dnx+LXF4HN4oAtNa6k6tkt4Gh7i+1kb26LX2V/FkXhrEpZgCs8LoTOgcPGSfaYgcyIVIzrRP8l
	FbQH3G4nzmXSKoCKDZARI1GCp67yFnNPQKE2cf7lSsHeSumPHCAEOZnGs14AV2lxgoQBgwQErNT
	Tuswl1EWiMh6/MqzL09UtYDVDInhhZhTH3dKqRz05icnphd09CFFvUMuHrF8w5VZX5knCLmxc45
	PB7R0z/k0daMajkeYGYididDMw1J/k8hACZQAS0RmtIyPtzI2BywOCmcg8cwGmmrM75JumlkMVa
	dkIi4qCLmqaFl94jb4nhltRLe8kseEQB2H0GSPfauRPMAHTVICoIi9HuvKLBfBNBtswXYf0Ugfn
	hBuNYUUlKcWaG/ulbg
X-Google-Smtp-Source: AGHT+IHawc3zpPw1mww5Jy+6xxmUpYQPVhoTye5mvT5aqx9FHprZ00gpbNG1v/9TjsKc7wIYslUeXA==
X-Received: by 2002:a05:600c:68d7:b0:477:75eb:a643 with SMTP id 5b1f17b1804b1-47775ebadcbmr50548365e9.4.1762770331236;
        Mon, 10 Nov 2025 02:25:31 -0800 (PST)
Received: from egonzo (82-64-73-52.subs.proxad.net. [82.64.73.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4777a96e7f8sm67326715e9.13.2025.11.10.02.25.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 02:25:31 -0800 (PST)
From: Dave Penkler <dpenkler@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Dave Penkler <dpenkler@gmail.com>
Subject: [PATCH 08/11] uapi: linux: Add common gpib interface headers
Date: Mon, 10 Nov 2025 11:25:04 +0100
Message-ID: <20251110102507.1445-9-dpenkler@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251110102507.1445-1-dpenkler@gmail.com>
References: <20251110102507.1445-1-dpenkler@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The gpib user space library needs these include files in order
to communicate with the drivers. Copies of these includes were
previously used to build the user space library. Post destaging
they can use the includes from the kernel headers.

Signed-off-by: Dave Penkler <dpenkler@gmail.com>
---
 {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h       | 0
 {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib.h (100%)
 rename {drivers/staging/gpib/uapi => include/uapi/linux}/gpib_ioctl.h (100%)

diff --git a/drivers/staging/gpib/uapi/gpib.h b/include/uapi/linux/gpib.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib.h
rename to include/uapi/linux/gpib.h
diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/include/uapi/linux/gpib_ioctl.h
similarity index 100%
rename from drivers/staging/gpib/uapi/gpib_ioctl.h
rename to include/uapi/linux/gpib_ioctl.h
-- 
2.51.2

