Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FA3111A1;
	Fri, 13 Oct 2023 10:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTQ6iW69"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-40651a726acso19726765e9.1;
        Fri, 13 Oct 2023 03:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697194226; x=1697799026; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IzdTvuk9Hpz7O7qnXQ4bc4hZomimkE/Cg90sCGqX5lA=;
        b=nTQ6iW69kqgdHClRZoFuJGFg/fQeHGVxEcZRVYLpmtaRGKVodfKqJSAkWsSnNMJ1Ak
         whKGFcZL1vPHN7UDYMvOw5HfpywHQ2iigDWuplr5a1FhkF94rhlFbNSYk2nhN8KhcS4n
         qOOUiHBBjGWLQpmpFboUiY+2cQ8ktyOuo+NynRCUa49rvsRP8ZENV7N8WOsEGQZYcSxK
         G3vTrEU39ZZ9Wk7PDRL58e5wxbW1omwGAAaPfb4AkY0Yj9siwoMcAwLEcjW0csAv4Z9t
         ABr8cUU2op5l8nNzT32pd5xGn/j5uoqFefKTcIKnVOQWgOslFBJKr91LWnZp+2t4z4Qn
         mInA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697194226; x=1697799026;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IzdTvuk9Hpz7O7qnXQ4bc4hZomimkE/Cg90sCGqX5lA=;
        b=r3Qiat+TKsDoEW4/TJ3wxXItQq3DaE+qSp6Pk/vaiHJyqiPr/cFDvcz2s2mhQlVd8a
         03M7irkOcqxcdKcexuRM/Ytmucw+xRXaUHOF8M4736wN6vjLoO98MSVQ9Stu4UxrAvCr
         nWMLQlwdPTVKMtCRsHBN8z834fnxNWCsLqJU/lX31ZTv+UmciXehlNbIpT8Ak6pbMcqM
         oUJ16XdMTv02RNs9+KJYebX5eoUCmJATDJM3ztqbdLJWOgIdNiMvx1yYe/YW/73TYzfK
         vcys/JP0R1wFIuMyx2vtMrX+tZhFp6chNisTTPSD5KLPV8SdXPJFEzL8AhLaE7K8IpTz
         rgKw==
X-Gm-Message-State: AOJu0YymDFpCAaxkhca/dvU2eI4WTlk/rIIwl/sbe6l9dhq7+A4uVpIv
	rAq5/VR3t0hDD++jNmapaJk=
X-Google-Smtp-Source: AGHT+IF4yurNdEXNXLR59vun98D5vmMYOMZtup4CqnaDK2jPYQ3tIYnAM9ZbpJT3VejdIEBvS9x29A==
X-Received: by 2002:a05:6000:109:b0:320:9e2:b3a2 with SMTP id o9-20020a056000010900b0032009e2b3a2mr23669871wrx.33.1697194226107;
        Fri, 13 Oct 2023 03:50:26 -0700 (PDT)
Received: from lab-ubuntu ([41.90.69.21])
        by smtp.gmail.com with ESMTPSA id p4-20020a5d68c4000000b003232f167df5sm20520851wrw.108.2023.10.13.03.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 03:50:25 -0700 (PDT)
Date: Fri, 13 Oct 2023 13:50:23 +0300
From: Calvince Otieno <calvncce@gmail.com>
To: outreachy@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luke Koch <lu.ale.koch@gmail.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Simon Horman <horms@kernel.org>,
	Calvince Otieno <calvncce@gmail.com>, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] staging: wlan-ng: remove helper function
 prism2sta_inf_handover()
Message-ID: <ZSkg7y2Y2T3midXB@lab-ubuntu>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

prism2sta_inf_handover() function basically calls pr_debug() to print
a literal string. This can be done by the parent function directly.

Signed-off-by: Calvince Otieno <calvncce@gmail.com>
---
Patch version v2:
	- Replace pr_debug() utility function with the module specific netdev_dbg()

 drivers/staging/wlan-ng/prism2sta.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/staging/wlan-ng/prism2sta.c b/drivers/staging/wlan-ng/prism2sta.c
index caeceb89c9fa..cf07cf04e20c 100644
--- a/drivers/staging/wlan-ng/prism2sta.c
+++ b/drivers/staging/wlan-ng/prism2sta.c
@@ -1697,7 +1697,8 @@ void prism2sta_ev_info(struct wlandevice *wlandev,
 	/* Dispatch */
 	switch (inf->infotype) {
 	case HFA384x_IT_HANDOVERADDR:
-		pr_debug("received infoframe:HANDOVER (unhandled)\n");
+		netdev_dbg(wlandev->netdev,
+				"received infoframe:HANDOVER (unhandled)\n");
 		break;
 	case HFA384x_IT_COMMTALLIES:
 		prism2sta_inf_tallies(wlandev, inf);
-- 
Calvince Otieno
