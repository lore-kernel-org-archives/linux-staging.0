Received: from mail-yx1-f51.google.com (mail-yx1-f51.google.com [74.125.224.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA91A3160
	for <linux-staging@lists.linux.dev>; Wed,  1 Apr 2026 02:14:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775009646; cv=none; b=nu9bvNbCMijKwNQ/yM6BYHxn9LlUvGxPeg0bkWU2RpEOfCqLcEH6Gda9T91xkHC77eAmCA2bYHTJz3sA0BUpD+9juUVFyKmgHDj9uW8cWxQWQWF7xuT8TfCyYwP9xmjoDJSCXBPJ7RhB/q45aV6/6CO79PGh2ji/aKNHLL4ulEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775009646; c=relaxed/simple;
	bh=Yg2w/2bHXLcFl082AKDl59n/D0u8h63qB3iVaQz0MFw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tw9MYoqlGEcdIpEqCoV32TGIRvU8yQVB8k4sfwJWbPPK9vAi2uysOohBLOvr4I+1R9R8P5FWzgZOO+FqBBK5JctMs5nWD9yhQhb0YRGrFrgneotQQTJu4wgmEcPW+Ue9eRFrUyueCTHJnR8CgCsU4Qh5ydsXq5ZHGZAZjU+zfJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OitXhFFv; arc=none smtp.client-ip=74.125.224.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OitXhFFv"
Received: by mail-yx1-f51.google.com with SMTP id 956f58d0204a3-65032e9cf01so83694d50.3
        for <linux-staging@lists.linux.dev>; Tue, 31 Mar 2026 19:14:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775009643; x=1775614443; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=S+EPLt/vZoD1ZhkGnAUHRVME9WTxfWAIHWFgnwFZWeI=;
        b=OitXhFFvUUm1+dBVjP+PPhrPaGJ5LEdJXkn37bO/5UchPzW5nnaWujuvCDqiibCpM+
         vzcY+7xBNre1njQnaUSGrO33bXh5X8NIl2cdYcspxX/b0GO60PozRRoHqrkoJgL55m6a
         3tQMkrUWuKhtGpjp/3dHHuXC0P+/B1Z9SwEuwmKfDEh1zlVymr6+wFeZG2iH2T3lxAjB
         0661TPrKlRLp7QnVafbGdkqbHByYbE8K+wcuqWsUVIpB7WjeonF7LTpfDzpslR7lgdri
         StdfjDCs5b3rK99RDOlfsp378ris+790pvJD/G+7/ng1zwLoVaON/AqlHATbuOGyaopn
         QWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775009643; x=1775614443;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S+EPLt/vZoD1ZhkGnAUHRVME9WTxfWAIHWFgnwFZWeI=;
        b=gsGDfmpA5SUNKt7CIULMcIrLe2XQGy6XQlx6/Aq6rTRB6LxXA9g+Y70dQV+awFbiM9
         /msPfPZ57+vL+m1Yji8bBKCvHZ0pG0FZEwcEEcazwcnsHZR7Ht+MrYON4+xsPkBL3L1W
         QKoXrnMZZUhy1m0w71pfSSO28aBifZtqc8XTZXPgDL4/ns0XtGqgvqC3KHqET6SqDTKA
         0cmhKOzYeDE3Dp0HzGo0amdyUrc3iRDPEUm30CseAyorPdIp9NTXkuAqK4CxQwVlCEm4
         ntiCQjiuQ2XJW+u9KqlwpDD8rdocN0/j6NmjCfX5xlZD88ZggOTngObgHVSw8GFG8f3L
         FoMg==
X-Forwarded-Encrypted: i=1; AJvYcCX5qk74SeGYwJRJSfp51bFh1sBprVnfICYFCk7N4ZwHw2gQsWP1iQx8VFCkUDHp9AmxZPROMb6ZJ/dC/SO+@lists.linux.dev
X-Gm-Message-State: AOJu0Yw0gPfqDL+BjTvxkZ9zO+ubB7tTk8jKJM8iNk9K7nXLP07Nrqtj
	XjBG/gtGN4b2F3qLd9M/FFh8RPUxE+/9+LA/YnPH4Fuwr59U33Kxwcbi
X-Gm-Gg: ATEYQzwYLwRWLwGATTsdn7ZtZB/nmThfo95NfkMrVeDr+Y4uVLvUIG+hDVwhPKhvYvr
	ljIpX4fSzBDdjOac15YMLvm5Tgio2emFOKkTN4J2Ffd6Zb7EX/3jnwyDV24tlBpwfUbhWQP2gIk
	CxHNS6fRKFCB1bsdJUEPzZSYgxY/FpiFLyG1hZ0TBXQlpbiTFnJzYtG3YXDhQV/5R9ulCW5Qhta
	rePCzMucQy2mjy9PWx4SkaRM5edzVzRuIXgV3hStfNkdm3b40ZpqBEMIHNlxoUToycfecuAeqCr
	G1yvWy4KeyPXi3JaCTYOgrkStkbT5MeRceobRF4EMvI5bUSNBf4MWeSN3xrYLV5Jwphjyhe0yPt
	LXaHJWnYUrO3yFE5U1R4Iv/txTkIlnkiILZGsllxhAONvvZZoCaQuEOAxMlqGQbWPmvfA4FBwnt
	7jR4MFrGTxVgx6Jb/GZiCcVU+F/V/tJJPu945z3WwIgMi3TbpoEzbpKWlO+B/yeaIOQ0M7fgecm
	3+cUQJSLphfxTTA2WJgdlIz
X-Received: by 2002:a05:690e:ee6:b0:650:1d21:d6af with SMTP id 956f58d0204a3-6502fe47ce4mr1230126d50.40.1775009643168;
        Tue, 31 Mar 2026 19:14:03 -0700 (PDT)
Received: from tux ([2601:7c0:c37e:2360::17e2])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-65009326eddsm6398951d50.13.2026.03.31.19.14.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 19:14:02 -0700 (PDT)
From: Ethan Tidmore <ethantidmore06@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ethan Tidmore <ethantidmore06@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: Cleanup rtw_ap.c
Date: Tue, 31 Mar 2026 21:13:55 -0500
Message-ID: <20260401021357.1176600-1-ethantidmore06@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes all commented out code in rtw_ap.c and renames the
last snakecase instance found in it too (I just RB a patch removing the
second from last).

v2:
- Leave commeneted out if statement and keep scope.

Ethan Tidmore (2):
  staging: rtl8723bs: Remove dead code
  staging: rtl8723bs: Rename pHT_info_ie to ht_info_ie

 drivers/staging/rtl8723bs/core/rtw_ap.c | 74 ++-----------------------
 1 file changed, 4 insertions(+), 70 deletions(-)

-- 
2.53.0

