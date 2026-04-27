Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E33DA39A074
	for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 08:19:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777277979; cv=none; b=gIMbAfecCnpwAuWqXQGI/LKvsHqmPGzFmgbLCF1NQLI5NE4bYtoAyXsLW/9/spZ46RkcJ3VTWnoYhwEH4eSciMk4+HZrTQozr6fJaGWfdN2Z2QOXtwilMD33YgzQlGgWhbYI/XgaqVb9KkzNXEQD7HaKWmXrTUL5IZui6tVmDNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777277979; c=relaxed/simple;
	bh=r/Wx8N+TzSIf88QST3/R6rgVPln6hsLTHzTDpaK4xm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ssGKAuThv7lkcBWIHesEE4Qj0jbuxFLbngpxtCiyVZi89iTnx9fHtWIjPJmiGnMAQ4RIkfoJGQ2JyYUiWz8atlpTPiyMPEyYaj5Oko4wjE3k8XEuHcS48hPYCpM4ueeiWKk2Xca89bj22qXV0/60x1AjmyLE2yErfHgSrOaN/Io=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QvHNAHgx; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QvHNAHgx"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d64313c39so7792063f8f.3
        for <linux-staging@lists.linux.dev>; Mon, 27 Apr 2026 01:19:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777277976; x=1777882776; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SeS7jfeq02kdIfdPZeM3Est0x/TfzAtyHosBJLLc1RM=;
        b=QvHNAHgxeKQzXBXLh8kDYawAc4O3Bngf7VZhE0HhLOkQaLlc/IHLZ7BItZfo7mGmOw
         88MJXVPxIj7LKe9SCWb1yIPlphYlFLh8JAi3KesHSiIWcV+cbY4uh/jyIgJ8r7b6bQ+q
         0n6Ylvv3qMjUMT0hAPGVIhZnnKiIkp9uTFOiXV6dqPqfrTNnf5XS6S1iOXXcKdxjet4p
         umJvz+QA7aIzsFXqAXiKu7tIWj+A8vEGkcDH79BTOQI9uiL4E9xUt7t9238IgsuPyWwT
         AnGvhfdgyspb53O4xvw5Cll4pjPgU2AZ5CW692VMm8d0IuoTtmqEKem+xePXf2CmPbx5
         oj5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777277976; x=1777882776;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeS7jfeq02kdIfdPZeM3Est0x/TfzAtyHosBJLLc1RM=;
        b=WEBnFl8t9REdaS71rrRI0H8FZSlSwermtGROPg6UujS3B6jZyeHkDhSfonRiHOxt+f
         zT4iWyNFr6FLOnW+mvxz65rCpmbG5jX/0m93wndS8NuQyN+dbndVAEf6LGfGZgxOxDk1
         o3K44GUh6xQ56p1ZRDr83zYxi+vHb2jAl0KW6iU240BPZ+hSU25tIcoaXxn5VZmNoMI2
         XRxEZcqcwx6GFB40MZo4O0QXaQZqIXbMS/f54Y6yeNkuvl6CIteWfTHuYxExtZvlCret
         sYqW0IZd1VLqIwfbR7OnDrsQVm9TrmyAeTRbQbdjmtlpasRsmEd9RbDpUawhL7Yocc6l
         zIug==
X-Forwarded-Encrypted: i=1; AFNElJ/dGeV4wHev3fREyExPsXPS9k4aZwqcdjSZZ/931v5pneXtkv2zcqhT1YWBYY+W3mf/Z6Ri42FqtSs347Xk@lists.linux.dev
X-Gm-Message-State: AOJu0YzmBo/InScFe53cdlDL9ki+PIlRwJnHLwQ7aAYhkTc5nmdZGYvF
	n+0FA+yFAl9/2blDF2MxI5l+32wLK4q2pN3Lk+urixa7enr0JR6LagkwyQhS2Jz5
X-Gm-Gg: AeBDieu/caAu6XYya/rKMK3GUfbI483Z2aTpEm6IPc8RQTotWJ7r0IVA2cAwQfMJnDs
	txeru3F6fVEfFE4tG7kuVxZiGvWHAhX8v1NQLYQLIVroaNhypanPGBZ2pg87HqB1XkFUijGajhO
	ZDeN/FoqH2RR4mH2aqsEbEOdOzy//wLxdqrRN4TvtUgv5HzUfJNT7BrudHh9eIFa+Hmxi4SD435
	qh165K5GoXuHClNVbFSj1er61+IK6dwIXogLudVm6+rTm3dbiWWcjIwZ+I/MAmMsqdZcrR9eK7U
	jGSuZ4UqkNaIZQHaUQuPl+rhSODnC47E6vlmMb+gQoGv0snIPagoOw3JWgKMoS1HQAz9gXEkVjy
	Cw4GxMpFbHEGb4HA7DbNxR82jEwrS1MhVymKuUuXcHFC7uJzMQdiJ9779ZsHIpIfFtZQVhoWOG1
	c7mSzkmabeTOLiUice+g5LSa4c55IWpJz5DdpvJYvP49WfB2w6iVWVRCrna/oZP7GaVpWiU2E30
	ggIx6/5koHyKc+LX3E0UbZdVvN64ROqgheOCmJW96bHoXx9GwdqUn6ClA0tcYxI2yDvHvAEXTrx
	ZQ5FCQ==
X-Received: by 2002:a05:6000:25c6:b0:43d:7a08:a5f8 with SMTP id ffacd0b85a97d-43fe3e0ae91mr64294758f8f.35.1777277976246;
        Mon, 27 Apr 2026 01:19:36 -0700 (PDT)
Received: from ahossu.localdomain ([82.78.232.184])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e3a18csm90455670f8f.20.2026.04.27.01.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 01:19:35 -0700 (PDT)
From: Alexandru Hossu <hossu.alexandru@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: error27@gmail.com,
	luka.gejak@linux.dev,
	Alexandru Hossu <hossu.alexandru@gmail.com>
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix OOB write in HT_caps_handler and OOB read in OnAssocRsp
Date: Mon, 27 Apr 2026 10:17:46 +0200
Message-ID: <20260427081748.3407939-1-hossu.alexandru@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

v2, addressing Greg's feedback on 1/2. Greg, please drop your patch
and take this one instead.

Changes from v1:
 - 1/2: switch from early return to min_t() truncation, so APs that
   send an oversized HT Caps element are handled gracefully rather
   than rejected outright (Greg KH)

2/2 is unchanged from v1.

Alexandru Hossu (2):
  staging: rtl8723bs: fix OOB write in HT_caps_handler()
  staging: rtl8723bs: fix OOB read in OnAssocRsp() IE loop

 drivers/staging/rtl8723bs/core/rtw_mlme_ext.c  | 4 ++++
 drivers/staging/rtl8723bs/core/rtw_wlan_util.c | 3 ++-
 2 files changed, 6 insertions(+), 1 deletion(-)

-- 
2.53.0

