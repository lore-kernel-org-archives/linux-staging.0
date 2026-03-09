Received: from mail-yx1-f48.google.com (mail-yx1-f48.google.com [74.125.224.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F253346781
	for <linux-staging@lists.linux.dev>; Mon,  9 Mar 2026 20:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773087274; cv=none; b=VDL81qk6AvXseQZWidltQ849fSKgU6O47bjDnM/SLikTjNDIqH8Bx1LHOmoK85cymKFR5f0V2bUPLuAqGoEaRqNGxhbCsXJpVwvylIk6v1tltjGstbZEAmfuIQXup226ps2dof+6rlKkyG4z82OSF+9MiR9SnHQfdpXjglFwRFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773087274; c=relaxed/simple;
	bh=iv/4rS0dXdijruwn2ubKT66wWgTV6YBABCuTmXJQVy0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mCLvoinUYiFycU5lxWEO4kOMwwWLh3NiS1HQ20NgGB8QvPCBTYgimaNI4uuY6bg0NiPwXOw4Vxx/UDswOGxJx/0SYw+l/REW/6ljW2j7F8Nx1SqKh0FcoJey2aHEQQgxXwfNrALJrD0LsMdzk7CbCRxz5w/eohrf/5VcMK+seC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=COZE19gb; arc=none smtp.client-ip=74.125.224.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="COZE19gb"
Received: by mail-yx1-f48.google.com with SMTP id 956f58d0204a3-64ad79dfb6eso11455912d50.0
        for <linux-staging@lists.linux.dev>; Mon, 09 Mar 2026 13:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773087272; x=1773692072; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JumJ4XIV3bArVJvQ41Cpp+h0yfGH3PxHComvQKXnRcM=;
        b=COZE19gbPbs/VBgmjmDpd2nURGbn+0Z3+rI1dPL9u/HjcNRaRHsnzKWhLCvgTp7Qki
         0lVO5xUYdilm2rnw7NT0aDBdYzvfnRhfEOlRKL/qb55GbjXcIZ9iT9Gj4RUDlsS8K/jT
         cgWKCw5sdbLMcm3F9NpJja2/PV5YbMVhBypLXeA3CEpDb/Z4JoS0BVz2SI/v4z3pudQj
         88P7NcbOP/FXTeftRqAuTZ12WKo3SCdFRELFx+EQzPVLcKeYN//HoZo/2aC+y5fmXwsb
         2B66nW7EGBneRkvAAPWiJ7UUVA/4vj2Ni8fRb3eA7CzQ7SfcpEScQ25J6ed4zfwQThzX
         PIDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773087272; x=1773692072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JumJ4XIV3bArVJvQ41Cpp+h0yfGH3PxHComvQKXnRcM=;
        b=LNlspII0AdccXtVBqA9DZOIdGjdYyfGS+Kzgsi4Rf3EfHmxSbRXVMj4Cuavl5Ic/Bm
         9JCjDSL8Q/81sdVuZ/ZZH5G4JlNp+xHiVMkqxnXWO7wH4jCuS94gP+gqbZtMaUPZzF5U
         sfjmnaCrcrVGOPRTydBcUcs5VwOsRHHJKNKX6cbldLuLssm0Xb4y5rc1TX568/GDJVGt
         IK5bzc0RpSJvyAd5RgKBbRmmFxflTjIpvYMFjnA+wzy0SM7W4QSxyEPEBdRg7YFPKmj3
         GFpiYJFyPQLf0AK1659PMJaHMtm2yznefUztNhKCe0NyzVTMwMdw3xw1aLhFT0IxA5bq
         +9iw==
X-Gm-Message-State: AOJu0YxK5dU2hPB/iflcPUq7nVXIVoC+G1/PraaA35Ia3ZsixtkIIy4s
	/iDD8FDP4ME8Z11rhnYbd1ZiBV7ATqiwPB2u0N2hp+pSYQjLRRfoaesE
X-Gm-Gg: ATEYQzw+Phmu2BaLHsnuDCgU0bAU9Gg4uMA7xS259epvqOi5VO610U3zoKoyx5bEfqj
	npqwezcDZfa0PmpYohEfT8Z2HwMwdHEAFOJ6LXY9lPRFvdmrPzmqFg5IUEHTqN2RXyxom95wkRC
	3/lWizlRcBh+ycoGLaX09Jka2gW+OjbKdauviBHiuBrlgE9dnRNeMLl/sc5OkWUZJd+xA0CSPU5
	/VJ/m9S0pR2T4MUd9Mf5zPUeD49iZEj6YDKajWS/euhLOFxXMf+pPgVutvclnE7iucQSyUztTz3
	1wtwigzxSmLSt2STAMu3ildkR0sHgZoMCQ2Gv2bSrxemVsLzEM2OVGh9EFNHkx3yr6LnDzSkYtH
	jeSAIQjJT71LxTjxyzxL07FvGp9567CWZF7Fbbf2k0gQMnDig50EPYuUkItyTdS3AsC7Hr+jaD0
	1p9Xx7nhGm144gTgGllwYmEeAV
X-Received: by 2002:a05:690e:d42:b0:64a:db17:3ce6 with SMTP id 956f58d0204a3-64d1406e410mr12031959d50.2.1773087272079;
        Mon, 09 Mar 2026 13:14:32 -0700 (PDT)
Received: from archlinux ([185.140.162.146])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-64d175e8300sm5182999d50.7.2026.03.09.13.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 13:14:31 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 0/4] Replace functions return types to 'bool'
Date: Mon,  9 Mar 2026 23:12:17 +0300
Message-ID: <20260309201257.16984-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260307160024.18039-1-nikolayof23@gmail.com>
References: <20260307160024.18039-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset modernize the return types of some functions in
core/rtw_mlme.c file for greater code clarity.

Nikolay Kulikov (4):
  staging: rtl8723bs: replace rtw_if_up() return type to bool
  staging: rtl8723bs: replace rtw_is_same_ibss() return type to bool
  staging: rtl8723bs: replace rtw_is_desired_network() return type to
    bool
  staging: rtl8723bs: replace rtw_linked_check() return type to bool

 drivers/staging/rtl8723bs/core/rtw_mlme.c    | 28 +++++++-------------
 drivers/staging/rtl8723bs/include/rtw_mlme.h |  6 ++---
 2 files changed, 13 insertions(+), 21 deletions(-)

Changes in v2:
	- Remove unnecessary local variables for return values
	- Rebase patchset to actual staging-testing branch (without
	  conflicts)

Thanks,

Nikolay
-- 
2.53.0

