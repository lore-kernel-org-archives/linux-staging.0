Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D200239E70
	for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 10:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753872312; cv=none; b=ifKv90gKdIDj1K8h2SNAs4EL2zDxTs6UDuUfc8T/Xzty2sZhNBkZBam9uay8rqriRjRK/NfGHehw82gIfgoj8pozReSWwcX1jfslIftFm/XkoJcMF53fxG4gW7xvxkm3VbbI/eHLQbK+Zk1pDEN98myMcpmfozw8bNxpFy97PsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753872312; c=relaxed/simple;
	bh=jOV7BUd+BxQm+6JWyTqHgR6WW31NY2nHqscpQxQ5P6M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UYHR8LsNNJCPc0HBgDNHaVEgD1I1M2PAinejjwpROzPv3g6MSeNjDBfPj9e8Rr0HeuvAUtOhM4VIorn62QtHm3LQrdbe2Py1PzgkeVPreVDamTc2AcMWTgPnZsNYIAdXjkBL3FUUFud6xhrVW+OI1gTy5bD8s1xtxCcODWaF9OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FDF5CLKX; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FDF5CLKX"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-61553a028dfso3650957a12.0
        for <linux-staging@lists.linux.dev>; Wed, 30 Jul 2025 03:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753872308; x=1754477108; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6m4PfRCnoAEr2MU5yGI1+CYXF+Pd2iMMmnbkl/STpIU=;
        b=FDF5CLKXpGvSC+3+RzMzkq5BGzdxeXKShEwX+98w8+DyBRrTxbrRTC9lVKvjhd7HKz
         IPbRneq2m0JY2VBo96RXFabRaK7wL4eYnehsfvoapXwnzt1Wq+sib8op/eH1COw3sVeX
         4+wMPfEybjku0kn4zIdpmff9xWogXZilDtuyIuZasr8gX9z5UF7n++3RP4mUZ4vXUqPA
         QvOlQnCH+TpxpnLayhakr2PQFF8BKbeTGXj7i+2M+lqLdnjai6th6inULeMaBap5oFfQ
         zklyCyKajj5IiQ5Aj/2MBa0fTmGRMeLCFEJW0UkGqs72KTH3wKqRoVqfvjdnjDS/5kYA
         5jXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753872308; x=1754477108;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6m4PfRCnoAEr2MU5yGI1+CYXF+Pd2iMMmnbkl/STpIU=;
        b=KU6l9YOKEhmtNu7vII8yt367wP9rMJDY0WfhDZj8e3B8EP9MKj378rrAcNEaoOiNeE
         IST9vZHZU12w5xMrgbSPqVmZvDvd9eXqQzMlYdAoPgMIK6LyJsb8gpcVX9rLzcI11qXU
         GvwQqENP3gZeGBR7nOWcG6S4aqg71yGMxaQYNDGK4WsN6eBlp4Or0sJsOYMtTv1tqbI+
         a8MqCb8N4KtDpJrTT4sYjD8IiddYupDMZDbCNhc3Qp6vRSh/2dG6rAedXBi5expG4Iwx
         2oV6zOrdJO/7CIdUbzZhtraMMIJH1GHl1fYxVdJCz4Eet04sZsWPkNLIetLHpGZbBjC6
         u7xg==
X-Forwarded-Encrypted: i=1; AJvYcCUJRmfsN1+VZ3fZpBMi26emTA4M1pjjLgeRmg7Te/4NHymzh4aG68Iry3yjDCHPu3vCxhIu9fe2uy2ENDag@lists.linux.dev
X-Gm-Message-State: AOJu0YygHJ7kQyhPjglU+xCWyWE3802ku2L3bwoiPNGvB+mmTOOdUTtS
	6GLWBo4FXYIqhL4V3YMkwjk2DlkHqsc70QzYjhH1XCM4wxaSj8XOJEpz
X-Gm-Gg: ASbGncv83G9FguasWHCz3asnQSrPGPIwONjHsM8h9LyWoyAupvA9UCj0tC0Fols889K
	kgt68bTBUv1yT9JACr+gdEFd+Epm7WaE9VmzoWOC79Dn+8NgwzQMhCd4fZfkBNSKBs/DmsUv6qb
	Nwn4usmGScBOPjYWbWUd1zJ11AxEQU3mBxX5h0tySWlycgQ3EjvYpmKObK476OlRCjSFjx2HReS
	fr8phNTHo1coc3+RK1u8OVQZJHVJ95m8YXdcdhB/4nGnuFG0DAWOJruHZ52IURLN35dIVcsRES1
	F/ikZzWoqmAJnZXf9AAYSI7Uv15/PUrvnvm4yMuXR1rl7QClue7YnTWb/vkOutfwuBLPDs6BqUD
	n3mi4SYpJvjnr89OTpeavSDTIk1XCEfCBnt2QVz8eo7WkoN0nQbCnMAnI
X-Google-Smtp-Source: AGHT+IGkarRKU0Hr17FdMZz3OLaW+08RJPp4c1MIWrnB80qPcPQG9ijy3jGSlIwZSgzYWzd/7qZMJw==
X-Received: by 2002:a05:6402:2708:b0:612:dfdd:46fc with SMTP id 4fb4d7f45d1cf-61586eecd21mr3079139a12.11.1753872308405;
        Wed, 30 Jul 2025 03:45:08 -0700 (PDT)
Received: from tumbleweed (ip-77-25-32-208.web.vodafone.de. [77.25.32.208])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6157974fde0sm1582734a12.7.2025.07.30.03.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Jul 2025 03:45:08 -0700 (PDT)
From: Michael Straube <straube.linux@gmail.com>
To: gregkh@linuxfoundation.org
Cc: hdegoede@redhat.com,
	Larry.Finger@lwfinger.net,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Straube <straube.linux@gmail.com>
Subject: [PATCH 0/8] staging: rtl8723bs: get rid of os_dep/mlme_linux.c
Date: Wed, 30 Jul 2025 12:44:53 +0200
Message-ID: <20250730104501.150270-1-straube.linux@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series moves/merges the functions/functionality of os_dep/mlme_linux.c
into the corresponding parts of the driver in the core directory to reduce
"os dependent" code.

The patches have been compile-tested only due to lack of hardware.

Michael Straube (8):
  staging: rtl8723bs: remove wrapper rtw_os_indicate_scan_done
  staging: rtl8723bs: move init_mlme_ext_timer to core/rtw_mlme_ext.c
  staging: rtl8723bs: move rtw_init_mlme_timer to core/rtw_mlme.c
  staging: rtl8723bs: remove wrapper init_addba_retry_timer
  staging: rtl8723bs: merge rtw_os_indicate_connect into
    rtw_indicate_connect
  staging: rtl8723bs: merge rtw_os_indicate_disconnect into
    rtw_indicate_disconnect
  staging: rtl8723bs: move rtw_report_sec_ie to core/rtw_mlme.c
  staging: rtl8723bs: move rtw_reset_securitypriv to core/rtw_mlme.c

 drivers/staging/rtl8723bs/Makefile            |   1 -
 drivers/staging/rtl8723bs/core/rtw_mlme.c     | 151 ++++++++++++++-
 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |   9 +
 drivers/staging/rtl8723bs/core/rtw_sta_mgt.c  |   2 +-
 drivers/staging/rtl8723bs/include/drv_types.h |   1 -
 .../staging/rtl8723bs/include/mlme_osdep.h    |  19 --
 drivers/staging/rtl8723bs/include/rtw_mlme.h  |   1 +
 .../staging/rtl8723bs/include/rtw_mlme_ext.h  |   2 -
 drivers/staging/rtl8723bs/os_dep/mlme_linux.c | 179 ------------------
 9 files changed, 155 insertions(+), 210 deletions(-)
 delete mode 100644 drivers/staging/rtl8723bs/include/mlme_osdep.h
 delete mode 100644 drivers/staging/rtl8723bs/os_dep/mlme_linux.c

-- 
2.50.1

