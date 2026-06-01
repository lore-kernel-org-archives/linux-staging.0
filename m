Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1C83D7D6F
	for <linux-staging@lists.linux.dev>; Mon,  1 Jun 2026 15:03:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326183; cv=none; b=M1T9YsPXK4400zrfnDS55BBpJuu40vCpR3R3A/kwY8rHpXkm37mGnDAf1fMHsI+iWTd6JC3gxvQb6BietonUOsvWeWV/i1PjwBgd/DCoIdRb3xV+KYQQTVhMXU/qGOLjc2Mcv8qxgKr0fOBv4C6IUGpJbyD3LBIO9hSzOyFZFLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326183; c=relaxed/simple;
	bh=g9f3SCn5GupVBW5PSH4Y+9JK10KrZbmSx9F2MoVrv/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fPwNIIEA4TZe8BP8HG6D4iFkfPxu40pHkP0P3JUozwWWnWeVtCu5mX9nbQZMG6B6bFIgNn0U2l5ZV1Dpolm+GEia7Qoz83kZJ8hMUO/5hJRWEFHhnNbiaBA5w8XVjUtwqFRqvtvyj5uAK8FE2i3Gn4I7DgXHjFsqjU/dm0BvbDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LmK8fWZU; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LmK8fWZU"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-bd8d0e4e341so2379054166b.0
        for <linux-staging@lists.linux.dev>; Mon, 01 Jun 2026 08:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780326181; x=1780930981; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pjSavsD8sHilBIq7cbqQIMGeXkIW87CdRUauefk+9e0=;
        b=LmK8fWZUZ2zzFCxVqVJ08rtLM90uhulOp/pFez1uhbjKgBbGpzgK8lvfLP4sx10TUz
         ywT+YRYdsZGtXX5X+A0qG84H1nyPCJAB3X4qeE2KHrfCyZyJe2FbIek6MNa1dfJsZ129
         SLxELPncJnJOGWS+qYR+FhYfjt+IfwDj5cCvaQ3BFEnLvcS0kDgugbMMeAgv9RlNw4E1
         QGb9YAJlIgdxwjWPlrIN5O1SUPW8p5BWeapf9KcGGKJUE5fGR+5EQUxSZpxyV6uFDHu8
         kaYAy1Br8obIOBkeVt02Ahd8ADelNPPm3FpGsSPkLMsjXYysZRN+i+8eczZQfz1Zlxzn
         FUfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326181; x=1780930981;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pjSavsD8sHilBIq7cbqQIMGeXkIW87CdRUauefk+9e0=;
        b=AJ/DmK1hiDBdRR+HMQcAcW8H4rSsvQ2DR3Z0qNvNXRegvF9vrB1WqfUeeQsH5YjA6I
         bTXcPh8fO9i1wsZ+qRDTcKHGjszPcVdkNdUI6E6s06RMRwkHkmrv6WMsbQYBo0jBV/mL
         utmjoxal/2FYeHTrh1BgNajNmfY9HgLrlEgQK+xCkBCd27uzAG9UaNftzbKvLJunLQCv
         t6638B1C+vnbkJBNHiXsIImi7l5y0POm0KsAkvLQEr2sSPex5pC28/XAS6DpWfxCau9Z
         Vlwl0B10LoflebJy5Ot0m6yQkUm5Wt1C1rJozl6YLiLWEc6yakXVehhUd3G7Y1WlMVMF
         JCDQ==
X-Gm-Message-State: AOJu0YzfUwE9lf+DZwDiMVFLMcPQDNtFKJMIzjt3Ge78hfhLTgAP3UR3
	0o6kWVHKrzwgwiLH2InSekMyRskSFmiDFl2qdr7cZ96aVp3GjP6ODymf
X-Gm-Gg: Acq92OF0daQSsbFEr6JzTO2qWGYN+M4rSKEcC4xv3bRGTb7Wtppi55eny2THyHa3kbf
	K0ztv2kRwH6kvtv/9DU5ULi6mNYOclZMgHTnMoz3VNJKD0s+AFOKPpMq8PAtcBA6cALcxRN2GBc
	yp8ScEWbVNabPrmSNkAkDq72FwTpawW2H3K4TF0LMPZ0dsaivCv9p/Jo7sm3KWhU7NivtXn4WSn
	cwvhGNr8ZtnrXOC50l7kMoIRjuYWQywVNPitqJh7bw7FAuaZYxJul99z3tUWYAnVYcSh87jq1zV
	J8wWJOfkyerFGbYVv+5L+waad5e3ToUHHyHoYuxbKyXitHB4dHE61HZuDgwtZSfgeFAmieumfWd
	0IawsE7jj2Y+7+mTXCrfBD19l1bOrYVnqTj1LS7+B9YrVjd940qJQn1Wp8e0pXOba1VOHKLJ1X4
	jqPVjtrvndwNo5W2ZZj+xucuziDggKxBZLHA==
X-Received: by 2002:a17:907:9624:b0:bee:f0d5:1c71 with SMTP id a640c23a62f3a-beef0d51fa7mr3432866b.42.1780326180287;
        Mon, 01 Jun 2026 08:03:00 -0700 (PDT)
Received: from archlinux ([185.140.161.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bec1642a049sm189607466b.61.2026.06.01.08.02.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 08:02:59 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH 0/2] staging: rtl8723bs: remove unreachable code in
Date: Mon,  1 Jun 2026 18:01:22 +0300
Message-ID: <20260601150253.69930-1-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes an unreachable switch-case branch in the
update_beacon() function. This branch doesn't check the value of the
'oui' pointer, which could lead to a NULL dereference.

Found with cppcheck:
	core/rtw_ap.c:1404:27: error: Null pointer dereference: oui [ctunullpointer]
	 if (!memcmp(RTW_WPA_OUI, oui, 4))
				  ^
	core/rtw_ap.c:235:19: note: Calling function update_beacon, 3rd argument is null
	     update_beacon(padapter, WLAN_EID_TIM, NULL, true);
			  ^
	core/rtw_ap.c:1472:3: note: Calling function update_bcn_vendor_spec_ie, 2nd argument is null
	  update_bcn_vendor_spec_ie(padapter, oui);
	  ^
	core/rtw_ap.c:1404:27: note: Dereferencing argument oui that is null
	 if (!memcmp(RTW_WPA_OUI, oui, 4))
                          ^

Nikolay Kulikov (2):
  staging: rtl8723bs: remove unused case from update_beacon()
  staging: rtl8723bs: remove unused 'oui' parameter from update_beacon()

 drivers/staging/rtl8723bs/core/rtw_ap.c    | 116 +++------------------
 drivers/staging/rtl8723bs/core/rtw_cmd.c   |   2 +-
 drivers/staging/rtl8723bs/core/rtw_recv.c  |   4 +-
 drivers/staging/rtl8723bs/core/rtw_xmit.c  |   8 +-
 drivers/staging/rtl8723bs/include/rtw_ap.h |   2 +-
 5 files changed, 24 insertions(+), 108 deletions(-)


base-commit: 7cb1c5b32a2bfde961fff8d5204526b609bcb30a
-- 
2.54.0

