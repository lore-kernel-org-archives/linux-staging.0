Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794830838;
	b=OQAYhJqfbLiYHDghRxw8n3xS33PuiKsdscp+BFYxrhCL5Z2TaTGgkiue0v43ArKqeYXi
	 dFfdOiPWRX+l/MiVCd4ruhkBcW+leptGeNkgWsYQi7V8Cm0ZOYMgiOyPbgq2t2tTklARg
	 kgd/9L02VgYSb/wDQIikb48MmCB6bxBNZjBeJQSDIBJisOFL0Zy1LZ7+DQb9X9WXX3ls5
	 wWBdRoy6D7Xj3wE4C8tqRjx+CGhD6R914sXOxVxGL8mXYM3BFTNcrRnda4v3IBcpSkQ5k
	 NAapeirkOtF+MeruulT5sM6xDbSgjUIqAVBUX20dMuY5oAMkuA+ORu2vnu4zcLg5zrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794830838;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
	b=u+AXFSAhcn9I/8xF6jVMhjVkj6KfG04F6qi6StEnh3NW72/OnfaMf1cuevMekahOvNN6
	 FwpU18zPVF2HwDatJ8/0O62VbC/xSwzw9wqsK91OQ2j6dOlHuIHM50Vd6w/7QdCI7uLo9
	 fWVe60nSxzcOLfLSyJJB3BtZH6VFDbgiEkTS2LYEiJRy5JvUtNN/u1yk1zTF2+Tmu3T3X
	 zf51OmPKMWDX3r7epc9G6wvZIOpiSoM/sOsWxPkUq0fEPsvqs0KF1vEqlVX/2GWermNal
	 6VCo03nk6YGFipP84dBRkkOlbqqIEtAO+aFJELNvqXZM1sX6pIs+FRqFqNcnlO69h3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBBhjwUO;
	arc=none smtp.remote-ip=74.125.82.49
Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61022606A32C
	for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 12:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61022606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=CBBhjwUO
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1aefd1bf74aso2486014c88.1
        for <linux-staging@lists.linux.dev>; Mon, 16 Nov 2026 04:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794830837; x=1795435637; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=CBBhjwUO34gnxWDK90djHjAgfiUopiKGUoV05jl9+7oS+nrypQM7khJaQYgdIlTO8h
         6aK/WJSP0zPwJ8PTv8K2gbztIUEhohNOsH34APHsgp00j0NWOhAkfdxMv00dWMZYXdd/
         XxQGnDliNcNCCDY55aiMaeuswALjcIFj3CmqzOxOJ2srE7dXwSY9K5oeiVnVNMGqSX2K
         mx9mEtnCkaiI99UYaXxdXeOVuBIkdKYGcePaK4xNnycn5pdvEjUGp63bOu2qBIoSsZAL
         v0pgzLpeh07kGatDPFJ94iEoxVQS4g7+hHWVzDeogAORzOiqmyKCb2z94EZ3sQTsZes1
         HopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794830837; x=1795435637;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=VQ9fMu9NMp/tbco4p1dhzyKR+F65QW6o/JsPZ/GtUjw=;
        b=Q+exf2RlMoo802bRFe7FAXmMqtQQzPv6SiykGJzC/2oE/2AQnkNqzezKtiIzWpIkiB
         YT8tKJIyULhAMDgBaL4SjHN6aIcow3pRvlBgxV3ivFkqDyAYLBvWMszBhymdrVPPTO0J
         A5U4aDY2bCXA7G9h6wYUTgRGAdEG+YfpSjtizBwo6E7FfWS5KqbTV7383cDcoPjOj155
         6HzMge9MFcgouXM5rhiYJY3HrWKJsLTUmVYBNHkbmaErZkTm7iI2h5DoUraoGLMXYhHc
         OhQwHryiwL1J96JL1aT1H4vYj9H0Q+LCSOw+NLbUkZ2TbjW/OijXLdhgpKLYEVsi2V4T
         Xx4w==
X-Forwarded-Encrypted: i=1; AL+hErFE9MsrDb4lD1ZJ91KQxFp2aaXU1ACTI+KL3iOL2uXZFvUjcwPR7sTtsL6Xt7tkE1wDTESfxzjTKqmXRI5W@lists.linux.dev
X-Gm-Message-State: APuU4Z/zGUFGKO0PWcCtlO8aIH9gyGPIKqDic8NWnNgULqRA/jLjF4Hy
	ctPvc10J/j3NaKl3nWPNl6TKCV8fi0tstY7GveyiZwJmL0VOXdK6ycBG
X-Gm-Gg: AYBFou2xbhA073/kACY6zVj1J/mtXZ3L/U/yMVVtLZ4LtoxgVSxE1NaqUTttsjxFk6x
	j2BpUF1tJTHhkV8c5B3W6CxP82fhAX7DHqp0Zye/+3b1putFA3ZoUTmXv/E8o/TALq0GS1m5UbR
	7T4VuZGkUyL4EBIBQ6/3Ysd+zqrr9f4m9N3mLinlNoOwd/s/J5lS+oH6WS9KHrWf02p57jvpXXK
	n5xcDEpkDfbH5emi3KHM68U/aUEOQ0cMs8gGW/AXoutrbpbb/BghduqLyJAg7ASlOwMfbgy4Go2
	xI8V3vIij6t7/NW22A1gaby7/r7Gy5JKVDNHDIdceqS5g1jZicB39cA2zTZjl1WQzYTZTHtje4F
	FM7F/Ji05JWR9luX7Xd1sKA6Tf/PbCAlyOjDuMU+8Ovbq1FAw3zRHIRva90VpHP3XyqCaZIk66e
	BScl2ltPVVrufCIesqNLR/vhwxTFGw98jZ2WY027lZAIoJhAKBB0WuuE2AZVgK3GP7H0zAchv8s
	xd55wvXMrKLSC/SyviXikwAwyYqENqUN8TzoQbkVykcN+wZ/ckf6w0CduliCK3neUYvyoMyW+fE
	Apeino6erClT26joBwKC43nWAaDWiqGBlWCvcMtxd2gcWE/fnrQuCT3TeS68pkRqbq1b5OiWGQ=
	=
X-Received: by 2002:a05:701a:844c:20b0:19d:233:989d with SMTP id a92af1059eb24-1b5030ad3bdmr9029261c88.14.1794830837228;
        Mon, 16 Nov 2026 04:07:17 -0800 (PST)
Received: from X.tail7c3ebe.ts.net ([103.190.41.115])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50319d40asm32146157c88.11.2026.11.16.04.07.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 04:07:16 -0800 (PST)
From: Avishek Chaulagain <chaulagainavishek14@gmail.com>
To: Hans de Goede <hansg@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Avishek Chaulagain <chaulagainavishek14@gmail.com>
Subject: [PATCH 3/3] media: atomisp: Remove unused hmm_flush()
Date: Mon, 16 Nov 2026 12:06:58 +0000
Message-ID: <20261116120703.6681-3-chaulagainavishek14@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
References: <20261116120703.6681-1-chaulagainavishek14@gmail.com>
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Post: <mailto:linux-staging@lists.linux.dev>
List-Help: <mailto:linux-staging+help@lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
List-Owner: <mailto:linux-staging+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hmm_flush() has no callers anywhere in the tree. Remove the
unused function and its declaration.

Signed-off-by: Avishek Chaulagain <chaulagainavishek14@gmail.com>
---
 drivers/staging/media/atomisp/include/hmm/hmm.h | 1 -
 drivers/staging/media/atomisp/pci/hmm/hmm.c     | 5 -----
 2 files changed, 6 deletions(-)

diff --git a/drivers/staging/media/atomisp/include/hmm/hmm.h b/drivers/staging/media/atomisp/include/hmm/hmm.h
index a7aef27f5..545bb52c5 100644
--- a/drivers/staging/media/atomisp/include/hmm/hmm.h
+++ b/drivers/staging/media/atomisp/include/hmm/hmm.h
@@ -32,7 +32,6 @@ void hmm_free(ia_css_ptr ptr);
 int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes);
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes);
 int hmm_set(ia_css_ptr virt, int c, unsigned int bytes);
-int hmm_flush(ia_css_ptr virt, unsigned int bytes);
 
 /*
  * get kernel memory physical address from ISP virtual address.
diff --git a/drivers/staging/media/atomisp/pci/hmm/hmm.c b/drivers/staging/media/atomisp/pci/hmm/hmm.c
index f998b57f9..f9abb1618 100644
--- a/drivers/staging/media/atomisp/pci/hmm/hmm.c
+++ b/drivers/staging/media/atomisp/pci/hmm/hmm.c
@@ -263,11 +263,6 @@ int hmm_load(ia_css_ptr virt, void *data, unsigned int bytes)
 }
 
 /* Flush hmm data from the data cache */
-int hmm_flush(ia_css_ptr virt, unsigned int bytes)
-{
-	return load_and_flush(virt, NULL, bytes);
-}
-
 /* Write function in ISP memory management */
 int hmm_store(ia_css_ptr virt, const void *data, unsigned int bytes)
 {
-- 
2.43.0

