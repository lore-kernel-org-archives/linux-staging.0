Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4E7B;
	Sat, 11 Mar 2023 14:26:26 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id bg16-20020a05600c3c9000b003eb34e21bdfso8042500wmb.0;
        Sat, 11 Mar 2023 06:26:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678544784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=me1EJEGXaS0DFRZHEAYC72z0W2KEACpXBRzTLuD/pqM=;
        b=bje2PGnirIumpFcmHIdEnssR5Ih4SfMCJX+snPXZ5XOcQ0J6ePcFUqOfwHbesaCJYd
         06bZW2BNtDBkzA1cXGaLFQB6t5Fc7Aj4IuknfnT562lQ3x3n0lIRpDUlGyFXtPOSJF+V
         V+8kpPFTKqDnQMFouOlzxVfHZFyXMJpMQei0Iz99bSU64wf0f0Fx9FDp1mWt8OPGMJyp
         4HNiyvYlvfQ2Sk87rqeXyFNSUup7mvbNStVx74gG1px536ilCm9ytfc/stxRZwxoVIuf
         64uBvSsQkhBTxgchaWaRMDpZ1ixD9tzUpuCfvcvXQTogcttF+XW1LgR/wwT/MUcoDqIZ
         yuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678544784;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=me1EJEGXaS0DFRZHEAYC72z0W2KEACpXBRzTLuD/pqM=;
        b=D8u6/ranSVTAuVXtAT9bda2C5KNxNVLB25pkV31b1mdJgJqXohxOykH22pyGzXFkUh
         nNZQfeXKzJlafAuuPpSdCNBF5XbeZgZM4yi8FCCemq8iqDKBYh4i/u8JCZYgeDErDEv4
         CWT79PCK67OH6Y2SBRsp385PNk2bUh017O6WK4LPD3q4vc5KTJSK9cUZ7iVmEmWxM6zl
         EO8A4dnIHALAdeKVs/jCsWT0b3mm6hCGfjQ6VwOrEaHUz3GVUD2E80AJDa9c+uwa0arH
         fZOOe7TcHuOdo3fL7WqdPqv1yubiJQssHJK1ZURZrMKh43q6MLvtNk637bAKyftjjvJ3
         g1ew==
X-Gm-Message-State: AO0yUKW5u62cyCSsFMWIlg7g/ccDvavVlU8W53aOHh1OmKte9j6F/76W
	UdMv2UY6pnrJEGOMc4gW0ZA=
X-Google-Smtp-Source: AK7set+Qh1IspVxGiRADjG20G93XsreuhL9Jl2qPNZj8A73Pq5+CfKKG+SMWT1Syv/ti3R41zOXDVQ==
X-Received: by 2002:a05:600c:35c4:b0:3e8:490b:e286 with SMTP id r4-20020a05600c35c400b003e8490be286mr5742615wmq.14.1678544784510;
        Sat, 11 Mar 2023 06:26:24 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id t17-20020a05600c451100b003dc434b39c7sm3644356wmo.0.2023.03.11.06.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 11 Mar 2023 06:26:24 -0800 (PST)
Date: Sat, 11 Mar 2023 17:26:20 +0300
From: Dan Carpenter <error27@gmail.com>
To: Menna Mahmoud <eng.mennamahmoud.mm@gmail.com>
Cc: Julia Lawall <julia.lawall@inria.fr>, outreachy@lists.linux.dev,
	vireshk@kernel.org, johan@kernel.org, elder@kernel.org,
	gregkh@linuxfoundation.org, greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: greybus: Fix Alignment with parenthesis
Message-ID: <5f574998-3141-467c-8b45-291acd6fba8c@kili.mountain>
References: <b6521b9a75a4088d621246b436c7ec5d35365690.1678462486.git.eng.mennamahmoud.mm@gmail.com>
 <alpine.DEB.2.22.394.2303110958250.2802@hadrien>
 <71211670-60f9-11f4-1ee7-f94d4d9df4fb@gmail.com>
 <alpine.DEB.2.22.394.2303111354490.2802@hadrien>
 <61dab579-f10b-5538-8b61-ebe73ae5b4f1@gmail.com>
 <27dfe880-35f7-cbc1-cf8b-7bbd7f1c7301@gmail.com>
 <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>
Precedence: bulk
X-Mailing-List: linux-staging@lists.linux.dev
List-Id: <linux-staging.lists.linux.dev>
List-Subscribe: <mailto:linux-staging+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:linux-staging+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e0d7928e-854e-4d10-a90f-db87a7d60569@kili.mountain>

On Sat, Mar 11, 2023 at 05:23:11PM +0300, Dan Carpenter wrote:
> People are giving you feedback to help you and not because they are
                                                                  ^^^
I meant "care" not "are".

> about that particular line of code.

regards,
dan carpenter

