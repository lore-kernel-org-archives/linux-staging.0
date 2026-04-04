Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4353C23FC5A
	for <linux-staging@lists.linux.dev>; Sat,  4 Apr 2026 01:00:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775264414; cv=none; b=g3xtyfEZa9xn0J5cl/jtQSpP8nHZfMVzgOiKhIe2KGMtMXpOX02r7RD98yO0ZpjzXWFcGseSSJXkOnbelhsv8NR+FX95c8YjFehtvCdq82VsE1J/92eGNS3jYEPEJ5a23nRSnbbpQhtPYcOS0N14lpUJMq94kl+9Ena7NSAomAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775264414; c=relaxed/simple;
	bh=+1B2IaSJvBnaKGUHHDOefMT+/CFxLK2yIa45yglAQWo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZcv6JhsRNQDuAB30X1vJlNlTD7aMXM9Av4NU3mipxxbWB0NacO4U49tOuZGeqB41AZuiWYKshRo7gChcY3x6w4hpG5/97tneyk51D3Onkw1ECT4ojZXnv+/Qf22fty+AceNdVO3jnqPdUojksw7RBPawDoFMaLdiLu4UewsJYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BvKGbVeC; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BvKGbVeC"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82748257f5fso2081119b3a.1
        for <linux-staging@lists.linux.dev>; Fri, 03 Apr 2026 18:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775264413; x=1775869213; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SkSU+fXNvPT4U2WmgiIqiveMqmapuCBrs2GeWelNwHg=;
        b=BvKGbVeCdV52HbfJzKFNprPkieKpWfN7ux/iLTDW9RYsZ/SBORKjEJgc2xGLuKAH26
         lKbItg7MbfdS61bdb/TPQQuZUf/pSfyHG9lvCohBsXzwkmKAvKV6lP2Y1Mgd6J8/Fhcf
         8ONov6blJ+pG01jIRJs7CIDd7o1nJ2sC/NhSCeot2DrKGiIn4h3dAobrTPXXpHvQnIcJ
         oExfeZSL/m8Ym2Zm6PEmdxAJ/tYrC+sFHCzfIyXj5aBzqTb2sPvCmCX13O1h6+gk9M8D
         41XCIEzV/PuoFxHo97hG7/33quyA1nSlEPhnZWD7IBKi3BT5kcvMviC3EHijFYOPrpEd
         tgSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775264413; x=1775869213;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SkSU+fXNvPT4U2WmgiIqiveMqmapuCBrs2GeWelNwHg=;
        b=rZuJupbP0m54JuSctrF795rY0kfWLbrGRe3Kv4rT1SMlxTdSqT4RufYOvI2uhvGuOO
         SZO538iTEqAb3MZl5SPhSBzaZnLtsp2MI7U9+g0W613MUAA/V4VoCDM29cp/xQxA/FIp
         mAlKBkZ455iEQQn7WKK0pCXamwmWwF/VmBAOrsXCLlUtwJ2zZEM0OS4GEe2LCYihclE6
         ZiMsvd/6Ub3kIc/np0BmBM9JuIpTHmJujesg8XC8C7LGP+u2AF04Nlzmbl/Zm88lj3Nq
         9Lt4DQHy0Ok6oiNalXdBRTcHfQIQc7ZoGAEunuf4l2h5C1w9rMgeblmijLFZmWqB+4A6
         1QuA==
X-Forwarded-Encrypted: i=1; AJvYcCWdpfWoWgfFqT2qutDgy1oJ3MU9VfGD0cYF+yxXPPlaBsVd68eM+48Ub9uEMu8+ZKWvZ52yM8oD6FdGG18A@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7+0TO7jfT7sDK1/0eJKOiepOeLH5nj3WpruCw4rMQ9kuR3o6i
	w6ZJuFpztk1ez7dJhyVe43twKB3+4DiCtReXJ7TOezQ1O15eteKBTMtL
X-Gm-Gg: AeBDiet5vANXDyfHTAFSF4H//6I+kLyHdESCA2JpfyWQW6wUivYRhGIGH0cFQW3Dpmc
	ysvZsi8ctwCAA7CeGmqC+nOPNXoYWRsi/oeAL5eQthAby3g6V/CP5UXtuQuAREMTVP8vW3HCyOp
	5s+iW/qXK//XwVD1cc/3oN9oVLYEEaFK0YnzJOLHzIvue/za+R8hETu7q9PDbsDwjMIjsjFzgZC
	WGQjuxFNH4wHOEZAkJA21AeQEXgwu197PPFY3skcU8VGKbn1tYChQrJDRbkOC20Sn5H00egMkx1
	hdwEi+eQs/UCVYwf4i7NGEwzyuo3neaa8lbvcC9yj0muIB+DFgEIWzOtis71zZKbfBTUwC9iI3r
	0yBuRyitkseUlebGexvXWXcpKmSkb9KSIQws5bAGVvx62B+xnnp9Ad4DzDS3zxFCCvtMOml7S5p
	h6aCNb4nERIis7ILSre3FF1oAN2z2onkf+TxBAI4lTnkat4F83oyZZnUJkh1LUCMUK
X-Received: by 2002:a05:6a00:2d88:b0:81f:4e1c:1d3b with SMTP id d2e1a72fcca58-82d0dd043bcmr3841580b3a.23.1775264412522;
        Fri, 03 Apr 2026 18:00:12 -0700 (PDT)
Received: from koskos-Default-string.tail0f993c.ts.net ([2409:11:3cc0:3700:7de6:bf03:20c5:a0a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b3aaeesm7565306b3a.13.2026.04.03.18.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 18:00:11 -0700 (PDT)
From: Kosugi Souta <k.souta0926@gmail.com>
To: gregkh@linuxfoundation.org,
	johan@kernel.org,
	elder@kernel.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	k.souta0926@gmail.com
Subject: [PATCH v3 2/2] staging: greybus: fix alignment to match open parenthesis
Date: Sat,  4 Apr 2026 09:59:38 +0900
Message-ID: <20260404005939.116701-3-k.souta0926@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260404005939.116701-1-k.souta0926@gmail.com>
References: <2026033032-rethink-jogging-f3b0@gregkh>
 <20260404005939.116701-1-k.souta0926@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the checkpatch.pl check "Alignment should match open parenthesis"
by adjusting the indentation in authenticate.c.

Signed-off-by: Kosugi Souta <k.souta0926@gmail.com>
---
 drivers/staging/greybus/Documentation/firmware/authenticate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/greybus/Documentation/firmware/authenticate.c b/drivers/staging/greybus/Documentation/firmware/authenticate.c
index 0ef88b7d24de02..ba4b16b0455717 100644
--- a/drivers/staging/greybus/Documentation/firmware/authenticate.c
+++ b/drivers/staging/greybus/Documentation/firmware/authenticate.c
@@ -85,7 +85,7 @@ int main(int argc, char *argv[])
 	}
 
 	printf("Authenticated, result (%02x), sig-size (%02x)\n",
-		authenticate.result_code, authenticate.signature_size);
+	       authenticate.result_code, authenticate.signature_size);
 
 close_fd:
 	close(fd);
-- 
2.43.0

