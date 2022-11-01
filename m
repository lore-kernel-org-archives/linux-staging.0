Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F957E;
	Tue,  1 Nov 2022 11:13:54 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id j4so23159560lfk.0;
        Tue, 01 Nov 2022 04:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDB5ezW4+6sXLiqpzEKi5SRHMOOxuike7Ppi2PFiGsQ=;
        b=HsGMMStkyjYZ+5O9MMh5D/AnccE1466rSH/qC0v0W53hLoRFnibE0BCd+I3tuR7X9S
         JSsLJOgo8YtBtfpWQTb+hLB9fqlXWrmGqyt2/rWp1M5eAPjEs2WS51dKC2T/jTYOluJz
         iWg/Enz2DZ1JyawxGMoh1hbJtQCZ6z0mpjJm9k9p89DD1zVeK4y0KAqdLC5yyYpgKfVv
         b4bI5GJoYPvvAaBZgZt/hbzwjpoHf1WBTqE2abfHxLbgpEUrm+ilpmv/UIisQqolAHhs
         GeLEUJjjtg79vDXo5OEzLcoImoQbE9Qw8eSOJc9KH6AskZF+cLeqF2dAAkV+07YTXFLg
         HF+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDB5ezW4+6sXLiqpzEKi5SRHMOOxuike7Ppi2PFiGsQ=;
        b=XX36n0WHirV3rn8hvcJovI7ARPKSViiqA4oZigcNG66zGPsCD0ft5zi5pf9BgLHyIu
         QBh7mbhkqHQ72af6wRUzSvGY0jnR2bnpL1uz/hpz7v9Wa4lnq51+Zrf6ZDha8Sd4x39l
         Pf6wLXCDQztjh8VXLwkeLcsvKEeS1dkq132DcUJAxZIUPvKblkPeRejAwNaB1HQ9MsAx
         b/42QJBhDvE/ipIrS0vvA6vaaLObgiU2K9UQZ2Q0jxjY8Ax6EOhD0HhwlTF+OCdttA2U
         G/Z7Gflenb+C/Wn7fGQxZOTrjvQ4Svs/69mr8GxnMkVh0Ti6QZ+p3yO6k439VoBV5XbQ
         gHMA==
X-Gm-Message-State: ACrzQf1Xks5uL54k99+Zhk3l22hstxqr1m99mio5hHiT3dLthB0IHBEJ
	5iWyCnEsaQQ1mZAxUGZc+ng=
X-Google-Smtp-Source: AMsMyM5Nh/2vQN06PYkuQd40IPYt/6Zh1lnhaF7bQmhVDcO2gVKWTNaFx2sinpk6uH7JeKd/6A/IKQ==
X-Received: by 2002:a05:6512:12c8:b0:4a2:cc20:d51b with SMTP id p8-20020a05651212c800b004a2cc20d51bmr7433507lfg.474.1667301232849;
        Tue, 01 Nov 2022 04:13:52 -0700 (PDT)
Received: from elroy-temp-vm.gaiao0uenmiufjlowqgp5yxwdh.gvxx.internal.cloudapp.net ([20.240.130.248])
        by smtp.googlemail.com with ESMTPSA id e17-20020a05651236d100b0048af3c090f8sm1629472lfs.13.2022.11.01.04.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Nov 2022 04:13:52 -0700 (PDT)
From: Tanjuate Brunostar <tanjubrunostar0@gmail.com>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	outreachy@lists.linux.dev,
	Tanjuate Brunostar <tanjubrunostar0@gmail.com>
Subject: [PATCH 0/2] some checkpatch fixes in the file rxtx.c
Date: Tue,  1 Nov 2022 11:13:25 +0000
Message-Id: <cover.1667300134.git.tanjubrunostar0@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These fixes are focused on the function s_vFillRTSHead

Tanjuate Brunostar (2):
  change the function name s_vFillRTSHead
  Join some lines of code to avoid code lines ending in (

 drivers/staging/vt6655/rxtx.c | 48 ++++++++++++++++-------------------
 1 file changed, 22 insertions(+), 26 deletions(-)

-- 
2.34.1

