Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB7026E718
	for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 15:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278525; cv=none; b=Il4TRwDMqnoov/5ggvs0vhytvp9rY7vcaDFMFljKXNC1GaWfQByZ+mFnrSTpFjgVL3hrFHlsSejbCc6ri8OfOnSUpnXjkhQ5RAoYf3F1TTPqhRSSQQ5QWk5tYjjcPpVuVjQW3CA0xr4eeSJ28bPcFNR/D/cvr7aoUD1BuLtdp74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278525; c=relaxed/simple;
	bh=bm6h1ymG+y9mIW0+XaQyl43qmlFuAOVoQobAEeU+3/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlpnYEb+HBwN12Tt4SlxliAqLCW1LUPauuohWdsQvdO2eJyq1CSiEb87md0UGE+bpU0QEI2qJEYXfrCHzBEcxk5QN9HFndv8WJQ66UZTcjrCor46HqT7unWO3YOzBbcaLxITFGO3xQgGCP1zdfWTwdqVbBZEOGmVgLD8E727AkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cNLZ+KYY; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cNLZ+KYY"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-798374d0f44so73975457b3.0
        for <linux-staging@lists.linux.dev>; Mon, 23 Mar 2026 08:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278523; x=1774883323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ML7RXYz8MTP5Ouq8ahIDz2se+GkDBlr79uQrydoL5gI=;
        b=cNLZ+KYYxAwPRDBerP4eA2cZrolN89IeDwMAY9B9gj7wJybZzhU08fMfMRtYc6q2Ng
         VezWh67NsLbKORKQZgTGq0Y5pe3buX3ikVXKVoTdcJCDaAx+YokWo8WQRTP/6zbeU7tE
         5byFahXsR2K5f4lps/r3qPuzE6yT1kziNwrvnjlEFTG6YFFUt31soYva1ujWWu1vUL3t
         9JNYVgWiTCy7/eSvyfgBhY8dGNSbrlY3UYnnNdyY6Z41uk5ak7U9tYX1CpVfMYoKdo34
         6ZMHkLgiGMY4lvLjnV+Hag0DAgBb0up8TI74A/TjcZsWhzyO7EA2rFA/7nepbywhlPo4
         5GJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278523; x=1774883323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ML7RXYz8MTP5Ouq8ahIDz2se+GkDBlr79uQrydoL5gI=;
        b=i3bX/WyVWYEQVfZAi3W4yXStz6VU6PIiX1DARE0k3RKKAZXwP274B9Qv+7EPSzMnZn
         GDS+JQINjEwvHv3CB5L23Kz6ZsMsTGbAKbRxO6NBeRaZbndRvhmRKg4bpblt463ULbuy
         qBC3JvybjM7iE4f68Lj1bCHF/DVJpMaU6Mt0jCgdPrNRBkbFuBN15k/8moZcljkiPvQR
         oHGgPANTIp2y0vlL3muzQD5wZotr9bCjobJg+Df6R4gAHVxtA43WJGAQaMEzZTJSNw+b
         fNJo81NR0zW22GzTnJDcjx/p3NkIUTCvH4M1mtyhrMJ4qAkINtugJQTzh2xOVtinkVEq
         CIKQ==
X-Gm-Message-State: AOJu0YxRkjozcPXf64NUb0Nk3PCwMNbUhMlm0AtMZ0nyqVnaUhYEKumj
	CSOdHZTH6lizitqaGE/+iEWdXwjstDOcVj5QaiejYPkM4mOv30zf9wsdCRAx9g==
X-Gm-Gg: ATEYQzwzGGQADTJKn00nGpKL7qgiaAyahu88TGZ/qM7Xomeo9udHOu6RckDLbNIJ5o1
	Nxfhy5TmF+b4dBgYwTt6Zx40HsMi1vgfCAswNCC9MPCP252+p/tZJtOp9wFAqvWUbEV+N6areP0
	juHQ+R/2nhl56i6bNoK4NN7fMGQ4VW2iEb4mQSqAPJ2gLBwSMyqdG1W00crkrXWAgQ1PMY0xw9E
	Ut16gHUSZ4dfSYEsxltvFMOi0RPInLG+CND9I6wkujnTYRfbqizvi+B7V6cG+aF+pSE/2W5ILAS
	SRBdYWx/amq+Tbs6H65kvyy98OEraHZIxK2rOJ1rtfx2ucNdSQe6o39Bd+btwRhBhKiIbukhg5J
	di86QrGeXwKc/b25tdjRmhuJd4Le/50lcRCdrBJw5kjud/WuIBcJnYLl6CJ/f5dDWn2G7kVknyP
	cwf+ZHhyFdaNSkbuYi4vA9wQ==
X-Received: by 2002:a05:690c:6e85:b0:79a:4f03:b29f with SMTP id 00721157ae682-79a902b72demr129441497b3.4.1774278523035;
        Mon, 23 Mar 2026 08:08:43 -0700 (PDT)
Received: from archlinux ([93.186.98.153])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-79a90425d76sm58662227b3.22.2026.03.23.08.08.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 08:08:41 -0700 (PDT)
From: Nikolay Kulikov <nikolayof23@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	ethantidmore06@gmail.com,
	Nikolay Kulikov <nikolayof23@gmail.com>
Subject: [PATCH v2 3/6] staging: rtl8723bs: move logical operators to end of previous line
Date: Mon, 23 Mar 2026 18:06:05 +0300
Message-ID: <20260323150650.7168-4-nikolayof23@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260323150650.7168-1-nikolayof23@gmail.com>
References: <20260320122119.19563-1-nikolayof23@gmail.com>
 <20260323150650.7168-1-nikolayof23@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Change the position of logical operators '||' and remove unnecessary
curly braces around single expression to fix checkpatch.pl warnings.

Signed-off-by: Nikolay Kulikov <nikolayof23@gmail.com>
---
 drivers/staging/rtl8723bs/core/rtw_ioctl_set.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
index d92ec9949d00..eb4a32a998ae 100644
--- a/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
+++ b/drivers/staging/rtl8723bs/core/rtw_ioctl_set.c
@@ -11,12 +11,10 @@ u8 rtw_validate_bssid(u8 *bssid)
 {
 	u8 ret = true;
 
-	if (is_zero_mac_addr(bssid)
-		|| is_broadcast_mac_addr(bssid)
-		|| is_multicast_mac_addr(bssid)
-	) {
+	if (is_zero_mac_addr(bssid) ||
+	    is_broadcast_mac_addr(bssid) ||
+	    is_multicast_mac_addr(bssid))
 		ret = false;
-	}
 
 	return ret;
 }
-- 
2.53.0

