Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C120CF9C7
	for <linux-staging@lists.linux.dev>; Thu, 26 Oct 2023 05:43:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AtiYYnzy"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-523029050d0so133727a12.0
        for <linux-staging@lists.linux.dev>; Wed, 25 Oct 2023 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698299021; x=1698903821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PxIUWq0JvE8ZN9IeEN1TvTq6KPJTuoCETYsX6YOkfb8=;
        b=AtiYYnzyLH4VCZrmF9G9rG8SMvyvBKVG6QfDhXqGZQCJkdfbD2yUhUMZQGQSpwL9Wx
         B/idiUnOznqlKsw3JvXFPxnzRAhQFPQtLEMpddzcHsVT/fcxN3HSH6RQzARJXa7+nDFk
         3pl3sGhm260ibG4ukoW5j+i5S7EdiBF1wWoJSM67iufAIROVvihCen71vYJ3BPfS7EVh
         uGRVYaUWEpFkBAbLwXrEkvXn9Wj6ucD6LlorO9qWAeu54KbdSiWF7O8UbVFqp6EHoXpd
         bFJ0Du94KKOZCtG1sqtoswDmDuyjxAPZjfKsXNCHxZx+entcATTHTfeZz5F1DmE9HZ/5
         2gBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698299021; x=1698903821;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxIUWq0JvE8ZN9IeEN1TvTq6KPJTuoCETYsX6YOkfb8=;
        b=dPW7f19I8gcPe3YdfVi9nq+8bxYrhuiJw8Lnnd/8vzIfSCezvAhCuBFgID8IRr0pFY
         84+wdDpO+KJAK0NW0sScp1WCoWbxh5dqeVeG/FxTw2xEzrjkt84CmhjpICyIFOvA94Y6
         hCCbHiwjevAfLxM3O1L94N7kNB/nw1BvhZFAyyYu7zKSiApRKnTrGXizJQron9zoeh7J
         uy9/4syLaeBuuFCE/YGSgn3BJ/A8oyMj9O+B3xgMxjsFZ8gVYQzbP1ZLAVyU5DjnryWx
         wrvxVkDwCnHltyhMjdmmX4GEuK2Yp9g3YwNP2NjmHhMkvyeS3EaBuxqzUhbZU/5FKdIZ
         He/w==
X-Gm-Message-State: AOJu0YzxTA6r85rJEaZmZZRBKAy/pfJwwqRwKLxeTi5fmUFBeVWN3jW1
	ZOJtB/6Gic/8BW+t2Zuma+9tDa/3f5Y=
X-Google-Smtp-Source: AGHT+IEXiEKKpAMjTDrlioaK4ZFLi8ap0p6z3kKOWh0+t/48Y6ZojiTkv9gIaBG6ovvw9JNrx1vQGw==
X-Received: by 2002:a50:d4de:0:b0:52f:bedf:8ef1 with SMTP id e30-20020a50d4de000000b0052fbedf8ef1mr12268337edj.3.1698299020782;
        Wed, 25 Oct 2023 22:43:40 -0700 (PDT)
Received: from matrix-ESPRIMO-P710 (p579356c7.dip0.t-ipconnect.de. [87.147.86.199])
        by smtp.gmail.com with ESMTPSA id q20-20020a056402033400b0053dd8898f75sm10495724edw.81.2023.10.25.22.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Oct 2023 22:43:40 -0700 (PDT)
Date: Thu, 26 Oct 2023 07:43:39 +0200
From: Philipp Hortmann <philipp.g.hortmann@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: [PATCH 02/10] staging: rtl8192e: Remove HTIOTActIsDisableMCS15()
Message-ID: <004b43b098f14f82e9614578ea9f04ca95b48b4c.1698295861.git.philipp.g.hortmann@gmail.com>
References: <cover.1698295861.git.philipp.g.hortmann@gmail.com>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698295861.git.philipp.g.hortmann@gmail.com>

Remove HTIOTActIsDisableMCS15() as it always returns false which leads to
one evaluation that is always false. Remove dead code.

Signed-off-by: Philipp Hortmann <philipp.g.hortmann@gmail.com>
---
 drivers/staging/rtl8192e/rtl819x_HTProc.c | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/drivers/staging/rtl8192e/rtl819x_HTProc.c b/drivers/staging/rtl8192e/rtl819x_HTProc.c
index 18659408bb69..ea01cfce77d8 100644
--- a/drivers/staging/rtl8192e/rtl819x_HTProc.c
+++ b/drivers/staging/rtl8192e/rtl819x_HTProc.c
@@ -207,11 +207,6 @@ static void HTIOTPeerDetermine(struct rtllib_device *ieee)
 	netdev_dbg(ieee->dev, "IOTPEER: %x\n", ht_info->IOTPeer);
 }
 
-static bool HTIOTActIsDisableMCS15(struct rtllib_device *ieee)
-{
-	return false;
-}
-
 static bool HTIOTActIsDisableMCSTwoSpatialStream(struct rtllib_device *ieee)
 {
 	return false;
@@ -691,10 +686,6 @@ void HTResetSelfAndSavePeerSetting(struct rtllib_device *ieee,
 		HTIOTPeerDetermine(ieee);
 
 		ht_info->iot_action = 0;
-		bIOTAction = HTIOTActIsDisableMCS15(ieee);
-		if (bIOTAction)
-			ht_info->iot_action |= HT_IOT_ACT_DISABLE_MCS15;
-
 		bIOTAction = HTIOTActIsDisableMCSTwoSpatialStream(ieee);
 		if (bIOTAction)
 			ht_info->iot_action |= HT_IOT_ACT_DISABLE_ALL_2SS;
-- 
2.42.0

