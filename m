Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34ACE33F5AF
	for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 09:36:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774517779; cv=none; b=NcOieAb+BYqRyDwZ3l+2l4feLTRVfNqSro2wP2NjGldGZsuMiUP9aAJ54vYY14QExu31MfWK72cF+69rNueOgyUz/0I9wUMp0uw8nBjTzE+Q3Qedh4EZOn/VX7bcNvTjJg8VVndhXczufaHDTD0+ZpEPLTmH65MkQ0Kbbr1g8ow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774517779; c=relaxed/simple;
	bh=ghhmloXFbOrSF3o1IalzaZwcMTYkLZyitC/7rNFrLrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IPbRlhsHZoIHOz0bGgmgmqd7Q2dZylXxrOvgnl85UBj/De3UKN2hF8SFSSUSEe3tBticzgyrSrFD8srr+AsjQwtc0KWg3aZ42mWIZgnSLBoeuO80XiI7PeinMuV3E054htTjkOIHocKATcbD7O6ieuT8iRMQXpJiVzWU6Sma+u4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJbE397t; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJbE397t"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-48558d6ef83so6678275e9.3
        for <linux-staging@lists.linux.dev>; Thu, 26 Mar 2026 02:36:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774517774; x=1775122574; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=BJEZLngVOv7saVWGj5F6QAx0lJVc50P5Fdgcyi95Ilo=;
        b=IJbE397tPwN79QaIYtgZFs5MZchng+W1ol4uXzhIci8JT64JywdacWzhU8E3rjXF1F
         KxdIDZFEdIpVOzYo3U7rlp9lscSnyyTe9Jyp4qyGo0WWX7lhsBZ6uFxN4/3Nkymb2f9f
         LYqAlXHNBpt0vU43YV1A+PscQ10PYnS50v9wDt2dz71VTnXa02fXTCCNUzXnpOUHfEy+
         9CYJ0pVztNVIAL3TrETUsCVkO+WoasklPZXHXL10NhLh0KlnRS5W4eI8mcP3KVyrkyVn
         G6+clyZONW2TlMqyF9dP3SRWA+y6fpB+NjJUOKbXcKjssUUTvVfhunvzFy9fpZ/niP7g
         7ETg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774517774; x=1775122574;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BJEZLngVOv7saVWGj5F6QAx0lJVc50P5Fdgcyi95Ilo=;
        b=fHzzpyo8ZZsEHZYjVBKDDJFJQoMTNXog4U6ei/3f1wvnPt4l7/6gJY2Lk2GJvE5QUi
         GcCzvkjHpSQ/AdO+TeuVs9PGZM4DobVFDYenvuBnG1maROFowtiXbEl2nrCpfZ02rTGp
         dWnJW3eqJUcsWYocSxKat9FBWJx5H2tNRPcVrVLK0w3zXL9vGXKdbO5VlbwwNKi/YPFx
         5vM3+DW5e5DhPH1NFnN2BXuHs92KDNOBmoUv2EeT9RDUQ+a/9x6v3AMxi66alhwLUsSA
         fkWJWleNSeXQM9kwQPUoTVIWvvm8zyNhL8x9wuStTLzNuMm+vS5lb/CZf82zKpstBcyM
         YvVw==
X-Gm-Message-State: AOJu0YycG9dsvssFHeNLd61Hru5YEXe9ixk2+sgfk4R2tvT/IXGXDGHS
	XJsqbha3M4FhIN/lS2XujReCgJHQFIDzT6Qk59d8Si3jV37beekdjpj9
X-Gm-Gg: ATEYQzyZYLY3jBuk9WbYd1mAj7xbD03Ca40KhMS3X84VfPM9ou67I2zrxzN4Y2WEjb4
	GdJZpfxGQbIwThXHwa15F2fgw3VXlUObg6iP+t7Vbjpk1A35LPyft+7QmbeJLhUInhVbdC2xQh7
	sbkWLu69qge7TiBQHR9NG64mabKYeVeZk/UkQeq9kcuiir5gEcR9AyDtNxd2lcP90PNe0yy67ai
	C8y+GAYDxgWF7F4x5aui7QhUq38paJ2BfQw4sWl1Rs3+aMBtc2ljVx+n5NKKMAMq0cpJfvyl/Oz
	d90Q1f3FMbrWeN/Cnckn5qB4nPYJZg4pTFe45FKKal9EeFr1/BbsxT7XyhxS4fRdLXAcOggS83l
	8N+tVPqeDejp+7VjgU9uoPZ8PGXtNnwW+hj5OdPFSA0g9lPkf4Cwq8eUjezukRPdet6JwumG15u
	v4v/HQzCzKEyLw3WqyNaTWzfZaDKn7AReUWw==
X-Received: by 2002:a05:600c:a4f:b0:486:fbd1:9dc0 with SMTP id 5b1f17b1804b1-487160350d6mr93876445e9.22.1774517773947;
        Thu, 26 Mar 2026 02:36:13 -0700 (PDT)
Received: from potato ([31.176.167.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48722d236a9sm41224175e9.11.2026.03.26.02.36.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:36:13 -0700 (PDT)
From: Omer El Idrissi <omer.e.idrissi@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Omer El Idrissi <omer.e.idrissi@gmail.com>
Subject: [PATCH v4 0/2] clean up error handling 
Date: Thu, 26 Mar 2026 10:36:05 +0100
Message-ID: <20260326093607.13011-1-omer.e.idrissi@gmail.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series lets sdio_init() propagate standard kernel error codes 
instead of returning _SUCCESS/_FAIL.  There are two callers for this
function.  rtw_resume_process_normal() already returns negative values 
but the caller doesn't check for errors so changing this doesn't
affect anything.  sdio_dvobj_init() returns NULL on
error so leave that as-is.

Signed-off-by: Omer El Idrissi <omer.e.idrissi@gmail.com>
---
v4:
- Squash commits 2, 3, and 4 into one commit

v3:
- Add one commit that lets sdio_dvobj_init() use more readable error
  handling
- Add v3 and v2 tags

v2:
- Add one commit that lets rtw_resume_process_normal cleanly check
  errors and return errno instead of using vendor-defined check

v1:
- Use direct returns in sdio_dvobj_init()
- Cleanup return in sdio_init()

Omer El Idrissi (2):
  staging: rtl8723bs: use direct returns in sdio_dvobj_init()
  staging: rtl8723bs: cleanup return in sdio_init()

 drivers/staging/rtl8723bs/os_dep/os_intfs.c  |  8 +++----
 drivers/staging/rtl8723bs/os_dep/sdio_intf.c | 25 ++++++++------------
 2 files changed, 14 insertions(+), 19 deletions(-)

-- 
2.51.0

