Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F6B220A5CB
	for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 12:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739363209; cv=none; b=VB61JfxsnRyGo7ag7pkReSZZ45q4YlRZM69kCQiQvZmJAuOkY+TYYyoitFOr6D/320H9E2tiwaArHgemLJ9pMJwHRCi/RIRRDls/5Dx3r7xt9/9wnXHTKD163G+tOwEfL1kiWDy48I8IWaGBgoyFzJzSde5ny+lfzvgCpsUWr9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739363209; c=relaxed/simple;
	bh=/5vDf73OeCA0N4T/7EoMUxHAuvnWQcA5e32GrqPx1nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ofaWWxvIxGpiSH5AawjKczZjoEybu+pECUWN9iAd0uzJ7rAo28ug88mlZKMLfeuBoNo24fgx5u557ZmSq2tjBVf2RW1iYOY7zVNG8riEAuof/N+9cKfwjy48ul62TIOY9EV86JVVHBegyFk5uixPyK0WGwOXV1+3D52UTDGJjTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KASv3Uvj; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KASv3Uvj"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4395dddb07dso3081005e9.2
        for <linux-staging@lists.linux.dev>; Wed, 12 Feb 2025 04:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739363206; x=1739968006; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sCu6b3woM+c5soUL+CL/3/8vzh19NcMbxFpr4cPyY0w=;
        b=KASv3UvjglffJMLQuy6Etq0kve6dgZA28uFO4Lp/s/ZzuUwu4I1xIPLoiZ1pgWo1mY
         mm4g0WxCmrZkqgf1wQ9+q9AgiyC3Vh5lOMSz4TRaUJO9jO4TyatOqIutC14IhfFLv/7Y
         nX3ZQx4SQLv4/GKXSN0Q45CijPhl7UtXSHntEJ51dXP1CFSblMPKdoB5RsKh+OWS8oPg
         kmAjE+ZPRXPyZQ7NBBQ/wnZWY7V19qOg/urkka46egdNm2orKJ94AafUhkDug/KM99b2
         60AcEIOts4Y7J3UlpZIBgxGJnfQeH5eVn8fFR87KGl/7nR1ideC4oFOPFqUV1lEx3OmT
         QEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739363206; x=1739968006;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sCu6b3woM+c5soUL+CL/3/8vzh19NcMbxFpr4cPyY0w=;
        b=DGWsg8iV1JvKhmAbUljL9AIVZBmjq64aGULpWKTUs9YDM8hW/v4k0H+kupStEPOZgM
         97oa20ceWF8mEUAOHkxnw+3Fc3y222BmHoQwb9i6RJ+3/X/ArfiyBLDlnbrebHQ3R1Yr
         SrsActRcneSBx/egDjGriQaEryku4LRXO3A0om2G6dASFiNDQjuq86oDDbazYYWTmLOf
         v8dn4ncvc4T9wYgEQ3mwlbfdtmhlaXuir87yl4Gsm/YbBQ73qk365Dq4IJRaKInGsoZn
         d7NUaX4PLMGKI96uH0IDlV/gRqh1vL+/so3N+8dyO3T1d5u9tFMX09coM77KY6/jVSpd
         cg0g==
X-Forwarded-Encrypted: i=1; AJvYcCX8WgNY5j7VCLtUhDxb0F/CoVBUbYPjAWLi0TJDRzZv5c5IzFrLz8OWPuFHiXk7n/rol3sVqvzjPTtmoqqP@lists.linux.dev
X-Gm-Message-State: AOJu0YzTGms9rADb5JT4HQ+ChaJLwWzAeeO5UISJcCbz0bTwiFZX0HcL
	+r00PSjTWRkafh7njgPFWYm+sqZ2j8DYczIiZx9adkPX7uUKmsN6
X-Gm-Gg: ASbGncvU6gduliQRHQ9dZzOGnrUJEQFPQ5rWTAtN/XUxwpIJszP7OArGK91S6WgIWHX
	84/cawbR7DObKqrWmPRh3kTfGzen3OH/8QtO1yEqfFZpCvDsT35dLY2IWZBMPmcLcKY11ySDble
	rioU5bAT6r89kD3WZ8ObLyFlwEzlq+4ma+u+tD4KhQaQrlMHZtxhlT6qWnclFMSIUJht/KLQ5nx
	H2ptxReZqdnK8+XY+4EE9MiW/cdVf5OS6Ok/krwhKwujQQODRqy0nmuwcsX9ESbBVuAoy8z0gkv
	vVDSWlN/dTQcfR9P
X-Google-Smtp-Source: AGHT+IGmFNu24b1qS0VJTdN4xDOY35KObKCCcjvjGWIaPEwKxZczxmHjIMyVZoSknTa53QLxoZt9IQ==
X-Received: by 2002:a05:600c:8706:b0:439:55a8:c61f with SMTP id 5b1f17b1804b1-439581ca4f1mr32824285e9.30.1739363206063;
        Wed, 12 Feb 2025 04:26:46 -0800 (PST)
Received: from localhost ([194.120.133.72])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4395a06d22csm18674495e9.22.2025.02.12.04.26.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Feb 2025 04:26:45 -0800 (PST)
From: Colin Ian King <colin.i.king@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] staging: gpib: Fix spelling mistake "sucesfully" -> "successfully"
Date: Wed, 12 Feb 2025 12:26:18 +0000
Message-ID: <20250212122618.495963-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

There is a spelling mistake in a TTY_LOG message. Fix it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..1c3e5dfcc9ec 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -542,7 +542,7 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		return -EIO;
 
 	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
 	return 0;
 }
 
-- 
2.47.2

