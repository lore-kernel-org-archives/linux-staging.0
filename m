Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088C934105B
	for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 18:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774117659; cv=none; b=u9DVmRshUkxCbICaM4E4YE/jEnYk9TfrY6Awo1GiNLCRsYOrNRRgTunvf9zW2/zaPBzY1ylbqSDRlv9azmFb/VV9VzJxyTrq0fM5UoXlhsKZFyKufZVFKa/o7k1SgRZ4Ja02w19lSz3N+RP1hh2pYrkzCNMCMfoKCmrikZ+F1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774117659; c=relaxed/simple;
	bh=xfpVEqh4tpOX1TMNZSpvWKdSH0k1FG4qg8EgMc3F+H4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XFmYvGHR5SsNv9zTB36VoziRZBPwx7fHEJG/dtseSSjwDUJrCXK1feZRueHFScyrMazoioBxFizQh8r6Rdv5KKgxexxRLp3acPo82f8Wrbq1Vw6qe2+WHU14hBbTR7cBPdVajX98ZCdLmCFelmyd2llovyUKkUz032h9GTB4atk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eotgJVfQ; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eotgJVfQ"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66970715adbso496891a12.3
        for <linux-staging@lists.linux.dev>; Sat, 21 Mar 2026 11:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774117656; x=1774722456; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=428qb3x4DZY6oAXBg5EWFqFtCk3r33e9i4fSNfvggJE=;
        b=eotgJVfQ9mEoKSKo13woin0Vb5REOga6h3Qv9rqg3kIx3Sqd1LYtpl610i94yHwCJR
         z0NtTBvVY+2rdc4Q9BOuu/fdx4uatVw3ptNOJVvJ/j64gZSqNV1DPaFuLNmNZR9jQDxr
         Qt2KVmT5fqKCfNUGqyDqTqbUZCy8cMMjHVYSJ/6O0hO3vFcC4EBnJwRl76GIPQ4UYKZB
         SZ8TOUDX0bXS5JJMgdYEtP/1zJYq5CFkSq7VLLcJTPZUKU6OEMR9fdLg8WKtbK2sew79
         LMzxGArpC7oMyJIYxL1Qwf3xdmLbI/SmYw52VMVJoOACG9dijahCAhSmka7wzammlJDf
         WVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774117656; x=1774722456;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=428qb3x4DZY6oAXBg5EWFqFtCk3r33e9i4fSNfvggJE=;
        b=Le2Lw1d1CUQb8Ws8K3CzPdgV5RHapIEnO3wZQ2R9OuERakEX5uNVmda94zHOR2/Of9
         nKdXm5YqbhNbXvIFX+tF72CwdnfWl0BxHh/McADnzaqdvoVHZgHmv4SOjFJJSpcD05yz
         2mKtXQapOvkZ8FVh7CxPAXvkUIb72TMq9lyB3ScolHLYsikk1gA9Ee3V0eNekOsY0J4o
         NjNS5p8kxrcloQWLKe23V7jkv71KaKU3MgmjRvDxU6CBk6JofjPUxKbrUAS4f2bssSSS
         ssixKSA6A1KYZHlfXWnN5wQwMoWdGwLELDNuqenCqPHynjg7YKgOVE/wF96LgYX7TOVN
         49dA==
X-Gm-Message-State: AOJu0YzDSQgPjRtHqV3cK0SFMWA9rBnvxiAU1M1npYHC3gDsjyuz3rl6
	s5a+EGS03w8At8xokXbPBxS0KmpAO8oPrvj46BpmjyUEmXnsxsvFChub9urSjYtZZP4=
X-Gm-Gg: ATEYQzw1E8G0pVrgXqTN7F2fbv1Kc0uKV14vjQvBwaGXdC/e8wz3MQfX0dLjbfyrJWa
	v+x8jecZYpo8PQvf3T6xqlEmLEYVTVY0YuVBZTuQ7ktgFr8X7UYCBfEEoWCwSr3PjN9matbFuVp
	XxsLsgHYgTpuDw7JDddDPvtjreeQwllODzCFlXxv0eSNEH7gA2pABP9Vgpdk5G3sjMVZ7jRBJz8
	We7fwKpCG4QjwsmzMY9u88cQQXLNC7KcBY9o5DfUfgLD2DSKDpWLj/CgDvCuYRv8cY+4QWXdIgd
	CpO6U6BRFCTIAbwsV1+bDA2yQm1AIrkcBA/eRn9ug36MVV302wg8GLsS19FwM3jaxrMvTjTEKEE
	h1yFEuQMraTmK/HWU8pD3EUWj1RXqiBcijIoKqCqGbgYkUwkzDtBwj4uBsK+xcjLS0rq/ciy8SO
	Wi2fUMaD7S4FVgeP7eWCl/QgxOe+rLSbAt6qpsBI8dPAK8eA==
X-Received: by 2002:a17:907:6b0e:b0:b98:1129:51 with SMTP id a640c23a62f3a-b982f244be4mr544317866b.17.1774117655894;
        Sat, 21 Mar 2026 11:27:35 -0700 (PDT)
Received: from localhost.localdomain ([2a00:f41:18ce:4346:2c4b:1eff:fec9:fe24])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b983388070csm285097866b.60.2026.03.21.11.27.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 11:27:35 -0700 (PDT)
From: "Jose A. Perez de Azpillaga" <azpijr@gmail.com>
To: linux-staging@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Straube <straube.linux@gmail.com>,
	Hans de Goede <hansg@kernel.org>,
	Khushal Chitturi <khushalchitturi@gmail.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Luka Gejak <luka.gejak@linux.dev>,
	Vivek BalachandharTN <vivek.balachandhar@gmail.com>,
	Artur Stupa <arthur.stupa@gmail.com>,
	Zhuoheng Li <lizhuoheng@kylinos.cn>,
	Nino Zhang <ninozhang001@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/2] staging: rtl8723bs: clean up rtw_joinbss_event_prehandle
Date: Sat, 21 Mar 2026 19:26:58 +0100
Message-ID: <20260321182713.665872-1-azpijr@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series cleans up the rtw_joinbss_event_prehandle function in the
rtl8723bs staging driver.

The first patch removes dead code guarded by the REJOIN macro, which is
never defined in the kernel. This simplifies the function before the
subsequent refactor.

The second patch refactors the function using guard clauses and early
returns to reduce deep indentation, improving overall readability.

v4:
- Removed redundant return at the end of the void function.
- Fixed typo in v3 cover letter. ("Rmoed" -> "Removed")
- Picked up Reviewed-by tag from Luka Gejak.

v3:
- Removed the 'retry' variable which became dead after REJOIN
  removal.
- Removed the 'ignore_joinbss_callback' label and use direct
  returns.
- Preserve the original comment for the join_res <= 0 case.
- Keep the original newline for the netdev_dbg call.
- Moved the 's5' comment after the spin_unlock_bh call to match
  original placement.

v2:
- Split the original patch into a two-patch series.
- Changed the subject line.
- Removed all REJOIN-related dead code.
- Fixed a typo in the ptarget_sta comment.
- Avoided unnecessary changes.


Jose A. Perez de Azpillaga (2):
  staging: rtl8723bs: remove dead REJOIN code
  staging: rtl8723bs: refactor rtw_joinbss_event_prehandle to reduce
    indentation

 drivers/staging/rtl8723bs/core/rtw_mlme.c | 155 ++++++++++------------
 1 file changed, 68 insertions(+), 87 deletions(-)

--
2.53.0

