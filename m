Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E5E31E1A3F
	for <linux-staging@lists.linux.dev>; Thu, 17 Apr 2025 00:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744849982; cv=none; b=bHOY0srGGN8bZGzI7lVvMYsf7iKmP1mhos/XojkAGrKYz4EeMXcbHVcOhKIhJNsC6m7DtjCHHz3XG9DWrSEuY0D1uVjJo2vQ4b8uB/+YFLSdCfEMpy3Q0yRx43CwnYwnj0zFvb2BTBiXlAvEaxYg2Zxia1N0zNPtab2UJge7xjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744849982; c=relaxed/simple;
	bh=sm89KN7M+N+cjb4kBf0tDv/avTft4wb53ORjh52ocFY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nzODEJleV5kb5kYbOjvP6xtaxbBUKYLzmANairKFDqsmva0S5w1IF+P0ynJJQqzjOXv0nSvkdcBYoxintFd73sGur7NOwbVvEBRBYQpY28qE+DEBEvZ1KHZe2QU3HATBNf2k1aSynIkMpPD7gTyyKy051QgWKUrp7ZFhnCmJwlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org; spf=pass smtp.mailfrom=neverthere.org; dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b=g6ucjl0+; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=neverthere.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=neverthere.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=neverthere.org header.i=@neverthere.org header.b="g6ucjl0+"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-22622ddcc35so3477615ad.2
        for <linux-staging@lists.linux.dev>; Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=neverthere.org; s=google; t=1744849980; x=1745454780; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=g6ucjl0+zT7C55Hr6tg9i6j0Rwn9k7cfEp1WoG/MVOzRkGeEtGExaKxeCBx7ZOqaon
         o7XVFqEpnx8Dc9xMZmryfpTolq0T3ZFOUrDdpS9lnnOCStU6YFDTsdGa8+ljXVjDRWPv
         SCe0NyGk6lFUWjk0VE+gM3fHKZQvdSXR3HAbLWizWi0+IykeGl1bTliSR8lbdMnvzr2t
         RRZdok0t2rCnH1nqxEUXc67XP0DVRuNXxPM5SOVs2qHRs4FoX0V1TYi5vTOkSZsfqAnB
         qL5wST6WT9PadO8S4+4kjcqcpjZfumHDkKmHgMPuI7Y3Q/5aBIo8iycAudRqv6XFCKQe
         5yvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744849980; x=1745454780;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Vov0toR1t8IP8gbJNzk0Bz9HIkssufBqsXHpZDgzbTg=;
        b=H94sZRAVk/Hi6OhW5boQfb6VTZLepqeYN+nZw4JZYYTMK3UFxEXPplU2fZM3ud6czq
         Hyd6t78+Jp55f7DE7aODcJILTz7LbwS+9QGmPuRfkp9vJi3TINAtbvNeiraPCJJaviik
         4cKlFYuNKWssDf2Tricvbt+1w1dhX1vY1yXEh1EnSWUM4C40hwjmGPvhWl1ZNh0dkVad
         7bKtyDtz/bL936LtfV5tabMYwsH8dG/PcZmM6mJvDS4BKKJ+GtgZ5v4n3ij1EhWj6x2N
         2FYT8IXslkrgNTAzsSPQlSP5dNA4VlQ2wiEhJIBwN/dn6NdFAk+Pnlo1VRqm/ORG2pJJ
         44Pg==
X-Gm-Message-State: AOJu0YxhibSYKcZeBNIyONJ9zEUU+VF1rl+Nt47btv/Bkx+ePJJ4KBG/
	2Kg+PzytAPr8aN3q4pysRRKb2gkXpPDRdGZX9cVIRi6qBdVQpxqpGEFmRYnR5w==
X-Gm-Gg: ASbGncuEqOZZEXLELd6BF6ASfj3T+GnwaDDnTLflk6InmLo4R8eptoQtUyBTDCkit+G
	IeLXQqmVHueCWfuAmSjzuWBLwwV15DY56I3Uns6bQy8AjRKYtb00x1OlMGOz58766Dt5d7ocPJa
	WSeK7vuPpYfnhitN6cG0AaUv94NHLeujx7U9yoYq1IpJvQlRK+U4oxa68lf3c9oG+hrV5RU+KKs
	JX4EiUnZ+tmJ0pMOvRovdSx73cNS5gmINTyxfEI7Mdmr6D4OnyDpYbtrMjz6q7B0RgnamkcJB+U
	5PaiyXRT09k6ljKs/Dqmz4dGOvj25HrJ4rrGm95hjZdWowZyRfb6xv7zWohcuStnrJCZ6+Wofah
	64p7eYw==
X-Google-Smtp-Source: AGHT+IHkdp8wFb8X5ghxYt1BgBUGd+xhpS4xA2g6f4odxtiLr8qfFM+odDvBRmuWhMfWb6VoY3cBNg==
X-Received: by 2002:a17:903:41cd:b0:220:d078:eb33 with SMTP id d9443c01a7336-22c3596f812mr53036595ad.36.1744849980355;
        Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
Received: from tiamat (c-69-181-214-135.hsd1.ca.comcast.net. [69.181.214.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fe8dd2sm20829485ad.246.2025.04.16.17.32.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 17:33:00 -0700 (PDT)
From: Michael Rubin <matchstick@neverthere.org>
To: gregkh@linuxfoundation.org,
	dpenkler@gmail.com,
	dan.carpenter@linaro.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Michael Rubin <matchstick@neverthere.org>
Subject: [PATCH v3 10/18] staging: gpib: hp_82335: struct gpib_interface
Date: Thu, 17 Apr 2025 00:32:38 +0000
Message-ID: <20250417003246.84445-11-matchstick@neverthere.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417003246.84445-1-matchstick@neverthere.org>
References: <20250417003246.84445-1-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using Linux code style for struct gpib_interface.

Adhering to Linux code style.

Reported by checkpatch.pl

In general, a pointer, or a struct that has elements that can reasonably be
directly accessed should never be a typedef.

Signed-off-by: Michael Rubin <matchstick@neverthere.org>
---
 drivers/staging/gpib/hp_82335/hp82335.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/hp_82335/hp82335.c b/drivers/staging/gpib/hp_82335/hp82335.c
index 319b7f6e35ec..7f14ecb46026 100644
--- a/drivers/staging/gpib/hp_82335/hp82335.c
+++ b/drivers/staging/gpib/hp_82335/hp82335.c
@@ -180,7 +180,7 @@ static void hp82335_return_to_local(struct gpib_board *board)
 	tms9914_return_to_local(board, &priv->tms9914_priv);
 }
 
-static gpib_interface_t hp82335_interface = {
+static struct gpib_interface hp82335_interface = {
 	.name = "hp82335",
 	.attach = hp82335_attach,
 	.detach = hp82335_detach,
-- 
2.43.0

