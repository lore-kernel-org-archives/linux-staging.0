Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792514236;
	b=NpghWldqk6MySO6AeLaxzfugsJZ4go1NctCEhjzZ1a706ucy4p3ZAv7NAc8Zym5XQ3Ns
	 Jc+CRKyiXjis93bcfH4HUb7X1MY3WK7CvduFCwvLZYnfId4vKB0E1anm4CmmHcvpvl/Ja
	 BjdwZ6GcSsbi2Ds78GB65SMO3a2UI+0eodPRuperlzbl5cAps43o/7ZATu1UoOdsZBxtS
	 k/SlfUBv3VS/WjyEQhAfKTejmLGN5jebP1Sik1NxmhoXi3wJqnrxMggs++tng4DF3d2Qc
	 bQzWh0TCLznkpi3wcX0tj+mOg1FUL1COXLciFIQQ4NE/RIk0NfNiWJwfzaw0A/E13Ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792514236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
	b=qNzr4BQTyKeEeG7j/aa88UwWlOLITyp7LDqea6UGZbJZqH/sMdPKIqEQoaeJXylQOTJX
	 ALKoF92faOtgpideSgG64CG5LT3Bs3oN3QT+cSxXNqs3M3HZO6ROJQgXTUDmw5/7vos8h
	 wGZXYheaBgt/GRGx2ZBB0zdriCyuw7JL3QzSP8iCL/Gk4pXTlG/3aoldQFoYrrnvnuhpK
	 +iP4QI5j92K5MUW14HYTEdfEWm6IiYDbrQUPhVoHSpxpojcRLGu0SApeEFR1Dem3diqn0
	 G28wdS52b0kRzzNxBy5Rnf57fc820z5XS4L/PVlwy+u519HVD7fVTaeJSq+TjlF6x6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pkc9O+RY;
	arc=none smtp.remote-ip=209.85.221.43
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E19A60A3835
	for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 16:37:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E19A60A3835
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Pkc9O+RY
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-487049569b6so1948705f8f.1
        for <linux-staging@lists.linux.dev>; Tue, 20 Oct 2026 09:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792514234; x=1793119034; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
        b=Pkc9O+RYQtKNU/j641vzYuzhLdhDYesLEqjuCUeuVZyZmI5AprpLQzZb+ckGof9JH/
         pfU7pKl9+ceNOwAXLTE/st4NULTu20lsLzYix4/ZxT9KqUqLFLDC0wMsXpwLMG2X7dIC
         oiiPYEzXW8LakuZni4pc7UPwpVYYV378IXNJfiuryNtz4FvaYOsWnUvz/pq5/xsO2uIb
         IIQAo9wvTTJYSHnaLrEa4siKXXt+Rc+FG7DJZPnX7EhpNsLWIXxoEJh1SZbXPAJ8dBDP
         J9qk4RMkizcuKBrdsO/2gPbGYnm7CfvCUylG63rNC4MQIDFrIVLInQuBQN/HBOlyjdA8
         y9kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792514234; x=1793119034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rDJB4+RNQq+2GGn7bCoZbRLSivKXqiepj5wyQ8N3btg=;
        b=WG+7xgwNGjmLKMST5Ia53NB9NkzFG8sqvWIy0DjZCDKyYslbLLO8VAY7zqxbMJZnNE
         wl0k7bMggTNHOwKPFjBAZdtoC8cKalgwzdWpoWMhXkyil7jKLtpbbf1nBG5hyKlVFmK+
         lvpoZKfzG+EfqYq8JiFQcYVDaNJIDHTE1ucVoMGHLDuynriPovz6VzpftZOKhbfsDVGm
         v5dTIquCOtlO3nY/zrgLL9JbxQc7xo30SElpKmiAkMCzj62cdcdTcy8//sUkUwcTe9e2
         oZobKlU1wsTd26158TUvrw1I0ga5T4KO/2h/3P80ZRue7m95w32aFstIYJUEKzQA+r1G
         YCTg==
X-Forwarded-Encrypted: i=1; AKwUvBxpIE/RVeYr0c9AvQ9cwiKGvhJxxwUlg8MS9nGLB5VY5vo1QsJomuaaotkPHBTcMJlDBrM17V5kpXbh6YUp@lists.linux.dev
X-Gm-Message-State: AFq9FYKADT0r1HZWoc3SIfwjcQacaj2vT/YDFf3XhKFUsgzz46IqE4KN
	TkedW+i+54XJGkBy228zMLlOzpzNqSVpACFZzPVlz06/uxojxC/OtFuW
X-Gm-Gg: AYBFou2BkcWpkSDCfZRtGy4XZljOz28RXEC/KYm0LggK72u0NL+7MgxWP4JNwmcUxCB
	voyxAAFosj1H3kJQo3MPXMVSZsJQfZrOYg9fVF2cIIVN33bVVxm0tznDA2Y25NjNkoLYAJqWz1N
	Ox6PElCyhY1DveljM/G5RPISbXB9I7qyZcmk0DF0qojr9biFDogg1KmuD1x+Dq36y2CIuoLgLvg
	zNpIcXr9Kvf7Qij9kdf+zovmdJxEnxJO84ex23zTt+62G6ZgftehF19iZVrG2KeIJ21e4hkSm/M
	A5o8cJzgEKTlIdFVEOUfDwWiHBb71kBTq/R6/bKRrG3RFgwoRkqmcpYN8VXDEs/sOXpxT4KvA1l
	3otugDJwZQ80FRtp/LnddFkEyEig3YR4h0tFJyzufeUwcgEWl+ZQ/nOOVEuxWkTpezbYAHN36ot
	IUOd71kMxDkQBCe7IP69JFIAl+6ZZiI+kMUvCKVRaAh+EZMTl/fBbE/ixOB36YcVtUty4KEffr8
	tNi9NIV9NLL7cj6IMvfp5GAL1KDbicaFNQ=
X-Received: by 2002:a05:6000:29cd:b0:48d:ff71:dd8e with SMTP id ffacd0b85a97d-48e079800c8mr15957718f8f.3.1792514234297;
        Tue, 20 Oct 2026 09:37:14 -0700 (PDT)
Received: from Ubuntu-vm ([39.62.145.176])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e1d6db78csm7471967f8f.2.2026.10.20.09.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 09:37:13 -0700 (PDT)
From: Haasham Khan <haasham93@gmail.com>
To: pure.logic@nexus-software.ie,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Haasham Khan <haasham93@gmail.com>
Subject: [PATCH v2] staging: greybus: remove unnecessary goto
Date: Tue, 20 Oct 2026 16:36:36 +0000
Message-ID: <20261020163636.7629-1-haasham93@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Remove the conditional jump to gb_error, as both success and error
paths proceed to free the request and return the result.

This simplifies the control flow without changing the function's
behavior.

Signed-off-by: Haasham Khan <haasham93@gmail.com>
---
 drivers/staging/greybus/loopback.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index efc69c10cffe..284935fded12 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -609,10 +609,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
 	kfree(request);
 	return retval;
 }
-- 
2.53.0

