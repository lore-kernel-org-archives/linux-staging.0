Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD373B71C9
	for <linux-staging@lists.linux.dev>; Wed, 17 Jun 2026 06:42:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781678583; cv=none; b=COnHcYGtFYTPFh0xeftwjtcxRS6shKlu2zOGIc7EGps0nSWsiYXCYcRwBOKtzxO8mDWvxCSQOuMvxAZTyU0pTOPiCsHyKQNxV7JG2oLf5YQUOwCKWn6o3QiRY9vo570Fksde2u9tG2EqGN1pGnYRqs5dQ2Kgot3yDkNzcOFRgtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781678583; c=relaxed/simple;
	bh=0N6ZV224FQvgADePgYP1XR5ENaWNrbYP365honw7W58=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Y1/Pe3LgQEsw8nT+a8miy+62OT0YGw02zkfaGmB6T0hFleGqWaBKcoQtxeIcJJSdIgO5Fua+/AxVR251b/IC5S1wk4Ahox3driKEOukxD2ZSXFBiCPJR6oDlFQMdNCru6woFRi/iHFz19TswhrFNYfoBwPO1md/MFB0lDGqwfsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aeQqSDxf; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aeQqSDxf"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c859878eb48so2219928a12.0
        for <linux-staging@lists.linux.dev>; Tue, 16 Jun 2026 23:42:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781678578; x=1782283378; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Dy6JKVwc17CsA7suw9wklD3+/xiv8oOOxGgIJqImsiA=;
        b=aeQqSDxfioA2ORDkpF1OQZ0ojHCORjWVkyLt2XhwmK73+TaT4RPuHXgZ3X6fgJp1lo
         OfIv95CCMhGJ053hsqLH2SjvXcAPibBkLwCH6fi1B+NEdKXALJGWsCEcQ8hPw/Q8+8dh
         b9lzV6oVydakzVHIMzc1gSlBobc2ZQ620kTsVDP1WGpFpAwfR6LBwaybS1mSNpllD2ED
         33ts66CVRIL0N4PsA1kAqu+9lZhYHc2xojc3BehcdMVSIFZTuym7piGxH0OdqFHO6L86
         X12BJBctfcsqhFqPknh1YdO/K7OWC6Tnewp6X5ZcBYtmeBRXmom62n5/VuEZKURZRAQG
         4cqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781678578; x=1782283378;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dy6JKVwc17CsA7suw9wklD3+/xiv8oOOxGgIJqImsiA=;
        b=osBUT9PrUE5VaX65dBz34RcDRzyz/+m/1Rmn84cShXL4EEvADVjXF4yS1AyWFrqChl
         PnjnXmToLw1BCI2fhL7q+M06MG96A4+H7Ltum2NAdc2Lxf8De9DnMy4yitBs47I5agrV
         Lxf1ymAT7Kds7CtkxHVq8yTI+5EXxbROP+VnFdIuFjGhStx/UIsDj/hDGP9pMUSb9yU5
         K0M/UbFEi+4mXp1+Jg6wltXWGCKAOJXUQ5KsTD/91HcMNZ3/nc7rwjVTGnSm3pnSkiqZ
         q+7pLbrRVae4Yk2wAUuoV1N2+SXaPewdXqUnAg2xXpYks4CXqREwizNb2xjFVasmwXf5
         t0cw==
X-Forwarded-Encrypted: i=1; AFNElJ+UDHmpEJq+v9Od4+rarrJ6iTokcOHlPsOP8DQlNCBmFTq7JuU8c6OttaGrLCVTStk1OaAw3Xptg7Inisks@lists.linux.dev
X-Gm-Message-State: AOJu0YzMHtdweZ+DHnS/2rxsD8qblexDlYGHQhT91brKnUbr2qbBHhJt
	ygoVwSLH3bAu32ZC5tVnKMOLZN/w5vcnb5CQjjl7fPkvm/Snm3RyREyk
X-Gm-Gg: Acq92OGkcj1Q5PUlPBZRFoWg7g7rYo0r0wL3ZXMlii3U0PB31PVdBDA9xqPUVun6feb
	fAuHjs2ecT8hUSLz1OlQz52zDDewk6TUkNNxodhxoM5Q8SZozkrozWcUIJpmIloFT48bBqGTGLO
	/WNHtUA9c93HZFltsxSbcEzy5fQNcuirGT8x0dLVrnih4atGHuBiB2pF7puF2ym6uzcc4WM+Irp
	5AT7WxN+l35YdK56E4NkigANT3+04de7rqFIzSk6BrS/DAPxKbEDjhlqM03x2W1csLgi3tOHoKG
	PjgQy8bRTmRhtNFGOyl9Jkohx35vZ8i+Yw7Ep4FO7gzeOZ+p3lL0+cY8XdKWSJa2v49pYQjrU2w
	xds69QAKDB0X/bwDWpRcaMQ43hxw1x+DnLbOafAnnnmcZuSggXKJCsjbwPStDmTnfIf6DMFbBdj
	SZw9c29hdv5NQw8nkoPj0zOGmCZATOBc1rpvp68k9LKb4Ee0CTe7TpAVoqM9JcWbBHHiWQ/plgO
	Hsf6YdjHAVe
X-Received: by 2002:a05:6a21:a45:b0:3b4:b259:6950 with SMTP id adf61e73a8af0-3b8b6cd31cemr2598157637.29.1781678578139;
        Tue, 16 Jun 2026 23:42:58 -0700 (PDT)
Received: from fedora ([103.51.149.90])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c866325d156sm13738985a12.13.2026.06.16.23.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:42:57 -0700 (PDT)
From: Subhrojyoti Bala <subhrojyoti0609@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dan Carpenter <error27@gmail.com>,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Subhrojyoti Bala <subhrojyoti0609@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: Fix coding style issues in header files
Date: Wed, 17 Jun 2026 12:11:48 +0530
Message-ID: <20260617064150.16078-1-subhrojyoti0609@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series fixes coding style issues in the rtl8723bs
staging driver header files, as reported by checkpatch.pl.

v2: Combined the four comment style patches into a single patch
    per Dan Carpenter's feedback. Kept the enum indentation fix
    separate as requested.

Signed-off-by: Subhrojyoti Bala <subhrojyoti0609@gmail.com>

Subhrojyoti Bala (2):
  staging: rtl8723bs: Fix indentation in enum in rtw_mlme.h
  staging: rtl8723bs: Fix comment style issues in header files

 drivers/staging/rtl8723bs/include/rtw_mlme.h  | 56 +++++++++----------
 .../staging/rtl8723bs/include/wlan_bssdef.h   | 13 +++--
 2 files changed, 35 insertions(+), 34 deletions(-)

-- 
2.54.0

