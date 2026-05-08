Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90ABC33F5B5
	for <linux-staging@lists.linux.dev>; Fri,  8 May 2026 06:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778220297; cv=none; b=q9tNbkxgo/kNC3pCzyOkX5kxpjC6pVq86PHvCWxvM5s/5bu/jkiaOa53oHxntUOsoVUfjijmd3/XU4LW3rhZ5KL5P1A8BnS640nVsQmaS+yi922CwUllBS6tEIhGz6ZBlJpuzac8eBkd/6FrS5S+Wj/IPX0cTlWsQAcsMJDRH3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778220297; c=relaxed/simple;
	bh=WdawcqtRufJdn+viBz053HgVIc7v1+tDKnQrSqXvdn0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BeujQqYZDv7Rfp7kpJuDfmWywGsub0rKYLfsgIIDNspkONGgMXsLfXrbtloVTjmVy7LtPxDkRFE03kPT5KSyka5jGzyxTHX9tt0JOnATMAaC/LPnGSjTb1BN6y5OE+I3gX+IhCXLf4dSEa/uj5PPm75ReLSBmfSBFi9u0IWuSU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fhaUlKC0; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fhaUlKC0"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488b0e1b870so24615585e9.2
        for <linux-staging@lists.linux.dev>; Thu, 07 May 2026 23:04:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778220287; x=1778825087; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+9hcU0ZIs7hC0U57OEfxpLn9BQjqwMVmzGy9PTWF1Ho=;
        b=fhaUlKC0w8JUQNCjxnTYn8Bu4CoASBaULrYDu0bdsDJ/KSRvGu7MW6si39ncOma24A
         mvH9UmagFqEdh0kGmRW/dQutwJ5WLGIGWTPa4LMpmsTbw+pca+qucHz73BhsYm2KOnYi
         NpU5Z94OtBAe5OS2hain4n1KrouvxrLuNdfLA+br1Ut1PlRomHGa3aBjxB4yyRHigwvS
         XNZhy9K1Mw1r4pyT1cc77Iut8FeWOd6Lc65+XY703Ggx/wqBS7Wom2VbgHKT1nc9N2qN
         daKJmN5A/flFdGzlZblAd2cca4rx7WsNol09LI03Q0SgfWa7F2Fv1uBdOvJBTpGagek2
         q26g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778220287; x=1778825087;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+9hcU0ZIs7hC0U57OEfxpLn9BQjqwMVmzGy9PTWF1Ho=;
        b=bQcaIOw6DGP9swgLPNQ+vESZX9gS9mpIZn5+LTQtSfr7l8LvWycEFoDlHzDyGZ929B
         xWU3inJhQ9CGpfpfqfU1kmGJ0789PGEm58FO3yrqHQLglJQ1+/w0g7OCJM0LFDHhmPiv
         UMk8pNM4VzgQz9BSpwr5mfcXn0q5jJStsG5fuCzG5I1X2nZnhdpoAmGb809BRN27WF+f
         4/UdVNOZLE+mDsy2XYGjtRHJxGoy0ZDVJWZpRIaPzU8mMjqH0xthESZXqhz7gjJqjS9s
         VNELwge+xTAEF7WUu1l6TmO1jEkKe3QvFtanikTxApS/BdOKlAclOL3xQJlJS4P4K8+f
         2H+g==
X-Forwarded-Encrypted: i=1; AFNElJ8lEEtnGF60IpFflZugiUZowIEiBsCY2psH5T/ckQkUTxFDuvUabOuK2dJiznxszioc2BsAIbR3pZ/Ap58y@lists.linux.dev
X-Gm-Message-State: AOJu0YxsqOckX4Icyfvho8cDtDGDcfet1KQ3kA9f9LhGGR7x1cj25c36
	9K5OzPkOtmAQ+le31aSYwzlDee+G7omjtpsyUf58HtGqS1wt7etvWiEc
X-Gm-Gg: AeBDiesqF8rqzE1e+pN3DMUJDY1qIAdMBfh4JGh2Gc1CXncPllAyXy5gxdTxI74VVgz
	GjO1pBwWnURq+XZAtzZiPqT8MvLwU+8QlbuD2yrY/BxcsQVHhgfTkgffk/bZfDaOEPBrTss1Swz
	xFmA3koF6Ft6sYLp1bHvxA8Aqc9+a8pRbGaAVfS8gWa5ULuTpRcV2uVIKpNASgKK1gMOYT0euuV
	OJWCCcMg03OKHghEPkHmats9tSXoRFZhWFe2DcbRmR0iD8bppqYxUOhHZA2zh3hbFlHZY7vdRgs
	wUV3y4uwj9c3Grng9Z3tdg0SpPuVh+8D/eFhb072pzflw1VeDRHPtPLc6YTBC/HuJVaiaH8VPhl
	nO7tDyfxt32AhIx0S9of1pUW9oFIH7E9kAhwJ8BhgotOkoRvHpVsW2lWYgVE4WK8FfmBbUmCwHm
	omSzdjwrWjrtPnwWIP3w1pnCg9tg==
X-Received: by 2002:a05:600c:47d3:b0:48d:c0a:3813 with SMTP id 5b1f17b1804b1-48e51e0bb62mr110549455e9.3.1778220286265;
        Thu, 07 May 2026 23:04:46 -0700 (PDT)
Received: from House.. ([182.180.27.77])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e68ed0f4csm25615455e9.3.2026.05.07.23.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:04:45 -0700 (PDT)
From: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
To: parthiban.veerasooran@microchip.com,
	christian.gromm@microchip.com
Cc: gregkh@linuxfoundation.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
Subject: [PATCH] staging: most: net: replace pr_err with netdev_err
Date: Fri,  8 May 2026 11:04:38 +0500
Message-Id: <20260508060438.20156-1-mahamaryamjavaid@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace remaining pr_err() calls with netdev_err() where a net device
is available to provide better context in error messages.

Lines in skb_to_mep() are left as pr_err() since no net device
context is available there.

Signed-off-by: Maha Maryam Javaid <mahamaryamjavaid@gmail.com>
---
 drivers/staging/most/net/net.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/most/net/net.c b/drivers/staging/most/net/net.c
index fc1dcff107ec..b481d053f826 100644
--- a/drivers/staging/most/net/net.c
+++ b/drivers/staging/most/net/net.c
@@ -339,13 +339,13 @@ static int comp_probe_channel(struct most_interface *iface, int channel_idx,
 	} else {
 		ch = ccfg->direction == MOST_CH_TX ? &nd->tx : &nd->rx;
 		if (ch->linked) {
-			pr_err("direction is allocated\n");
+			netdev_err(nd->dev, "direction is allocated\n");
 			ret = -EINVAL;
 			goto unlock;
 		}
 
 		if (register_netdev(nd->dev)) {
-			pr_err("register_netdev() failed\n");
+			netdev_err(nd->dev, "register_netdev() failed\n");
 			ret = -EINVAL;
 			goto unlock;
 		}
@@ -464,7 +464,7 @@ static int comp_rx_data(struct mbo *mbo)
 
 	if (!skb) {
 		dev->stats.rx_dropped++;
-		pr_err_once("drop packet: no memory for skb\n");
+		netdev_err_once(dev, "drop packet: no memory for skb\n");
 		goto out;
 	}
 
-- 
2.34.1

