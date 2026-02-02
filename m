Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 622482E8B75
	for <linux-staging@lists.linux.dev>; Mon,  2 Feb 2026 10:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770026966; cv=none; b=Z7HFNwK6w5HabBzXfW92uCzQvRbqnro6nFdTMoyctuffypz00la6RN15rWdB47T3MZXcJZUlydVPsLQQcxXsWlYebzM1Ic7Fd8AH+TJiqRMPENtBu5DJgO8ZWW7SvsFqMcE0BZaoOIIoGR9gPI7qVCRhyDCRr4Cp1dBbVF+F6m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770026966; c=relaxed/simple;
	bh=FpK5W9+l3XLqDb/6vD6nhc/0lXdO7QRA6SP+9UiUdi8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dmHWzSRtpDYMJHEtq/WPHLZ5NMIptJPZ9qOtWEVnRWAKzOrd5Z5Ln2uf8EosozNM/yjYiECVc3z+GmwvB2adnyrUhHVALWIssw0R6KE0QWQy/aWeMF+6H1cPeEP/rHFEbbS1IgT47hFiywhmaozes1zIk3/OdmcdlK4n1kJ4djM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qb4yhrp1; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qb4yhrp1"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-47edbae8307so2157165e9.0
        for <linux-staging@lists.linux.dev>; Mon, 02 Feb 2026 02:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770026964; x=1770631764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=amKGQ+6OLxZ039QupXMOoFYuiEnVlfdk98CvGXDGtfc=;
        b=Qb4yhrp1WBgkEiQ0w+FHzrU9tgnbuh66qP9M2mbCk4pVzb/OJk5rev5a15Px4GJp42
         jhYL/Vv4ukiknHPcrjnCjD+xZBiKZnidqLdB76aMflhqX4MBYi8P0Cpl7bCiixfzQiL2
         alE1T1hvQk6gvzhFXq/qXhUrU7XSzl77nsWuy2GwdAZ0KC3Z0XqqDytV27Ggzf/OgvBH
         Vh/H2dhZdeDzUTcIk4BpR6UT65KTNdym4WJxflzzPPd7QfV0OfFQXSKXOPaL5k3KtXEF
         +ZRDPCo0pn8r29HATsLjLArNsfquW9ulwxjyAaLKm/kVxSThehP1NEnl4pHn2HlGECq4
         LuKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770026964; x=1770631764;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=amKGQ+6OLxZ039QupXMOoFYuiEnVlfdk98CvGXDGtfc=;
        b=YF2IsnON0k9XcmAdc+1M4cnpdhX/oiGWNMOcRgAynyQQ8WjAwMKb2hOp/fczaWZ6id
         A3Rwz4i0u1i1qxJnjc0Ddj9x/h8rxn+t0SWoLYz/BQ5XLyCcmNtIGrmkVP8IsAvxjocs
         Lkbp8XBpVqJi8lD8XSZmR5rWVzZJzL1GB97Gh4OWFnsBAJvJV3LSK2KyeSZ1wkeh/HE/
         vqK0wDSrJjar0TaosjaAT5KziaP1jKeKzybOmHRrvpMQ855Ne4deRL1+Mm9CDOxZImqH
         7RIIhJzZU/ezUOFKX08WsjJu5PJDkBmZnrnk4X3S7tkxw3PI/A4Q9ad0SOyrH8K839EX
         cU2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXZ1wqPEsD86FTcIIV3XJw0BnbFahBW7SV/12sgQabNAiN1IS0EeI+gJtDM7nSXGq83fcP0+YYoUm05X4uP@lists.linux.dev
X-Gm-Message-State: AOJu0YzH1dQzGO0AJI/4deorVk0rpAYg+mwGkyYaPypUXNbzOBtW/naK
	ysQ2MbQtk6I7VR+EfL8Bd8c8+W3AG4OqQl/x4IyS/t2tKrHbY1Bdm7Rs
X-Gm-Gg: AZuq6aKmEWK+D4aseOYM8/eDG4yjX9DFOHJmpuQbYQm0RP/e2hiUgNEh6z1zo6DHSAK
	7eT2nliz3AgLORGLpiRqRw1KbeOYqnJj7HN09DNBdgqGBvXDuGDsy0MIcbLO7DI75TFMNDRfLO8
	Do/ix4cRPmsQtu/eaqqsqRveOjYmQeu/8XVKYM85PtXA/ucxMj8y7ZvfVfqd0voz4T5TUCZ8/Dq
	gkfzsd9gmbYqWH709jeCC2loW7KpbZkf+nOO7396+hlyxDrQSvYi8RLGbkwWbfIGnT26ktVhLWv
	Lb6IWrMUP7faZ2V1R6jkTvRjAMIJIjdkVolk1AOvwD/MucmCtxzcreXeWU/mMsAqgDoJe5Q+iU8
	+i1Ky4UbWxLcxu5iGUh6teWNwNrxrjKTZo5kKn5PwC3ll/siwzdoyq9kqWqlgzHsHYy+DuA/UOP
	EGl3vWkJ+Z/dfX6ZwDRSsuj2hp2pP+rilvsIZVzN95aJ0msp/Ea8rE24BVcFhHUQ==
X-Received: by 2002:a05:600c:6291:b0:46e:43f0:6181 with SMTP id 5b1f17b1804b1-482db4bece3mr88488395e9.7.1770026963556;
        Mon, 02 Feb 2026 02:09:23 -0800 (PST)
Received: from fedora ([149.3.87.76])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-482dbc7f580sm114202115e9.2.2026.02.02.02.09.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Feb 2026 02:09:23 -0800 (PST)
From: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
Subject: [PATCH] staging: rtl8723bs: make _action_public_str const
Date: Mon,  2 Feb 2026 14:08:50 +0400
Message-ID: <20260202100849.133313-2-giorgitchankvetadze1997@gmail.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The _action_public_str array is never modified at runtime and serves as a lookup table.
Mark it 'static const char * const' to allow the compiler to put it in the
read-only data section.

This fixes a checkpatch warning:
WARNING: static const char * array should probably be static const char * const
Signed-off-by: Giorgi Tchankvetadze <giorgitchankvetadze1997@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ieee80211.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
index 8fdeeda88a6d..4de0875904eb 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ieee80211.c
@@ -1139,7 +1139,7 @@ int rtw_action_frame_parse(const u8 *frame, u32 frame_len, u8 *category, u8 *act
 	return true;
 }
 
-static const char *_action_public_str[] = {
+static const char * const _action_public_str[] = {
 	"ACT_PUB_BSSCOEXIST",
 	"ACT_PUB_DSE_ENABLE",
 	"ACT_PUB_DSE_DEENABLE",
-- 
2.52.0

