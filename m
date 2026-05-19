Received: from m16.mail.126.com (m16.mail.126.com [117.135.210.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906444611E5
	for <linux-staging@lists.linux.dev>; Tue, 19 May 2026 09:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779184010; cv=none; b=LpFCpIAx/WhG+4MKj8q4KkJOKqg4T7RIjBCHHthV3lA1dBrlM6qOFgvFdU/3wsUCmDUWGC6vhuPs1KfwijNcbvH8079NatZjYiOHOvAmCZ+D/CZOu39XrD4bcDecZ2+klKs9AWW0/6qJal0pM6GcMUE73zcxRWazaV04XMcW1OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779184010; c=relaxed/simple;
	bh=aqQxh/GYKpKQDPPypFIQ793KTMQSEFpNjAZ0SzfzXE8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KXE8xXfmaCITGwrFDprMeGBTnU399mlS99eOAEiBDIvKpYoAmiFG8dF5IFGyk3AB6pmL2rE4t+o+M9dDOeCX4aOJdd55Tt/zLZNWwZ+kQWVJXHRJgZECyx7SjSuHVmVJ0poHhx/puOwTIZ9CyWrox9V5GWhVbLU+oY8oBHgXBuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com; spf=pass smtp.mailfrom=126.com; dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b=ERmYQ5Mu; arc=none smtp.client-ip=117.135.210.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=126.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=126.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=126.com header.i=@126.com header.b="ERmYQ5Mu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=126.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=B7
	jeF49n5W547+YmP6UgRp2uQjIMQjHgqjZcvMFhGJ8=; b=ERmYQ5MuA3UqtGFI18
	4C70/oluIdZpmvUrTJg+vAtZAXpAjzTLCDuGjWJqzvE1tx7Kepo0T+vlx8CX3Qd9
	dPXUQx1EVABXQ0/j9VLFQFKS/OK+VmOm0QFTY26CpXI/Pg1X2m1I8O23OYCxbZNy
	9XXZdBe+kkOOsMfqgr7CTNJtg=
Received: from DESKTOP-EQVOVNC.localdomain (unknown [])
	by gzga-smtp-mtada-g0-4 (Coremail) with SMTP id _____wDnryN6MQxqbACWBw--.65405S2;
	Tue, 19 May 2026 17:46:34 +0800 (CST)
From: lixinyu <xinyuili@126.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] staging: rtl8723bs: fix coding style issues in rtl8723b_hal_init.c
Date: Tue, 19 May 2026 17:46:31 +0800
Message-Id: <20260519094633.869233-1-xinyuili@126.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260519090114.828918-1-xinyuili@126.com>
References: <20260519090114.828918-1-xinyuili@126.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wDnryN6MQxqbACWBw--.65405S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZFyfXr18uFWrtFWkCr1xKrg_yoW3Cwb_Wa
	y8t3WIqr18J3Z5K3W7ZanYqFZrAay8Kw1rt3Z8KrWUZa4S9Fs8Ww1kGr4fZFyfWF40yryD
	Cw42y34vyr1IgjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUnzbyJUUUUU==
X-CM-SenderInfo: 50lq53xlolqiyswou0bp/xtbBrxoIUGoMMXp7ugAA3B

Changes since v1:
- Rebased onto staging-next tree
- Split into two separate patches (comment style + operator spacing)
- Addressed review feedback from Dan Carpenter

Sorry for the noise in v1 - this is my first contribution to the kernel
and I was a bit too excited. Thank you Dan for the quick review and
the helpful link.

lixinyu (2):
  staging: rtl8723bs: replace C++ style comments with kernel style
  staging: rtl8723bs: add missing spaces around operators in
    rtl8723b_hal_init.c

lixinyu (2):
  staging: rtl8723bs: replace C++ style comments with kernel style
  staging: rtl8723bs: add missing spaces around operators in
    rtl8723b_hal_init.c

 .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 106 +++++++++---------
 1 file changed, 53 insertions(+), 53 deletions(-)

-- 
2.34.1

